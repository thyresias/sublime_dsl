# encoding: utf-8

module SublimeDSL
module SublimeText

  class CommandSet

    def self.import(file)
      name = File.basename(file, File.extname(file))
      set = new(name)
      list = JSON[File.read(file, encoding: 'utf-8')]
      begin
        set.items.concat list.map { |h| Item.from_json(h) }
      rescue => ex
        Console.error "file: #{file}"
        raise ex
      end
      set
    end

    attr_reader :name, :items

    def initialize(name)
      @name = name
      @items = []
    end

    def to_dsl
      dsl = "commands #{name.to_source} do\n\n"
      items.each { |i| dsl << "  #{i.to_dsl}\n" }
      dsl << "\nend"
    end

    def export(dir)
      file = "#{dir}/#{name}.sublime-commands"
      File.open(file, 'wb:utf-8') { |f| f.write to_json }
    end

    def to_json
      "[\n" <<
        items.map { |i| JSON.generate(i.to_h) }.join(",\n").indent(2) <<
      "\n]"
    end


    class Item

      def self.from_json(json_hash)
        h = json_hash.dup
        cap = h.delete('caption') or raise Error, "no caption: #{json_hash.inspect}"
        cmd = h.delete('command') or raise Error, "no command: #{json_hash.inspect}"
        args = h.delete('args')
        h.empty? or warn "unkown keys ignored: #{h.inspect}"
        new(cap, Command.new(cmd, args))
      end

      attr_reader :caption, :command

      def initialize(caption, command)
        @caption = caption
        @command = command
      end

      def to_dsl
        "item #{caption.to_source}, #{command.to_dsl}"
      end

      def to_h
        { 'caption' => caption }.merge(command.to_h)
      end

    end


    class DSLReader < Tools::BlankSlate

      def initialize(file = nil)
        @command_sets = []
        @current_set = nil
        instance_eval File.read(file, encoding: 'utf-8'), file if file
      end

      def _command_sets
        @command_sets
      end

      def commands(name, &block)
        @current_set and raise Error, "'commands' blocks cannot be nested"
        @current_set = CommandSet.new(name)
        instance_eval(&block)
        @command_sets << @current_set
        @current_set = nil
      end

      def item(caption, cmd)
        @current_set or raise Error, "'item' is invalid outside of a 'commands' block"
        cmd.error and raise Error, "item '#{caption}': #{cmd.error}"
        @current_set.items << Item.new(caption, cmd)
      end

      def method_missing(sym, *args, &block)
        @current_set or raise Error, "'#{sym}' is invalid outside of a 'commands' block"
        Command.from_method_missing(sym, args)
      end

    end


  end

end
end
