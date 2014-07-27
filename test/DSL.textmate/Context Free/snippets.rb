# encoding: utf-8

snippets do

  default_scope 'source.context-free'
  file_format :textmate

  tab 'b', 'Background Directive', <<-'TXT', uuid: '54E5EF74-2097-4C8E-9456-19943792AADE'
background {$1}
TXT

  tab 'C', 'Circle Primitive', <<-'TXT', uuid: 'DE5FD863-5178-4015-A9A9-C31AF4EC2E46'
CIRCLE {$1}
TXT

  tab 'i', 'Include Directive', <<-'TXT', uuid: '6545F453-C10C-4495-97AC-119FEDE9E877'
include ${1:${2:file}.cfdg}
TXT

  tab 'r', 'Rule', <<-'TXT', uuid: 'EC3768EB-333C-4EB1-815A-1786F475DB89'
rule ${1:shape} ${2:weight }{
	$3
}
TXT

  tab 'S', 'Square Primitive', <<-'TXT', uuid: '20505374-F64A-416C-911B-2D68F9347A2A'
SQUARE {$1}
TXT

  tab 's', 'Startshape Directive', <<-'TXT', uuid: 'C6506DEB-C9DB-4996-BAA0-78897BD9931E'
startshape ${1:shape}
TXT

  tab 'T', 'Triangle Primitive', <<-'TXT', uuid: '4EC28B62-2040-4FD2-99FF-6ECE813E4A84'
TRIANGLE {$1}
TXT

end