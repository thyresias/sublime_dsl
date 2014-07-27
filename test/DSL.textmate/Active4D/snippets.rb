# encoding: utf-8

snippets do

  default_scope 'source.active4d - text.xml'
  file_format :textmate

  tab '<', 'Active4D code block', <<-'TXT', scope: 'text.html.strict.active4d - source.active4d', uuid: 'A37A4FC0-03EC-4275-A7AB-C2F853960BD2', key_equivalent: "@<"
<%$1$2%>$0
TXT

  tab '=', 'Active4D = block', <<-'TXT', scope: 'text.html.strict.active4d - source.active4d', uuid: '04995C61-1B69-4EB8-B4C3-013DF9B0A5DD', key_equivalent: "@="
<%= $1 %>$0
TXT

  tab 'arb', 'array boolean ..', <<-'TXT', uuid: '94FC6E74-A7E6-494B-AB72-1B5174AB21E6', file: 'array boolean __'
array boolean(${1:\$array}; ${2:0})$0
TXT

  tab 'arbs', 'array boolean * ..', <<-'TXT', uuid: '3B5C3C46-38A4-4642-84AD-F872B1153C46', file: 'array boolean __ set array __'
array boolean(${1:\$array}; *; ${2:true/false})$0
TXT

  tab 'ard', 'array date ..', <<-'TXT', uuid: '71B5AABD-E040-41F3-B274-D362A9400FC6', file: 'array date __'
array date(${1:\$array}; ${2:0})$0
TXT

  tab 'ards', 'array date * ..', <<-'TXT', uuid: '2B8845C2-C670-4287-9C6B-C43D57057BFA', file: 'array date __ set array __'
array date(${1:\$array}; *; ${2:date})$0
TXT

  tab 'arl', 'array longint ..', <<-'TXT', uuid: '967F79C1-799D-4284-93D4-C7CAD6BB101B', file: 'array longint __'
array longint(${1:\$array}; ${2:0})$0
TXT

  tab 'arls', 'array longint * ..', <<-'TXT', uuid: '040A8A1F-C43B-4E69-AAE1-5EEDF71DE494', file: 'array longint __ set array __'
array longint(${1:\$array}; *; ${2:longint})$0
TXT

  tab 'arr', 'array real ..', <<-'TXT', uuid: '7A3C0020-6D36-4E1C-ACA5-4BAC0763A723', file: 'array real __'
array real(${1:\$array}; ${2:0})$0
TXT

  tab 'arrs', 'array real * ..', <<-'TXT', uuid: 'B4D87FD7-9B52-45EE-AB9B-78ACAA6A53AC', file: 'array real __ set array __'
array real(${1:\$array}; *; ${2:real})$0
TXT

  tab 'ars', 'array string ..', <<-'TXT', uuid: 'C54ABF1D-6043-4905-9803-E4C5C58FC37D', file: 'array string __'
array string(${1:31}; ${2:\$array}; ${3:0})$0
TXT

  tab 'arss', 'array string * ..', <<-'TXT', uuid: '28169FEE-BDE5-4B9F-A954-43953DF05E5D', file: 'array string __ set array __'
array string(${1:31}; ${2:\$array}; *; "${3:string}")$0
TXT

  tab 'art', 'array text ..', <<-'TXT', uuid: '26328AC7-FC19-4966-8B77-1466ECF9BC9B', file: 'array text __'
array text(${1:\$array}; ${2:0})$0
TXT

  tab 'arts', 'array text * ..', <<-'TXT', uuid: 'DBDED4B6-5FA9-492C-A25C-69785CE75B89', file: 'array text __ set array __'
array text(${1:\$array}; *; "${2:text}")$0
TXT

  tab 'at', '$attributes ..', <<-'TXT', uuid: '46A61C6E-15F5-4D24-BC7F-385DBB2B33B2', file: '$attributes __'
\$attributes{"${1:key}"}$0
TXT

  tab 'bool', '<boolean .. />', <<-'TXT', scope: 'source.active4d text.xml', uuid: 'D2309405-64FC-45B0-B663-61C147573D3C', file: '˂boolean __ ˸˃'
