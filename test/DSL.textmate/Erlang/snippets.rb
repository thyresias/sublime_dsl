# encoding: utf-8

snippets do

  default_scope 'source.erlang'
  file_format :textmate

  # FIXME: no tab trigger nor key equivalent
  key nil, '(Case/Receive/Try Clause)', <<-'TXT', uuid: '756D50E8-C3E9-4ACD-B246-031E4D91D807', file: '(Case˸Receive˸Try Clause)'
${1:pattern}${2: when ${3:guard}} ->
	${4:body}
TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, '(Fun Clause)', <<-'TXT', uuid: '15DF3174-A8CD-40DA-BE74-B991425BA9EB'
(${1:pattern})${2: when ${3:guard}} ->
	${4:body}
TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, '(Function Clause)', <<-'TXT', uuid: 'AF80483E-996B-44E8-A76D-8CD7AA3CDB8B'
${1:function} (${2:param})${3: when ${4:guard}} ->
	${5:body}
TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, '(If Clause)', <<-'TXT', uuid: '0DD90D8B-3DE0-4A8B-BA82-737375D4E5CB'
${1:guard} ->
	${2:body}
TXT

  key "^,", 'Field & Value', <<-'TXT', scope: 'source.erlang meta.structure.record', uuid: '2842C13E-C4F3-4DD4-86CE-C008A0AA461D'
, ${1:field}${2: = ${3:value}}
TXT

  key "^F", 'Function', <<-'TXT', uuid: 'C7FAC8F8-F843-4F5B-8FE4-217ECEF1E543'
${1:function}(${2:param})${3: when ${4:guard}} ->$0
TXT

  key "^,", 'Function & Arity', <<-'TXT', scope: 'source.erlang meta.structure.list.function', uuid: 'BF4EBA8B-65B6-40A5-B8BA-64B7EC13F40B'
, ${1:function}/${2:arity}
TXT

  tab 'beh', 'Behaviour Directive', <<-'TXT', uuid: '30CF71AF-5DB6-4DFA-934D-0E1747657644'
-behaviour (${1:behaviour}).
TXT

  tab 'case', 'Case Expression', <<-'TXT', uuid: 'E6AD8350-0670-42D8-9E1C-8F0853B23DE1'
case ${1:expression} of
	${2:pattern}${3: when ${4:guard}} ->
		${5:body}
end
TXT

  tab 'def', 'Define Directive', <<-'TXT', uuid: '307A33A1-CA17-4BF6-BE38-0C749055F711'
-define (${1:macro}${2: (${3:param})}, ${4:body}).
TXT

  tab 'exp', 'Export Directive', <<-'TXT', uuid: 'A3AF4B3B-A3F0-4501-B7A2-9F22AE51DAC5'
-export ([${1:function}/${2:arity}]).
TXT

  tab 'expall', 'Export All Directive', <<-'TXT', uuid: '5D35BF66-EF27-486E-8187-F39704848BDB'
-compile(export_all).
TXT

  tab 'fun', 'Fun Expression', <<-'TXT', uuid: '44772708-584C-4357-926E-50DDFBFF66C0'
fun
	(${1:pattern})${2: when ${3:guard}} ->
		${4:body}
end
TXT

  tab 'if', 'If Expression', <<-'TXT', uuid: '868B3F48-6567-43BD-ABA1-54718DCBDE5E'
if
	${1:guard} ->
		${2:body}
end
TXT

  tab 'ifdef', 'Ifdef Directive', <<-'TXT', uuid: '780100D7-AF4F-440D-B3E9-1B4603B5984F'
-ifdef (${1:macro}).
TXT

  tab 'ifndef', 'Ifndef Directive', <<-'TXT', uuid: 'A30E3888-8EA6-4DD9-BE1C-97BDBF5E09A5'
-ifndef (${1:macro}).
TXT

  tab 'imp', 'Import Directive', <<-'TXT', uuid: 'E06CB3C5-2202-4BA7-B651-21B437427BA3'
-import (${1:module}, [${2:function}/${3:arity}]).
TXT

  tab 'inc', 'Include Directive', <<-'TXT', uuid: '6882D307-5022-459D-BDA3-EA33BD8AF947'
-include ("${1:file}").
TXT

  tab 'mod', 'Module Directive', <<-'TXT', uuid: 'C27C322E-0E88-4404-9AD1-218D7617CF14'
-module (${1:${TM_FILEPATH/^.*\/(.*)\.erl$/$1/g}}).
TXT

  tab 'rcv', 'Receive Expression', <<-'TXT', uuid: '26D57EA7-1098-419B-B96C-8B90CCC57654'
receive
${1:	${2:pattern}${3: when ${4:guard}} ->
		${5:body}
}${6:after
	${7:expression} ->
		${8:body}
}end
TXT

  tab 'rec', 'Record Directive', <<-'TXT', uuid: '43C66E91-F2C4-4E42-AF8E-21C1DB6401A2'
-record (${1:record}, {${2:field}${3: = ${4:value}}}).
TXT

  tab 'try', 'Try Expression', <<-'TXT', uuid: '5815443C-4D02-4B76-85FF-9B745386F2A1'
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

  tab 'undef', 'Undef Directive', <<-'TXT', uuid: '13BB91B4-FF8A-49E1-8960-3EC352613482'
-undef (${1:macro}).
TXT

end