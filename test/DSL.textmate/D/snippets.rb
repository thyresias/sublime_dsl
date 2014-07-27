# encoding: utf-8

snippets do

  default_scope 'source.d'
  file_format :textmate

  # FIXME: illegal XML character "\u0003" replaced by 'ETX'
  key "ETX", 'Continue Block Comment', <<-'TXT', scope: 'source.d comment.block', uuid: '3B85C6F6-769C-4FF6-B70B-327BBEA574D7'
${TM_CURRENT_LINE/(.*\*\/$)|.*?(\/\*(?!.*\*\/)).*|.*/(?1:
:
(?2: )* )/}
TXT

  tab 'class', 'class … { … }', <<-'TXT', uuid: 'E3D192EB-3C23-4B9A-9364-A301417F0434', file: 'class'
class ${1:${TM_FILENAME/(.*?)(\..+)/$1/}} {
	this($2) {
		$0
	}
}

TXT

  tab 'debug', 'debug { … }', <<-'TXT', uuid: 'ECBA4CA0-275F-460E-85BE-F82FEA2E2B09', file: 'debug'
debug {
	$0
}
TXT

  tab 'debugm', 'debug(module) { … }', <<-'TXT', uuid: 'ECBA4CA0-275F-460E-85BE-F82FEA2E2B08', file: 'debugm'
debug(${1:${TM_FILENAME/(.*?)(\..+)/$1/}}) {
	$0
}
TXT

  tab 'en', 'enum … { … }', <<-'TXT', uuid: 'C3A24E5E-A057-4A4A-BE65-5E7B92E0CB11', file: 'enum'
enum ${1:name}() { $3 }
TXT

  tab 'err', 'Stderr(…)', <<-'TXT', uuid: 'ECBA4CA0-275F-460E-85BE-F82FEA2E2B05', file: 'err'
Stderr("$1").newline;
TXT

  tab 'errf', 'Stderr(format, …)', <<-'TXT', uuid: 'ECBA4CA0-275F-460E-85BE-F82FEA2E2B06', file: 'err format'
Stderr.format("${1:foo = {\}}", $2).newline;
TXT

  tab 'fe', 'foreach(e; …) { … }', <<-'TXT', uuid: 'ECBA4CA0-275F-460E-85BE-F82FEA2E2B01', file: 'foreach'
foreach(${1:e}; $0) {

}
TXT

  tab 'fer', 'foreach_reverse(e; …) { … }', <<-'TXT', uuid: 'ECBA4CA0-275F-460E-85BE-F82FDA2E2B01', file: 'foreach reverse'
foreach_reverse(${1:e}; $0) {

}
TXT

  tab 'if', 'if …', <<-'TXT', uuid: 'C7D15778-04A6-4750-BED7-E0B2C9FAC817', file: 'if'
if(${1:condition}) {
	$0
}
TXT

  tab 'ife', 'if … else', <<-'TXT', uuid: 'C7D15778-04A6-4750-BED7-E0B2C9FAC818', file: 'if else'
if(${1:condition}) {
	$2
}
else {
	$0
}
TXT

  tab 'im', 'import …', <<-'TXT', uuid: '897B3073-FF95-4D71-A581-206EF3FF59D6', file: 'import'
import ${1:${TM_FILEPATH/.+\/([^\/]+)\/[^\/]+\.d$/\l$1/}.};
TXT

  tab 'log', 'log.info(…)', <<-'TXT', uuid: 'BC8B9129-5F16-11D9-B9C3-000D93589AF8', file: 'log info'
log.info("$1");
TXT

  tab 'loge', 'log.error(…)', <<-'TXT', uuid: 'BC8B9129-5F16-11D9-B9C3-000D93589B01', file: 'log error'
log.error("$1");
TXT

  tab 'logf', 'log.fatal(…)', <<-'TXT', uuid: 'BC8B9129-5F16-11D9-B9C3-000D93589B02', file: 'log fatal'
log.fatal("$1");
TXT

  tab 'logger', 'Logger for Module', <<-'TXT', uuid: '4CF479D3-48FD-4FE4-847B-AD7570D383C3', file: 'logger'
