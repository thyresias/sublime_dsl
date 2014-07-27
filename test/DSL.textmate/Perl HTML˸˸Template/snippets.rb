# encoding: utf-8

snippets do

  default_scope 'text.html.html-template'
  file_format :textmate

  tab 'if', 'If', <<-'TXT', uuid: '907E21D1-ACD9-4CB6-9C20-C1BA813BFAED'
<TMPL_IF NAME="$1">
	$2
</TMPL_IF>
TXT

  tab 'ife', 'If-Else', <<-'TXT', uuid: '22A827CA-B0B7-4468-9FCD-95B5842ABF90'
<TMPL_IF NAME="$1">
	$2
<TMPL_ELSE>
	$3
</TMPL_IF>
TXT

  tab 'inc', 'Include', <<-'TXT', uuid: '30FBFAAA-B7E5-4A2B-8092-C8367C0838B9'
<TMPL_INCLUDE NAME="$1">
TXT

  tab 'loop', 'Loop', <<-'TXT', uuid: '857B0182-F407-4ADC-B166-463C47A0369B'
<TMPL_LOOP NAME="$1">
	$2
</TMPL_LOOP>
TXT

  tab 'unless', 'Unless', <<-'TXT', uuid: '826B32E3-9913-4D02-95E7-65716121F1F4'
<TMPL_UNLESS NAME="$1">
	$2
</TMPL_UNLESS>
TXT

  tab 'var', 'Var', <<-'TXT', uuid: 'AA7F838B-1706-4373-8AD4-9FD1796C838F'
<TMPL_VAR NAME="$1"${2:${3: DEFAULT="$4"}${5: ESCAPE="${6:html|js|url|none}"}}>
TXT

end