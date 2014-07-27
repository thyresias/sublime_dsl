# encoding: utf-8

snippets do

  default_scope 'text.setext'
  file_format :textmate

  tab 'link', 'Hypertext Link Def', <<-'TXT', uuid: 'D983EE17-2AD0-4638-BCC0-5622DE545093', file: 'Hypertext Link Ref  (link)'
.. _${1:hot_word} ${2:http://macromates.com/}
$0
TXT

  tab 'note', 'Hypertext Note Def', <<-'TXT', uuid: 'FD9B5384-BAB6-48CC-B8BE-B4BD44AD65D7', file: 'Hypertext Note Def  (link)'
.. _${1:hot_word} (${2:note text})
$0
TXT

end