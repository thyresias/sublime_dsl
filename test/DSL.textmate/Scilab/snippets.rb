# encoding: utf-8

snippets do

  default_scope 'source.scilab'
  file_format :textmate

  tab 'case', 'case', <<-'TXT', uuid: 'C4962F23-F7E2-42E4-A375-3CEE9E5B4C22'
case ${1:expression} then
	$0
TXT

  tab 'elseif', 'elseif', <<-'TXT', uuid: '9D1CCE73-07D7-4F3C-A181-76C5950A0D1E'
elseif ${1:condition} then
	$0
TXT

  tab 'exec', 'exec(..)', <<-'TXT', uuid: 'CD8A35E6-C4F3-4D94-BF65-B2D8916AAD44', file: 'exec(__)'
exec("${0:script.sce}")
TXT

  tab 'eye', 'eye(..)', <<-'TXT', uuid: 'ADFCB962-5271-4BD9-8A1F-9E9913C1EFAA', file: 'eye(__)'
eye(${1:size}, ${2:$1})
TXT

  tab 'for', 'for ... end', <<-'TXT', uuid: 'B9B4D734-CF90-4D19-9EC6-3B57CFF3F759', file: 'for ___ end'
for ${1:i} = ${2:array}
	$0
end
TXT

  tab 'function', 'function', <<-'TXT', uuid: 'B2D06182-E594-40F4-8FFE-E96B9F45EC1C'
function ${3:output} = ${1:name}($2)
	// ${4:Description of $1($2)}
endfunction
TXT

  tab 'getd', 'getd(..)', <<-'TXT', uuid: '38FBBBEA-4064-4A06-9FC5-09B286892CB7', file: 'getd(__)'
getd("${0:`echo "$TM_DIRECTORY" | sed -e "s/'/''/g" -e "s/\"/\"\"/g"`}")
TXT

  tab 'getf', 'getf(..)', <<-'TXT', uuid: 'A41372BE-D782-4236-ACFC-BF88630D78AC', file: 'getf(__)'
getf("${0:script.sci}")
TXT

  tab 'if', 'if ... end', <<-'TXT', uuid: '59BFC296-FAB3-45EE-B9D3-B57841A4D3C5', file: 'if ___ end'
if ${1:condition} then
	$0
end
TXT

  tab 'ifelse', 'if ... else ... end', <<-'TXT', uuid: '38B7443F-1F47-42AB-A74A-79EB40FDE7C0', file: 'if ___ else ___ end'
if ${1:condition} then
	$2
else
	$3
end
TXT

  tab 'legend', 'legend(..)', <<-'TXT', uuid: 'CF4617F0-175E-482B-990B-70AA75DA1231', file: 'legend(__)'
legend("${1:Graph 1}", "${2:Graph 2}")
TXT

  tab 'ones', 'ones(..)', <<-'TXT', uuid: '6D03A104-F2A7-4141-B102-54CB1BAA58F1', file: 'ones(__)'
ones(${1:rows}, ${2:cols})
TXT

  tab 'path', 'get_absolute_file_path(..)', <<-'TXT', uuid: '1A24ECE9-7AF7-4CAB-9C8F-5C1B7B5E2231', file: 'get_absolute_file_path(__)'
get_absolute_file_path("${0:`echo "$TM_FILEPATH" | sed -e "s/'/''/g" -e "s/\"/\"\"/g"`}");
TXT

  tab 'plot', 'plot(..)', <<-'TXT', uuid: '2B4C5133-C32A-4305-B6B1-CB88FB2A28BE', file: 'plot(__)'
plot(${1:x}, ${2:y}, ${3:'-'})
TXT

  tab 'plot3d', 'plot3d(..)', <<-'TXT', uuid: 'C05BF6A0-185E-4093-BBCE-DEC0F0C16915', file: 'plot3d(__)'
plot3d(${1:x}, ${2:y}, ${3:z})
TXT

  tab 'select', 'select ... case ... end', <<-'TXT', uuid: '997D2E8F-7379-44CA-BFCF-93F46ACA3D24', file: 'select ___ case ___ end'
select ${1:variable}
	case ${2:expression} then
		$0
end
TXT

  tab 'title', 'xtitle(..)', <<-'TXT', uuid: '0CC94185-7A16-4ACE-9D81-CF20D175E465', file: 'xtitle(__)'
xtitle("${1:Main Title}", "${2:x-axis}", "${3:y-axis}")
TXT

  tab 'while', 'while ... end', <<-'TXT', uuid: 'A76108A2-B2DF-4635-B693-FA64609D65E6', file: 'while ___ end'
while ${1:condition} then
	$0
end
TXT

  tab 'zeros', 'zeros(..)', <<-'TXT', uuid: 'E10F3484-A015-4C1E-AC21-3AFE10B24DA8', file: 'zeros(__)'
zeros(${1:rows}, ${2:cols})
TXT

end