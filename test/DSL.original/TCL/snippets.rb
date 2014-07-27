# encoding: utf-8

snippets do

  default_scope 'source.tcl'

  tab 'for', 'for...', <<-'TXT', file: 'for...-(for)'
for {${1:set i 0}} {${2:\$i < \$n}} {${3:incr i}} {
	${4}
}

TXT

  tab 'foreach', 'foreach...', <<-'TXT', file: 'foreach...-(foreach)'
foreach ${1:var} ${2:\$list} {
	${3}
}

TXT

  tab 'if', 'if...', <<-'TXT', file: 'if...-(if)'
if {${1:condition}} {
	${2}
}

TXT

  tab 'proc', 'proc...', <<-'TXT', file: 'proc...-(proc)'
proc ${1:name} {${2:args}} \\
{
	${3}
}

TXT

  tab 'switch', 'switch...', <<-'TXT', file: 'switch...-(switch)'
switch ${1:-exact} -- ${2:\$var} {
	${3:match} {
		${4}
	}
	default {${5}}
}

TXT

  tab 'while', 'while...', <<-'TXT', file: 'while...-(while)'
while {${1:condition}} {
	${2}
}

TXT

end