# encoding: utf-8

snippets do

  default_scope 'comment.line'
  file_format :textmate

  # FIXME: illegal XML character "\u0003" replaced by 'ETX'
  key "ETX", 'Continue Line Comment', <<-'TXT', uuid: 'C5C928A6-AC7E-11D9-98E4-000D93589AF6', file: 'Continue line comment'

`# extract comment type from the scope name
# and convert it to the actual character(s)
CH=$(perl <<<$TM_SCOPE -pe 's/.*\bcomment\.line\.([^. ]*).*/$1/')
grep -w ^$CH <<EOF|cut -f2|tr -d \n
double-slash	//
double-dash	--
number-sign	#
percentage	%
asterisk	*
semicolon	;
apostrophe	'
backtick	\\\`
at-sign	@
double-backslash	\\\\
double-dot	..
double-number-sign	##
exclamation	!
slash	/
EOF` $0
TXT

  # FIXME: missing scope, will be default_scope
  key "@\"", 'Double Quotes — \"…\"', <<-'TXT', uuid: '9D896CE5-A52E-11D9-8CF2-000D93589AF6', file: 'Escaped Quote Pair˸ ʅʺ..ʅʺ'
\"${0:$TM_SELECTED_TEXT}\"
TXT

  # FIXME: missing scope, will be default_scope
  key "^B", 'Insert Comment Banner', <<-'TXT', uuid: '7DE18A58-37A7-4F6B-8059-4365DCF27E46', file: 'Frame text'
${TM_COMMENT_START/\s*$/ /}==${1/(.)|(?m:\n.*)/(?1:=)/g}==${TM_COMMENT_END/^\s*(.+)/ $1/}
${TM_COMMENT_START/\s*$/ /}= ${1:${TM_SELECTED_TEXT:Banner}} =${TM_COMMENT_END/\s*(.+)/ $1/}
${TM_COMMENT_START/\s*$/ /}==${1/(.)|(?m:\n.*)/(?1:=)/g}==${TM_COMMENT_END/\s*(.+)/ $1/}
TXT

  key "^\n", 'Newline — \n', <<-'TXT', scope: 'source', uuid: 'DB79A3E7-ED7C-433E-AA0E-40B2EF7FB4AD', file: 'ʅn'
\n
TXT

  key "\n", 'Return Inside Empty Item', <<-'TXT', scope: 'source & ((L:punctuation.section.*.begin & R:punctuation.section.*.end) | (L:punctuation.definition.*.begin & R:punctuation.definition.*.end)) - string', uuid: '893CC5DB-0FC8-4638-B547-A215E8C6C53F'

	$0

TXT

  # FIXME: missing scope, will be default_scope
  key "~@\"", "Single Quotes — \\'…\\'", <<-'TXT', uuid: 'AD6BAC7C-A52E-11D9-8CF2-000D93589AF6', file: "Escaped Single Quote Pair˸ ʅ'..ʅ'"
\'${0:$TM_SELECTED_TEXT}\'
TXT

  key "]", 'Strip Wrap Characters', <<-'TXT', scope: 'dyn.selection & -dyn.caret.mixed', uuid: '879EF993-001F-444A-A803-1225C83B980A'
${0:${TM_SELECTED_TEXT/\A@?[\[({"'“‘`](.*)[`’”'"})\]]\z/$1/m}}
TXT

end