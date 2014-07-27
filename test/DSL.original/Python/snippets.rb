# encoding: utf-8

snippets do

  default_scope 'source.python'

  tab '.', 'self', <<-'TXT'
self.
TXT

  tab '__', '__magic__', <<-'TXT'
__${1:init}__
TXT

  tab 'class', 'New Class', <<-'TXT', file: 'New-Class'
class ${1:ClassName}(${2:object}):
	${3/.+/"""/}${3:docstring for $1}${3/.+/"""\n/}${3/.+/\t/}def __init__(self${4/([^,])?(.*)/(?1:, )/}${4:arg}):
		${5:super($1, self).__init__()}
${4/(\A\s*,\s*\Z)|,?\s*([A-Za-z_][a-zA-Z0-9_]*)\s*(=[^,]*)?(,\s*|$)/(?2:\t\tself.$2 = $2\n)/g}		$0
TXT

  tab 'def', 'Function', <<-'TXT', file: 'function'
def ${1:function}($2):
	${0:pass}
TXT

  tab 'defs', 'Method', <<-'TXT', file: 'method'
def ${1:function}(self${2}):
	${0:pass}
TXT

  tab 'for', 'For Loop', <<-'TXT', file: 'for'

for ${1:x} in ${2:xrange(1,10)}:
	${0:pass}

TXT

  tab 'if', 'If Condition', <<-'TXT', file: 'if'

if ${1:$SELECTION}:
	${0:pass}

TXT

  tab 'ifmain', "if __name__ == '__main__'", <<-'TXT', file: "if-__name__-==-'__main__'"
if __name__ == '__main__':
	${1:main()}$0
TXT

  tab 'property', 'New Property', <<-'TXT', file: 'New-Property'
def ${1:foo}():
    doc = "${2:The $1 property.}"
    def fget(self):
        ${3:return self._$1}
    def fset(self, value):
        ${4:self._$1 = value}
    def fdel(self):
        ${5:del self._$1}
    return locals()
$1 = property(**$1())$0
TXT

  tab 'try', 'Try/Except', <<-'TXT', file: 'Try-Except'
try:
	${1:pass}
except ${2:Exception}, ${3:e}:
	${4:raise $3}
TXT

  tab 'try', 'Try/Except/Else', <<-'TXT', file: 'Try-Except-Else'
try:
	${1:pass}
except ${2:Exception}, ${3:e}:
	${4:raise $3}
else:
	${5:pass}
TXT

  tab 'try', 'Try/Except/Else/Finally', <<-'TXT', file: 'Try-Except-Else-Finally'
try:
	${1:pass}
except${2: ${3:Exception}, ${4:e}}:
	${5:raise}
else:
	${6:pass}
finally:
	${7:pass}
TXT

  tab 'try', 'Try/Except/Finally', <<-'TXT', file: 'Try-Except-Finally'
try:
	${1:pass}
except ${2:Exception}, ${3:e}:
	${4:raise $3}
finally:
	${5:pass}
TXT

  tab 'while', 'While Loop', <<-'TXT', file: 'while'

while ${1:$SELECTION}:
	${0:pass}

TXT

end