# encoding: utf-8

snippets do

  default_scope 'source.ruby'

  tab '#', 'Add ‘# =>’ Marker', "# => ", file: "Add-'#-=-'-Marker"

  tab ':', 'Hash Pair — :key => "value"', <<-'TXT', file: 'hash-pair-(-)'
:${1:key} => ${2:"${3:value}"}${4:, }
TXT

  tab '=b', 'New Block', <<-'TXT', file: 'RDoc-documentation-block'
`[[ $TM_LINE_INDEX != 0 ]] && echo; echo`=begin rdoc
	$0
=end
TXT

  tab 'all', 'all? { |e| .. }', <<-'TXT', file: 'all-{-e-..-}-(all)'
all? { |${1:e}| $0 }
TXT

  tab 'am', 'alias_method ..', <<-'TXT', file: 'alias_method-..-(am)'
alias_method :${1:new_name}, :${0:old_name}
TXT

  tab 'any', 'any? { |e| .. }', <<-'TXT', file: 'any-{-e-..-}-(any)'
any? { |${1:e}| $0 }
TXT

  tab 'app', 'application { .. }', <<-'TXT', file: 'application_code-..-(app)'
if __FILE__ == \$PROGRAM_NAME
	$0
end
TXT

  tab 'Array', 'Array.new(10) { |i| .. }', <<-'TXT', file: 'Array.new(10)-{-i-..-}-(Arr)'
Array.new(${1:10}) { ${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${2:i}${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'as', 'assert(..)', <<-'TXT', file: 'assert(..)-(as)'
assert(${1:test}, "${0:Failure message.}")
TXT

  tab 'ase', 'assert_equal(..)', <<-'TXT', file: 'assert_equal'
assert_equal(${1:expected}, ${0:actual})
TXT

  tab 'asid', 'assert_in_delta(..)', <<-'TXT', file: 'assert_in_delta(..)-(asid)'
assert_in_delta(${1:expected_float}, ${2:actual_float}, ${0:2 ** -20})
TXT

  tab 'asio', 'assert_instance_of(..)', <<-'TXT', file: 'assert_instance_of(..)-(asio)'
assert_instance_of(${1:ExpectedClass}, ${0:actual_instance})
TXT

  tab 'asko', 'assert_kind_of(..)', <<-'TXT', file: 'assert_kind_of(..)-(asko)'
assert_kind_of(${1:ExpectedKind}, ${0:actual_instance})
TXT

  tab 'asm', 'assert_match(..)', <<-'TXT', file: 'assert_match(..)-(asm)'
assert_match(/${1:expected_pattern}/, ${0:actual_string})
TXT

  tab 'asn', 'assert_nil(..)', <<-'TXT', file: 'assert_nil(..)-(asn)'
assert_nil(${0:instance})
TXT

  tab 'asne', 'assert_not_equal(..)', <<-'TXT', file: 'assert_not_equal(..)-(asne)'
assert_not_equal(${1:unexpected}, ${0:actual})
TXT

  tab 'asnm', 'assert_no_match(..)', <<-'TXT', file: 'assert_no_match(..)-(asnm)'
assert_no_match(/${1:unexpected_pattern}/, ${0:actual_string})
TXT

  tab 'asnn', 'assert_not_nil(..)', <<-'TXT', file: 'assert_not_nil(..)-(asnn)'
assert_not_nil(${0:instance})
TXT

  tab 'asnr', 'assert_nothing_raised(..) { .. }', <<-'TXT', file: 'assert_nothing_raised(..)-{-..-}-(asnr)'
assert_nothing_raised(${1:Exception}) { $0 }
TXT

  tab 'asns', 'assert_not_same(..)', <<-'TXT', file: 'assert_not_same(..)-(asns)'
assert_not_same(${1:unexpected}, ${0:actual})
TXT

  tab 'asnt', 'assert_nothing_thrown { .. }', <<-'TXT', file: 'assert_nothing_thrown-{-..-}-(asnt)'
assert_nothing_thrown { $0 }
TXT

  tab 'aso', 'assert_operator(..)', <<-'TXT', file: 'assert_operator(..)-(aso)'
assert_operator(${1:left}, :${2:operator}, ${0:right})
TXT

  tab 'asr', 'assert_raise(..) { .. }', <<-'TXT', file: 'assert_raise(..)-{-..-}-(asr)'
assert_raise(${1:Exception}) { $0 }
TXT

  tab 'asrt', 'assert_respond_to(..)', <<-'TXT', file: 'assert_respond_to(..)-(asrt)'
assert_respond_to(${1:object}, :${0:method})
TXT

  tab 'ass', 'assert_same(..)', <<-'TXT', file: 'assert_same(..)-(ass)'
assert_same(${1:expected}, ${0:actual})
TXT

  tab 'ass', 'assert_send(..)', <<-'TXT', file: 'assert_send(..)-(ass)'
assert_send([${1:object}, :${2:message}, ${0:args}])
TXT

  tab 'ast', 'assert_throws(..) { .. }', <<-'TXT', file: 'assert_throws(..)-{-..-}-(ast)'
assert_throws(:${1:expected}) { $0 }
TXT

  tab 'begin', 'begin … rescue … end', <<-'TXT', scope: 'source.ruby - comment', file: 'Wrap-in-Begin-Rescue-End'
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}begin
	${3:${TM_SELECTED_TEXT/(\A.*)|(.+)|\n\z/(?1:$0:(?2:\t$0))/g}}
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}rescue ${1:Exception}${2/.+/ => /}${2:e}
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}	$0
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}end

