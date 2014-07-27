# encoding: utf-8
$VERBOSE = true
$LOAD_PATH.unshift File.expand_path('./lib')
require 'sublime_dsl'

include SublimeDSL
Console.set_ruby_verbosity = false

undef rule if self.respond_to? :rule

desc 'run a command'
task 'cmd', 'arguments' do |t, args|
  cmd = Dir['bin/*'].first
  cmd << ' ' << args.arguments if args.arguments
  puts cmd
  system "ruby -w -Ilib #{cmd}"
end

desc 'build & install gem'
task 'gem' do
  system 'gem build sublime_dsl.gemspec'
  system 'gem install sublime_dsl --local'
end

desc 'create RDoc documentation'
task 'rdoc' do
  require 'rdoc/rdoc'
  # require 'rdoc/generator/babel'
  FileUtils.rm_r 'doc' if File.directory?('doc')
  rdoc = RDoc::RDoc.new
  args = %w(--force-update --force-output --all)  # --hyperlink-all
  args << '-f' << 'babel'
  args << '-c' << 'utf-8'
  args << '--see-standard-ancestors'
  args << '-o' << 'doc'
  args << '-t' << 'Sublime DSL'
  args.concat %w(README.md SYNTAX.md lib)
  rdoc.document(args)
end

desc 'run all tests'
task 'test' do
  Rake::Task['test:import'].invoke
  Rake::Task['test:export'].invoke
  Rake::Task['test:compare'].invoke
end

namespace 'test' do

  desc 'import all packages to DSL'
  task 'import', 'profile' do |t, args|

    if args.profile
      profiling('import', 'original') { import_packages 'original' }
      profiling('import', 'keyboard') { import_packages 'original', true }
      profiling('import', 'textmate') { import_packages 'textmate' }
    else
      import_packages 'original'
      import_packages 'original', true
      import_packages 'textmate'
    end

  end

  desc 'import with custom keyboards'
  task 'import_keyboards' do
    import_packages 'original', true
  end

  desc 'export all DSL to packages'
  task 'export', 'profile' do |t, args|
    if args.profile then
      profiling('export', 'original') { export_packages 'original' }
      profiling('export', 'keyboard') { export_packages 'original.kb-fr' }
      profiling('export', 'modified') { export_packages 'modified' }
      profiling('export', 'textmate') { export_packages 'textmate' }
      profiling('export', 'custom')   { export_packages 'custom' }
    else
      export_packages 'original'
      export_packages 'original.kb-fr'
      export_packages 'modified'
      export_packages 'textmate'
      export_packages 'custom'
    end
  end

  desc 'export custom DSL packages'
  task 'export_custom' do
    export_packages 'custom'
  end

  desc 'compare JSON after round-trip'
  task 'compare' do
    compare 'original'
  end

end

def sublime_dir
  SublimeText.packages_dir
end

def capturing_stderr(file)
  prev_stderr, $stderr = $stderr, File.open(file, 'wb:utf-8')
  yield
  $stderr.close
ensure
  $stderr = prev_stderr
end

def profiling(task, subtask)
  require 'ruby-prof'
  result = RubyProf.profile { yield }
  profile_report "#{task}-#{subtask}", result
end

def profile_report(file, result)
  printer = RubyProf::CallStackPrinter.new(result)
  Dir.mkdir 'prof' unless File.directory?('prof')
  File.open("prof/#{file}.html", 'wb') do |f|
    printer.print f, title: file, application: 'Sublime DSL'
  end
end

