# encoding: utf-8

snippets do

  default_scope 'source.groovy'
  file_format :textmate

  # FIXME: illegal XML character "\u0003" replaced by 'ETX'
  key "ETX", 'Continue Block Comment', <<-'TXT', scope: 'source.groovy comment.block', uuid: 'D91F16B6-C86C-4490-947F-F482AD20807E'
${TM_CURRENT_LINE/(.*\*\/$)|.*?(\/\*(?!.*\*\/)).*|.*/(?1:
:
(?2: )* )/}
TXT

  tab '#!', '#!/usr/bin/env groovy -w', <<-'TXT', uuid: '2E5BF1D2-CED3-42B0-80DF-30AAED089A76', file: '#!˸usr˸local˸bin˸groovy -w'
#!/usr/bin/env groovy -w


TXT

  tab '.as', 'asImmutable()', <<-'TXT', uuid: '2C9612BA-9B03-41E0-A59C-882BA9DA7876', file: 'as Immutable'
.asImmutable()
TXT

  tab '.as', 'asSynchronized()', <<-'TXT', uuid: '3223EE5A-FFE7-490C-9171-583D0FC99083', file: 'as Synchronized'
.asSynchronized()
TXT

  tab ':', 'key: "value" (Hash Pair)', <<-'TXT', uuid: '48DE19A7-3847-47E3-B971-1C7BE27C42A5', file: 'Hash Pair'
${1:key}: ${2:"${3:value}"}
TXT

  tab 'all', 'all { … }', <<-'TXT', uuid: 'F98D5DB7-41D9-4C62-96EE-31E5B16B126A', file: 'all{ e -˃ __ }'
