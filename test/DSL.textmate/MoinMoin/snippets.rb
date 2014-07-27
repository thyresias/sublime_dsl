# encoding: utf-8

snippets do

  default_scope 'text.moinmoin'
  file_format :textmate

  key "@b", 'Bold', <<-'TXT', semantic_class: 'style.strong.moinmoin', uuid: '972BABC2-5EF0-4964-B284-6BB9D143B6F5'
'''$TM_SELECTED_TEXT'''
TXT

  key "^\n", 'Hard Linebreak', <<-'TXT', uuid: '68CC62AA-2C82-4949-9A24-C207A4C2829D'


TXT

  key "@i", 'Italic', <<-'TXT', semantic_class: 'style.emphasis.moinmoin', uuid: '8202AA96-A1FE-4A42-9155-DC68FD403386'
''$TM_SELECTED_TEXT''
TXT

  key "^P", 'Pre', <<-'TXT', uuid: '012F6200-6096-4478-B89D-0F5BF4FC1C49'
{{{
$TM_SELECTED_TEXT}}}
TXT

  tab '=', 'Heading Level 1', <<-'TXT', uuid: '78179C9F-3C08-4E7B-A9FB-3CC5F645B3A1'
= $1 =

$0

TXT

  tab '=', 'Heading Level 2', <<-'TXT', uuid: '554F9921-959C-437D-9117-36AF2F743AA7'
== $1 ==

$0

TXT

  tab '=', 'Heading Level 3', <<-'TXT', uuid: '736E67AD-8DE8-4D3C-8151-7076F1D60DDB'
=== $1 ===

$0

TXT

  tab '=', 'Heading Level 4', <<-'TXT', uuid: '4D3A8582-EA02-4EFD-A075-FB07A27874AA'
==== $1 ====

$0

TXT

  tab '=', 'Heading Level 5', <<-'TXT', uuid: 'F6F9161C-4BC4-47E3-AED9-30FDC4BBFE56'
===== $1 =====

$0

TXT

  tab 'Date', 'Date', <<-'TXT', uuid: 'AC5A02A5-8991-449B-937D-E5253C93EE74'
`TZ=UTC date '+[[Date(%Y-%m-%dT%H:%m:%SZ)]]'`
TXT

end