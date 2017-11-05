# encoding: utf-8

module SublimeDSL
module TextMate

  ##
  # A named set of preferences.

  class Preference

    def self.import(file)
      root = PList.import(file)
      pref = new.tap do |p|
        p.name = root.delete('name')
        p.scope = root.delete('scope')
        p.settings = root.delete('settings')
        p.uuid = root.delete('uuid')
        p.bundle_uuid = root.delete('bundleUUID')
      end
      root.empty? or raise Error, "unexpected keys: #{root.keys.inspect}"
      base = File.basename(file, File.extname(file))
      pref.name ||= base
      pref.basename = base
      pref.settings.each_pair do |key, value|
        case key
        when /showInSymbolList|disableDefaultCompletion|spellChecking/
          pref.settings[key] = value.to_s == '1'
        when /completion(s|Command)/i
          # leave as is
        when /pattern|completion|folding(Start|Stop)Marker|foldingIndentedBlock(Start|Ignore)/i
          pref.settings[key] = Tools::RegexpWannabe.new(value)
        when /symbolTransformation|completionCommand/
          pref.settings[key] = value.strip.lines.map(&:strip).join("\n")
        end
      end

      pref
    end

    include CustomBaseName

    attr_accessor :name
    attr_accessor :scope
    attr_accessor :settings
    attr_accessor :uuid
    attr_accessor :bundle_uuid

    def initialize
      @settings = {}
    end

    alias to_s name

    def to_dsl
      out = StringIO.new('', 'wb:utf-8')
      out.puts "# FIXME: no scope" unless scope
      args = "#{name.to_source} => #{scope ? scope.to_source : 'nil'}"
      args << dsl_file_arg
      out.puts "preferences #{args} do"
      settings.each_pair do |key, value|
        if value.is_a?(Array)
          case key
          when 'completions'
            out.puts '  completions %w('
            out.puts "#{value.join(' ').wrap.indent(4)}"
            out.puts '  )'
          when 'shellVariables'
            value.each do |h|
              out.puts "  shell_variable #{h['name'].inspect_sq}, #{h['value'].inspect_sq}"
            end
          when 'smartTypingPairs', 'highlightPairs'
            output_pairs key, value, out
          else
            raise Error, "unexpected Array setting: #{key}"
          end
        elsif value.is_a?(Hash)
          key == 'indentedSoftWrap' or raise Error, "unexpected Hash setting: #{key}"
          value.keys.sort == %w(format match) or
            raise Error, "unexpected argument for indentedSoftWrap: #{value.inspect}"
          m = Tools::RegexpWannabe.new(value['match'])
          out.print m.fixme_comments
          out.puts '  indented_soft_wrap match: ' << m.inspect << ', format: ' << value['format'].to_source
        elsif value.is_a?(Tools::RegexpWannabe)
          out.print value.fixme_comments
          out.puts '  ' << key.snake_case << ' ' << value.inspect(true)
        elsif key == 'comment'
          value.each_line { |l| out.puts '  # ' + l.rstrip }
        elsif key =~ /symbolTransformation|completionCommand/ && value.include?("\n")
          out.puts '  ' << key.snake_case << " <<-'TXT'\n#{value.indent(4)}\n  TXT"
        else
          out.puts '  ' << key.snake_case << ' ' << (value.is_a?(String) ? value.to_source(true) : value.inspect)
        end
      end
      out.puts "  uuid #{uuid.inspect_dq}" if uuid
      out.puts "  bundle_uuid #{bundle_uuid.inspect_dq}" if bundle_uuid
      out.puts 'end'
      out.string
    end

    def export(dir)
      file = "#{dir}/#{basename}.tmPreferences"
      PListWriter.new(self).export(file)
    end

    def output_pairs(name, array, out)
      simple, complex = array.partition { |o,c| o.length == 1 && c.length == 1 }
      unless simple.empty? && !complex.empty?
        simple = simple.map { |o,c| o+c }.join(' ')
        out.puts "  #{name.snake_case} #{simple.inspect_dq}"
      end
      return if complex.empty?
      name = name[0..-2]  # remove the 's'
      complex.each do |o,c|
        o =~ %r'^/(.+)/$' or
          raise Error, "unexpected value for a #{name}: #{o.inspect}"
        o = Tools::RegexpWannabe.new($1)
        c =~ %r'^/(.+)/$' or
          raise Error, "unexpected value for a #{name}: #{c.inspect}"
        c = Tools::RegexpWannabe.new($1)
        out.print o.fixme_comments
        out.print c.fixme_comments
        out.puts "  #{name.snake_case} #{o.inspect(true)}, #{c.inspect}"
      end
    end


    class DSLReader

      def initialize(file = nil)
        @preferences = []
        @current_pref = nil
        instance_eval File.read(file, encoding: 'utf-8'), file if file
      end

      def _preferences
        @preferences
      end

      def method_missing(sym, *args, &block)
        if @current_pref
          store_setting sym.to_s, args
        else
          raise Error, "'#{sym}': only 'preferences' blocks are allowed"
        end
      end

      def preferences(options = {}, &block)
        @current_pref and raise Error, "preferences blocks cannot be nested"
        file = options.delete(:file)
        options.length == 0 and raise Error, 'missing name & scope'
        name = options.keys.first
        scope = options.delete(name)
        options.length == 0 or
          warn "extraneous 'preferences' arguments ignored: #{options.inspect}"
        @current_pref = Preference.new.tap do |p|
          p.name = name
          p.scope = scope
          p.basename = file
        end
        instance_eval(&block)
        @preferences << @current_pref
        @current_pref = nil
      end

      def shell_variable(name, value)
        ensure_context __method__
        array = @current_pref.settings['shellVariables'] ||= []
        array << { name: name, value: value }
      end

      def smart_typing_pairs(string)
        ensure_context __method__
        store_pairs 'smartTypingPairs', string
      end

      def highlight_pairs(string)
        ensure_context __method__
        store_pairs 'highlightPairs', string
      end

      def smart_typing_pair(open, close)
        ensure_context __method__
        store_pair 'smartTypingPairs', open, close
      end

      def highlight_pair(open, close)
        ensure_context __method__
        store_pair 'highlightPairs', open, close
      end

      def indented_soft_wrap(options = {})
        ensure_context __method__
        match = options.delete(:match)
        format = options.delete(:format)
        match && format or raise Error, "#{__method__} requires 'match' and 'format'"
        options.empty? or warn "#{__method__} options ignored: #{options.inspect}"
        @current_pref.settings['indentedSoftWrap'] =
          { match: _re(match.source), format: format }
      end

    private

      def store_pairs(property, string)
        array = @current_pref.settings[property] ||= []
        string.split(/\s+/).each do |pair|
          pair.length == 2 or raise Error, "invalid pair '#{pair}': only 2 characters allowed"
          array << pair.split(//)
        end
      end

      def store_pair(property, open, close)
        array = @current_pref.settings[property] ||= []
        array << [_re(open.source), _re(close.source)]
      end

      def store_setting(name, args)
        case name
        when 'uuid', 'bundle_uuid'
          @current_pref.send "#{name}=", args.first
        else
          prop = name.camel_case
          arg = args.first
          if prop =~ /symbolTransformation|completionCommand/
            arg = arg.lines.map(&:strip).join("\n")
          else
            arg = _re(arg.source) if arg.is_a?(Regexp)
          end
          @current_pref.settings[prop] = arg
        end
        # raise Error, "'#{name}' is not a valid preference"
      end

      def ensure_context(name)
        @current_pref or raise Error, "#{name} is invalid outside a 'preferences' block"
      end

      def _re(s)
        Tools::RegexpWannabe.new(s)
      end

    end


    class PListWriter

      attr_reader :preference
      attr_reader :root

      def initialize(preference)
        @preference = preference
        @root = {}
        convert
      end

      def export(file)
        PList.export(root, file)
      end

    private

      def convert
        root['name'] = preference.name
        root['scope'] = preference.scope if preference.scope
        root['uuid'] = preference.uuid if preference.uuid
        root['bundleUUID'] = preference.bundle_uuid if preference.bundle_uuid
        root['settings'] = convert_hash(preference.settings)
      end

      def convert_object(object)
        case object
        when Array then convert_array object
        when Hash then convert_hash object
        when Tools::RegexpWannabe then object.to_s
        # TODO: booleans as 1/0 or true/false?
        when TrueClass then 1
        when FalseClass then 0
        else object  # String, Integer, NilClass
        end
      end

      def convert_array(list)
        list.map { |o| convert_object o }
      end

      def convert_hash(h)
        out = {}
        h.each_pair { |k,v| out[k] = convert_object(v) }
        out
      end

    end

  end

end
end
