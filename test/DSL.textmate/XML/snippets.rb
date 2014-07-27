# encoding: utf-8

snippets do

  default_scope 'text.xml'
  file_format :textmate

  key "\n", 'Special: Return Inside Empty Open/Close Tags', <<-'TXT', scope: 'meta.scope.between-tag-pair.xml', uuid: '121626EE-6774-4DFB-B7D5-6E5A8381F1D3', file: 'Smart return˸indent for tag pairs'

	$0

TXT

  tab '<', 'Long Tag', <<-'TXT', uuid: 'BC8B9FBD-5F16-11D9-B9C3-000D93589AF6', file: 'long tag'
<${1:name}>$0</${1/([^ ]+).*/$1/}>
TXT

  tab '<a', 'Long Attribute Tag', <<-'TXT', uuid: 'F443A9C7-88A5-40EE-820E-A311B16D85C4', file: 'long attribute tag'
<${1:name} ${2:attr="value"}>$0
</${1:name}>
TXT

  tab '>', 'Short Tag', <<-'TXT', uuid: 'BC8BA078-5F16-11D9-B9C3-000D93589AF6', file: 'short tag'
<${1:name} />
TXT

  tab 'cdata', 'CDATA', <<-'TXT', uuid: 'D7194128-6995-4A8A-B10A-A68A13101AF8'
<![CDATA[$0]]>
TXT

  tab 'xml', 'XML Processing Instruction', <<-'TXT', uuid: '4F9C4923-6A89-4B49-BB22-8C446B86D12D'
<?xml version="1.0" encoding="UTF-8"?>
TXT

end