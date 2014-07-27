# encoding: utf-8

preferences 'Folding' => 'source.ini' do
  folding_start_marker %r/\[/
  folding_stop_marker %r/\[/
  uuid "28C95F8C-1665-43B5-B8E6-777D17E7765F"
end

preferences 'Miscellaneous' => 'source.ini' do
  disable_indent_corrections true
  highlight_pairs "() [] {}"
  indent_on_paste "simple"
  shell_variable 'TM_COMMENT_START', '; '
  shell_variable 'TM_COMMENT_START_2', '# '
  smart_typing_pairs "() [] {} \"\" ''"
  uuid "B96176DC-70A3-415B-8B5A-315910AA369B"
end

preferences 'Symbol List Items' => 'source.ini entity.name.section.group-title.ini' do
  show_in_symbol_list true
  symbol_transformation 's/^\[(\w+)\]$/  $1/;'
  uuid "44CAEF12-223E-11DB-BE7D-0011242E4184"
end
