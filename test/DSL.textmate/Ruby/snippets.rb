# encoding: utf-8

snippets do

  default_scope 'source.ruby'
  file_format :textmate

  key "#", 'Embedded Code — #{…}', <<-'TXT', scope: 'B:(string.quoted.double.ruby|string.interpolated.ruby) - string source', uuid: 'EEE6D060-C5A0-400D-A2E0-0835013C5365', file: 'embed string variable'
#{${1:$TM_SELECTED_TEXT}}
TXT

  key "^.", 'Hash Pointer — =>', " => ", uuid: 'B9E3A6DF-875D-11D9-897C-000393CBCE2E', file: 'hash pointer'

  key "^>", 'Insert ERb’s <% .. %> or <%= .. %>', <<-'TXT', scope: 'text.html.erb, source.yaml', uuid: 'FDFABCB9-DF58-4469-AE11-5407A4FF4D70', file: "Insert ERb's ˂% __ %˃ or ˂%= __ %˃"
<%= ${0:$TM_SELECTED_TEXT} %>
TXT

  tab '#', 'Add ‘# =>’ Marker', "# => ", uuid: '88BC3896-DC39-4307-A271-21D33340F15A', file: "Add '# =˃' Marker"

  tab ':', 'Hash Pair — :key => "value"', <<-'TXT', uuid: '840B9C4C-7037-4C3B-9028-EB9DC75EDB3E', file: 'hash pair (˸)'
:${1:key} => ${2:"${3:value}"}${4:, }
TXT

  tab '=b', 'New Block', <<-'TXT', uuid: '05984208-D559-4C04-A69C-2019361A985A', file: 'RDoc documentation block'
`[[ $TM_LINE_INDEX != 0 ]] && echo; echo`=begin rdoc
	$0
=end
TXT

  tab 'all', 'all? { |e| .. }', <<-'TXT', uuid: '07D1F987-7CDB-4EAD-B64A-27A93051700E', file: 'allʔ { ¦e¦ .. }  (all)'
all? { |${1:e}| $0 }
TXT

  tab 'am', 'alias_method ..', <<-'TXT', uuid: '988C8AEF-FC71-4455-9C4F-9338C05685A4', file: 'alias_method ..  (am)'
alias_method :${1:new_name}, :${0:old_name}
TXT

  tab 'any', 'any? { |e| .. }', <<-'TXT', uuid: 'A3B9B76B-2BC5-425C-AB24-9FAAFC375798', file: 'anyʔ { ¦e¦ .. }  (any)'
any? { |${1:e}| $0 }
TXT

  tab 'app', 'application { .. }', <<-'TXT', uuid: 'E16D24D2-CC7E-4786-BE0B-1725FC865D78', file: 'application_code ..  (app)'
if __FILE__ == \$PROGRAM_NAME
	$0
end
TXT

  tab 'Array', 'Array.new(10) { |i| .. }', <<-'TXT', uuid: 'DAE6A754-D906-4763-B816-CE67125CEF08', file: 'Array.new(10) { ¦i¦ .. }  (Arr)'
