# encoding: utf-8

module SublimeDSL
module SublimeText
class Package

  ##
  # An import operation with its options.

  class Importer

    attr_reader :package_name
    attr_accessor :root, :alt_root, :include, :exclude

    def initialize(name)
      @package_name = name
      @root = SublimeText.packages_dir
      @alt_root = nil
      @include = nil
      @exclude = '*.cache;*.pyc'
    end

    def dir
      "#{root}/#{package_name}"
    end

    def package
      @package ||= import
    end

  private

    def validate
      File.directory?(dir) or raise OptionError, "no such directory: #{dir}"
      alt_root.nil? || File.directory?(alt_root) or
        raise OptionError, "no such directory: #{alt_root}"
    end

    def files
      @files ||= begin
        files = Dir["#{dir}/*"]

        if self.include
          specs = self.include.split(';')
          files.select! do |f|
            f = File.basename(f)
            specs.any? { |s| File.fnmatch(s, f) }
          end
        end

        if self.exclude
          specs = self.exclude.split(';')
          files.reject! do |f|
            f = File.basename(f)
            specs.any? { |s| File.fnmatch(s, f) }
          end
        end

        files
      end
    end

    def import
      validate

      if files.empty?
        Console.info "#{dir}: nothing to import"
        return nil
      end

      Console.info "importing package from #{dir}"
      package = Package.new(package_name)
      files.each.with_index(1) do |file, index|
        file = selected_file(file)
        Console.progress index, files.length, file
        begin
          case File.extname(file).downcase
          when '.tmtheme'
            package.themes << TextMate::Theme.import(file)
          when '.tmlanguage'
            package.grammars << TextMate::Grammar.import(file)
          when '.tmpreferences'
            package.preferences << TextMate::Preference.import(file)
          when '.tmsnippet', '.sublime-snippet'
            package.snippets << TextMate::Snippet.import(file)
          when '.sublime-settings'
            package.setting_sets << SettingSet.import(file)
          when '.sublime-macro'
            package.macros << Macro.import(file)
          when '.sublime-commands'
            package.command_sets << CommandSet.import(file)
          when '.sublime-menu'
            package.menus << Menu.import(file)
          when '.sublime-mousemap'
            package.mousemaps << MouseMap.import(file)
          when '.sublime-keymap'
            package.keymaps << KeyMap.import(file)

          when '.sublime-build'
            # not worth it
            package.other_files << file
          when '.sublime-completions'
            # only HTML & PHP, not surviving in ST 3
            package.other_files << file
          else
            package.other_files << file
          end
        rescue => ex
          Console.error "error when importing #{file}:"
          raise ex
        end
      end

      package
    end

    def selected_file(file)
      return file unless alt_root
      alt_file = file.sub(root, alt_root)
      File.exist?(alt_file) ? alt_file : file
    end

  end

end
end
end
