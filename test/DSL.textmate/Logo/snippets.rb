# encoding: utf-8

snippets do

  default_scope 'source.logo'
  file_format :textmate

  tab '"', 'Standalone Quote', <<-'TXT', uuid: 'EABE4310-C402-415B-AA03-8950F3AF0D3B', key_equivalent: "\""
"
TXT

  tab 'to', 'To', <<-'TXT', uuid: '902EBE48-7449-4631-BA2A-CF3242800AA7'
to ${1:procedure.name} ${2::argument}
  ${3:;procedure body}
end

TXT

end