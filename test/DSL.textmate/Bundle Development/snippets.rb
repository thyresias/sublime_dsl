# encoding: utf-8

snippets do

  default_scope 'source.plist.textmate.grammar'
  file_format :textmate

  key "'", 'Grammar - Single Quotes', <<-'TXT', scope: 'source.plist.textmate.grammar string.quoted.single, source.plist.textmate.grammar string.regexp.oniguruma.single', uuid: '012C6C9B-07CC-40B8-A10B-B95B253A94A1'
''
TXT

  tab 'beg', 'Rule — Begin / End', <<-'TXT', scope: 'source.plist.textmate.grammar meta.array.patterns', uuid: '0D8A14ED-0701-4AD8-8A9C-15AD1BA60D8D', file: 'Rule (Begin ˸ End)'
{	name = '${1:name}';
	begin = '$2';
	end = '$3';
},
TXT

  tab 'beg', 'Rule — Begin / End (Inside Rule)', <<-'TXT', scope: 'source.plist.textmate.grammar meta.dictionary.rule', uuid: '1473BF02-466B-4F5F-B694-81703E4B6E76', file: 'Rule — Begin ˸ End (Inside Rule)'
begin = '$1';
end = '$2';
TXT

  tab 'beg', 'Rule — Begin / End (Repository)', <<-'TXT', scope: 'source.plist.textmate.grammar meta.dictionary.repository.plist $', uuid: 'A611946B-D67F-4B16-ABC7-ECBBCC0F6331', file: 'Rule (Repository)'
${1:rule_name} = {
	name = '${2:name}';
	begin = '$3';
	end = '$4';
};
TXT

  tab 'begcap', 'Begin Captures', <<-'TXT', uuid: '3E5051E7-18CF-4BD4-89A5-045416831972'
beginCaptures = {
	1 = { name = '$1'; };
};
TXT

  tab 'cap', 'Captures', <<-'TXT', uuid: '8C3D6E62-E865-4655-9B20-E3B95F07F9B6'
captures = {
	1 = { name = '$1'; };
};
TXT

  tab 'com', 'Comment', <<-'TXT', uuid: '1CB08CB5-7CBE-4A5D-A69B-DC04244838C4'
comment = '$0';
TXT

  tab 'connam', 'Content Name', <<-'TXT', uuid: 'D738436A-B700-4299-A7D7-A242BDDF3A67'
contentName = '$1';
TXT

  tab 'dis', 'Disable', <<-'TXT', uuid: '7534A315-9A3D-449B-9AD0-DE603A77C356'
disabled = 1;
TXT

  tab 'endcap', 'End Captures', <<-'TXT', uuid: '36B66AAB-42A5-4366-B7C1-790A749181D4'
endCaptures = {
	1 = { name = '$1'; };
};
TXT

  tab 'env', "ENV['TM_…']", <<-'TXT', scope: 'source.ruby', uuid: '19C1DA95-E682-4FE1-973F-00994065C520'
ENV['TM_${1:S}${1/^(S)|(B)$|.*/(?1:UPPORT_PATH:(?2:UNDLE_SUPPORT))/}']
TXT

  tab 'inc', 'Rule — Include', <<-'TXT', uuid: 'D5BA7FE7-543F-47FC-BECD-750200B81762', file: 'Include'
{	include = '$1'; },
TXT

  tab 'mat', 'Rule — Match', <<-'TXT', scope: 'source.plist.textmate.grammar meta.array.patterns', uuid: 'D9B7683F-308C-4A42-92FB-6DFC06240A92', file: 'Match'
{	name = '${1:name}';
	match = '${2:pattern}';
},
TXT

  tab 'mat', 'Rule — Match (Inside Rule)', <<-'TXT', scope: 'source.plist.textmate.grammar meta.dictionary.rule', uuid: 'C145B244-D9A6-43C6-9011-B84D00F7FE96'
match = '${1:pattern}';
TXT

  tab 'mat', 'Rule — Match (Repository)', <<-'TXT', scope: 'source.plist.textmate.grammar meta.dictionary.repository.plist $', uuid: 'FD59E166-A9BD-40FD-821F-E8AFEA5175A0'
${1:rule_name} = {
	name = '${2:name}';
	match = '${3:pattern}';
};
TXT

  tab 'nam', 'Name', <<-'TXT', uuid: 'EF6B4C87-F1A9-4D06-8712-587857CC3D5E'
name = '$1';
TXT

  tab 'pat', 'Patterns', <<-'TXT', uuid: '4AB06A04-02CF-4E7B-9E7E-07747A68160C'
patterns = (
	$0
);
TXT

  tab 'pat', 'Patterns (Repository)', <<-'TXT', scope: 'source.plist.textmate.grammar meta.dictionary.repository $', uuid: 'D07ABF67-A3E1-4454-BAEE-FF5C349CB049'
${1:rule_name} = {
	patterns = (
		$0
	);
};
TXT

  tab 'rep', 'Repository', <<-'TXT', uuid: 'A9191F2E-8FAC-41B9-B729-9663E42452DD'
repository = {
	${1:rule_name} = {
		$0
	};
};
TXT

  tab 'sup', "Require 'Support/lib/…'", <<-'TXT', scope: 'source.ruby', uuid: '526FEEF9-9C52-4165-B814-7DAB441084D5', file: "Require 'Support˸lib˸…'"
require ENV['TM_${1:S}${1/^(S)|(B)$|.*/(?1:UPPORT_PATH:(?2:UNDLE_SUPPORT))/}'] + '/lib/$2'
TXT

end