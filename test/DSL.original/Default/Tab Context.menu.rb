# encoding: utf-8

menu 'Tab Context' do

  item 'Close', close_by_index(group: -1, index: -1)
  item 'Close others', close_others_by_index(group: -1, index: -1)
  item 'Close tabs to the right', close_to_right_by_index(group: -1, index: -1)
  item '-'
  item new_file
  item 'Open file', prompt_open_file

end
