# encoding: utf-8

snippets do

  default_scope 'source.coffee'
  file_format :textmate

  key "^j", 'Raw javascript', <<-'TXT', uuid: '422A59E7-FC36-4E99-B01C-6353515BB544'
\`${1:`pbpaste`}\`
TXT

  tab '#', 'Interpolated Code', <<-'TXT', scope: '(string.quoted.double.coffee) - string source, (string.quoted.double.heredoc.coffee) - string source', uuid: 'C04ED189-6ACB-44E6-AD5B-911B760AD1CC', key_equivalent: "#"
#{${1:$TM_SELECTED_TEXT}}
TXT

  tab '/1', 'Comment Header', <<-'TXT', uuid: '099276E4-DCF9-470B-9034-EFF7F0937560', file: 'h1'
# $1
# ==============================================================================
$0
TXT

  tab '/2', 'Comment Subheader', <<-'TXT', uuid: 'EB7F835F-4F2F-4483-832B-BDA4AEE0EAB7', file: 'h2'
# $1
# ----------------------------------------------------------------------
$0
TXT

  tab '/3', 'Comment Sub-Subheader', <<-'TXT', uuid: '31EC9F11-C98B-4F07-9591-172B4B593EFE', file: 'h3'
# $1
# -------------------------
$0
TXT

  tab 'bfun', 'Function (bound)', <<-'TXT', uuid: '20BDC055-ED67-4D0E-A47F-ADAA828EFF2B', file: 'Bound Function'
(${1:args}) =>
	${0:# body...}
TXT

  tab 'cla', 'Class', <<-'TXT', uuid: '765ACBD3-380A-4CF8-9111-345A36A0DAE7'
class ${1:ClassName}${2: extends ${3:Ancestor}}

	${4:constructor: (${5:args}) ->
		${6:# body...}}
	$7
TXT

  tab 'elif', 'Else if', <<-'TXT', uuid: 'EA8F5EDB-6E1E-4C36-9CA5-12B108F1A7C9'
else if ${1:condition}
	${0:# body...}
TXT

  tab 'fora', 'Array Comprehension', <<-'TXT', uuid: '2D4AC0B4-47AA-4E38-9A11-09A48C2A9439', file: 'Array comprehension'
for ${1:name} in ${2:array}
	${0:# body...}
TXT

  tab 'foro', 'Object comprehension', <<-'TXT', uuid: '9D126CC5-EA14-4A40-B6D3-6A5FC1AC1420'
for ${1:key}, ${2:value} of ${3:Object}
	${0:# body...}
TXT

  tab 'forr', 'Range comprehension (inclusive)', <<-'TXT', uuid: 'E0F8E45A-9262-4DD6-ADFF-B5B9D6CE99C2'
for ${1:name} in [${2:start}..${3:finish}]${4: by ${5:step}}
	${0:# body...}
TXT

  tab 'forrex', 'Range comprehension (exclusive)', <<-'TXT', uuid: 'FA6AB9BF-3444-4A8C-B010-C95C2CF5BAB3'
for ${1:name} in [${2:start}...${3:finish}]${4: by ${5:step}}
	${0:# body...}
TXT

  tab 'fun', 'Function', <<-'TXT', uuid: 'F2E2E79A-A85D-471D-9847-72AE40205942'
(${1:args}) ->
	${0:# body...}


TXT

  tab 'if', 'If', <<-'TXT', uuid: 'F4FDFB3A-71EF-48A4-93F4-178B949546B1'
if ${1:condition}
	${0:# body...}
TXT

  tab 'ife', 'If .. Else', <<-'TXT', uuid: '2AD19F12-E499-4715-9A47-FC8D594BC550', file: 'If __ Else'
if ${1:condition}
	${2:# body...}
else
	${3:# body...}
TXT

  tab 'ifte', 'Ternary If', <<-'TXT', uuid: 'CF0B4684-E4CB-4E10-8C25-4D15400C3385'
if ${1:condition} then ${2:value} else ${3:other}
TXT

  tab 'log', 'log', <<-'TXT', uuid: 'FBC44B18-323A-4C00-A35B-15E41830C5AD'
console.log $0
TXT

  tab 'req', 'require', <<-'TXT', uuid: '8A65E175-18F2-428F-A695-73E01139E41A'
${2/^.*?([\w_]+).*$/\L$1/} = require ${2:'${1:sys}'}$3
TXT

  tab 'swi', 'Switch', <<-'TXT', uuid: '3931A7C6-F1FB-484F-82D1-26F5A8F779D0'
switch ${1:object}
	when ${2:value}
		${0:# body...}
TXT

  tab 'try', 'Try .. Catch', <<-'TXT', uuid: 'CAFB0DED-5E23-4A84-AC20-87FBAF22DBAC', file: 'Try __ Catch'
try
	$1
catch ${2:error}
	$3
TXT

  tab 'unl', 'Unless', <<-'TXT', uuid: 'E561AECD-5933-4F59-A6F7-FA96E1203606'
${1:action} unless ${2:condition}
TXT

end