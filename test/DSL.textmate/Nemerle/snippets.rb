# encoding: utf-8

snippets do

  default_scope 'source.nemerle'
  file_format :textmate

  tab 'abs', 'abstract', "abstract ", uuid: 'FACB8477-4FB6-11DB-ADD3-00112474B8F0'

  tab 'class', 'class', <<-'TXT', uuid: '0ED94763-4FB4-11DB-ADD3-00112474B8F0'
class ${1:name}{
	public this(${2:args}){
		$3
	}
}
TXT

  tab 'do', 'do ... while', <<-'TXT', uuid: 'F1282535-4FB2-11DB-ADD3-00112474B8F0', file: 'do ___ while'
do{
	$2
} while (${1:condition})

TXT

  tab 'enum', 'enum', <<-'TXT', uuid: 'F4976134-4FB3-11DB-ADD3-00112474B8F0'
enum ${1:name}{
	| $2
}
TXT

  tab 'for', 'for', <<-'TXT', uuid: '1E6C8066-4EF4-11DB-BFFE-00112474B8F0', file: 'loop - for'
for (mutable ${1:name}=${2:value}; ${3:condition}; $1++){
	$4
}
TXT

  tab 'fore', 'foreach', <<-'TXT', uuid: '88762D83-4EF4-11DB-BFFE-00112474B8F0', file: 'loop - foreach'
foreach (${1:mutable} in ${2:collection}){
	$3
}

TXT

  tab 'if', 'if ... else', <<-'TXT', uuid: '7EDF2719-4EF3-11DB-BFFE-00112474B8F0', file: 'condition - if ___ else'
if (${1:condition}){
	$2
} else {
	$3
}
TXT

  tab 'inter', 'interface', <<-'TXT', uuid: '4D813432-4FB5-11DB-ADD3-00112474B8F0'
interface ${1:name}{
	$2
}

TXT

  tab 'macro', 'macro', <<-'TXT', uuid: '37B85B58-4FB5-11DB-ADD3-00112474B8F0'
macro ${1:name}
	syntax("$1","$2"){
	$3
}
TXT

  tab 'match', 'match', <<-'TXT', uuid: 'EA762083-4FB4-11DB-ADD3-00112474B8F0'
match (${1:value}){
| ${2:value} => $3
}
TXT

  tab 'module', 'module', <<-'TXT', uuid: '42FC2BCE-4FB4-11DB-ADD3-00112474B8F0'
module ${1:name}{
	$2
}
TXT

  tab 'Module', 'module Main', <<-'TXT', uuid: 'B1EA0FF4-4EED-11DB-98A4-00112474B8F0'
module Main{
	Main(${1:args}):void{
		$2
	}
}
TXT

  tab 'mu', 'mutable', <<-'TXT', uuid: 'CB634D17-4EEF-11DB-BFFE-00112474B8F0'
mutable ${1:name}
TXT

  tab 'ove', 'override', "override ", uuid: '18F3B13B-4FB7-11DB-ADD3-00112474B8F0'

  tab 'pri', 'private', "private ", uuid: '20AB5B00-4FBC-11DB-ADD3-00112474B8F0'

  tab 'pub', 'public', "public ", uuid: 'AAE942CC-4FB7-11DB-ADD3-00112474B8F0'

  tab 'repeat', 'repeat', <<-'TXT', uuid: '3B7CED7C-4FB3-11DB-ADD3-00112474B8F0'
repeat (${1:times}){
	$2
}
TXT

  tab 'sea', 'sealed', "sealed ", uuid: '9ABF6A2E-4FB7-11DB-ADD3-00112474B8F0'

  tab 'sta', 'static', "static ", uuid: '3874B58C-4FCA-11DB-9913-00112474B8F0'

  tab 'try', 'try ... catch ...  finally', <<-'TXT', uuid: '4FC377A6-4EF7-11DB-96B0-00112474B8F0', file: 'exceptions'
try{
	$1
} catch {
| ${2:name} is ${3:type} => $4
} finally {
	$5
}

TXT

  tab 'unless', 'unless', <<-'TXT', uuid: '7A1A7BDC-4EEE-11DB-98A4-00112474B8F0', file: 'untitled'
unless (${1:condition}){
	$2
}
TXT

  tab 'variant', 'variant', <<-'TXT', uuid: 'CA56A88B-4FB3-11DB-ADD3-00112474B8F0'
variant ${1:name}{
	| $2
}
TXT

  tab 'vir', 'virtual', "virtual ", uuid: '25AFE9B6-4FB7-11DB-ADD3-00112474B8F0'

  tab 'when', 'when', <<-'TXT', uuid: 'E4B3CF04-4EF2-11DB-BFFE-00112474B8F0', file: 'condition - when'
when (${1:condition}){
	$2
}

TXT

  tab 'while', 'while', <<-'TXT', uuid: '55DA2FDA-4FB2-11DB-ADD3-00112474B8F0'
while (${1:condition}){
	$2
}
TXT

end