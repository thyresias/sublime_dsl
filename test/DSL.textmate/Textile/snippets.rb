# encoding: utf-8

snippets do

  default_scope 'text.html.textile'
  file_format :textmate

  key "@b", 'Bold', <<-'TXT', semantic_class: 'style.strong.textile', uuid: 'D446156B-1C02-43D0-8824-979FA7AC7C5D'
*$TM_SELECTED_TEXT*
TXT

  key "@'", 'Citation', <<-'TXT', uuid: '877822B7-5DFF-41B5-9114-9DD3F3563D73'
??$TM_SELECTED_TEXT??
TXT

  key "^I", 'Class', <<-'TXT', uuid: '866D5468-B364-4B66-9EF1-F4372E38CFE9'
(${1:class_name})
TXT

  key "^I", 'Class and Id', <<-'TXT', uuid: '664A2E0F-7FB4-4FAA-8889-652FA47A817C'
(${1:class}#${2:id})
TXT

  key "^I", 'Color', <<-'TXT', uuid: 'BBE99165-35FD-472E-BC77-2BA707A08540', file: 'Color 2'
{color:${1:green}}
TXT

  key "@k", 'Color Selection', <<-'TXT', semantic_class: 'style.alternate.color.textile', uuid: '11246CED-2010-411E-874B-5F6B60B3C7FE', file: 'Color'
%{color:${1:green}}$TM_SELECTED_TEXT%
TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, 'Convert Tabs To Table', <<-'TXT', uuid: 'E0D9B2D7-163F-493B-ACC6-29AF9C5F00BF'
${TM_SELECTED_TEXT/(^|$|\t)/|/g}
TXT

  key "^~", 'Footnote', <<-'TXT', uuid: 'CFF53A3D-4ADC-44F4-B60D-1DB5FAFD7317'
[${1:1}]$0

fn$1. $2
TXT

  key "^I", 'Id', <<-'TXT', uuid: 'B4767B18-66F1-489A-8E43-9B1982368E03'
(#${1:id_name})
TXT

  key "@i", 'Italic', <<-'TXT', semantic_class: 'style.emphasis.textile', uuid: '58E9370D-19C9-466E-A4E0-7D067A9A7C5A'
_${TM_SELECTED_TEXT}_
TXT

  key "^I", 'Language', <<-'TXT', uuid: '2340F25E-B8AB-406C-8745-0B83690D816E'
[${1:en}]
TXT

  key "@d", 'Strikethrough', <<-'TXT', semantic_class: 'style.alternate.strikethrough.textile', uuid: '8C3FDC27-98C9-4A15-B13A-22840DA8AE28'
-$TM_SELECTED_TEXT-
TXT

  key "^I", 'Style', <<-'TXT', uuid: 'C722F8F6-AB71-422A-A5B3-8C2C92EAE547'
{${1:style}}
TXT

  key "^$", 'Subscript', <<-'TXT', uuid: '2F490EA0-DE03-4A61-989E-D3E853CEAA4A'
~$TM_SELECTED_TEXT~
TXT

  key "^$", 'Superscript', <<-'TXT', uuid: 'E6C4BEC8-A5D9-453A-A168-2EEBD50ECDE2'
^$TM_SELECTED_TEXT^
TXT

  key "@u", 'Underline', <<-'TXT', semantic_class: 'style.alternate.underline.textile', uuid: 'AF1E916C-AF7F-417D-9776-A11FDF9668C8'
+$TM_SELECTED_TEXT+
TXT

  tab 'acr', 'Acronym', <<-'TXT', uuid: '8190AA36-B729-4B14-89CE-9259F106459F'
${1:ABC}(${2:Always Be Closing})
TXT

  tab 'bq', 'Block Quote', <<-'TXT', uuid: '7D7529CF-11F4-43B4-8F8D-ACA66F64FCE7', file: 'Block Quotes'
bq. ${1:A quote...}

$0
TXT

  tab 'h1', 'Heading 1', <<-'TXT', uuid: '114730E7-5F5F-4324-86B7-ED1982F2F27E'
h1. ${1:Text...}

$0
TXT

  tab 'h2', 'Heading 2', <<-'TXT', uuid: 'F8EFA926-E0FC-4B6F-93C6-030F71F7912E'
h2. ${1:Text...}

$0
TXT

  tab 'h3', 'Heading 3', <<-'TXT', uuid: '545B26C2-33F2-40C1-94A1-FCCA0EB9BCA6'
h3. ${1:Text...}

$0
TXT

  tab 'h4', 'Heading 4', <<-'TXT', uuid: '425C93B8-5B1A-44E2-88AA-1E910AF6D5CD'
h4. ${1:Text...}

$0
TXT

  tab 'h5', 'Heading 5', <<-'TXT', uuid: '1EFB0855-D4EB-49C0-8C44-4F35DD4DA5D2'
h5. ${1:Text...}

$0
TXT

  tab 'h6', 'Heading 6', <<-'TXT', uuid: 'F4E856BE-6FCE-4933-8E6D-413B8835ABC5'
h6. ${1:Text...}

$0
TXT

  tab 'img', 'Image', <<-'TXT', uuid: '0A8DF563-5218-4164-9409-48B6000C08EA'
!${1:http://site.com/image}(${2:Title})!
TXT

  tab 'linkimg', 'Linked Image', <<-'TXT', uuid: '9166AEA1-E834-4C95-A638-5A3FE6963488'
!${1:http://site.com/image}(${2:Title})!:${3:http://linkedsite.com}
TXT

end