def import_packages(suffix, custom_keyboard = false)
  inroot = "test/Packages.#{suffix}"
  altroot = "test/Packages.#{suffix}-fixes"
  altroot = nil unless File.directory?(altroot)
  import_options = { root: inroot, alt_root: altroot }
  write_options = {}
  if custom_keyboard
    suffix << '.kb-fr'
    import_options[:include] = '*.sublime-keymap'
    write_options[:keyboard] = 'AZERTY-fr-FR-v6 (Windows 7)'
  end
  outroot = "test/DSL.#{suffix}"
  write_options.merge! root: outroot, backup: :never
  log = "test/#{suffix}.import.log"
  Console.verbosity = 0
  Console.info "importing #{inroot}", true
  capturing_stderr(log) do
    dirs = Dir[inroot + '/*']
    dirs.each.with_index(1) do |indir, index|
      Console.progress index, dirs.length, indir, true
      name = File.basename(indir)
      p = SublimeText::Package.import(name, import_options)
      p.write write_options if p
    end
  end
end

def export_packages(suffix)
  inroot = "test/DSL.#{suffix}"
  altroot = "test/DSL.#{suffix}-fixes"
  outroot = "test/Packages.#{suffix}"
  outroot << '-round-trip' unless suffix =~ /custom|modified/
  read_options = { root: inroot }
  read_options[:alt_root] = altroot if File.directory?(altroot)
  export_options = { root: outroot, backup: :never, cleanup: true }
  log = "test/#{suffix}.export.log"
  Console.verbosity = 0
  Console.info "exporting #{inroot}", true
  capturing_stderr(log) do
    dirs = Dir[inroot + '/*']
    dirs.each.with_index(1) do |indir, index|
      Console.progress index, dirs.length, indir, true
      name = File.basename(indir)
      p = SublimeText::Package.read(name, read_options)
      p.export export_options if p
    end
  end
end

def compare(suffix)
  extensions = 'macro,commands,menu,keymap,mousemap,settings,build,completions'
  inroot = "test/Packages.#{suffix}"
  altroot = "test/Packages.#{suffix}-fixes"
  outroot = "test/Packages.#{suffix}-round-trip"
  Dir[inroot + "/**/*.sublime-{#{extensions}}"].each do |infile|
    indir = File.dirname(infile)
    altdir = altroot + '/' << File.basename(indir)
    altfile = altdir + '/' << File.basename(infile)
    infile = altfile if File.exist?(altfile)
    outdir = outroot + '/' << File.basename(indir)
    outfile = outdir + '/' << File.basename(infile)
    if File.exist?(outfile)
      compare_json infile, outfile
    else
      # puts outfile
      # puts '  no found'
    end
  end
end

def compare_json(infile, outfile)
  in_text = File.read(infile, encoding: 'utf-8')
  out_text = File.read(outfile, encoding: 'utf-8')
  out_json = JSON[out_text]
  if in_text.empty?
    puts "*** mismatch: #{infile}" unless out_json.empty?
    return
  end
  in_json = JSON[in_text]
  normalize in_json
  normalize out_json
  return if in_json == out_json
  puts "*** mismatch: #{infile}"
  file = infile.gsub('/', '_')
  File.open("#{file}.in", 'wb:utf-8') { |f| f.write JSON.pretty_generate(in_json) }
  File.open("#{file}.out", 'wb:utf-8') { |f| f.write JSON.pretty_generate(out_json) }
end

def normalize(json)
  case json
  when Hash
    h = {}
    json.keys.sort.each do |k|
      v = json[k]
      normalize v
      if k == 'mnemonic'
        v = v.upcase
      elsif k == 'keys' && v.is_a?(Array)
        v = v.map do |spec|
          *mods, key = spec.split(/\+(?!$)/)
          if key == '+' || key == 'plus'
            mods << 'shift'
            key = '='
          elsif key =~ /^(forward_slash|backquote|equals|minus)$/
            map = { 'forward_slash' => '/', 'backquote' => '`', 'equals' => '=', 'minus' => '-' }
            key = map[$1]
          end
          (mods.sort << key).join('+')
        end
      end
      h[k] = v unless
        (k == 'modifiers' && v.empty?) ||
        (k == 'match_all' && v == false)
    end
    json.clear
    json.merge! h
  when Array
    if json.all? { |e| e.is_a?(String) }
      json.sort!
    else
      json.each { |e| normalize e }
    end
  end
end
