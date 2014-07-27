# encoding: utf-8

snippets do

  default_scope 'source.css'
  file_format :textmate

  tab '!', '!important CSS', <<-'TXT', uuid: 'EF1F2D38-A71A-4D1D-9B07-B1CBB6D84B81', file: '!important CSS (!)', key_equivalent: ""
${1:!important}
TXT

  tab 'background', 'background-attachment: scroll/fixed', <<-'TXT', uuid: '9E194D74-B73B-4D2B-A89F-51F7468A3E97', file: 'background-attachment˸ scroll˸fixed (background)'
background-attachment: ${1|scroll,fixed|};$0
TXT

  tab 'background', 'background-color: hex', <<-'TXT', uuid: '32B7B151-17CB-4DA4-AC0B-7D02BC606403', file: 'background-color˸  color-hex (background)'
background-color: #${1:DDD};$0
TXT

  tab 'background', 'background-color: name', <<-'TXT', uuid: '913410E0-623A-43F0-B71F-2E8FB9D5EBC8', file: 'background-color˸  color-name (background)'
background-color: ${1:red};$0
TXT

  tab 'background', 'background-color: rgb', <<-'TXT', uuid: '12241B4B-197C-41AF-ACC2-6B9A7AEC7039', file: 'background-color˸  color-rgb (background)'
background-color: rgb(${1:255},${2:255},${3:255});$0
TXT

  tab 'background', 'background-color: transparent', <<-'TXT', uuid: 'C71B1388-2815-4CAE-8652-CD159095AEAD', file: 'background-color˸  transparent (background)'
background-color: transparent;$0
TXT

  tab 'background', 'background-image: none', <<-'TXT', uuid: '7D71DF8B-492E-493D-BD94-1A4AFCCDCBBF', file: 'background-image˸  none (background)'
background-image: none;$0
TXT

  tab 'background', 'background-image: url', <<-'TXT', uuid: '978CBFF6-62D6-45B1-93F7-5644E1C6262B', file: 'background-image˸  url (background)'
background-image: url($1);$0
TXT

  tab 'background', 'background-position: position', <<-'TXT', uuid: 'E198D2D5-6B52-42FD-BCBC-01B0A7E5E80E', file: 'background-position˸  position (background)'
background-position: ${1|top left,top center,top right,center left,center center,center right,bottom left,bottom center,bottom right,x-% y-%,x-pos y-pos|};$0
TXT

  tab 'background', 'background-repeat: r/r-x/r-y/n-r', <<-'TXT', uuid: '4EE66583-26BE-4DBA-BD18-8DAF593835F9', file: 'background-repeat˸  r˸r-x˸r-y˸n-r (background)'
background-repeat: ${1|repeat,repeat-x,repeat-y,no-repeat|};$0
TXT

  tab 'background', 'background: color image repeat attachment position', <<-'TXT', uuid: 'D09967B1-2215-4B10-A331-7A372281DDA6', file: 'background˸  color image repeat attachment position (background)'
background:${6: #${1:DDD}} url($2) ${3|repeat,repeat-x,repeat-y,no-repeat|} ${4|scroll,fixed|} ${5|top left,top center,top right,center left,center center,center right,bottom left,bottom center,bottom right,x-% y-%,x-pos y-pos|};$0
TXT

  tab 'background', 'filter: AlphaImageLoader [for IE PNGs]', <<-'TXT', uuid: '81CCEB84-6241-4E4F-BB26-54BAAFA3FF2E', file: 'filter˸ AlphaImageLoader [for IE PNGs] (background)', key_equivalent: ""
${3:background-image: none;
}filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='${1:${TM_SELECTED_TEXT:/images/transparent.png}}', sizingMethod='${2|image,scale,crop|}');
TXT

  tab 'border', 'border-bottom-color: color', <<-'TXT', uuid: '05AFB9EB-F4AB-4F86-8170-535CF508176C', file: 'border-bottom-color˸ size style color (border)'
