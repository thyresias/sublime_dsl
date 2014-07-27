# encoding: utf-8

snippets do

  default_scope 'source.c, source.objc, source.c++, source.objc++'
  file_format :textmate

  key "~@.", '#endif', <<-'TXT', scope: 'source.c, source.c++, source.objc, source.objc++, (source.c | source.c++ | source.objc | source.objc++) & comment.block.preprocessor', uuid: '5039DA0E-538B-48E2-A45A-E5A27787E765'
#endif

TXT

  tab 'beginend', '$1.begin(), $1.end()', <<-'TXT', scope: 'source.c++, source.objc++', uuid: '62D59E1C-1DF1-490E-86E9-DFF8A461AD9C', file: '$1.begin(), $1.end() (beginend)'
${1:v}${1/^.*?(-)?(>)?$/(?2::(?1:>:.))/}begin(), ${1:v}${1/^.*?(-)?(>)?$/(?2::(?1:>:.))/}end()
TXT

  tab 'cl', 'Class', <<-'TXT', scope: 'source.c++, source.objc++', uuid: '523B30D4-C28A-11D9-8CEF-000D93589AF6', file: 'class .. (class)'
class ${1:${TM_FILENAME/(.+)\..+|.*/(?1:\L$1_t:name)/}}
{
public:
	${1/(\w+).*/$1/} (${2:arguments});
	virtual ~${1/(\w+).*/$1/} ();

private:
	${0:/* data */}
};
TXT

  tab 'def', '#ifndef … #define … #endif', <<-'TXT', scope: 'source.c, source.c++, source.objc, source.objc++', uuid: '680358EA-B24B-4662-8DDA-AD42288795E4'
#ifndef ${1/([A-Za-z0-9_]+).*/$1/}
#define ${1:SYMBOL} ${2:value}
#endif
TXT

  tab 'do', 'Do While Loop', <<-'TXT', uuid: 'D1F5A25E-A70F-11D9-A11A-000A95A89C98', file: 'do...while loop (do)'
do {
	${0:/* code */}
} while(${1:/* condition */});
TXT

  tab 'enum', 'Enumeration', <<-'TXT', scope: 'source.c++, source.objc++', uuid: 'DD10B510-1C36-45E0-A378-527401EE55B1'
enum ${1:name} { $0 };
TXT

  tab 'for', 'For Loop', <<-'TXT', uuid: '78EF7134-0859-4475-89C3-30927865E855', file: '030 for int loop (fori)'
for(size_t ${2:i} = 0; $2 < ${1:count}; ${3:++$2})
{
	${0:/* code */}
}
TXT

  tab 'fprintf', 'fprintf …', <<-'TXT', uuid: 'FE378349-BD63-4390-9A3B-516F7FF7F413'
fprintf(${1:stderr}, "${2:%s}\\n"${2/([^%]|%%)*(%.)?.*/(?2:, :\);)/}$3${2/([^%]|%%)*(%.)?.*/(?2:\);)/}
TXT

  tab 'if', 'If Condition', <<-'TXT', uuid: 'F060AC09-C289-11D9-8CEF-000D93589AF6', file: 'if .. (if)'
if(${1:/* condition */})
{
	${0:/* code */}
}
TXT

  tab 'inc', '#include "…"', <<-'TXT', uuid: '9AB31B76-7298-11D9-813A-000D93589AF6', file: '#include ʺʺ (inc)'
#include "${1:${TM_FILENAME/\..+$/.h/}}"
TXT

  tab 'Inc', '#include <…>', <<-'TXT', uuid: 'B10CBD5D-7298-11D9-813A-000D93589AF6', file: '#include ˂˃ (Inc)'
#include <${1:.h}>
TXT

  tab 'main', 'main()', <<-'TXT', uuid: 'BC8B81AB-5F16-11D9-B9C3-000D93589AF6', file: '010 main() (main)'
int main (int argc, char const${TM_C_POINTER: *}argv[])
{
	${0:/* code */}
	return 0;
}
TXT

  tab 'map', 'std::map', <<-'TXT', scope: 'source.c++, source.objc++', uuid: 'A295A902-ACAF-11D9-987D-000D93589AF6', file: 'std˸˸map (map)'