Array.new(${1:10}) { ${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${2:i}${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'as', 'assert(..)', <<-'TXT', uuid: 'B32C147D-44A6-478A-9D5D-189D7831E9A7', file: 'assert(..)  (as)'
assert`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb"`${1:test}, "${0:Failure message.}"`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb" end`
TXT

  tab 'ase', 'assert_equal(..)', <<-'TXT', uuid: '43A61A22-6BEE-4997-961C-1CDE739C05FE', file: 'assert_equal'
assert_equal`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb"`${1:expected}, ${0:actual}`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb" end`
TXT

  tab 'asid', 'assert_in_delta(..)', <<-'TXT', uuid: '429D0EF5-580D-4166-8F79-713DE96B77F1', file: 'assert_in_delta(..)  (asid)'
assert_in_delta`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb"`${1:expected_float}, ${2:actual_float}, ${0:2 ** -20}`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb" end`
TXT

  tab 'asio', 'assert_instance_of(..)', <<-'TXT', uuid: '0E831E03-67E1-4357-8323-C60685C23C4F', file: 'assert_instance_of(..)  (asio)'
assert_instance_of`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb"`${1:ExpectedClass}, ${0:actual_instance}`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb" end`
TXT

  tab 'asko', 'assert_kind_of(..)', <<-'TXT', uuid: '671F05E2-D9CC-485E-BB1B-B13EF20FAC65', file: 'assert_kind_of(..)  (asko)'
assert_kind_of`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb"`${1:ExpectedKind}, ${0:actual_instance}`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb" end`
TXT

  tab 'asm', 'assert_match(..)', <<-'TXT', uuid: '711ED6C3-0F18-41FB-9A7D-3094BB319A85', file: 'assert_match(..)  (asm)'
assert_match`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb"`/${1:expected_pattern}/, ${0:actual_string}`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb" end`
TXT

  tab 'asn', 'assert_nil(..)', <<-'TXT', uuid: '4C79256C-480A-459C-BDE8-BB0D972811DB', file: 'assert_nil(..)  (asn)'
assert_nil`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb"`${0:instance}`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb" end`
TXT

  tab 'asne', 'assert_not_equal(..)', <<-'TXT', uuid: 'A243E96F-DC21-4AA0-B340-13A7674F6AFF', file: 'assert_not_equal(..)  (asne)'
assert_not_equal`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb"`${1:unexpected}, ${0:actual}`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb" end`
TXT

  tab 'asnm', 'assert_no_match(..)', <<-'TXT', uuid: 'A072BB1E-1DD1-45D3-9346-8CA3BA21B364', file: 'assert_no_match(..)  (asnm)'
assert_no_match`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb"`/${1:unexpected_pattern}/, ${0:actual_string}`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb" end`
TXT

  tab 'asnn', 'assert_not_nil(..)', <<-'TXT', uuid: '79FEC3CC-2A40-4611-9A85-ECDB22FE0701', file: 'assert_not_nil(..)  (asnn)'
assert_not_nil`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb"`${0:instance}`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb" end`
TXT

  tab 'asnr', 'assert_nothing_raised(..) { .. }', <<-'TXT', uuid: '82F8EEE0-2452-411E-8102-7BFDDBCA2E72', file: 'assert_nothing_raised(..) { .. }  (asnr)'
assert_nothing_raised(${1:Exception}) { $0 }
TXT

  tab 'asns', 'assert_not_same(..)', <<-'TXT', uuid: 'F91C25EC-EC76-498B-BFB5-FDA8F57C5875', file: 'assert_not_same(..)  (asns)'
assert_not_same`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb"`${1:unexpected}, ${0:actual}`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb" end`
TXT

  tab 'asnt', 'assert_nothing_thrown { .. }', <<-'TXT', uuid: '33639D7A-BD8C-4396-9C44-307B8AC87C9E', file: 'assert_nothing_thrown { .. }  (asnt)'
assert_nothing_thrown { $0 }
TXT

  tab 'aso', 'assert_operator(..)', <<-'TXT', uuid: '1B925A4D-8EE4-442B-9254-293599F5717F', file: 'assert_operator(..)  (aso)'
assert_operator`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb"`${1:left}, :${2:operator}, ${0:right}`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb" end`
TXT

  tab 'asr', 'assert_raise(..) { .. }', <<-'TXT', uuid: '68B21F6F-5D89-41FA-A19C-F29C2F912B4E', file: 'assert_raise(..) { .. }  (asr)'
assert_raise(${1:Exception}) { $0 }
TXT

  tab 'asrt', 'assert_respond_to(..)', <<-'TXT', uuid: '09A11FDA-49FC-4466-8787-8D1D5D111A89', file: 'assert_respond_to(..)  (asrt)'
assert_respond_to`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb"`${1:object}, :${0:method}`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb" end`
TXT

  tab 'ass', 'assert_same(..)', <<-'TXT', uuid: '29340695-E426-4F77-8CF7-C59360A549F4', file: 'assert_same(..)  (ass)'
assert_same`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb"`${1:expected}, ${0:actual}`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb" end`
TXT

  tab 'ass', 'assert_send(..)', <<-'TXT', uuid: '7850AD5C-A90D-4E2C-A931-EADFF8D3D9A3', file: 'assert_send(..)  (ass)'
assert_send`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb"`[${1:object}, :${2:message}, ${0:args}]`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb" end`
TXT

  tab 'ast', 'assert_throws(..) { .. }', <<-'TXT', uuid: '05655BD8-23C6-445F-BFD1-420BF25C3030', file: 'assert_throws(..) { .. }  (ast)'
assert_throws(:${1:expected}) { $0 }
TXT

  tab 'begin', 'begin … rescue … end', <<-'TXT', scope: 'source.ruby - comment', uuid: '0F940CBC-2173-49FF-B6FD-98A62863F8F2', file: 'Wrap in Begin … Rescue … End', key_equivalent: "^W"
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}begin
	${3:${TM_SELECTED_TEXT/(\A.*)|(.+)|\n\z/(?1:$0:(?2:\t$0))/g}}
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}rescue ${1:Exception}${2/.+/ => /}${2:e}
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}	$0
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}end

TXT

  tab 'bm-', 'Benchmark.bmbm do .. end', <<-'TXT', uuid: '942F20E2-C40A-44B8-A3F2-99AAC68CB534', file: 'Benchmark_bmbm(__) do __ end'
TESTS = ${1:10_000}
Benchmark.bmbm do |results|
  $0
end
TXT

  tab 'case', 'case … end', <<-'TXT', uuid: '667083EE-62C3-11D9-B8CF-000D93589AF6', file: '080 ruby case'
case ${1:object}
when ${2:condition}
	$0
end
TXT

  tab 'cl', 'classify { |e| .. }', <<-'TXT', uuid: '5DA9E1E8-2C54-420A-9B84-B040A1AF2B9E', file: 'classify { ¦e¦ .. }  (clas)'
classify { |${1:e}| $0 }
TXT

  tab 'cla', 'class .. < ParentClass .. initialize .. end', <<-'TXT', uuid: '0CCBE04E-F4E2-4E55-9506-7DE67ACF8388'
class ${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}} < ${2:ParentClass}
	def initialize${3/(^.*?\S.*)|.*/(?1:\()/}${3:args}${3/(^.*?\S.*)|.*/(?1:\))/}
		$0
	end


end
TXT

  tab 'cla', 'class .. end', <<-'TXT', uuid: 'BF487539-8085-4FF4-8601-1AD20FABAEDC', file: 'class .. end  (cla)'
class ${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}}
	$0
end
TXT

  tab 'cla', 'class .. initialize .. end', <<-'TXT', uuid: '83EED068-8C1C-4BAF-9893-902DC00616AB'
