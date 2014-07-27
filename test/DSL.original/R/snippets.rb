# encoding: utf-8

snippets do

  default_scope 'source.r, source.rd.console'

  tab 'att', 'Attach', <<-'TXT'
attach(${1:frame})
TXT

  tab 'cum', 'Cummulative', <<-'TXT'
cum${1:max}(${2:x})
TXT

  tab 'cut', 'Divide Into Intervals', <<-'TXT', file: 'Divide-Into-Intervals'
cut(${1:x}, breaks = c(${2:${3:}, ${4:max(${1:x})}}))
TXT

  tab 'dat', 'Load Dataset', <<-'TXT', file: 'Load-Dataset'
data(${1:name})
TXT

  tab 'den', 'Density', <<-'TXT'
density(${1:x}${2:, bw = ${3:bandwidth}})
TXT

  tab 'det', 'Detach', <<-'TXT'
detach(${0:})
TXT

  tab 'fac', 'Factor', <<-'TXT'
factor(${1:x})
TXT

  tab 'for', 'For Loop', <<-'TXT', file: 'For-Loop'
for (${1:i} in ${2:seq}) ${3:{$0\}}
TXT

  tab 'fun', 'Function', <<-'TXT'
function(${1:x}) ${3:{$0\}}
TXT

  tab 'ife', 'Ifelse', <<-'TXT'
ifelse(${1:test}, ${2:yes}, ${3:no})
TXT

  tab 'len', 'Length', <<-'TXT'
length(${1:x})
TXT

  tab 'lin', 'Polygonal Line', <<-'TXT', file: 'Polygonal-Line'
lines(${1:x}${2:, color=${3:red}})
TXT

  tab 'nao', 'na.omit', <<-'TXT', file: 'na_omit'
na.omit(${0:})
TXT

  tab 'rea', 'Read From File', <<-'TXT', file: 'Read-From-File'
read.table("${1:filename}"${2:, header = ${3:TRUE},  sep = "${4:\t}",  stringsAsFactors = ${5:FALSE}})
TXT

  tab 'rug', 'Add Tick Marks', <<-'TXT', file: 'Add-Tick-Marks'
rug(${1:jitter(${2:x})})
TXT

  tab 'seq', 'Sequence (from,to,by)', <<-'TXT', file: 'Sequence-(from-to-by)'
seq(${1:from}, ${2:to}, ${3:by})
TXT

  tab 'sor', 'Sort', <<-'TXT'
sort(${1:x})
TXT

  tab 'sou', 'Source', <<-'TXT'
source(${1:"${2:}"}${3:, chdir = ${4:TRUE}})
TXT

end