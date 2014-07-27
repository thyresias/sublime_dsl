# encoding: utf-8

snippets do

  default_scope 'source.groovy'

  tab '!', 'assert', <<-'TXT', file: 'assert(__)'
assert ${1:test}${2/(.+)/(?1: \: ")/}${2:Failure message}${2/(.+)/(?1:")/}$0
TXT

  tab '#!', '#!/usr/bin/env groovy -w', <<-'TXT', file: '#!-usr-local-bin-groovy-w'
#!/usr/bin/env groovy -w


TXT

  tab '.as', 'asImmutable()', <<-'TXT', file: 'as-Immutable'
.asImmutable()
TXT

  tab '.as', 'asSynchronized()', <<-'TXT', file: 'as-Synchronized'
.asSynchronized()
TXT

  tab ':', 'key: "value" (Hash Pair)', <<-'TXT', file: 'Hash-Pair'
${1:key}: ${2:"${3:value}"}
TXT

  tab 'all', 'all { … }', <<-'TXT', file: 'all{-e-__-}'
all {${1/(.+)/(?1: )/}${1:obj}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'any', 'any { … }', <<-'TXT', file: 'any{-e-__-}'
any {${1/(.+)/(?1: )/}${1:obj}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'as', 'as BigDecimal', <<-'TXT', file: 'as-BigDecimal'
as BigDecimal
TXT

  tab 'as', 'as BigInteger', <<-'TXT', file: 'as-BigInteger'
as BigInteger
TXT

  tab 'as', 'as Double', <<-'TXT', file: 'as-Double'
as Double
TXT

  tab 'as', 'as Float', <<-'TXT', file: 'as-Float'
as Float
TXT

  tab 'as', 'as Set', <<-'TXT', file: 'as-Set'
as Set
TXT

  tab 'as', 'as String', <<-'TXT', file: 'as-String'
as String
TXT

  tab 'as', 'as Writable', <<-'TXT', file: 'as-Writable'
as Writable
TXT

  tab 'ase', 'assertEquals', <<-'TXT', file: 'assertEquals(__)'
assertEquals(${1/(.+)/(?1:")/}${1:message}${1/(.+)/(?1:", )/}${2:expected}, ${3:actual})$0
TXT

  tab 'asf', 'assertFalse', <<-'TXT'
assertFalse(${1/(.+)/(?1:")/}${1:message}${1/(.+)/(?1:", )/}${2:test})$0
TXT

  tab 'asn', 'assertNull', <<-'TXT', file: 'assertNull(__)'
assertNull(${1/(.+)/(?1:")/}${1:message}${1/(.+)/(?1:", )/}${2:instance})$0
TXT

  tab 'asne', 'assertNotEquals', <<-'TXT', file: 'assertNotEquals(__)'
assertNotEquals(${1/(.+)/(?1:")/}${1:message}${1/(.+)/(?1:", )/}${2:unexpected}, ${3:actual})$0
TXT

  tab 'asnn', 'assertNotNull', <<-'TXT', file: 'assertNotNull(__)'
assertNotNull(${1/(.+)/(?1:")/}${1:message}${1/(.+)/(?1:", )/}${2:instance})$0
TXT

  tab 'ass', 'assertSame', <<-'TXT'
assertSame(${1/(.+)/(?1:")/}${1:message}${1/(.+)/(?1:", )/}${2:expected}, ${3:actual})$0
TXT

  tab 'ast', 'assertTrue', <<-'TXT'
assertTrue(${1/(.+)/(?1:")/}${1:message}${1/(.+)/(?1:", )/}${2:test})$0
TXT

  tab 'case', 'case … break', <<-'TXT', file: 'case'
case ${1:CASE_NAME}:
	$2
break$0
TXT

  tab 'cl', 'class { … }', <<-'TXT', file: 'class-__'
$1${1/(.+)/(?1: )/}class ${2:${TM_FILENAME/(.*?)(\..+)/$1/}} ${3:extends ${4:Parent} }${5:implements ${6:Interface} }{

	$0

}
TXT

  tab 'col', 'collect { … }', <<-'TXT', file: 'collect-{-e-__-}'
collect {${1/(.+)/(?1: )/}${1:obj}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'con', 'constructor() { … }', <<-'TXT', file: 'Constructor'
${1:private}${1/(.+)/(?1: )/}${2:${TM_FILENAME/(.*?)(\..+)/$1/}}(${3:args}) {
	$0
}
TXT

  tab 'copy', 'copy(file: …, tofile: …) ', <<-'TXT', file: 'copy__-file'
copy(file:"${1:sourceFile}", tofile:"${2:targetFile}")
TXT

  tab 'copy', 'copy(todir: …) { fileset(dir: …) { include … exclude }', <<-'TXT', file: 'copy__-fileset-include-exclude'
copy(todir:"${1:targetDir}") {
	fileset(dir:"${2:sourceDir}") {
		include(name:"${3:includeName}")
		exclude(name:"${4:excludeName}")
	}
}
TXT

  tab 'copy', 'copy(todir: …) { fileset:dir …) }', <<-'TXT', file: 'copy__-fileset'
copy(todir:"${1:targetDir}") {
	fileset(dir:"${2:sourceDir}")
}
TXT

  tab 'cv', 'closure = { … } ', <<-'TXT', file: 'def-__-closure-=-{__}'
def ${1:closureName} = { ${2:args} ->
	$0
}
TXT

  tab 'doc', 'Doc Block', <<-'TXT', file: 'Block-Comment'
/**
 * $0
 */
TXT

  tab 'dt', 'downto() { … }', <<-'TXT', file: 'downto(num)-{-n-__-}'
downto(${1:0}) {${2/(.+)/(?1: )/}${2:i}${2/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'ea', 'each { … }', <<-'TXT', file: 'each-{-e-__-}'
each {${1/(.+)/(?1: )/}${1:obj}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eab', 'eachByte { … }', <<-'TXT', file: 'eachByte-{-byte-__-}'
eachByte {${1/(.+)/(?1: )/}${1:byte}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'ead', 'eachDir { … } ', <<-'TXT', file: 'eachDir-{-dir-__-}'
eachDir {${1/(.+)/(?1: )/}${1:dir}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eadm', 'eachDirMatch { … }', <<-'TXT', file: 'eachDirMatch'
eachDirMatch(${1:filter}) {${2/(.+)/(?1: )/}${2:dir}${2/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eadr', 'eachDirRecurse { … }', <<-'TXT', file: 'eachDirRecurse'
eachDirRecurse {${1/(.+)/(?1: )/}${1:dir}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eaf', 'eachFile { … }', <<-'TXT', file: 'eachFile-{-file-__-}'
eachFile {${1/(.+)/(?1: )/}${1:file}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eafm', 'eachFileMatch { … } ', <<-'TXT', file: 'eachFileMatch-{-file-__-}'
eachFileMatch(${1:filter}) {${2/(.+)/(?1: )/}${2:file}${2/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eafr', 'eachFileRecurse { … }', <<-'TXT', file: 'eachFileRecurse-{-file-__-}'
eachFileRecurse {${1/(.+)/(?1: )/}${1:file}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eak', 'eachKey { … }', <<-'TXT', file: 'eachKey-{-key-__-}'
eachKey {${1/(.+)/(?1: )/}${1:key}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eal', 'eachLine { … }', <<-'TXT', file: 'eachLine-{-line-__-}'
eachLine {${1/(.+)/(?1: )/}${1:line}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eam', 'eachMatch(regex) { … } ', <<-'TXT', file: 'eachMatch(regex)-{-match-__-}'
eachMatch(/${1:regex}/) {${2/(.+)/(?1: )/}${2:match}${2/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eao', 'eachObject { … }', <<-'TXT', file: 'eachObject-{-obj-__-}'
eachObject {${1/(.+)/(?1: )/}${1:obj}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eav', 'eachValue { … }', <<-'TXT', file: 'eachValue-{-val-__-}'
eachValue {${1/(.+)/(?1: )/}${1:value}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'eawi', 'eachWithIndex { … }', "eachWithIndex { ${1:obj}, ${2:i} ->\n\t$0 \n}", file: 'eachWithIndex-{-e-i-__-}'

  tab 'el', 'else', <<-'TXT'
else {
	$0
}
TXT

  tab 'elif', 'elseif', <<-'TXT', file: 'elseif-___'
else if (${1:condition}) {
	$0
}
TXT

  tab 'every', 'every { … }', <<-'TXT', file: 'every-{-e-__-}'
every {${1/(.+)/(?1: )/}${1:obj}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'File', 'new File(…).eachLine { … }', <<-'TXT', file: 'new-File(__)_eachLine-{-__-}'
new File(${1:"${2:path/to/file}"}).eachLine {${3/(.+)/(?1: )/}${3:line}${3/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'find', 'find { … }', <<-'TXT', file: 'find-{-e-__-}'
find {${1/(.+)/(?1: )/}${1:obj}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'finda', 'findAll { … }', <<-'TXT', file: 'findAll-{-e-__-}'
findAll {${1/(.+)/(?1: )/}${1:obj}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'fm', 'final method() { … }', <<-'TXT', file: 'final-method'
final ${1:void} ${2:methodName}(${3:args}) {
	$0
}
TXT

  tab 'forin', 'for(… in …) { … }', <<-'TXT', file: 'for-in'
for(${1:element} in ${2:collection}) {
	$0
}
TXT

  tab 'fv', 'final var', <<-'TXT', file: 'final-var'
final ${1:String}${1/(.+)/(?1: )/}${2:var}${3: = ${4:null}}$0
TXT

  tab 'grep', 'grep(filter) { … }', <<-'TXT', file: 'grep(-pattern-)-{-match-__-}'
grep(${1:filter}) {${2/(.+)/(?1: )/}${2:obj}${2/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'if', 'if', <<-'TXT'
if (${1:condition}) {
	$0
}
TXT

  tab 'ifel', 'if … else', <<-'TXT', file: 'if-else'
if(${1:condition}) {
	$2
} else {
	$3
}
TXT

  tab 'im', 'import', "import "

  tab 'instance', 'instance … (Singleton)', "private static ${1:${TM_FILENAME/(.*?)(\\..+)/$1/}} instance\n\nstatic $1 getInstance(${2:args}) { \n\tif (!instance) instance = new $1(${2:args})\n\treturn instance\n}", file: 'class-__-singleton'

  tab 'm', 'method() { … }', <<-'TXT', file: 'def-__-method()-{__}'
${1:def} ${2:methodName}(${3:args}) {
	$0
}
TXT

  tab 'main', 'static main() { … }', <<-'TXT', file: 'static-main-method'
static main(args) {
	$0
}
TXT

  tab 'mkdir', 'mkdir(dir: …)', <<-'TXT', file: 'mkdir'
mkdir(dir:"${1:dirName}")
TXT

  tab 'p', 'print', <<-'TXT'
print $0
TXT

  tab 'pa', 'package', "package "

  tab 'pfm', 'private final method() { … }', <<-'TXT', file: 'private-final-method'
final ${1:def} ${2:methodName}(${3:args}) {
	$0
}
TXT

  tab 'pfv', 'private final var', <<-'TXT', file: 'private-final-var'
private final ${1:String}${1/(.+)/(?1: )/}${2:var}${3: = ${4:null}}$0
TXT

  tab 'pl', 'println ', <<-'TXT', file: 'println'
println $0
TXT

  tab 'pm', 'private method() { … }', <<-'TXT', file: 'private-method'
private ${1:void}${1/(.+)/(?1: )/}${2:methodName}(${3:args}) {
	$0
}
TXT

  tab 'psfm', 'private static final method() { … }', <<-'TXT', file: 'private-static-final-method'
private static final ${1:void}${1/(.+)/(?1: )/}${2:methodName}(${3:args}) {
	$0
}
TXT

  tab 'psfv', 'private static final var', <<-'TXT', file: 'private-static-final-String'
private static final ${1:String}${1/(.+)/(?1: )/}${2:var}${3: = ${4:null}}$0
TXT

  tab 'psm', 'private static method() { … }', <<-'TXT', file: 'private-static-method'
private static ${1:void}${1/(.+)/(?1: )/}${2:methodName}(${3:args}) {
	$0
}
TXT

  tab 'psv', 'private static var', <<-'TXT', file: 'private-static-var'
private static ${1:String}${1/(.+)/(?1: )/}${2:var}${3: = ${4:null}}$0
TXT

  tab 'pv', 'private var', <<-'TXT', file: 'private-var'
private ${1:String}${1/(.+)/(?1: )/}${2:var}${3: = ${0:null}}
TXT

  tab 'rea', 'reverseEach { … } ', <<-'TXT', file: 'reverseEach-{-e-__-}'
reverseEach {${1/(.+)/(?1: )/}${1:obj}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'replace', 'replace(dir: …, includes: …, token: …, value: …)', <<-'TXT', file: 'Ant-__-replace'
replace(dir:"${1:dirName}", includes:"${2:*.*}", token:"${3:tokenName}", value:"\${${4:value}}")$0
TXT

  tab 'replace', 'replaceAll(regex) { … }', <<-'TXT', file: 'replaceAll(regex)-{-match-__}'
replaceAll(/${1:regex}/) {${2/(.+)/(?1: )/}${2:match}${2/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'runa', 'runAfter() { … }', <<-'TXT', file: 'run-after'
runAfter(${1:delay}) {
	$0
}
TXT

  tab 'sel', 'splitEachLine(separator) { … }', <<-'TXT', file: 'splitEachLine(separator)-{-line-__-}-copy'
splitEachLine(${1:separator}) {${2/(.+)/(?1: )/}${2:obj}${2/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'setup', 'setUp() { … }', <<-'TXT', file: 'setUp()'
void setUp() {
	$0
}
TXT

  tab 'sf', 'shouldFail { … }', <<-'TXT', file: 'shouldFail(__)-{-__-}'
shouldFail${1/(.+)/(?1:\()/}${1:Exception}${1/(.+)/(?1:\))/} {
	$0
}
TXT

  tab 'sfm', 'static final method() { … }', <<-'TXT', file: 'static-final-method'
static final ${1:void}${1/(.+)/(?1: )/}${2:methodName}(${3:args}) {
	$0
}
TXT

  tab 'sfv', 'static final var', <<-'TXT', file: 'static-final-var'
static final ${1:String}${1/(.+)/(?1: )/}${2:var}${3: = ${4:null}}$0
TXT

  tab 'sleep', 'sleep(secs)', <<-'TXT'
sleep(${1:secs})
TXT

  tab 'sleep', 'sleep(secs) { … // on interrupt do }', <<-'TXT', file: 'sleep(secs)-{-__-on-interrupt-}'
sleep(${1:secs}) {
	${2:// on interrupt do}
}
TXT

  tab 'sm', 'static method() { … }', <<-'TXT', file: 'static-method'
static ${1:void}${1/(.+)/(?1: )/}${2:methodName}(${3:args}) {
	$0
}
TXT

  tab 'sort', 'sort { … }', "sort { \n\t$0\n}", file: 'sort-{-__-}'

  tab 'step', 'step(to,amount) { … }', <<-'TXT', file: 'step(to-amount)-{-n-__-}'
step(${1:to}, ${2:amount}) {${3/(.+)/(?1: )/}${3:i}${3/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'sv', 'static var', <<-'TXT', file: 'static-var'
static ${1:String}${1/(.+)/(?1: )/}${2:var}${3: = ${0:null}}
TXT

  tab 'switch', 'switch … case', <<-'TXT', file: 'switch__case'
switch(${1:value}) {
	case ${2:CASE}:
		$3
	break$0
}
TXT

  tab 'switch', 'switch … case … default', <<-'TXT', file: 'switch__case__default'
switch(${1:value}) {
	case ${3:CASE}:
		$4
	break$0
	default:
		$2
	break
}
TXT

  tab 't', 'test()', <<-'TXT', file: 'test-case'
void test$1() {
	$0
}
TXT

  tab 'tc', 'class … extends GroovyTestCase { … }', <<-'TXT', file: 'class-___-TestCase'
class ${2:${TM_FILENAME/(.*?)(\..+)/$1/}} extends GroovyTestCase {

	$0
}
TXT

  tab 'tear', 'tearDown() { … }', <<-'TXT', file: 'tearDown()'
void tearDown() {
	$0
}
TXT

  tab 'thread', 'Thread.start { … }', <<-'TXT', file: 'Thread_start-{-__-}'
Thread.start {
	$0
}
TXT

  tab 'thread', 'Thread.startDaemon { … }', <<-'TXT', file: 'Thread_startDaemon-{-__-}'
Thread.startDaemon {
	$0
}
TXT

  tab 'times', 'times { … }', <<-'TXT', file: 'times-{-n-__-}'
times {${1/(.+)/(?1: )/}${1:i}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'to', 'to Array', <<-'TXT', file: 'to-Array'
toArray()
TXT

  tab 'to', 'to BigDecimal', <<-'TXT', file: 'to-BigDecimal'
toBigDecimal()
TXT

  tab 'to', 'to BigInteger', <<-'TXT', file: 'to-BigInteger'
toBigInteger()
TXT

  tab 'to', 'to Boolean', <<-'TXT', file: 'to-Boolean'
toBoolean()
TXT

  tab 'to', 'to Character', <<-'TXT', file: 'to-Character'
toCharacter()
TXT

  tab 'to', 'to Double', <<-'TXT', file: 'to-Double'
toDouble()
TXT

  tab 'to', 'to Float', <<-'TXT', file: 'to-Float'
toFloat()
TXT

  tab 'to', 'to Integer', <<-'TXT', file: 'to-Integer'
toInteger()
TXT

  tab 'to', 'to List', <<-'TXT', file: 'to-List'
toList()
TXT

  tab 'to', 'to String', <<-'TXT', file: 'to-String'
toString()
TXT

  tab 'to', 'to URI', <<-'TXT', file: 'to-URI'
toURI()
TXT

  tab 'to', 'to URL', <<-'TXT', file: 'to-URL'
toURL()
TXT

  tab 'try', 'try … catch', <<-'TXT', file: 'try-__-catch__'
try {
	$0
}
catch(${1:Exception} e) {
	$2
}


TXT

  tab 'try', 'try … catch … finally', <<-'TXT', file: 'try-__-catch__-finally'
try {
	$0
}
catch(${1:Exception} e) {
	$2
}
finally {
	$3
}


TXT

  tab 'ut', 'upto() { … }', <<-'TXT', file: 'upto(num)-{-n-__-}'
upto(${1:0}) {${2/(.+)/(?1: )/}${2:i}${2/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'v', 'var', <<-'TXT'
${1:def} ${2:var}${3: = ${0:null}}
TXT

  tab 'while', 'while() { … }', <<-'TXT', file: 'while-___-{___}'
while(${1:condition}) {
	$0
}
TXT

  tab 'with', 'withInputStream { … }', <<-'TXT', file: 'withInputStream-{-in-__-}'
withInputStream {${1/(.+)/(?1: )/}${1:in}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'with', 'withOutputStream { … }', <<-'TXT', file: 'withOutputStream-{-out-__-}'
withOutputStream {${1/(.+)/(?1: )/}${1:out}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'with', 'withPrintWriter { … }', <<-'TXT', file: 'withPrintWriter-{-pw-__}'
withPrintWriter {${1/(.+)/(?1: )/}${1:writer}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'with', 'withReader { … }', <<-'TXT', file: 'withReader-{-r-__-}'
withReader {${1/(.+)/(?1: )/}${1:reader}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'with', 'withStream { … }', <<-'TXT', file: 'withStream-{-in-__-}'
withStream {${1/(.+)/(?1: )/}${1:stream}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'with', 'withStreams { … }', <<-'TXT', file: 'withStreams-{-Socket-s-__}'
withStreams {${1/(.+)/(?1: )/}${1:socket}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'with', 'withWriter { … }', <<-'TXT', file: 'withWriter-{-w-__}'
withWriter {${1/(.+)/(?1: )/}${1:writer}${1/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'with', 'withWriter(charset) { … }', <<-'TXT', file: 'withWriter(charset)-{-w-__-}'
withWriter(${1:charset}) {${2/(.+)/(?1: )/}${2:writer}${2/(.+)/(?1: ->)/}
	$0
}
TXT

  tab 'with', 'withWriterAppend(charset) { … }', <<-'TXT', file: 'withWriterAppend(charset)-{-__-}'
withWriterAppend(${1:charset}) {${2/(.+)/(?1: )/}${2:writer}${2/(.+)/(?1: ->)/}
	$0
}
TXT

end