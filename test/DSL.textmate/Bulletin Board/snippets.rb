# encoding: utf-8

snippets do

  default_scope 'text.bbcode'
  file_format :textmate

  key "@b", 'Bold', <<-'TXT', semantic_class: 'style.strong.bbcode', uuid: '99774A44-8C74-446F-8D3E-E37A6D54D851', file: 'bold'
[B]${1:${TM_SELECTED_TEXT:bold text}}[/B]$2
TXT

  key "@k", 'Color', <<-'TXT', semantic_class: 'style.alternate.color.bbcode', uuid: '4F327A34-8F6F-47B6-A0DF-50E2D7F92E39', file: 'color'
[COLOR=${1:red}]${2:${TM_SELECTED_TEXT:colored text}}[/COLOR]$3
TXT

  key "@i", 'Italic', <<-'TXT', semantic_class: 'style.emphasis.bbcode', uuid: '44E6802D-2C2F-494E-A665-B46608B8E650', file: 'italic'
[I]${1:${TM_SELECTED_TEXT:italicized text}}[/I]$2
TXT

  # FIXME: illegal XML character "\u0003" replaced by 'ETX'
  key "ETX", 'New Item', <<-'TXT', scope: 'text.bbcode markup.list', uuid: '916EA6EB-21A8-47ED-9D98-C9DDF01529A2', file: 'list-add item'

[*] $1
TXT

  key "@=", 'Size', <<-'TXT', semantic_class: 'style.alternate.size.bbcode', uuid: '925B0EDA-BD36-41C9-B9C5-E685D01B4968', file: 'size'
[SIZE=${1:12}]${2:${TM_SELECTED_TEXT:resized text}}[/SIZE]$3
TXT

  key "@u", 'Underline', <<-'TXT', semantic_class: 'style.alternate.underline.bbcode', uuid: '05C76732-B008-4133-B188-6C1315BB918C', file: 'underline'
[U]${1:${TM_SELECTED_TEXT:underlined text}}[/U]$2
TXT

  tab 'code', 'Code Block', <<-'TXT', uuid: 'EE721582-F819-4F39-919F-0348FA78D314', file: 'code'
[CODE]$1[/CODE]
TXT

  tab 'img', 'Image', <<-'TXT', uuid: 'F4B70E42-A03C-4402-9C1D-486FEDC20FE4', file: 'image'
[IMG]${1:source}[/IMG]$2
TXT

  tab 'list', 'New List', <<-'TXT', uuid: 'C10CE5FF-27AE-4729-822D-9C1C6AEC3DF7', file: 'list'
[LIST${1:=1}]
[*] ${2:item 1}
[/LIST]
TXT

  tab 'quote', 'Quotation', <<-'TXT', uuid: 'CC370DEF-7BFD-4A6C-8796-99557D22085B', file: 'quote'
[QUOTE]Originally posted by ${1:user}:
${2:quotation}[/QUOTE]
$3
TXT

  tab 'url', 'Link', <<-'TXT', uuid: 'B0D11FBB-5C9D-4DA2-AF4D-9EACAC814720', file: 'link'
[URL=${1:url}]${2:link text}[/URL]$3
TXT

end