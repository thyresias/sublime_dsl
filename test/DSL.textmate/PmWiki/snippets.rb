# encoding: utf-8

snippets do

  default_scope 'text.pmwiki'
  file_format :textmate

  key "@b", 'Bold', <<-'TXT', semantic_class: 'style.strong.pmwiki', uuid: '31DE863C-61F9-4819-AD4A-AA629E6F7477'
'''${TM_SELECTED_TEXT:no text was selected}'''

TXT

  key "@i", 'Italic', <<-'TXT', semantic_class: 'style.emphasis.pmwiki', uuid: '9D2C166D-96D8-4757-9B0A-EA6CD35709B8'
''${TM_SELECTED_TEXT:no text was selected}''

TXT

  tab 'cell', 'Table Cell', <<-'TXT', uuid: '273084A6-2F21-4CC6-9AEE-64E5B7A0C699'
|| ${1:cell} ||$0
TXT

  tab 'def', 'Definition', <<-'TXT', uuid: 'B0FA88ED-48AA-4806-950D-D7A5194C6428'
: ${1:term}: ${2:definition}

TXT

  tab 'h1', 'Header 1', <<-'TXT', uuid: 'E3110F3D-EFFF-47C8-8A7A-2A41E81C095E'
!${1:Header1}

TXT

  tab 'h2', 'Header 2', <<-'TXT', uuid: '57F51139-89AE-4A41-A562-8BE289FE84A9'
!!${1:Header1}

TXT

  tab 'h3', 'Header 3', <<-'TXT', uuid: '5711AE4E-484D-40FE-B6DD-BDBDB7FBBE2D'
!!!${1:Header1}

TXT

  tab 'h4', 'Header 4', <<-'TXT', uuid: 'DF24991C-2B3B-4DB5-9BC3-7600F9E6C122'
!!!!${1:Header1}

TXT

  tab 'h5', 'Header 5', <<-'TXT', uuid: '3A7CB5CB-ED09-4093-8267-22F0E01426F4'
!!!!!${1:Header1}

TXT

  tab 'li1', 'List Element at Level 1', <<-'TXT', uuid: '2EF6BC66-C751-4E5D-8FBA-128404508DD6', file: 'List Element 1'
* $0

TXT

  tab 'li2', 'List Element at Level 2', <<-'TXT', uuid: '04CBC812-3D54-4495-9C7A-E3CAFD32A66C', file: 'List Element 2'
	** $0

TXT

  tab 'li3', 'List Element at Level 3', <<-'TXT', uuid: '30487D20-3CDA-4737-AF3F-8384504DA413', file: 'List Element 3'
		*** $0

TXT

  tab 'li4', 'List Element at Level 4', <<-'TXT', uuid: '03D794B0-DAC1-44F6-8B7E-49D6B4E8AA11', file: 'List Element 4'
			**** $0

TXT

  tab 'li5', 'List Element at Level 5', <<-'TXT', uuid: '8C64703D-FD1A-4CF4-8032-E3C7E70EFCE2', file: 'List Element 5'
				***** $0

TXT

  tab 'link', 'Link', <<-'TXT', uuid: '0043FB07-2B53-41F0-9819-AE3E009AEEED'
[[${1:url or pmwiki link}|${2:description}]]

TXT

  tab 'linkn', 'Link (New Window as Target)', <<-'TXT', uuid: '7B2B26F8-CABA-4820-AF07-CF6EB3B0E382', file: 'Link (New Window)'
%newwin%[[${1:url or pmwiki link}|${2:description}]]

TXT

  tab 'list', 'List Skeleton', <<-'TXT', uuid: '63CC3F5C-6D1F-4428-80E2-564885E77A65', file: 'Quick List'
* ${1:list item 1}
	** ${2:list item 1.1}
	** ${3:list item 1.2}
* ${4:list item 2}
	** ${5:list item 2.1}
	** ${6:list item 2.2}

TXT

  tab 'nli1', 'Numbered List Element at Level 1', <<-'TXT', uuid: 'F9DD0D9D-2867-4F71-AF48-8252A64C7C94', file: 'Numbered List Element 1'
# $0
TXT

  tab 'nli2', 'Numbered List Element at Level 2', <<-'TXT', uuid: '9DE746B7-0082-4205-A9AB-A12C57C82B62', file: 'Numbered List Element 2'
	## $0
TXT

  tab 'nli3', 'Numbered List Element at Level 3', <<-'TXT', uuid: '0AC0940C-9C3F-4334-8694-0B7AFD9A533B', file: 'Numbered List Element 3'
		### $0
TXT

  tab 'nli4', 'Numbered List Element at Level 4', <<-'TXT', uuid: '1470410F-9CD2-4DC1-B6AC-ECC94333591E', file: 'Numbered List Element 4'
			#### $0
TXT

  tab 'nli5', 'Numbered List Element at Level 5', <<-'TXT', uuid: '2639A05A-54AE-4F2F-B164-82D7CCF51042', file: 'Numbered List Element 5'
				##### $0
TXT

  tab 'nlist', 'Numbered List Skeleton', <<-'TXT', uuid: 'A137C0EC-BFEC-4F8F-98F2-AB3D5F599392', file: 'Quick Numbered List'
# ${1:list item 1}
	## ${2:list item 1.1}
	## ${3:list item 1.2}
# ${4:list item 2}
	## ${5:list item 2.1}
	## ${6:list item 2.2}
TXT

  tab 'pre', 'Preformatted', <<-'TXT', uuid: '4BCC60BB-9B0F-4401-BA15-1701C136C127'
[=
	$0
=]
TXT

  tab 'row', 'Table Row (4 Columns)', <<-'TXT', uuid: 'A54163EA-8136-4C77-8126-DF1772261D92', file: 'Table Row (4 columns)'
|| ${1:data} || ${2:data} || ${3:data} || ${4:data} ||
TXT

  tab 'table', 'Table Skeleton (4×4 With Header)', <<-'TXT', uuid: 'EF3F3044-3CC9-4623-ADC6-FADE24F9565F', file: 'Table (Quick 4x4 incl Heads)'
|| border=${1:border} width=${2:width} align=${3:align}
|| ! ${4:table_caption} ! ||
|| !${5:head0} || !${6:head1} || !${7:head2} || !${8:head3} ||
|| ${9:data} || ${10:data} || ${11:data} || ${12:data} ||
|| ${13:data} || ${14:data} || ${15:data} || ${16:data} ||
|| ${17:data} || ${18:data} || ${19:data} || ${20:data} ||
TXT

end