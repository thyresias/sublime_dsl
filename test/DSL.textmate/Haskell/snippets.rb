# encoding: utf-8

snippets do

  default_scope 'source.haskell'
  file_format :textmate

  tab '#!', '#!/usr/bin/env…', <<-'TXT', uuid: '54495635-CC26-4C14-A202-5C0CA4B078C2', file: 'Hashbang'
#!/usr/bin/env ${1:runhaskell}

TXT

  tab '-', 'Type Sequence', <<-'TXT', scope: 'source.haskell meta.function.type', uuid: '17FC3207-9DC4-47F8-A9B3-B38FE5F84158'
${1:Type} -> ${0:Type}
TXT

  tab '::', 'Type Signature', <<-'TXT', uuid: '78719987-0091-407A-B5F1-68456A67130D'
${1:name} :: ${0:Type}
TXT

  tab '<', 'Left Arrow', <<-'TXT', uuid: '9EF1F854-442C-40B2-BED5-454A015AA26D', key_equivalent: "^,"
${1:name} <- ${0:expression}
TXT

  tab '=', 'Definition', <<-'TXT', uuid: '81886A7D-5EE8-438C-9FC8-6BA3B65E444A'
${1:name} ${2:pattern}${2/.+/ /}= ${0:definition}
TXT

  tab '=', 'Type Constraint', <<-'TXT', scope: 'source.haskell meta.function.type', uuid: '1D72833B-ED9F-4A5E-9B72-F77E4FD09CE9'
(${1:Class}) => $0
TXT

  tab '>', 'Right Arrow', <<-'TXT', uuid: 'BAF52ED4-6A5B-4260-B5BC-93D2012200C8', key_equivalent: "^."
${1:expression} -> ${0:expression}
TXT

  tab '[', 'List Comprehension', "[ ${1:expression} | ${2:name} <- ${3:expression}${4/.+/, /}${4:condition} ", scope: 'source.haskell constant.language.nil', uuid: 'C721BD84-71FA-423F-8460-2CED4954137F'

  tab '\\', 'Lambda Expression', <<-'TXT', uuid: '0672CE3D-A796-44B1-AEF2-975C0FB27184'
\\${1:pattern} -> ${0:expression}
TXT

  tab '^', 'Haddock Prefix', <<-'TXT', scope: 'source.haskell comment.block', uuid: 'E0E613C1-0760-46BC-A51E-168E658904C5'
^ ${0:documentation}
TXT

  tab 'case', 'case … of …', <<-'TXT', uuid: 'DD1D7C05-BC60-4E62-BC8C-9230A32C2533', file: 'case _ of _'
case ${1:expression} of
	${2:pattern} -> ${3:expression}
	${4:otherwise} -> ${5:expression}
TXT

  tab 'cla', 'class …', <<-'TXT', uuid: '23F6173A-6390-46FF-865C-F59AB70E360A', file: 'class _'
class ${1:Class} where
	${0:definition}
TXT

  tab 'dat', 'data …', <<-'TXT', uuid: '4C5EC5BB-6AE1-4825-AB50-1CF4741285E9', file: 'data _'
data ${1:Type} = ${0:Other}
TXT

  tab 'der', 'deriving …', <<-'TXT', scope: 'source.haskell meta.type', uuid: '3FA57615-871F-4465-B35D-781B2EA9F5FC', file: 'deriving _'
deriving (${0:Class})
TXT

  tab 'do', 'do …', <<-'TXT', uuid: '397D02C1-A10B-4A83-8C05-6EB71E50D4CF', file: 'do _'
do
	${1:return ${0:expression}}
TXT

  tab 'fun', 'Function', <<-'TXT', uuid: 'A83076A6-EC6F-418F-B8F9-9AE952964242'
${1:name} :: ${2:Type}
${1} ${3:pattern}${3/.+/ /}${4/.+/= /}${4:definition}
TXT

  tab 'if', 'if … then … else …', <<-'TXT', uuid: '5F2050D1-1347-40CE-854E-24B2BF389849', file: 'if _ then _ else _'
if ${1:condition}
	then ${2:expression}
	else ${3:expression}
TXT

  tab 'imp', 'import …', <<-'TXT', uuid: '85150C9B-A5F1-450A-BEBF-119091146957', file: 'import _'
import ${1:Module}${2/.+/ (/}${2:function}${2/.+/)/}$0
TXT

  tab 'imph', 'import … hiding …', <<-'TXT', uuid: '1BA6898C-E8C4-44C9-98F4-4823608FEFD1', file: 'import _ hiding _'
import ${1:Module}${2/.+/ hiding (/}${2:function}${2/.+/)/}$0
TXT

  tab 'impq', 'import qualified …', <<-'TXT', uuid: '32BC2D63-AF02-4DBA-8A75-6A74E334FE0C', file: 'import qualified _'
import qualified ${1:Module}${2/.+/ as /}${2:Mod}${3/.+/ (/}${3:function}${3/.+/)/}$0
TXT

  tab 'ins', 'instance …', <<-'TXT', uuid: '26F8FAFE-4438-4D3C-A453-AAB72FD0F719', file: 'instance _'
instance ${1:Class} ${2:Type} where
	${0:definition}
TXT

  tab 'let', 'let …', <<-'TXT', uuid: '88C8A6FB-B06D-4386-BA33-51E28F64AD88', file: 'let _'
let
	${1:name} = ${2:expression}
	in ${0:expression}
TXT

  tab 'main', 'Main', <<-'TXT', uuid: 'A3A65891-D126-4D2D-9E6B-E20ADE2EAA88'
module Main where

main :: IO ()
main = ${0:putStrLn "Hello World"}

TXT

  tab 'new', 'newtype …', <<-'TXT', uuid: 'EFCBAB59-D574-454D-A05A-8928CF81947F', file: 'newtype _'
newtype ${1:Type} = ${0:Other}
TXT

  tab 'typ', 'type …', <<-'TXT', uuid: '3C25C0C7-D764-4BF8-9BFF-AE6954AF106D', file: 'type _'
type ${1:Type} = ${0:Other}
TXT

  tab 'where', 'where …', <<-'TXT', uuid: 'A6FD9AB4-8E7E-47A8-B17D-D82F47A0C495', file: 'where _'
where
	${0:definitions}
TXT

  tab '|', 'Guard', <<-'TXT', scope: 'source.haskell - comment', uuid: 'BA1329DB-9437-4246-839A-48A49B48D31D'
| ${1:predicate} = ${0:definition}
TXT

  tab '|', 'Haddock Postfix', <<-'TXT', scope: 'source.haskell comment.block', uuid: '961E79B9-CC31-4843-BBE9-51F46598BC25'
| ${0:documentation}
TXT

end