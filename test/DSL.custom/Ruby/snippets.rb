# encoding: utf-8

snippets do

  default_scope 'source.ruby'

  tab ':', ':key => "value"', <<-'RUBY'
:${1:key} => ${2:"${3:value}"}${4:, }
RUBY

  tab '=b', '=begin rdoc … end', <<-'RUBY'
=begin rdoc
	$0
=end
RUBY

  tab 'all', 'all? { |e| … }', <<-'RUBY'
all? { |${1:e}| $0 }
RUBY

  tab 'any', 'any? { |e| … }', <<-'RUBY'
any? { |${1:e}| $0 }
RUBY


  tab 'begin', 'begin … rescue … end', <<-'RUBY', scope: 'source.ruby - comment'
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}begin
	${3:${TM_SELECTED_TEXT/(\A.*)|(.+)|\n\z/(?1:$0:(?2:\t$0))/g}}
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}rescue ${1:Exception}${2/.+/ => /}${2:e}
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}	$0
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}end
RUBY

  tab 'bm', 'Benchmark.bmbm do … end', <<-'RUBY'
TESTS = ${1:10_000}
Benchmark.bmbm do |results|
  $0
end
RUBY

  tab 'case', 'case … when … end', <<-'RUBY'
case ${1:object}
when ${2:condition}
	$0
end
RUBY

  tab 'cla', 'ClassName = Struct … do … end', <<-'RUBY'
${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}} = Struct.new(:${2:attr_names}) do

	def ${3:method_name}
		$0
	end

end
RUBY

  tab 'cla', 'class … initialize … end', <<-'RUBY'
class ${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}}${2: < $3}

	def initialize${4/(^.*?\S.*)|.*/(?1:\()/}${4:args}${4/(^.*?\S.*)|.*/(?1:\))/}
		$0
	end

end
RUBY

  tab 'cla', 'class … < DelegateClass … initialize … end', <<-'RUBY'
class ${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}} < DelegateClass(${2:ParentClass})

	def initialize${3/(^.*?\S.*)|.*/(?1:\()/}${3:args}${3/(^.*?\S.*)|.*/(?1:\))/}
		super(${4:del_obj})

		$0
	end

end
RUBY

  tab 'deec', 'deep_copy(…)', <<-'RUBY'
Marshal.load(Marshal.dump(${0:obj_to_copy}))
RUBY

  tab 'def', 'def … end', <<-'RUBY'
def ${1:method_name}
	$0
end
RUBY

  tab 'defmm', 'def method_missing … end', <<-'RUBY'
def method_missing(sym, *args, &block)
	$0
end
RUBY

  tab 'dob', 'do |variable| … end', <<-'RUBY'
do${1/(^.+$)|^$/(?1: |)/}${1:variable}${1/(^.+$)|^$/(?1:|)/}
	$0
end
RUBY

  tab 'ea', 'each { |e| … }', <<-'RUBY'
each { |${1:e}| $0 }
RUBY

  tab 'eab', 'each_byte { |byte| … }', <<-'RUBY'
each_byte { |${1:byte}| $0 }
RUBY

  tab 'eac', 'each_char { |chr| … }', <<-'RUBY'
each_char { |${1:chr}| $0 }
RUBY

  tab 'eac', 'each_cons(…) { |group| … }', <<-'RUBY'
each_cons(${1:2}) { |${2:group}| $0 }
RUBY

  tab 'eai', 'each_index { |i| … }', <<-'RUBY'
each_index { |${1:i}| $0 }
RUBY

  tab 'eak', 'each_key { |key| … }', <<-'RUBY'
each_key { |${1:key}| $0 }
RUBY

  tab 'eal', 'each_line { |line| … }', <<-'RUBY'
each_line$1 { |${2:line}| $0 }
RUBY

  tab 'eap', 'each_pair { |name, val| … }', <<-'RUBY'
each_pair { |${1:name}, ${2:val}| $0 }
RUBY

  tab 'eas', 'each_slice(…) { |group| … }', <<-'RUBY'
each_slice(${1:2}) { |${2:group}| $0 }
RUBY

  tab 'eav', 'each_value { |val| … }', <<-'RUBY'
each_value { |${1:val}| $0 }
RUBY

  tab 'eawi', 'each_with_index { |e, i| … }', <<-'RUBY'
each_with_index { |${1:e}, ${2:i}| $0 }
RUBY

  tab 'File', 'File.open("…") { |file| … }', <<-'RUBY'
File.open(${1:"${2:path/to/file}"}${3/(^[rwab+]+$)|.*/(?1:, ")/}${3:w}${3/(^[rwab+]+$)|.*/(?1:")/}) { |${4:file}| $0 }
RUBY

  tab 'File', 'File.read("…")', <<-'RUBY'
File.read(${1:"${2:path/to/file}"})
RUBY

  p1 = '(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*'

  tab 'gsu', 'gsub(/…/) { |match| … }', <<-RUBY
