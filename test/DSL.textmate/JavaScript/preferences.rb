# encoding: utf-8

preferences 'Comments' => 'source.js' do
  shell_variable 'TM_COMMENT_START', '// '
  shell_variable 'TM_COMMENT_START_2', '/*'
  shell_variable 'TM_COMMENT_END_2', '*/'
  uuid "A67A8BD9-A951-406F-9175-018DD4B52FD1"
end

preferences 'Folding' => 'source.js' do
  folding_start_marker %r'\{\s*(//.*)?$|\[\s*(//.*)?$|\(\s*(//.*)?$'
  folding_stop_marker %r/^\s*\}|^\s*\]|^\s*\)/
  uuid "1E044101-68F8-410B-8FF5-E9553AD14B7C"
end

preferences 'Indentation' => 'source.js', file: 'JavaScript Indent' do
  decrease_indent_pattern %r'^(.*\*/)?\s*(\}|\)|case|default)'
  increase_indent_pattern %r/(?x)
    (
      \{ [^}"']*
    |  \( [^)"']*
    |  case[\s\S]*:
    |  default:
    )
    $
  /
  uuid "BC062860-3346-4D3B-8421-C5543F83D11F"
end

preferences 'Symbol List' => 'source.js entity.name.function.js, source.js meta.function.js meta.function.variable.js' do
  show_in_symbol_list true
  uuid "6FF7E4FD-64C1-4162-85ED-CE40511A2414"
end
