# encoding: utf-8

snippets do

  default_scope 'source.js'
  file_format :textmate

  tab ':', 'Object key — key: "value"', <<-'TXT', uuid: 'DC8B46FB-8ADA-45EA-8F36-94C807A0D302', key_equivalent: "~:"
${1:key}: ${2:"${3:value}"}${4:, }
TXT

  tab ':f', 'Object Method', <<-'TXT', uuid: '77065D69-742A-4FF0-9A41-AD211DFBE72F'
${1:method_name}: function (${3:attribute}){
	$0
}${10:,}
TXT

  tab 'do', 'do', <<-'TXT', uuid: '0FF6F54D-AFE0-4FC5-9A15-E837A167689C'
do {
	${2:$TM_SELECTED_TEXT}
} while (${1:true});
TXT

  tab 'else', 'else', <<-'TXT', uuid: '5BA406DB-A4B1-4CED-BA61-33D378FD7F53'
else {
	${1:$TM_SELECTED_TEXT}
}
TXT

  tab 'f', 'Anonymous Function', <<-'TXT', uuid: '4C6EDB43-3E2E-411B-A016-13C135C59833', file: 'function'
function ($1) {
	${0:$TM_SELECTED_TEXT}
}
TXT

  tab 'for', 'for (…) {…}', <<-'TXT', uuid: '011C4681-FBEC-4891-9326-3DECFCDED6D6'
for (${2:var }${20:i} = 0; ${20:i} < ${1:Things}.length; ${20:i}++) {
	${100:${1:Things}[${20:i}]}
}
TXT

  tab 'for', 'for (…) {…} (Improved Native For-Loop)', <<-'TXT', uuid: 'C207B7C3-5597-4873-8AAD-C46FB8842AF2', file: 'for (…) {…} (faster)'
for (${2:var }${20:i} = ${1:Things}.length - 1; ${20:i} >= 0; ${20:i}--) {
	${100:${1:Things}[${20:i}]}
}
TXT

  tab 'forin', 'for … in', <<-'TXT', uuid: '3AFF0ECE-A475-4CFB-832B-EE551D90B8E5'
for (${1:variable} in ${2:object}) {
	${3:if (${2:object}.hasOwnProperty(${1:variable})) {
		${4:$TM_SELECTED_TEXT}
	\}}
}
TXT

  tab 'fun', 'Function', <<-'TXT', uuid: 'F0E4FB6A-4878-48C6-A777-62438DF1E14F', file: 'function (fun)'
function ${1:function_name}(${2:argument}) {
	${0:// body...}
}
TXT

  tab 'get', 'getElementById', <<-'TXT', uuid: 'B2225C2E-59BD-4AD5-9554-755A9864D7F1'
getElementById(${1:'${2:id}'})
TXT

  tab 'get', 'getElementsByClassName', <<-'TXT', uuid: '923442DA-69C2-4681-B57D-510BB1312E9E'
getElementsByClassName(${1:'${2:className}'})
TXT

  tab 'get', 'getElementsByName', <<-'TXT', uuid: '0701FB35-5C3C-453D-9ADE-8A0B7D1E617E'
getElementsByName(${1:'${2:name}'})
TXT

  tab 'get', 'getElementsByTagName', <<-'TXT', uuid: 'C4CA6356-DBC9-4F0D-AA9B-8577692DEBB2'
getElementsByTagName(${1:'${2:tagName}'})
TXT

  tab 'if', 'if', <<-'TXT', uuid: 'F19F3732-39A7-48EC-A72B-A8F477A01795'
if (${1:true}) {
	${2:$TM_SELECTED_TEXT}
}
TXT

  tab 'ife', 'if … else', <<-'TXT', uuid: '31964029-9D71-4ADC-8213-DFE5C4E222B3', file: 'if ... else'
if (${1:true}) {
	${2:$TM_SELECTED_TEXT}
} else {
	$3
}
TXT

  tab 'interval', 'setInterval function', <<-'TXT', uuid: '3A00B409-6E94-4E27-8050-45F04EB9765A'
setInterval(${2:function () {
	${3:$TM_SELECTED_TEXT}
\}}, ${1:10});
TXT

  tab 'proto', 'Prototype', <<-'TXT', uuid: '2F96136B-0193-42F5-90FC-B6F456A3AD77', file: 'Prototype (proto)'
${1:class_name}.prototype.${2:method_name} = function (${3:first_argument}) {
	${0:// body...}
};
TXT

  tab 'switch', 'switch', <<-'TXT', uuid: '13386ECB-2A5C-4881-9D54-035BC8B0A4A1'
switch (${1:expression}) {
case ${2:expression}:
	$4
	break;$5
default:
	${3:$TM_SELECTED_TEXT}
}
TXT

  tab 'timeout', 'setTimeout function', <<-'TXT', uuid: '009A3E6C-FE3F-4A18-8759-2DC31F17BBE2'
setTimeout(${2:function () {
	${3:$TM_SELECTED_TEXT}
\}}, ${1:10});
TXT

  tab 'try', 'try', <<-'TXT', uuid: '4B1F658D-CB1C-4D10-968D-A443F8597C28'
try {
	${1:statements}
} catch (${2:variable}) {
	${3:statements}
}${4: finally {
	${5:statements}
\}}
TXT

  tab 'while', 'while', <<-'TXT', uuid: '009514ED-12AE-440F-811E-CD7D41368DBF'
while (${1:true}) {
	${2:$TM_SELECTED_TEXT}
}
TXT

end