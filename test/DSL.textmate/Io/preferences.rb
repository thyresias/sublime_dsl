# encoding: utf-8

preferences 'Comments' => 'source.io' do
  shell_variable 'TM_COMMENT_START', '# '
  shell_variable 'TM_COMMENT_START_2', '// '
  shell_variable 'TM_COMMENT_START_3', '/* '
  shell_variable 'TM_COMMENT_END_3', ' */'
  uuid "2D353655-501C-4C5C-92D0-3C4AAE9CD3E6"
end

preferences 'Folding' => 'source.io' do
  folding_start_marker %r'(/\*\*|\([^\)]*$|if\()'
  folding_stop_marker %r'(\*\*/|^\s*\))'
  uuid "7EECF802-872F-4000-A7AA-0E86E76C2F5A"
end

preferences 'Indentation Rules' => 'source.io' do
  decrease_indent_pattern %r/\)/
  indent_next_line_pattern %r/\(/
  un_indented_line_pattern %r/^\s*(#.*)?\s*$/
  uuid "9D0E390E-145F-48F8-944A-E1349337DABF"
end

preferences 'Typing Pairs' => 'source.io' do
  highlight_pairs "\"\" ()"
  smart_typing_pairs "\"\" ()"
  uuid "6131549E-7BD0-4AB3-AC12-4BD971BE95B0"
end
