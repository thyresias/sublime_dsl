# encoding: utf-8

snippets do

  default_scope 'text.html.twiki'
  file_format :textmate

  key "@b", 'Bold', <<-'TXT', semantic_class: 'style.strong.twiki', uuid: 'B47CB936-00DD-468D-8E9E-16E2C9EA9087'
*${TM_SELECTED_TEXT:no text was selected}*
TXT

  key "@i", 'Italic', <<-'TXT', semantic_class: 'style.emphasis.twiki', uuid: 'BA34D7CB-479E-4FB0-B47D-A3BF3184966C'
_${TM_SELECTED_TEXT:no text was selected}_
TXT

  key "\n", 'List Item (↵)', <<-'TXT', scope: 'markup.list.unnumbered text.html.twiki', uuid: 'FBEBDEED-2636-469D-8A0F-8E9524824BB5'

* ${1:list item}
TXT

  key "\n", 'Numbered List Item (↵)', <<-'TXT', scope: 'text.html.twiki markup.list.numbered', uuid: 'FCECC22A-6D5C-4781-B2B8-5777FDD53F76'

1 ${1:list item}
TXT

  tab 'code', 'Verbatim', <<-'TXT', semantic_class: 'style.alternate.verbatim.twiki', uuid: '4B89D511-CEA3-48F8-8F75-2B6C427FC1DE', file: 'Verbatim (code)'
<verbatim>
	$0
</verbatim>
TXT

  tab 'def', 'Definition', <<-'TXT', uuid: 'A940B8E8-8A91-46EB-9916-436D5DDFCD2A', file: 'Definition (def)'
   ${1:term}: ${2:definition}
TXT

  tab 'h1', 'Header 1', <<-'TXT', uuid: '4523C3FF-6228-41CC-9122-C476D78D0825', file: 'Header 1 (h1)'
---+${1:Header1}

TXT

  tab 'h2', 'Header 2', <<-'TXT', uuid: 'E890D975-0C10-44B8-87BF-79CEBA630721', file: 'Header 2 (h2)'
---++${1:Header2}

TXT

  tab 'h3', 'Header 3', <<-'TXT', uuid: '9E809CF0-0D30-4F28-9DD7-2F56C46B24F0', file: 'Header 3 (h3)'
---+++${1:Header3}

TXT

  tab 'h4', 'Header 4', <<-'TXT', uuid: '4A01F006-1FB3-43C9-A8D4-348EC931BD6B', file: 'Header 4 (h4)'
---++++${1:Header4}

TXT

  tab 'h5', 'Header 5', <<-'TXT', uuid: 'BF9C2134-12AF-479F-9813-D5967EEBA015', file: 'Header 5 (h5)'
---+++++${1:Header5}

TXT

  tab 'h6', 'Header 6', <<-'TXT', uuid: '28033F2F-A106-4BFE-A81E-27DF0CE43FA2', file: 'Header 6 (h6)'
---++++++${1:Header6}

TXT

  tab 'li1', 'List Element 1', <<-'TXT', uuid: 'A09D1824-394A-485B-9AE7-89EA4EBC323A', file: 'List Element 1 (li1)'
   * $0
TXT

  tab 'li2', 'List Element 2', <<-'TXT', uuid: 'A23854CA-0E1F-4DD8-8B94-DC37B30FA59A', file: 'List Element 2 (li2)'
      * $0
TXT

  tab 'li3', 'List Element 3', <<-'TXT', uuid: '5C0F4AB3-2649-4F1D-9CD5-1F0E35498A24', file: 'List Element 3 (li3)'
         * $0
TXT

  tab 'li4', 'List Element 4', <<-'TXT', uuid: '37BE0163-DA17-4DEE-85D3-D0FF731F54B5', file: 'List Element 4 (li4)'
            * $0
TXT

  tab 'li5', 'List Element 5', <<-'TXT', uuid: '46360864-CDBB-4F48-8E86-9E0E95E15499', file: 'List Element 5 (li5)'
               * $0
