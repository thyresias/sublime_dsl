# encoding: utf-8

snippets do

  default_scope 'source.fxscript'
  file_format :textmate

  tab 'add', 'Add', <<-'TXT', uuid: 'C057A470-0066-4D34-A3BC-D1A6D98FC834'
Add(${1:srcImage1}, ${2:srcImage2}, ${3:destImage}, ${4:amount}, ${5:kAlpha});
TXT

  tab 'aspectof', 'AspectOf(dest)', <<-'TXT', uuid: '8F6C9982-167C-4266-950C-5073AC5125BA'
AspectOf(${1:dest});
TXT

  tab 'blitrect', 'BlitRect', <<-'TXT', uuid: '5F1E25B9-E356-4B1F-9BA0-9B3ACB045523'
BlitRect(${1:sourceImage}, ${2:sourcePoly}, ${3:destImage}, ${4:destPoly});

TXT

  tab 'blur', 'BlurChannel', <<-'TXT', uuid: '102CD34A-DE6E-4E07-96BF-3BA54AB57501'
BlurChannel(${1:srcImage}, ${2:destImage}, ${3:radius}, ${4:doAlpha}, ${5:doRed}, ${6:doGreen}, ${7:doBlue}, ${8:AspectOf(${9:dest})});

TXT

  tab 'boundsof', 'BoundsOf', <<-'TXT', uuid: '5396B08F-29B8-45B9-B02D-07B727DD907A'
BoundsOf(${1:image}, ${2:result});
TXT

  tab 'bumpmap', 'BumpMap', <<-'TXT', uuid: '0203808F-1EF2-47DA-9D18-C2C878AD0031', file: 'Bumpmap'
BumpMap(${1:srcImage}, ${2:destImage}, ${3:mapImage}, ${4:repeatEdges}, ${5:angle}, ${6:scale}, ${7:lumaScale}, ${8:AspectOf($2)});

TXT

  tab 'channelcopy', 'ChannelCopy', <<-'TXT', uuid: 'E445C3D8-A47A-4766-BC3A-5B661110EEEB'
ChannelCopy(${1:srcIMG}, ${2:destIMG}, ${3:channel2Alpha}, ${4:channel2Red}, ${5:channel2Green}, ${6:channel2Blue});

TXT

  tab 'channelfill', 'ChannelFill', <<-'TXT', uuid: 'E3BCB1BC-7AB9-4EEF-B995-5145ED3C80C7'
ChannelFill(${1:destImage}, ${2:a0-255}, ${3:r0-255}, ${4:g0-255}, ${5:b0-255});

TXT

  tab 'channelmultiply', 'ChannelMultiply', <<-'TXT', uuid: 'E4815028-FEBF-410B-80FC-9AD4C11F724A'
ChannelMultiply(${1:srcImage}, ${2:destImage}, ${3:alphaValue}, ${4:redValue}, ${5:greenValue}, ${6:blueValue});
TXT

  tab 'code', 'code', <<-'TXT', uuid: 'F7EB9453-34E5-496D-A588-665E83A3859D'

code


TXT

  tab 'code', 'code:ProducesAlpha', <<-'TXT', uuid: '56BC2A5F-A634-4D1C-B264-F303ADBBD75C', file: 'code_ProducesAlpha'
ProducesAlpha;

code

exposedBackground=1;

TXT

  tab 'colorof', 'ColorOf', <<-'TXT', uuid: 'EAF8AA08-9505-40F3-8289-90931AF7F0F6'
ColorOf(${1:image}, ${2:point}, ${3:color});
TXT

  tab 'colortransform', 'ColorTransform', <<-'TXT', uuid: '95AD96B7-AE5C-4F20-8919-0F61A474FCAA'
ColorTransform(${1:srcImage}, ${2:destImage}, ${3:matrix}, ${4:float[3]}, ${5:$4});
TXT

  tab 'convertimage', 'ConvertImage', <<-'TXT', uuid: '274A0C5C-1439-461E-B1EC-494DE45B8EF7'
ConvertImage(${1:src1}, ${2:dest}, ${3:colorspace});
TXT

  tab 'darken', 'Darken', <<-'TXT', uuid: '9C53297A-5990-400D-AF98-76C4B000669D'
Darken(${1:srcImage1}, ${2:srcImage2}, ${3:destImage}, ${4:amount}, ${5:kAlpha});
TXT

  tab 'debug', 'DebugText', <<-'TXT', uuid: '37F2F4D3-9853-4961-8F7A-AABB0300D0FC'
