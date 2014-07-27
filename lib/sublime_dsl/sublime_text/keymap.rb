# encoding: utf-8

require_relative 'keymap/dsl_reader'

module SublimeDSL
module SublimeText

  class KeyMap

    def self.import(file)
      name = File.basename(file, File.extname(file))
      kb = Keyboard.sublime
      map = new(name, kb)
      list = JSON[File.read(file, encoding: 'utf-8')]
      begin
        map.bindings.concat list.map { |h| KeyBinding.from_json(h) }
      rescue => ex
        Console.error "file: #{file}"
        raise ex
      end
      map
    end

    attr_reader :name, :os, :keyboard, :bindings

    def initialize(name, keyboard)
      @name = name
      if name =~ /\((Windows|OSX|Linux)\)/
        @os = $1
      else
        @os = nil
      end

      @keyboard = keyboard
      @bindings = []
    end

    alias to_s name

    def for_keyboard(other_keyboard)
      return self if keyboard == other_keyboard
      # do not convert if the OS do not match
      return self if os && other_keyboard.os && os != other_keyboard.os
      KeyMap.new(name, other_keyboard).tap do |map|
        bindings.each do |b|
          map.bindings << b.for_keyboard(other_keyboard)
        end
      end
    end

    def write(dir)
      update_fixmes
      file = "#{dir}/#{name}.keymap.rb"
      File.open(file, 'wb:utf-8') do |f|
        f.puts "\nkeymap #{name.to_source} do"
        f.puts
        f.puts "  keyboard #{keyboard.name.to_source}" unless keyboard == Keyboard.sublime
        f.puts "  conditionals if: 'si', and: 'et', or: 'ou'"
        f.puts
        bindings.each do |b|
          begin
            f.puts '  ' << b.to_dsl.gsub("\n", "\n  ")
          rescue => ex
            Console.error "file: #{file}\nbinding: #{b.keystrokes}"
            raise ex
          end
        end
        f.puts "\nend"
      end
    end

    def export(dir)
      file = "#{dir}/#{name}.sublime-keymap"
      File.open(file, 'wb:utf-8') { |f| f.write to_json }
    end

    def to_json
      st_bindings = for_keyboard(Keyboard.sublime).bindings
      "[\n" <<
        st_bindings.map { |b| b.to_json }.join(",\n") <<
      "\n]"
    end

    def update_fixmes
      by_keystrokes_and_context = bindings.group_by { |b| [b.keystrokes, b.context] }
      by_keystrokes_and_context.each_value do |binding_list|
        next if binding_list.length == 1
        binding_list.each do |b|
          b.fixmes << "assigned #{binding_list.length} times in this keymap"
        end
      end
    end

    ##
    # A key binding: one or more keystrokes, a command and an optional context

    class KeyBinding

      def self.from_json(json_hash)
        h = json_hash.dup
        keystroke_specs = h.delete('keys') or raise Error, 'no keys: ' << json_hash.inspect
        keystrokes = keystroke_specs.map { |s| Keyboard.sublime.ensure_keystroke(s) }
        cmd = h.delete('command')  or raise Error, 'no command: ' << json_hash.inspect
        command = Command.new(cmd, h.delete('args'))
        context_hash = h.delete('context')
        context = context_hash && Context.from_json(context_hash)
        h.empty? or raise Error, 'unexpected JSON keys: ' << h.inspect
        new(keystrokes, command, context)
      rescue => ex
        warn "error with binding #{json_hash.inspect}"
        warn ex.message
        raise
      end

      attr_reader :keystrokes, :command, :context
      attr_reader :fixmes
      attr_accessor :source_file

      def initialize(keystrokes, command, context = nil)
        @keystrokes = keystrokes
        @command = command
        @context = context
        @fixmes = []
      end

      def add_condition(args)
        @context ||= Context.new
        @context.conditions << Context::Condition.from_dsl(args)
      end

      def for_keyboard(other_keyboard)
        if other_keyboard == Keyboard.sublime
          # the current binding is for a custom keyboard:
          # get the corresponding ST keystrokes
          other_keystrokes = keystrokes.map do |ks|
            spec = ks.key_event || ks.chr_event
            spec or raise Error, "#{ks} has no SublimeText equivalent"
            other_keyboard.ensure_keystroke(spec)
          end
        else
          # the current binding is for the sublime text keyboard:
          # its keystrokes may not exist in the target keyboard
          other_keystrokes = keystrokes.map do |ks|
            other_keyboard.keystroke_for_sublime_spec(ks.to_spec)
          end
        end
        KeyBinding.new(other_keystrokes, command, context)
      end

      def to_dsl

        comments = fixmes.map { |f| "# FIXME: #{f}\n" }.join
        valid = true
        keystrokes.each do |ks|
          if ks.type == :null
            comments << "# FIXME: no equivalent for keystroke: #{ks.key_event}\n"
            valid = false
            next
          end
          next if ks.type == :char || ks.to_spec.length == 1
          if ks.os_action
            comments << "# FIXME: #{ks} is OS-reserved (#{ks.os_action})\n"
          end
          if ks.key_event.nil?
            comments << "# FIXME: #{ks} is not seen by Sublime Text\n"
          elsif ks.chr_event
            comments << "# FIXME: #{ks} also generates the character #{ks.chr_event.to_source}\n"
          end
        end
        spec = keystrokes.map { |ks| ks.to_spec || ks.key_event }.join(', ')
        dsl = "bind #{spec.to_source}, #{command.to_dsl}\n"
        dsl << context.to_dsl.indent(2) << "\n" if context
        dsl.gsub!(/^/, '# ') unless valid
        (comments << dsl).strip
      end

      def to_json
        h = { 'keys' => keystrokes.map { |ks| ks.to_spec } }
        h.merge! command.to_h
        json = '  ' << JSON.generate(h)
        return json unless context
        json = json[0..-2] << %(, "context": [\n    )
        json << context.conditions.map(&:to_json).join(",\n    ")
        json << "\n  ]}"
        json
      end

      alias to_s to_dsl

      include Tools::ValueEquality

      def value_id
        [keystrokes, command, context]
      end

    end

    ##
    # A key binding context = a series of conditions.


    class Context

      def self.from_json(array)
        new array.map { |h| Condition.new(h['key'], h['operator'], h['operand'], h['match_all']) }
      end

      attr_reader :conditions

      def initialize(conditions = [])
        @conditions = conditions
      end

      def to_s
        conditions.map(&:to_s).join(' && ')
      end

      def to_dsl
        dsl = []
        method = 'si'
        conditions.each do |c|
          c.fixmes.each { |f| dsl << f }
          dsl << "#{method} #{c.to_dsl}"
          method = 'et'
        end
        dsl.join("\n")
      end

      include Tools::ValueEquality
      alias value_id conditions

      ##
      # A condition. There are 3 types of conditions:
      # * <i>left_operand operator right_operand</i>
      # * <i>left_operand right_operand</i>
      # * <i>left_operand</i>

      class Condition

        # Returns a new condition from an array of captures.
        def self.from_dsl(args)
          passed = args.dup
          match_all = args.first == :all
          if match_all
            args.shift
            args.empty? and raise Error, "'all' is not a valid condition"
          else
            args.empty? and raise Error, "condition missing"
          end
          left = args.shift.to_s
          if left == 'setting' && !args.empty?
            left = 'setting.' << args.shift.to_s
          end
          case args.length
          when 0
            op = nil
            right = nil
          when 2
            case args.first
            when :'=='
              if args.last.is_a?(Symbol)
                op = nil
                args[-1] = args.last.to_s
              else
                op = 'equal'
              end
            when :'!='
              op = 'not_equal'
            when :is
              op = nil
            when :'=~'
              op = 'regex_contains'
            when :'!~'
              op = 'not_regex_contains'
            when :regex_match, :not_regex_match
              op = args.first
            else
              raise Error, "invalid operator: #{args.first.inspect}"
            end
            right = args.last
            right = right.source if right.is_a?(Regexp)
          else
            raise Error, "expected [all.]<setting> [operator] [value]: #{passed.map(&:to_s).join(' ')}"
          end
          new(left, op, right, match_all)
        end

        attr_reader :left, :operator, :right, :match_all

        def initialize(left, operator, right, match_all)
          @left = left
          @operator = operator && operator.to_sym
          if operator && operator =~ /regex/
            @right = Tools::RegexpWannabe.new(right)
          else
            @right = right
          end
          @match_all = match_all ? true : nil   # normalize match_all
        end

        def fixmes
          right && right.is_a?(Tools::RegexpWannabe) ? right.fixmes : []
        end

        # DSL for the condition. The 3 types are rendered as:
        #
        # [<i>left operator right</i>]
        #   Same condition, with _operator_ mapped to its ruby equivalent:
        #   <tt>equal</tt>::               <tt>==</tt>
        #   <tt>not_equal</tt>::           <tt>!=</tt>
        #   <tt>regex_contains</tt>::      <tt>=~</tt>
        #   <tt>not_regex_contains</tt>::  <tt>!~</tt>
        #   <tt>regex_match</tt>::         <tt>.regex_match</tt> + comment
        #   <tt>not_regex_match</tt>::     <tt>.not_regex_match</tt> + comment
        #   The comment is 'could use =~ with \A and \z'
        #
        # [<i>left right</i>]
        #   * if _right_ is a String: <tt>left == :right</tt>
        #   * otherwise: <tt>left is right</tt>
        #
        # [_left_]
        #   _left_
        #
        # If #match_all is +true+, _left_ is prefixed by "<tt>all.</tt>".

        def to_dsl
          ( match_all ? 'all.' : '' ) <<
          left << (
            case operator
            when nil
              if right.nil?
                ''
              elsif right.is_a?(String)
                ' == ' + right.to_sym.inspect
              else
                ' is ' << right.inspect
              end
            when :equal
              ' == ' << right.inspect
            when :not_equal
              ' != ' << right.inspect
            when :regex_contains
              ' =~ ' << right.inspect
            when :not_regex_contains
              ' !~ ' << right.inspect
            when :regex_match
              ' .regex_match ' << right.inspect(true) << ' # could use =~ with \A and \z'
            when :not_regex_match
              ' .not_regex_match ' << right.inspect(true) << ' # could use !~ with \A and \z'
            else
              raise Error, "unknown operator: #{operator.inspect} #{right.to_s}"
            end
          )
        end

        def to_h
          h = { 'key' => left }
          h['operator'] = operator if operator
          unless right.nil?
            h['operand'] = right.is_a?(Tools::RegexpWannabe) ? right.to_s(true) : right
          end
          h['match_all'] = match_all if match_all
          h
        end

        def to_json
          JSON.generate(to_h)
        end

        alias to_s to_dsl

        include Tools::ValueEquality

        def value_id
          to_h
        end

      end

    end

  end

end
end
