# encoding: utf-8

snippets do

  default_scope 'source.po'
  file_format :textmate

  tab 'id', 'Message ID', <<-'TXT', uuid: 'CB613B1C-529B-4263-983B-55AAF52E1173', file: 'msgid'
msgid "${1:original text}"

TXT

  tab 'str', 'Message String', <<-'TXT', uuid: '33ABBF80-472E-44F5-8340-D022B75163EC', file: 'msgstr'
msgstr "${1:translated text}"
TXT

end