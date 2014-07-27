# encoding: utf-8

snippets do

  default_scope 'source.c, source.objc, source.c++, source.objc++'

  tab 'beginend', '$1.begin(), $1.end()', <<-'TXT', scope: 'source.c++, source.objc++', file: '$1.begin()-$1.end()-(beginend)'
${1:v}${1/^.*?(-)?(>)?$/(?2::(?1:>:.))/}begin(), ${1:v}${1/^.*?(-)?(>)?$/(?2::(?1:>:.))/}end()
TXT

  tab 'class', 'Class', <<-'TXT', scope: 'source.c++, source.objc++', file: 'class-..-(class)'
class ${1:${TM_FILENAME/(.+)\..+|.*/$1/:name}}
{
public:
	${1/(\w+).*/$1/}(${2:arguments});
	~${1/(\w+).*/$1/}();

	${0:/* data */}
};
TXT

  tab 'def', '#ifndef … #define … #endif', <<-'TXT', scope: 'source.c, source.c++, source.objc, source.objc++', file: '#ifndef-#define-#endif'
#ifndef ${1/([A-Za-z0-9_]+).*/$1/}
#define ${1:SYMBOL} ${2:value}
#endif
TXT

  tab 'do', 'Do While Loop', <<-'TXT', file: 'do...while-loop-(do)'
do
{
	${0:/* code */}
} while (${1:/* condition */});
TXT

  tab 'enum', 'Enumeration', <<-'TXT', scope: 'source.c++, source.objc++'
enum ${1:name} { $0 };
TXT

  tab 'for', 'For Loop', <<-'TXT', file: '030-for-int-loop-(fori)'
for (int ${2:i} = 0; $2 < ${1:count}; ${3:++$2})
{
	${0:/* code */}
}
TXT

  tab 'forv', 'Vector For Loop', <<-'TXT', file: 'forv'
for (std::vector<$1>::iterator ${3:i} = $2.begin(); $3 != $2.end(); ++$3)
{
	$0
}
TXT

  tab 'fprintf', 'fprintf …', <<-'TXT', file: 'fprintf'
fprintf(${1:stderr}, "${2:%s}\\n"${2/([^%]|%%)*(%.)?.*/(?2:, :\);)/}$3${2/([^%]|%%)*(%.)?.*/(?2:\);)/}
TXT

  tab 'if', 'If Condition', <<-'TXT', file: 'if-..-(if)'
if (${1:/* condition */})
{
	${0:/* code */}
}
TXT

  tab 'inc', '#include "…"', <<-'TXT', file: '#include-(inc)'
#include "${1:${TM_FILENAME/\..+$/.h/}}"
TXT

  tab 'Inc', '#include <…>', <<-'TXT', file: '#include-(inc angle)'
#include <${1:.h}>
TXT

  tab 'main', 'main()', <<-'TXT', file: '010-main()-(main)'
int main(int argc, char const${TM_C_POINTER: *}argv[])
{
	${0:/* code */}
	return 0;
}
TXT

  tab 'map', 'std::map', <<-'TXT', scope: 'source.c++, source.objc++', file: 'std-map-(map)'
std::map<${1:key}, ${2:value}> map$0;
TXT

  tab 'ns', 'Namespace', <<-'TXT', scope: 'source.c++, source.objc++', file: 'namespace-..-(namespace)'
namespace${1/.+/ /m}${1:${TM_FILENAME/^((.*?)\..*)?$/$2/:mine}}
{
	$0
}

TXT

  tab 'printf', 'printf …', <<-'TXT', file: 'printf-..-(printf)'
printf("${1:%s}\\n"${1/([^%]|%%)*(%.)?.*/(?2:, :\);)/}$2${1/([^%]|%%)*(%.)?.*/(?2:\);)/}
TXT

  tab 'readfile', 'Read File Into Vector', <<-'TXT', scope: 'source.c++, source.objc++', file: 'read-file-(readF)'
std::vector<char> v;
if (FILE${TM_C_POINTER: *}fp = fopen(${1:"filename"}, "r"))
{
	char buf[1024];
	while (size_t len = fread(buf, 1, sizeof(buf), fp))
		v.insert(v.end(), buf, buf + len);
	fclose(fp);
}
TXT

  tab 'struct', 'Struct', <<-'TXT', file: 'struct'
struct ${1:${TM_FILENAME/(.+)\..+|.*/$/:name}}
{
	${0:/* data */}
};
TXT

  tab 'td', 'Typedef', <<-'TXT'
typedef ${1:int} ${2:MyCustomType};
TXT

  tab 'tp', 'template <typename ${1:_InputIter}>', <<-'TXT', scope: 'source.c++, source.objc++', file: 'template-typename-..-(template)'
template <typename ${1:_InputIter}>
TXT

  tab 'vector', 'std::vector', <<-'TXT', scope: 'source.c++, source.objc++', file: 'std-vector-(v)'
std::vector<${1:char}> v$0;
TXT

end