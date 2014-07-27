# encoding: utf-8

snippets do

  default_scope 'source.r, source.rd.console'
  file_format :textmate

  tab 'att', 'Attach', <<-'TXT', uuid: '5F49FB43-86AA-4352-AECB-CA573E9DC7E8'
attach(${1:frame})
TXT

  tab 'cum', 'Cummulative', <<-'TXT', uuid: '9BB0E6BD-62E9-4D5A-A1B6-6A5545F58EFD'
cum${1:max}(${2:x})
TXT

  tab 'cut', 'Divide Into Intervals', <<-'TXT', uuid: '217EE449-B990-4FDA-A897-F7063022241E'
cut(${1:x}, breaks = c(${2:${3:}, ${4:max(${1:x})}}))
TXT

  tab 'dat', 'Load Dataset', <<-'TXT', uuid: '5A0EA5CD-5767-4D11-AF9A-C4447A8EA4B4'
data(${1:name})
TXT

  tab 'den', 'Density', <<-'TXT', uuid: '93D9F298-A5FF-4935-A906-1C1E31AF451A'
density(${1:x}${2:, bw = ${3:bandwidth}})
TXT

  tab 'det', 'Detach', <<-'TXT', uuid: '481CC207-5003-4AAE-8202-E353889470C9'
detach(${0:})
TXT

  tab 'fac', 'Factor', <<-'TXT', uuid: '0D80E89D-F95D-4C5E-B174-342B245CD56B'
factor(${1:x})
TXT

  tab 'fch', 'file.choose', <<-'TXT', uuid: 'FA279758-BC29-4BE9-AFD6-045DB6A17711', file: 'file_choose'
${1:file = }file.choose()${0:}
TXT

  tab 'for', 'For Loop', <<-'TXT', uuid: '63A97132-D522-48D9-937A-6A1F04E45F7D'
for (${1:i} in ${2:seq}) ${3:{$0\}}
TXT

  tab 'fun', 'Function', <<-'TXT', uuid: '02F9D19E-BE8F-4BAA-99EB-2A304BB873FE'
function(${1:x}) ${3:{$0\}}
TXT

  tab 'ife', 'Ifelse', <<-'TXT', uuid: '69D9877A-4A4C-4DC7-97E5-392B45941A82'
ifelse(${1:test}, ${2:yes}, ${3:no})
TXT

  tab 'len', 'Length', <<-'TXT', uuid: 'CE3CB75A-3283-4BF0-BDD8-FF8F50F61762'
length(${1:x})
TXT

  tab 'lin', 'Polygonal Line', <<-'TXT', uuid: 'A4E14B93-E8D0-4C8E-AB8E-CCB029E170F0'
lines(${1:x}${2:, color=${3:red}})
TXT

  tab 'nao', 'na.omit', <<-'TXT', uuid: 'C7D7C1F9-E2F7-4B09-8C1A-AD66C19E9CB3', file: 'na_omit'
na.omit(${0:})
TXT

  tab 'rea', 'Read From File', <<-'TXT', uuid: 'D8F85702-E792-4856-8D16-54E4EB2F9483'
read.table("${1:filename}"${2:, header = ${3:TRUE},  sep = "${4:\t}",  stringsAsFactors = ${5:FALSE}})
TXT

  tab 'rug', 'Add Tick Marks', <<-'TXT', uuid: 'EB449D09-F66E-4C1B-BFAF-B9FA27DB991C'
rug(${1:jitter(${2:x})})
TXT

  tab 'seq', 'Sequence (from,to,by)', <<-'TXT', uuid: '4852C9E0-D22C-4FA2-8C85-628B97F6C3B2'
seq(${1:from}, ${2:to}, ${3:by})
TXT

  tab 'sor', 'Sort', <<-'TXT', uuid: 'A9D21636-8157-4C3B-967B-B0E24595AA86'
sort(${1:x})
TXT

  tab 'sou', 'Source', <<-'TXT', uuid: 'D7A7E674-E2E6-4454-BA78-952A129FB1E2'
source(${1:"${2:}"}${3:, chdir = ${4:TRUE}})
TXT

end