DebugText("${1:label}", ${2:float value});
TXT

  tab 'difference', 'Difference', <<-'TXT', uuid: '9D4DA4E7-E521-42EB-8FF6-5991B0B31DA5'
Difference(${1:srcImage1}, ${2:srcImage2}, ${3:destImage}, ${4:kAlpha});
TXT

  tab 'dimsof', 'DimensionsOf', <<-'TXT', uuid: '841D77E5-0FAA-4D55-BEFB-01D7C2618F87'
DimensionsOf(${1:Dest}, ${2:Width}, ${3:Height});
TXT

  tab 'dimsof', 'DimensionsOf() w/ float vars', <<-'TXT', uuid: '1E65AC5C-A779-42C8-809C-0AA198107A6E', file: 'DimensionsOf_w_float_vars'
float ${1:w}, ${2:h};
DimensionsOf(${3:dest}, $1, $2);
image ${4:img0}[$1][$2];

TXT

  tab 'dimsof', 'DimensionsOf() w/ point vars', <<-'TXT', uuid: '7353C10B-D130-432F-96BD-4A769A22D0BC', file: 'DimensionsOf_w_point_vars'
point ${1:w};
DimensionsOf(${2:dest}, $1.x, $1.y);
image ${3:img0}[$1.x][$1.y];

TXT

  tab 'displace', 'Displace', <<-'TXT', uuid: 'E632987B-755A-41C0-ACD1-3F65304FCBD3'
Displace(${1:srcImage}, ${2:destImage}, ${3:mapImage}, ${4:repeatEdges}, ${5:xScale}, ${6:yScale}, ${7:lumaScale}, ${8:AspectOf($2)});

TXT

  tab 'drawsoftdot', 'DrawSoftSpot', <<-'TXT', uuid: 'E678D4CC-8981-48A2-B7CE-060DBF8D6F53'
DrawSoftDot(${1:dest}, ${2:point/poly}, ${3:shape}, ${4:size}, ${5:softness}, ${6:subSteps}, ${7:color(s)}, ${8:opacity(s)}, ${9:aspectOf(${10:$1})});
TXT

  tab 'fillpoly', 'FillPoly', <<-'TXT', uuid: 'A76BFE87-61A6-4D52-B921-D8AC6E13B8FB'
FillPoly(${1:poly}, ${2:image}, ${3:color});

TXT

  tab 'filter', 'Filter', <<-'TXT', uuid: '55E54D27-5564-48FA-9708-245CE03CF999'
Filter "${1:Name}";
Group "${2:Name}";

TXT

  tab 'for', 'for ... next', <<-'TXT', uuid: '317C63E1-3870-4A66-A66C-4605D0E07BBE', file: 'for_next'