border-bottom-color: #${1:999};$0
TXT

  tab 'border', 'border-bottom-style: style', <<-'TXT', uuid: '39FA441C-3A8F-49D4-BBFE-270B4C962782', file: 'border-bottom-style˸ size style color (border)'
border-bottom-style: ${1|none,hidden,dotted,dashed,solid,double,groove,ridge,inset,outset|};$0
TXT

  tab 'border', 'border-bottom-width: size', <<-'TXT', uuid: '6F1126A9-5916-4E6F-8812-AB82C4638B6B', file: 'border-bottom-width˸ size style color (border)'
border-bottom-width: ${1:1}px ${2:solid} #${3:999};$0
TXT

  tab 'border', 'border-bottom: size style color', <<-'TXT', uuid: '1998EF7F-D855-4EAF-8CE0-D76CE8C905A4', file: 'border-bottom˸ size style color (border)'
border-bottom: ${1:1}px ${2:solid} #${3:999};$0
TXT

  tab 'border', 'border-color: color', <<-'TXT', uuid: 'AB0759F4-4243-4807-B297-2902459EBE02', file: 'border-color˸ color (border)'
border-color: ${1:999};$0
TXT

  tab 'border', 'border-left-color: color', <<-'TXT', uuid: '189DD463-0331-4B99-8CA2-ADEEF7CC078D', file: 'border-left-color˸ color (border)'
border-right-color: #${1:999};$0
TXT

  tab 'border', 'border-left-style: style', <<-'TXT', uuid: '8AD77320-0E31-48B9-94A9-982FD8DD1885', file: 'border-left-style˸ style (border)'
border-left-style: ${1|none,hidden,dotted,dashed,solid,double,groove,ridge,inset,outset|};$0
TXT

  tab 'border', 'border-left-width: size', <<-'TXT', uuid: '1A667AFE-208F-4697-AD44-3FA1A23AA4C7', file: 'border-left-width˸ size (border)'
border-left-width: ${1:1}px
TXT

  tab 'border', 'border-left: size style color', <<-'TXT', uuid: 'BDA03041-39C6-461C-A6F3-F6145D99AB5E', file: 'border-left˸ size style color (border)'
border-left: ${1:1}px ${2:solid} #${3:999};$0
TXT

  tab 'border', 'border-right-color: color', <<-'TXT', uuid: '321FFAF7-5699-45E6-8696-DE84AD607690', file: 'border-right-color˸ color (border)'
border-right-color: #${1:999};$0
TXT

  tab 'border', 'border-right-style: style', <<-'TXT', uuid: '6AE8DB39-F8E2-4DC9-ADBA-460E952439D8', file: 'border-right-style˸ style (border)'
border-right-style: ${1|none,hidden,dotted,dashed,solid,double,groove,ridge,inset,outset|};$0
TXT

  tab 'border', 'border-right-width: size', <<-'TXT', uuid: '8B059A97-7F2C-48CD-8422-0ECAB678E8AE', file: 'border-right-width˸ size (border)'
border-right-width: ${1:1}px
TXT

  tab 'border', 'border-right: size style color', <<-'TXT', uuid: '5FFC4EDE-9AEE-4854-BA78-34BD98BE7FBE', file: 'border-right˸ size style color (border)'
border-right: ${1:1}px ${2:solid} #${3:999};$0
TXT

  tab 'border', 'border-style: style', <<-'TXT', uuid: 'E4BD9171-E053-4EEF-8631-CFC74F1DCB97', file: 'border-style˸ style (border)'
border-style: ${1|none,hidden,dotted,dashed,solid,double,groove,ridge,inset,outset|};$0
TXT

  tab 'border', 'border-top-color: color', <<-'TXT', uuid: 'DAF7114F-B5DC-4E70-A7CD-66FF028F93B1', file: 'border-top-color˸ color (border)'
border-top-color: #${1:999};$0
TXT

  tab 'border', 'border-top-style: style', <<-'TXT', uuid: 'C5039010-E264-4D3D-A12E-02C2DB7DC4BF', file: 'border-top-style˸ style (border)'
