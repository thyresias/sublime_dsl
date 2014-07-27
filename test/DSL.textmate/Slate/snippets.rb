# encoding: utf-8

snippets do

  default_scope 'source.slate'
  file_format :textmate

  tab '[', 'Block Header', "[${1/(^(?<var>\\s*[a-z_][a-zA-Z0-9_]*\\s*)(,\\g<var>)*,?\\s*$)|.*/(?1:|)/} ${1:variable} ${1/(^(?<var>\\s*[a-z_][a-zA-Z0-9_]*\\s*)(,\\g<var>)*,?\\s*$)|.*/(?1:| )/}${2:$TM_SELECTED_TEXT} ", uuid: 'B0B92D3F-EB78-4267-82FE-A7CCF007DEEF', file: 'Block Header ([)'

  tab 'collect', 'collect', <<-'TXT', uuid: '1E3C3746-7890-4DA1-8EC1-00F7B4674611', file: 'collect (collect)'
collect: [| :${1:each}| $0]
TXT

  tab 'do', 'do', <<-'TXT', uuid: '7D1EAA3A-FEC5-450A-B905-96624F9B2182', file: 'do (do)'
do: [| :${1:each}| $0]
TXT

  tab 'dowith', 'doWithIndex', <<-'TXT', uuid: '3565AA30-4471-4903-B6A0-7895F2FEA2FE', file: 'doWithIndex (dowith)'
doWithIndex: [| :${1:each} :${2:index} | $0]
TXT

  tab 'if', 'If-then', <<-'TXT', uuid: '636E9DF2-03FF-41CA-B07D-75E852204BE5', file: 'If-then (if)'
${1:condition} ifTrue: [$2:then]
TXT

  tab 'ifte', 'If-then-else', <<-'TXT', uuid: '8EE1D866-4461-4F28-8BD7-44BC82A45ECB', file: 'If-then-else (ifte)'
${1:condition} ifTrue: [$2:then] ifFalse: [$3:else]
TXT

  tab 'inject', 'inject into', <<-'TXT', uuid: '31B1632B-ED22-4AD7-A7CA-28297CD44DE4', file: 'inject into (inject)'
inject: ${1:object} [| :${2:injection}, :${3:each}| $0]
TXT

  tab 'proto', 'define prototype', <<-'TXT', uuid: 'E66F7BD3-5916-42C3-8A4C-3A305D4B389A', file: 'define prototype (proto)'
define: #${1:NewName} &parents: {${2:parents}}
 &slots: {${3:slotSpecs}}.

TXT

  tab 'reject', 'reject', <<-'TXT', uuid: '8ABB354E-A6F2-49B0-A5EA-3A183EA32167', file: 'reject (reject)'
reject: [| :${1:each}| $0]
TXT

  tab 'select', 'select', <<-'TXT', uuid: '3A5B15C7-9B57-485F-A859-18B0E1324BD0', file: 'select (select)'
select: [| :${1:each}| $0]
TXT

  tab 'until', 'until', <<-'TXT', uuid: '1D6BEAF5-0923-4578-A0F5-64FC579667B0', file: 'until (until)'
[${1:condition}] whileFalse: [$2:body]
TXT

  tab 'while', 'while', <<-'TXT', uuid: 'D4C02FFC-D3A2-4059-B6B6-848FE1451431', file: 'while (while)'
[${1:condition}] whileTrue: [$2:body]
TXT

end