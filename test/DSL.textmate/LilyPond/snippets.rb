# encoding: utf-8

snippets do

  default_scope 'source.lilypond'
  file_format :textmate

  tab 'head', 'header', <<-'TXT', uuid: '6F8F1607-8D59-4E4D-94D1-7565B4921B81'
\header {
	title = "${1:Title}"
	instrument = "${2:Instrument}"
	composer = "${3:Composer}"
	date = "${4:Date}"
}
TXT

  tab 'rel', 'relative', <<-'TXT', uuid: 'C54C69BF-701D-445E-A433-102BEFCE20C7'
\relative${1/(\S)?.*/(?1: )/}${1:c''} {$0}
TXT

  tab 'rep', 'repeat', <<-'TXT', uuid: '73B33ED5-1704-47C6-B397-034B27A38433'
\repeat "${1:volta}" ${2:2} {
	$3
}
${1/(volta)|(.*)/(?1:\\alternative {\n\t{  }\n\t{  }\n})(?2:)/}
TXT

  tab 'times', 'times', <<-'TXT', uuid: 'A94FA5D8-1C91-474F-A98D-AFFC42D39BBA'
\times $1/$2 { $3 }
TXT

end