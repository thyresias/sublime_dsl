# encoding: utf-8

module SublimeDSL
module SublimeText

  class SettingSet

    def self.import(file)
      name = File.basename(file, File.extname(file))
      set = new(name)
      json = File.read(file, encoding: 'utf-8')
      h = json.empty? ? {} : JSON[json]
      begin
        h.each_pair { |key, value| set.settings << Setting.new(key, value) }
      rescue => ex
        puts "file: #{file}"
        raise ex
      end

      set
    end

    attr_reader :name, :settings

    def initialize(name)
      @name = name
      @settings = []
    end

    def to_dsl
      dsl = "settings #{name.to_source} do\n"
      dsl << "\n" unless settings.empty?
      settings.each { |s| dsl << "  #{s.to_dsl}\n" }
      dsl << "\nend"
    end

    def export(dir)
      file = "#{dir}/#{name}.sublime-settings"
      File.open(file, 'wb:utf-8') { |f| f.write to_json }
    end

    def to_json
      h = Hash[settings.map { |s| [s.key, s.value] }]
      JSON.pretty_generate(h)
    end

    class Setting

      attr_reader :key, :value

      def initialize(key, value)
        @key = key
        @value = value
      end

      def to_dsl
        "#{key} #{display(value)}"
      end

    private

      def display(v)
        case v
        when String
          v.to_source
        when TrueClass, FalseClass, Numeric
          v.to_s
        when Array
          display_array(v)
        when Hash
          v.empty? ? 'Hash.new' : v.inspect[1..-2] # remove braces
        when NilClass
          'nil'
        else
          raise Error, "value: #{v.inspect} for #{name.inspect}"
        end
      end

      def display_array(a)
        if a.empty?
          '[]'
        elsif a.all? { |e| e.is_a?(String) && e =~ /\A(\S+)\z/ }
          "%w(#{a.join(' ')})"
        else
          a.inspect
        end
      end

    end

    class DSLReader < Tools::BlankSlate

      def initialize(file = nil)
        @setting_sets = []
        @current_set = nil
        instance_eval File.read(file, encoding: 'utf-8'), file if file
      end

      def _setting_sets
        @setting_sets
      end

      def method_missing(sym, *args, &block)
        @current_set or raise Error, "'#{sym}' is invalid outside of a 'settings' block"
        args.empty? and raise Error, "no value for setting '#{sym}'"
        args.length > 1 and raise Error, "more than one value for setting '#{sym}'"
        @current_set.settings << Setting.new(sym.to_s, args.first)
      end

      def settings(name, &block)
        @current_set and raise Error, "'settings' blocks cannot be nested"
        @current_set = SettingSet.new(name)
        instance_eval(&block)
        @setting_sets << @current_set
        @current_set = nil
      end

    end

  end

end
end
