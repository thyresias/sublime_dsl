# encoding: utf-8

module SublimeDSL
module SublimeText
class Package

  ##
  # An export operation with its options.

  class Exporter

    attr_reader :package
    attr_accessor :root, :backup, :cleanup

    def initialize(package = nil)
      @package = package
      @root = SublimeText.packages_dir
      @backup = :always
      @cleanup = false
    end

    def export(package = nil)
      @package = package if package
      validate
      perform_backup
      Console.info "exporting package to #{dir}"
      Dir.mktmpdir('sublime_dsl_') do |tmpdir|
        tmpdir = tmpdir.encode('utf-8') # for ruby 2.0
        export_package tmpdir
        copy_package tmpdir, dir
      end
    end

    def dir
      "#{root}/#{@package.name}"
    end

    def keyboard=(name)
      @keyboard_name = name
    end

    def validate
      File.directory?(root) or raise OptionError, "no such directory: #{root}"
      @backup = backup.to_sym
      unless [:never, :always, :once].include?(backup)
        warn "invalid backup option #{backup.inspect}, 'always' assumed"
        @backup = :always
      end
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

    def export_package(dir)
      p = package
      p.themes.each { |t| t.export dir }
      p.grammars.each { |g| g.export dir }
      p.preferences.each { |pr| pr.export dir }
      p.snippets.each { |s| s.export dir }
      p.setting_sets.each { |s| s.export dir }
      p.macros.each { |m| m.export dir }
      p.command_sets.each { |c| c.export dir }
      p.menus.each { |m| m.export dir }
      p.mousemaps.each { |m| m.export dir }
      p.keymaps.each { |k| k.export dir }
      p.other_files.each { |f| copy_file f, dir }
    end

    def copy_package(from, to)

      # remember the files originally there
      if File.directory?(to)
        old_files = Dir["#{to}/**/*"]
      else
        Dir.mkdir to
        old_files = []
      end

      # copy from the temporary directory
      new_files = []
      Dir["#{from}/**/*"].each do |fromfile|
        tofile = fromfile.dup
        tofile[from] = to
        new_files << tofile
        if File.directory?(fromfile)
          Dir.mkdir tofile unless File.directory?(tofile)
        else
          FileUtils.cp fromfile, tofile
        end
      end

      return unless cleanup

      # on Windows, do not delete files that had just case changes
      if Tools.os == :Windows
        old_files = old_files.map(&:downcase)
        new_files = new_files.map(&:downcase)
      end

      # delete files/directories that disappeared
      (old_files - new_files).each do |f|
        next unless File.exist?(f)  # removing directories also remove files
        if File.directory?(f)
          FileUtils.rm_r [f]
        else
          FileUtils.rm f
        end
      end

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

  end


end
end
end
