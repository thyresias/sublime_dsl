# encoding: utf-8

snippets do

  default_scope 'source.java, source.groovy'
  file_format :textmate

  tab 'ab', 'abstract', "abstract ", uuid: 'E54D7A3C-107A-426E-91E8-D066A978BC5E'

  tab 'as', 'assert', <<-'TXT', uuid: 'A30E90E6-FFBF-4899-AB97-7CAA00D0B824'
assert ${1:test}${2/(.+)/(?1: \: ")/}${2:Failure message}${2/(.+)/(?1:")/};$0
TXT

  tab 'br', 'break', <<-'TXT', scope: 'source.java', uuid: 'E4DACBFB-F029-4EC3-BB0D-BEF0D5369DA7'
break;

TXT

  tab 'ca', 'catch', <<-'TXT', uuid: 'CE3059F1-EBFE-426B-A98A-7D935580F915'
catch (${1:Exception} ${2:e}) {
	$0
}
TXT

  tab 'cl', 'class', <<-'TXT', uuid: 'E9ED01EA-E83B-4322-BD9D-39C88FB8C237'
class ${1:${TM_FILENAME/(.*?)(\..+)/$1/}} ${2:extends ${3:Parent} }${4:implements ${5:Interface} }{
	$0
}
TXT

  tab 'co', 'constant', <<-'TXT', scope: 'source.java', uuid: '8CD02FE6-B5EE-4335-AFDF-7CC02C969563'
static public final ${1:String} ${2:var} = $3;$0
TXT

  tab 'cos', 'constant string', <<-'TXT', scope: 'source.java', uuid: '4876099F-502E-471F-9D0D-916C7EF2E353'
static public final String ${1:var} = "$2";$0
TXT

  tab 'cs', 'case', <<-'TXT', uuid: '7396532C-3567-4BDA-9C10-51454A2F2F6D'
case $1:
	$2
$0
TXT

  tab 'de', 'default', <<-'TXT', scope: 'source.java', uuid: 'F050CAEB-56AB-40A7-846B-E5DB70FA0A90'
default:
	$0
TXT

  tab 'el', 'else', <<-'TXT', uuid: '5A7786EE-5F23-422E-A6EC-69778ED7C8FC'
else {
	$0
}
TXT

  tab 'elif', 'else if', <<-'TXT', uuid: '4C07C9CB-4306-417B-B152-653E93C987B5'
else if ($1) {
	$0
}
TXT

  tab 'fi', 'final', "final ", uuid: 'F53E8BF9-4911-4131-B31F-8B4DEE47E421'

  tab 'for', 'for', <<-'TXT', uuid: 'BC9380F7-43F1-4304-91CD-4C490B0A6037'
for ($1; $2; $3) {
	$0
}
TXT

  tab 'fore', 'for (each)', <<-'TXT', scope: 'source.java', uuid: '8B84EAD3-F93D-407A-8BB1-4FEF8B0C71D7'
for ($1 : $2) {
	$0
}
TXT

  tab 'fy', 'finally', <<-'TXT', uuid: '2556E4C9-353C-4D34-A48D-7718A3739F40'
finally {
	$0
}
TXT

  tab 'if', 'if', <<-'TXT', uuid: '476E26EB-5A53-45B3-A497-B22B12815C7F'
if ($1) {
	$0
}
TXT

  tab 'im', 'import', "import ", uuid: '097F4236-D7A4-412F-A078-11ABFCAFC7BA'

  tab 'imt', 'import junit.framework.TestCase;', <<-'TXT', scope: 'source.java', uuid: 'D8E7B79D-ADEC-437D-BFDE-F20D5362D892', file: 'import junit_framework_TestCase;'
import junit.framework.TestCase;
$0
TXT

  tab 'in', 'interface', <<-'TXT', uuid: 'B8E49466-FCBE-4053-AEC3-4ABBE0FF2FEF'
interface ${1:${TM_FILENAME/(.*?)(\..+)/$1/}} ${2:extends ${3:Parent} }{
	$0
}
TXT

  tab 'j.b', 'java.beans.', <<-'TXT', scope: 'source.java', uuid: '5EEDE297-9489-41C8-A7AF-BDB5EABEF41F', file: 'java_beans_'
