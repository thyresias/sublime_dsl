# encoding: utf-8

snippets do

  default_scope 'source.go'
  file_format :textmate

  key "\n", 'Empty ()', <<-'TXT', scope: 'meta.parens.empty.go', uuid: '214A69FB-0168-465E-AB51-D8C6C46BCF61'

	$0

TXT

  tab 'for', 'For Loop', <<-'TXT', uuid: '7DA0072A-BF35-413B-B4D9-B5C2B4D20FF2'
for ${2:i} := 0; $2 < ${1:count}; ${3:$2++} {
	$0
}
TXT

  tab 'func', 'Function', <<-'TXT', uuid: 'E9B44CC5-B004-4793-B125-7E429FDCCE32', file: 'func'
func ${1:func_name}($2)$3 {
	$0
}
TXT

  tab 'gfn', 'go func()', <<-'TXT', uuid: '6B01E886-4CFA-476E-AE01-EFF406116978'
go func($1) {
	$0
}${2:($3)}
TXT

  tab 'if', 'If Statement', <<-'TXT', uuid: 'AF797914-E5F7-4F2B-866B-852889C6A925'
if ${1:condition} {
	$0
}
TXT

  tab 'imp', 'Import', <<-'TXT', uuid: '2DFA9510-6F88-4BC6-A409-DA4075DEA8FF', file: 'import'
import $2"${1:name}"
TXT

  tab 'main', 'main()', <<-'TXT', uuid: '18A04BC9-D37A-46B9-8C92-4E8D287A46E4'
func main() {
	$0
}
TXT

  tab 'st', 'Struct', <<-'TXT', uuid: 'CC5D7F66-6BBC-4D9C-BC32-D569238523EB'
struct {
	${0:var vartype;}
}
TXT

  tab 'tfunc', 'Type Function', <<-'TXT', uuid: 'D8CF6ACF-85BB-4AAD-BFDE-DFD9D075FCF2'
func (${1:varname typename}) ${2:func_name}($3)$4 {
	$0
}
TXT

  tab 'type', 'Type', <<-'TXT', uuid: '9E325583-D146-41A4-BA94-0B5BF91DEBF8', file: 'type'
type ${1:name} ${2:int8}
TXT

end