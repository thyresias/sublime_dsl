# encoding: utf-8

snippets do

  default_scope 'source.erlang'

  tab 'beh', 'Behaviour Directive', <<-'TXT', file: 'Behaviour-Directive'
-behaviour (${1:behaviour}).
TXT

  tab 'case', 'Case Expression', <<-'TXT', file: 'Case-Expression'
case ${1:expression} of
	${2:pattern}${3: when ${4:guard}} ->
		${5:body}
end
TXT

  tab 'def', 'Define Directive', <<-'TXT', file: 'Define-Directive'
-define (${1:macro}${2: (${3:param})}, ${4:body}).
TXT

  tab 'exp', 'Export Directive', <<-'TXT', file: 'Export-Directive'
-export ([${1:function}/${2:arity}]).
TXT

  tab 'fun', 'Fun Expression', <<-'TXT', file: 'Fun-Expression'
fun
	(${1:pattern})${2: when ${3:guard}} ->
		${4:body}
end
TXT

  tab 'if', 'If Expression', <<-'TXT', file: 'If-Expression'
if
	${1:guard} ->
		${2:body}
end
TXT

  tab 'ifdef', 'Ifdef Directive', <<-'TXT', file: 'Ifdef-Directive'
-ifdef (${1:macro}).
TXT

  tab 'ifndef', 'Ifndef Directive', <<-'TXT', file: 'Ifndef-Directive'
-ifndef (${1:macro}).
TXT

  tab 'imp', 'Import Directive', <<-'TXT', file: 'Import-Directive'
-import (${1:module}, [${2:function}/${3:arity}]).
TXT

  tab 'inc', 'Include Directive', <<-'TXT', file: 'Include-Directive'
-include ("${1:file}").
TXT

  tab 'mod', 'Module Directive', <<-'TXT', file: 'Module-Directive'
-module (${1:${TM_FILEPATH/^.*\/(.*)\.erl$/$1/g}}).
TXT

  tab 'rcv', 'Receive Expression', <<-'TXT', file: 'Receive-Expression'
receive
${1:	${2:pattern}${3: when ${4:guard}} ->
		${5:body}
}${6:after
	${7:expression} ->
		${8:body}
}end
TXT

  tab 'rec', 'Record Directive', <<-'TXT', file: 'Record-Directive'
-record (${1:record}, {${2:field}${3: = ${4:value}}}).
TXT

  tab 'try', 'Try Expression', <<-'TXT', file: 'Try-Expression'
try${1: ${2:expression}${3: of
	${4:pattern}${5: when ${6:guard}} ->
		${7:body}}}
${8:catch
	${9:pattern}${10: when ${11:guard}} ->
		${12:body}}
${13:after
	${14:body}}
end
TXT

  tab 'undef', 'Undef Directive', <<-'TXT', file: 'Undef-Directive'
-undef (${1:macro}).
TXT

end