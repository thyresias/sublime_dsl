# encoding: utf-8

preferences 'Comments' => 'source.sql' do
  shell_variable 'TM_COMMENT_START', '-- '
  shell_variable 'TM_COMMENT_START_2', '/*'
  shell_variable 'TM_COMMENT_END_2', '*/'
  uuid "C9969F41-A409-4118-8753-CA95A9228FF7"
end

preferences 'Folding' => 'source.sql' do
  folding_start_marker %r/\s*\(\s*$/
  folding_stop_marker %r/^\s*\)/
  uuid "497AB342-09C2-4911-A2A0-24564AFB058C"
end

preferences 'Miscellaneous' => 'source.sql' do
  decrease_indent_pattern %r/\)(?!=.*\()/
  increase_indent_pattern %r/^\s*(create|grant|insert|delete|update)\b|\((?!.*\))/
  uuid "9C3A0A63-E661-4B0B-855B-710EDBBDB00F"
end

preferences 'Symbol List: Function' => 'source.sql meta.create.sql, source.sql meta.drop.sql, source.sql meta.alter.sql' do
  show_in_symbol_list true
  symbol_transformation 's/^\s*(\w+[\w\s]+\w+)\s*/$1/'
  uuid "34DC5EC7-214B-410C-B03A-1069D6436541"
end
