# encoding: utf-8

snippets do

  default_scope 'source.python'
  file_format :textmate

  key "(", 'Inside Class Def: Insert (..):', <<-'TXT', scope: 'source.python meta.class.python invalid.illegal.missing-inheritance.python', uuid: '8CE4655C-3BAE-489F-BF42-89FB6B4C4119', file: 'Inside Class Def˸ Insert (__)˸'
(${1:object}):$0
TXT

  key "(", 'Inside Function Def: Insert (..):', <<-'TXT', scope: 'source.python meta.function.python invalid.illegal.missing-parameters.python', uuid: '09C00F1F-859E-455D-BD1B-C8F48CEFB078', file: 'Inside Function˸ Insert (__)˸'
($0):
TXT

  key "\"", 'Inside String: Insert "…"', <<-'TXT', scope: 'source.python string.quoted.double.single-line punctuation.definition.string.end & L:punctuation.definition.string.begin', uuid: '44F64180-F86E-4980-895A-2994B0EEDB5D'
"$0"
TXT

  key "'", "Inside String: Insert '…'", <<-'TXT', scope: 'source.python string.quoted.single.single-line punctuation.definition.string.end & L:punctuation.definition.string.begin', uuid: '1BAD838C-8B2A-45FD-9AD2-7F3DCA2DD388'
'$0'
TXT

  tab '.', 'self', <<-'TXT', scope: 'source.python - string', uuid: 'E8128DB6-AF28-4ABA-A1EE-334584D19BE5'
self.
TXT

  tab '__', '__magic__', <<-'TXT', uuid: '2E4E82B5-7E7A-4E23-B095-799DDCDB8F75'
__${1:init}__
TXT

  tab 'as', 'Assert', <<-'TXT', uuid: 'AD5B91E1-7DF0-4E4C-B794-591640FAFD08'
self.assert_(${1:boolean expression}${2:, '${3:message}'})$0
TXT

  tab 'ase', 'Assert Equal', <<-'TXT', uuid: '190010F6-A759-44C1-A994-479847B23A97'
self.assertEqual(${1:expected}, ${2:actual}${3:, '${4:message}'})$0
TXT

  tab 'asne', 'Assert Not Equal', <<-'TXT', uuid: '6A34B01B-9250-43AF-8563-8E47FABA6E77'
self.assertNotEqual(${1:expected}, ${2:actual}${3:, '${4:message}'})$0
TXT

  tab 'asr', 'Assert Raises', <<-'TXT', uuid: 'D07F50BE-9DC8-4F76-96FB-88DD69E3F3C1'
self.assertRaises(${1:exception}, ${2:callable})$0
TXT

  tab 'class', 'New Class', <<-'TXT', uuid: '659D189C-EC3E-4C4E-9377-B7F5F5216CBD'
class ${1:ClassName}(${2:object}):
	${3/.+/"""/}${3:docstring for $1}${3/.+/"""\n/}${3/.+/\t/}def __init__(self${4/([^,])?(.*)/(?1:, )/}${4:arg}):
		${5:super($1, self).__init__()}
${4/(\A\s*,\s*\Z)|,?\s*([A-Za-z_][a-zA-Z0-9_]*)\s*(=[^,]*)?(,\s*|$)/(?2:\t\tself.$2 = $2\n)/g}		$0
TXT

  tab 'def', 'New Function', <<-'TXT', uuid: '6499BB56-7BB5-11D9-8E83-000D93B6E43C'
def ${1:fname}(${2:`if [ "$TM_CURRENT_LINE" != "" ]
				# poor man's way ... check if there is an indent or not
				# (cuz we would have lost the class scope by this point)
				then
					echo "self"
				fi`}):
	${3/.+/"""/}${3:docstring for $1}${3/.+/"""\n/}${3/.+/\t/}${0:pass}
TXT

  tab 'defs', 'New Method', <<-'TXT', uuid: '70E8843A-A8C0-44FC-ACF3-3DEAE48AE784'
def ${1:mname}(self${2/([^,])?.*/(?1:, )/}${2:arg}):
	${3:pass}
TXT

  tab 'fail', 'Fail (a test)', <<-'TXT', uuid: '2065BBC9-C4FC-49B8-A36C-804721F97B9C'
self.fail('${1:message}')$0
TXT

  tab 'ifmain', "if __name__ == '__main__'", <<-'TXT', uuid: 'FD868CF0-FEF8-471B-BB6D-F2D7F54F71F3'
if __name__ == '__main__':
	${1:main()}$0
TXT

  tab 'property', 'New Property', <<-'TXT', uuid: '195B332F-4464-4539-9FB3-D89152C960DC'
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

  tab 'py', '#!/usr/bin/env python', <<-'TXT', scope: 'L:dyn.caret.begin.document', uuid: 'C397A615-11CE-4332-BB89-186F826417B4', file: '#!˸usr˸bin˸env python'
#!/usr/bin/env python

TXT

  tab 'try', 'Try/Except', <<-'TXT', uuid: '495317BD-13D7-46F9-8A2F-8D234653A3F0', file: 'Try˸Except'
try:
	${1:pass}
except ${2:Exception} as ${3:e}:
	${4:raise $3}
TXT

  tab 'try', 'Try/Except/Else', <<-'TXT', uuid: '4D382FF4-C740-4250-B4AE-7299DD6B4D3A', file: 'Try˸Except˸Else'
try:
	${1:pass}
except ${2:Exception} as ${3:e}:
	${4:raise $3}
else:
	${5:pass}
TXT

  tab 'try', 'Try/Except/Else/Finally', <<-'TXT', uuid: '2FB8153A-1ABE-44A7-A760-763BA141724B', file: 'Try˸Except˸Else˸Finally'
try:
	${1:pass}
except${2: ${3:Exception} as ${4:e}}:
	${5:raise}
else:
	${6:pass}
finally:
	${7:pass}
TXT

  tab 'try', 'Try/Except/Finally', <<-'TXT', uuid: 'EEFC5039-2CD4-4CAA-BCCC-41011864596E', file: 'Try˸Except˸Finally'
try:
	${1:pass}
except ${2:Exception} as ${3:e}:
	${4:raise $3}
finally:
	${5:pass}
TXT

end