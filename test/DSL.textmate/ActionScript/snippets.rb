# encoding: utf-8

snippets do

  default_scope 'source.actionscript.2'
  file_format :textmate

  tab 'bn', 'printAsBitmapNum', <<-'TXT', uuid: '85FFD5E8-7514-11D9-8FBA-00039398C572', file: 'AS printAsBitmapNum'
printAsBitmapNum( ${1:level}, ${2:type} );
TXT

  tab 'br', 'break', <<-'TXT', uuid: '44BC590D-7519-11D9-8FBA-00039398C572', file: 'AS break'
break;
TXT

  tab 'ca', 'call', <<-'TXT', uuid: '70769C60-7519-11D9-8FBA-00039398C572', file: 'AS call'
call(${1:frame});
TXT

  tab 'ce', 'case', <<-'TXT', uuid: 'A6393F42-7519-11D9-8FBA-00039398C572', file: 'AS case'
case ${1:expression} :
	${1:statement}
TXT

  tab 'ch', 'catch', <<-'TXT', uuid: '2000A22C-751A-11D9-8FBA-00039398C572', file: 'AS catch'
catch ($1) {
	$2
}
TXT

  tab 'class', 'class', <<-'TXT', uuid: 'D043AB42-266B-4715-A396-E6ECAF1F4BC0'
class ${1:ClassName} {
	var _${2/\u/_/g};
	function $1($2){
		_${2/:(.*)//g} = ${2/:(.*)//g};$0
	}
}
TXT

  tab 'co', 'continue', <<-'TXT', uuid: '64B17B26-751A-11D9-8FBA-00039398C572', file: 'AS continue'
continue;
TXT

  tab 'de', 'delete', <<-'TXT', uuid: 'B992B881-751A-11D9-8FBA-00039398C572', file: 'AS delete'
delete $1;
TXT

  tab 'dm', 'duplicateMovieClip', <<-'TXT', uuid: '36131CFC-751B-11D9-8FBA-00039398C572', file: 'AS duplicateMovieClip'
duplicateMovieClip(${1:target}, ${2:newName}, ${3:depth});
TXT

  tab 'do', 'do while', <<-'TXT', uuid: 'E33B1F84-751A-11D9-8FBA-00039398C572', file: 'AS do while'
do {
	$1
} while (${2:condition});
TXT

  tab 'dr', 'startDrag', <<-'TXT', uuid: 'CD7E2978-7515-11D9-8FBA-00039398C572', file: 'AS startDrag'
startDrag(${1:target}, ${2:lockcenter}, ${3:l}, ${4:t}, ${5:r}, ${6:b} );
TXT

  tab 'dt', 'default', <<-'TXT', uuid: '973392D6-751A-11D9-8FBA-00039398C572', file: 'AS default'
default :
	${1:statement}
TXT

  tab 'ec', '#endinitclip', <<-'TXT', uuid: '0C5DEEE1-7519-11D9-8FBA-00039398C572', file: 'AS #endinitclip'
#endinitclip
TXT

  tab 'ei', 'else if', <<-'TXT', uuid: 'DA29D86A-7470-11D9-A57F-00039398C572', file: 'AS else if'
else if ($1) {
	$2
}
TXT

  tab 'fi', 'for in', <<-'TXT', uuid: '72B20E8C-73B9-11D9-AB6F-00039398C572', file: 'AS for in', key_equivalent: ""
for ( var $1 in $2 ){
	$3
};
TXT

  tab 'fn', 'function', <<-'TXT', uuid: '5D7F2CAD-7470-11D9-A57F-00039398C572', file: 'AS function'
function $1($2):$3{
	$4
};
TXT

  tab 'fr', 'for', <<-'TXT', uuid: '2E9CED27-73B9-11D9-AB6F-00039398C572', file: 'AS for'
for ( var $1=0; $1<$3.length; $1++ ) {
	$4
};
TXT

  tab 'fs', 'fscommand', <<-'TXT', uuid: 'F73356F0-751B-11D9-8FBA-00039398C572', file: 'AS fscommand'
fscommand(${1:command}, ${2:paramaters});
TXT

  tab 'fy', 'finally', <<-'TXT', uuid: 'B7F97AE6-751B-11D9-8FBA-00039398C572', file: 'AS finally'
finally {
	$1
}

TXT