java.beans.
TXT

  tab 'j.i', 'java.io.', <<-'TXT', scope: 'source.java', uuid: '2887D1D3-A714-41B6-9211-4DEC12417889', file: 'java_io'
java.io.
TXT

  tab 'j.m', 'java.math.', <<-'TXT', scope: 'source.java', uuid: '592F2823-7A2B-4881-99A4-7A18D3623902', file: 'java_math'
java.math.
TXT

  tab 'j.n', 'java.net.', <<-'TXT', scope: 'source.java', uuid: '94C09B88-AC93-4045-86D1-206639D582D0', file: 'java_net_'
java.net.
TXT

  tab 'j.u', 'java.util.', <<-'TXT', scope: 'source.java', uuid: '97DC6637-998E-493C-9765-C8CFB29AC18C', file: 'java_util_'
java.util.
TXT

  tab 'm', 'method', <<-'TXT', scope: 'source.java', uuid: '16D51B5E-56BC-4ED0-84FB-FCC68479BE8E'
${1:void} ${2:method}($3) ${4:throws $5 }{
	$0
}

TXT

  tab 'main', 'method (main)', <<-'TXT', scope: 'source.java', uuid: '90A0278A-56B2-465B-B629-A01DF6524FEA'
public static void main(String[] args) {
	$0
}
TXT

  tab 'p', 'print', <<-'TXT', scope: 'source.java', uuid: '5F390B93-6A28-4EED-B04A-D213640B9DAF'
System.out.print($1);$0
TXT

  tab 'pl', 'println', <<-'TXT', scope: 'source.java', uuid: 'DFD7AE0D-D5CC-4FFF-B37D-EA7ACC8E34DF'
System.out.println($1);$0
TXT

  tab 'po', 'protected', "protected ", uuid: '56C938B4-22B8-45F4-8E09-5BB4DE4633B0'

  tab 'pr', 'private', "private ", uuid: '8E765795-CC9D-46D7-8602-7E2DBB7026B2'

  tab 'pu', 'public', "public ", uuid: 'BD7A6DBE-0180-4E1A-A428-14D44BD88F88'

  tab 're', 'return', "return ", uuid: 'BF745BD9-E345-4CFB-82B1-2CC2195BEFA8'

  tab 'st', 'static', "static ", uuid: 'C0525A43-EEF4-4F59-AC09-84D263888433'

  tab 'sw', 'switch', <<-'TXT', uuid: '2D2F53B7-E41C-4AEE-8A5E-2A5BB7B42E65'
switch ($1) {
	$0
}
TXT

  tab 'sy', 'synchronized', "synchronized ", uuid: '96251D07-2F30-4610-9F0F-65DE730CC0B5'

  tab 't', 'test', <<-'TXT', scope: 'source.java', uuid: '8B285F69-5A6A-46B4-BB31-B5F10DCB5719'
public void test${1:Name}() throws Exception {
	$0
}
TXT

  tab 'tc', 'test case', <<-'TXT', scope: 'source.java', uuid: 'D3D659F5-5318-4D0A-85E2-9A03902A1668'
public class ${1:${TM_FILENAME/(.*?)(\..+)/$1/}} extends ${2:TestCase} {
	$0
}
TXT

  tab 'th', 'throw', <<-'TXT', uuid: 'F0C15D98-790E-4755-A04E-B8903D50F5C6'
throw $0
TXT

  tab 'tn', 'throw new', <<-'TXT', uuid: 'E0D61777-04FC-416F-82A7-7B54C446A00B'
throw new $0
TXT

  tab 'tr', 'try', <<-'TXT', uuid: '7FB7C9A7-08BB-410F-B012-40D99ED8A60E'
try {
	$0
}
TXT

  tab 'v', 'variable', <<-'TXT', uuid: '3621828B-39DB-4B56-8300-DD5C76333868'
${1:String} ${2:var}${3: = ${0:null}};
TXT

  tab 'wh', 'while', <<-'TXT', scope: 'source.java', uuid: '755B1EB0-934C-49C6-AD08-B461C2205C46'
while ($1) {
	$0
}
TXT

end