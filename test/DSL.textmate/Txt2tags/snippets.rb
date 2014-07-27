# encoding: utf-8

snippets do

  default_scope 'text.txt2tags'
  file_format :textmate

  key "@b", 'Bold', <<-'TXT', semantic_class: 'style.strong.txt2tags', uuid: '96025CA6-A2F9-41A3-8AFF-1DDF88FFECB8'
**${1:${TM_SELECTED_TEXT}}**
TXT

  key "@i", 'Italic', <<-'TXT', semantic_class: 'style.emphasis.txt2tags', uuid: '4E1C5783-8868-4E8C-83DD-394AFC9A6E93'
//${1:${TM_SELECTED_TEXT}}//
TXT

  key "@k", 'Monospaced', <<-'TXT', semantic_class: 'style.alternate.monospace.txt2tags', uuid: 'BF5F154C-AD22-4191-AF49-4B0ECC850575'
\`\`${1:${TM_SELECTED_TEXT}}\`\`
TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, 'Protected (Raw)', <<-'TXT', semantic_class: 'style.alternate.raw.txt2tags', uuid: '29977512-BA22-4686-B833-574316E6E8F3'
""${1:${TM_SELECTED_TEXT}}""
TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, 'Protected Block (Raw)', <<-'TXT', uuid: 'F17DB8FF-3314-47EA-B3BC-09B65AD1ED94'

"""
$0${TM_SELECTED_TEXT:- insert raw text here -}
"""

TXT

  key "@\u007F", 'Strike', <<-'TXT', uuid: '2ABF61A7-6FF1-4A80-9A34-AEA721DE0C2E'
--${1:${TM_SELECTED_TEXT}}--
TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, 'Tagged', <<-'TXT', uuid: '676EC692-3D72-47FF-8A3A-A107A30EA319'
''${1:${TM_SELECTED_TEXT}}''
TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, 'Tagged Block', <<-'TXT', uuid: '2BFB44AA-07C2-4359-951D-50BE04201DF9'

'''
$0${TM_SELECTED_TEXT:- insert tagged text here -}
'''

TXT

  key "@u", 'Underline', <<-'TXT', semantic_class: 'style.alternate.underline.txt2tags', uuid: '7E89AE2D-2C71-4739-B95E-47D2697C690D'
__${1:${TM_SELECTED_TEXT}}__
TXT

  tab '+', 'Numbered Title', <<-'TXT', uuid: '1295273D-5E3D-454A-A974-81DC71B54A9E', key_equivalent: "^+"
+ ${1:${TM_SELECTED_TEXT:My Title}} +${2:[${3:optional-anchor}]}
TXT

  tab '=', 'Title', <<-'TXT', uuid: '540AA439-3D16-4CB7-97AA-F6CAA1AAE87E', key_equivalent: "^="
= ${1:${TM_SELECTED_TEXT:My Title}} =${2:[${3:optional-anchor}]}
TXT

  tab '>', 'Quote', <<-'TXT', uuid: 'EE375C32-C5E7-4D2B-B827-D8C58C79815C'
	${1:- insert quote here -}
TXT

  tab '[', 'Image', <<-'TXT', uuid: '86555501-E5E7-46B7-9DDE-4ABD3C8DF7BB', key_equivalent: "^I"
[${1:${TM_SELECTED_TEXT:`#!/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby

def make_link(text)
  case text
  when %r{\A(?i)(.*\.(png|jpe?g|gif|eps|bmp))\z}:     "#{$1}"
  else "Picture.jpg"
  end
end

text = %x{__CF_USER_TEXT_ENCODING=$UID:0x8000100:0x8000100 pbpaste}.strip
print make_link(text)
`}}]
TXT

  tab '[', 'Link', <<-'TXT', uuid: '2C8ED762-B898-4BEE-93C0-4006ED03DFC1', key_equivalent: "^L"
[${1:${TM_SELECTED_TEXT:Site Name}} ${2:`#!/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby

def entity_escape(text)
  # no need to escape, txt2tags already does it
  return text
end

