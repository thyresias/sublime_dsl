# encoding: utf-8

snippets do

  default_scope 'text.html.markdown -meta.disable-markdown'
  file_format :textmate

  key "^\n", 'Hard Linebreak', <<-'TXT', uuid: '4405912F-4AD5-40F8-93B3-A63394036ACA', file: 'Hard linebreak'


TXT

end