border-top-style: ${1|none,hidden,dotted,dashed,solid,double,groove,ridge,inset,outset|};$0
TXT

  tab 'border', 'border-top-width: size', <<-'TXT', uuid: 'EE19367C-6634-4854-910D-90C6F5752A46', file: 'border-top-width˸ size (border)'
border-top-width: ${1:1}px
TXT

  tab 'border', 'border-top: size style color', <<-'TXT', uuid: '0FEBF51B-77B0-4D38-9CDB-276744CAF455', file: 'border-top˸ size style color (border)'
border-top: ${1:1}px ${2:solid} #${3:999};$0
TXT

  tab 'border', 'border-width: size', <<-'TXT', uuid: '979C3D46-E8B1-484D-9DBB-E3B1FCD3BCF9', file: 'border-width˸ width (border)'
border-width: ${1:1px};$0
TXT

  tab 'border', 'border: size style color', <<-'TXT', uuid: 'A2EA7266-AE50-4987-A86B-E3C4DFA5B643', file: 'border˸   size style color (border)'
border: ${1:1px} ${2:solid} #${3:999};$0
TXT

  tab 'clear', 'clear: value', <<-'TXT', uuid: '8E9366D7-BB0B-456C-B9F3-0CE8072A10C3', file: 'clear˸ value (clear)'
clear: ${1|left,right,both,none|};$0
TXT

  tab 'color', 'color: hex', <<-'TXT', uuid: 'D69E7EB0-07E2-48A3-AD32-A7C3E6CAFBBC', file: 'color˸  color-hex (color)'
color: #${1:DDD};$0
TXT

  tab 'color', 'color: name', <<-'TXT', uuid: '45D80BAF-0B0A-4334-AFBC-3601B5903707', file: 'color˸  color-name (color)'
color: ${1:red};$0
TXT

  tab 'color', 'color: rgb', <<-'TXT', uuid: 'FBA1210B-33DB-49D0-B026-FF31DBC41FD6', file: 'color˸  color-rgb (color)'
color: rgb(${1:255},${2:255},${3:255});$0
TXT

  tab 'cursor', 'cursor: type', <<-'TXT', uuid: '5EDCDB17-5DB0-459A-A61D-29984DD3A3B8', file: 'cursor˸ type (cursor)'
cursor: ${1|default,auto,crosshair,pointer,move,*-resize,text,wait,help|};$0
TXT

  tab 'cursor', 'cursor: url', <<-'TXT', uuid: '5C9011B1-B8A8-4FD3-8EA8-848AF6509ADF', file: 'cursor˸ url (cursor)'
cursor: url($1);$0
TXT

  tab 'direction', 'direction: ltr/rtl', <<-'TXT', uuid: 'A723DACA-3819-4E8D-8BCF-9BD1B98AF651', file: 'direction˸ ltr¦rtl (direction)'
direction: ${1:ltr|rtl};$0
TXT

  tab 'display', 'display: block', <<-'TXT', uuid: '2FC3C35E-88A6-4DA0-808D-3034A96E7794', file: 'display˸ block (display)'
display: block;$0
TXT

  tab 'display', 'display: common-types', <<-'TXT', uuid: '56940467-7D99-4F31-83C2-1554638F552A', file: 'display˸ common-types (display)'
display: ${1|none,inline,block,list-item,run-in,compact,marker|};$0
TXT

  tab 'display', 'display: inline', <<-'TXT', uuid: 'CA506D09-9EAE-445D-AE1E-7058937304B7', file: 'display˸ inline (display)'
display: inline;$0
TXT

  tab 'display', 'display: table-types', <<-'TXT', uuid: '98BE34AD-3CB1-4FB9-98A0-5E5A4BA63286', file: 'display˸ table-types (display)'
