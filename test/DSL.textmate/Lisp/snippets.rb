# encoding: utf-8

snippets do

  default_scope 'source.lisp'
  file_format :textmate

  tab '(', "'(", <<-'TXT', uuid: '34016E4D-0562-438D-9DA2-8B0D69E25EB7'
'(
TXT

  tab '(', '`(', <<-'TXT', uuid: '4E260350-6474-4204-96CF-7172CAF82BB2'
\`(
TXT

  tab 'const', 'defconstant', <<-'TXT', uuid: '95C56BAE-65D1-4C91-A454-9FF839F56158'
(defconstant +${1:name}+ ${2:value}
	"${3:Documentation for $1.}"))
TXT

  tab 'fun', 'defun', <<-'TXT', uuid: '9D6BDA9C-BAD9-4B49-84B2-A8DAABE6FD6B'
(defun ${1:name} (${2:parameters})
	"${3:Documentation for $1.}"
	($0))
TXT

  tab 'if', 'if', <<-'TXT', uuid: '4DE50D32-BA58-4059-B493-8D30D4DA87B9'
(if (${1:test})
	($0))
TXT

  tab 'let', 'let', <<-'TXT', uuid: 'ABEDBF95-4BA7-47EE-9B33-8FE60793A4D7'
(let (${1:variables})
	($0))
TXT

  tab 'let1', 'let1', <<-'TXT', uuid: '5ADD7989-8347-481B-B3A0-5C4A54D21D88'
(let ((${1:variable} ${2:value}))
	($0))
TXT

  tab 'mac', 'defmacro', <<-'TXT', uuid: '8DD75FAF-4AAD-43EA-9DF4-77AD49F3B41C'
(defmacro ${1:name} (${2:parameters})
	"${3:Documentation for $1.}"
	($0))
TXT

  tab 'par', 'defparameter', <<-'TXT', uuid: '845D8AE8-CC9C-4085-987B-38DEB5839622'
(defparameter *${1:name}* ${2:value}
	"${3:Documentation for $1.}")
TXT

  tab 'setf', 'setf', <<-'TXT', uuid: 'FAFA6588-CD19-40E3-8D37-6D329B75FA07'
(setf ${1:place} ${2:value})
TXT

  tab 'var', 'defvar', <<-'TXT', uuid: '0CB4BA46-D1CF-4E54-9479-B1159779C2F4'
(defvar *${1:name}* ${2:value}
	"${3:Documentation for $1.}")
TXT

end