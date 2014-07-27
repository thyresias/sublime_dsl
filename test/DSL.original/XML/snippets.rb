# encoding: utf-8

snippets do

  default_scope 'text.xml'

  tab '<', 'Long Tag', <<-'TXT', file: 'long-tag'
<${1:p}>${2:$SELECTION}</${1/([^ ]+).*/$1/}>
TXT

  tab '>', 'Short Tag', <<-'TXT', file: 'short-tag'
<${1:name} />
TXT

  tab 'c', 'Comment', <<-'TXT', file: 'comment'
${0:<!-- ${1:$SELECTION} -->}
TXT

  tab 'cdata', 'CDATA', <<-'TXT', file: 'cdata'
<![CDATA[${0:$SELECTION}]]>
TXT

  tab 'xml', 'XML Processing Instruction', <<-'TXT', file: 'XML-Processing-Instruction'
<?xml version="1.0" encoding="UTF-8"?>
TXT

end