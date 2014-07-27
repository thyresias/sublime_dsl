# encoding: utf-8

snippets do

  default_scope 'text.gtdalt - meta.action - meta.line.project'
  file_format :textmate

  key "!", 'New', <<-'TXT', uuid: '98227572-90C0-43C5-A18B-EA2591674553', file: 'new project'
project ${1:project_name}
	$0
end
TXT

  key "^n", 'New Link', <<-'TXT', scope: 'text.gtdalt meta.note', uuid: '74B7D57C-F538-41BE-A228-1F077EC8F3B4', file: 'Note With Link'
${1:note comment }<${2:http://$3}>$0
TXT

end