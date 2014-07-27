# encoding: utf-8

snippets do

  default_scope 'source.ocaml'
  file_format :textmate

  key " ", 'Insert Spaces in Comment', " $0 ", scope: 'comment.block.ocaml & (L:punctuation.definition.comment.begin.ocaml & R:punctuation.definition.comment.end.ocaml)', uuid: '17EB5600-2B1B-4EAF-9723-6B7CAE3505B0'

  key "@|", 'new pattern match', <<-'TXT', uuid: 'D2DF2187-7473-11D9-8C1B-000A95AFE286'

| ${1:patt} -> ${2:expr}
TXT

  tab 'begin', 'begin', <<-'TXT', uuid: '0F8C60E3-B1F4-404E-BDEA-9601FE9FB175'
begin
	$0
end
TXT

  tab 'class', 'class', <<-'TXT', uuid: '65713FCA-7473-11D9-8C1B-000A95AFE286'
class ${1:name} =
	object ${2:(self)}
		${3:contents}
	end
TXT

  tab 'cr', 'CR', <<-'TXT', scope: 'source', uuid: '4FD90BDA-3348-486F-BCDB-A07DB264ED64'
(* CR `whoami`: $1 *)$0
TXT

  tab 'doc', 'Document', <<-'TXT', uuid: 'D1742879-4F2B-48A1-9273-7D731BC07E7D'
(** [$1] $0 *)
TXT

  tab 'for', 'for loop', <<-'TXT', uuid: '6C4B9D57-B3CB-4873-9911-A9C236D597E1', file: 'For Loop'
for ${1:i} = ${2:startval} to ${3:endval} do
	$4
done
$0
TXT

  tab 'fun', 'function', <<-'TXT', uuid: '05FE7472-7473-11D9-8C1B-000A95AFE286', file: 'fun'
(fun ${1:()} -> ${2:body})
TXT

  tab 'func', 'function alt', <<-'TXT', uuid: '2B22784A-7473-11D9-8C1B-000A95AFE286', file: 'func'
(function
| ${1:patt1} -> ${2:expr1}
| ${3:patt2} -> ${4:expr2})
TXT

  tab 'let', 'let', <<-'TXT', uuid: '62BB8982-7475-11D9-AAF2-000A95AFE286'
let ${1:var(s)} = ${0:expr}
TXT

  tab 'lin', 'let in', <<-'TXT', uuid: '7FB48182-7475-11D9-AAF2-000A95AFE286'
let ${1:var(s)} = ${2:expr} in ${3:expr2}
TXT

  tab 'match', 'match', <<-'TXT', uuid: 'C332D848-7472-11D9-8C1B-000A95AFE286'
match ${1:value} with
| ${2:patt} -> ${3:expr}
| ${4:_} -> ${5:expr2}
TXT

  tab 'method', 'method', <<-'TXT', uuid: 'E989F53A-6E5B-4C5F-AB96-7B9620CFECA5', file: 'method (method)'
method ${1:name} = $0
TXT

  tab 'module', 'module', <<-'TXT', uuid: 'A7ED7818-7473-11D9-8C1B-000A95AFE286'
module ${1:Name} = struct
	$0
end
TXT

  tab 'mtype', 'module type', <<-'TXT', uuid: '49085341-FBC2-4B1F-B14C-C84ED10151FB'
module type ${1:Name} = sig
	$0
end
TXT

  tab 'sig', 'module signature', <<-'TXT', uuid: 'DABEBD6F-5C97-409B-8A5B-36224D216C95'
module ${1:Name} : sig
	$0
end
TXT

  tab 'thread', 'untitled', "ignore (Thread.create (fun () -> \n    $0\n  ) ())", uuid: '23BD38C6-AA59-4E74-A3CB-76CB36A50A0B'

  tab 'try', 'try', <<-'TXT', uuid: '06632EEC-207B-47FD-85D9-B4F25E5491FF'
try
	$0
with
| _ -> failwith "Unknown"
TXT

  tab 'type', 'type', <<-'TXT', uuid: '0F6427F5-F611-4E1B-A9BA-55D239E87B2B', file: 'type (type)'
type ${1:name} = $0
TXT

  tab 'while', 'while loop', <<-'TXT', uuid: '736D4A21-0B77-4AFB-9DE5-343F49453BA3', file: 'While Loop'
while ${1:condition} do
	$0
done
TXT

  tab '|', 'match pattern', <<-'TXT', uuid: '2B56BBDC-294B-4775-A121-28CB3A50F380'
| ${1:pattern} -> $0
TXT

  tab '~f', 'function label', <<-'TXT', uuid: 'C54009ED-EF19-4C16-BDC4-F568489B202E'
~f:(fun ${1:()} -> ${2:body})
TXT

end