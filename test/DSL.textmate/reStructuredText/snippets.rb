# encoding: utf-8

snippets do

  default_scope 'text.restructuredtext'
  file_format :textmate

  tab 'image', 'image', <<-'TXT', uuid: '081B7322-7D71-4C38-9E33-FEE716AA4D17'
.. image:: ${1:path}
$0
TXT

  tab 'link', 'link', <<-'TXT', uuid: '53A0FA7F-261F-4B59-8FC2-5E7E8BA44E42'

\`${1:Title}<${2:http://link}>\`_
TXT

  tab 'sec', 'section 1', <<-'TXT', uuid: '7B6D031A-FF9A-475A-8FD4-F8C099F96313'
${1:subsection name}
${1/(.)|\s/(?1:=:=)/g}
$0
TXT

  tab 'sss', 'section 3', <<-'TXT', uuid: '52736608-3034-4ECE-8B85-41D3F38A4029'
${1:subsection name}
${1/(.)|\s/(?1:-:-)/g}
$0
TXT

  tab 'subs', 'section 2', <<-'TXT', uuid: 'CCE7CCB5-048A-4AC6-B4E0-90873466BA1A'
${1:subsection name}
${1/(.)|\s/(?1:*:*)/g}
$0
TXT

end