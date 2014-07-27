# encoding: utf-8

preferences 'Comments' => 'source.erlang' do
  shell_variable 'TM_COMMENT_START', '% '
  shell_variable 'TM_COMMENT_MODE', 'line'
  uuid "08AFD8DA-AEFF-4979-98BA-21D5B0A59D33"
end

preferences 'Function Symbols' => 'source.erlang entity.name.function.definition' do
  show_in_symbol_list true
  symbol_transformation "s,$,/,"
  uuid "7D7FE91B-0543-4F95-8D99-AF393226415C"
end

preferences 'Indentation Rules' => 'source.erlang' do
  decrease_indent_pattern %r/^\s*\b(end)\b/
  increase_indent_pattern %r/^[^%]*(\b(if|case|receive|after|fun|try|catch|begin|query)\b(?!.*\b(end)\b.*))|(->(\s*%.*)?$)/
  uuid "34E0D602-ADAE-43F9-A661-0323A821AB75"
end

preferences 'Macro Symbols' => 'source.erlang entity.name.function.macro.definition' do
  show_in_symbol_list true
  symbol_transformation "s/^/?/"
  uuid "5EEC72E3-EEA9-4C53-8D70-3903EF1D84E2"
end

preferences 'Module Symbols' => 'source.erlang entity.name.type.class.module.definition.erlang' do
  show_in_symbol_list true
  symbol_transformation "s/^/-/"
  uuid "1250456F-9F83-4BAA-B338-5C9E86E89DD9"
end

preferences 'Record Symbols' => 'source.erlang entity.name.type.class.record.definition' do
  show_in_symbol_list true
  symbol_transformation "s/^/#/"
  uuid "31DB728C-AC89-4DF0-A2B9-9D3D3A7552A9"
end

preferences 'Symbol Overrides' => 'source.erlang entity.name.function, source.erlang entity.name.type.class' do
  show_in_symbol_list false
  uuid "AE84FFDF-2D5A-4331-A301-6CF34CF26CD8"
end