TXT

  tab 'li6', 'LIst Element 6', <<-'TXT', uuid: '87E31B58-AB45-4F51-BA91-FBF4991DB5EE', file: 'LIst Element 6 (li6)'
                  * $0
TXT

  tab 'link', 'Link', <<-'TXT', uuid: 'FDD100B6-4FD7-4849-9A6A-3BF5A3EE6139', file: 'Link (link)'
[[${1:url or twiki link}][${2:description}]]
TXT

  tab 'list', 'List', <<-'TXT', uuid: 'E7D13285-F135-449C-AED0-D92D42465C68', file: 'List (list)'
   * ${1:list item 1}
      * ${2:list item 1.1}
      * ${3:list item 1.2}
   * ${4:list item 2}
      * ${5:list item 2.1}
      * ${6:list item 2.2}
TXT

  tab 'nli1', 'Numbered List Element 1', <<-'TXT', uuid: 'AE15F884-4F10-4365-8694-FB6E0891673B', file: 'Numbered List Element 1 (nli1)'
   1 $0
TXT

  tab 'nli2', 'Numbered List Element 2', <<-'TXT', uuid: '113C7192-9C79-4765-BC53-C78C7778C2F4', file: 'Numbered List Element 2 (nli2)'
      1 $0
TXT

  tab 'nli3', 'Numbered List Element 3', <<-'TXT', uuid: 'EA883D3D-8058-49B3-980D-D481CB58F43A', file: 'Numbered List Element 3 (nli3)'
         1 $0
TXT

  tab 'nli4', 'Numbered List Element 4', <<-'TXT', uuid: '285DDC36-7DD9-45A7-BAAF-3C735590D216', file: 'Numbered List Element 4 (nli4)'
            1 $0
TXT

  tab 'nli5', 'Numbered List Element 5', <<-'TXT', uuid: 'E1F5A88B-5EFD-4E09-9CE7-531AD6B600F0', file: 'Numbered List Element 5 (nli5)'
               1 $0
TXT

  tab 'nli6', 'Numbered LIst Element 6', <<-'TXT', uuid: 'D754E5B5-13D4-4BE9-B718-BC8D30EA4F34', file: 'Numbered LIst Element 6 (nli6)'
                  1 $0
TXT

  tab 'numlist', 'Numbered List', <<-'TXT', uuid: '6DB4FECE-3036-474A-BC0A-C9A503D41D3B', file: 'Numbered List (numlist)'
   1 ${1:list item 1}
      1 ${2:list item 1.1}
      1 ${3:list item 1.2}
   1 ${4:list item 2}
      1 ${5:list item 2.1}
      1 ${6:list item 2.2}
TXT

  tab 'pre', 'Preformatted', <<-'TXT', semantic_class: 'style.alternate.raw.twiki', uuid: '75F07847-6DE6-4CB5-9DD5-F42DF5E89800', file: 'Preformatted (pre)'
<pre>
	$0
</pre>
TXT

  tab 'row', 'Table Row', <<-'TXT', uuid: '7515DBDE-863B-466D-A70C-61DF10F80AD3', file: 'Table Row (row)'
| ${1:data} | ${2:data} | ${3:data} | ${4:data} |
TXT

  tab 'table', 'Table', <<-'TXT', uuid: 'B859FEDB-5866-4ABE-B00E-F4573178AB4A', file: 'Table (table)'
| ${1:head0} | ${2:head1} | ${3:head2} | ${4:head3} |
| ${5:data} | ${6:data} | ${7:data} | ${8:data} |
| ${9:data} | ${10:data} | ${11:data} | ${12:data} |
| ${13:data} | ${14:data} | ${15:data} | ${16:data} |
TXT

  tab '|', 'Table Cell', <<-'TXT', scope: 'text.html.twiki markup.other.table', uuid: 'F0C12F0B-3EC8-44A8-8398-59182803AF55', file: 'Table Cell (¦)'
| ${1:cell}  |$0
TXT

end