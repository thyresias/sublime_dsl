# encoding: utf-8

snippets do

  default_scope 'source.fscript - string - comment'
  file_format :textmate

  tab 'if', 'ifFalse:', <<-'TXT', uuid: 'C00565D4-1627-4134-ABA2-537B7A5AB1B8', file: 'ifFalse˸ (if)'
ifFalse:[
	$1
].
TXT

  tab 'ift', 'ifFalse:ifTrue:', <<-'TXT', uuid: 'CFC37668-A538-47C8-B46B-9E3223CA2729', file: 'ifFalse˸ifTrue˸ (ift)'
ifFalse:[
	$1
] ifTrue:[
	$2
].
TXT

  tab 'it', 'ifTrue:', <<-'TXT', uuid: '104B9BAD-1E5B-4E7E-AD9B-3908B16B214D', file: 'ifTrue˸ (it)'
ifTrue:[
	$1
].
TXT

  tab 'itf', 'ifTrue:ifFalse', <<-'TXT', uuid: '1D5529F3-DA53-490D-AC62-4860FCBA92C4', file: 'ifTrue˸ifFalse (itf)'
ifTrue:[
	$1
] ifFalse:[
	$2
].
TXT

  tab 'tbd', 'to:by:do:', <<-'TXT', scope: 'source.fscript', uuid: '1609A403-1BEA-4280-87CC-70450082C941', file: 'to˸by˸do˸ (tbd)'
to:$1 by:$2 do:[ ${3::i} |
	$4
].
TXT

  tab 'td', 'to:do:', <<-'TXT', scope: 'source.fscript', uuid: '930B4766-D6D2-4C4E-BA84-762ADDA8E6EE', file: 'to˸do˸ (td)'
to:$1 do:[ ${2::i} |
	$3
].
TXT

end