# encoding: utf-8

snippets do

  default_scope 'source.yaml - string'
  file_format :textmate

  key "^:", 'key: value', <<-'TXT', uuid: 'D9F46A3E-4F2A-11DA-AFF2-000A95AF0064', file: 'untitled'
${1:key}: ${2:value}$0
TXT

end