display: ${1|table,inline-table,table-row-group,table-header-group,table-footer-group,table-row,table-column-group,table-column,table-cell,table-caption|};$0
TXT

  tab 'fixed', 'Fixed Position Bottom 100% wide IE6', <<-'TXT', scope: 'source.css meta.property-list', uuid: 'FCDDB549-681A-436F-894E-1A408C0E114C'
${2:bottom: auto;}top: expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-${1:THE HEIGHT OF THIS THING IN PIXELS}));
${3:left: expression(eval(document.documentElement.scrollLeft));
}${4:width: expression(eval(document.documentElement.clientWidth));}$0
TXT

  tab 'float', 'float: left/right/none', <<-'TXT', uuid: '39244453-6D06-4265-9894-14D7FC0B277F', file: 'float˸ left˸right˸none (float)'
float: ${1|left,right,none|};$0
TXT

  tab 'font', 'font-family: family', <<-'TXT', uuid: '25388EC7-EA59-4C87-9F11-52870ADBF1AB', file: 'font-family˸   family (font)'
font-family: ${1:Arial, "MS Trebuchet"}, ${2:sans-}serif;$0
TXT

  tab 'font', 'font-size: size', <<-'TXT', uuid: 'CD8E3F13-2B14-401D-9646-E309FB04B678', file: 'font-size˸ size (font)'
font-size: ${1:100%};$0
TXT

  tab 'font', 'font-style: normal/italic/oblique', <<-'TXT', uuid: '128D7494-86EA-4615-87F4-C4D45E8C04AA', file: 'font-style˸   normal˸italic˸oblique (font)'
font-style: ${1|normal,italic,oblique|};$0
TXT

  tab 'font', 'font-variant: normal/small-caps', <<-'TXT', uuid: 'B6C9A8F9-2942-4592-B73F-2833B9F648E5', file: 'font-variant˸   normal˸small-caps (font)'
font-variant: ${1|normal,small-caps|};$0
TXT

  tab 'font', 'font-weight: weight', <<-'TXT', uuid: 'F2DC92D8-43D4-4044-9D85-D96F734FF81E', file: 'font-weight˸ weight (font)'
font-weight: ${1|normal,bold|};$0
TXT

  tab 'font', 'font: size font', <<-'TXT', uuid: 'F5EDF655-440B-4E1B-908F-4291F3A0A3A8', file: 'font˸ size font (font)'
font: ${1:75%} ${2:"Lucida Grande", "Trebuchet MS", Verdana,} ${3:sans-}serif;$0
TXT

  tab 'font', 'font: style variant weight size/line-height font-family', <<-'TXT', uuid: '30C6CFA2-C00A-4F2A-8770-096A49C3F95F', file: 'font˸   style variant weight size˸line-height font -family (font)'
font: ${1|normal,italic,oblique|} ${2|normal,small-caps|} ${3|normal,bold|} ${4|1em,1.5em|} ${5:Arial}, ${6:sans-}serif;$0
TXT

  tab 'letter', 'letter-spacing: em', <<-'TXT', uuid: 'D612A3B7-7C49-4447-9AAF-CCCFDE4408FF', file: 'letter-spacing˸   length-em (letter)'
letter-spacing: $1em;$0
TXT

  tab 'letter', 'letter-spacing: px', <<-'TXT', uuid: '17BBB1F1-1F83-4386-97B8-23144EB2441A', file: 'letter-spacing˸   length-px (letter)'
letter-spacing: $1px;$0
TXT

  tab 'list', 'list-style-image: url', <<-'TXT', uuid: 'BDEF3B0F-6414-4B1A-8841-864702B51EC6', file: 'list-style-image˸ url (list)'
list-style-image: url($1);$0
TXT

  tab 'list', 'list-style-position: pos', <<-'TXT', uuid: '9B10C768-5DA7-4570-98E4-70A36261C823', file: 'list-style-position˸ pos (list)'
list-style-position: ${1|inside,outside|};$0
TXT

  tab 'list', 'list-style-type: asian', <<-'TXT', uuid: 'E024086F-94B8-401F-A903-7F0CDA8E0B8A', file: 'list-style-type˸ asian (list)'
