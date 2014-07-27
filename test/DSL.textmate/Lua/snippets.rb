# encoding: utf-8

snippets do

  default_scope 'source.lua'
  file_format :textmate

  tab 'for', 'for i=1,10', <<-'TXT', uuid: 'B1FDD74B-F037-45B7-AA61-7CB56BFA67CD'
for ${1:i}=${2:1},${3:10} do
	${0:print(i)}
end
TXT

  tab 'fori', 'for i,v in ipairs()', <<-'TXT', uuid: '082D9465-0CEF-40DB-9B1C-34940D38F4F0'
for ${1:i},${2:v} in ipairs(${3:table_name}) do
	${0:print(i,v)}
end
TXT

  tab 'forp', 'for k,v in pairs()', <<-'TXT', uuid: 'A75263F5-C971-42F2-8FAC-83829AD945DE'
for ${1:k},${2:v} in pairs(${3:table_name}) do
	${0:print(k,v)}
end
TXT

  tab 'fun', 'function', <<-'TXT', uuid: '3E0EEDB8-2C15-4703-939B-9334714B3A8E', file: 'function (fun)'
function ${1:function_name}( ${2:...} )
	${0:-- body}
end
TXT

  tab 'function', 'function', <<-'TXT', uuid: 'F4A541EB-8C83-4EFB-97A7-F780807AC23A', file: 'function (function)'
function ${1:function_name}( ${2:...} )
	${0:-- body}
end
TXT

  tab 'local', 'local x = 1', <<-'TXT', uuid: '0CEE4504-F8F1-4A98-AC7B-AA679CAAAB55'
local ${1:x} = ${0:1}
TXT

  tab 'table.concat', 'table.concat', <<-'TXT', uuid: '8E68AA99-64F4-4D36-AF80-D7D0B3DCD041'
table.concat( ${1:tablename}${2:, ", "}${3:, start_index}${4:, end_index} )
TXT

  tab 'table.sort', 'table.sort', <<-'TXT', uuid: '2052FA2D-5830-4665-8C90-01D0C7E04991'
table.sort( ${1:tablename}${2:, sortfunction} )
TXT

end