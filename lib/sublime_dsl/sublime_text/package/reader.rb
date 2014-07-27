# encoding: utf-8

module SublimeDSL
module SublimeText
class Package

  ##
  # A DSL read operation with its options.

  class Reader

    attr_reader :package_name
    attr_accessor :root, :alt_root, :include, :exclude

    def initialize(name)
      @package_name = name
      @root = '.'
      @alt_root = nil
      @include = nil
      @exclude = '*.keyboard.rb'
    end

    def dir
      "#{root}/#{package_name}"
    end

    def package
      @package ||= read
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

    def read
      validate

      if files.empty?
        Console.info "#{dir}: nothing to read"
        return nil
      end

      Console.info "processing DSL files in #{dir}"
      package = Package.new(package_name)

      files.each.with_index(1) do |file, index|
        file = selected_file(file)
        Console.progress index, files.length, file
        begin
          if File.basename(file) =~ /\.rb$/
            DSLReader.new file, package
          else
            package.other_files << file
          end
        rescue => ex
          Console.error "error when reading #{file}:"
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
