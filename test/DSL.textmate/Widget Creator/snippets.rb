# encoding: utf-8

snippets do

  default_scope 'source.shell'
  file_format :textmate

  # FIXME: no tab trigger nor key equivalent
  key nil, 'Insert Loop to Handle Multiple Arguments', <<-'TXT', uuid: '6D0D2911-4755-46E0-BEAA-05926F4B1CE5'
for arg in "\$@"
do
	#Treat each file dropped on to the widget as "\$arg" in this loop
	${0:$TM_SELECTED_TEXT}
done

TXT

end