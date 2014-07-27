# encoding: utf-8

snippets do

  default_scope 'source.php'
  file_format :textmate

  # FIXME: illegal XML character "\u0003" replaced by 'ETX'
  key "ETX", 'Continue Block Comment', <<-'TXT', scope: 'source.php comment.block', uuid: '26BC937A-5A0B-493E-B51F-1AF6E6FEFAD4'
${TM_CURRENT_LINE/(.*\*\/$)|.*?(\/\*(?!.*\*\/)).*|.*/(?1:
:
(?2: )* )/}
TXT

  key "\n", 'Special: Return Between PHP Tags', <<-'TXT', scope: 'L:(meta.embedded.*.php punctuation.section.embedded.end.php) & R:(meta.embedded.line.php punctuation.section.embedded.*.php)', uuid: '89385241-0117-42AE-BDAE-0471554CC3DF'

	$0

TXT

  key "\n", 'Special: Return Inside an Array', <<-'TXT', scope: 'meta.array.empty.php punctuation.definition.array.end.php', uuid: 'E0FF5942-5249-4097-A4EE-E01FAE518CD2'

	$0

TXT

  tab '$_', "COOKIE['…']", <<-'TXT', uuid: '9B253562-8CD0-11D9-B507-000D93C8BE28', file: "$_COOKIE['']"
\$_COOKIE['${1:variable}']
TXT

  tab '$_', "ENV['…']", <<-'TXT', uuid: 'B90F3AE5-8CD0-11D9-B507-000D93C8BE28', file: "$_ENV['']"
\$_ENV['${1:variable}']
TXT

  tab '$_', "FILES['…']", <<-'TXT', uuid: 'FF0A8A5C-8CD0-11D9-B507-000D93C8BE28', file: "$_FILES['']"
\$_FILES['${1:variable}']
TXT

  tab '$_', "GET['…']", <<-'TXT', uuid: 'CF29C6B5-8CD0-11D9-B507-000D93C8BE28', file: "$_GET['']"
\$_GET['${1:variable}']
TXT

  tab '$_', "POST['…']", <<-'TXT', uuid: '4E18C61F-8CD1-11D9-B507-000D93C8BE28', file: "$_POST['']"
\$_POST['${1:variable}']
TXT

  tab '$_', "REQUEST['…']", <<-'TXT', uuid: '19B4F695-8CD1-11D9-B507-000D93C8BE28', file: "$_REQUEST['']"
\$_REQUEST['${1:variable}']
TXT

  tab '$_', "SERVER['…']", <<-'TXT', uuid: '306E5B79-8CD1-11D9-B507-000D93C8BE28', file: "$_SERVER['']"
\$_SERVER['${1:variable}']
TXT

  tab '$_', "SESSION['…']", <<-'TXT', uuid: '40A7709D-8CD1-11D9-B507-000D93C8BE28', file: "$_SESSION['']"
\$_SESSION['${1:variable}']
TXT

  tab '/**', 'Start Docblock', <<-'TXT', uuid: '775F7FCC-C43C-4C23-B935-9D5F6C25CF1D'
/**
 * $0
 */
TXT

  tab '<<<', 'Heredoc', <<-'TXT', uuid: '1634287E-035A-4617-9AD8-09133183F8FE'
<<<${1:HTML}
${2:content here}
$1;

TXT

  tab 'array', '$… = array (…)', <<-'TXT', uuid: 'CBF8F204-8CCF-11D9-B507-000D93C8BE28', file: 'new array( )'
\$${1:arrayName} = array('$2' => $3${4:,} $0);
TXT

  tab 'case', 'case …', <<-'TXT', uuid: 'F262B1FA-8CCE-11D9-B507-000D93C8BE28', file: 'switch( ) case˸'
