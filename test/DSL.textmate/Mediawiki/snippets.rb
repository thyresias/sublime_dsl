# encoding: utf-8

snippets do

  default_scope 'text.html.mediawiki'
  file_format :textmate

  key "@b", 'Bold', <<-'TXT', semantic_class: 'style.strong.mediawiki', uuid: 'CB4A4D35-3068-4EA5-BC46-92A32278FC7F'
'''${0:${TM_SELECTED_TEXT:bold text}}'''
TXT

  key "@k", 'Code', <<-'TXT', semantic_class: 'style.alternate.raw.mediawiki', uuid: 'CD2330E1-14A4-428D-9106-F3C114920E22'
<code>${0:${TM_SELECTED_TEXT:code}}</code>
TXT

  key "@i", 'Italics', <<-'TXT', semantic_class: 'style.emphasis.mediawiki', uuid: '1F45179D-C2A1-4239-B378-003FF99D7526'
''${0:${TM_SELECTED_TEXT:italic text}}''
TXT

  # FIXME: illegal XML character "\u0003" replaced by 'ETX'
  key "ETX", 'New List Item', <<-'TXT', scope: 'text.html.mediawiki markup.list', uuid: 'BB36CDF4-4D40-449A-B1DA-7813798DA3B8'

${TM_CURRENT_LINE/^([:;#* ]*).*/$1/}
TXT

  tab 'bib', 'Insert References list (bib)', <<-'TXT', uuid: '4D701709-0454-4A0A-9FB7-8D8D48C5A94D', bundle_uuid: '64C4222F-7054-4A26-B91E-A82F53166142'
== ${1:References} ==
<references/>
TXT

  tab 'cn', 'Citation Needed', <<-'TXT', uuid: 'A16917C4-776F-49D7-B1DB-B277A05540BB', bundle_uuid: '64C4222F-7054-4A26-B91E-A82F53166142', file: 'Fact (request a citation)'
{{${1|cn,Who,Whom,Quantify,When,Time|}|date=`date "+%B %Y"`}}
TXT

  tab 'code', 'syntaxhighlight', <<-'TXT', uuid: '97042E83-482A-41E0-8044-B8B23457A0BB'
<!-- http://www.mediawiki.org/wiki/Extension:SyntaxHighlight_GeSHi -->
<syntaxhighlight lang="${1|rsplus,php|}"${2: line="${3|GESHI_NORMAL_LINE_NUMBERS,GESHI_FANCY_LINE_NUMBERS|}" line start="${4:1}" highlight="${5:1}" enclose="${6|pre,div,none|}"}>

</syntaxhighlight>

TXT

  tab 'image', 'Image', <<-'TXT', uuid: 'C1BCD487-9A96-48FB-BA13-508A34A02094'
[[File:${1:TM_SELECTED_TEXT:filename.extension}${2:|${3:width}px}${4:|caption}]]
TXT

  tab 'image', 'Image options', <<-'TXT', uuid: '08B81017-93C6-45D3-A3FD-A9143E6C32B0'
[[File:${1:TM_SELECTED_TEXT:filename.extension}${2:|${3:width}px}${4:|caption}]]


border|frameless|frame|thumbnail

 — Resizes the image to fit within the given maximum width in pixels, without restricting its height;
x{height}px — Resizes the image to fit within the given maximum height in pixels, without restricting its width;
{width}x{height}px — Resizes the image to fit within the given width and height in pixels;

left|right|center
baseline|sub|super|top|text-top|middle|bottom|text-bottom
link={target}
TXT

  tab 'redirect', 'Redirect', <<-'TXT', uuid: '9A70379A-6602-4FA1-BF92-6E8379CC5B91', file: '#REDIRECT [[…]]'
#REDIRECT [[${1:Main Page}]]
TXT

  tab 'ref', 'Reference <ref>Author (year)...</ref>', <<-'TXT', uuid: 'FC973614-A03B-43EE-8F59-64C9E7122358', bundle_uuid: '64C4222F-7054-4A26-B91E-A82F53166142', file: 'Reference ˂ref˃Author (year)___˂˸ref˃'
<ref name="${1/.*\b(\w+)\s*$/$1/}$3"> ${1:Author}${2:,Other Authors}, (${3:Year}). ${4:Title, Source}.</ref>
TXT

  tab 'ref', 'Reference DOI', <<-'TXT', uuid: 'DADDBEEB-4411-4561-B091-1019382BFAB9', bundle_uuid: '64C4222F-7054-4A26-B91E-A82F53166142'
<ref name="${1:label}"> {{Cite doi|${2:10.1146/annurev.earth.33.092203.122621}}}</ref>
TXT

  tab 'ref', 'Reference PMID', <<-'TXT', uuid: 'F36B4588-8104-4A78-8821-188468DB406D', bundle_uuid: '64C4222F-7054-4A26-B91E-A82F53166142'
<ref name="${1:label}"> {{Cite pmid|${2:12122621}}}</ref>
TXT

  tab 'tab', 'Insert Table', <<-'TXT', uuid: 'C9B8FF0E-2336-4FC9-9A02-391C516BEED1'
{| class="sortable wikitable" style="font-size: 100%; text-align: center;"
! ${1:col1Name}
! ${2:col2Name}
! ${3:col3Name}
|-
| ${4:r1 $1} || ${5:r1 $2} || ${6:r1 $3}
|-
| ${7:r1 $1} || ${8:r1 $2} || ${9:r1 $3}
|}
TXT

  # FIXME: illegal XML character "\u0003" replaced by 'ETX'
  tab 'un', 'Insert Row', <<-'TXT', scope: 'markup.other.table.row.mediawiki', uuid: '0F9934D8-DE67-4473-A6A8-52540BCC8FEA', file: 'table row', key_equivalent: "ETX"

|-
||${1:cell}||${2:cell}||
TXT

  tab 'un', 'Ordered List Item', "\n# ", scope: 'markup.list.numbered.mediawiki', uuid: '6BFE350B-6616-48A1-96DE-7986D7779E11', key_equivalent: "\n"

  tab 'un', 'Unordered Item', "\n* ", scope: 'markup.list.unnumbered.mediawiki', uuid: '0BDA6124-1DAE-49FA-875A-ED5DEC6639D2', key_equivalent: "\n"

end