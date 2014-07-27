# encoding: utf-8

preferences 'Folding' => 'source.perl' do
  folding_start_marker %r'(/\*|(\{|\[|\()\s*$)'
  folding_stop_marker %r'(\*/|^\s*(\}|\]|\)))'
  uuid "ABBA3E7D-D306-4E27-8DE3-FECBA5C5A6C6"
end

preferences 'Indentation' => 'source.perl' do
  decrease_indent_pattern %r/^\s*\}/
  increase_indent_pattern %r/^.*\{\}?\s*$/
  un_indented_line_pattern %r/^\s*$/
  uuid "190987B4-CF0A-49E3-9122-255304900C61"
end

preferences 'Comments' => 'source.perl', file: 'Miscellaneous' do
  shell_variable 'TM_COMMENT_START', '# '
  uuid "C1EE8DC8-117D-4BC6-8E69-97D51EAA58D2"
end