import tango.util.log.Log, tango.util.log.Configurator;

protected static Logger log = null;
static this() {
	log = Log.getLogger(${1:__FILE__});${2:
	//log.setLevel(log.Level.${3:Info});}
}
TXT

  tab 'logt', 'log.trace(…)', <<-'TXT', uuid: 'BC8B9129-5F16-11D9-B9C3-000D93589AF7', file: 'log trace'
log.trace("$1");
TXT

  tab 'logw', 'log.warn(…)', <<-'TXT', uuid: 'BC8B9129-5F16-11D9-B9C3-000D93589AF9', file: 'log warn'
log.warn("$1");
TXT

  tab 'main', 'void main() { … }', <<-'TXT', uuid: '644E0687-5DC6-49B4-838B-5CD72685225B', file: 'main'
void main() {
	${1}
}
TXT

  tab 'maina', 'int main(char[][] args) { … }', <<-'TXT', uuid: '644E0687-5DC6-49B4-838B-5CD72685225C', file: 'main with args'
int main(char[][] args) {
	$1
	return 0;
}
TXT

  tab 'me', 'method … { … }', <<-'TXT', uuid: 'C3A24E5E-A057-4A4A-BE65-5E7B92E0CB0F', file: 'method'
/**
 * $2
 */
${1:void} ${2:method}() {
	${3}
}
TXT

  tab 'out', 'Stdout(…)', <<-'TXT', uuid: 'ECBA4CA0-275F-460E-85BE-F82FEA2E2B03', file: 'out'
Stdout("$1").newline;
TXT

  tab 'outf', 'Stdout(format, …)', <<-'TXT', uuid: 'ECBA4CA0-275F-460E-85BE-F82FEA2E2B04', file: 'out format'
Stdout.format("${1:foo = {\}}", $2).newline;
TXT

  tab 'ps', 'constant (private static final)', <<-'TXT', uuid: 'BC8B8F52-5F16-11D9-B9C3-000D93589AF7', file: 'constant'
private static final ${1:char[]} ${2:name} = ${4:"${3:value}"};
TXT

  tab 'r', 'return …', <<-'TXT', uuid: 'ECBA4CA0-275F-460E-85BE-F82FEA2E2B0B', file: 'return'
return $0;
TXT

  tab 'st', 'struct … { … }', <<-'TXT', uuid: 'C3A24E5E-A057-4A4A-BE65-5E7B92E0CB10', file: 'struct'
/**
 * $2
 */
struct ${1:name}() {
	$3
}
TXT

  tab 'tc', 'try … catch', <<-'TXT', uuid: 'E87DC9FC-8C4E-468B-BBA5-03D810BB71D9', file: 'try catch'
try {
	$2
} catch (${1:Exception} e) {
	$0
}
TXT

  tab 'tcf', 'try … catch … finally', <<-'TXT', uuid: 'E87DC9FC-8C4E-468B-BBA5-03D810BB71D8', file: 'try catch finally'
try {
	$2
} catch (${1:Exception} e) {
	$3
} finally {
	$0
}
TXT

  tab 'tf', 'try … finally', <<-'TXT', uuid: 'E87DC9FC-8C4E-468B-BBA5-03D810BB71E0', file: 'try finally'
try {
	$1
} finally {
	$0
}
TXT

  tab 'unit', 'unittest { … }', <<-'TXT', uuid: 'ECBA4CA0-275F-460E-85BE-F82FEA2E2B07', file: 'unittest'
unittest {
	$0
}
TXT

  tab 'ver', 'version(ident) { … }', <<-'TXT', uuid: 'ECBA4CA0-275F-460E-85BE-F82FEA2E2B0A', file: 'version'
version(${1:Posix}) {
	$0
}
TXT

  tab 'while', 'while(…) { … }', <<-'TXT', uuid: 'ECBA4CA0-275F-460E-85BE-F82FEA2E2B02', file: 'while'
while (${1:condition}) {
	$0
}
TXT

end