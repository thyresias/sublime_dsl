# encoding: utf-8

snippets do

  default_scope 'source.d'

  tab 'class', 'class … { … }', <<-'TXT', file: 'class'
class ${1:${TM_FILENAME/(.*?)(\..+)/$1/}} {
	this($2) {
		$0
	}
}

TXT

  tab 'debug', 'debug { … }', <<-'TXT', file: 'debug'
debug {
	$0
}
TXT

  tab 'debugm', 'debug(module) { … }', <<-'TXT', file: 'debugm'
debug(${1:${TM_FILENAME/(.*?)(\..+)/$1/}}) {
	$0
}
TXT

  tab 'en', 'enum … { … }', <<-'TXT', file: 'enum'
enum ${1:name}() { $3 }
TXT

  tab 'err', 'Stderr(…)', <<-'TXT', file: 'err'
Stderr("$1").newline;
TXT

  tab 'errf', 'Stderr(format, …)', <<-'TXT', file: 'err-format'
Stderr.format("${1:foo = {\}}", $2).newline;
TXT

  tab 'fe', 'foreach(e; …) { … }', <<-'TXT', file: 'foreach'
foreach(${1:e}; $0) {

}
TXT

  tab 'fer', 'foreach_reverse(e; …) { … }', <<-'TXT', file: 'foreach-reverse'
foreach_reverse(${1:e}; $0) {

}
TXT

  tab 'if', 'if …', <<-'TXT', file: 'if'
if(${1:condition}) {
	$0
}
TXT

  tab 'ife', 'if … else', <<-'TXT', file: 'if-else'
if(${1:condition}) {
	$2
}
else {
	$0
}
TXT

  tab 'im', 'import …', <<-'TXT', file: 'import'
import ${1:${TM_FILEPATH/.+\/([^\/]+)\/[^\/]+\.d$/\l$1/}.};
TXT

  tab 'log', 'log.info(…)', <<-'TXT', file: 'log-info'
log.info("$1");
TXT

  tab 'loge', 'log.error(…)', <<-'TXT', file: 'log-error'
log.error("$1");
TXT

  tab 'logf', 'log.fatal(…)', <<-'TXT', file: 'log-fatal'
log.fatal("$1");
TXT

  tab 'logger', 'Logger for Module', <<-'TXT', file: 'logger'
import tango.util.log.Log, tango.util.log.Configurator;

protected static Logger log = null;
static this() {
	log = Log.getLogger(${1:__FILE__});${2:
	//log.setLevel(log.Level.${3:Info});}
}
TXT

  tab 'logt', 'log.trace(…)', <<-'TXT', file: 'log-trace'
log.trace("$1");
TXT

  tab 'logw', 'log.warn(…)', <<-'TXT', file: 'log-warn'
log.warn("$1");
TXT

  tab 'main', 'void main() { … }', <<-'TXT', file: 'main'
void main() {
	${1}
}
TXT

  tab 'maina', 'int main(char[][] args) { … }', <<-'TXT', file: 'main-with-args'
int main(char[][] args) {
	$1
	return 0;
}
TXT

  tab 'me', 'method … { … }', <<-'TXT', file: 'method'
/**
 * $2
 */
${1:void} ${2:method}() {
	${3}
}
TXT

  tab 'out', 'Stdout(…)', <<-'TXT', file: 'out'
Stdout("$1").newline;
TXT

  tab 'outf', 'Stdout(format, …)', <<-'TXT', file: 'out-format'
Stdout.format("${1:foo = {\}}", $2).newline;
TXT

  tab 'ps', 'constant (private static final)', <<-'TXT', file: 'constant'
private static final ${1:char[]} ${2:name} = ${4:"${3:value}"};
TXT

  tab 'r', 'return …', <<-'TXT', file: 'return'
return $0;
TXT

  tab 'st', 'struct … { … }', <<-'TXT', file: 'struct'
/**
 * $2
 */
struct ${1:name}() {
	$3
}
TXT

  tab 'tc', 'try … catch', <<-'TXT', file: 'try-catch'
try {
	$2
} catch (${1:Exception} e) {
	$0
}
TXT

  tab 'tcf', 'try … catch … finally', <<-'TXT', file: 'try-catch-finally'
try {
	$2
} catch (${1:Exception} e) {
	$3
} finally {
	$0
}
TXT

  tab 'tf', 'try … finally', <<-'TXT', file: 'try-finally'
try {
	$1
} finally {
	$0
}
TXT

  tab 'unit', 'unittest { … }', <<-'TXT', file: 'unittest'
unittest {
	$0
}
TXT

  tab 'ver', 'version(ident) { … }', <<-'TXT', file: 'version'
version(${1:Posix}) {
	$0
}
TXT

  tab 'while', 'while(…) { … }', <<-'TXT', file: 'while'
while (${1:condition}) {
	$0
}
TXT

end