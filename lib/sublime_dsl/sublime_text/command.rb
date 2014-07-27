# encoding: utf-8

module SublimeDSL
module SublimeText

  ##
  # A command.

  class Command

    def self.from_method_missing(sym, args)
      method = sublime_method(sym.to_s)
      last_word = method.split('_').last
      case args.length
      when 0
      when 1
        args = args.first.is_a?(Hash) ? args.first : { last_word => args.first }
      when 2
        args.last.is_a?(Hash) or
          return new(sym, args, "invalid arguments to #{method}: #{cmd.args.inspect}")
        args = { last_word => args.first }.merge(args.last)
      else
        return new(sym, args, "invalid arguments to #{method}: #{cmd.args.inspect}")
      end
      new(method, args)
    end

    def self.dsl_method(name)
      if ruby_keyword_hash[name]
        '_' << name
      elsif name.start_with?('$')
        '_dollar_' << name[1..-1]
      else
        name
      end
    end

    def self.sublime_method(name)
      return name unless name.start_with?('_')
      m = name[1..-1]
      if m.start_with?('dollar_')
        '$' << m[7..-1]
      elsif ruby_keyword_hash[m]
        m
      else
        name
      end
    end

    def self.ruby_keyword_hash
      @ruby_keyword_hash ||= Hash[
        %w(
          alias and BEGIN begin break case class def defined? do
          else elsif END end ensure false for if in module
          next nil not or redo rescue retry return self super
          then true undef unless until when while yield
        ).map { |w| [w, true] }
      ]
    end

    attr_reader :name, :args, :error

    def initialize(name, args, error = nil)
      @name = name
      @args =
        if error
          args
        else
          args ? args.to_a.map { |n,v| Argument.new(n,v) } : []
        end
      @error = error
    end

    def to_h(command_key = 'command', args_key = 'args')
      if args.empty?
        { command_key => name }
      else
        args_hash = {}
        args.each { |a| args_hash[a.name] = a.value }
        { command_key => name, args_key => args_hash }
      end
    end

    def to_dsl(statement_style = false)
      method = Command.dsl_method(name)
      return method if args.empty?
      last = name.split('_').last
      if last == args.first.name
        arg_list = args.first.to_s(false)
        arg_list << ', ' << args[1..-1].map(&:to_s).join(', ') if args.length > 1
      else
        arg_list = args.map(&:to_s).join(', ')
      end
      statement_style ? "#{method} #{arg_list}" : "#{method}(#{arg_list})"
    end

    alias to_s to_dsl

    include Tools::ValueEquality

    ##
    # A command argument.

    class Argument

      attr_reader :name, :value

      def initialize(name, value)
        @name = name
        @value = value
      end

      def to_s(hash_style = true)
        if hash_style
          "#{name}: #{display(value)}"
        else
          display(value)
        end
      end

      include Tools::ValueEquality

    private

      def display(v)
        case v
        when String
          v.inspect
        when TrueClass, FalseClass, Numeric
          v.to_s
        when Array
          display_array(v)
        when Hash
          v.inspect
        when NilClass
          'nil'
        else
          raise Error, "command argument #{name.inspect} value: #{v.inspect}"
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

  end

end
end
