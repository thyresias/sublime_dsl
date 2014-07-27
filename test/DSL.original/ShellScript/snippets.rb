# encoding: utf-8

snippets do

  default_scope 'source.shell'

  # FIXME: missing scope, will be default_scope
  tab '!env', '#!/usr/bin/env', <<-'TXT', file: '#!-usr-bin-env-(!env)'
#!/usr/bin/env ${1:${TM_SCOPE/(?:source|.*)\.(?:(shell)|(\w+)).*/(?1:bash:$2)/}}

TXT

  tab 'case', 'case … esac', <<-'TXT', file: 'case-..-esac-(case)'
case ${1:word} in
	${2:pattern} )
		$0;;
esac
TXT

  tab 'elif', 'elif …', <<-'TXT', file: 'elif-..-(elif)'
elif ${2:[[ ${1:condition} ]]}; then
	${0:#statements}
TXT

  tab 'for', 'for … done', <<-'TXT', file: 'for-...-done-(for)'
for (( i = 0; i < ${1:10}; i++ )); do
	${0:#statements}
done
TXT

  tab 'forin', 'for … in … done', <<-'TXT', file: 'for-in-done-(forin)'
for ${1:i}${2/.+/ in /}${2:words}; do
	${0:#statements}
done
TXT

  tab 'if', 'if … fi', <<-'TXT', file: 'if-...-then-(if)'
if ${2:[[ ${1:condition} ]]}; then
	${0:#statements}
fi
TXT

  tab 'until', 'until … done', <<-'TXT', file: 'until-(done)'
until ${2:[[ ${1:condition} ]]}; do
	${0:#statements}
done
TXT

  tab 'while', 'while … done', <<-'TXT', file: 'while-(done)'
while ${2:[[ ${1:condition} ]]}; do
	${0:#statements}
done
TXT

end