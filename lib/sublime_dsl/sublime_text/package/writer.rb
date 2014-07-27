# encoding: utf-8

module SublimeDSL
module SublimeText
class Package

  ##
  # A DSL writing operation with its options.

  class Writer

    attr_reader :package
    attr_accessor :root, :backup, :copy_other_files

    def initialize(package = nil)
      @package = package
      @root = '.'
      @backup = :once
      @copy_other_files = true
      @keyboard_name = nil
    end

    def write(package = nil)
      @package = package if package
      validate
      perform_backup
      FileUtils.rm_r Dir["#{dir}/*"] if File.directory?(dir)
      Console.info "writing package DSL to #{dir}"
      write_package
    end

    def dir
      "#{root}/#{@package.name}"
    end

    def keyboard=(name)
      @keyboard_name = name
    end

    def keyboard
      @keyboard ||=
        if @keyboard_name.nil? || @keyboard_name == Keyboard.sublime.name
          Keyboard.sublime
        else
          Keyboard.get(@keyboard_name, root)
        end
    end

    def validate
      File.directory?(root) or raise OptionError, "no such directory: #{root}"
      @backup = backup.to_sym
      unless [:never, :always, :once].include?(backup)
        warn "invalid backup option #{backup.inspect}, 'always' assumed"
        @backup = :always
      end
      keyboard
    end

    def perform_backup
      # no backup needed if not asked or no file to backup
      return unless backup != :never && Dir["#{dir}/*"].length > 0
      # don't do it if only one backup is requested, and there is already one
      name = Tools.filename(package.name)
      return if backup == :once && Dir["#{root}/#{name}.*.zip"].length > 0
      # backup
      time_stamp = Tools.filename(Time.now.strftime("%Y-%m-%d %H:%M:%S"))
      backup_file = "#{root}/#{name}.#{time_stamp}.zip"
      Tools.zip dir, backup_file
      Console.info "#{dir} backed up as #{backup_file}"
    end

    def write_package
      Dir.mkdir dir unless File.directory?(dir)
      p = package
      p.themes.each { |t| t.write dir }
      p.grammars.each { |g| g.write dir }
      write_all p.preferences, "#{dir}/preferences.rb"
      TextMate::Snippet::DSLWriter.new(p.snippets).write "#{dir}/snippets.rb"
      write_all p.setting_sets, "#{dir}/settings.rb"
      write_all p.macros.sort_by(&:name), "#{dir}/macros.rb"
      write_all p.command_sets, "#{dir}/commands.rb"
      p.menus.each { |m| m.write dir }
      p.mousemaps.each { |m| m.write dir }
      p.keymaps.each { |k| k.for_keyboard(keyboard).write dir }
      return unless copy_other_files
      p.other_files.each { |f| copy_file f, dir }
    end

    def copy_file(infile, outdir)
      if File.directory?(infile)
        outpath = "#{outdir}/#{File.basename(infile)}"
        Dir.mkdir outpath unless File.directory?(outpath)
        Dir["#{infile}/*"].each { |f| copy_file f, outpath }
      else
        # Console.progress ...
        FileUtils.cp infile, outdir
      end
    end

    def write_all(collection, file)
      return if collection.empty?
      File.open(file, 'wb:utf-8') do |f|
        f.puts '# encoding: utf-8'
        collection.each { |e| f.puts "\n#{e.to_dsl}" }
      end
    end

  end

end
end
end