list-style-type: ${1|cjk-ideographic,hiragana,katakana,hiragana-iroha,katakana-iroha|};$0
TXT

  tab 'list', 'list-style-type: marker', <<-'TXT', uuid: 'C5CE7E29-9EB1-4A63-8173-190D12E4E4E4', file: 'list-style-type˸ marker(list)'
list-style-type: ${1|none,disc,circle,square|};$0
TXT

  tab 'list', 'list-style-type: numeric', <<-'TXT', uuid: '24436F96-2383-48AB-844F-AE791DEAF080', file: 'list-style-type˸ numeric (list)'
list-style-type: ${1|decimal,decimal-leading-zero,zero|};$0
TXT

  tab 'list', 'list-style-type: other', <<-'TXT', uuid: 'B8E9019D-3419-4CC3-87BB-DC54098CBFD0', file: 'list-style-type˸ other (list)'
list-style-type: ${1|hebrew,armenian,georgian|};$0
TXT

  tab 'list', 'list-style-type: roman-alpha-greek', <<-'TXT', uuid: '97A55488-5DD9-4347-B5F1-722F580715E4', file: 'list-style-type˸ roman-alpha-greek (list)'
list-style-type: ${1|lower-roman,upper-roman,lower-alpha,upper-alpha,lower-greek,lower-latin,upper-latin|};$0
TXT

  tab 'list', 'list-style: type position image', <<-'TXT', uuid: '1C7E0430-2A67-4CEF-9D68-4ED6315A8567', file: 'list-style˸ type position image (list)'
list-style: ${1|none,disc,circle,square,decimal,zero|} ${2|inside,outside|} url($3);$0
TXT

  tab 'margin', 'margin-bottom: length', <<-'TXT', uuid: '6354F6AC-74E2-42CF-96B0-7EE2733B9B34', file: 'margin-bottom˸ length (margin)'
margin-bottom: ${1:20px};$0
TXT

  tab 'margin', 'margin-left: length', <<-'TXT', uuid: 'C19985FF-A12C-49B9-9BA3-EDC726E919A0', file: 'margin-left˸ length (margin)'
margin-left: ${1:20px};$0
TXT

  tab 'margin', 'margin-right: length', <<-'TXT', uuid: '1FDAB8C2-7A0D-4C0A-97FF-77AD2CC86083', file: 'margin-right˸ length (margin)'
margin-right: ${1:20px};$0
TXT

  tab 'margin', 'margin-top: length', <<-'TXT', uuid: '412AA532-762F-4270-961A-54BF6014996D', file: 'margin-top˸ length (margin)'
margin-top: ${1:20px};$0
TXT

  tab 'margin', 'margin: all', <<-'TXT', uuid: 'FA3D9F50-C5F6-4193-81D2-98A3E8FFBB2F', file: 'margin˸   all (margin)'
margin: ${1:20px};$0
TXT

  tab 'margin', 'margin: T R B L', <<-'TXT', uuid: '68A3178C-A024-48BD-ABA6-0A03A69BD82E', file: 'margin˸ T R B L (margin)'
margin: ${1:20px} ${2:0px} ${3:40px} ${4:0px};$0
TXT

  tab 'margin', 'margin: V H', <<-'TXT', uuid: '99315B12-6A41-4D8F-8477-F38DE0EBBEF8', file: 'margin˸ V H (margin)'
margin: ${1:20px} ${2:0px};$0
TXT

  tab 'marker', 'marker-offset: auto', <<-'TXT', uuid: 'E10366F8-CA83-4447-89D3-B36AFD1EAECD', file: 'marker-offset˸ auto (marker)'
marker-offset: auto;$0
TXT

  tab 'marker', 'marker-offset: length', <<-'TXT', uuid: '5FDD30D8-7EF8-41E9-8A44-DC3C22EFD75D', file: 'marker-offset˸ length (marker)'
