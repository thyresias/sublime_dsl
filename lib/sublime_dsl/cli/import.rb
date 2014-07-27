module SublimeDSL
class CLI

  class Import

    def self.summary
      "convert a Sublime Text package to a set of DSL source files"
    end

    attr_reader :main_cmd
    attr_reader :importer, :writer

    def initialize(main_cmd)
      @main_cmd = main_cmd
    end

    def run
      parse_options
      package = importer.package
      exit 1 unless package
      writer.write package
      exit
    rescue OptionError => ex
      Console.error ex.message
      Console.error %(type "#{main_cmd.name} help import" for more information)
      exit 2
    end

    def error(msg)
      raise OptionError, msg
    end

    def parse_options
      package_name = ARGV.shift
      error 'missing package name' unless package_name
      @importer = SublimeText::Package::Importer.new(package_name)
      @writer = SublimeText::Package::Writer.new
      while (option = ARGV.shift)
        case option
        when '-s', '--source'
          path = ARGV.shift
          path or error "#{option}: missing path"
          importer.root = path
        when '-i', '--include'
          pattern = ARGV.shift
          pattern or error "#{option}: missing pattern"
          importer.include = pattern
        when '-e', '--exclude'
          pattern = ARGV.shift
          pattern or error "#{option}: missing pattern"
          importer.exclude = pattern
        when '-t', '--target'
          path = ARGV.shift
          path or error "#{option}: missing path"
          writer.root = path
        when '-k', '--keyboard'
          keyboard = ARGV.shift
          keyboard or error "#{option}: missing keyboard"
          writer.keyboard = keyboard
        when '-r', '--recognized'
          writer.copy_other_files = false
        when '-b', '--backup'
          policy = ARGV.shift
          case policy
          when nil
            policy = :always
          when /^-/
            ARGV.unshift policy
            policy = :always
          end
          writer.backup = policy
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
        Usage: #{main_cmd.name} import <package> [options]

        <package>
          The name of a Sublime Text package directory containing
          files to convert to DSL files.

        Options:
          -s, --source PATH
            The path to the directory containing the directory <package>.
            By default, it is the Sublime Text Packages directory.

          -i, --include PATTERNS
            Files to process or copy. By default, all files are processed
            (except the files defined by the --exclude option).
            PATTERNS must be a list of specifications separated by semicolons,
            for instance "*.tmSnippet;*.tmLanguage".

          -e, --exclude PATTERNS
            Files not to process nor copy. By default "*.cache;*.pyc".

          -t, --target PATH
            The path to the target root directory: generated DSL files
            will be placed there in a subdirectory named <package>.
            By default, it is the current directory.

          -k, --keyboard NAME
            Convert keymap definitions for keyboard NAME. By default, no
            keymap conversion is done. A file NAME.keyboard.rb will be
            searched for in the subdirectories of <target_path>.

          -r, --recognized
            Do not copy non-recognized files to the target directory.
            By default, non-recognized files (e.g., Python scripts)
            are copied "as is" from the source directory to the target
            directory.

          -b, --backup [POLICY]
            Define the backup policy if the directory <target_path>/<package>
            already exists and contains files. POLICY may be:
              never:  do not create a backup
              always: always create a backup
              once:   create a backup if there is not already one
            Not giving a policy (-b or --backup alone) is the same
            as 'always'. The default is 'once'.
            The backup will be a zip file placed in <target_path>,
            named <package_name>.<time_stamp>.zip

          -q, --quiet
            Do not report any information or warning.

          -V, --verbose
            Report detailed progress information.
      HELP
    end

  end

end
end