# encoding: utf-8

snippets do

  default_scope 'source.pascal'
  file_format :textmate

  tab 'beg', 'Begin..End (beg)', <<-'TXT', scope: 'source.pascal.vectorscript', uuid: 'DD03758D-9D92-4509-8AFA-C04CF2ACE2EE', file: 'Begin..End'
BEGIN
	$1
END;$2
TXT

  tab 'for', 'For (for)', <<-'TXT', uuid: 'EA22B2C2-F126-4E9A-AFB5-BC8CB9774CC5', file: 'For'
FOR ${1:i} := ${2:1} TO ${3:n} DO BEGIN
	$4
END; { FOR }
TXT

  tab 'func', 'Function (func)', <<-'TXT', uuid: '9CFC03E4-18D6-45DD-8639-6C387ACEA574', file: 'Function'
FUNCTION ${1:Name}${3:(${2:arg1:STRING})}:${4:BOOLEAN};
	BEGIN
		$5
  		$1 := ;
END;$6 { FUNCTION $1 }
TXT

  tab 'getcus', 'GetCustomObjectInfo (getcus)', <<-'TXT', scope: 'source.pascal.vectorscript', uuid: 'F2DC1A1A-906F-4725-B81C-FE49537453A8', file: 'GetCustomObjectInfo (get)'
GetCustomObjectInfo(gObjectName,gObjectHd,gRecHd,gWallHd)
TXT

  tab 'group', 'BeginGroup..EndGroup (group)', <<-'TXT', uuid: '069CE1A9-F3AA-4C70-9847-1041FA86F5C0', file: 'untitled'
BeginGroup;
$1
EndGroup;$2
TXT

  tab 'if', 'If..Then (if)', <<-'TXT', uuid: '1E100F1A-4194-4B34-A99B-D46805CD94EE', file: 'if'
IF ($1) THEN ${3:BEGIN
	$2
END}; { IF }
TXT

  tab 'proc', 'Procedure (proc)', <<-'TXT', uuid: '7188C1B7-6355-474C-BAB2-20D1792B1D64', file: 'Procedure'
PROCEDURE ${1:Name}${2:(${3:arg1:STRING})};
	BEGIN
		$4
END; { PROCEDURE $1 }
$5
TXT

  tab 'push', 'PushAttrs..PopAttrs (push)', <<-'TXT', uuid: 'A03B09F2-8817-4E5B-AD89-AE285D18773D', file: 'PushAttrs'
PushAttrs;
$1
PopAttrs;$2
TXT

  tab 'setr', 'SetRField.. (setr)', <<-'TXT', scope: 'source.pascal.vectorscript', uuid: 'CED2CEA7-33D1-4BE5-9DBC-8BCFA9A65846'
SetRField(gObjectName,gObjectHd,'$1',$2)$0
TXT

end