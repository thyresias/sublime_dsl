# encoding: utf-8

snippets do

  default_scope 'source.ada'
  file_format :textmate

  tab 'acc', 'access', "access ", uuid: 'ABD8A792-ED3A-49CF-A057-55F6BCF697C8'

  tab 'ali', 'aliased', "aliased ", uuid: '027DBE64-33F2-46FF-BCFD-AF74048462A0'

  tab 'beg', 'begin … end', <<-'TXT', uuid: 'C58D4CCC-FA03-4E0F-B784-A718A518D6E7', file: 'begin ___ end'
begin
	$0
end;
TXT

  tab 'case', 'case … is … end case;', <<-'TXT', uuid: 'A363AC42-723E-4717-BB5D-72A5CC5CA5C5', file: 'case ___ is ___ end case;'
case $1 is
	$0
end case;
TXT

  tab 'eli', 'elsif … then', <<-'TXT', uuid: '3F30D950-757D-4058-96A9-672E563525F1', file: 'elsif ___ then'
elsif $1 then
	$0
TXT

  tab 'for', 'for … loop … end loop', <<-'TXT', uuid: '7081013B-6D7F-4EDD-B662-69C339109802', file: 'for ___ loop ___ end loop'
for $1 in $2 loop
	$0
end loop;
TXT

  tab 'fun', 'function … end', <<-'TXT', uuid: '94AD4EEB-566B-4A5E-9D4F-F723330593CE', file: 'function ___ end'
function ${1:name} return $2 is
	$3
begin -- $1
	$0
end $1;
TXT

  tab 'if', 'if … end if', <<-'TXT', uuid: 'B93CFE75-1E71-460F-AC89-ECE1F9A7B773', file: 'if ___ end if'
if $1 then
	$0
end if;
TXT

  tab 'loop', 'loop … end loop', <<-'TXT', uuid: 'CCCAC2F0-D146-4043-88E1-8C84633F42B3', file: 'loop ___ end loop'
loop
	$0
end loop;
TXT

  tab 'pac', 'package … end', <<-'TXT', uuid: 'A385AA17-D14C-48B5-BA64-2868ECA68222', file: 'package ___ end'
package ${1:name} is
	$0
end $1;
TXT

  tab 'pbo', 'package body … end', <<-'TXT', uuid: '2AE6872F-0DB4-467F-9BC2-7F0C36FCA650', file: 'package body ___ end'
package body ${1:name} is
	$0
end $1;
TXT

  tab 'pne', 'package … is …', <<-'TXT', uuid: '9724A01C-713E-448C-A180-425FE8520ECF', file: 'package ___ is ___'
package $1 is $0
TXT

  tab 'pro', 'procedure … end', <<-'TXT', uuid: '14543854-D4EC-48E5-8F0B-2663F288DCBE', file: 'procedure ___ end'
procedure ${1:Procedure} is
	$2
begin -- ${1/([a-zA-Z0-9_]*).*$/$1/}
	$0
end ${1/([a-zA-Z0-9_]*).*$/$1/};
TXT

  tab 'rec', 'record … end record', <<-'TXT', uuid: 'DA34BE18-1470-4206-8656-A9E969E42F93', file: 'record ___ end record'
record
	$0
end record;
TXT

  tab 'ret', 'return …;', <<-'TXT', uuid: 'BE6D1472-31AC-40BD-9CF4-A36AD0D12108', file: 'return ___;'
return $1;
TXT

  tab 'ty', 'type … is …', <<-'TXT', uuid: '04FB59C5-E80D-4161-9398-EF89E580DA27', file: 'type ___ is ___'
type $1 is $0
TXT

  tab 'u', 'use …;', <<-'TXT', uuid: '95D1567C-BEF0-4789-8F80-670429412C42', file: 'use ___;'
use $1;
TXT

  tab 'w', 'with …;', <<-'TXT', uuid: '42B4DBB3-0B36-4DC8-B6B6-AC887E281FA1', file: 'with ___;'
with $1;
TXT

  tab 'when', 'when … =>', <<-'TXT', uuid: 'FA29C0B9-8B2C-497A-8625-93CBE65B2FB4', file: 'when ___ =˃'
when $1 =>
	$0
TXT

  tab 'whi', 'while … loop … end loop', <<-'TXT', uuid: '63F613E4-787C-4B6C-9C85-82C9AD1916F3', file: 'while ___ loop ___ end loop'
while $1 loop
	$0
end loop;
TXT

  tab 'wu', 'with …; use …;', <<-'TXT', uuid: 'E5957DD4-D97A-47AB-87E1-267D938259CE', file: 'with ___; use ___;'
with ${1}; use $1;
$0
TXT

end