<boolean name="${1:name}" $2/>$0
TXT

  tab 'case', 'case of .. end case', <<-'TXT', uuid: 'E21FD23A-35CD-485D-AE05-C0F2B78887DC', file: 'case of __ end case'
case of
	:(${1:condition})
		$0
end case
TXT

  tab 'casee', 'case of .. else end case', <<-'TXT', uuid: '55991B2C-7B1B-4908-AA8B-B052AD16A12E', file: 'case of __ else end case'
case of
	:(${1:condition})
		$0

else

end case
TXT

  tab 'ch', 'choose ..', <<-'TXT', uuid: '391EDA1B-8512-4EFF-ACCE-748A35DD22DE', file: 'choose __'
choose(${1:condition}; ${2:true_value}; ${3:false_value})$0
TXT

  tab 'css', 'fusebox.head.addCSS ..', <<-'TXT', uuid: 'FBEB1B01-5BFD-4051-AA04-81E832791671', file: 'fusebox_head_addCSS __'
fusebox.head.addCSS(\$fusebox; "${1:stylesheet}.css$0")
TXT

  tab 'da', 'a4d.debug.dump array ..', <<-'TXT', uuid: '12C923D7-3D43-4562-927C-4A85730F4BFA', file: 'a4d_debug_dump array __'
a4d.debug.dump array(${1:\$array})
$0
TXT

  tab 'dat', 'a4d.debug.dump collection($attributes)', <<-'TXT', uuid: '74E58F2B-CE69-43BF-BAF0-5C84D5C1F223', file: 'a4d_debug_dump collection($attributes)'
a4d.debug.dump collection(\$attributes)
$0
TXT

  tab 'date', '<date ../>', <<-'TXT', scope: 'source.active4d text.xml', uuid: '763279DE-5570-4982-B1DB-383815F7F526', file: '˂date __˸˃'
<date name="${1:name}" $2/>$0
TXT

  tab 'dc', 'a4d.debug.dump collection ..', <<-'TXT', uuid: '7408BA06-D4A2-4299-845B-8B6F6F5F6012', file: 'a4d_debug_dump collection __'
a4d.debug.dump collection(${1:\$collection})
$0
TXT

  tab 'fa', 'find in array ..', <<-'TXT', uuid: '55720E43-42EC-4964-A9D6-C556707640EF', file: 'find in array __'
find in array(${1:\$array}; ${2:value}${3:; start})$0
TXT

  tab 'fea', 'for each (array) .. end for each', <<-'TXT', uuid: '47627C2D-C2AC-4A5B-A521-773EAB4925B5', file: 'for each (array) __ end for each'
for each (${1:\$array}; ${2:\$value}${3:; \$index})
	$0
end for each
TXT

  tab 'fec', 'for each (collection) .. end for each', <<-'TXT', uuid: 'D141DE7D-F8B2-4519-AABA-78F0694F0D55', file: 'for each (collection) __ end for each'
for each (${1:\$collection}; ${2:\$key}${3:; \$value})
	$0
end for each
TXT

  tab 'fes', 'for each (string) .. end for each', <<-'TXT', uuid: '5FEE867D-5EF6-481F-8FAC-0C4DEA90D3C5', file: 'for each (string) __ end for each'
for each (${1:\$string}; ${2:\$char}${3:; \$index})
	$0
end for each
TXT

  tab 'fet', 'for each (table) .. end for each', <<-'TXT', uuid: 'AB6D85C5-49C5-47BB-ACAD-1471D4D97A08', file: 'for each (table) __ end for each'
for each ([${1:table}]${2:; \$index})
	$0
end for each
TXT

  tab 'ff', '<string .. /> from form field', <<-'TXT', scope: 'source.active4d text.xml', uuid: '6D33E242-B22F-407F-BBFC-0B46E0CB7831', file: '˂string __ ˸˃ from form field'
<string name="${1:name}" scope="attributes" optional="${2:yes}"${3: comments="$4"} />$0
TXT

  tab 'fm', 'fusebox.makeUrl ..', <<-'TXT', uuid: 'F831D450-9973-46A8-8A31-218DF03A4049', file: 'fusebox_makeUrl __'
