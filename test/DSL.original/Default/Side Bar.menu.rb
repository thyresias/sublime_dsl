# encoding: utf-8

menu 'Side Bar' do

  item 'New File', new_file_at(dirs: [])
  item 'Rename…', rename_path(paths: [])
  item 'Delete File', delete_file(files: [])
  item 'Open Containing Folder…', open_containing_folder(files: [])
  item '-', id: 'folder_commands'
  item 'New Folder…', new_folder(dirs: [])
  item 'Delete Folder', delete_folder(dirs: [])
  item 'Find in Folder…', find_in_folder(dirs: [])
  item '-', id: 'end'

end
