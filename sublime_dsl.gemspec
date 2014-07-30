# encoding: utf-8

h = Object.new  # helper object

def h.doc_files
  %w(README.md SYNTAX.md HISTORY.md)
end

def h.lib_files
  Dir['lib/**/*'].reject { |f| File.directory?(f) }
end

def h.bin_files
  Dir['bin/*']
end

def h.test_files
  Dir['test/**/*'].reject { |f| File.directory?(f) }
end

def h.version
  line = File.read('lib/sublime_dsl.rb').lines.grep(/VERSION/).first
  line[/VERSION\s*=\s*(['"])(.+)\1/, 2]
end

def h.runtime_deps
  %w(
    json      1.8
    nokogiri  1.6
    rubyzip   1.1
  )
end

Gem::Specification.new do |s|
  s.name = 'sublime_dsl'
  s.summary = "A DSL to specify Sublime Text packages."
  s.description = <<-TEXT
Sublime DSL allows generating Sublime Text configuration files
from a Ruby DSL, giving the power of Ruby to develop and maintain
themes, grammars, snippets, key bindings, etc.
  TEXT
  s.license = 'MIT'

  s.version = h.version
  # s.date = '2010-04-28'

  s.author = 'Thierry Lambert'
  s.email = 'thyresias@gmail.com'
  s.homepage = 'https://github.com/thyresias/sublime_dsl'

  s.files = ['Rakefile'] + h.doc_files + h.lib_files + h.bin_files # + h.test_files

  s.bindir = 'bin'
  s.executables = h.bin_files.map { |f| File.basename(f) }

  s.extra_rdoc_files = h.doc_files
  s.rdoc_options <<
    '--title' << 'Sublime DSL' <<
    '--main' << h.doc_files.first

  h.runtime_deps.each_slice(2) do |name, version|
    s.add_runtime_dependency name, ["~>#{version}"]
  end
end
