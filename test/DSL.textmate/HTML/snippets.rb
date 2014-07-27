# encoding: utf-8

snippets do

  default_scope 'text.html'
  file_format :textmate

  key "^\n", 'Br', <<-'TXT', uuid: '3E008E42-A5C9-11D9-9BCD-000D93C8BE28', file: 'XHTML ˂br ˸˃'
<br${TM_XHTML}>
TXT

  key "@i", 'Emphasize', <<-'TXT', uuid: 'EBB98620-3292-4621-BA38-D8A9A65D9551'
${0:${TM_SELECTED_TEXT/\A<em>(.*)<\/em>\z|.*/(?1:$1:<em>$0</em>)/m}}
TXT

  key "~ ", 'Non-Breaking Space', <<-'TXT', uuid: '73B40BAE-A295-11D9-87F7-000D93C8BE28', file: 'XHTML &nbsp; NonBreakingSpace'
&nbsp;
TXT

  key "\n", 'Special: Return Inside Empty Open/Close Tags', <<-'TXT', scope: 'meta.scope.between-tag-pair', uuid: '3C44EABE-8D6F-4B1B-AB91-F419FAD1A0AD', file: 'Smart return˸indent for tag pairs'

	$0

TXT

  key "@b", 'Strong', <<-'TXT', uuid: '4117D930-B6FA-4022-97E7-ECCAF4E70F63'
${0:${TM_SELECTED_TEXT/\A<strong>(.*)<\/strong>\z|.*/(?1:$1:<strong>$0</strong>)/m}}
TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, 'Wrap in <?= … ?>', <<-'TXT', scope: 'text.html string', uuid: '912906A0-9A29-434B-AE98-E9DFDE6E48B4'
<?= $TM_SELECTED_TEXT ?>
TXT

  key "^W", 'Wrap Selection in Open/Close Tag', <<-'TXT', scope: 'text.html,', uuid: 'BC8B8AE2-5F16-11D9-B9C3-000D93589AF6', file: 'Wrap Selection In Tag'
