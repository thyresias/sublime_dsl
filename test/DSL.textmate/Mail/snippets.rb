# encoding: utf-8

snippets do

  default_scope 'markup.quote'
  file_format :textmate

  # FIXME: illegal XML character "\u0003" replaced by 'ETX'
  key "ETX", 'Continue Quotation', <<-'TXT', uuid: 'F8AFD37B-9471-4B61-B626-6956CAD8C8CA'

${TM_CURRENT_LINE/^[ \t]*([> \t]*).*/$1/}
TXT

  key "^{", 'Insert [...]', <<-'TXT', scope: 'text.mail', uuid: '40BDA523-6089-4705-9006-43EA2D17A0F1', file: '[...]'
[...]
TXT

end