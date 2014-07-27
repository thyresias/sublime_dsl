# encoding: utf-8

snippets do

  default_scope 'source.io'
  file_format :textmate

  key "\n", 'Special: Return Inside Empty Parenthesis', <<-'TXT', scope: 'source.io meta.empty-parenthesis.io, source.io meta.comma-parenthesis.io', uuid: '0F687653-BF6D-4C2C-A75E-C9193E870BBC', file: 'Indented return'

	$0

TXT

  tab '(', 'Indented Bracketed Line', <<-'TXT', uuid: '6D6682F0-5C77-4581-B0C3-A732D5B0A93E', key_equivalent: "@("
(${1:header,}
	${2:body}
)$0
TXT

  tab 'ae', 'assertEquals', <<-'TXT', uuid: '57E40ECD-AC15-4AB8-89D4-C123CA0B164C'
assertEquals(${1:expected}, ${2:expr})
TXT

  tab 'cdo', 'clone do', <<-'TXT', uuid: 'E195E70E-E46F-4B42-B70E-3CE744AA920E'
${1:${2:newValue} := ${3:Object} }clone do(
	$0
)
TXT

  tab 'ds', 'docSlot', <<-'TXT', uuid: '7BEB3C8C-641B-4BEA-9F92-6594A8D448DD'
docSlot("${1:slotName}", "${2:documentation}")
TXT

  tab 'm', 'method', <<-'TXT', uuid: 'D55B718A-71A6-41A0-98ED-07B72442DDE8', file: 'Method'
${1:methodName} := method(${2:args,}
	$0
)
TXT

  tab 'ns', 'newSlot', <<-'TXT', uuid: '08A134DC-B1D9-42D3-AF5F-3E1061AD8827'
newSlot("${1:slotName}", ${2:defaultValue}, "${3:docString}")$0
TXT

  tab 'ocdo', 'Object clone do', <<-'TXT', uuid: 'FEF230FE-43A6-423C-B9DF-D03E6066D1AC'
${1:name} := Object clone do(
	$0
)
TXT

  tab 'ts', 'testMethod', <<-'TXT', uuid: '086D0C3A-130F-4C93-B1E5-1522DDAF58FA'
test${1:SomeFeature} := method(
	$0
)
TXT

  tab 'ut', 'UnitTest', <<-'TXT', uuid: '35D0E7C0-E396-4D8B-8361-89B88C3AFF0C'
${1:Something}Test := ${2:UnitTest} clone do(
	$0
)
TXT

end