marker-offset: ${1:10px};$0
TXT

  tab 'opacity', 'opacity: [for Safari, FF & IE]', <<-'TXT', uuid: '50C748B6-C8B6-447F-A9EE-DD41CF1CD707', file: 'opacity˸ [for Safari, FF and IE] (opacity)'
opacity: ${1:0.5};${100:
}-moz-opacity: ${1:0.5};${100:
}filter:alpha(opacity=${2:${1/(1?)0?\.(.*)/$1$2/}${1/^\d*\.\d\d+$|^\d*$|(^\d\.\d$)/(?1:0)/}});$0
TXT

  tab 'overflow', 'overflow: type', <<-'TXT', uuid: '6523B6C5-8741-4766-98D6-1B1DE2E6A5F3', file: 'overflow˸ type (overflow)'
overflow: ${1|visible,hidden,scroll,auto|};$0
TXT

  tab 'padding', 'padding-bottom: length', <<-'TXT', uuid: '1644E167-7A29-46A7-A100-7BD6C7EFA2F3', file: 'padding-bottom˸ length (margin)'
padding-bottom: ${1:20px};$0
TXT

  tab 'padding', 'padding-left: length', <<-'TXT', uuid: '772DD28C-80C2-4C9B-8023-1E71A974E1C4', file: 'padding-left˸ length (margin)'
padding-left: ${1:20px};$0
TXT

  tab 'padding', 'padding-right: length', <<-'TXT', uuid: 'C1667E5D-3A50-42F8-8129-6C3EEB43D7C2', file: 'padding-right˸ length (margin)'
padding-right: ${1:20px};$0
TXT

  tab 'padding', 'padding-top: length', <<-'TXT', uuid: 'E5B92C27-8602-4E50-9DF7-DE476E63BA1A', file: 'padding-top˸ length (margin)'
padding-top: ${1:20px};$0
TXT

  tab 'padding', 'padding: all', <<-'TXT', uuid: '6E64EA4A-A10E-49B3-AC9C-D53DBF9ED14A', file: 'padding˸   all (padding)'
padding: ${1:20px};$0
TXT

  tab 'padding', 'padding: T R B L', <<-'TXT', uuid: 'DD5BB93D-4F99-4A41-8864-85A557B922C7', file: 'padding˸   T R B L (padding)'
padding: ${1:20px} ${2:0px} ${3:40px} ${4:0px};$0
TXT

  tab 'padding', 'padding: V H', <<-'TXT', uuid: '4602BFF3-C7F1-4CF5-93CE-125EC8ABC7C8', file: 'padding˸   V H (padding)'
padding: ${1:20px} ${2:0px};$0
TXT

  tab 'position', 'position: type', <<-'TXT', uuid: '1398502F-D4FD-437B-9033-49E254159BDE', file: 'position˸ type (position)'
position: ${1|static,relative,absolute,fixed|};$0
TXT

  tab 'scrollbar', 'scrollbar', <<-'TXT', scope: 'source.css meta.property-list', uuid: '749295F4-F139-422A-80A0-EA11364396E3'
