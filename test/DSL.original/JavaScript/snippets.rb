# encoding: utf-8

snippets do

  default_scope 'source.js'

  tab ':', 'Object key — key: "value"', <<-'TXT', file: 'Object-key-key-value'
${1:key}: ${2:"${3:value}"}${4:, }
TXT

  tab ':,', 'Object Value JS', <<-'TXT', file: 'Object-Value-JS'
${1:value_name}:${0:value},
TXT

  tab ':f', 'Object Method', <<-'TXT', file: 'Object-Method'
${1:method_name}: function(${3:attribute}){
	$0
}${10:,}
TXT

  tab 'f', 'Anonymous Function', <<-'TXT', file: 'function'
function($1) {${0:$TM_SELECTED_TEXT}};
TXT

  tab 'for', 'for (…) {…}', <<-'TXT', file: 'for-()-{}'
for (var ${20:i} = 0; ${20:i} < ${1:Things}.length; ${20:i}++) {
	${100:${1:Things}[${20:i}]}$0
};
TXT

  tab 'for', 'for (…) {…} (Improved Native For-Loop)', <<-'TXT', file: 'for-()-{}-(faster)'
for (var ${20:i} = ${1:Things}.length - 1; ${20:i} >= 0; ${20:i}--) {
	${100:${1:Things}[${20:i}]}$0
};
TXT

  tab 'fun', 'Function', <<-'TXT', file: 'function-(fun)'
function ${1:function_name} (${2:argument}) {
	${0:// body...}
}
TXT

  tab 'get', 'Get Elements', <<-'TXT', file: 'Get-Elements'
getElement${1/(T)|.*/(?1:s)/}By${1:T}${1/(T)|(I)|.*/(?1:agName)(?2:d)/}('$2')
TXT

  tab 'if', 'if', <<-'TXT'
if (${1:true}) {${0:$TM_SELECTED_TEXT}};
TXT

  tab 'ife', 'if … else', <<-'TXT', file: 'if-___-else'
if (${1:true}) {${0:$TM_SELECTED_TEXT}} else{};
TXT

  tab 'proto', 'Prototype', <<-'TXT', file: 'Prototype-(proto)'
${1:class_name}.prototype.${2:method_name} = function(${3:first_argument}) {
	${0:// body...}
};

TXT

  tab 'timeout', 'setTimeout function', <<-'TXT', file: 'setTimeout-function'
setTimeout(function() {$0}${2:}, ${1:10});
TXT

end