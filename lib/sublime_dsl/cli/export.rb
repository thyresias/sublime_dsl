module SublimeDSL
class CLI

  class Export

    def self.summary
      "convert a set of DSL source files to a Sublime Text package"
    end

    attr_reader :main_cmd
    attr_reader :reader, :exporter

    def initialize(main_cmd)
      @main_cmd = main_cmd
    end

    def run
      parse_options
      package = reader.package
      exit 1 unless package
      exporter.export package
      exit
    rescue OptionError => ex
      Console.error ex.message
      Console.error %(type "#{main_cmd.name} help export" for more information)
      exit 2
    end

    def error(msg)
      raise OptionError, msg
    end

    def parse_options
      package_name = ARGV.shift
      error 'missing package name' unless package_name
      @reader = SublimeText::Package::Reader.new(package_name)
      @exporter = SublimeText::Package::Exporter.new
      while (option = ARGV.shift)
        case option
        when '-s', '--source'
          path = ARGV.shift
          path or error "#{option}: missing path"
          reader.root = path
        when '-i', '--include'
          pattern = ARGV.shift
          pattern or error "#{option}: missing pattern"
          reader.include = pattern
        when '-e', '--exclude'
          pattern = ARGV.shift
          pattern or error "#{option}: missing pattern"
          reader.exclude = pattern
        when '-t', '--target'
          path = ARGV.shift
          path or error "#{option}: missing path"
          exporter.root = path
        when '-b', '--backup'
          policy = ARGV.shift
          case policy
          when nil
            policy = :always
          when /^-/
            ARGV.unshift policy
            policy = :always
          end
          exporter.backup = policy
        when '-c', '--cleanup'
          exporter.cleanup = true
        when '-q', '--quiet'
          Console.verbosity = 0
        when '-V', '--verbose'
          Console.verbosity = 2
        else
          error "invalid argument: #{option.inspect}"
        end
      end
      ARGV.empty? or error "invalid arguments: #{ARGV.join(' ')}"
    end

    def help
      <<-HELP.dedent
        Usage: #{main_cmd.name} export <package> [options]

        <package>
          The name of a directory containing the DSL files to process.

        Options:
          -s, --source PATH
            The path to the directory containing the directory <package>.
            By default, it is the current directory.

          -i, --include PATTERNS
            Files to process or copy. By default, all files are processed
            (except the files defined by the --exclude option).
            PATTERNS must be a list of specifications separated by semicolons,
            for instance "*.rb;*.py".

          -e, --exclude PATTERNS
            Files not to process nor copy. By default "*.keyboard.rb"
            (keyboard definition files are processed when called from
            keymap definitions).

          -t, --target PATH
            The path to the target root directory: the generated files
            will be placed there in a subdirectory named <package>.
            By default, it is the Sublime Text Packages directory.

          -b, --backup [POLICY]
            Define the backup policy if the directory <target_path>/<package>
            already exists and contains files. POLICY may be:
              never:  do not create a backup
              always: always create a backup
              once:   create a backup if there is not already one
            Not giving a policy (-b or --backup alone) is the same
            as 'always'. The default is 'always'.
            The backup will be a zip file placed in <target_path>,
            named <package_name>.<time_stamp>.zip

          -c, --cleanup
            Delete any file in the directory <target_path>/<package>
            that is not generated by the export process. By default,
            no file is removed from the target directory.

          -q, --quiet
            Do not report any information or warning.

          -V, --verbose
            Report detailed progress information.
      HELP
    end

  end

end
end