scrollbar-base-color:       ${1:#CCCCCC};${2:
scrollbar-arrow-color:      ${3:#000000};
scrollbar-track-color:      ${4:#999999};
scrollbar-3dlight-color:    ${5:#EEEEEE};
scrollbar-highlight-color:  ${6:#FFFFFF};
scrollbar-face-color:       ${7:#CCCCCC};
scrollbar-shadow-color:     ${9:#999999};
scrollbar-darkshadow-color: ${8:#666666};}
TXT

  tab 'selection', 'selection', <<-'TXT', scope: 'source.css -meta.property-list', uuid: '1B042CEF-7C82-472D-92A2-FF555BFD6927'
$1::-moz-selection,
$1::selection {
	color: ${2:inherit};
	background: ${3:inherit};
}
TXT

  tab 'text', 'text-align: left/center/right', <<-'TXT', uuid: 'F6CB9433-601A-4F95-A6B9-27D76B50DEE3', file: 'text-align˸ left˸center˸right (txt)'
text-align: ${1|left,right,center,justify|};$0
TXT

  tab 'text', 'text-decoration: none/underline/overline/line-through/blink', <<-'TXT', uuid: 'B1916E73-D417-42C2-A5C1-E95428DA6C45', file: 'text-decoration˸ none˸underline˸overline˸line-through˸blink (text)'
text-decoration: ${1|none,underline,overline,line-through,blink|};$0
TXT

  tab 'text', 'text-indent: length', <<-'TXT', uuid: '2CFA68DC-947B-4C43-872C-FB4DC0704D27', file: 'text-indent˸ length (text)'
text-indent: ${1:10}px;$0
TXT

  tab 'text', 'text-shadow: color-hex x y blur', <<-'TXT', uuid: '77EF6A55-9814-492C-B8E2-EFF0FFAC272E', file: 'text-shadow˸ color-hex x y blur (text)'
text-shadow: #${1:DDD} ${2:10px} ${3:10px} ${4:2px};$0
TXT

  tab 'text', 'text-shadow: color-rgb x y blur', <<-'TXT', uuid: '005905FF-544A-434C-803E-B51689332034', file: 'text-shadow˸ color-rgb x y blur (text)'
text-shadow: rgb(${1:255},${2:255},${3:255}) ${4:10px} ${5:10px} ${6:2px};$0
TXT

  tab 'text', 'text-shadow: none', <<-'TXT', uuid: '1A6AD6F4-E0F7-406B-B28B-06EC54660650', file: 'text-shadow˸ none (text)'
text-shadow: none;$0
TXT

  tab 'text', 'text-transform: capitalize/upper/lower', <<-'TXT', uuid: '32CD0FA8-7BE7-4D58-A28A-7388F4CF6F9A', file: 'text-transform˸ capitalize˸upper˸lower (text)'
text-transform: ${1|capitalize,uppercase,lowercase|};$0
TXT

  tab 'text', 'text-transform: none', <<-'TXT', uuid: '2FF51006-7E07-4296-B89D-5ADF7B9B4232', file: 'text-transform˸ none (text)'
text-transform: none;$0
TXT

  tab 'vertical', 'vertical-align: type', <<-'TXT', uuid: '0C94F6A6-8AFB-47BC-8448-2383CF0D6C5B', file: 'vertical-align˸ type (vertical)'
vertical-align: ${1|baseline,sub,super,top,text-top,middle,bottom,text-bottom,length,%|};$0
TXT

  tab 'visibility', 'visibility: type', <<-'TXT', uuid: 'DE6D5C37-AC74-467E-9029-9844D8F4153A', file: 'visibility˸ type (visibility)'
visibility: ${1|visible,hidden,collapse|};$0
TXT

  tab 'white', 'white-space: normal/pre/nowrap', <<-'TXT', uuid: 'A7D10908-72FE-4502-A267-42C5B03F0D66', file: 'white-space˸  normal˸pre˸nowrap (white)'
white-space: ${1|normal,pre,nowrap|};$0
TXT

  tab 'word', 'word-spacing: length', <<-'TXT', uuid: 'B121F84A-CE4A-491D-BF3D-35ED51C82554', file: 'word-spacing˸  length (word)'
word-spacing: ${1:10px};$0
TXT

  tab 'word', 'word-spacing: normal', <<-'TXT', uuid: 'DA7DF131-7351-4F3B-B680-57159E50E6DE', file: 'word-spacing˸  normal (word)'
word-spacing: normal;$0
TXT

  tab 'z', 'z-index: index', <<-'TXT', uuid: '2EED405C-FBAF-4AEB-9B30-ED8EB2252378', file: 'z-index˸ index (z)'
z-index: $1;$0
TXT

  tab '{', 'properties { } ( } )', <<-'TXT', uuid: '0975B58C-C7A1-441E-90E4-C7C413975D42'
{
	/* $1 */
	$0

TXT

end