def make_link(text)
  case text
  when %r{\A(mailto:)?(.*?@.*\..*)\z}:        "mailto:#{$2}"
  when %r{\A[a-zA-Z][a-zA-Z0-9.+-]*://.*\z}:  entity_escape(text)
  when %r{\A.*\.(com|uk|net|org|info)\z}:     "http://#{entity_escape text}"
  when %r{\A\S+\z}:                           entity_escape(text)
  else                                        "http://example.com/"
  end
end

text = %x{__CF_USER_TEXT_ENCODING=$UID:0x8000100:0x8000100 pbpaste}.strip
print make_link(text)

`}]
TXT

  tab '`', 'Verbatim Block (Code)', <<-'TXT', uuid: 'B78FDA0E-AC0A-467E-91A3-FD8923F4DA62', file: 'Verbatim Block (code)', key_equivalent: "~@k"

\`\`\`
${1:${TM_SELECTED_TEXT:- insert code here -}}
\`\`\`

TXT

  tab 'date', 'Current Date', <<-'TXT', uuid: '7568C1CA-5D02-46A0-8395-E3E03CA1D802'
%%date(year:%Y month:%m day:%d hour:%H min:%M sec:%S date:%c weekday:%A %a month-name:%B %b)
TXT

  tab 'encoding', 'Encoding', <<-'TXT', uuid: 'F9E37C13-90B1-4E33-80FA-8898DA5AB5D3'
%!encoding(${1:html | xhtml | sgml | tex | lout | man | mgp | wiki | gwiki | doku | moin | pm6 | txt}): ${2:utf-8}

TXT

  tab 'filter', 'Post-Processing', "%!postproc(${1:html | xhtml | sgml | tex | lout | man | mgp | wiki | gwiki | doku | moin | pm6 | txt}): \"${2:pattern}\" \"${3:replacement}\" \n", uuid: '141392EF-DDC2-429A-AFD6-8524A2400934'

  tab 'filter', 'Pre-Processing', "%!preproc(${1:html | xhtml | sgml | tex | lout | man | mgp | wiki | gwiki | doku | moin | pm6 | txt}): \"${2:pattern}\" \"${3:replacement}\" \n", uuid: 'F374D5CA-5EA1-4ECA-9AF1-CF3953C0B97E'

  tab 'include', 'Include as Raw', <<-'TXT', uuid: '634ABB16-5281-447A-B9A9-062F7E59CB63'
%!include(${1:html | xhtml | sgml | tex | lout | man | mgp | wiki | gwiki | doku | moin | pm6 | txt}): ""${2:file}""

TXT

  tab 'include', 'Include as Tagged', <<-'TXT', uuid: '91037021-9141-40D7-AC9D-1C021FBCA0BF'
%!include(${1:html | xhtml | sgml | tex | lout | man | mgp | wiki | gwiki | doku | moin | pm6 | txt}): ''${2:file}''

TXT

  tab 'include', 'Include as Txt2tags', <<-'TXT', uuid: 'AD73EAA2-7972-4B8D-947B-F61790A126E7'
%!include(${1:html | xhtml | sgml | tex | lout | man | mgp | wiki | gwiki | doku | moin | pm6 | txt}): ${2:file.t2t}

TXT

  tab 'include', 'Include as Verbatim', <<-'TXT', uuid: 'B486368C-0C1B-4A3A-9E10-D36FF5A2A33D'
%!include(${1:html | xhtml | sgml | tex | lout | man | mgp | wiki | gwiki | doku | moin | pm6 | txt}): ``${2:file.txt}``

TXT

  tab 'include', 'Include Config', <<-'TXT', uuid: '4FB90B5F-9C32-49BF-951D-6D7CCEB3268D'
%!includeconf(${1:html | xhtml | sgml | tex | lout | man | mgp | wiki | gwiki | doku | moin | pm6 | txt}): ${2:file.t2t}

TXT

  tab 'infile', 'Input File', <<-'TXT', uuid: '9F9109A4-5AA2-490A-B9D9-62FE8EA25EDD'
%%infile(file:%f extension:%e dir:%d path:%p file-without-extension:%F parent-dir:%D)
TXT

  tab 'mtime', 'Modification Time', <<-'TXT', uuid: '754558C3-8AD5-4CCC-8AF8-3AFE7240D2E5'
%%mtime(year:%Y month:%m day:%d hour:%H min:%M sec:%S date:%c weekday:%A %a month-name:%B %b)
TXT

  tab 'options', 'Options', <<-'TXT', uuid: '4C0F88EF-370A-4CBE-9080-A0A44D9D30A9'
%!options(${1:html | xhtml | sgml | tex | lout | man | mgp | wiki | gwiki | doku | moin | pm6 | txt}): ${2:--no-headers | --enum-title | --toc | --toc-level n | --css-sugar | --css-inside | --mask-email | --config-file file | --outfile file}

TXT

  tab 'outfile', 'Output File', <<-'TXT', uuid: '4365D25B-0958-457B-80BB-EB2B6868F212'
%%outfile(file:%f extension:%e dir:%d path:%p file-without-extension:%F parent-dir:%D)
TXT

  tab 'style', 'Style', <<-'TXT', uuid: 'D27E6B35-E79C-4D01-84ED-43760577F602'
%!style(${1:html | xhtml | tex}): ${2:style.css}

TXT

  tab 'target', 'Target', <<-'TXT', uuid: '984D6F16-CDC4-4AB7-AB34-F0C6094D517E'
%!target: ${1:html | xhtml | sgml | tex | lout | man | mgp | wiki | gwiki | doku | moin | pm6 | txt}

TXT

  tab 'toc', 'Table Of Contents', <<-'TXT', uuid: 'CEB79704-3ADE-41AE-9AD4-9C31023F41D5'

%%toc

TXT

end