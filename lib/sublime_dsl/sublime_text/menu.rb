# encoding: utf-8

module SublimeDSL
module SublimeText

  class Menu

    def self.import(file)
      name = File.basename(file, File.extname(file))
      set = new(name)
      list = JSON[File.read(file, encoding: 'utf-8')]
      set.items.concat list.map { |h| Item.from_json(h) }

      set
    end

    attr_reader :name, :items

    def initialize(name)
      @name = name
      @items = []
    end

    def to_dsl
      dsl = "menu #{name.to_source} do\n\n"
      items.each { |i| dsl << "#{i.to_dsl}\n" }
      dsl << "\nend"
    end

    def write(dir)
      file = "#{dir}/#{name}.menu.rb"
      File.open(file, 'wb:utf-8') do |f|
        f.puts '# encoding: utf-8'
        f.puts "\n#{to_dsl}"
      end
    end

    def export(dir)
      file = "#{dir}/#{name}.sublime-menu"
      File.open(file, 'wb:utf-8') { |f| f.write to_json }
    end

    def to_json
      "[\n" <<
        items.map { |i| i.to_json('  ') }.join(",\n") <<
      "\n]"
    end


    class Item

      def self.from_json(json_hash)
        h = json_hash.dup
        item = Item.new.tap do |i|
          i.caption = h.delete('caption')
          i.mnemonic = h.delete('mnemonic')
          cmd = h.delete('command')
          args = h.delete('args')
          i.command = Command.new(cmd, args) if cmd
          i.id = h.delete('id')
          i.checkbox = h.delete('checkbox')
          i.platform = h.delete('platform')
        end
        children = h.delete('children') || []
        children.each do |c|
          item.items << Item.from_json(c)
        end
        h.empty? or warn "unkown keys ignored: #{h.inspect}"

        item
      end

      attr_accessor :command, :caption, :mnemonic, :id, :checkbox, :platform
      attr_reader :items

      def initialize()
        @command = nil
        @caption = nil
        @mnemonic = nil
        @id = nil
        @checkbox = nil
        @platform = nil
        @items = []
      end

      def to_dsl(indent = '  ')
        args = ''
        options = []

        if caption
          cap = caption.gsub('&', '&&')
          if mnemonic
            if cap =~ /^(.*?)(#{mnemonic})(.*)$/i
              args << "#{$1}&#{$2}#{$3}".to_source
            else
              args << cap.to_source
              options << "mnemonic: #{mnemonic.to_source}"
            end
          else
            args << cap.to_source
          end
        end

        if command
          args << ', ' unless args.empty?
          args << command.to_dsl
          options << "mnemonic: #{mnemonic.to_source}" if caption.nil? && mnemonic
        end

        options << "id: #{id.to_source}" if id
        options << "checkbox: true" if checkbox
        options << "platform: #{platform.to_source}" if platform

        dsl = "#{indent}item #{args}"
        unless options.empty?
          dsl << ', ' unless args.empty?
          dsl << options.join(', ')
        end

        unless items.empty?
          i = indent + '  '
          dsl << " do\n"
          items.each do |c|
            dsl << c.to_dsl(i) << "\n"
          end
          dsl << "#{indent}end"
        end

        dsl
      end

      def to_h(include_items = true)
        h = {}
        h['caption'] = caption if caption
        h['mnemonic'] = mnemonic if mnemonic
        h.merge! command.to_h if command
        h['id'] = id if id
        h['checkbox'] = checkbox if checkbox
        h['platform'] = platform if platform
        h['children'] = items.map(&:to_h) if include_items && !items.empty?
        h
      end

      def to_json(indent)
        return indent + JSON.generate(to_h) if items.empty?
        json = indent + JSON.pretty_generate(to_h(false))
        json = json[0..-3] # remove trailing "\n}"
        json.gsub!("\n", "\n#{indent}")
        json << %(,\n#{indent}  "children": [\n)
        ind = indent + '    '
        json << items.map { |i| i.to_json(ind) }.join(",\n")
        json << "\n#{indent}  ]\n#{indent}}"
      end

    end


    class DSLReader < Tools::BlankSlate

      def initialize(file = nil)
        @menus = []
        @item_stack = []
        instance_eval File.read(file, encoding: 'utf-8'), file if file
      end

      def _menus
        @menus
      end

      def menu(name, &block)
        @item_stack.empty? or raise Error, "menu blocks cannot be nested"
        @item_stack.push Menu.new(name)
        instance_eval(&block)
        @menus << @item_stack.pop
      end

      def item(*args, &block)
        @item_stack.empty? and raise Error, "'item' is invalid outside of a menu block"
        item = new_item(args)
        @item_stack.last.items << item
        return unless block
        @item_stack.push item
        instance_eval(&block)
        @item_stack.pop
      end

      def method_missing(sym, *args, &block)
        @item_stack.empty? and raise Error, "'#{sym}' is invalid outside of a menu block"
        Command.from_method_missing(sym, args)
      end

      def new_item(args)
        args.empty? and raise Error, "no argument for 'item'"
        item = Item.new

        # get the caption if any
        if args.first.is_a?(String)
          caption = args.shift
          caption =~ /&([^& ])/ and item.mnemonic = $1.upcase
          item.caption = caption.gsub(/&(.)/, '\1')
          return item if args.empty?
        end

        # get the command if any
        cmd = args.first
        if cmd.is_a?(Command)
          cmd.error and raise Error, "item '#{caption}': #{cmd.error}"
          item.command = cmd
          args.shift
          return item if args.empty?
        end

        # options
        options = args.first
        args.length == 1 && options.is_a?(Hash) or
          raise Error, "invalid arguments for 'item': #{args.inspect}"

        item.id = options.delete(:id)
        item.checkbox = options.delete(:checkbox)
        item.platform = options.delete(:platform)
        mnemonic = options.delete(:mnemonic)
        if mnemonic
          item.mnemonic && mnemonic != item.mnemonic and
            warn "item '#{caption}': mnemonic #{item.mnemonic} overwritten by #{mnemonic}"
          item.mnemonic = mnemonic
        end

        item
      end

    end


  end

end
end
