# encoding: utf-8

module SublimeDSL

  ##
  # A Command Line Interpreter.
  #
  # Exit codes:
  # * 0: command successful
  # * 1: command did nothing
  # * 2: something went wrong

  class CLI

    class << self

      # Returns a Hash { command_name => command_class }.
      def cmd_class_hash
        @cmd_class_hash ||= load_commands
      end

      def load_commands
        h = {}
        Dir.chdir File.dirname(__FILE__) do
          Dir["cli/*.rb"].each do |f|
            require_relative f.sub(/\.rb$/, '')
            c = File.basename(f, '.rb')
            h[c] = CLI.const_get(c.pascal_case)
          end
        end
        h
      end

    end

    attr_reader :name

    def initialize(name)
      @name = name
    end

    def run

      # honor help & version
      while ARGV.first && ARGV.first.start_with?('-')
        option = ARGV.shift
        case option
        when '-h', '--help'
          puts help
          exit 1
        when '-v', '--version'
          puts version
          exit 1
        else
          Console.error "invalid option: #{option.inspect}"
          exit 2
        end
      end

      cmd_name = ARGV.shift

      # if no argument, print help & exit
      unless cmd_name
        puts help
        exit 2
      end

      if cmd_name == 'help'
        if ARGV.empty?
          puts help
        else
          arg = ARGV.shift
          if arg == 'commands'
            puts "Available commands:"
            CLI.cmd_class_hash.each do |name, klass|
              puts "  %-10s %s" % [name, klass.summary]
            end
          else
            puts command(arg).help
          end
        end
        exit 1
      end

      command(cmd_name).run
    end

    def command(name)
      cmd_class = CLI.cmd_class_hash[name]
      unless cmd_class
        Console.error "invalid command #{name.inspect}\n" \
          "valid commands: #{CLI.cmd_class_hash.keys.join(', ')}"
        exit 2
      end

      cmd_class.new(self)
    end

    def help
      <<-HELP.dedent
      Sublime DSL allows defining Sublime Text packages using a Ruby DSL.

        Usage:
          #{name} -h/--help
          #{name} -v/--version
          #{name} <command> [arguments...] [options...]

        Examples:
          #{name} import Ruby
          #{name} export Ruby --cleanup

        Available commands:
          import          import to DSL
          export          export from DSL
          help <command>  show help on <command>
      HELP
    end

    def version
      "SublimeDSL #{SublimeDSL::VERSION}"
    end

  end

end
