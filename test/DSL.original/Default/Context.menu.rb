# encoding: utf-8

menu 'Context' do

  item copy
  item cut
  item paste
  item '-', id: 'selection'
  item select_all
  item '-', id: 'file'
  item 'Open in Browser', open_in_browser
  item 'Open Containing Folder…', open_dir("$file_path", file: "$file_name")
  item 'Copy File Path', copy_path
  item 'Reveal in Side Bar', reveal_in_side_bar
  item '-', id: 'end'

end
