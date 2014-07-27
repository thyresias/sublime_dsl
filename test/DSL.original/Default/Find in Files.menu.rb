# encoding: utf-8

menu 'Find in Files' do

  item 'Clear', clear_location
  item 'Add Folder', add_directory
  item 'Add Include Filter', add_where_snippet("*.${0:txt}")
  item 'Add Exclude Filter', add_where_snippet("-*.${0:txt}")
  item 'Add Open Folders', add_where_snippet("<open folders>")
  item 'Add Open Files', add_where_snippet("<open files>")

end