std::map<${1:key}, ${2:value}> map$0;
TXT

  tab 'mark', '#pragma mark', <<-'TXT', uuid: 'ADD104E9-830A-4AC4-AAF4-DB6D3B0B7506', file: '#pragma mark (mark)'
#if 0
${1:#pragma mark -
}#pragma mark $2
#endif

$0
TXT

  tab 'ns', 'Namespace', <<-'TXT', scope: 'source.c++, source.objc++', uuid: 'CEE5F928-47A2-4648-96F0-99FF5C2A7419', file: 'namespace .. (namespace)'
namespace${1/.+/ /m}${1:${TM_FILENAME/^((.*?)\..*)?$/(?1:\L$2:my)/}}
{
	$0
}${1/.+/ \/* /m}$1${1/.+/ *\//m}
TXT

  tab 'once', 'Header Include-Guard', <<-'TXT', uuid: '74AF5E38-994C-4641-96F0-EB98A2183F60', file: 'Include header once only guard'
#ifndef ${1:`#!/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby -wKU -riconv
name = ENV["TM_FILENAME"] || "untitled"
name = Iconv.iconv("ASCII//TRANSLIT", "UTF-8", name).first
name = name.gsub(/[^a-z0-9]+/i, "_")
uuid = (rand * 2821109907455).round.to_s(36)
print "#{name}_#{uuid}".tr("[a-z]", "[A-Z]")
`}
#define $1

${TM_SELECTED_TEXT/\Z\n//}${0:}

#endif /* end of include guard: $1 */

TXT

  tab 'printf', 'printf …', <<-'TXT', uuid: '5A086BE2-BCF6-11D9-82A9-000D93589AF6', file: 'printf .. (printf)'
printf("${1:%s}\\n"${1/([^%]|%%)*(%.)?.*/(?2:, :\);)/}$2${1/([^%]|%%)*(%.)?.*/(?2:\);)/}
TXT

  tab 'readfile', 'Read File Into Vector', <<-'TXT', scope: 'source.c++, source.objc++', uuid: 'E8C3B596-9045-11D9-AB38-000D93589AF6', file: 'read file (readF)'
std::vector<char> v;
if(FILE${TM_C_POINTER: *}fp = fopen(${1:"filename"}, "r"))
{
	char buf[1024];
	while(size_t len = fread(buf, 1, sizeof(buf), fp))
		v.insert(v.end(), buf, buf + len);
	fclose(fp);
}
TXT

  tab 'sp', 'Shared Pointer', <<-'TXT', uuid: '986C0149-7802-4385-A237-90074D9D5ACD'
typedef std::shared_ptr<${2:${1:my_type}_t}> ${3:${2/_t$/_ptr/}};
TXT

  tab 'st', 'Struct', <<-'TXT', uuid: '1D14B92E-8819-11D9-8661-000D93589AF6', file: 'struct'
struct ${1:${TM_FILENAME/(.+)\..+|.*/(?1:\L$1_t:name)/}}
{
	${0:/* data */}
};
TXT

  tab 'str', 'std::string', <<-'TXT', scope: 'source.c++, source.objc++', uuid: 'A5F0BA15-A173-47B4-8C3D-3C128A1316CA'
std::string
TXT

  tab 'td', 'Typedef', <<-'TXT', uuid: '08E16CAE-DBD8-4570-B778-9E0E0EFFF80C'
typedef ${1:int} ${2:MyCustomType};
TXT

  tab 'tp', 'template <typename …>', <<-'TXT', scope: 'source.c++, source.objc++', uuid: 'C5DEE118-4C9E-4F3E-97A4-0E01A250F142', file: 'template ˂typename ..˃ (template)'
template <typename ${1:_InputIter}>
TXT

  tab 'vector', 'std::vector', <<-'TXT', scope: 'source.c++, source.objc++', uuid: '5E468268-ACAF-11D9-987D-000D93589AF6', file: 'std˸˸vector (v)'
std::vector<${1:char}> v$0;
TXT

end