fusebox.makeUrl(\$XFA_$1${2:; query})$0
TXT

  tab 'for', 'for .. end for', <<-'TXT', uuid: '795F06E9-F9FA-4ABD-B5E2-663274024BFA', file: 'for __ end for'
for (${1:\$i}; ${2:1}; ${3:end})
	$0
end for
TXT

  tab 'fora', 'for ( .. size of array(..)) .. end for', <<-'TXT', uuid: '6CC7A6F9-992B-4F9A-8FBE-D0F3D19CF3DC', file: 'for ( __ size of array(__)) __ end for'
for (${1:\$i}; ${2:1}; size of array(${3:\$array}))
	$0
end for
TXT

  tab 'fr', 'fusebox redirect ..', <<-'TXT', uuid: '8D04D4D9-05F5-40FC-9A5F-652759401B45', file: 'fusebox redirect __'
redirect(fusebox.makeUrl(\$XFA_$1))$0
TXT

  tab 'if', 'if .. end if', <<-'TXT', uuid: '19167C19-BBBF-481C-A423-044605928E49', file: 'if __ end if'
if (${1:condition})
	$0
end if
TXT

  tab 'ife', 'if .. else end if', <<-'TXT', uuid: '073E43AA-74E6-4A81-BA22-E090E648C704', file: 'if __ else end if'
if (${1:condition})
	$0
else

end if
TXT

  tab 'inc', 'include ..', <<-'TXT', uuid: '855AD9F1-744E-450E-ABFC-0828DACAEBFF', file: 'include __'
include("${1:file}${2:.a4d}")$0
TXT

  tab 'js', 'fusebox.head.addJS ..', <<-'TXT', uuid: 'AE497A5C-C3FA-4A73-9F13-6150A367B9DC', file: 'fusebox_head_addJS __'
fusebox.head.addJS(\$fusebox; "${1:javascript}.js$0")
TXT

  tab 'me', 'method .. end method', <<-'TXT', uuid: 'C0D483B8-593E-42A9-96FA-C9CAA488972B', file: 'method __ end method'
method "${1:name}"
	$0
end method
TXT

  tab 'mp', 'method (..) .. end method', <<-'TXT', uuid: '7B29EDD1-0321-446F-AD8B-76BA6D5B43E4', file: 'method (__) __ end method'
method "${1:name}"(${2:\$parameter})
	$0
end method
TXT

  tab 'num', '<number .. />', <<-'TXT', scope: 'source.active4d text.xml', uuid: '7A15F807-B5F7-416C-8587-33CC1B7B00CC', file: '˂number __ ˸˃'
<number name="${1:name}" $2/>$0
TXT

  tab 'ob', 'order by ..', <<-'TXT', uuid: '64662E01-ED28-47E5-9260-0E12543ED409', file: 'order by __'
order by([${1:table}]; [$1]${2:field}${3:; >}$0)
TXT

  tab 'q', 'query ..', <<-'TXT', uuid: '5EE152F8-7473-4D88-A1D3-B3E2456856A2', file: 'query __'
query([${1:table}]; [$1]${2:field})$0
TXT

  tab 'qs', 'query selection..', <<-'TXT', uuid: '55FBC51E-00A1-4B46-98F3-D84DAD8E4ECD', file: 'query selection __'
query selection([${1:table}]; [$1]${2:field})$0
TXT

  tab 'rep', 'repeat .. until', <<-'TXT', uuid: '319EEC3B-F9C2-45D9-96D7-5B93FAFBEAFE', file: 'repeat __ until'
repeat
	$0
until (${1:condition})
TXT

  tab 'ris', 'records in selection ..', <<-'TXT', uuid: '7F65A32F-5A08-46A8-8F5E-E8EC6FF6AFF9', file: 'records in selection __'
records in selection([${1:table}])$0
TXT

  tab 'rs', '<RowSet ..> </RowSet>', <<-'TXT', scope: 'source.active4d text.xml', uuid: '6C5C32F0-A454-4A07-B9E8-F1664120AF7C', file: '˂RowSet __˃ ˂˸RowSet˃'
<RowSet name="\$${1:query}">
	$0
</RowSet>
TXT

  tab 'rs', 'RowSet.newFromSelection ..', <<-'TXT', uuid: 'E742B26D-8C6D-46AE-A10D-818379B4416D', file: 'RowSet_newFromSelection __'
