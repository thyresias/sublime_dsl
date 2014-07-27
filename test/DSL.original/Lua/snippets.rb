# encoding: utf-8

snippets do

  default_scope 'source.lua'

  tab 'for', 'for i=1,10', <<-'TXT', file: 'for-i=1-10'
for ${1:i}=${2:1},${3:10} do
	${0:print(i)}
end
TXT

  tab 'fori', 'for i,v in ipairs()', <<-'TXT', file: 'for-i-v-in-ipairs()'
for ${1:i},${2:v} in ipairs(${3:table_name}) do
	${0:print(i,v)}
end
TXT

  tab 'forp', 'for k,v in pairs()', <<-'TXT', file: 'for-k-v-in-pairs()'
for ${1:k},${2:v} in pairs(${3:table_name}) do
	${0:print(k,v)}
end
TXT

  tab 'fun', 'function', <<-'TXT', file: 'function-(fun)'
function ${1:function_name}( ${2:...} )
	${0:-- body}
end
TXT

  tab 'function', 'function', <<-'TXT', file: 'function-(function)'
function ${1:function_name}( ${2:...} )
	${0:-- body}
end
TXT

  tab 'local', 'local x = 1', <<-'TXT', file: 'local-x-=-1'
local ${1:x} = ${0:1}
TXT

  tab 'table.concat', 'table.concat', <<-'TXT'
table.concat( ${1:tablename}${2:, ", "}${3:, start_index}${4:, end_index} )
TXT

  tab 'table.sort', 'table.sort', <<-'TXT'
table.sort( ${1:tablename}${2:, sortfunction} )
TXT

end