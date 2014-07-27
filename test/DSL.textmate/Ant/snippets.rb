# encoding: utf-8

snippets do

  default_scope 'text.xml.ant'
  file_format :textmate

  tab 'ban', 'Insert Comment Banner', <<-'TXT', uuid: '000AF780-6688-4684-95DF-DE3498B48274', file: 'Doc Banner', key_equivalent: "^B"
<!-- =================================
      target: $1
     ================================= -->
TXT

end