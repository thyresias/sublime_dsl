# encoding: utf-8

snippets do

  default_scope 'source.php'
  file_format :textmate

  tab '/*!', '/*! … */', <<-'TXT', scope: 'source.c, source.objc, source.c++, source.objc++', uuid: '97624253-06BA-4D4E-AFD8-EFC24E4710A7', file: 'Block Comment (with Doxygen)'
/*!
 * $0
 */
TXT

  tab '/**', '/** … */', <<-'TXT', scope: 'source.c, source.objc, source.c++, source.objc++', uuid: '3F9A5A64-0E7B-4DD5-B683-9ADB93A13B81', file: 'Block Comment (with Doxygen2)'
/**
 * $0
**/
TXT

  tab 'dxc', 'Class', "/** \\brief  ${3:undocumented class}\n\n\t${4:undocumented class}\n\n© Copyright `date +%Y` $TM_ORGANIZATION_NAME - ${TM_AUTHOR:$TM_FULLNAME}. All Rights Reserved.\n\n\t\\author ${TM_AUTHOR:$TM_FULLNAME} $TM_ORGANIZATION_NAME\n\t\\author \\$LastChangedBy\\$\n\t\\date `date +%Y-%m-%d`\n\t\\date \\$LastChangedDate\\$\n\t\\version \\$Rev\\$\n\t\\sa\n**/\n$1class $2 {\n\t$5var \\$${6:var}; //!< ${7:undocumented class variable}\n\n\t/** \n\t\\brief class $2 constructor\n\n\t\\author ${TM_AUTHOR:$TM_FULLNAME} $TM_ORGANIZATION_NAME\n\t\\date `date +%Y-%m-%d`\n\t\\param $8 ${9:description of parameter}\n\n\t\\return\n\t\\sa\n\t**/\n\t$1function $2 ($8) {$0\n\t} // END $1function $2\n\n\n} // END $1class $2\n\n", uuid: '7DD602B8-C3E0-11D9-BDD3-001124776DD2', file: 'Doxygen class'

  tab 'dxc', 'Class', <<-'TXT', scope: 'source.objc, source.objc++, source.c, source.c++', uuid: '6206D909-7D5B-4401-966F-7B5077944D92', file: 'Class (dxc) Cocoa'
/** \brief  ${3:undocumented class}

	${4:undocumented class}

© Copyright `date +%Y` $TM_ORGANIZATION_NAME - ${TM_AUTHOR:$TM_FULLNAME}. All Rights Reserved.

	\author ${TM_AUTHOR:$TM_FULLNAME} $TM_ORGANIZATION_NAME
	\author \$LastChangedBy\$
	\date `date +%Y-%m-%d`
	\date \$LastChangedDate\$
	\version \$Rev\$	\sa
**/
TXT

  tab 'dxc', 'Class PHP doc only', <<-'TXT', uuid: 'F51C9A24-33F8-4A8E-AC3F-1B80CA0D8B34'
/** \brief  ${3:undocumented class}

	${4:undocumented class}

&copy; Copyright `date +%Y` `echo $TM_ORGANIZATION_NAME` - `echo $TM_AUTHOR`. All Rights Reserved.

	\\author `echo $TM_AUTHOR` `echo $TM_ORGANIZATION_NAME`
	\\author \$LastChangedBy\$
	\\date `TZ=GMT date +%Y-%m-%d # T%H:%M:%SZ`
	\\date \$LastChangedDate\$
	\\version \$Rev\$
	\sa
**/

TXT

  tab 'dxf', 'Function', <<-'TXT', uuid: '65ECD57C-C3E1-11D9-BDD3-001124776DD2', file: 'Doxygen function'
/** \brief ${4:undocumented function}
	${5:
		longer description
	}
	\author ${TM_AUTHOR:$TM_FULLNAME} $TM_ORGANIZATION_NAME
	\date `date +%Y-%m-%d`
	\param $2 ${3:description of parameter}

	\return ${6:description of return value}
	\sa
**/
function $1 (\$$2) {
	$0
} // END function $1


