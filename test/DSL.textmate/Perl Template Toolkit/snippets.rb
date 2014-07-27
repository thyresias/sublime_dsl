# encoding: utf-8

snippets do

  default_scope 'text.html.tt'
  file_format :textmate

  tab 'for', 'for', <<-'TXT', uuid: '89E2CD88-5E20-4A30-988A-F9AA1FFDED09'
[% FOR ${1:var} IN ${2:set} %]
	$3
[% END %]
TXT

  tab 'if', 'if', <<-'TXT', uuid: '30C5E785-BD38-4ECD-8F1E-E57E46D96659'
[% IF ${1:condition} %]
	$2
[% ELSE %]
	$3
[% END %]
TXT

  tab 'inc', 'include', <<-'TXT', uuid: '524B72D0-7196-4D65-AC9B-0F56F7FC94B0'
[% INCLUDE ${1:template} %]
TXT

  tab 'unl', 'unless', <<-'TXT', uuid: '956498D2-745E-4C23-8463-702DF93FA1E5'
[% UNLESS ${1:condition} %]
	$2
[% END %]
TXT

  tab 'wrap', 'wrapper', <<-'TXT', uuid: '57559761-BE40-418E-A0CB-BDED1020A3BD'
[% WRAPPER ${1:template} %]
	$2
[% END %]
TXT

end