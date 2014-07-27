# encoding: utf-8

preferences 'Comments' => 'source.d' do
  shell_variable 'TM_COMMENT_START', '/*'
  shell_variable 'TM_COMMENT_END', '*/'
  shell_variable 'TM_COMMENT_MODE', 'block'
  shell_variable 'TM_COMMENT_DISABLE_INDENT', 'yes'
  shell_variable 'TM_COMMENT_START_2', '//'
  shell_variable 'TM_COMMENT_START_3', '/+'
  shell_variable 'TM_COMMENT_END_3', '+/'
  shell_variable 'TM_COMMENT_MODE_3', 'block'
  uuid "4A7C08E3-CF6E-47AC-B5C4-F177BC6F2653"
end

preferences 'Indentation Rules' => 'source.d' do
  decrease_indent_pattern %r!^(.*\*/)?\s*\}([^}{"']*\{)?[;\s]*(//.*|/\*.*\*/\s*)?$|^\s*(public|private|protected):\s*$!
  increase_indent_pattern %r/^.*\{[^}"']*$|^\s*(public|private|protected):\s*$/
  bracket_indent_next_line_pattern %r/(?x)
    ^ \s* \b(if|while|else|foreach)\b [^;]* $
    | ^ \s* \b(for)\b .* $
    /
  uuid "7C8F9C84-7DCC-4DD7-B32E-A638F322199F"
end

preferences 'Symbol List: Method / Constructor' => 'source.d meta.definition.method, source.d meta.definition.constructor, source.d meta.definition.destructor', file: 'Symbol List-Method-Constructor' do
  show_in_symbol_list false
  symbol_transformation 's/^\s*([^\)]+)/ $1/;  # pad'
  uuid "A6BCFD4A-B6CC-49C6-93F9-FEB979CC679E"
end
