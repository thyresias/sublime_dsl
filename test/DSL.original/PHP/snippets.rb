# encoding: utf-8

snippets do

  default_scope 'source.php'

  tab '$_', "COOKIE['…']", <<-'TXT', file: "$_COOKIE['']"
\$_COOKIE['${1:variable}']
TXT

  tab '$_', "ENV['…']", <<-'TXT', file: "$_ENV['']"
\$_ENV['${1:variable}']
TXT

  tab '$_', "FILES['…']", <<-'TXT', file: "$_FILES['']"
\$_FILES['${1:variable}']
TXT

  tab '$_', "GET['…']", <<-'TXT', file: "$_GET['']"
\$_GET['${1:variable}']
TXT

  tab '$_', "POST['…']", <<-'TXT', file: "$_POST['']"
\$_POST['${1:variable}']
TXT

  tab '$_', "REQUEST['…']", <<-'TXT', file: "$_REQUEST['']"
\$_REQUEST['${1:variable}']
TXT

  tab '$_', "SERVER['…']", <<-'TXT', file: "$_SERVER['']"
\$_SERVER['${1:variable}']
TXT

  tab '$_', "SESSION['…']", <<-'TXT', file: "$_SESSION['']"
\$_SESSION['${1:variable}']
TXT

  tab '/**', 'Start Docblock', <<-'TXT', file: 'Start-Docblock'
/**
 * $0
 */
TXT

  tab 'array', '$… = array (…)', <<-'TXT', scope: 'source.php - variable.other.php', file: 'new-array(-)'
\$${1:arrayName} = array('$2' => $3${4:,} $0);
TXT

  tab 'case', 'case …', <<-'TXT', file: 'switch(-)-case'
