# encoding: utf-8

snippets do

  default_scope 'source.smarty'
  file_format :textmate

  tab '{assign', 'Assign', <<-'TXT', uuid: 'D94473F0-DE96-405A-B2BB-8C9ADECF5C2A', file: 'smty.assign'
{assign var=$1 value=$2
TXT

  tab '{capture', 'Capture', <<-'TXT', uuid: 'D133AAD0-4E0A-45A7-B67B-43456AF97CB2', file: 'smty.capture'
{capture${1: name=$2}${3: assign=$4}}$0{/capture
TXT

  tab '{config_load', 'Config Load', <<-'TXT', uuid: '9193BA95-97D0-4399-9DDC-8E31A56F206A', file: 'smty.config_load'
{config_load file="$1"${2: section="$3"}${4: scope="${5:local|parent|global}"}
TXT

  tab '{counter', 'Counter', <<-'TXT', uuid: 'A51A1937-0FB5-4028-8AF5-D3DFF921DC96', file: 'smty.counter'
{counter name="$1" start=${2:1}${3: skip=${4:2}}${5: assign="${6}"}
TXT

  tab '{cycle', 'Cycle', <<-'TXT', uuid: '0A272099-C1BD-4871-8C6A-0CE3947CADCC', file: 'smty.cycle'
{cycle values="${1:on},${2:off}"${3: name="${4:name}"}
TXT

  tab '{fetch', 'Fetch', <<-'TXT', uuid: 'ACE8EDA7-D834-42B5-90E5-C49486259986', file: 'smty.fetch'
{fetch file="${1:filename}"${2: assign=${3:var}}
TXT

  tab '{foreach', 'Foreach', <<-'TXT', uuid: 'E303E1BB-6C73-4CE0-AD4E-66FA080168D2', file: 'smty.foreach'
{foreach from=\$${1:varname} item=${2:item}${3: key=${4:key}}${5: name=${6:loop1}}}
	$0
{/foreach
TXT

  tab '{if', 'If', <<-'TXT', uuid: 'E9642863-3E55-4276-83AA-6A51BCE7AE4C', file: 'smty.if'
{if $1}
	$0
{/if
TXT

  tab '{inc', 'Include', <<-'TXT', uuid: 'D68BA3F9-D7BE-40E5-9223-71EA2618076F', file: 'smty.include'
{include file="$1"${2: assign=${3:var}}
TXT

  tab '{ld', 'Ldelim', <<-'TXT', uuid: '4321D130-75F2-4A15-BF54-CBE08D3DAE77', file: 'smty.ldelim'
{ldelim
TXT

  tab '{lit', 'Literal', <<-'TXT', uuid: 'AF397507-436C-4AB0-B164-7A84E1F5768B', file: 'smty.literal'
{literal}$1{/literal
TXT

  tab '{math', 'Math', <<-'TXT', uuid: 'F2D973EF-F6F3-4F58-ACB7-24C2D80BA815', file: 'smty.math'
{math equation="${1:1+x}" assign=$2 ${3:x=8}
TXT

  tab '{rd', 'Rdelim', <<-'TXT', uuid: 'C59DF8F8-6E5D-4F5A-BB0D-11EAF2ACD273', file: 'smty.rdelim'
{rdelim}
TXT

  tab '{strip', 'Strip', <<-'TXT', uuid: '37361D86-BED2-43BB-A173-01607C489346', file: 'smty.strip 2'
{strip}
	$1
{/strip
TXT

  tab '|cap', 'Capitalize', <<-'TXT', uuid: 'F68F299E-A8DC-4E77-88DB-C0956D990838', file: 'smty.capitalize'
|capitalize
TXT

  tab '|cat', 'Cat', <<-'TXT', uuid: 'E021BE07-0188-48AB-870F-56A00D7688C5', file: 'smty.cat'
|cat:"${1:lorem ipsum}"
TXT

  tab '|count', 'Count Characters', <<-'TXT', uuid: '27D0C8AD-4DB1-4B7D-AA66-3975F118280E', file: 'smty.count_characters '
|count_characters
TXT

  tab '|count', 'Count Paragraphs', <<-'TXT', uuid: '9672F018-FF28-44A3-BC83-F531E0C5FC3A', file: 'smty.count_paragraphs'
|count_paragraphs
TXT

  tab '|count', 'Count Sentences', <<-'TXT', uuid: '544E0BFC-4FC5-4CA3-92E7-94BB104010CB', file: 'smty.count_sentences'
|count_sentences
TXT

  tab '|count', 'Count Words', <<-'TXT', uuid: '7C9E548D-E130-4C33-9993-91A6F36D7378', file: 'smty.count_words'
|count_words
TXT

  tab '|def', 'Default', "|default:\"$1\" ", uuid: '1B1ABCA8-8A6D-4DB4-AD18-E64400853873', file: 'smty.default'

  tab '|esc', 'Escape', "|escape:\"${1:html|htmlall|url|quotes|hex|hexentity|javascript}\" ", uuid: '7840DDFE-DADE-47D2-84E6-1D652C186497', file: 'smty.escape'

  tab '|format', 'Date Format', <<-'TXT', uuid: 'D9C6D3F5-ADB6-4028-A679-479927F2E992', file: 'smty.date_format'
|date_format:"${1:%b %e, %Y}"
TXT

  tab '|format', 'String Format', <<-'TXT', uuid: 'F6E2E40A-B7D1-452A-883B-F4BF393ABA30', file: 'smty.string_format'
|string_format:"${1:%.2f}"
TXT

  tab '|regex', 'Regex Replace', <<-'TXT', uuid: 'B2D2BE2D-900B-418F-8414-F90A0A8D8AB0', file: 'smty.regex_replace'
|regex_replace:"/${1:.*}/":"$2"
TXT

  tab '|replace', 'Replace', "|replace:\"${1:needle}\":\"$2\" ", uuid: '35B81F37-5C62-46C2-A6A6-DF2306B8A189', file: 'smty.replace'

  tab '|strip', 'Strip Tags', <<-'TXT', uuid: '6B5B5434-9371-45A5-81D4-F03849AC22F3', file: 'smty.strip_tags'
|strip_tags
TXT

  tab '|trunc', 'Truncate', <<-'TXT', uuid: '761E20DF-7096-4485-B2BF-8479558ADF62', file: 'smty.truncate'
|truncate:${1:80}:${2:"&hellip;"}:${3:false}
TXT

  tab '|wrap', 'Word Wrap', <<-'TXT', uuid: 'A60F4504-9295-4795-A409-D0852DE2E78F', file: 'smty.wordwrap'
|wordwrap:${1:80}${2::"${3:\n}"}
TXT

end