\$${1:query} := RowSet.newFromSelection(->[${2:table}]; ${3:\$map})$0
TXT

  tab 's', 'session{..}', <<-'TXT', uuid: 'B8E93CD6-D69E-4A90-AE21-9B80A61BD7B6', file: 'session{__}'
session{"${1:key}"}$0
TXT

  tab 'sa', 'size of array ..', <<-'TXT', uuid: '226E3B5F-7BA9-4CA4-9550-87664024DEE7', file: 'size of array __'
size of array(${1:\$array})$0
TXT

  tab 'sat', '<string .. /> from attributes', <<-'TXT', scope: 'source.active4d text.xml', uuid: 'DA17698F-8C92-4FB7-9D3F-6AD9D380C9D3', file: '˂string __ ˸˃ from attributes'
<string name="${1:name}" scope="attributes" $2/>$0
TXT

  tab 'sh', 'Standard Header', "<% /*\n<fusedoc fuse=\"${TM_FILENAME:filename.a4d}\" language=\"Active4D\" specification=\"2.0\">\n\t<responsibilities>\n\t\t$1\n\t</responsibilities>\t\n\t<io>\n\t\t<in>$2\n\t\t</in>\n\t\t<out>$3\n\t\t</out>\n\t</io>\n</fusedoc>\n\n\\$Id\\$\n*/ \n\n$0\n%>", scope: 'text.html.strict.active4d', uuid: '9E40E571-E905-4F9F-BD13-349287196346'

  tab 'ss', '<string .. /> from session', <<-'TXT', scope: 'source.active4d text.xml', uuid: '8AB27646-9DEF-4532-9A00-7ACC1FCEC5AC', file: '˂string __ ˸˃ from session'
<string name="${1:name}" scope="session" $2/>$0
TXT

  tab 'st', '<string .. />', <<-'TXT', scope: 'source.active4d text.xml', uuid: '8DF5A209-A054-48CC-B1B1-591DA9EED81A', file: '˂string __ ˸˃'
<string name="${1:name}" $2/>$0
TXT

  tab 'sta', 'selection to array ..', <<-'TXT', uuid: 'A400C0C9-5F16-4D7D-84F2-E59635875063', file: 'selection to array __'
selection to array([${1:table}]${2:field}; ${3:\$array})$0
TXT

  tab 'time', '<time .. />', <<-'TXT', scope: 'source.active4d text.xml', uuid: '39DDAC31-CEF4-4B03-941E-C7D817B09900', file: '˂time __ ˸˃'
<time name="${1:name}" $2/>$0
TXT

  tab 'w', 'write ..', <<-'TXT', uuid: '1D4F65B8-0A19-4C08-8FBD-55BAFFA18E0A', file: 'write __'
write($1)$0
TXT

  tab 'wb', 'writebr ..', <<-'TXT', uuid: '1F6798E8-8029-4124-BC0E-2B7A50876B73', file: 'writebr __'
writebr($1)$0
TXT

  tab 'wc', 'write to console ..', <<-'TXT', uuid: 'D8AA7784-7028-4CDA-B10C-8D42D4ACFFCA', file: 'write to console __'
write to console($1)$0
TXT

  tab 'wh', 'while .. end while', <<-'TXT', uuid: '1D343B6C-24C7-491D-A207-05917722BD32', file: 'while __ end while'
while (${1:condition})
	$0
end while
TXT

  tab 'whe', 'while (not(end selection([..]))) end while', <<-'TXT', uuid: '7D145756-3329-4D73-B1E5-F83D88E58EA6', file: 'while (not(end selection([__]))) end while'
while (not(end selection([${1:table}])))
	$0

	next record([$1])
end while
TXT

  tab 'wl', 'writeln ..', <<-'TXT', uuid: 'D9DFEDFB-7A7B-497E-845F-5F8F3627C784', file: 'writeln __'
writeln($1)$0
TXT

  tab 'xfa', 'XFA', <<-'TXT', scope: 'source.active4d text.xml', uuid: '13BD03C0-5745-4B52-B0C4-D371561B1A53'
<string name="\$XFA_$1" $2/>$0
TXT

end