case '${1:variable}':
	${0:# code...}
	break;
TXT

  tab 'class', 'class …', <<-'TXT', uuid: '0F39268F-8CD0-11D9-B507-000D93C8BE28', file: 'class { }'
/**
* $1
*/
class ${2:ClassName}${3: extends ${4:AnotherClass}}
{
	$5
	function ${6:__construct}(${7:argument})
	{
		${0:# code...}
	}
}

TXT

  tab 'con', 'function __construct', <<-'TXT', uuid: 'DF786227-F5C9-48A1-8C80-49306AE82B6A', file: 'Constructor'
function __construct(${1:\$${2:foo}${3: = ${4:null}}}) {
	${2/.+/$this->$0 = \$$0;/}$0
}
TXT

  tab 'def', 'define(…, …)', <<-'TXT', uuid: '8AAEC70A-8CCF-11D9-B507-000D93C8BE28', file: 'define( )'
define('$1', ${2:'$3'});
$0
TXT

  tab 'def?', 'defined(…)', <<-'TXT', uuid: 'A94E02E2-8CCF-11D9-B507-000D93C8BE28', file: 'defined( )'
$1defined('$2')$0
TXT

  tab 'do', 'do … while …', <<-'TXT', uuid: '1C06D786-8CCF-11D9-B507-000D93C8BE28', file: 'do while( )'
do {
	${0:# code...}
} while (${1:$a <= 10});
TXT

  tab 'doc_c', 'Class', <<-'TXT', uuid: '9086BA3F-87E7-11D9-A6A3-000D93589AF6', file: 'PHPDoc class'
/**
 * ${3:undocumented class}
 *
 * @package ${4:default}
 * @author ${PHPDOC_AUTHOR:$TM_FULLNAME}
 **/
$1class $2
{$0
} // END $1class $2
TXT

  tab 'doc_d', 'Constant Definition', <<-'TXT', uuid: '9086E254-87E7-11D9-A6A3-000D93589AF6', file: 'PHPDoc constant definition'
/**
 * ${3:undocumented constant}
 **/
define($1, $2);$0
TXT

  tab 'doc_f', 'Function', <<-'TXT', uuid: '9087051B-87E7-11D9-A6A3-000D93589AF6', file: 'PHPDoc function'
/**
 * ${4:undocumented function}
 *
 * @return ${5:void}
 * @author ${PHPDOC_AUTHOR:$TM_FULLNAME}$6
 **/
$1function $2($3)
{$0
}
TXT

  tab 'doc_h', 'Header', <<-'TXT', uuid: '90872B90-87E7-11D9-A6A3-000D93589AF6', file: 'PHPDoc header'
/**
 * $1
 *
 * @author ${PHPDOC_AUTHOR:$TM_FULLNAME}
 * @version \$Id\$
 * @copyright `echo $TM_ORGANIZATION_NAME`, `date +"%e %B, %Y" | sed 's/^ //'`
 * @package ${3:default}
 **/

/**
 * Define DocBlock
 **/

TXT

  tab 'doc_i', 'Interface', <<-'TXT', uuid: '90874D6F-87E7-11D9-A6A3-000D93589AF6', file: 'PHPDoc interface'
/**
 * ${2:undocumented class}
 *
 * @package ${3:default}
 * @author ${PHPDOC_AUTHOR:$TM_FULLNAME}
 **/
interface $1
{$0
} // END interface $1
TXT

  tab 'doc_s', 'Function Signature', <<-'TXT', uuid: '908774B1-87E7-11D9-A6A3-000D93589AF6', file: 'PHPDoc function signature', key_equivalent: ""
/**
 * ${4:undocumented function}
 *
 * @return ${5:void}
 * @author ${PHPDOC_AUTHOR:$TM_FULLNAME}$6
 **/
$1function $2($3);$0
TXT

  tab 'doc_v', 'Class Variable', <<-'TXT', uuid: '90879700-87E7-11D9-A6A3-000D93589AF6', file: 'PHPDoc class var'
/**
 * ${3:undocumented class variable}
 *
 * @var ${4:string}
 **/
${1:var} \$$2;$0
TXT

  tab 'echo', '<?php echo … ?>', <<-'TXT', scope: 'text.html.php', uuid: '117476CE-7A7F-4DC4-9A4E-772D282983A3', file: '˂ʔphp echo ___ ʔ˃'
<?${TM_PHP_OPEN_TAG_WITH_ECHO:php echo} ${1:\$var} ?>$0
TXT

  tab 'echo', 'echo "…"', <<-'TXT', uuid: '2B91DE5F-8CD0-11D9-B507-000D93C8BE28', file: 'echo ___'
echo "${1:string}"${0};
TXT

  tab 'echoh', '<?php echo htmlentities(…) ?>', <<-'TXT', scope: 'text.html.php', uuid: 'ED759470-69D7-4ADF-9842-D890DEB00F19', file: '˂ʔphp echo htmlentities(___) ʔ˃'
<?${TM_PHP_OPEN_TAG_WITH_ECHO:php echo} htmlentities(${1:\$var}, ENT_QUOTES, 'utf-8') ?>$0
TXT

  tab 'else', '<?php else: ?>', <<-'TXT', scope: 'text.html.php', uuid: '3F335934-360B-40F2-9D5C-CB299FD2F215'
<?${TM_PHP_OPEN_TAG:php} else: ?>
TXT

  tab 'else', 'else …', <<-'TXT', uuid: '609FE8EB-B251-11D9-872D-000D93C8BE28', file: 'else {}'
else {
	${0:# code...}
}
TXT

  tab 'elseif', 'elseif …', <<-'TXT', uuid: '61DCF7E4-8CCE-11D9-B507-000D93C8BE28', file: 'elseif( )'
elseif (${1:condition}) {
	${0:# code...}
}
TXT

  tab 'ethis', '<?php echo $this->… ?>', <<-'TXT', scope: 'text.html.php - source', uuid: '7553818C-6FF8-455D-BD83-D2A587BAF6F4'
<?${TM_PHP_OPEN_TAG_WITH_ECHO:php echo} \$this->$0 ?>
TXT

  tab 'for', 'for …', "for (\\$${1:i}=${2:0}; \\$${1:i} < $3; \\$${1:i}++) { \n\t${0:# code...}\n}", uuid: 'AC5561AA-8CCE-11D9-B507-000D93C8BE28', file: 'for( )'

  tab 'foreach', '<?php foreach (…) … <?php endforeach ?>', <<-'TXT', scope: 'text.html.php', uuid: '1E34E416-CD16-4C16-A369-9CDC3FAFD4C4', file: '˂ʔphp foreach (___) ___ ˂ʔphp endforeach ʔ˃'
<?${TM_PHP_OPEN_TAG:php} foreach (\$${1:variable} as \$${2:key}${3: => \$${4:value}}): ?>
	${0}
<?${TM_PHP_OPEN_TAG:php} endforeach ?>
TXT

  tab 'foreach', 'foreach …', <<-'TXT', uuid: 'C0229432-8CCE-11D9-B507-000D93C8BE28', file: 'foreach( )'
foreach (\$${1:variable} as \$${2:key}${3: => \$${4:value}}) {
	${0:# code...}
}
TXT

  tab 'fun', 'function …', <<-'TXT', uuid: 'EC96DA26-8CCF-11D9-B507-000D93C8BE28', file: 'function xx( )'
${1:public }function ${2:FunctionName}(${3:\$${4:value}${5:=''}})
{
	${0:# code...}
}
TXT

  tab 'globals', "$GLOBALS['…']", <<-'TXT', uuid: 'E8BDF86F-8CD0-11D9-B507-000D93C8BE28', file: "$GLOBALS['']"
\$GLOBALS['${1:variable}']${2: = }${3:something}${4:;}$0
TXT

  tab 'if', '<?php if (…) ?> … <?php endif ?>', <<-'TXT', scope: 'text.html.php', uuid: '4F33617A-80FE-47D2-84AF-AA3D5D8A7128', file: '˂ʔphp if (___) ʔ˃ ___ ˂ʔphp endif ʔ˃'
<?${TM_PHP_OPEN_TAG:php} if (${1:condition}): ?>
	$0
<?${TM_PHP_OPEN_TAG:php} endif ?>
TXT

  tab 'if', 'if …', <<-'TXT', uuid: '35F46C2E-8CCE-11D9-B507-000D93C8BE28', file: 'if( )'
if (${1:condition}) {
	${0:# code...}
}
TXT

  tab 'if?', '$… = ( … ) ? … : …', <<-'TXT', uuid: '7720523B-8CCE-11D9-B507-000D93C8BE28', file: 'if ʔ˸ a ˸ b;'
\$${1:retVal} = (${2:condition}) ? ${3:a} : ${4:b} ;
TXT

  tab 'ifelse', '<?php if (…) ?> … <?php else ?> … <?php endif ?>', <<-'TXT', scope: 'text.html.php', uuid: 'E863B097-0FD5-43D5-8547-235330081203', file: '˂ʔphp if (___) ʔ˃ ___ ˂ʔphp else ʔ˃ ___ ˂ʔphp endif ʔ˃'
<?${TM_PHP_OPEN_TAG:php} if (${1:condition}): ?>
	$2
<?${TM_PHP_OPEN_TAG:php} else: ?>
	$0
<?${TM_PHP_OPEN_TAG:php} endif ?>
TXT

  tab 'ifelse', 'if … else …', <<-'TXT', uuid: '4B72EA1F-8CCE-11D9-B507-000D93C8BE28', file: 'if( ) else( )'
if (${1:condition}) {
	${2:# code...}
} else {
	${3:# code...}
}
$0
TXT

  tab 'incl', 'include …', <<-'TXT', uuid: '34E2C808-8CCF-11D9-B507-000D93C8BE28', file: 'include( )'
include '${1:file}';$0
TXT

  tab 'incl1', 'include_once …', <<-'TXT', uuid: '4833C612-8CCF-11D9-B507-000D93C8BE28', file: 'include_once( )'
include_once '${1:file}';$0
TXT

  tab 'php', '<?php … ?>', <<-'TXT', scope: 'text.html.php', uuid: 'BB471E3A-8CCD-11D9-B507-000D93C8BE28', file: '˂ʔphp ʔ˃', key_equivalent: "^>"
<?${TM_PHP_OPEN_TAG:php} $0 ?>
TXT

  tab 'php', '?>…<?php', <<-'TXT', uuid: 'C1B97DFD-7F2E-4CF8-881D-F63843DE8BD5', key_equivalent: "^>"
?>$0<?${TM_PHP_OPEN_TAG:php}
TXT

  tab 'phperr', 'PHP Error Catching JavaScript', <<-'TXT', scope: 'text.html.php', uuid: '9C891C7B-CFA8-4860-B76F-4E3AD60B0E13', file: 'PHP Error Catching'
`cat "$TM_BUNDLE_SUPPORT/textmate_error_handler.html" | grep -E -v '^[ \t\s]*\/\/' | sed 's/\(.*\)[ \t]*--.*/\1/' | tr -s ' \n\t' ' ' | sed 's/.\{80\}[{};]/&\
/g'`
TXT

  tab 'req', 'require …', <<-'TXT', uuid: '60129434-8CCF-11D9-B507-000D93C8BE28', file: 'require( )'
require '${1:file}';$0
TXT

  tab 'req1', 'require_once …', <<-'TXT', uuid: '6E25DCEF-8CCF-11D9-B507-000D93C8BE28', file: 'require_once( )'
require_once '${1:file}';$0
TXT

  tab 'ret', 'return', <<-'TXT', uuid: '80D861BF-8CD0-11D9-B507-000D93C8BE28', file: 'return $retVal;'
return$1;$0
TXT

  tab 'ret0', 'return false', <<-'TXT', uuid: '56873C6E-8CD0-11D9-B507-000D93C8BE28', file: 'return FALSE;'
return false;$0
TXT

  tab 'ret1', 'return true', <<-'TXT', uuid: '459B8A24-8CD0-11D9-B507-000D93C8BE28', file: 'return TRUE;'
return true;$0
TXT

  tab 'switch', 'switch …', <<-'TXT', uuid: 'DA4B6728-8CCE-11D9-B507-000D93C8BE28', file: 'switch( )'
switch (${1:variable}) {
	case '${2:value}':
		${3:# code...}
		break;
	$0
	default:
		${4:# code...}
		break;
}
TXT

  tab 'this', '<?php $this->… ?>', <<-'TXT', scope: 'text.html.php - source', uuid: '5F800F2D-55DA-4E06-99A3-41B734C8768E'
<?${TM_PHP_OPEN_TAG:php} \$this->$0 ?>
TXT

  tab 'throw', 'Throw Exception', <<-'TXT', uuid: 'FE39640E-A69C-48DF-9282-633672AAEFD2', file: 'throw'
throw new $1Exception(${2:"${3:Error Processing Request}"}${4:, ${5:1}});
$0
TXT

  tab 'tmphp', 'Include TextMate Support Script', <<-'TXT', uuid: '6F3ABAC6-EEC9-4797-8D4A-6FD549094852'
// === TextMate error handling ===
`if [[ "$TM_BUNDLE_SUPPORT" == "$HOME"* ]]; then
  echo "// NOTE: Your PHP bundle is checked out to your home directory."
  echo "// If the webserver process does not have permission to access"
  echo "// the included file, you can replace"
  echo "// ‘${TM_BUNDLE_SUPPORT%Bundles*}’ with"
  echo "// ‘$(find_app TextMate.app)/Contents/SharedSupport/’."
fi`
@include_once '$TM_BUNDLE_SUPPORT/textmate.php';

TXT

  tab 'try', 'Wrap in try { … } catch (…) { … }', <<-'TXT', uuid: 'F7751DAF-AC95-4D47-955F-FE2534FDE4F5', file: 'try { ___ } catch (___) { ___ }', key_equivalent: "^@W"
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}try {
	${3:${TM_SELECTED_TEXT/(\A.*)|(.+)|\n\z/(?1:$0:(?2:\t$0))/g}}
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}} catch (${1:Exception} ${2:\$e}) {
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}	$0
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}}
TXT

  tab 'while', 'while …', <<-'TXT', uuid: '0D955946-8CCF-11D9-B507-000D93C8BE28', file: 'while( )'
while (${1:$a <= 10}) {
	${0:# code...}
}
TXT

end