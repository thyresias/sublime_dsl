# encoding: utf-8

snippets do

  default_scope 'source.eiffel'
  file_format :textmate

  tab 'cl', 'class', <<-'TXT', uuid: '4F146DFF-8856-48BD-8E62-E10915C937F0', file: 'class (cl)'
-- ${1:class_name}

class
	${1/(.*)/\U$0\E/}
inherit

create

feature

invariant

end -- ${1/(.*)/\U$0\E/}

TXT

  tab 'cl', 'deferred class', <<-'TXT', uuid: '5F037B53-ADE9-4F35-A9A7-B255EB526F4C', file: 'deferred class (cl)'
-- ${1:class_name}

deferred class
	${1/(.*)/\U$0\E/}
inherit

feature

invariant

end -- ${1/(.*)/\U$0\E/}

TXT

  tab 'cl', 'expanded class', <<-'TXT', uuid: 'FFD49337-15AD-410B-BF1B-DF10C774979C', file: 'expanded class (cl)'
-- ${1:class_name}

expanded class
	${1/(.*)/\U$0\E/}
inherit

create

feature

invariant

end -- ${1/(.*)/\U$0\E/}

TXT

  tab 'fd', 'constant', <<-'TXT', uuid: '423FF75E-3DA6-442C-9DD2-2C9101AE939C', file: 'constant (cn)'
${1:constant}: ${2:TYPE} is ${3:value}
TXT

  tab 'fd', 'deferred routine', <<-'TXT', uuid: '7C5B3088-EA70-4E23-BA4F-ABEA803281A1', file: 'deferred routine (fd)'
${1:routine}${2: (${3:args}: ${4:TYPE})}${5:: ${6:TYPE}} is${7:
	require
		${8:assertion}}
	deferred${9:
	ensure
		${10:assertion}}
	end -- $1
TXT

  tab 'fd', 'external routine', <<-'TXT', uuid: 'C5FB67BC-34BF-44CA-87F2-8364A0CFD979', file: 'external routine (fd)'
${1:routine}${2: (${3:args}: ${4:TYPE})}${5:: ${6:TYPE}} is${7:
	require
		${8:assertion}}
	external
		"${9:language}"${10:
	alias
		"${11:external_name}"}${12:
	ensure
		${13:assertion}}
	end -- $1
TXT

  tab 'fd', 'once routine', "${1:routine}${2: (${3:args}: ${4:TYPE})}${5:: ${6:TYPE}} is${7:\n\trequire\n\t\t${8:assertion}}${9:\n\tlocal\n\t\t${10:l}:${11:TYPE}} \n\tonce\n\t\t${12:instruction}${13:\n\tensure\n\t\t${14:assertion}}${15:\n\trescue\n\t\t${16:instruction}}\n\tend -- $1", uuid: '09734164-39B2-48C6-88A7-155D81145C86', file: 'once routine (fd)'

  tab 'fd', 'routine', "${1:routine}${2: (${3:args}: ${4:TYPE})}${5:: ${6:TYPE}} is${7:\n\trequire\n\t\t${8:assertion}}${9:\n\tlocal\n\t\t${10:l}:${11:TYPE}} \n\tdo\n\t\t${12:instruction}{13:\n\tensure\n\t\t${14:assertion}}${15:\n\trescue\n\t\t${16:instruction}}\n\tend -- $1", uuid: 'C651354F-B5DC-4EA4-8A89-9F9157F8F85D', file: 'function (fn)'

  tab 'fd', 'unique', <<-'TXT', uuid: '07F41C46-B055-4C2D-97AF-611701A04BBE', file: 'unique (uq)'
${1:constant}: ${2:TYPE} is unique
TXT

  tab 'fd', 'variable', <<-'TXT', uuid: 'FAD17489-9866-47F2-8B23-8C8362763DC4', file: 'variable (fd)'
${1:constant}: ${2:TYPE}
TXT

  tab 'in', 'assignment', <<-'TXT', uuid: '9E0A84B4-68BE-439E-BF3D-54EF35CD5F7B', file: 'assignment (in)'
${1:writable} := ${2:expression}
TXT

  tab 'in', 'assignment attempt', <<-'TXT', uuid: '81F53E9F-3D4D-437E-994B-137958A6DD06', file: 'assignment attempt (in)'
${1:writable} ?= ${2:expression}
TXT

  tab 'in', 'check', <<-'TXT', uuid: '3BDC606B-AF49-47A0-8AC4-61676CDE04DB', file: 'check (in)'
check
	${1:assertion}
end
TXT

  tab 'in', 'create', <<-'TXT', uuid: '18CAEA4F-B3EB-49AF-9B6F-7A54791EA815', file: 'create (in)'
create${1: {${2:TYPE}\}} ${3:writable}.${4:make}

TXT

  tab 'in', 'debug', <<-'TXT', uuid: 'E5428A9C-728E-4640-8C73-85FE6383346B', file: 'debug (de)'
debug${1: (${2:debug_key})$}
	${3:instruction}
end
TXT

  tab 'in', 'elseif', <<-'TXT', uuid: 'A37E317F-14D0-4E06-A994-80BAFAF323AF', file: 'elseif (ef)'
elseif ${1:boolean_expression} then
	${2:instruction}

TXT

  tab 'in', 'if', <<-'TXT', uuid: '915ED3CE-50B5-4C81-9791-724989CF1CAD'
if ${1:boolean_expression} then
	${2:instruction}${3:
elseif
	${4:instruction}}${5:
else
	${6:instruction}}
end
TXT

  tab 'in', 'inspect', <<-'TXT', uuid: '44F43D6C-75C6-4574-9FD5-EA0208B6279A', file: 'inspect (in)'
inspect
	${1:expression}
when ${2:choice} then
	${3:instruction}${4:
else
	${5:instruction}}
end
TXT

  tab 'in', 'loop', <<-'TXT', uuid: '216FFFBC-D169-4A61-BA8C-B16263C4CC62', file: 'loop (lo)'
from
	${1:instruction}${2:
invariant
	${3:assertion}}${4:
variant
	${5:expression}}
until
	${6:boolean_expression}
loop
	${7:instruction}
end

TXT

  tab 'in', 'retry', <<-'TXT', uuid: 'DBA9C4A0-F81C-4C3E-8BEB-BE9107B9061B', file: 'retry (in)'
retry
TXT

  tab 'in', 'when', <<-'TXT', uuid: 'FFE35917-0B08-457F-8C61-724ABE7B375E', file: 'when (wh)'
when ${1:choice} then
	${2:instruction}
TXT

  tab 'ix', 'indexing', <<-'TXT', uuid: '5EE4494D-365D-4952-B5F9-471964D4DFBB', file: 'indexing (ix)'
Indexing
	Project: "$TM_FILEPATH"
	File: "$TM_FILENAME"
	Description: "${1:description}"
	Author: "${2:$USER}"
	Copyright: "© 2006 ${3:${TM_ORGANIZATION_NAME}}"
	Version: 1.0
	Date: "`date`"
	Keywords: ${4:keywords}

TXT

end