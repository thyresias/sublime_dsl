# encoding: utf-8

snippets do

  default_scope 'source.java'

  tab 'ab', 'abstract', "abstract "

  tab 'as', 'assert', <<-'TXT'
assert ${1:test}${2/(.+)/(?1: \: ")/}${2:Failure message}${2/(.+)/(?1:")/};$0
TXT

  tab 'br', 'break', <<-'TXT'
break;

TXT

  tab 'ca', 'catch', <<-'TXT'
catch (${1:Exception} ${2:e}) {
	$0
}
TXT

  tab 'cl', 'class', <<-'TXT'
class ${1:${TM_FILENAME/(.*?)(\..+)/$1/}} ${2:extends ${3:Parent} }${4:implements ${5:Interface} }{
	$0
}
TXT

  tab 'co', 'constant', <<-'TXT'
static public final ${1:String} ${2:var} = $3;$0
TXT

  tab 'cos', 'constant string', <<-'TXT', file: 'constant-string'
static public final String ${1:var} = "$2";$0
TXT

  tab 'cs', 'case', <<-'TXT'
case $1:
	$2
$0
TXT

  tab 'de', 'default', <<-'TXT'
default:
	$0
TXT

  tab 'el', 'else', <<-'TXT'
else {
	$0
}
TXT

  tab 'elif', 'else if', <<-'TXT', file: 'else-if'
else if ($1) {
	$0
}
TXT

  tab 'fi', 'final', "final "

  tab 'for', 'for', <<-'TXT'
for ($1; $2; $3) {
	$0
}
TXT

  tab 'fore', 'for (each)', <<-'TXT', file: 'for-(each)'
for ($1 : $2) {
	$0
}
TXT

  tab 'if', 'if', <<-'TXT'
if ($1) {
	$0
}
TXT

  tab 'im', 'import', "import "

  tab 'imt', 'import junit.framework.TestCase;', <<-'TXT', file: 'import-junit_framework_TestCase;'
import junit.framework.TestCase;
$0
TXT

  tab 'in', 'interface', <<-'TXT'
interface ${1:${TM_FILENAME/(.*?)(\..+)/$1/}} ${2:extends ${3:Parent} }{
	$0
}
TXT

  tab 'j.b', 'java.beans.', <<-'TXT', file: 'java_beans_'
java.beans.
TXT

  tab 'j.i', 'java.io.', <<-'TXT', file: 'java_io'
java.io.
TXT

  tab 'j.m', 'java.math.', <<-'TXT', file: 'java_math'
java.math.
TXT

  tab 'j.n', 'java.net.', <<-'TXT', file: 'java_net_'
java.net.
TXT

  tab 'j.u', 'java.util.', <<-'TXT', file: 'java_util_'
java.util.
TXT

  tab 'm', 'method', <<-'TXT'
${1:void} ${2:method}($3) ${4:throws $5 }{
	$0
}

TXT

  tab 'main', 'method (main)', <<-'TXT', file: 'method-(main)'
public static void main(String[] args) {
	$0
}
TXT

  tab 'p', 'print', <<-'TXT'
System.out.print($1);$0
TXT

  tab 'pa', 'package', "package "

  tab 'pl', 'println', <<-'TXT'
System.out.println($1);$0
TXT

  tab 'po', 'protected', "protected "

  tab 'pr', 'private', "private "

  tab 'pu', 'public', "public "

  tab 're', 'return', "return "

  tab 'st', 'static', "static "

  tab 'sw', 'switch', <<-'TXT'
switch ($1) {
	$0
}
TXT

  tab 'sy', 'synchronized', "synchronized "

  tab 't', 'test', <<-'TXT'
public void test${1:Name}() throws Exception {
	$0
}
TXT

  tab 'tc', 'test case', <<-'TXT', file: 'test-case'
public class ${1:${TM_FILENAME/(.*?)(\..+)/$1/}} extends ${2:TestCase} {
	$0
}
TXT

  tab 'th', 'throw', <<-'TXT'
throw $0
TXT

  tab 'v', 'variable', <<-'TXT'
${1:String} ${2:var}${3: = ${0:null}};
TXT

  tab 'wh', 'while', <<-'TXT'
while ($1) {
	$0
}
TXT

end