TXT

  tab 'bm-', 'Benchmark.bmbm do .. end', <<-'TXT', file: 'Benchmark_bmbm(__)-do-__-end'
TESTS = ${1:10_000}
Benchmark.bmbm do |results|
  $0
end
TXT

  tab 'case', 'case … end', <<-'TXT', file: '080-ruby-case'
case ${1:object}
when ${2:condition}
	$0
end
TXT

  tab 'cl', 'classify { |e| .. }', <<-'TXT', file: 'classify-{-e-..-}-(clas)'
classify { |${1:e}| $0 }
TXT

  tab 'cla', 'class .. < ParentClass .. initialize .. end', <<-'TXT', file: 'class-..-ParentClass-..-initialize-..-end'
class ${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}} < ${2:ParentClass}
	def initialize${3/(^.*?\S.*)|.*/(?1:\()/}${3:args}${3/(^.*?\S.*)|.*/(?1:\))/}
		$0
	end


end
TXT

  tab 'cla', 'class .. end', <<-'TXT', file: 'class-..-end-(cla)'
class ${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}}
	$0
end
TXT

  tab 'cla', 'class .. initialize .. end', <<-'TXT', file: 'class-..-initialize-..-end'
class ${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}}
	def initialize${2/(^.*?\S.*)|.*/(?1:\()/}${2:args}${2/(^.*?\S.*)|.*/(?1:\))/}
		$0
	end


end
TXT

  tab 'cla', 'class << self .. end', <<-'TXT', file: 'class-self-__-end'
class << ${1:self}
	$0
end
TXT

  tab 'cla', 'class BlankSlate .. initialize .. end', <<-'TXT', file: 'class-..-instance_methods-..-undef-..-initialize-..-end-(class)'
class ${1:BlankSlate}
	instance_methods.each { |meth| undef_method(meth) unless meth =~ /\A__/ }

	def initialize${2/(^.*?\S.*)|.*/(?1:\()/}${2:args}${2/(^.*?\S.*)|.*/(?1:\))/}
		@${3:delegate} = ${4:delegate_object}

		$0
	end

	def method_missing(meth, *args, &block)
		@${3:delegate}.send(meth, *args, &block)
	end


end
TXT

  tab 'cla', 'ClassName = Struct .. do .. end', <<-'TXT', file: 'class-..-Struct-..-initialize-..-end'
${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}} = Struct.new(:${2:attr_names}) do
	def ${3:method_name}
		$0
	end


end
TXT

  tab 'cla-', 'class .. < DelegateClass .. initialize .. end', <<-'TXT', file: 'class-..-DelegateClass-..-initialize-..-end-(class)'
class ${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}} < DelegateClass(${2:ParentClass})
	def initialize${3/(^.*?\S.*)|.*/(?1:\()/}${3:args}${3/(^.*?\S.*)|.*/(?1:\))/}
		super(${4:del_obj})

		$0
	end