TXT

  tab 'dxf', 'Function', <<-'TXT', scope: 'source.objc, source.objc++, source.c, source.c++', uuid: '9F7C8A36-D569-4A7A-BCB6-2CC0220E493B', file: 'Function (dxf) Cocoa'
/** \brief ${4:undocumented function}
	${5:
		longer description
	}
	\author ${TM_AUTHOR:$TM_FULLNAME} $TM_ORGANIZATION_NAME
	\date `date +%Y-%m-%d`
	\param $2 ${3:description of parameter}
	${7:\param $8 ${9:description of parameter}}$0
	\return ${6:description of return value}
	\sa
**/
TXT

  tab 'dxg', 'Group', <<-'TXT', uuid: 'AFBF18F0-705E-4598-9F56-B494819DFA63', file: 'Group (dxg)'
/** \name ${1:nameOfGroup} ${2
${3:description}
}**/
//@{
$TM_SELECTED_TEXT
//@}
TXT

  tab 'dxp', 'Page', <<-'TXT', scope: 'source.objc, source.objc++, source.c, source.c++', uuid: '6C21C945-F9D4-412B-A431-29FEFCB4A991', file: 'Page (dxp) Cocoa'
/** \page $TM_FILEPATH ${1:A documentation page}
	${2:longer description}

© Copyright `date +%Y` $TM_ORGANIZATION_NAME - ${TM_AUTHOR:$TM_FULLNAME}. All Rights Reserved.
	\author ${TM_AUTHOR:$TM_FULLNAME} $TM_ORGANIZATION_NAME
	\author \$LastChangedBy\$
	\date `date +%Y-%m-%d`
	\date \$LastChangedDate\$
	\version \$Rev\$
**/
TXT

  tab 'dxp', 'Page', <<-'TXT', uuid: '2E015C16-C3E7-11D9-BDD3-001124776DD2', file: 'Doxygen page'
/** \page ${1:fileName A documentation page}
	${2:longer description}

© Copyright `date +%Y` $TM_ORGANIZATION_NAME - ${TM_AUTHOR:$TM_FULLNAME}. All Rights Reserved.
	\author ${TM_AUTHOR:$TM_FULLNAME} $TM_ORGANIZATION_NAME
	\author \$LastChangedBy\$
	\date `date +%Y-%m-%d`
	\date \$LastChangedDate\$
	\version \$Rev\$
**/
TXT

  tab 'dxp', 'Page Template', <<-'TXT', scope: 'text.html.basic', uuid: '31C69848-30D5-4EDA-BEFE-9F9223A674B9', file: 'Page (dxp) PHP Template'
<?php
/** \page $TM_FILEPATH ${1:A documentation page}
	${2:longer description}
© Copyright `date +%Y` $TM_ORGANIZATION_NAME - ${TM_AUTHOR:$TM_FULLNAME}. All Rights Reserved.
	\author ${TM_AUTHOR:$TM_FULLNAME} $TM_ORGANIZATION_NAME
	\author \$LastChangedBy\$
	\date `date +%Y-%m-%d`
	\date \$LastChangedDate\$
	\version \$Rev\$
**/
?>
TXT

  tab 'dxpr', 'Private Section', <<-'TXT', uuid: 'D85FE1CC-C3E3-11D9-BDD3-001124776DD2', file: 'Doxygen Private Section'
/*! \privatesection */
TXT

  tab 'dxpu', 'Public Section', <<-'TXT', uuid: '3401EFAC-C3E4-11D9-BDD3-001124776DD2', file: 'Doxygen Public Section'
/*! \publicsection */
TXT

  tab 'dxv', 'Class Variable', <<-'TXT', scope: 'source.objc, source.objc++, source.c, source.c++', uuid: '4FA08FFD-F89D-4782-8C69-C7D462BA6350', file: 'Class variable (dxv) Cocoa'
${1:${2:TypeDef}	${3:VarNameCamelCase}${4: = ${5:defaultValue}};}	//!< ${6:undocumented class variable}
TXT

  tab 'dxv', 'Class Variable', <<-'TXT', uuid: '04B1865F-C3E2-11D9-BDD3-001124776DD2', file: 'Doxygen class variable'
${1:var} ${2:var}; //!< ${3:undocumented class variable}

TXT

end