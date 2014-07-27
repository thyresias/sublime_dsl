# encoding: utf-8

snippets do

  default_scope 'text.html.django'
  file_format :textmate

  key "@|", 'add', <<-'TXT', uuid: 'AB73645D-3A5D-41F0-9E91-15662F41EC03'
|add:"${1:arg}"
TXT

  key "@|", 'addslashes', <<-'TXT', uuid: '7B68FB0B-DCA8-4F87-99B6-9724565D93B6'
|addslashes
TXT

  key "^%", 'Block tag', <<-'TXT', uuid: '10C0357D-EB2C-4CC7-B361-391A35AE3C2E'
{% $1 %}
TXT

  key "@|", 'center', <<-'TXT', uuid: '9E3A8849-E139-4980-B8DD-12DCD2A48759'
|center:"${1:arg}"
TXT

  key "^#", 'Comment tag', <<-'TXT', uuid: '8C303CB4-D2DC-4DEA-9CF6-B8E24C021646'
{# $1 #}
TXT

  key "@|", 'cut', <<-'TXT', uuid: '14D09248-0188-454B-855C-F1257B294CB4'
|cut:"${1:arg}"
TXT

  key "@|", 'date', <<-'TXT', uuid: '2D2308F8-0A20-4DA3-A3FE-F2A2624C2D42'
|date:"${1:arg}"
TXT

  key "@|", 'default', <<-'TXT', uuid: 'DAEDC0E9-6CEB-414F-B73D-C1852EE63EF0'
|default:"${1:arg}"
TXT

  key "@|", 'default_if_none', <<-'TXT', uuid: '932D0D13-5A05-4012-8842-1B45518EB40B'
|default_if_none:"${1:arg}"
TXT

  key "@|", 'dictsort', <<-'TXT', uuid: 'F50F598F-CDC3-471F-BDDF-97C509DE614E'
|dictsort:"${1:arg}"
TXT

  key "@|", 'dictsortreversed', <<-'TXT', uuid: '5906D2C8-C525-4DC7-91D8-106C1CA2C2F9'
|dictsortreversed:"${1:arg}"
TXT

  key "@|", 'divisibleby', <<-'TXT', uuid: 'C272E2FA-3C95-4E0B-AD08-BF231835D06D'
|divisibleby:"${1:arg}"
TXT

  key "@|", 'escape', <<-'TXT', uuid: 'E5A5C098-E378-41BD-B1AA-17DF82ED17FC'
|escape
TXT

  key "@|", 'filesizeformat', <<-'TXT', uuid: '250D4CEF-9E9C-4271-8122-CBF206356CC0'
|filesizeformat
TXT

  key "@|", 'first', <<-'TXT', uuid: '3CC5EA3A-EE93-47AD-87D7-9D49A5379EF0'
|first
TXT

  key "@|", 'fix_ampersands', <<-'TXT', uuid: '86508EA3-75A8-452D-B2DE-EF98A5EEF693'
|fix_ampersands
TXT

  key "@|", 'floatformat', <<-'TXT', uuid: '59274168-F721-4805-9137-28446DA86DD3'
|floatformat
TXT

  key "@|", 'get_digit', <<-'TXT', uuid: '076CA943-A3D7-48DD-BC43-040F129A97F3'
|get_digit:"${1:arg}"
TXT

  key "@|", 'join', <<-'TXT', uuid: '30FA38E8-6FE4-4D8B-A82C-B8C43D03DB2F'
|join:"${1:arg}"
TXT

  key "@|", 'length', <<-'TXT', uuid: '6F149077-E77A-4AF9-B67F-79042371A746'
|length
TXT

  key "@|", 'length_is', <<-'TXT', uuid: '0A450EBA-2893-4D35-891F-EE3B6F076021'
|length_is:"${1:arg}"
TXT

  key "@|", 'linebreaks', <<-'TXT', uuid: '3B6FFE93-3DE2-4460-B1FD-9CBE63854A44'
|linebreaks
TXT

  key "@|", 'linebreaksbr', <<-'TXT', uuid: '0B30C56C-EF65-4640-912C-374D8FF68381'
|linebreaksbr
TXT

  key "@|", 'linenumbers', <<-'TXT', uuid: '16D7D6F9-242A-4571-B6A2-3604A7BAE398'
|linenumbers
TXT

  key "@|", 'ljust', <<-'TXT', uuid: '20F103B1-6373-4FA0-ACC0-5DF35755ADEF'
|ljust:"${1:arg}"
TXT

  key "@|", 'lower', <<-'TXT', uuid: '8B205CAC-96AA-4CC7-A875-AB647EF6353A'
|lower
TXT

  key "@|", 'make_list', <<-'TXT', uuid: 'E7A6A8B8-A6CA-4BDC-AD25-55F7D6462308'
|make_list
TXT

  key "@|", 'phone2numeric', <<-'TXT', uuid: '19C0FE80-5666-4DFC-B274-258F069503BC'
|phone2numeric
TXT

  key "@|", 'pluralize', <<-'TXT', uuid: 'AF735D35-B8FF-4BE0-9FFC-180E73573DC9'
|pluralize
TXT

  key "@|", 'pprint', <<-'TXT', uuid: '2F4F8AE7-F786-46B1-8E86-CF50E4EF8C96'
|pprint
TXT

  key "@|", 'random', <<-'TXT', uuid: '3C750EC7-68C8-4245-9E15-504EFF865D84'
|random
TXT

  key "@|", 'removetags', <<-'TXT', uuid: '34D4F7AF-882F-4EAA-A1C3-07BCCF5DE008'
|removetags:"${1:arg}"
TXT

  key "@|", 'rjust', <<-'TXT', uuid: '88DB3CCF-043C-4D30-8588-4A02F391D8FB'
|rjust:"${1:arg}"
TXT

  key "@|", 'slice', <<-'TXT', uuid: 'C57E295B-17FB-4C26-9811-A7E82E05E43E'
|slice:"${1:arg}"
TXT

  key "@|", 'slugify', <<-'TXT', uuid: '6AE79495-5383-46B5-A3E5-54E8F90C3515'
|slugify
TXT

  key "@|", 'stringformat', <<-'TXT', uuid: '138DCEBC-3854-434B-A868-EF511CD058E2'
|stringformat:"${1:arg}"
TXT

  key "@|", 'striptags', <<-'TXT', uuid: '34AF2936-530E-4D6D-9E80-A157FE62F94F'
|striptags
TXT

  key "@|", 'time', <<-'TXT', uuid: '73946DBF-73C4-44D1-A6E3-A4FD161E392E'
|time:"${1:arg}"
TXT

  key "@|", 'timesince', <<-'TXT', uuid: 'B9652A80-C5BA-4984-B197-44FB2536B6E6'
|timesince
TXT

  key "@|", 'title', <<-'TXT', uuid: 'C61485BB-19B4-4975-965F-7BC4A03E24F8'
|title
TXT

  key "@|", 'truncatewords', <<-'TXT', uuid: 'B7173D17-A015-4E93-81AB-ADCDE49672B6'
|truncatewords:"${1:arg}"
TXT

  key "@|", 'unordered_list', <<-'TXT', uuid: 'C82E59E1-850D-4398-A2F1-6C1F03DD96BA'
|unordered_list
TXT

  key "@|", 'upper', <<-'TXT', uuid: '2C233CCC-B683-447A-B513-80728B25FFCB'
|upper
TXT

  key "@|", 'urlencode', <<-'TXT', uuid: '5304DE26-6752-4B58-8E15-A160F7C00725'
|urlencode
TXT

  key "@|", 'urlize', <<-'TXT', uuid: '9CB3A992-3D7E-4C4F-AFB3-ABD22FCB23F9'
|urlize
TXT

  key "@|", 'urlizetrunc', <<-'TXT', uuid: 'BA12F855-9E5C-4B4F-AFB6-A992D62B94C4'
|urlizetrunc:"${1:arg}"
TXT

  key "^{", 'Variable tag', <<-'TXT', uuid: '392C9A9F-2264-421D-9EAB-95CE16481B1B'
{{ $1 }}
TXT

  key "@|", 'wordcount', <<-'TXT', uuid: '6BC31FF7-5C04-4B50-B01B-FDEEC28C2432'
|wordcount
TXT

  key "@|", 'wordwrap', <<-'TXT', uuid: '649D2F54-31CB-4577-862E-E38593334D4A'
|wordwrap:"${1:arg}"
TXT

  key "@|", 'yesno', <<-'TXT', uuid: '20F0FE5C-BF8C-4258-8F93-3D6F62447068'
|yesno:"${1:arg}"
TXT

  tab '%}', 'templatetag: closeblock', <<-'TXT', uuid: '549349F9-DE08-4871-8C6E-F77FBF44DEAE'
{% templatetag closeblock %}
TXT

  tab 'autoescape', 'autoescape', <<-'TXT', uuid: '4D1DEEF8-0CFA-41FA-9F7C-D985E556B000'
{% autoescape ${1:off} %}
	$2
{% endautoescape %}
TXT

  tab 'block', 'block', <<-'TXT', uuid: '0E149492-0900-409F-9C63-940D1DF8997A'
{% block $1 %}$2{% endblock $1 %}
TXT

  tab 'blocktrans', 'blocktrans', <<-'TXT', uuid: '79E37710-CEE2-4C76-BB44-606C7679AD32'
{% blocktrans ${1:with ${2:var1} as ${3:var2}} %}
	$4{{ $3 }}
{% endblocktrans %}
TXT

  tab 'comment', 'comment', <<-'TXT', uuid: '25252B01-659D-462B-978D-CAE0221B075A'
{% comment %}
	$1
{% endcomment %}
TXT

  tab 'cycle', 'cycle', <<-'TXT', uuid: '6077AFA6-98D5-4FC9-AF39-4A65432433E8'
{% cycle $1 as $2 %}
TXT

  tab 'debug', 'debug', <<-'TXT', uuid: '813FEE58-FAF2-4031-9E13-26168E30B6F3'
{% debug %}
TXT

  tab 'else', 'else', <<-'TXT', uuid: 'A8377C14-2E0A-4227-A6A7-3B40EB918D7F'
{% else %}
TXT

  tab 'extends', 'extends', <<-'TXT', uuid: 'D6B96F8C-4001-4BF6-B219-533161CA6788'
{% extends "$1" %}
TXT

  tab 'filter', 'filter', <<-'TXT', uuid: '62F689B9-6665-44E8-9DCB-C1766018B369'
{% filter $1 %}
	$2
{% endfilter %}
TXT

  tab 'firstof', 'firstof', <<-'TXT', uuid: '8DAC9E08-BCE8-4520-96D5-0FDBAF86BA02'
{% firstof $1 %}
TXT

  tab 'for', 'for', <<-'TXT', uuid: '92042F5E-409D-47EC-BD2E-D436C4590241'
{% for $1 in $2 %}
	$3
{% endfor %}
TXT

  tab 'if', 'if', <<-'TXT', uuid: 'BD0117AD-3FE8-4E5D-B935-43DB3DD784E7'
{% if $1 %}$0{% endif %}
TXT

  tab 'ifchanged', 'ifchanged', <<-'TXT', uuid: '3EAFA3AA-41D8-4C42-9D04-1FFB716EBAF0'
{% ifchanged %}$0{% endifchanged %}
TXT

  tab 'ifequal', 'ifequal', <<-'TXT', uuid: 'CC3B379B-1273-41EB-BBE9-36E40A5432D7'
{% ifequal $1 $2 %}$0{% endifequal %}
TXT

  tab 'ifnotequal', 'ifnotequal', <<-'TXT', uuid: '36532EE4-CF10-48BB-B450-0A904F650668'
{% ifnotequal $1 $2 %}$0{% endifnotequal %}
TXT

  tab 'include', 'include', <<-'TXT', uuid: '325B51A6-E4EA-4801-A0A4-48DA7FEA81D7'
{% include "$1" %}
TXT

  tab 'load', 'load', <<-'TXT', uuid: '57A1CF54-7CA4-4ED2-A2F4-AFE0CF89D146'
{% load $1 %}
TXT

  tab 'now', 'now', <<-'TXT', uuid: 'DD04692C-3D83-419E-8DEF-A69EE466426D'
{% now "$1" %}
TXT

  tab 'regroup', 'regroup', <<-'TXT', uuid: '3E8EC5B9-FF4F-4441-88A7-63C6844E1635'
{% regroup $1 by $2 as $3 %}
TXT

  tab 'spaceless', 'spaceless', <<-'TXT', uuid: '232B562F-564F-48A8-A714-6BF1924E3C7A'
{% spaceless %}$0{% endspaceless %}
TXT

  tab 'ssi', 'ssi', <<-'TXT', uuid: '617F3D96-F893-4BE6-8AE5-B4B35E1DD7DC'
{% ssi $1 ${2:parsed} %}
TXT

  tab 'super', 'super', <<-'TXT', uuid: '73B14781-84AF-4B1D-9C43-01C0B2DCE9F9'
{{ block.super }}
TXT

  tab 'trans', 'trans', <<-'TXT', uuid: 'A3262BEA-D000-4AF3-832F-90FC6533EAC9'
{% trans "${1:${TM_SELECTED_TEXT:string to translate}}" %}
TXT

  tab 'url', 'url', <<-'TXT', uuid: '7E005925-3346-4AA4-B8BB-49A938BA192A'
{% url ${1:package.module.view_fn} ${2:value1,kwarg=value2} %}
TXT

  tab 'widthratio', 'widthratio', <<-'TXT', uuid: '17F3AFB0-F5BB-4C25-A5BE-454E5C929B67'
{% widthratio ${1:this_value} ${2:max_value} ${3:100} %}
TXT

  tab 'with', 'with', <<-'TXT', uuid: 'BA43AB3C-3FB5-4C01-B7B8-35D2617E3895'
{% with ${1:var} as ${2:name} %}{{ ${3:$2} }}{% endwith %}
TXT

  tab '{%', 'templatetag: openblock', <<-'TXT', uuid: '43F0FCA9-1E10-4286-9D41-02F6065A6E8E'
{% templatetag openblock %}
TXT

  tab '{{', 'templatetag: openvariable', <<-'TXT', uuid: '261F0951-914C-4D24-824F-7D78FE9BF1F6'
{% templatetag openvariable %}
TXT

  tab '}}', 'templatetag: closevariable', <<-'TXT', uuid: '373F257A-070E-4A98-90F9-573D4CF559D6'
{% templatetag closevariable %}
TXT

end