end
TXT

  tab 'clafn', 'class_from_name()', <<-'TXT', file: 'class_from_name()-(clafn)'
split("::").inject(Object) { |par, const| par.const_get(const) }
TXT

  tab 'col', 'collect { |e| .. }', <<-'TXT', file: 'collect-{-e-..-}-(col)'
collect { |${1:e}| $0 }
TXT

  tab 'Comp', 'include Comparable ..', <<-'TXT', file: 'include-Comparable-..-(Comp)'
include Comparable

def <=>(other)
	$0
end
TXT

  tab 'deec', 'deep_copy(..)', <<-'TXT', file: 'deep_copy(..)-(dee)'
Marshal.load(Marshal.dump(${0:obj_to_copy}))
TXT

  tab 'def', 'def … end', <<-'TXT', file: 'def-end'
def ${1:method_name}
	$0
end
TXT

  tab 'defd', 'def_delegator ..', <<-'TXT', file: 'def_delegator-..-(defd)'
def_delegator :${1:@del_obj}, :${2:del_meth}, :${3:new_name}
TXT

  tab 'defds', 'def_delegators ..', <<-'TXT', file: 'def_delegators-..-(defds)'
def_delegators :${1:@del_obj}, :${0:del_methods}
TXT

  tab 'defmm', 'def method_missing .. end', <<-'TXT', file: 'def-method_missing-..-end-(mm)'
def method_missing(meth, *args, &blk)
	$0
end
TXT

  tab 'defs', 'def self .. end', <<-'TXT', file: 'def-self-..-end-(defs)'
def self.${1:class_method_name}
	$0
end
TXT

  tab 'deft', 'def test_ .. end', <<-'TXT', file: 'def-test_-..-end-(t)'
def test_${1:case_name}
	$0
end
TXT

  tab 'deli', 'delete_if { |e| .. }', <<-'TXT', file: 'delete_if-{-e-..-}-(deli)'
delete_if { |${1:e}| $0 }
TXT

  tab 'det', 'detect { |e| .. }', <<-'TXT', file: 'detect-{-e-..-}-(det)'
detect { |${1:e}| $0 }
TXT

  tab 'Dir', 'Dir.glob("..") { |file| .. }', <<-'TXT', file: 'Dir.glob(-..-)-do-file-..-end-(Dir)'
Dir.glob(${1:"${2:dir/glob/*}"}) { |${3:file}| $0 }
TXT

  tab 'Dir', 'Dir[".."]', <<-'TXT', file: 'Dir[-__-]'
Dir[${1:"${2:glob/**/*.rb}"}]
TXT

  tab 'dir', 'directory()', <<-'TXT'
File.dirname(__FILE__)
TXT

  tab 'dob', 'Insert do |variable| … end', <<-'TXT', file: 'do-obj-..-end-(doo)'
do${1/(^.+$)|^$/(?1: |)/}${1:variable}${1/(^.+$)|^$/(?1:|)/}
	$0
end
TXT

  tab 'dow', 'downto(0) { |n| .. }', <<-'TXT', file: 'downto(0)-{-n-..-}-(dow)'
