# encoding: utf-8

snippets do

  default_scope 'text.html.dokuwiki'
  file_format :textmate

  key "@b", 'Bold', <<-'TXT', semantic_class: 'style.strong.dokuwiki', uuid: '76132630-5D14-4498-9338-D0F9522A3130'
**${TM_SELECTED_TEXT:text}**
TXT

  key "@i", 'Italic', <<-'TXT', semantic_class: 'style.emphasis.dokuwiki', uuid: '61AF74D7-AAD9-4206-BF17-B18B9EACCAA9'
//${TM_SELECTED_TEXT:text}//
TXT

  key "@u", 'Underlined', <<-'TXT', semantic_class: 'style.alternate.underline.dokuwiki', uuid: '04B0A93A-E8E5-4516-A4A4-897362A43540'
__${TM_SELECTED_TEXT:text}__
TXT

  tab '^', 'Top Header', <<-'TXT', uuid: 'FF3A19A1-E063-4026-9FDB-780F6616BB2A'
^ ${1:header} ^$0
TXT

  tab 'code', 'Code', <<-'TXT', semantic_class: 'style.alternate.raw.dokuwiki', uuid: '3107697A-39C7-4EFF-B115-7F5ED98B31AC'
<code>
$1
</code>
$0
TXT

  tab 'fn', 'Footnote', <<-'TXT', uuid: '83126C3C-4297-41C0-8DDF-EF542F4F4A4B'
(($1))
TXT

  tab 'h1', 'Heading 1', <<-'TXT', uuid: '43540858-1657-4ECC-BF3A-24EB3FE37F93'
====== ${1:heading} ======

TXT

  tab 'h2', 'Heading 2', <<-'TXT', uuid: 'D07A61C8-BB2F-4DF1-B376-C8124F215C8D'
===== ${1:heading} =====

TXT

  tab 'h3', 'Heading 3', <<-'TXT', uuid: '710E6F13-E35B-432C-A414-E9EE6F1C7B6F'
==== ${1:heading} ====

TXT

  tab 'h4', 'Heading 4', <<-'TXT', uuid: 'E4985429-C2A8-4B57-B51C-B56AAFB78397'
=== ${1:heading} ===

TXT

  tab 'h5', 'Heading 5', <<-'TXT', uuid: 'F41642D5-83E1-4F26-88AC-ACA934049E39'
== ${1:heading} ==

TXT

  tab 'img', 'Image', <<-'TXT', uuid: '884B287D-23D9-45A9-ACF1-4F642008A516'
{{${1:image}|${2:caption}}}
TXT

  tab 'lh', 'Left Header', <<-'TXT', uuid: 'F8D115F4-6DC5-43B2-A591-2EF68DD7F421'
^ ${1:header} |$0
TXT

  tab 'link', 'Link', <<-'TXT', uuid: '9DB42640-627B-4979-8345-16C842CBA83F'
[[$1|$2]]$0
TXT

  tab 'nu', 'Numbered item', "\n- ", scope: 'markup.list.numbered.dokuwiki', uuid: '655EC983-10E9-4ECD-924B-14B6E7E2023F', file: 'Numbered item 2', key_equivalent: "\n"

  tab 'nu', 'Numbered list', "  - ", uuid: '5F58856F-E66C-498D-A3AE-43C654A08745', file: 'Numbered item'

  tab 'tab', 'Table', "^ ${1:head0} ^ ${2:head1} ^ ${3:head2} ^\n| ${4:data} | ${5:data} | ${6:data} | \n| ${7:data} | ${8:data} | ${9:data} | \n| ${10:data} | ${11:data} | ${12:data} |\n", uuid: '3B51612E-DC9E-4BD9-B1A5-69DE989265AE'

  tab 'un', 'Unnumbered item', "\n* ", scope: 'markup.list.unnumbered.dokuwiki', uuid: '7E8E4E0B-B686-4256-947A-BD64888B7F78', file: 'Unnumbered item 2', key_equivalent: "\n"

  tab 'un', 'Unnumbered list', "  * ", uuid: 'F3CA2ACA-9CC5-4EF9-B93C-602D67763EFB', file: 'Unnumbered item'

  tab '|', 'Table Cell', <<-'TXT', uuid: '26788F47-A936-42E1-A0D4-1860F1B3CC81'
| ${1:cell} |$0
TXT

end