<${1:p}>$TM_SELECTED_TEXT</${1/\s.*//}>
TXT

  tab '!', 'IE Conditional Comment: Internet Explorer', <<-'TXT', uuid: '0ED6DA73-F38F-4A65-B18F-3379D2BA9387'
<!--[if IE]>${1:${TM_SELECTED_TEXT:       IE Conditional Comment: Internet Explorer          }}<![endif]-->$0
TXT

  tab '!', 'IE Conditional Comment: Internet Explorer 5.0 only', <<-'TXT', uuid: '3A517A94-001E-464D-8184-1FE56D0D0D70', file: 'IE Conditional Comment˸ Internet Explorer 5_0 only'
<!--[if IE 5.0]>${1:${TM_SELECTED_TEXT:   IE Conditional Comment: Internet Explorer 5.0 only }}<![endif]-->$0
TXT

  tab '!', 'IE Conditional Comment: Internet Explorer 5.5 only', <<-'TXT', uuid: 'E3F8984E-7269-4981-9D30-967AB56A6ACE', file: 'IE Conditional Comment˸ Internet Explorer 5_5 only'
<!--[if IE 5.5000]>${1:${TM_SELECTED_TEXT:   IE Conditional Comment: Internet Explorer 5.5 only }}<![endif]-->$0
TXT

  tab '!', 'IE Conditional Comment: Internet Explorer 5.x', <<-'TXT', uuid: 'F3512848-7889-45DA-993B-0547976C8E6D', file: 'IE Conditional Comment˸ Internet Explorer 5_x'
<!--[if lt IE 6]>${1:${TM_SELECTED_TEXT:  IE Conditional Comment: Internet Explorer 5.x      }}<![endif]-->$0
TXT

  tab '!', 'IE Conditional Comment: Internet Explorer 6 and below', <<-'TXT', uuid: '32BBB9AB-8732-4F91-A587-354941A27B69'
<!--[if lte IE 6]>${1:${TM_SELECTED_TEXT: IE Conditional Comment: Internet Explorer 6 and below }}<![endif]-->$0
TXT

  tab '!', 'IE Conditional Comment: Internet Explorer 6 only', <<-'TXT', uuid: '48DF7485-52EA-49B3-88AF-3A41F933F325'
<!--[if IE 6]>${1:${TM_SELECTED_TEXT:     IE Conditional Comment: Internet Explorer 6 only   }}<![endif]-->$0
TXT

  tab '!', 'IE Conditional Comment: Internet Explorer 7 and above', <<-'TXT', uuid: 'CBC24AF4-88E0-498B-BE50-934B9CF29EC7', file: 'IE Conditional Comment˸ Internet Explorer 7+'
<!--[if gte IE 7]>${1:${TM_SELECTED_TEXT: IE Conditional Comment: Internet Explorer 7 and above }}<![endif]-->$0
TXT

  tab '!', 'IE Conditional Comment: NOT Internet Explorer', <<-'TXT', uuid: 'F00170EE-4A82-413F-A88B-85293E69A88B'
<!--[if !IE]><!-->${1:${TM_SELECTED_TEXT:  IE Conditional Comment: NOT Internet Explorer      }}<!-- <![endif]-->$0
TXT

  tab 'base', 'Base', <<-'TXT', uuid: '4462A6B8-A08A-11D9-A5A2-000D93C8BE28', file: 'XHTML ˂base˃'
<base href="$1"${2: target="$3"}${TM_XHTML}>
TXT

  tab 'body', 'Body', <<-'TXT', scope: 'text.html - meta.tag', uuid: '4905D47B-A08B-11D9-A5A2-000D93C8BE28', file: 'XHTML ˂body˃'
<body id="${1:${TM_FILENAME/(.*)\..*/\L$1/}}"${2: onload="$3"}>
	$0
</body>
TXT

  tab 'div', 'Div', <<-'TXT', uuid: '576036C0-A60E-11D9-ABD6-000D93C8BE28', file: 'XHTML ˂div˃'
<div${1: id="${2:name}"}>
	${0:$TM_SELECTED_TEXT}
</div>
TXT

  tab 'doctype', 'HTML — 4.01 Strict', <<-'TXT', uuid: '944F1410-188C-4D70-8340-CECAA56FC7F2', file: 'DocType HTML 4.0 Strict'
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
	"http://www.w3.org/TR/html4/strict.dtd">

TXT

  tab 'doctype', 'HTML — 4.01 Transitional', <<-'TXT', uuid: 'B2AAEE56-42D8-42C3-8F67-865473F50E8D', file: 'HTML — 4.0 Transitional (doctype)'
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	"http://www.w3.org/TR/html4/loose.dtd">

TXT

  tab 'doctype', 'HTML — 5', <<-'TXT', uuid: '08E4F47C-A570-4F9B-A6AE-DCAC0D2E2420', file: 'DocType HTML 5'
<!DOCTYPE html>

TXT

  tab 'doctype', 'XHTML — 1.0 Frameset', <<-'TXT', uuid: '9ED6ABBE-A802-11D9-BFC8-000D93C8BE28', file: 'DocType XHTL 1.0 Frameset'
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">

TXT

  tab 'doctype', 'XHTML — 1.0 Strict', <<-'TXT', uuid: 'C8B83564-A802-11D9-BFC8-000D93C8BE28', file: 'DocType XHTML 1.0 Strict'
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

TXT

  tab 'doctype', 'XHTML — 1.0 Transitional', <<-'TXT', uuid: '7D8C2F74-A802-11D9-BFC8-000D93C8BE28', file: 'DocType XHTML 1.0 Transitional'
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

TXT

  tab 'doctype', 'XHTML — 1.1', <<-'TXT', uuid: '5CE8FC6E-A802-11D9-BFC8-000D93C8BE28', file: 'DocType XHTML 1.1'
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
	"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

TXT

  tab 'fieldset', 'Fieldset', <<-'TXT', uuid: '9BD2BE01-A854-4D55-B584-725D04C075C0', bundle_uuid: '4676FC6D-6227-11D9-BFB1-000D93589AF6'
<fieldset id="${1/[[:alpha:]]+|( )/(?1:_:\L$0)/g}" ${2:class="${3:}"}>
	<legend>${1:$TM_SELECTED_TEXT}</legend>

	$0
</fieldset>
TXT

  tab 'form', 'Form', <<-'TXT', uuid: '232C2E8B-A08E-11D9-A5A2-000D93C8BE28', file: 'XHTML ˂form˃'
<form action="${1:${TM_FILENAME/(.*?)\..*/$1_submit/}}" method="${2:get}" accept-charset="utf-8">
	$0

	<p><input type="submit" value="Continue &rarr;"${TM_XHTML}></p>
</form>
TXT

  tab 'h1', 'Heading', <<-'TXT', scope: 'text.html - meta.tag, text.html meta.tag & R:punctuation.definition.tag.html', uuid: '65BA66DC-A07F-11D9-A5A2-000D93C8BE28', file: 'XHTML ˂h1˃'
<h1 id="${1/[[:alpha:]]+|( )/(?1:_:\L$0)/g}">${1:$TM_SELECTED_TEXT}</h1>
TXT

  tab 'head', 'Head', <<-'TXT', scope: 'text.html - text.html source', uuid: '9CF008C4-A086-11D9-A5A2-000D93C8BE28', file: 'XHTML ˂head˃'
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8"${TM_XHTML}>
	<title>${1:${TM_FILENAME/((.+)\..*)?/(?2:$2:Page Title)/}}</title>
	$0
</head>
TXT

  tab 'input', 'Input', <<-'TXT', uuid: '44180979-A08E-11D9-A5A2-000D93C8BE28', file: 'XHTML   ˂input˃'
<input type="${1|text,submit,hidden,button|}" name="${2:some_name}" value="$3"${4: id="${5:$2}"}${TM_XHTML}>
TXT

  tab 'input', 'Input with Label', <<-'TXT', uuid: 'D8DCCC81-749A-4E2A-B4BC-D109D5799CAA', bundle_uuid: '4676FC6D-6227-11D9-BFB1-000D93589AF6'
<label for="${2:${1/[[:alpha:]]+|( )/(?1:_:\L$0)/g}}">$1</label><input type="${3|text,submit,hidden,button|}" name="${4:$2}" value="$5"${6: id="${7:$2}"}${TM_XHTML}>

TXT

  tab 'link', 'Link', <<-'TXT', uuid: '77BFD0C0-A08A-11D9-A5A2-000D93C8BE28', file: 'XHTML ˂link˃'
<link rel="${1:stylesheet}" href="${2:/css/master.css}" type="text/css" media="${3|screen,all,braille,embossed,handheld,print,projection,speech,tty,tv|}" title="${4:no title}" charset="${5:utf-8}"${TM_XHTML}>
TXT

  tab 'mailto', 'Mail Anchor', <<-'TXT', uuid: '81DA4C74-A530-11D9-9BCD-000D93C8BE28', file: 'XHTML ˂a mailto˸ ˃'
<a href="mailto:${1:joe@example.com}?subject=${2:feedback}">${3:email me}</a>
TXT

  tab 'meta', 'Meta', <<-'TXT', uuid: 'DA99AC44-A083-11D9-A5A2-000D93C8BE28', file: 'XHTML ˂meta˃'
<meta name="${1:name}" content="${2:content}"${TM_XHTML}>
TXT

  tab 'movie', 'Embed QT Movie', <<-'TXT', uuid: '42F15753-9B6D-4DD8-984C-807B94363277', file: 'Embed QT movie (movie)'
<object width="$2" height="$3" classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab">
	<param name="src" value="$1"${TM_XHTML}>
	<param name="controller" value="$4"${TM_XHTML}>
	<param name="autoplay" value="$5"${TM_XHTML}>
	<embed src="${1:movie.mov}"
		width="${2:320}" height="${3:240}"
		controller="${4:true}" autoplay="${5:true}"
		scale="tofit" cache="true"
		pluginspage="http://www.apple.com/quicktime/download/"
	${TM_XHTML}>
</object>
TXT

  tab 'opt', 'Option', <<-'TXT', uuid: '5820372E-A093-4F38-B25C-B0CCC50A0FC4', bundle_uuid: '4676FC6D-6227-11D9-BFB1-000D93589AF6'
<option${1: value="${2:option}"}>${3:$2}</option>
TXT

  tab 'script', 'Script', <<-'TXT', uuid: '6592050A-A087-11D9-A5A2-000D93C8BE28', file: 'XHTML ˂script˃'
<script type="text/javascript" charset="utf-8">
	$0
</script>
TXT

  tab 'scriptsrc', 'Script With External Source', <<-'TXT', uuid: '7D676C4C-A087-11D9-A5A2-000D93C8BE28', file: 'XHTML ˂script src...˃'
<script src="$1" type="text/javascript" charset="${3:utf-8}"></script>
TXT

  tab 'select', 'Select Box', <<-'TXT', uuid: '26023CFF-C73F-4EF5-9803-E4DBA2CBEADD', bundle_uuid: '4676FC6D-6227-11D9-BFB1-000D93589AF6'
<select name="${1:some_name}" id="${2:$1}"${3:${4: multiple}${5: onchange="${6:}"}${7: size="${8:1}"}}>
	<option${9: value="${10:option1}"}>${11:$10}</option>
	<option${12: value="${13:option2}"}>${14:$13}</option>${15:}
	$0
</select>
TXT

  tab 'style', 'Style', <<-'TXT', uuid: '3C518074-A088-11D9-A5A2-000D93C8BE28', file: 'XHTML ˂style˃'
<style type="text/css" media="screen">
	$0
</style>
TXT

  tab 'table', 'Table', <<-'TXT', uuid: '57176082-A12F-11D9-A5A2-000D93C8BE28', file: 'XHTML ˂table˃'
<table border="${1:0}"${2: cellspacing="${3:5}" cellpadding="${4:5}"}>
	<tr><th>${5:Header}</th></tr>
	<tr><td>${0:Data}</td></tr>
</table>
TXT

  tab 'textarea', 'Text Area', <<-'TXT', uuid: 'AAC9D7B8-A12C-11D9-A5A2-000D93C8BE28', file: 'XHTML   ˂textarea˃'
<textarea name="${1:Name}" rows="${2:8}" cols="${3:40}">$0</textarea>
TXT

  tab 'title', 'Title', <<-'TXT', scope: 'text.html - text.blog', uuid: 'B62ECABE-A086-11D9-A5A2-000D93C8BE28', file: 'XHTML ˂title˃'
<title>${1:${TM_FILENAME/((.+)\..*)?/(?2:$2:Page Title)/}}</title>
TXT

end