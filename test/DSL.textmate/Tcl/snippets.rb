# encoding: utf-8

snippets do

  default_scope 'source.tcl'
  file_format :textmate

  tab 'for', 'for...', <<-'TXT', uuid: '35FD4583-34CA-446A-958B-D6446220B2BF', file: 'for... (for)'
for {${1:set i 0}} {${2:\$i < \$n}} {${3:incr i}} {
	${4}
}

TXT

  tab 'foreach', 'foreach...', <<-'TXT', uuid: '686ACE8E-AF2D-4429-BD3D-DB2272DE22FE', file: 'foreach... (foreach)'
foreach ${1:var} ${2:\$list} {
	${3}
}

TXT

  tab 'if', 'if...', <<-'TXT', uuid: '3BF57469-548C-4745-BB68-127C29CE70A1', file: 'if... (if)'
if {${1:condition}} {
	${2}
}

TXT

  tab 'proc', 'proc...', <<-'TXT', uuid: '16FB1812-6644-416D-8544-03F7E9C7C45E', file: 'proc... (proc)'
proc ${1:name} {${2:args}} \\
{
	${3}
}

TXT

  tab 'switch', 'switch...', <<-'TXT', uuid: '9301C846-1EED-4749-AB9D-2728EA661E97', file: 'switch... (switch)'
switch ${1:-exact} -- ${2:\$var} {
	${3:match} {
		${4}
	}
	default {${5}}
}

TXT

  tab 'tcl', '#!/usr/bin/env tcl', <<-'TXT', scope: 'L:dyn.caret.begin.document', uuid: 'A2C95E2E-6D2F-4718-9708-2C99FF5FDB11', file: '#!˸usr˸bin˸env tcl'
#!/usr/bin/env tcl

TXT

  tab 'while', 'while...', <<-'TXT', uuid: '6F958C1C-2A05-4794-A551-4C3ABAAEE817', file: 'while... (while)'
while {${1:condition}} {
	${2}
}

TXT

end