case '${1:variable}':
	${0:# code...}
	break;
TXT

  tab 'class', 'class …', <<-'TXT', file: 'class-{-}'
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

  tab 'con', 'function __construct', <<-'TXT', file: 'Constructor'
function __construct(${1:\$${2:foo}${3: = ${4:null}}}) {
	${2/.+/$this->$0 = \$$0;/}$0
}
TXT

  tab 'def', 'define(…, …)', <<-'TXT', file: 'define(-)'
define('$1', ${2:'$3'});
$0
TXT

  tab 'def?', 'defined(…)', <<-'TXT', file: 'defined(-)'
$1defined('$2')$0
TXT

  tab 'do', 'do … while …', <<-'TXT', file: 'do-while(-)'
do {
	${0:# code...}
} while (${1:$a <= 10});
TXT

  tab 'doc_c', 'Class', <<-'TXT', file: 'PHPDoc-class'
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

  tab 'doc_d', 'Constant Definition', <<-'TXT', file: 'PHPDoc-constant-definition'
/**
 * ${3:undocumented constant}
 **/
define($1, $2);$0
TXT

  tab 'doc_f', 'Function', <<-'TXT', file: 'PHPDoc-function'
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

  tab 'doc_i', 'Interface', <<-'TXT', file: 'PHPDoc-interface'
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

  tab 'doc_s', 'Function Signature', <<-'TXT', file: 'PHPDoc-function-signature'
/**
 * ${4:undocumented function}
 *
 * @return ${5:void}
 * @author ${PHPDOC_AUTHOR:$TM_FULLNAME}$6
 **/
$1function $2($3);$0
TXT

  tab 'doc_v', 'Class Variable', <<-'TXT', file: 'PHPDoc-class-var'
/**
 * ${3:undocumented class variable}
 *
 * @var ${4:string}
 **/
${1:var} \$$2;$0
TXT

  tab 'echo', '<?php echo … ?>', <<-'TXT', scope: 'text.html - source.php', file: 'php-echo-___'
<?${TM_PHP_OPEN_TAG_WITH_ECHO:php echo} ${1:\$var} ?>$0
TXT

  tab 'echo', 'echo "…"', <<-'TXT', file: 'echo-___'
echo "${1:string}"${0};
TXT

  tab 'echoh', '<?php echo htmlentities(…) ?>', <<-'TXT', scope: 'text.html - source.php', file: 'php-echo-htmlentities(___)'
<?${TM_PHP_OPEN_TAG_WITH_ECHO:php echo} htmlentities(${1:\$var}, ENT_QUOTES, 'utf-8') ?>$0
TXT

  tab 'else', '<?php else: ?>', <<-'TXT', scope: 'text.html - source', file: 'php-else'
<?${TM_PHP_OPEN_TAG:php} else: ?>
TXT

  tab 'elseif', 'elseif …', <<-'TXT', file: 'elseif(-)'
elseif (${1:condition}) {
	${0:# code...}
}
TXT

  tab 'ethis', '<?php echo $this->… ?>', <<-'TXT', scope: 'text.html - source.php', file: 'php-echo-$this'
<?${TM_PHP_OPEN_TAG_WITH_ECHO:php echo} \$this->$0 ?>
TXT

  tab 'for', 'for …', "for (\\$${1:i}=${2:0}; \\$${1:i} < $3; \\$${1:i}++) { \n\t${0:# code...}\n}", file: 'for(-)'

  tab 'foreach', '<?php foreach (…) … <?php endforeach ?>', <<-'TXT', scope: 'text.html - source', file: 'php-foreach-(___)-___-php-endforeach'
<?${TM_PHP_OPEN_TAG:php} foreach (\$${1:variable} as \$${2:key}${3: => \$${4:value}}): ?>
	${0}
<?${TM_PHP_OPEN_TAG:php} endforeach ?>
TXT

  tab 'foreach', 'foreach …', <<-'TXT', file: 'foreach(-)'
foreach (\$${1:variable} as \$${2:key}${3: => \$${4:value}}) {
	${0:# code...}
}
TXT

  tab 'fun', 'function …', <<-'TXT', file: 'function-xx(-)'
${1:public }function ${2:FunctionName}(${3:\$${4:value}${5:=''}})
{
	${0:# code...}
}
TXT

  tab 'globals', "$GLOBALS['…']", <<-'TXT', file: "$GLOBALS['']"
\$GLOBALS['${1:variable}']${2: = }${3:something}${4:;}$0
TXT

  tab 'if', '<?php if (…) ?> … <?php endif ?>', <<-'TXT', scope: 'text.html - source', file: 'php-if-(___)-___-php-endif'
<?${TM_PHP_OPEN_TAG:php} if (${1:condition}): ?>
	$0
<?${TM_PHP_OPEN_TAG:php} endif ?>
TXT

  tab 'if', 'if …', <<-'TXT', file: 'if(-)'
if (${1:condition}) {
	${0:# code...}
}
TXT

  tab 'if?', '$… = ( … ) ? … : …', <<-'TXT', file: 'if-a-b;'
\$${1:retVal} = (${2:condition}) ? ${3:a} : ${4:b} ;
TXT

  tab 'ifelse', '<?php if (…) ?> … <?php else ?> … <?php endif ?>', <<-'TXT', scope: 'text.html - source', file: 'php-if-(___)-___-php-else-___-php-endif'
<?${TM_PHP_OPEN_TAG:php} if (${1:condition}): ?>
	$2
<?${TM_PHP_OPEN_TAG:php} else: ?>
	$0
<?${TM_PHP_OPEN_TAG:php} endif ?>
TXT

  tab 'ifelse', 'if … else …', <<-'TXT', file: 'if(-)-else(-)'
if (${1:condition}) {
	${2:# code...}
} else {
	${3:# code...}
}
$0
TXT

  tab 'incl', 'include …', <<-'TXT', file: 'include(-)'
include '${1:file}';$0
TXT

  tab 'incl1', 'include_once …', <<-'TXT', file: 'include_once(-)'
include_once '${1:file}';$0
TXT

  tab 'php', '<?php … ?>', <<-'TXT', scope: 'text.html - source.php', file: 'php'
<?${TM_PHP_OPEN_TAG:php} $0 ?>
TXT

  tab 'req', 'require …', <<-'TXT', file: 'require(-)'
require '${1:file}';$0
TXT

  tab 'req1', 'require_once …', <<-'TXT', file: 'require_once(-)'
require_once '${1:file}';$0
TXT

  tab 'ret', 'return', <<-'TXT', file: 'return-$retVal;'
return$1;$0
TXT

  tab 'ret0', 'return false', <<-'TXT', file: 'return-FALSE;'
return false;$0
TXT

  tab 'ret1', 'return true', <<-'TXT', file: 'return-TRUE;'
return true;$0
TXT

  tab 'switch', 'switch …', <<-'TXT', file: 'switch(-)'
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

  tab 'this', '<?php $this->… ?>', <<-'TXT', scope: 'text.html - source', file: 'php-$this'
<?${TM_PHP_OPEN_TAG:php} \$this->$0 ?>
TXT

  tab 'throw', 'Throw Exception', <<-'TXT', file: 'throw'
throw new $1Exception(${2:"${3:Error Processing Request}"}${4:, ${5:1}});
$0
TXT

  tab 'try', 'Wrap in try { … } catch (…) { … }', <<-'TXT', file: 'try-{-___-}-catch-(___)-{-___-}'
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}try {
	${3:${TM_SELECTED_TEXT/(\A.*)|(.+)|\n\z/(?1:$0:(?2:\t$0))/g}}
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}} catch (${1:Exception} ${2:\$e}) {
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}	$0
${TM_SELECTED_TEXT/([\t ]*).*/$1/m}}
TXT

  tab 'while', 'while …', <<-'TXT', file: 'while(-)'
while (${1:$a <= 10}) {
	${0:# code...}
}
TXT

end