class ${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}}
	def initialize${2/(^.*?\S.*)|.*/(?1:\()/}${2:args}${2/(^.*?\S.*)|.*/(?1:\))/}
		$0
	end


end
TXT

  tab 'cla', 'class << self .. end', <<-'TXT', uuid: 'C7AAAE45-487A-4B61-8962-D47675AAC05F', file: 'class ˂˂ self __ end'
class << ${1:self}
	$0
end
TXT

  tab 'cla', 'class BlankSlate .. initialize .. end', <<-'TXT', uuid: 'E98FB8F9-7302-431D-8BF2-275A68A6126C', file: 'class .. instance_methods .. undef .. initialize .. end  (class)'
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

  tab 'cla', 'ClassName = Struct .. do .. end', <<-'TXT', uuid: '05DFF82C-5A29-4EBD-93FE-C165FFFB5EA8', file: 'class .. ˂ Struct .. initialize .. end'
${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}} = Struct.new(:${2:attr_names}) do
	def ${3:method_name}
		$0
	end


end
TXT

  tab 'cla-', 'class .. < DelegateClass .. initialize .. end', <<-'TXT', uuid: 'AFE1D078-EA16-45F5-AD8A-FAC1B523D861', file: 'class .. ˂ DelegateClass .. initialize .. end  (class)'
class ${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}} < DelegateClass(${2:ParentClass})
	def initialize${3/(^.*?\S.*)|.*/(?1:\()/}${3:args}${3/(^.*?\S.*)|.*/(?1:\))/}
		super(${4:del_obj})

		$0
	end


end
TXT

  tab 'clafn', 'class_from_name()', <<-'TXT', uuid: '2DBEE50B-3097-4A57-AB48-3586CF392D8B', file: 'class_from_name()  (clafn)'
split("::").inject(Object) { |par, const| par.const_get(const) }
TXT

  tab 'col', 'collect { |e| .. }', <<-'TXT', uuid: '669A86AD-936F-4EDA-8E4E-6863804072DA', file: 'collect { ¦e¦ .. }  (col)'
collect { |${1:e}| $0 }
TXT

  tab 'Comp', 'include Comparable ..', <<-'TXT', uuid: '6C9D6B3D-D8E9-4606-9534-577C8D21FFF6', file: 'include Comparable ..  (Comp)'
include Comparable

def <=>(other)
	$0
end
TXT

  tab 'deec', 'deep_copy(..)', <<-'TXT', uuid: '0BA2B2F1-E767-4A03-9791-0AC0183251F1', file: 'deep_copy(..)  (dee)'
Marshal.load(Marshal.dump(${0:obj_to_copy}))
TXT

  tab 'def', 'def … end', <<-'TXT', uuid: '4E9A7A73-875C-11D9-897C-000393CBCE2E', file: 'def end'
def ${1:method_name}
	$0
end
TXT

  tab 'defd', 'def_delegator ..', <<-'TXT', uuid: 'C44ED391-614F-4BA2-BB0F-87668EEA9954', file: 'def_delegator .. (defd)'
def_delegator :${1:@del_obj}, :${2:del_meth}, :${3:new_name}
TXT

  tab 'defds', 'def_delegators ..', <<-'TXT', uuid: '4A6EFD6B-88E2-4822-AD48-03460EDBC796', file: 'def_delegators .. (defds)'
def_delegators :${1:@del_obj}, :${0:del_methods}
TXT

  tab 'defi', 'def initialize .. end', <<-'TXT', uuid: '4E9D15B5-65D6-4A9A-9DEC-DE041D68C06F', file: 'def initialize __ end'
def initialize${1/.+/(/}${1:args}${1/.+/)/}
  $0
end
TXT

  tab 'defm', 'define_method ... end', <<-'TXT', uuid: '7BC1E159-0C90-4B0D-8808-80165C11F59C', file: 'define_method ___ end'
define_method :${1:method_name} do${2/.+/ |/}${2:args}${2/.+/|/}
  $0
end
TXT

  tab 'defmm', 'def method_missing .. end', <<-'TXT', uuid: '87D5F8AD-8DA6-4AED-A0D8-B51CAC980445', file: 'def method_missing .. end  (mm)'
def method_missing(meth, *args, &blk)
	$0
end
TXT

  tab 'defs', 'def self .. end', <<-'TXT', uuid: '7C6E88FA-CA0E-4110-8C75-A94E54286A75', file: 'def self .. end  (defs)'
def self.${1:class_method_name}
	$0
end
TXT

  tab 'deft', 'def test_ .. end', <<-'TXT', uuid: '00F66D41-25AF-4597-B67D-E540965A5222', file: 'def test_ .. end  (t)'
def test_${1:case_name}
	$0
end
TXT

  tab 'deli', 'delete_if { |e| .. }', <<-'TXT', uuid: '263C94DC-63CF-4BA3-9692-C5582CA8F1AB', file: 'delete_if { ¦e¦ .. }  (deli)'
delete_if { |${1:e}| $0 }
TXT

  tab 'det', 'detect { |e| .. }', <<-'TXT', uuid: '6C6B9849-9631-49FF-A9F9-F0E94A1512C5', file: 'detect { ¦e¦ .. }  (det)'
