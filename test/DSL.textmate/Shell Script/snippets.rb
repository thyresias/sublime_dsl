# encoding: utf-8

snippets do

  default_scope 'source.shell'
  file_format :textmate

  tab 'bash', '#!/usr/bin/env bash', <<-'TXT', scope: 'L:dyn.caret.begin.document', uuid: 'A15583E3-5ABC-4CFB-9BFB-1FC4EF49D3B5', file: '#!˸usr˸bin˸env bash'
#!/usr/bin/env bash

TXT

  tab 'case', 'case … esac', <<-'TXT', uuid: 'CA3AC214-9EB9-4018-AA1C-D3FF71B1FC72', file: 'case .. esac (case)'
case ${1:word} in
	${2:pattern} )
		$0;;
esac
TXT

  tab 'elif', 'elif …', <<-'TXT', uuid: 'A1E3D4D4-BFC6-11D9-BB97-000D93589AF6', file: 'elif .. (elif)'
elif ${2:[[ ${1:condition} ]]}; then
	${0:#statements}
TXT

  tab 'env', '#!/usr/bin/env', <<-'TXT', scope: 'L:dyn.caret.begin.document', uuid: '7C0F8C08-8860-4DBB-AB24-652B53E63E13', file: '#!˸usr˸bin˸env (!env)'
#!/usr/bin/env ${1:${TM_SCOPE/(?:source|.*)\.(?:(shell)|(\w+)).*/(?1:bash:$2)/}}

TXT

  tab 'for', 'for … done', <<-'TXT', uuid: 'E7807C18-AA17-11D9-AB33-000D93589AF6', file: 'for ... done (for)'
for (( i = 0; i < ${1:10}; i++ )); do
	${0:#statements}
done
TXT

  tab 'forin', 'for … in … done', <<-'TXT', uuid: '04CBE1A5-313E-4E2C-946B-255C461B8406', file: 'for … in … done (forin)'
for ${1:i}${2/.+/ in /}${2:words}; do
	${0:#statements}
done
TXT

  tab 'here', 'Here Document', <<-'TXT', uuid: 'ED7D1DEB-B124-4428-9C87-D1D9F360D78C', file: 'here document (here)'
<<-${2:'${1:TOKEN}'}
	$0
${1/['"`](.+)['"`]/$1/}
TXT

  tab 'if', 'if … fi', <<-'TXT', uuid: 'B26A35EE-AA17-11D9-AB33-000D93589AF6', file: 'if ... then (if)'
if ${2:[[ ${1:condition} ]]}; then
	${0:#statements}
fi
TXT

  tab 'sh', '#!/bin/sh', <<-'TXT', scope: 'L:dyn.caret.begin.document', uuid: '11EBD731-16B0-44BC-B27E-16DB93A29DBD', file: '#!˸usr˸bin˸env sh'
#!/bin/sh

TXT

  tab 'tmpd', 'Tempdir', <<-'TXT', uuid: 'E1738713-0473-4344-893B-12A153BCA367'
${1:TMPDIR}="\$(mktemp -d -t ${2:`echo "${TM_FILENAME%.*}" | sed -e 's/[^[:alnum:]]/_/g' -e 's/^$/untitled/'`})"
trap "${3:rm -rf '\$${1/.*\s//}'}" EXIT INT HUP TERM
$0
TXT

  tab 'tmpf', 'Tempfile', <<-'TXT', uuid: '23583387-4ACC-4A27-B6EC-58418A39EF30'
${1:TMPFILE}="\$(mktemp -t ${2:`echo "${TM_FILENAME%.*}" | sed -E -e 's/[^[:alnum:]]/_/g' -e 's/^$/untitled/'`})"
trap "${3:rm -f '\$${1/.*\s//}'}" EXIT INT HUP TERM
$0
TXT

  tab 'until', 'until … done', <<-'TXT', uuid: 'BD23B11F-D940-43D3-A784-17F3D3FABC38', file: 'until … (done)'
until ${2:[[ ${1:condition} ]]}; do
	${0:#statements}
done
TXT

  tab 'while', 'while … done', <<-'TXT', uuid: '2C961068-7683-4899-8569-DDA80ED33BC0', file: 'while … (done)'
while ${2:[[ ${1:condition} ]]}; do
	${0:#statements}
done
TXT

  tab 'zsh', '#!/usr/bin/env zsh', <<-'TXT', scope: 'L:dyn.caret.begin.document', uuid: 'D9514E90-0FC5-4C7B-B74A-3AEC616E8F76', file: '#!˸usr˸bin˸env zsh'
#!/usr/bin/env zsh

TXT

end