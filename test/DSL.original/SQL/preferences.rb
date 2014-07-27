# encoding: utf-8

preferences 'Comments' => 'source.sql' do
  shell_variable 'TM_COMMENT_START', '-- '
  shell_variable 'TM_COMMENT_START_2', '/*'
  shell_variable 'TM_COMMENT_END_2', '*/'
  uuid "C9969F41-A409-4118-8753-CA95A9228FF7"
end

preferences 'Miscellaneous' => 'source.sql' do
  decrease_indent_pattern %r/\)(?!=.*\()/
  increase_indent_pattern %r/^\s*(create|grant|insert|delete|update)\b|\((?!.*\))/
  uuid "9C3A0A63-E661-4B0B-855B-710EDBBDB00F"
end
