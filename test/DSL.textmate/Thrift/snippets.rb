# encoding: utf-8

snippets do

  default_scope 'source.thrift -meta'
  file_format :textmate

  tab 'enu', 'enum', <<-'TXT', uuid: 'C1341136-77B4-433A-A17D-C0ECE06A3402'
enum ${1:Name} {
	${2:FIELD} = ${3:1},$0
}
TXT

  tab 'exc', 'exception', <<-'TXT', uuid: '4B087906-E44D-48BF-8601-2BB95E285CAF'
exception ${1:Name} {
	1: string message,$0
}
TXT

  tab 'ser', 'service', <<-'TXT', uuid: '90593423-A61F-4BAF-8368-EFA79DC347E1'
service ${1:Name}${2/.+/ extends /m}${2:Super} {
	${3:void} ${4:method}(${5:args})
}
TXT

  tab 'str', 'struct', <<-'TXT', uuid: 'FA5FBCA2-12D6-4C3B-A9A0-5B9C9AD141AD'
struct ${1:Name} {
	${2:1}${2/.+/: /m}${3:i32} ${4:field}${5/.+/ = /m}${5:value},$0
}
TXT

end