all {${1/(.+)/(?1: )/}${1:obj}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'any', 'any { … }', <<-'TXT', uuid: '3F8699F6-AEA4-498D-99A5-6F8949A808D0', file: 'any{ e -˃ __ }'
any {${1/(.+)/(?1: )/}${1:obj}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'as', 'as BigDecimal', <<-'TXT', uuid: '55ED6B1E-B43B-495A-B43C-B3D7B2C6DCE0'
as BigDecimal
TXT

  tab 'as', 'as BigInteger', <<-'TXT', uuid: '2755C268-036A-486B-B030-7EE1AAB3042B'
as BigInteger
TXT

  tab 'as', 'as Double', <<-'TXT', uuid: '8EA93476-BE8A-4FD9-8E98-26D0FAF0C186'
as Double
TXT

  tab 'as', 'as Float', <<-'TXT', uuid: '5CE4D7C8-66AF-468B-9DDC-F41C37CED094'
as Float
TXT

  tab 'as', 'as Set', <<-'TXT', uuid: '43B7BCC7-99FA-4F6A-B375-B8555CB4F490'
as Set
TXT

  tab 'as', 'as String', <<-'TXT', uuid: '91AC7C4E-4BC2-4AC2-BB44-F1C89FA8D317'
as String
TXT

  tab 'as', 'as Writable', <<-'TXT', uuid: 'AD01E690-5071-4DF9-8165-4D01396073AB'
as Writable
TXT

  tab 'ase', 'assertEquals', <<-'TXT', uuid: 'FEA9FEBE-44D8-4452-AD66-FBE1A2E38D72', file: 'assertEquals(__)'
assertEquals(${1/(.+)/(?1:")/}${1:message}${1/(.+)/(?1:", )/}${2:expected}, ${3:actual})$0
TXT

  tab 'asf', 'assertFalse', <<-'TXT', uuid: '6FAAE95D-DC2B-420C-BB1A-44E4C0B3DFE0'
assertFalse(${1/(.+)/(?1:")/}${1:message}${1/(.+)/(?1:", )/}${2:test})$0
TXT

  tab 'asn', 'assertNull', <<-'TXT', uuid: '1FE2B60C-06E8-4541-9E83-5623F0FE1151', file: 'assertNull(__)'
assertNull(${1/(.+)/(?1:")/}${1:message}${1/(.+)/(?1:", )/}${2:instance})$0
TXT

  tab 'asne', 'assertNotEquals', <<-'TXT', uuid: 'AABDE87E-B458-41CD-8668-4FD4EA3B5706', file: 'assertNotEquals(__)'
assertNotEquals(${1/(.+)/(?1:")/}${1:message}${1/(.+)/(?1:", )/}${2:unexpected}, ${3:actual})$0
TXT

  tab 'asnn', 'assertNotNull', <<-'TXT', uuid: '3D0A86B2-648D-4A35-9B55-A2A2A9EEE38D', file: 'assertNotNull(__)'
assertNotNull(${1/(.+)/(?1:")/}${1:message}${1/(.+)/(?1:", )/}${2:instance})$0
TXT

  tab 'ass', 'assertSame', <<-'TXT', uuid: '38625828-1187-476B-BB66-7A8EA5601415'
assertSame(${1/(.+)/(?1:")/}${1:message}${1/(.+)/(?1:", )/}${2:expected}, ${3:actual})$0
TXT

  tab 'ast', 'assertTrue', <<-'TXT', uuid: '3DA3EEE6-0966-4911-9A4C-AF939BE2F427'
assertTrue(${1/(.+)/(?1:")/}${1:message}${1/(.+)/(?1:", )/}${2:test})$0
TXT

  tab 'case', 'case … break', <<-'TXT', uuid: '5935B679-0E50-41DB-B55B-2FF8A65AD8CD', file: 'case'
case ${1:CASE_NAME}:
	$2
break$0
TXT

  tab 'col', 'collect { … }', <<-'TXT', uuid: '2367D195-F182-4390-A801-27701107FBBE', file: 'collect { e -˃ __ }'
collect {${1/(.+)/(?1: )/}${1:obj}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'con', 'constructor() { … }', <<-'TXT', uuid: '35E301FB-00C4-4CE6-9164-E84057FE1E9F', file: 'Constructor'
${1:private}${1/(.+)/(?1: )/}${2:${TM_FILENAME/(.*?)(\..+)/$1/}}(${3:args}) {
	$0
}
TXT

  tab 'copy', 'copy(file: …, tofile: …) ', <<-'TXT', uuid: '4D6B8D48-40DA-45EC-8D4E-BCC63C0A454B', file: 'copy__ file'
copy(file:"${1:sourceFile}", tofile:"${2:targetFile}")
TXT

  tab 'copy', 'copy(todir: …) { fileset(dir: …) { include … exclude }', <<-'TXT', uuid: '0A9B1368-E4C0-4B94-BE1D-6B9EA1F27415', file: 'copy__ fileset include˸exclude'
copy(todir:"${1:targetDir}") {
	fileset(dir:"${2:sourceDir}") {
		include(name:"${3:includeName}")
		exclude(name:"${4:excludeName}")
	}
}
TXT

  tab 'copy', 'copy(todir: …) { fileset:dir …) }', <<-'TXT', uuid: 'CDC90200-4476-4287-9957-88F9FB12EB77', file: 'copy__ fileset'
copy(todir:"${1:targetDir}") {
	fileset(dir:"${2:sourceDir}")
}
TXT

  tab 'cv', 'closure = { … } ', <<-'TXT', uuid: 'CADACABD-B3C9-4A66-B451-041FCD874DA4', file: 'def __ closure = {__} ', key_equivalent: "^~\n"
def ${1:closureName} = { ${2:args} ->
	$0
}
TXT

  tab 'd', 'def', "def ", uuid: '2F5CC91C-4AEE-4657-8277-B4C13C33A02F'

  tab 'doc', 'Doc Block', <<-'TXT', uuid: '91A419C7-B816-4E14-AEC8-05287F66D4C8', file: 'Block Comment'
/**
 * $0
 */
TXT

  tab 'dt', 'downto() { … }', <<-'TXT', uuid: '334326DB-ADCD-42B0-8E38-B89FC0BC0EE2', file: 'downto(num) { n -˃ __ }'
downto(${1:0}) {${2/(.+)/(?1: )/}${2:i}${2/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'ea', 'each { … }', <<-'TXT', uuid: '599F3859-E634-4CA0-AAA5-21E9AC450ED3', file: 'each { e -˃ __ }'
each {${1/(.+)/(?1: )/}${1:obj}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eab', 'eachByte { … }', <<-'TXT', uuid: '0ECF0823-9E5A-4866-80A3-EFCCCA1F9615', file: 'eachByte { byte -˃ __ }'
eachByte {${1/(.+)/(?1: )/}${1:byte}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'ead', 'eachDir { … } ', <<-'TXT', uuid: '7015B36F-423C-4F5C-88EC-348DBF54CACE', file: 'eachDir { dir -˃ __ } '
eachDir {${1/(.+)/(?1: )/}${1:dir}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eadm', 'eachDirMatch { … }', <<-'TXT', uuid: 'EAE02657-C90A-49C5-90B4-7AC043C1BD5A', file: 'eachDirMatch'
eachDirMatch(${1:filter}) {${2/(.+)/(?1: )/}${2:dir}${2/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eadr', 'eachDirRecurse { … }', <<-'TXT', uuid: '502CA3F8-ABED-4A0B-A8A9-6DA10AC32EB5', file: 'eachDirRecurse'
eachDirRecurse {${1/(.+)/(?1: )/}${1:dir}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eaf', 'eachFile { … }', <<-'TXT', uuid: 'B84B9BBC-B4B9-4169-8643-2BF45D7E0B98', file: 'eachFile { file -˃ __ }'
eachFile {${1/(.+)/(?1: )/}${1:file}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eafm', 'eachFileMatch { … } ', <<-'TXT', uuid: '05CB185E-F016-4EA6-9B1C-EB7830E4F859', file: 'eachFileMatch { file -˃ __ } '
eachFileMatch(${1:filter}) {${2/(.+)/(?1: )/}${2:file}${2/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eafr', 'eachFileRecurse { … }', <<-'TXT', uuid: '1E985DD0-E1B7-472A-A31C-1B9AB917DF5C', file: 'eachFileRecurse { file -˃ __ }'
eachFileRecurse {${1/(.+)/(?1: )/}${1:file}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eak', 'eachKey { … }', <<-'TXT', uuid: 'CDDD5286-5B6B-4B79-8AA7-6F27ACF2441A', file: 'eachKey { key -˃ __ }'
eachKey {${1/(.+)/(?1: )/}${1:key}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eal', 'eachLine { … }', <<-'TXT', uuid: '0C9A7EED-2FC5-4E2B-B160-8D50E8350F36', file: 'eachLine { line -˃ __ }'
eachLine {${1/(.+)/(?1: )/}${1:line}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eam', 'eachMatch(regex) { … } ', <<-'TXT', uuid: 'F25E60A2-0ED2-4625-BA43-D3748697A014', file: 'eachMatch(regex) { match -˃ __ } '
eachMatch(/${1:regex}/) {${2/(.+)/(?1: )/}${2:match}${2/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eao', 'eachObject { … }', <<-'TXT', uuid: '37D97C76-E4A3-4938-863C-371AA781C00B', file: 'eachObject { obj -˃ __ }'
eachObject {${1/(.+)/(?1: )/}${1:obj}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eav', 'eachValue { … }', <<-'TXT', uuid: 'F8BC3DDB-1C63-4419-9A88-239B592C7FCB', file: 'eachValue { val -˃ __ }'
eachValue {${1/(.+)/(?1: )/}${1:value}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eawi', 'eachWithIndex { … }', "eachWithIndex { ${1:obj}, ${2:i} ->\n\t$0 \n}", uuid: '887BDDD6-682A-487E-BAC2-C4FEF81893DE', file: 'eachWithIndex { e, i -˃ __ }'

  tab 'every', 'every { … }', <<-'TXT', uuid: '062DC244-1B3F-43CF-82BB-777882905B85', file: 'every { e -˃ __ }'
every {${1/(.+)/(?1: )/}${1:obj}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'File', 'new File(…).eachLine { … }', <<-'TXT', uuid: '8897744C-C480-42F3-95F0-ECA66DE5F81E', file: 'new File(__)_eachLine { __ }'
new File(${1:"${2:path/to/file}"}).eachLine {${3/(.+)/(?1: )/}${3:line}${3/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'find', 'find { … }', <<-'TXT', uuid: 'C2C9DA71-A726-414E-9571-AF4D552DA818', file: 'find { e -˃ __ }'
find {${1/(.+)/(?1: )/}${1:obj}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'finda', 'findAll { … }', <<-'TXT', uuid: '76AA2DFA-36D6-4B66-AF15-5E8B6F93EBFA', file: 'findAll { e -˃ __ }'
findAll {${1/(.+)/(?1: )/}${1:obj}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'forin', 'for(… in …) { … }', <<-'TXT', uuid: '9C0B41E0-63FF-4AEB-B45B-68E329FBDB44', file: 'for in'
for (${1:element} in ${2:collection}) {
	$0
}
TXT

  tab 'grep', 'grep(filter) { … }', <<-'TXT', uuid: 'C0F820FA-1987-461A-88D7-3F5DFB2A9C84', file: 'grep(˸pattern˸) { match -˃ __ }'
grep(${1:filter}) {${2/(.+)/(?1: )/}${2:obj}${2/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'instance', 'instance … (Singleton)', "private static ${1:${TM_FILENAME/(.*?)(\\..+)/$1/}} instance\n\nstatic $1 getInstance(${2:args}) { \n\tif (!instance) instance = new $1(${2:args})\n\treturn instance\n}", uuid: '0967D932-6CD3-4347-A6F6-8561FA9081AA', file: 'class __ singleton'

  tab 'm', 'method', <<-'TXT', uuid: '234A3407-42D6-44FF-A3D2-6792B2503005'
${1:def}${1/.+/ /}${2:method}($3) {
	$0
}

TXT

  tab 'main', 'static main() { … }', <<-'TXT', uuid: '91AFF9B1-E508-46E4-9962-FA92635C5D53', file: 'static main method'
static main(args) {
	$0
}
TXT

  tab 'mkdir', 'mkdir(dir: …)', <<-'TXT', uuid: '1781AC80-E66A-4687-9312-8AC5809645E6', file: 'mkdir'
mkdir(dir:"${1:dirName}")
TXT

  tab 'p', 'print', <<-'TXT', uuid: '2158C237-5FA0-4C14-BA75-ACE6A9AF4DA6'
print $0
TXT

  tab 'pl', 'println ', <<-'TXT', uuid: '7CD67A16-887C-4F6B-BCF7-A8F59C0E3801'
println $0
TXT

  tab 'rea', 'reverseEach { … } ', <<-'TXT', uuid: '52F522F9-E810-410F-8FA9-738992A23263', file: 'reverseEach { e -˃ __ } '
reverseEach {${1/(.+)/(?1: )/}${1:obj}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'replace', 'replace(dir: …, includes: …, token: …, value: …)', <<-'TXT', uuid: '7698CB64-8DAD-4BAF-A170-2A1A67C8A4CD', file: 'Ant __ replace'
replace(dir:"${1:dirName}", includes:"${2:*.*}", token:"${3:tokenName}", value:"\${${4:value}}")$0
TXT

  tab 'replace', 'replaceAll(regex) { … }', <<-'TXT', uuid: '0964BA68-3780-43CB-9372-1DADD2FCADF2', file: 'replaceAll(regex) { match -˃ __}'
replaceAll(/${1:regex}/) {${2/(.+)/(?1: )/}${2:match}${2/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'runa', 'runAfter() { … }', <<-'TXT', uuid: 'B9D2BBEE-88EC-4225-B547-64A27AE80D9F', file: 'run after'
runAfter(${1:delay}) {
	$0
}
TXT

  tab 'sel', 'splitEachLine(separator) { … }', <<-'TXT', uuid: '934815EE-37A0-4431-B9E5-59F6D7B8319B', file: 'splitEachLine(separator) { line -˃ __ } copy'
splitEachLine(${1:separator}) {${2/(.+)/(?1: )/}${2:obj}${2/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'setup', 'setUp() { … }', <<-'TXT', uuid: '811449A1-F936-40F9-96A4-627511DDA806', file: 'setUp()'
void setUp() {
	$0
}
TXT

  tab 'sf', 'shouldFail { … }', <<-'TXT', uuid: '0F011DE5-992E-46E2-8DB2-2A7491463321', file: 'shouldFail(__) { __ }'
shouldFail${1/(.+)/(?1:\()/}${1:Exception}${1/(.+)/(?1:\))/} {
	$0
}
TXT

  tab 'sleep', 'sleep(secs)', <<-'TXT', uuid: 'B5ABE863-BAEC-4C94-9B94-B8FED21F1E04'
sleep(${1:secs})
TXT

  tab 'sleep', 'sleep(secs) { … // on interrupt do }', <<-'TXT', uuid: 'F4E726E7-FA09-483E-B896-442CF2C747E0', file: 'sleep(secs) { __ ˸˸ on interrupt }'
sleep(${1:secs}) {
	${2:// on interrupt do}
}
TXT

  tab 'sort', 'sort { … }', "sort { \n\t$0\n}", uuid: '68225360-25FB-44D5-B9CF-E9AD7EC71763', file: 'sort { __ }'

  tab 'step', 'step(to,amount) { … }', <<-'TXT', uuid: 'CD6EFDAB-0C62-4488-9D54-491974A9DB9E', file: 'step(to,amount) { n -˃ __ }'
step(${1:to}, ${2:amount}) {${3/(.+)/(?1: )/}${3:i}${3/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'switch', 'switch … case', <<-'TXT', uuid: 'A5C80D9B-2D0F-4E11-A261-01B48519A228', file: 'switch__case'
switch(${1:value}) {
	case ${2:CASE}:
		$3
	break$0
}
TXT

  tab 'switch', 'switch … case … default', <<-'TXT', uuid: '2DB139D0-75BA-49FA-9249-690DB3CAE99F', file: 'switch__case__default'
switch(${1:value}) {
	case ${3:CASE}:
		$4
	break$0
	default:
		$2
	break
}
TXT

  tab 't', 'test()', <<-'TXT', uuid: '7CF4CAA7-6EC5-41E6-A4B1-B1BE77D03931', file: 'test case'
void test$1() {
	$0
}
TXT

  tab 'tc', 'class … extends GroovyTestCase { … }', <<-'TXT', uuid: '3B408AF5-B3E7-4B8E-9056-79CEA2E61F25', file: 'class ___ TestCase'
class ${2:${TM_FILENAME/(.*?)(\..+)/$1/}} extends GroovyTestCase {

	$0
}
TXT

  tab 'tear', 'tearDown() { … }', <<-'TXT', uuid: '11E662E2-7507-4FAB-A618-22BDBA462981', file: 'tearDown()'
void tearDown() {
	$0
}
TXT

  tab 'thread', 'Thread.start { … }', <<-'TXT', uuid: 'E87B5AB1-980F-490B-8CF7-8577377DB5D9', file: 'Thread_start { __ }'
Thread.start {
	$0
}
TXT

  tab 'thread', 'Thread.startDaemon { … }', <<-'TXT', uuid: '085A37E3-68C3-440D-A75F-BC13A9782135', file: 'Thread_startDaemon { __ } '
Thread.startDaemon {
	$0
}
TXT

  tab 'to', 'to Array', <<-'TXT', uuid: 'BC96A573-94FA-42D2-BA3C-8454F48D622D'
toArray()
TXT

  tab 'to', 'to BigDecimal', <<-'TXT', uuid: '98929DE2-18BA-4528-9476-C45F3EE938C3'
toBigDecimal()
TXT

  tab 'to', 'to BigInteger', <<-'TXT', uuid: 'C3ED5F43-EDEE-4991-AE89-68B4F29D2E76'
toBigInteger()
TXT

  tab 'to', 'to Boolean', <<-'TXT', uuid: 'ADFCEABD-3EA9-420B-9E33-C2184621BCF4'
toBoolean()
TXT

  tab 'to', 'to Character', <<-'TXT', uuid: '6A0AB561-7A23-42CF-9A56-A8D550723B0A'
toCharacter()
TXT

  tab 'to', 'to Double', <<-'TXT', uuid: 'F83A236B-1ED3-4D66-88D2-D5F4464B242D'
toDouble()
TXT

  tab 'to', 'to Float', <<-'TXT', uuid: 'EE74D04D-9CF4-495D-8510-4246DBFA9203'
toFloat()
TXT

  tab 'to', 'to Integer', <<-'TXT', uuid: '5909EDC9-BE9B-43B2-B469-C4915E84BDF6'
toInteger()
TXT

  tab 'to', 'to List', <<-'TXT', uuid: 'EF529118-C849-40AF-8B8A-FF96326AD26B'
toList()
TXT

  tab 'to', 'to String', <<-'TXT', uuid: '301C4E82-8F1B-4423-B9F7-E6D19538B492'
toString()
TXT

  tab 'to', 'to URI', <<-'TXT', uuid: '8F6FBCF8-EB48-4573-8BDF-E1EACF3E60AE'
toURI()
TXT

  tab 'to', 'to URL', <<-'TXT', uuid: 'DAFFA50E-CA9C-49D2-ACF8-D127E271B9BD'
toURL()
TXT

  tab 'ut', 'upto() { … }', <<-'TXT', uuid: 'DAA867F7-0BAB-417C-9FAD-51A81C2A0F3D', file: 'upto(num) { n -˃ __ }'
upto(${1:0}) {${2/(.+)/(?1: )/}${2:i}${2/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'v', 'var', <<-'TXT', uuid: '22DDDD36-254D-4E0B-B1E6-1547661B01C5'
${1:def} ${2:var}${3: = ${0:null}}
TXT

  tab 'with', 'withInputStream { … }', <<-'TXT', uuid: 'A79D8CA2-389B-4BEA-A273-43B6CC489C9F', file: 'withInputStream { in -˃ __ }'
withInputStream {${1/(.+)/(?1: )/}${1:in}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'with', 'withOutputStream { … }', <<-'TXT', uuid: 'F67AA34F-E2E9-4F4F-9C76-73B9DE134708', file: 'withOutputStream { out -˃ __ }'
withOutputStream {${1/(.+)/(?1: )/}${1:out}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'with', 'withPrintWriter { … }', <<-'TXT', uuid: '80DD9ED4-7BC8-47A7-9187-B47C82C51C6F', file: 'withPrintWriter { pw -˃ __}'
withPrintWriter {${1/(.+)/(?1: )/}${1:writer}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'with', 'withReader { … }', <<-'TXT', uuid: 'EC389D48-67B3-437C-B70D-9314EFC830A2', file: 'withReader { r -˃ __ }'
withReader {${1/(.+)/(?1: )/}${1:reader}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'with', 'withStream { … }', <<-'TXT', uuid: '8C88EC86-9E66-4F5A-B8C9-C4BF1215D0D6', file: 'withStream { in -˃ __ }'
withStream {${1/(.+)/(?1: )/}${1:stream}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'with', 'withStreams { … }', <<-'TXT', uuid: '2F09117B-A382-489F-9E7C-5EAB720EA6B1', file: 'withStreams { Socket s -˃ __}'
withStreams {${1/(.+)/(?1: )/}${1:socket}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'with', 'withWriter { … }', <<-'TXT', uuid: 'BF5639C4-2A58-46C0-8929-4A5010E6473B', file: 'withWriter { w -˃ __}'
withWriter {${1/(.+)/(?1: )/}${1:writer}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'with', 'withWriter(charset) { … }', <<-'TXT', uuid: 'A83832BE-A728-4785-8DC0-228A990AE8F9', file: 'withWriter(charset) { w -˃ __ }'
withWriter(${1:charset}) {${2/(.+)/(?1: )/}${2:writer}${2/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'with', 'withWriterAppend(charset) { … }', <<-'TXT', uuid: 'EE21684A-4B7F-4AA2-BC9C-AE331CEC8F09', file: 'withWriterAppend(charset) { __ }'
withWriterAppend(${1:charset}) {${2/(.+)/(?1: )/}${2:writer}${2/(.+)/(?1: ->)/}
	$0
}
TXT

end