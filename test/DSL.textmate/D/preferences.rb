# encoding: utf-8

preferences 'Comments' => 'source.d' do
  shell_variable 'TM_COMMENT_START', '// '
  shell_variable 'TM_COMMENT_START_2', '/*'
  shell_variable 'TM_COMMENT_END_2', '*/'
  shell_variable 'TM_COMMENT_MODE_2', 'block'
  shell_variable 'TM_COMMENT_START_3', '/+'
  shell_variable 'TM_COMMENT_END_3', '+/'
  shell_variable 'TM_COMMENT_MODE_3', 'block'
  uuid "4A7C08E3-CF6E-47AC-B5C4-F177BC6F2653"
end

preferences 'Folding' => 'source.d' do
  folding_start_marker %r'(?x)/\*\*(?!\*)|^(?![^{]*?//|[^{]*?/\*(?!.*?\*/.*?\{)).*?\{\s*($|//|/\*(?!.*?\*/.*\S))'
  folding_stop_marker %r'(?<!\*)\*\*/|^\s*\}'
  uuid "B1976C92-6C07-491F-BC33-5ADA6F411DC8"
end

preferences 'Indentation Rules' => 'source.d' do
  decrease_indent_pattern %r!^(.*\*/)?\s*\}([^}{"']*\{)?[;\s]*(//.*|/\*.*\*/\s*)?$|^\s*(public|private|protected):\s*$!
  increase_indent_pattern %r/^.*\{[^}"']*$|^\s*(public|private|protected):\s*$/
  indent_next_line_pattern %r'^(?!(.*[};:])?\s*(//|/\*.*\*/\s*$)).*[^\s;:{}]\s*$'
  uuid "7C8F9C84-7DCC-4DD7-B32E-A638F322199F"
end

preferences 'Symbol List: Method / Constructor' => 'source.d meta.definition.method, source.d meta.definition.constructor, source.d meta.definition.destructor', file: 'Symbol List-Method-Constructor' do
  show_in_symbol_list false
  symbol_transformation 's/^\s*([^\)]+)/ $1/;  # pad'
  uuid "A6BCFD4A-B6CC-49C6-93F9-FEB979CC679E"
end