downto(${1:0}) { ${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${2:n}${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'ea', 'each { |e| .. }', <<-'TXT', file: 'each-{-e-..-}-(ea)'
each { |${1:e}| $0 }
TXT

  tab 'eab', 'each_byte { |byte| .. }', <<-'TXT', file: 'each_byte-{-byte-..-}-(eab)'
each_byte { |${1:byte}| $0 }
TXT

  tab 'eac-', 'each_char { |chr| .. }', <<-'TXT', file: 'each_char-{-chr-..-}-(eac-)'
each_char { |${1:chr}| $0 }
TXT

  tab 'eac-', 'each_cons(..) { |group| .. }', <<-'TXT', file: 'each_cons(..)-{-group-..-}-(eac-)'
each_cons(${1:2}) { |${2:group}| $0 }
TXT

  tab 'eai', 'each_index { |i| .. }', <<-'TXT', file: 'each_index-{-i-..-}-(eai)'
each_index { |${1:i}| $0 }
TXT

  tab 'eak', 'each_key { |key| .. }', <<-'TXT', file: 'each_key-{-key-..-}-(eak)'
each_key { |${1:key}| $0 }
TXT

  tab 'eal', 'each_line { |line| .. }', <<-'TXT', file: 'each_line-{-line-..-}-(eal)'
each_line$1 { |${2:line}| $0 }
TXT

  tab 'eap', 'each_pair { |name, val| .. }', <<-'TXT', file: 'each_pair-{-name-val-..-}-(eap)'
each_pair { |${1:name}, ${2:val}| $0 }
TXT

  tab 'eas-', 'each_slice(..) { |group| .. }', <<-'TXT', file: 'each_slice-{-group-..-}-(eas)'
each_slice(${1:2}) { |${2:group}| $0 }
TXT

  tab 'eav', 'each_value { |val| .. }', <<-'TXT', file: 'each_value-{-val-..-}-(eav)'
each_value { |${1:val}| $0 }
TXT

  tab 'eawi', 'each_with_index { |e, i| .. }', <<-'TXT', file: 'each_with_index-{-e-i-..-}-(eawi)'
each_with_index { |${1:e}, ${2:i}| $0 }
TXT

  tab 'elsif', 'elsif ...', <<-'TXT', file: 'elsif-___'
elsif ${1:condition}
	$0
TXT

  tab 'Enum', 'include Enumerable ..', <<-'TXT', file: 'include-Enumerable-..-(Enum)'
include Enumerable

def each(&block)
	$0
end
TXT

  tab 'fet', 'fetch(name) { |key| .. }', <<-'TXT', file: 'fetch(name)-{-key-..-}-(fet)'
fetch(${1:name}) { ${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${2:key}${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'fil', 'fill(range) { |i| .. }', <<-'TXT', file: 'fill(range)-{-i-..-}-(fil)'
fill(${1:range}) { ${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${2:i}${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'File', 'File.foreach ("..") { |line| .. }', <<-'TXT', file: 'File.foreach-(-..-)-do-line-..-end-(File)'
File.foreach(${1:"${2:path/to/file}"}) { |${3:line}| $0 }
TXT

  tab 'File', 'File.open("..") { |file| .. }', <<-'TXT', file: 'File_open(-__-)-{-file-__-}'
File.open(${1:"${2:path/to/file}"}${3/(^[rwab+]+$)|.*/(?1:, ")/}${3:w}${3/(^[rwab+]+$)|.*/(?1:")/}) { |${4:file}| $0 }
TXT

  tab 'File', 'File.read("..")', <<-'TXT', file: 'File_read(-__-)'
File.read(${1:"${2:path/to/file}"})
TXT

  tab 'fin', 'find { |e| .. }', <<-'TXT', file: 'find-{-e-..-}-(fin)'
find { |${1:e}| $0 }
TXT

  tab 'fina', 'find_all { |e| .. }', <<-'TXT', file: 'find_all-{-e-..-}-(fina)'
find_all { |${1:e}| $0 }
TXT

  tab 'fl', 'flunk(..)', <<-'TXT', file: 'flunk(..)-(fl)'
flunk("${0:Failure message.}")
TXT

  tab 'flao', 'flatten_once()', <<-'TXT', file: 'flatten_once-(fla)'
inject(Array.new) { |${1:arr}, ${2:a}| ${1:arr}.push(*${2:a}) }
TXT

  tab 'Forw-', 'extend Forwardable', <<-'TXT', file: 'extend-Forwardable-(Forw)'
extend Forwardable
TXT

  tab 'gre', 'grep(/pattern/) { |match| .. }', <<-'TXT', file: 'grep(;pattern;)-{-match-..-}-(gre)'
grep(${1:/${2:pattern}/}) { |${3:match}| $0 }
TXT

  tab 'gsu', 'gsub(/../) { |match| .. }', <<-'TXT', file: 'gsub(;..;)-{-match-..-}-(gsu)'
gsub(/${1:pattern}/) { ${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${2:match}${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'Hash', 'Hash.new { |hash, key| hash[key] = .. }', <<-'TXT', file: 'Hash.new-{-hash-key-hash[key]-=-..-}-(Has)'
Hash.new { |${1:hash}, ${2:key}| ${1:hash}[${2:key}] = $0 }
TXT

  tab 'if', 'if … end', <<-'TXT', file: '070-ruby-if'
if ${1:condition}
	$0
end
TXT

  tab 'ife', 'if … else … end', <<-'TXT', file: '060-ruby-if-else'
if ${1:condition}
	$2
else
	$3
end
TXT

  tab 'inj', 'inject(init) { |mem, var| .. }', <<-'TXT', file: 'inject(init)-{-mem-var-..-}-(inj)'
inject${1/.+/(/}${1:init}${1/.+/)/} { |${2:mem}, ${3:var}| $0 }
TXT

  tab 'lam', 'lambda { |args| .. }', <<-'TXT', file: 'lambda-{-args-..-}-(lam)'
lambda { ${1/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${1:args}${1/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'loo', 'loop { .. }', <<-'TXT', file: 'loop-{-__-}'
loop { $0 }
TXT

  tab 'map', 'map { |e| .. }', <<-'TXT', file: 'map-{-e-..-}-(map)'
map { |${1:e}| $0 }
TXT

  tab 'mapwi-', 'map_with_index { |e, i| .. }', <<-'TXT', file: 'map_with_index-{-e-i-..-}-(mapwi)'
enum_with_index.map { |${1:e}, ${2:i}| $0 }
TXT

  tab 'max', 'max { |a, b| .. }', <<-'TXT', file: 'max-{-a-b-..-}-(max)'
max { |a, b| $0 }
TXT

  tab 'Md', 'Marshal.dump(.., file)', <<-'TXT', file: 'Marshal.dump(obj-file)-(Md)'
File.open(${1:"${2:path/to/file}.dump"}, "wb") { |${3:file}| Marshal.dump(${4:obj}, ${3:file}) }
TXT

  tab 'min', 'min { |a, b| .. }', <<-'TXT', file: 'min-{-a-b-..-}-(min)'
min { |a, b| $0 }
TXT

  tab 'Ml', 'Marshal.load(obj)', <<-'TXT', file: 'Marshal.load(obj)-(Ml)'
File.open(${1:"${2:path/to/file}.dump"}, "rb") { |${3:file}| Marshal.load(${3:file}) }
TXT

  tab 'mod', 'module .. ClassMethods .. end', <<-'TXT', file: 'module-..-ClassMethods-..-end'
module ${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}}
	module ClassMethods
		$0
	end

	module InstanceMethods

	end

	def self.included(receiver)
		receiver.extend         ClassMethods
		receiver.send :include, InstanceMethods
	end
end
TXT

  tab 'mod', 'module .. end', <<-'TXT', file: 'module-..-end'
module ${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}}
	$0
end
TXT

  tab 'mod', 'module .. module_function .. end', <<-'TXT', file: 'module-..-module_function-..-end'
module ${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}}
	module_function

	$0
end
TXT

  tab 'nam', 'namespace :.. do .. end', <<-'TXT', file: 'namespace-__-do-__-end'
namespace :${1:${TM_FILENAME/\.\w+//}} do
	$0
end
TXT

  tab 'ope', 'open("path/or/url", "w") { |io| .. }', <<-'TXT', file: 'open(-path;or;url-w-)-do-doc-..-end-(ope)'
open(${1:"${2:path/or/url/or/pipe}"}${3/(^[rwab+]+$)|.*/(?1:, ")/}${3:w}${3/(^[rwab+]+$)|.*/(?1:")/}) { |${4:io}| $0 }
TXT

  tab 'opt', 'option(..)', <<-'TXT', file: 'untitled'
opts.on( "-${1:o}", "--${2:long-option-name}"${3/^\s*$|(.*\S.*)/(?1:, )/}${3:String},
         "${4:Option description.}" ) do |${6:opt}|
	$0
end
TXT

  tab 'optp', 'option_parse { .. }', <<-'TXT', file: 'option_parse-{-..-}-(optp)'
require "optparse"

options = {${1::default => "args"}}

ARGV.options do |opts|
	opts.banner = "Usage:  #{File.basename(\$PROGRAM_NAME)} [OPTIONS]${2/^\s*$|(.*\S.*)/(?1: )/}${2:OTHER_ARGS}"

	opts.separator ""
	opts.separator "Specific Options:"

	$0

	opts.separator "Common Options:"

	opts.on( "-h", "--help",
	         "Show this message." ) do
		puts opts
		exit
	end

	begin
		opts.parse!
	rescue
		puts opts
		exit
	end
end

TXT

  tab 'par', 'partition { |e| .. }', <<-'TXT', file: 'partition-{-e-..-}-(par)'
partition { |${1:e}| $0 }
TXT

  tab 'patfh', 'path_from_here( .. )', <<-'TXT', file: 'path_from_here(-__-)'
File.join(File.dirname(__FILE__), *%w[${1:rel path here}])
TXT

  tab 'Pn-', 'PStore.new( .. )', <<-'TXT', file: 'PStore_new(-__-)'
PStore.new(${1:"${2:file_name.pstore}"})
TXT

  tab 'r', 'attr_reader ..', <<-'TXT', file: 'attr_reader-..-(r)'
attr_reader :${0:attr_names}
TXT

  tab 'ran', 'randomize()', <<-'TXT', file: 'randomize-(ran)'
sort_by { rand }
TXT

  tab 'rb', '#!/usr/bin/env ruby -wKU', <<-'TXT', file: '#!;usr;local;bin;ruby-w'
#!/usr/bin/env ruby${TM_RUBY_SWITCHES: -wKU}

TXT

  tab 'rej', 'reject { |e| .. }', <<-'TXT', file: 'reject-{-e-..-}-(rej)'
reject { |${1:e}| $0 }
TXT

  tab 'rep', 'results.report(..) { .. }', <<-'TXT', file: 'results_report(__)-{-__-}'
results.report("${1:name}:") { TESTS.times { $0 } }
TXT

  tab 'req', 'require ".."', <<-'TXT', file: 'require-..-(req)'
require "$0"
TXT

  tab 'reqg-', 'require_gem ".."', <<-'TXT', file: 'require_gem-__'
require "$0"
TXT

  tab 'reve', 'reverse_each { |e| .. }', <<-'TXT', file: 'reverse_each-{-e-..-}-(rea)'
reverse_each { |${1:e}| $0 }
TXT

  tab 'rw', 'attr_accessor ..', <<-'TXT', file: 'attr_accessor-..-(rw)'
attr_accessor :${0:attr_names}
TXT

  tab 'sca', 'scan(/../) { |match| .. }', <<-'TXT', file: 'scan(;..;)-{-match-..-}-(sca)'
scan(/${1:pattern}/) { |${2:match}| $0 }
TXT

  tab 'sel', 'select { |e| .. }', <<-'TXT', file: 'select-{-e-..-}-(sel)'
select { |${1:e}| $0 }
TXT

  tab 'sinc', 'singleton_class()', <<-'TXT'
class << self; self end
TXT

  tab 'sor', 'sort { |a, b| .. }', <<-'TXT', file: 'sort-{-a-b-..-}-(sor)'
sort { |a, b| $0 }
TXT

  tab 'sorb', 'sort_by { |e| .. }', <<-'TXT', file: 'sort_by-{-e-..-}-(sorb)'
sort_by { |${1:e}| $0 }
TXT

  tab 'ste', 'step(2) { |e| .. }', <<-'TXT', file: 'step(2)-{-e-..-}-(ste)'
step(${1:2}) { ${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${2:n}${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'sub', 'sub(/../) { |match| .. }', <<-'TXT', file: 'sub(;..;)-{-match-..-}-(sub)'
sub(/${1:pattern}/) { ${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${2:match}${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'tas', 'task :task_name => [:dependent, :tasks] do .. end', <<-'TXT', file: 'task-task_name-=-[-dependent-tasks]-do-__-end'
desc "${1:Task description}"
task :${2:${3:task_name} => ${4:[:${5:dependent, :tasks}]}} do
	$0
end
TXT

  tab 'tc', 'class .. < Test::Unit::TestCase .. end', <<-'TXT', file: 'class-..-Test;;Unit;;TestCase-..-end-(tc)'
require "test/unit"

require "${1:library_file_name}"

class Test${2:${1/([\w&&[^_]]+)|./\u$1/g}} < Test::Unit::TestCase
	def test_${3:case_name}
		$0
	end
end
TXT

  tab 'tim', 'times { |n| .. }', <<-'TXT', file: 'times-{-n-..-}-(tim)'
times { ${1/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${1:n}${1/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'tra', 'transaction( .. ) { .. }', <<-'TXT', file: 'transaction(-__-)-do-__-end'
transaction${1/(^.*?\S.*)|.*/(?1:\()/}${1:true}${1/(^.*?\S.*)|.*/(?1:\))/} { $0 }
TXT

  tab 'ts', 'require "tc_.." ..', <<-'TXT', file: 'require-tc_..-..-(ts)'
require "test/unit"

require "tc_${1:test_case_file}"
require "tc_${2:test_case_file}"

TXT

  tab 'unif', 'unix_filter { .. }', <<-'TXT', file: 'unix_filter-..-(uni)'
ARGF.each_line$1 do |${2:line}|
	$0
end
TXT

  tab 'unless', 'unless … end', <<-'TXT', file: 'unless-(unless)'
unless ${1:condition}
	$0
end
TXT

  tab 'until', 'until ... end', <<-'TXT', file: 'until-___-end'
until ${1:condition}
	$0
end
TXT

  tab 'upt', 'upto(1.0/0.0) { |n| .. }', <<-'TXT', file: 'upto(1.0;0.0)-{-n-..-}-(upt)'
upto(${1:1.0/0.0}) { ${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${2:n}${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'usai', 'usage_if()', <<-'TXT', file: 'usage_if()-(usai)'
if ARGV.$1
	abort "Usage:  #{\$PROGRAM_NAME} ${2:ARGS_GO_HERE}"
end
TXT

  tab 'usau', 'usage_unless()', <<-'TXT', file: 'usage_unless()-(usau)'
unless ARGV.$1
	abort "Usage:  #{\$PROGRAM_NAME} ${2:ARGS_GO_HERE}"
end
TXT

  tab 'w', 'attr_writer ..', <<-'TXT', file: 'attr_writer-..-(w)'
attr_writer :${0:attr_names}
TXT

  tab 'when', 'when …', <<-'TXT', file: 'when'
when ${1:condition}
	$0
TXT

  tab 'while', 'while ... end', <<-'TXT', file: 'while-___-end'
while ${1:condition}
	$0
end
TXT

  tab 'xml-', 'xmlread(..)', <<-'TXT', file: 'xmlread(__)'
REXML::Document.new(File.read(${1:"${2:path/to/file}"}))
TXT

  tab 'xpa', 'xpath(..) { .. }', <<-'TXT', file: 'xpath(__)-{-__-}'
elements.each(${1:"${2://XPath}"}) do |${3:node}|
	$0
end
TXT

  tab 'y', ':yields:', <<-'TXT', scope: 'source.ruby comment', file: 'yields-RDoc-comment'
 :yields: ${0:arguments}
TXT

  tab 'Yd-', 'YAML.dump(.., file)', <<-'TXT', file: 'YAML.dump(..-file)-(Yd-)'
File.open(${1:"${2:path/to/file}.yaml"}, "w") { |${3:file}| YAML.dump(${4:obj}, ${3:file}) }
TXT

  tab 'Yl-', 'YAML.load(file)', <<-'TXT', file: 'YAML.load(file)-(Yl-)'
File.open(${1:"${2:path/to/file}.yaml"}) { |${3:file}| YAML.load(${3:file}) }
TXT

  tab 'zip', 'zip(enums) { |row| .. }', <<-'TXT', file: 'zip(enums)-{-row-..-}-(zip)'
zip(${1:enums}) { |${2:row}| $0 }
TXT

  tab '{', 'Insert { |variable| … }', "{ ${1/(^(?<var>\\s*[a-z_][a-zA-Z0-9_]*\\s*)(,\\g<var>)*,?\\s*$)|.*/(?1:|)/}${1:variable}${1/(^(?<var>\\s*[a-z_][a-zA-Z0-9_]*\\s*)(,\\g<var>)*,?\\s*$)|.*/(?1:| )/}${2:$TM_SELECTED_TEXT} ", scope: 'source.ruby - string - comment', file: 'open-yield-block-({)'

end