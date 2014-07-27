# encoding: utf-8

snippets do

  default_scope 'source.ocaml'

  tab 'begin', 'begin', <<-'TXT'
begin
	$0
end
TXT

  tab 'class', 'class', <<-'TXT'
class ${1:name} =
	object ${2:(self)}
		${3:contents}
	end
TXT

  tab 'doc', 'Document', <<-'TXT'
(** [$1] $0 *)
TXT

  tab 'for', 'for loop', <<-'TXT', file: 'For-Loop'
for ${1:i} = ${2:startval} to ${3:endval} do
	$4
done
$0
TXT

  tab 'fun', 'function', <<-'TXT', file: 'fun'
(fun ${1:()} -> ${2:body})
TXT

  tab 'func', 'function alt', <<-'TXT', file: 'func'
(function
| ${1:patt1} -> ${2:expr1}
| ${3:patt2} -> ${4:expr2})
TXT

  tab 'let', 'let', <<-'TXT'
let ${1:var(s)} = ${0:expr}
TXT

  tab 'lin', 'let in', <<-'TXT', file: 'let-in'
let ${1:var(s)} = ${2:expr} in ${3:expr2}
TXT

  tab 'match', 'match', <<-'TXT'
match ${1:value} with
| ${2:patt} -> ${3:expr}
| ${4:_} -> ${5:expr2}
TXT

  tab 'method', 'method', <<-'TXT', file: 'method-(method)'
method ${1:name} = $0
TXT

  tab 'module', 'module', <<-'TXT'
module ${1:Name} = struct
	$0
end
TXT

  tab 'mtype', 'module type', <<-'TXT', file: 'module-type'
module type ${1:Name} = sig
	$0
end
TXT

  tab 'sig', 'module signature', <<-'TXT', file: 'module-signature'
module ${1:Name} : sig
	$0
end
TXT

  tab 'thread', 'untitled', "ignore (Thread.create (fun () -> \n    $0\n  ) ())"

  tab 'try', 'try', <<-'TXT'
try
	$0
with
| _ -> failwith "Unknown"
TXT

  tab 'type', 'type', <<-'TXT', file: 'type-(type)'
type ${1:name} = $0
TXT

  tab 'while', 'while loop', <<-'TXT', file: 'While-Loop'
while ${1:condition} do
	$0
done
TXT

  tab '|', 'match pattern', <<-'TXT', file: 'match-pattern'
| ${1:pattern} -> $0
TXT

  tab '~f', 'function label', <<-'TXT', file: 'function-label'
~f:(fun ${1:()} -> ${2:body})
TXT

end