  tab 'gp', 'gotoAndPlay', <<-'TXT', uuid: '56F3E526-751C-11D9-8FBA-00039398C572', file: 'AS gotoAndPlay'
gotoAndPlay($1);
TXT

  tab 'gs', 'gotoAndStop', <<-'TXT', uuid: '7B1F3905-751C-11D9-8FBA-00039398C572', file: 'AS gotoAndStop'
gotoAndStop($1);
TXT

  tab 'gu', 'getURL', <<-'TXT', uuid: '4EA797BD-73B9-11D9-AB6F-00039398C572', file: 'AS getURL'
getURL($1);
TXT

  tab 'ic', '#initclip', <<-'TXT', uuid: '21C84811-7519-11D9-8FBA-00039398C572', file: 'AS #initclip'
#initclip
TXT

  tab 'if', 'if', <<-'TXT', uuid: 'AE8313A6-7470-11D9-A57F-00039398C572', file: 'AS if'
if ($1) {
	$2
}
TXT

  tab 'il', 'ifFrameLoaded', <<-'TXT', uuid: 'E28E791F-751C-11D9-8FBA-00039398C572', file: 'AS ifFrameLoaded'
ifFrameLoaded ($1) {
	$2
}
TXT

  tab 'in', '#include', <<-'TXT', uuid: '23DD540E-7510-11D9-8FBA-00039398C572', file: 'AS #include'
#include "$1"
TXT

  tab 'ip', 'import', <<-'TXT', uuid: '094EBAC4-751D-11D9-8FBA-00039398C572', file: 'AS import'
import $1;
TXT

  tab 'it', 'interface', <<-'TXT', uuid: '4E29BBBF-751D-11D9-8FBA-00039398C572', file: 'AS interface'
interface $1 {
	$2
}
TXT

  tab 'lm', 'loadMovie', <<-'TXT', uuid: '76704C1D-7511-11D9-8FBA-00039398C572', file: 'AS loadMovie'
loadMovie( ${1:url}, ${2:target}, ${3:method});

TXT

  tab 'ln', 'loadMovieNum', <<-'TXT', uuid: 'A1883062-7511-11D9-8FBA-00039398C572', file: 'AS loadMovieNum'
loadMovieNum( ${1:url}, ${2:level}, ${3:method});

TXT

  tab 'lv', 'loadVariables', <<-'TXT', uuid: 'B9F7DEE8-7510-11D9-8FBA-00039398C572', file: 'AS loadVariables'
loadVariables( ${1:url}, ${2:target}, ${3:method});
TXT

  tab 'mc', 'MovieClip', <<-'TXT', uuid: '307F623F-7471-11D9-A57F-00039398C572', file: 'AS MovieClip'
MovieClip
TXT

  tab 'nf', 'nextFrame', <<-'TXT', uuid: '558A0016-7512-11D9-8FBA-00039398C572', file: 'AS nextFrame'
nextFrame();

TXT

  tab 'ns', 'nextScene', <<-'TXT', uuid: '67AA0D8E-7512-11D9-8FBA-00039398C572', file: 'AS nextScene'
nextScene();
TXT

  tab 'oc', 'onClipEvent', <<-'TXT', uuid: '06CE0036-7513-11D9-8FBA-00039398C572', file: 'AS onClipEvent'
onClipEvent ($1) {
	$2
};
TXT

  tab 'on', 'on', <<-'TXT', uuid: '9FDEFABC-7512-11D9-8FBA-00039398C572', file: 'AS on'
on ($1) {
	$2
};

TXT

  tab 'pb', 'printAsBitmap', <<-'TXT', uuid: '683E6744-7514-11D9-8FBA-00039398C572', file: 'AS printAsBitmap'
printAsBitmap( ${1:target}, ${2:type} );
TXT

  tab 'pf', 'prevFrame', <<-'TXT', uuid: '7D6378F2-7513-11D9-8FBA-00039398C572', file: 'AS prevFrame'
prevFrame();
TXT

  tab 'pl', 'play', <<-'TXT', uuid: '589F8A54-7513-11D9-8FBA-00039398C572', file: 'AS play'
play();
TXT

  tab 'pn', 'printNum', <<-'TXT', uuid: 'AC480BBC-7514-11D9-8FBA-00039398C572', file: 'AS printNum'
printNum( ${1:level}, ${2:type} );
TXT