gsub(/${1:pattern}/) { ${2/#{p1}/(?1:|)/}${2:match}${2/#{p1}/(?1:| )/}\$0 }
RUBY

  tab 'if', 'if … end', <<-'RUBY'
if ${1:condition}
	$0
end
RUBY

  tab 'ife', 'if … else … end', <<-'RUBY'
if ${1:condition}
	$2
else
	$3
end
RUBY

  tab 'inj', 'inject(init) { |mem, var| … }', <<-'RUBY'
inject${1/.+/(/}${1:init}${1/.+/)/} { |${2:mem}, ${3:var}| $0 }
RUBY

  tab 'lam', 'lambda { |args| … }', <<-RUBY
lambda { ${1/#{p1}/(?1:|)/}${1:args}${1/#{p1}/(?1:| )/}\$0 }
RUBY

  tab 'loo', 'loop { … }', <<-'RUBY'
loop { $0 }
RUBY

  tab 'map', 'map { |e| … }', <<-'RUBY'
map { |${1:e}| $0 }
RUBY

  tab 'mapwi-', 'map_with_index { |e, i| … }', <<-'RUBY'
enum_with_index.map { |${1:e}, ${2:i}| $0 }
RUBY

  tab 'max', 'max { |a, b| … }', <<-'RUBY'
max { |a, b| $0 }
RUBY

  tab 'min', 'min { |a, b| … }', <<-'RUBY'
min { |a, b| $0 }
RUBY

  tab 'md', 'Marshal.dump(…, file)', <<-'RUBY'
File.open(${1:"${2:path/to/file}.dump"}, "wb") { |${3:file}| Marshal.dump(${4:obj}, ${3:file}) }
RUBY

  tab 'ml', 'Marshal.load(obj)', <<-'RUBY'
File.open(${1:"${2:path/to/file}.dump"}, "rb") { |${3:file}| Marshal.load(${3:file}) }
RUBY

  tab 'mod', 'module … module_function … end', <<-'RUBY'
module ${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}}
	module_function

	$0
end
RUBY

  tab 'mod', 'module … end', <<-'RUBY'
module ${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}}
	$0
end
RUBY

  tab 'opt', 'option(…)', <<-'RUBY'
opts.on( "-${1:o}", "--${2:long-option-name}"${3/^\s*$|(.*\S.*)/(?1:, )/}${3:String},
         "${4:Option description.}" ) do |${6:opt}|
	$0
end
RUBY

  tab 'par', 'partition { |e| … }', <<-'RUBY'
partition { |${1:e}| $0 }
RUBY

  tab 'r', 'attr_reader …', <<-'RUBY'
attr_reader :${0:attr_names}
RUBY

  tab 'rej', 'reject { |e| … }', <<-'RUBY'
reject { |${1:e}| $0 }
RUBY

  tab 'req', "require '…'", <<-'RUBY'
require '$0'
RUBY

  tab 'reve', 'reverse_each { |e| … }', <<-'RUBY'
reverse_each { |${1:e}| $0 }
RUBY

  tab 'rw', 'attr_accessor …', <<-'RUBY'
attr_accessor :${0:attr_names}
RUBY

  tab 'sel', 'select { |e| … }', <<-'RUBY'
select { |${1:e}| $0 }
RUBY

  tab 'ste', 'step(2) { |e| … }', <<-RUBY
step(${1:2}) { ${2/#{p1}/(?1:|)/}${2:n}${2/#{p1}/(?1:| )/}\$0 }
RUBY

  tab 'tas', 'task :task_name => [:dependent, :tasks] do … end', <<-'RUBY'
desc "${1:Task description}"
task :${2:${3:task_name} => ${4:[:${5:dependent, :tasks}]}} do
	$0
end
RUBY

  tab 'tim', 'times { |n| … }', <<-RUBY
times { ${1/#{p1}/(?1:|)/}${1:n}${1/#{p1}/(?1:| )/}\$0 }
RUBY

  tab 'until', 'until … end', <<-'RUBY'
until ${1:condition}
	$0
end
RUBY

  tab 'w', 'attr_writer …', <<-'RUBY'
attr_writer :${0:attr_names}
RUBY

  tab 'while', 'while … end', <<-'RUBY'
while ${1:condition}
	$0
end
RUBY

  tab 'y', ':yields:', <<-'RUBY', scope: 'source.ruby comment'
 :yields: ${0:arguments}
RUBY

  tab 'yd', 'File.open(…) { YAML.dump … }', <<-'RUBY'
File.open(${1:"${2:path/to/file}.yaml"}, 'wb:utf-8') { |f| YAML.dump ${3:obj}, f }
RUBY

  tab 'yl', 'YAML.load(file)', <<-'RUBY'
File.open(${1:"${2:path/to/file}.yaml"}, 'r:utf-8') { |f| YAML.load(f) }
RUBY

  p2 = '(^(?<var>\s*[a-z_][a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*'
  content = "{ ${1/#{p2}/(?1:|)/}${1:variable}${1/#{p2}/(?1:| )/}${2:\$TM_SELECTED_TEXT} "

  tab '{', '{ |variable| … }', content, scope: 'source.ruby - string - comment'

end
