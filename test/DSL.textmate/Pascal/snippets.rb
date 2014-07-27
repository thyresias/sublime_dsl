# encoding: utf-8

snippets do

  default_scope 'source.pascal'
  file_format :textmate

  key "^\n", 'Newline', <<-'TXT', uuid: '6435405A-6B00-4860-A7EB-AC7D63FF286A'
#13#10
TXT

  tab 'begin', 'begin … end', <<-'TXT', uuid: '8B351BE6-14CC-4C00-85ED-F307942A027F', file: 'begin .. end (begin)'
begin
	$0
end;
TXT

  tab 'class', 'class … end', <<-'TXT', uuid: 'B8D8A919-B1D9-48BE-B19B-E544FF7BD8CC', file: 'class (class)'
T${1:ClassName} = class
	$0
end;
TXT

  tab 'constructor', 'constructor, destructor', <<-'TXT', uuid: 'FAC2C75B-FCE5-4A7E-9B17-63E775BA6B21', file: 'constructor, destructor (constructor)'
constructor Create${1:()};
destructor Destroy; override;$0
TXT

  tab 'for', 'for … end', <<-'TXT', uuid: '0F08A7E4-18E3-4F51-BC7F-5FFC378340AB', file: 'for'
for ${1:i} := ${2:0} to ${3:max} do begin
	$0
end;
TXT

  tab 'if', 'if … end', <<-'TXT', uuid: '79D1758B-ADC2-4421-81E0-A59E13BA9485', file: 'if'
if ${1} then begin
	$0
end;
TXT

  tab 'prop', 'property', <<-'TXT', uuid: '2CB361D7-E167-4B41-A094-07F6BD9FB896', file: 'property (prop)'
property ${1:PropertyName}: ${2:WideString} read ${3:F}${1} write ${4:F}${1};$0
TXT

  tab 'try', 'try … finally', <<-'TXT', uuid: '4FA629B0-2CD2-4833-9C9E-F44EE762A997', file: 'try .. finally (try)'
try
	$0
finally
	$1
end;
TXT

  tab 'unit', 'unit … implementation … end', <<-'TXT', uuid: '72E62411-1227-4115-BC7E-CA3BDBC95B26', file: 'unit (unit)'
unit ${1:unit_name};

interface

uses
	SysUtils${2:, Classes};

implementation

$0

end.
TXT

end