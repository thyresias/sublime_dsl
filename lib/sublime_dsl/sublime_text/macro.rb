# encoding: utf-8

module SublimeDSL
module SublimeText
  class Macro

    def self.import(file)
      # Delete to Hard EOL.sublime-macro:
      # [
      #     {"command": "move_to", "args": {"to": "hardeol", "extend": true}},
      #     {"command": "add_to_kill_ring", "args": {"forward": true}},
      #     {"command": "right_delete"}
      # ]
      macro = new(File.basename(file, '.sublime-macro'))
      JSON[File.read(file, encoding: 'utf-8')].each do |command_hash|
        cmd = command_hash.delete('command')
        cmd or raise Error, "no 'command' key in '#{file}'"
        args = command_hash.delete('args')
        command_hash.empty? or raise Error, 'unknown sublime-macro keys: ' << command_hash.inspect
        macro.commands << Command.new(cmd, args)
      end

      macro
    end

    attr_reader :name
    attr_reader :commands

    def initialize(name)
      @name = name
      @commands = []
    end

    alias to_s name

    def to_dsl
      # macro 'Delete to Hard EOL' do
      #   move_to "hardeol", extend: true
      #   add_to_kill_ring forward: true
      #   right_delete
      # end
      dsl = "macro #{name.inspect} do\n"
      commands.each { |c| dsl << "  #{c.to_dsl(true)}\n" }
      dsl << "end"
    end

    def export(dir)
      file = "#{dir}/#{name}.sublime-macro"
      File.open(file, 'wb:utf-8') { |f| f.write to_json }
    end

    def to_json
      # JSON.pretty_generate(commands.map(&:to_h))
      "[\n" <<
        commands.map { |c| JSON.generate(c.to_h) }.join(",\n").indent(2) <<
      "\n]"
    end

    class DSLReader

      def initialize(file = nil)
        @macros = []
        @current_macro = nil
        instance_eval File.read(file, encoding: 'utf-8'), file if file
      end

      def _macros
        @macros
      end

      def method_missing(sym, *args, &block)
        @current_macro or raise Error, "'#{sym}' is invalid outside of a 'macro' block"
        cmd = Command.from_method_missing(sym, args)
        cmd.error and
          raise Error, "macro '#{@current_macro}': #{cmd.error}"
        @current_macro.commands << cmd
      end

      def macro(name, &block)
        @current_macro and raise Error, 'macro blocks cannot be nested'
        @current_macro = Macro.new(name)
        instance_eval(&block)
        @macros << @current_macro
        @current_macro = nil
      end

    end

  end
end
end
