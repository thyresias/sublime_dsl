# encoding: utf-8

snippets do

  default_scope 'source.scala'
  file_format :textmate

  key "\n", 'Special: Return Inside parentheses', <<-'TXT', scope: 'meta.parentheses.scala', uuid: 'E364F26E-C766-4068-BAAF-C010FA1F5F92', file: 'Special-Return Inside parentheses'

	$0

TXT

  tab '->', 'right arrow', <<-'TXT', uuid: '53B78E1D-F3C2-49C6-89D3-6BE30961C14D'
${1:"${2}"} -> ${3:"${4}"}
TXT

  tab '<-', 'left arrow', <<-'TXT', uuid: '20512DA9-649C-420F-A0E1-F7DD04A349EE'
${1:"${2}"} <- ${3:"${4}"}
TXT

  tab 'c', 'shortcut - class', <<-'TXT', uuid: 'EEB7E161-EF45-410A-91CD-7C74F94449A4'
class
TXT

  tab 'case', 'case', <<-'TXT', uuid: 'C32C1AFB-F874-454E-8C82-86832CA296FD'
case ${1:_} => ${0}
TXT

  tab 'case class', 'case class', <<-'TXT', uuid: '493A836C-428D-4CA5-9E29-E2C927C8B642'
case class ${1:${TM_FILENAME/(.*)\.scala/$1/}}${2:($3)} ${4:extends ${5:Any} }{
	$0
}
TXT

  tab 'cc', 'shortcut - case class', <<-'TXT', uuid: '909A1E64-9672-4FC1-87B3-608A57257E5D'
case class
TXT

  tab 'ccc', 'case class scaffolding', <<-'TXT', uuid: 'CC643A92-5A38-4998-AB95-041EAF15ECF9'
class ${1:Class}(${2/(\S+\s*:)/val $1/g}) {
  override def hashCode = 0 ${2/(\S+)\s*:[^,]+(,?)/+ $1.##/g}
  override def equals(other: Any) = $1.unapply(this) == $1.unapply(other)
  override def canEqual(other: Any) = other.isInstanceOf[$1]
}

object $1 {
  def apply(${2:arguments}): $1 = new $1(${2/(\S+)\s*:[^,]+/$1/g})
  def unapply(other: Any) = other match {
    case x: $1 => import x._ ; Some(${2/(\S+)\s*:[^,]+/$1/g})
    case _     => None
  }
}

TXT

  tab 'class', 'class', <<-'TXT', uuid: 'E79DCC79-E834-4B6C-8280-EBE0B9A0A41F'
class ${1:${TM_FILENAME/(.*)\.scala/$1/}}${2:($3)} ${4:extends ${5:Any} }{
	$0
}
TXT

  tab 'def', 'method', <<-'TXT', uuid: 'D03DC03A-8622-4F4F-BDAC-3AD1E8D51705'
def ${1:method}${2:(${4:arg}: ${5:Type})} = {
	${0}
}
TXT

  tab 'enum', 'shortcut - enumeration', <<-'TXT', uuid: 'FFD2A2D6-000C-4AD6-BA36-A1ACD05A392B'
enumeration
TXT

  tab 'enumeration', 'enumeration', <<-'TXT', uuid: '0097F60C-0AAC-4CC0-8815-C6BA0E77606F'
object ${1:MyEnumeration} extends Enumeration {
  type $1 = Value
  val ${2:${3:MyEnumeration1}, ${4:MyEnumeration2}} = Value
}

${5:import $1._}
${0}
TXT

  tab 'for', 'for - Block', <<-'TXT', uuid: 'ADF7CCBE-80DD-488E-A2A9-B3B8B582F69F'
for( $1 <- ${2:${3:0} to ${4:10}}) {
	$0
}
TXT

  tab 'for', 'for - Yield', <<-'TXT', uuid: 'E0E52BED-94DD-4D9F-8ED5-BEE344AB3FDC'
for( $1 <- ${2:${3:0} to ${4:10}}) yield $0
TXT

  tab 'if', 'if', <<-'TXT', uuid: '9D749173-9874-4BEC-80A1-BAE8AF266AD9'
if($1){
$2
}

TXT

  tab 'impc', 'import mutable/immutable', <<-'TXT', uuid: 'F38BFF4F-BE1D-4CE2-8BE8-8BEDF5EB7277', file: 'import mutable immutable'
import scala.collection.{ mutable, immutable, generic }
TXT

  tab 'lam', 'lambda', <<-'TXT', uuid: '92B4042E-2409-466F-A0B6-80A46B36679F', bundle_uuid: '452017E8-0065-49EF-AB9D-7849B27D9367'
($1) => ${2:{${3:}\}}
TXT

  tab 'm', 'shortcut - match', <<-'TXT', uuid: '7BE0DE43-86F5-48C6-A8DF-A7AC891A68EE'
match
TXT

  tab 'main', 'main', <<-'TXT', uuid: '6CCA6D38-8C03-4D29-97BD-45CED52713FB'
def main(args: Array[String]): Unit = {
  $1
}

TXT

  tab 'match', 'match', <<-'TXT', uuid: '6851152B-CD07-4E27-9932-631A86102B5C'
match {
	case ${1:_} => $0
}

TXT

  tab 'obj', 'shortcut - object', <<-'TXT', uuid: 'CEAD5E83-C0D9-4D3D-9E73-C37634DD410D'
object
TXT

  tab 'object', 'object', <<-'TXT', uuid: '97CB4393-6DCC-45B4-8830-61D6B5D036B2'
object ${1:${TM_FILENAME/(.*)\.scala/$1/}} ${2:extends ${3:Any} }{
	$0
}
TXT

  tab 'omain', 'object with main method', <<-'TXT', uuid: '853C1915-7B23-4C79-AAAA-AEDFB21CA08C', bundle_uuid: '452017E8-0065-49EF-AB9D-7849B27D9367'
object ${1:${TM_FILENAME/(.*)\.scala/$1/}} {
  def main(args: Array[String]): Unit = {
    $2
  }
}

TXT

  tab 'script', 'script header', <<-'TXT', uuid: '11D5086B-FD25-4B33-92E3-4DEADCF4119D'
#!/bin/sh
  exec scala "\$0" "\$@"
!#

$1
TXT

  tab 't', 'shortcut - trait', <<-'TXT', uuid: '1D85F938-738B-42DD-9206-A4D250B744DD'
trait
TXT

  tab 'tostr', 'toString', "override def toString(): String =  $0 \n", uuid: 'E3CAD7C5-59B2-4CD2-9D9F-5D225998E2ED'

  tab 'trait', 'trait', <<-'TXT', uuid: 'BAD79DCF-1B14-42CE-BE6E-7EE5A56190B3'
trait ${1:${TM_FILENAME/(.*)\.scala/$1/}} {
	$0
}
TXT

  tab 'try', 'try/catch', "try { \n  ${1:// ...}\n} catch {\n  case e: Exception => $0\n}", uuid: '833B549D-AA46-4BC9-AC05-CBF4CD1DA723', file: 'try catch'

  tab 'with', 'with', <<-'TXT', uuid: '56D7D5D4-355C-4BAA-8F38-DA5A5FCA33C8'
with ${1:Any}
TXT

end