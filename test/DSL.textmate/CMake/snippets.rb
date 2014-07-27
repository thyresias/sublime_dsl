# encoding: utf-8

snippets do

  default_scope 'source.cmake'
  file_format :textmate

  tab 'append', 'List(Append …)', <<-'TXT', uuid: '63E216D2-69EF-4ADF-80A4-46D8A6A6F716'
LIST(APPEND ${1:LIST_VARIABLE} ${2:new_element})
TXT

  tab 'for', 'Foreach … EndForeach', <<-'TXT', uuid: '56F808A2-C0ED-4EC9-8E9E-6892E51E0661'
FOREACH(${1:VAR} ${2:items})
	$0
ENDFOREACH()
TXT

  tab 'fun', 'Function … EndFunction', <<-'TXT', uuid: 'F7CA148C-C68F-4DDC-A217-2A266D18205A'
FUNCTION(${1:FUNCTION_NAME}${2/(.+)/(?1: )/}${2:arg1})
	$0
ENDFUNCTION()
TXT

  tab 'glob', 'File(Glob …)', <<-'TXT', uuid: 'C6535099-87C4-4FDF-9359-95C33C23B3FC'
FILE(GLOB${1:_RECURSE} ${2:VAR} ${3:src/*.cc})
TXT

  tab 'if', 'If … Endif', <<-'TXT', uuid: '4F059A9A-EEAA-49B6-AAE5-0E29A00CFF70'
IF(${1:condition})
	$0
ENDIF()
TXT

  tab 'mac', 'Macro … EndMacro', <<-'TXT', uuid: 'DA433498-38DE-4E5D-B3DA-64D8F793CECB'
MACRO(${1:MACRO_NAME}${2/(.+)/(?1: )/}${2:arg1})
	$0
ENDMACRO()
TXT

  tab 'msg', 'Message(…)', <<-'TXT', uuid: 'E9362AB2-F35B-436F-A042-69135E2F3744'
MESSAGE("$1")$0
TXT

  tab 'set', 'Set(Variable …)', <<-'TXT', uuid: '725B826B-7849-4A52-8F65-FE4D78378FE1'
SET(${1:VAR} ${2:value})
TXT

end