for ${1:var} = ${2:min} to ${3:max}
	${0:${TM_SELECTED_TEXT/(.*)$/$1/: // insert code here}}
next;
TXT

  tab 'framepoly', 'FramePoly', <<-'TXT', uuid: '9659B554-7CB0-4797-B47C-B264840E7912'
FramePoly(${1:poly}, ${2:image}, ${3:color}, ${4:width});
TXT

  tab 'generator', 'Generator', <<-'TXT', uuid: '8265E927-C628-4028-B12C-60C233BAA124'
Generator "${1:Name}";
Group "${2:Name}";

TXT

  tab 'getpixelformat', 'GetPixelFormat', <<-'TXT', uuid: 'A7E0BF12-EE72-49D7-94B2-14136FA690BA'
GetPixelFormat(${1:src1});
TXT

  tab 'getvideo', 'GetVideo', <<-'TXT', uuid: '38903FDD-A0E3-4594-9FB2-ACE8D9A27B27'
GetVideo(${1:srcClip}, ${2:timeOffset}, ${3:destImage});
TXT

  tab 'if', 'if ... end', <<-'TXT', uuid: '2A9F9CFB-9853-4652-BF39-C1CA15E31D12', file: 'if'
if (${1:Condition})
	${0:${TM_SELECTED_TEXT/(.*)$/$1/: // insert code here}}
end if

TXT

  tab 'ife', 'if ... else ... end', <<-'TXT', uuid: 'BD010766-1AA4-485C-9086-043E0B151537', file: 'if_else'
if (${1:Condition})
	${2:${TM_SELECTED_TEXT/(.*)$/$1/: // code}}
else ${3:if (${4:condition})}
	${5: // code}
end if

TXT

  tab 'imageand', 'ImageAnd', <<-'TXT', uuid: 'B878BD4C-21A2-4F3A-8A45-636EC899DF4A'
ImageAnd(${1:srcImage1}, ${2:srcImage2}, ${3:destImage});
TXT

  tab 'info', 'InformationFlag("dontEraseDest")', <<-'TXT', uuid: 'E1E768CA-F914-4080-AB3D-00A795951810', file: 'InformationFlag_dontEraseDest'
InformationFlag("dontEraseDest");

TXT

  tab 'info', 'InformationFlag("hasfields")', <<-'TXT', uuid: 'DE0C3E02-E0D3-458C-BCC6-FD6B865919BC', file: 'InformationFlag_hasFields'
InformationFlag("hasfields");

TXT

  tab 'info', 'InformationFlag("requiresYUV")', <<-'TXT', uuid: '0472BDC3-16AA-42F9-ADDE-1ABA30C0B348', file: 'InformationFlag_requiresYUV'
InformationFlag("requiresYUV");

TXT

  tab 'info', 'InformationFlag("YUVaware")', <<-'TXT', uuid: '2526F035-4131-468E-9CAA-A9E8FE42D17B', file: 'InformationFlag_YUVaware'
InformationFlag("YUVaware");

TXT

  tab 'input', 'Angle', <<-'TXT', uuid: '700E5067-6AF4-4A03-9387-4BEFA4B55BCA'
input ${1:varname}, "${2:${1/varname/text label/}}", Angle, ${3:default value}, ${4:min value}, ${5:max value};

TXT

  tab 'input', 'Checkbox', <<-'TXT', uuid: 'A03B190B-E834-4502-856C-43545F86A5CC', file: 'checkbox'
input ${1:varname}, "${2:${1/varname/text label/}}", Checkbox, ${3:0};

TXT

  tab 'input', 'Clip', <<-'TXT', uuid: 'F4A7A838-0A5D-4AEA-8F57-3AE05AC6590A'
input ${1:varName}, "${2:${1/varname/text label/}}", Clip;

TXT

  tab 'input', 'Color', <<-'TXT', uuid: '45428D9B-CD3E-432C-A421-6C0A7019C806'
input ${1:varname}, "${2:${1/varname/text label/}}", Color, ${3:A}, ${4:R}, ${5:G}, ${6:B};

TXT

  tab 'input', 'Label', <<-'TXT', uuid: '2F1E3D94-3F4C-4001-8529-0DBDA797EABD'
input label_`date +%s`, "${1:Visible Text}", Label, "";

TXT

  tab 'input', 'Point', <<-'TXT', uuid: '3FDDEFD4-6C98-402F-8FBE-C40E69651052'
input ${1:varname}, "${2:${1/varname/text label/}}", Point, ${3:X}, ${4:Y};

TXT

  tab 'input', 'Popup', <<-'TXT', uuid: '435E0864-5903-4A80-BB9D-FA47A6AF1FDD'
input ${1:varname}, "${2:${1/varname/text label/}}", Popup, ${3:[numeric index]}, "${4:string 1}"${5:, "${6:string 2}"${7:, "${8:string 3}"${9:, "${10:string 4}"${11:, "${12:string 5}"${13:, "${14:string 6}"}}}}};

TXT

  tab 'input', 'RadioGroup', <<-'TXT', uuid: 'B733EA72-CDAD-48B9-84B1-4696C65F2914'
input ${1:varname}, "${2:${1/varname/text label/}}", RadioGroup, ${3:[numeric index]}, "${4:string 1}"${5:, "${6:string 2}"${7:, "${8:string 3}"${9:, "${10:string 4}"${11:, "${12:string 5}"${13:, "${14:string 6}"}}}}};

TXT

  tab 'input', 'Slider', <<-'TXT', uuid: '32D9C004-FBB8-4A95-81A4-503E45F46530', file: 'slider'
input ${1:varname}, "${2:${1/varname/text label/}}", Slider, ${3:default value}, ${4:min value}, ${5:max value}${6: ramp ${7:number}}${8: label "${9:units}"}${10: detent ${11:number}};

TXT

  tab 'interpolate', 'Interpolate', <<-'TXT', uuid: '7732A822-C4DE-41B2-9948-AF3DC790175D'
Interpolate(${1:p1}, ${2:p2}, ${3:percent}, ${4:result});
TXT

  tab 'invertchannel', 'InvertChannel', <<-'TXT', uuid: '7B5F1EEB-09A5-41D8-A724-150B41620068'
InvertChannel(${1:srcImage}, ${2:destImage}, ${3:doAlpha}, ${4:doRed}, ${5:doGreen}, ${6:doBlue});

TXT

  tab 'kfloat', 'kFloat2', <<-'TXT', uuid: '32203D39-7E44-4958-AB59-CB28EB5CB844'
kFloat2
TXT

  tab 'kfloat', 'kFloat4', <<-'TXT', uuid: '84FFACEC-E910-4DCE-AE1E-BC01C83C63EF'
kFloat4
TXT

  tab 'kfloat', 'kFloat6', <<-'TXT', uuid: 'E3333819-A50E-4138-ADE5-70C02D7F06AE'
kFloat6
TXT

  tab 'kfloat', 'kInteger', <<-'TXT', uuid: '8AF84414-440E-47AB-A71F-DF3BDB6A103E'
kInteger
TXT

  tab 'kformat', 'kFormatRGB219', <<-'TXT', uuid: 'B9D8441C-151E-4275-B395-F9234EEBE073'
kFormatRGB219
TXT

  tab 'kformat', 'kFormatRGB255', <<-'TXT', uuid: '5B0AD9DB-51AC-4E5E-8CA6-E5A3EA068616'
kFormatRGB255
TXT

  tab 'kformat', 'kFormatYUV219', <<-'TXT', uuid: 'ED1E4E46-5745-4821-8DE3-EE1DC1B66FED'
kFormatYUV219
TXT

  tab 'levelmap', 'LevelMap', <<-'TXT', uuid: '6EF29651-DF4B-46D8-BB28-CD0F5B0DCC35'
LevelMap(${1:src}, ${2:dest}, ${3:alphaMap[256]}, ${4:redMap[256]}, ${5:greenMap[256]}, ${6:blueMap[256]});
TXT

  tab 'lighten', 'Lighten', <<-'TXT', uuid: 'CB07B4F7-E612-47F0-B148-34E70EFA1825'
Lighten(${1:srcImage1}, ${2:srcImage2}, ${3:destImage}, ${4:amount}, ${5:kAlpha});
TXT

  tab 'line', 'line', <<-'TXT', uuid: '2572F624-B65B-46C1-BF97-5FAEF3EAEA72'
Line(${1:p1}, ${2:p2}, ${3:image}, ${4:color}, ${5:width});
TXT

  tab 'makerect', 'MakeRect', <<-'TXT', uuid: 'C1F4D5B2-58AD-4B40-A8F8-EEC252E11483'
MakeRect(${1:result}, ${2:left}, ${3:top}, ${4:width}, ${5:height});
TXT

  tab 'matte', 'Matte', <<-'TXT', uuid: 'D21F0582-A1CC-442D-8DE9-21DBAF34CDB5'
Matte(${1:TopImage}, ${2:BottomImage}, ${3:destImage}, ${4:amount}, ${5:kAlpha});
TXT

  tab 'multiply', 'Multiply', <<-'TXT', uuid: 'E7BBD673-2D91-4752-B0E4-D90B5F7F3406'
Multiply(${1:srcImage1}, ${2:srcImage2}, ${3:destImage}, ${4:amount}, ${5:kAlpha});
TXT

  tab 'overlay', 'Overlay', <<-'TXT', uuid: 'C24BFE3B-41A9-4E45-9872-759D449510E7'
Overlay(${1:srcImage1}, ${2:srcImage2}, ${3:destImage}, ${4:amount}, ${5:kAlpha});
TXT

  tab 'repeat', 'Repeat While', <<-'TXT', uuid: '74D5E8B6-39DB-4A78-B5C7-10C89A60878D'
Repeat While (${1:Condition})
	${0:${TM_SELECTED_TEXT/(.*)$/$1/: // insert code here}}
End Repeat;
TXT

  tab 'screen', 'Screen', <<-'TXT', uuid: 'EC5EE9C6-52D7-406F-8D2D-17112DA8D674'
Screen(${1:srcImage1}, ${2:srcImage2}, ${3:destImage}, ${4:amount}, ${5:kAlpha});
TXT

  tab 'setpixelformat', 'SetPixelFormat', <<-'TXT', uuid: 'E3F28EA4-A9A3-483E-826D-5D2666724146'
SetPixelFormat(${1:dest}, ${2:colorspace});
TXT

  tab 'subtract', 'Subtract', <<-'TXT', uuid: 'A71CF32D-CBBE-4EC5-B4F5-1BAC96E5672E'
Subtract(${1:srcImage1}, ${2:srcImage2}, ${3:destImage}, ${4:amount}, ${5:kAlpha});
TXT

  tab 'transition', 'Transition', <<-'TXT', uuid: '863C384C-A6CD-4D9F-AD79-841CDB10CE65'
Transition "${1:Name}";
Group "${2:Name}";

TXT

end