detect { |${1:e}| $0 }
TXT

  tab 'Dir', 'Dir.glob("..") { |file| .. }', <<-'TXT', uuid: '332AA973-AA71-48CB-AEE9-1D71E11019AC', file: 'Dir.glob(ʺ..ʺ) do ¦file¦ .. end  (Dir)'
Dir.glob(${1:"${2:dir/glob/*}"}) { |${3:file}| $0 }
TXT

  tab 'Dir', 'Dir[".."]', <<-'TXT', uuid: '8EBBB26F-980E-404E-8366-74E5772298F6', file: 'Dir[ʺ__ʺ]'
Dir[${1:"${2:glob/**/*.rb}"}]
TXT

  tab 'dir', 'directory()', <<-'TXT', uuid: '678BDB83-FBBD-4E8E-BE0B-E1A98AECB247'
File.dirname(__FILE__)
TXT

  tab 'do', 'Insert do |variable| … end', <<-'TXT', uuid: '4B72C5C3-6CA7-41AC-B2F9-51DEA25D469E', file: 'do ¦obj¦ .. end (doo)'
do${1/(^(?<var>\s*[a-z_][a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1: |)/}${1:variable}${1/(^(?<var>\s*[a-z_][a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}
	$0
end
TXT

  tab 'dow', 'downto(0) { |n| .. }', <<-'TXT', uuid: '4991BB86-736E-4758-B9B2-E4FA90B9368F', file: 'downto(0) { ¦n¦ .. }  (dow)'
downto(${1:0}) { ${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${2:n}${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'ea', 'each { |e| .. }', <<-'TXT', uuid: 'ECBA4CA0-275F-460E-85BE-E82FEA2E2B26', file: 'each { ¦e¦ .. }  (ea)'
each { |${1:e}| $0 }
TXT

  tab 'eab', 'each_byte { |byte| .. }', <<-'TXT', uuid: '338EC03D-3FF4-4435-94E8-1CEF20CEC75D', file: 'each_byte { ¦byte¦ .. }  (eab)'
each_byte { |${1:byte}| $0 }
TXT

  tab 'eac-', 'each_char { |chr| .. }', <<-'TXT', uuid: 'FDD73070-6D32-4301-A86A-C55B77C3D8ED', file: 'each_char { ¦chr¦ .. }  (eac-)'
each_char { |${1:chr}| $0 }
TXT

  tab 'eac-', 'each_cons(..) { |group| .. }', <<-'TXT', uuid: '3C04589C-5127-478E-97B3-CA7DD2EA7ECD', file: 'each_cons(..) { ¦group¦ .. }  (eac-)'
each_cons(${1:2}) { |${2:group}| $0 }
TXT

  tab 'eai', 'each_index { |i| .. }', <<-'TXT', uuid: '689120C9-AB40-4081-8268-9362E00FA4A0', file: 'each_index { ¦i¦ .. }  (eai)'
each_index { |${1:i}| $0 }
TXT

  tab 'eak', 'each_key { |key| .. }', <<-'TXT', uuid: 'E54F7077-3C33-4B53-A4F7-21E16132D3AD', file: 'each_key { ¦key¦ .. }  (eak)'
each_key { |${1:key}| $0 }
TXT

  tab 'eal', 'each_line { |line| .. }', <<-'TXT', uuid: '02913388-EE8E-4C55-AC94-94F3D751F47E', file: 'each_line { ¦line¦ .. }  (eal)'
each_line$1 { |${2:line}| $0 }
TXT

  tab 'eap', 'each_pair { |name, val| .. }', <<-'TXT', uuid: '7A3CECED-452B-438E-A5C6-95B6BDC43243', file: 'each_pair { ¦name, val¦ .. }  (eap)'
each_pair { |${1:name}, ${2:val}| $0 }
TXT

  tab 'eas-', 'each_slice(..) { |group| .. }', <<-'TXT', uuid: 'CD748479-D2A4-4AB5-95BD-4C89512BA210', file: 'each_slice { ¦group¦ .. }  (eas)'
each_slice(${1:2}) { |${2:group}| $0 }
TXT

  tab 'eav', 'each_value { |val| .. }', <<-'TXT', uuid: '844DBD70-BC23-4FBF-9C18-F4A610239DF2', file: 'each_value { ¦val¦ .. }  (eav)'
each_value { |${1:val}| $0 }
TXT

  tab 'eawi', 'each_with_index { |e, i| .. }', <<-'TXT', uuid: '1DD13CF5-39C0-4F10-B655-56DACEBC7F94', file: 'each_with_index { ¦e, i¦ .. }  (eawi)'
each_with_index { |${1:e}, ${2:i}| $0 }
TXT

  tab 'elsif', 'elsif ...', <<-'TXT', uuid: 'CD1609FA-47DA-4EE4-9C5B-5C56D953F5B1', file: 'elsif ___'
elsif ${1:condition}
	$0
TXT

  tab 'end', '__END__', <<-'TXT', uuid: '451A0596-1F72-4AFB-AF2F-45900FABB0F7'
__END__

TXT

  tab 'Enum', 'include Enumerable ..', <<-'TXT', uuid: 'AAD5D511-6BE7-41DA-8F2B-1593A48FBB08', file: 'include Enumerable ..  (Enum)'
include Enumerable

def each(&block)
	$0
end
TXT

  tab 'fet', 'fetch(name) { |key| .. }', <<-'TXT', uuid: '1F72122A-35AD-4BA1-AA01-889A10319666', file: 'fetch(name) { ¦key¦ .. }  (fet)'
fetch(${1:name}) { ${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${2:key}${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'fil', 'fill(range) { |i| .. }', <<-'TXT', uuid: '6021BBDC-4AAD-447B-A0C2-A4BB31721558', file: 'fill(range) { ¦i¦ .. }  (fil)'
fill(${1:range}) { ${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${2:i}${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'File', 'File.foreach ("..") { |line| .. }', <<-'TXT', uuid: '8F594E5E-6F46-4E98-B5FB-1C8F3BA9828F', file: 'File.foreach (ʺ..ʺ) do ¦line¦ .. end  (File)'
File.foreach(${1:"${2:path/to/file}"}) { |${3:line}| $0 }
TXT

  tab 'File', 'File.open("..") { |file| .. }', <<-'TXT', uuid: '397FA09F-A30F-4EE4-920C-318D5004EE97', file: 'File_open(ʺ__ʺ) { ¦file¦ __ }'
File.open(${1:"${2:path/to/file}"}${3/(^[rwab+]+$)|.*/(?1:, ")/}${3:w}${3/(^[rwab+]+$)|.*/(?1:")/}) { |${4:file}| $0 }
TXT

  tab 'File', 'File.read("..")', <<-'TXT', uuid: '50C56AC8-48F3-42A0-AF10-8164464AFAEF', file: 'File_read(ʺ__ʺ)'
File.read(${1:"${2:path/to/file}"})
TXT

  tab 'fin', 'find { |e| .. }', <<-'TXT', uuid: 'E23FE534-8061-4828-98A5-46270B6910B0', file: 'find { ¦e¦ .. }  (fin)'
find { |${1:e}| $0 }
TXT

  tab 'fina', 'find_all { |e| .. }', <<-'TXT', uuid: '197709C5-8382-4A59-B6D7-31A0CC0F23B7', file: 'find_all { ¦e¦ .. }  (fina)'
find_all { |${1:e}| $0 }
TXT

  tab 'flao', 'flatten_once()', <<-'TXT', uuid: '3DDB99C4-486D-4C11-A217-5680FDD8EC19', file: 'flatten_once  (fla)'
inject(Array.new) { |${1:arr}, ${2:a}| ${1:arr}.push(*${2:a}) }
TXT

  tab 'flu', 'flunk(..)', <<-'TXT', uuid: 'DB457094-1AC9-4856-AEFC-43A9576B6775', file: 'flunk(..)  (fl)'
flunk`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb"`"${1:Failure message.}"`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb" end`$0
TXT

  tab 'Forw-', 'extend Forwardable', <<-'TXT', uuid: '7F46C90A-595B-4B83-A4F7-058F63CE4218', file: 'extend Forwardable  (Forw)'
extend Forwardable
TXT

  tab 'gre', 'grep(/pattern/) { |match| .. }', <<-'TXT', uuid: '9D9E7BA3-8C5D-4532-83EA-326358C2F5BB', file: 'grep(;pattern;) { ¦match¦ .. }  (gre)'
grep(${1:/${2:pattern}/}) { |${3:match}| $0 }
TXT

  tab 'gsu', 'gsub(/../) { |match| .. }', <<-'TXT', uuid: '2514FC26-468C-4D08-A788-494A444C4286', file: 'gsub(;..;) { ¦match¦ .. }  (gsu)'
gsub(/${1:pattern}/) { ${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${2:match}${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'Hash', 'Hash.new { |hash, key| hash[key] = .. }', <<-'TXT', uuid: 'E16EE658-1CA0-4950-954B-B962E50B754F', file: 'Hash.new { ¦hash, key¦ hash[key] = .. }  (Has)'
Hash.new { |${1:hash}, ${2:key}| ${1:hash}[${2:key}] = $0 }
TXT

  tab 'if', 'if … end', <<-'TXT', uuid: '6670835F-62C3-11D9-B8CF-000D93589AF6', file: '070 ruby if'
if ${1:condition}
	$0
end
TXT

  tab 'ife', 'if … else … end', <<-'TXT', uuid: '667082E6-62C3-11D9-B8CF-000D93589AF6', file: '060 ruby if else'
if ${1:condition}
	$2
else
	$3
end
TXT

  tab 'inj', 'inject(init) { |mem, var| .. }', <<-'TXT', uuid: 'B563E0D7-513D-49B4-9733-1B04A6F25A74', file: 'inject(init) { ¦mem, var¦ .. }  (inj)'
inject${1/.+/(/}${1:init}${1/.+/)/} { |${2:mem}, ${3:var}| $0 }
TXT

  tab 'lam', 'lambda { |args| .. }', <<-'TXT', uuid: '21E75321-0CF7-45E8-A297-BCC7C0DDDD15', file: 'lambda { ¦args¦ .. }  (lam)'
lambda { ${1/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${1:args}${1/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'loo', 'loop { .. }', <<-'TXT', uuid: '567E3D18-BF2B-4379-8927-2777EC9F495E', file: 'loop { __ }'
loop { $0 }
TXT

  tab 'map', 'map { |e| .. }', <<-'TXT', uuid: '5A3754FC-43A3-462B-AB42-E3E951872E6F', file: 'map { ¦e¦ .. }  (map)'
map { |${1:e}| $0 }
TXT

  tab 'mapwi-', 'map_with_index { |e, i| .. }', <<-'TXT', uuid: 'BD4CFD7B-1AC0-4569-9BDA-FD491F41F4E6', file: 'map_with_index { ¦e, i¦ .. }  (mapwi)'
enum_with_index.map { |${1:e}, ${2:i}| $0 }
TXT

  tab 'max', 'max { |a, b| .. }', <<-'TXT', uuid: '98182B9E-7C61-4824-BE4C-9CD69C816037', file: 'max { ¦a, b¦ .. }  (max)'
max { |a, b| $0 }
TXT

  tab 'Md', 'Marshal.dump(.., file)', <<-'TXT', uuid: '0CB48BCA-3F6E-4AE0-85BC-08A1D2508216', file: 'Marshal.dump(obj, file)  (Md)'
File.open(${1:"${2:path/to/file}.dump"}, "wb") { |${3:file}| Marshal.dump(${4:obj}, ${3:file}) }
TXT

  tab 'min', 'min { |a, b| .. }', <<-'TXT', uuid: 'CB03D11A-7204-48D0-92C1-E109034403E7', file: 'min { ¦a, b¦ .. }  (min)'
min { |a, b| $0 }
TXT

  tab 'Ml', 'Marshal.load(obj)', <<-'TXT', uuid: '20AAD0BC-075D-4EC0-9057-E3E5E62C4125', file: 'Marshal.load(obj)  (Ml)'
File.open(${1:"${2:path/to/file}.dump"}, "rb") { |${3:file}| Marshal.load(${3:file}) }
TXT

  tab 'mod', 'module .. ClassMethods .. end', <<-'TXT', uuid: 'A71A18CF-2D71-4BFF-AA0C-D9B8C59BC4EB'
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

  tab 'mod', 'module .. end', <<-'TXT', uuid: '2B73EC5F-06D2-460C-A14F-6FA05AFCF0CC'
module ${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}}
	$0
end
TXT

  tab 'mod', 'module .. module_function .. end', <<-'TXT', uuid: '0E85EC81-2FAB-4648-B590-119CC1BB6E41'
module ${1:${TM_FILENAME/(?:\A|_)([A-Za-z0-9]+)(?:\.rb)?/(?2::\u$1)/g}}
	module_function

	$0
end
TXT

  tab 'nam', 'namespace :.. do .. end', <<-'TXT', uuid: '05EE1046-5ED7-48F5-8693-1F066163B2F4', file: 'namespace ˸__ do __ end'
namespace :${1:${TM_FILENAME/\.\w+//}} do
	$0
end
TXT

  tab 'ope', 'open("path/or/url", "w") { |io| .. }', <<-'TXT', uuid: '418F1817-255F-430A-B09A-222964ED66A7', file: 'open(ʺpath;or;urlʺ, ʺwʺ) do ¦doc¦ .. end (ope)'
open(${1:"${2:path/or/url/or/pipe}"}${3/(^[rwab+]+$)|.*/(?1:, ")/}${3:w}${3/(^[rwab+]+$)|.*/(?1:")/}) { |${4:io}| $0 }
TXT

  tab 'opt', 'option(..)', <<-'TXT', uuid: '209D5D73-7A77-4931-A158-3FB6D5B48A88', file: 'untitled'
opts.on( "-${1:o}", "--${2:long-option-name}"${3/^\s*$|(.*\S.*)/(?1:, )/}${3:String},
         "${4:Option description.}" ) do |${6:opt}|
	$0
end
TXT

  tab 'optp', 'option_parse { .. }', <<-'TXT', uuid: 'C3C48948-4F49-484E-A8DE-DEB44723099E', file: 'option_parse { .. }  (optp)'
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

  tab 'par', 'partition { |e| .. }', <<-'TXT', uuid: '52B8BF63-F09E-4789-8407-06168A8AE666', file: 'partition { ¦e¦ .. }  (par)'
partition { |${1:e}| $0 }
TXT

  tab 'pas', 'pass(..)', <<-'TXT', uuid: 'F46A4687-E52D-40D2-9072-C215645EDBC6', file: 'pass(__)'
pass`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb"`"${1:Message.}"`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb" end`$0
TXT

  tab 'patfh', 'path_from_here( .. )', <<-'TXT', uuid: 'A4E89D97-D5ED-48BB-B5FF-1BFB79211FCD', file: 'path_from_here( __ )'
File.join(File.dirname(__FILE__), *%w[${1:rel path here}])
TXT

  tab 'Pn-', 'PStore.new( .. )', <<-'TXT', uuid: '5B46ECFD-23A4-4F0C-9951-F64C19C72C2B', file: 'PStore_new( __ )'
PStore.new(${1:"${2:file_name.pstore}"})
TXT

  tab 'r', 'attr_reader ..', <<-'TXT', uuid: 'A150C2D8-25B3-4339-BC92-8A0160A70486', file: 'attr_reader ..  (r)'
attr_reader :${0:attr_names}
TXT

  tab 'ran', 'randomize()', <<-'TXT', uuid: 'B0CE57EC-FB2E-4482-8CCE-448DC2588715', file: 'randomize  (ran)'
sort_by { rand }
TXT

  tab 'rb', '#!/usr/bin/env ruby -wKU', <<-'TXT', scope: 'source.ruby, L:dyn.caret.begin.document', uuid: 'A05CBDD6-845D-45EB-94FB-F8787F5456BE', file: '#!;usr;local;bin;ruby -w'
#!/usr/bin/env ruby${TM_RUBY_SWITCHES: -wKU}

TXT

  tab 'rej', 'reject { |e| .. }', <<-'TXT', uuid: 'B79B9DAB-ABEF-44F6-BF7E-635E7BA11DFD', file: 'reject { ¦e¦ .. }  (rej)'
reject { |${1:e}| $0 }
TXT

  tab 'rep', 'results.report(..) { .. }', <<-'TXT', uuid: '1C60D589-DD46-4109-90CA-6B34AEA2F298', file: 'results_report(__) { __ }'
results.report("${1:name}:") { TESTS.times { $0 } }
TXT

  tab 'req', 'require ".."', <<-'TXT', uuid: '97DE939B-D243-4D5C-B953-1C9090912E7C', file: 'require ʺ..ʺ  (req)'
require "$0"
TXT

  tab 'reqg-', 'require_gem ".."', <<-'TXT', uuid: '34FEBB9F-73CD-4DD4-A0A3-1CF2A5E3DE78', file: 'require_gem ʺ__ʺ'
require "$0"
TXT

  tab 'reve', 'reverse_each { |e| .. }', <<-'TXT', uuid: 'F3C5F719-EF03-4FF7-A777-4A8402FE3B6B', file: 'reverse_each { ¦e¦ .. }  (rea)'
reverse_each { |${1:e}| $0 }
TXT

  tab 'rw', 'attr_accessor ..', <<-'TXT', uuid: 'D7A7D3C9-1714-4C50-8CC0-D83A03883E8F', file: 'attr_accessor ..  (rw)'
attr_accessor :${0:attr_names}
TXT

  tab 'sca', 'scan(/../) { |match| .. }', <<-'TXT', uuid: '66802933-B49F-479B-9DF9-1D898FF1FA90', file: 'scan(;..;) { ¦match¦ .. }  (sca)'
scan(/${1:pattern}/) { |${2:match}| $0 }
TXT

  tab 'sel', 'select { |e| .. }', <<-'TXT', uuid: '4E409AA4-E7D4-46B7-A4E9-E32F992B33E9', file: 'select { ¦e¦ .. }  (sel)'
select { |${1:e}| $0 }
TXT

  tab 'sinc', 'singleton_class()', <<-'TXT', uuid: 'B46D35B8-5DEB-4C10-A110-BA1965A2EB9C'
class << self; self end
TXT

  tab 'ski', 'skip(..)', <<-'TXT', uuid: 'B186BAC0-D981-41AC-B8F4-34BAD2BC4EE6', file: 'skip(__)'
skip`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb"`"${1:Message.}"`"$TM_BUNDLE_SUPPORT/bin/snippet_paren.rb" end`$0
TXT

  tab 'sor', 'sort { |a, b| .. }', <<-'TXT', uuid: '9E0B4D4B-2956-4B3A-800A-3D8CE54E66BF', file: 'sort { ¦a, b¦ .. }  (sor)'
sort { |a, b| $0 }
TXT

  tab 'sorb', 'sort_by { |e| .. }', <<-'TXT', uuid: 'BA9440C9-36C3-4031-BB61-67B581D5B179', file: 'sort_by { ¦e¦ .. }  (sorb)'
sort_by { |${1:e}| $0 }
TXT

  tab 'ste', 'step(2) { |e| .. }', <<-'TXT', uuid: '36853A11-0307-4AE7-B835-7CE6358717A5', file: 'step(2) { ¦e¦ .. }  (ste)'
step(${1:2}) { ${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${2:n}${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'sub', 'sub(/../) { |match| .. }', <<-'TXT', uuid: '8021944C-CEA4-4983-8D1C-78D18D4004A1', file: 'sub(;..;) { ¦match¦ .. }  (sub)'
sub(/${1:pattern}/) { ${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${2:match}${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'tas', 'task :task_name => [:dependent, :tasks] do .. end', <<-'TXT', uuid: 'A7BF14E6-59B1-42E5-8755-8A72BF13685E', file: 'task ˸task_name =˃ [˸dependent, ˸tasks] do __ end'
desc "${1:Task description}"
task :${2:${3:task_name} => ${4:[:${5:dependent, :tasks}]}} do
	$0
end
TXT

  tab 'tc', 'class .. < Test::Unit::TestCase .. end', <<-'TXT', uuid: '31D1F145-33AB-4441-BA11-4D1C46928C4C', file: 'class .. ˂ Test;;Unit;;TestCase .. end  (tc)'
require "test/unit"

require "${1:library_file_name}"

class Test${2:${1/([\w&&[^_]]+)|./\u$1/g}} < Test::Unit::TestCase
	def test_${3:case_name}
		$0
	end
end
TXT

  tab 'tim', 'times { |n| .. }', <<-'TXT', uuid: '206D54AF-E67A-4DF0-B7F4-3D42FEB81685', file: 'times { ¦n¦ .. }  (tim)'
times { ${1/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${1:n}${1/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'tra', 'transaction( .. ) { .. }', <<-'TXT', uuid: '46BF99AD-E172-4D49-BCF7-072F4730E1D9', file: 'transaction( __ ) do __ end'
transaction${1/(^.*?\S.*)|.*/(?1:\()/}${1:true}${1/(^.*?\S.*)|.*/(?1:\))/} { $0 }
TXT

  tab 'ts', 'require "tc_.." ..', <<-'TXT', uuid: '5297FD0C-98B1-4514-BBD1-1516810BECA6', file: 'require ʺtc_..ʺ ..  (ts)'
require "test/unit"

require "tc_${1:test_case_file}"
require "tc_${2:test_case_file}"

TXT

  tab 'unif', 'unix_filter { .. }', <<-'TXT', uuid: '8CEF9711-88D5-4202-AFB9-29EF4EFD25C1', file: 'unix_filter .. (uni)'
ARGF.each_line$1 do |${2:line}|
	$0
end
TXT

  tab 'unless', 'unless … end', <<-'TXT', uuid: 'F53E098D-D08E-4CE2-990A-B0BD70E60614', file: 'unless (unless)'
unless ${1:condition}
	$0
end
TXT

  tab 'until', 'until ... end', <<-'TXT', uuid: '488B387C-50C0-4B2D-9260-5A7E7EAF9B42', file: 'until ___ end'
until ${1:condition}
	$0
end
TXT

  tab 'upt', 'upto(1.0/0.0) { |n| .. }', <<-'TXT', uuid: '51954118-81D7-42B6-9A10-BE23D8B9FFE2', file: 'upto(1.0;0.0) { ¦n¦ .. }  (upt)'
upto(${1:1.0/0.0}) { ${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}${2:n}${2/(^(?<var>\s*(?:\*|\*?[a-z_])[a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:| )/}$0 }
TXT

  tab 'usai', 'usage_if()', <<-'TXT', uuid: '21C0D711-F32A-4665-AA0D-B136F9DD3945', file: 'usage_if()  (usai)'
if ARGV.$1
	abort "Usage:  #{\$PROGRAM_NAME} ${2:ARGS_GO_HERE}"
end
TXT

  tab 'usau', 'usage_unless()', <<-'TXT', uuid: '49D69DEC-6991-49F4-8D9B-BA60BFDD3D17', file: 'usage_unless()  (usau)'
unless ARGV.$1
	abort "Usage:  #{\$PROGRAM_NAME} ${2:ARGS_GO_HERE}"
end
TXT

  tab 'utf8', '# encoding: UTF-8', <<-'TXT', uuid: 'B2C3ADE8-E19E-4B87-9C6C-593D490114C7', file: '# encoding˸  UTF-8'
# encoding: ${1:UTF-8}

TXT

  tab 'w', 'attr_writer ..', <<-'TXT', uuid: '3D383096-A03F-4EF8-9060-3C727045AB34', file: 'attr_writer ..  (w)'
attr_writer :${0:attr_names}
TXT

  tab 'when', 'when …', <<-'TXT', uuid: '48D8E498-C9A5-4B1B-9A18-71A5860276FB', file: 'when'
when ${1:condition}
	$0
TXT

  tab 'while', 'while ... end', <<-'TXT', uuid: 'D121FC61-96A4-4B8F-8709-280EDA876FF3', file: 'while ___ end'
while ${1:condition}
	$0
end
TXT

  tab 'xml-', 'xmlread(..)', <<-'TXT', uuid: 'B904D4AA-D15D-48A4-8EB2-563BAF489332', file: 'xmlread(__)'
REXML::Document.new(File.read(${1:"${2:path/to/file}"}))
TXT

  tab 'xpa', 'xpath(..) { .. }', <<-'TXT', uuid: 'CC300D44-6C3F-4F6C-A8AB-86F5A2DC57CF', file: 'xpath(__) { __ }'
elements.each(${1:"${2://XPath}"}) do |${3:node}|
	$0
end
TXT

  tab 'y', ':yields:', <<-'TXT', scope: 'source.ruby comment', uuid: 'ED6368FB-A11D-4622-9F42-7879481094F1', file: '˸yields˸ RDoc comment'
 :yields: ${0:arguments}
TXT

  tab 'Yd-', 'YAML.dump(.., file)', <<-'TXT', uuid: '3BA6762A-BB6B-489E-8006-F30F386AEF48', file: 'YAML.dump(.., file)  (Yd-)'
File.open(${1:"${2:path/to/file}.yaml"}, "w") { |${3:file}| YAML.dump(${4:obj}, ${3:file}) }
TXT

  tab 'Yl-', 'YAML.load(file)', <<-'TXT', uuid: '8343ACF4-EEB7-44B5-B835-94826466D4D5', file: 'YAML.load(file)  (Yl-)'
File.open(${1:"${2:path/to/file}.yaml"}) { |${3:file}| YAML.load(${3:file}) }
TXT

  tab 'zip', 'zip(enums) { |row| .. }', <<-'TXT', uuid: 'FD010022-E0E7-44DB-827F-33F7D9310DA2', file: 'zip(enums) { ¦row¦ .. }  (zip)'
zip(${1:enums}) { |${2:row}| $0 }
TXT

  tab '{', 'Insert { |variable| … }', "{ ${1/(^(?<var>\\s*[a-z_][a-zA-Z0-9_]*\\s*)(,\\g<var>)*,?\\s*$)|.*/(?1:|)/}${1:variable}${1/(^(?<var>\\s*[a-z_][a-zA-Z0-9_]*\\s*)(,\\g<var>)*,?\\s*$)|.*/(?1:| )/}${2:$TM_SELECTED_TEXT} ", scope: 'source.ruby - string - comment', uuid: '855FC4EF-7B1E-48EE-AD4E-5ECB8ED79D1C', file: 'open yield block ({)'

end