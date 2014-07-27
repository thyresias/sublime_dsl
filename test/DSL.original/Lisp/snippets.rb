# encoding: utf-8

snippets do

  default_scope 'source.lisp'

  tab '(', "'(", <<-'TXT'
'(
TXT

  tab 'const', 'defconstant', <<-'TXT'
(defconstant +${1:name}+ ${2:value}
	"${3:Documentation for $1.}"))
TXT

  tab 'fun', 'defun', <<-'TXT'
(defun ${1:name} (${2:parameters})
	"${3:Documentation for $1.}"
	($0))
TXT

  tab 'if', 'if', <<-'TXT'
(if (${1:test})
	($0))
TXT

  tab 'let', 'let', <<-'TXT'
(let (${1:variables})
	($0))
TXT

  tab 'let1', 'let1', <<-'TXT'
(let ((${1:variable} ${2:value}))
	($0))
TXT

  tab 'mac', 'defmacro', <<-'TXT'
(defmacro ${1:name} (${2:parameters})
	"${3:Documentation for $1.}"
	($0))
TXT

  tab 'par', 'defparameter', <<-'TXT'
(defparameter *${1:name}* ${2:value}
	"${3:Documentation for $1.}")
TXT

  tab 'setf', 'setf', <<-'TXT'
(setf ${1:place} ${2:value})
TXT

  tab 'var', 'defvar', <<-'TXT'
(defvar *${1:name}* ${2:value}
	"${3:Documentation for $1.}")
TXT

end