# encoding: utf-8

snippets do

  default_scope 'source.prolog'
  file_format :textmate

  tab 'dcg', 'DCG', <<-'TXT', uuid: '614B6B00-F2FC-4B72-AB99-2E69D81950C4', file: 'DSG'
${1:clause} --> ${0:body}.
TXT

  tab 'dcg', 'DCG', <<-'TXT', uuid: '238E350A-E0E6-45F3-A3C4-0E94D708F1E0'
${1:clause} --&gt; ${0:body}.
TXT

  tab 'fact', 'Fact', <<-'TXT', uuid: '8424158B-AD81-40F3-BCFD-B0D8FB1ED80D'
${1:functor_name}(${2:argument}).
TXT

  tab 'rule', 'Rule', <<-'TXT', uuid: 'E5A401DA-D74A-4F41-AA4C-AA2FDF7A13C3'
${1:functor_name}(${2:argument}) :-
	${0:%% body}
TXT

end