  tab 'pr', 'print', <<-'TXT', uuid: 'B1158E02-7513-11D9-8FBA-00039398C572', file: 'AS print'
print( ${1:target}, ${2:type} );
TXT

  tab 'ps', 'prevScene', <<-'TXT', uuid: 'A027F0B4-7513-11D9-8FBA-00039398C572', file: 'AS prevScene'
prevScene();

TXT

  tab 'rm', 'removeMovieClip', <<-'TXT', uuid: 'D7834C5E-7514-11D9-8FBA-00039398C572', file: 'AS removeMovieClip'
removeMovieClip( ${1:target} );
TXT

  tab 'rt', 'return', <<-'TXT', uuid: '1D654101-7515-11D9-8FBA-00039398C572', file: 'AS return'
return $1;
TXT

  tab 'sd', 'stopDrag', <<-'TXT', uuid: '8580458B-7516-11D9-8FBA-00039398C572', file: 'AS stopDrag'
stopDrag();
TXT

  tab 'sp', 'setProperty', <<-'TXT', uuid: '701021D6-7515-11D9-8FBA-00039398C572', file: 'AS setProperty'
setProperty( ${1:target}, ${2:property}, ${3:value} );
TXT

  tab 'ss', 'stopAllSounds', <<-'TXT', uuid: '5194C7AD-7516-11D9-8FBA-00039398C572', file: 'AS stopAllSounds'
stopAllSounds();
TXT

  tab 'st', 'stop', <<-'TXT', uuid: '34A7BE78-7516-11D9-8FBA-00039398C572', file: 'AS stop'
stop();
TXT

  tab 'sv', 'setVariable', <<-'TXT', uuid: '439EC92E-7515-11D9-8FBA-00039398C572', file: 'AS setVariable'
set( ${1:name}, ${2:value} );
TXT

  tab 'sw', 'switch', <<-'TXT', uuid: 'A94C60C1-7516-11D9-8FBA-00039398C572', file: 'AS switch'
switch ( ${1:condition} ) {
	$2
}
TXT

  tab 'th', 'throw', <<-'TXT', uuid: '1AC68ADA-7517-11D9-8FBA-00039398C572', file: 'AS throw'
throw $1;
TXT

  tab 'tq', 'toggleHighQuality', <<-'TXT', uuid: '3B360960-7517-11D9-8FBA-00039398C572', file: 'AS toggleHighQuality'
toggleHighQuality();
TXT

  tab 'tr', 'trace', <<-'TXT', uuid: '67C5D5BE-7517-11D9-8FBA-00039398C572', file: 'AS trace'
trace(${1:"$0"});
TXT

  tab 'tt', 'tellTarget', <<-'TXT', uuid: 'E52E8157-7516-11D9-8FBA-00039398C572', file: 'AS tellTarget'
tellTarget( ${1:target} ) {
	$2
}
TXT

  tab 'ty', 'try', <<-'TXT', uuid: '82E08610-7517-11D9-8FBA-00039398C572', file: 'AS try'
try {
	$1
};
TXT

  tab 'um', 'unloadMovie', <<-'TXT', uuid: '07EDC489-7518-11D9-8FBA-00039398C572', file: 'AS unloadMovie'
unloadMovie(${1:target});
TXT

  tab 'un', 'unloadMovieNum', <<-'TXT', uuid: '541C6BDE-7518-11D9-8FBA-00039398C572', file: 'AS unloadMovieNum'
unloadMovieNum(${1:level});
TXT

  tab 'vn', 'loadVariablesNum', <<-'TXT', uuid: '0DE5AFE6-7512-11D9-8FBA-00039398C572', file: 'AS loadVariablesNum'
loadVariables( ${1:url}, ${2:level}, ${3:method});
TXT

  tab 'vr', 'var', <<-'TXT', uuid: 'A85FD54C-751D-11D9-8FBA-00039398C572', file: 'AS var'
var $1:$2;
TXT

  tab 'wh', 'while', <<-'TXT', uuid: '8E0EEE39-7518-11D9-8FBA-00039398C572', file: 'AS while'
while (${1:condition}) {
	$2
};
TXT

  tab 'wt', 'with', <<-'TXT', uuid: 'C375F7AD-7518-11D9-8FBA-00039398C572', file: 'AS with'
with (${1:target});
	$2
};
TXT

end