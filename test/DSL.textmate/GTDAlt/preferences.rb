# encoding: utf-8

preferences 'Folding' => 'text.gtdalt' do
  folding_start_marker %r/^\s*project/
  folding_stop_marker %r/^\s*end\s*$/
  uuid "87C3BBE9-D08A-4FA7-806F-D0964CE285BD"
end

preferences 'Preferences' => 'text.gtdalt' do
  decrease_indent_pattern %r/^\s*end\s*$/
  increase_indent_pattern %r/^\s*project\s+.*$/
  uuid "B8601C35-4EBE-4672-8A09-919A6730DC37"
end

preferences 'Symbol list' => 'meta.line.project.begin.gtdalt' do
  show_in_symbol_list true
  symbol_transformation "s/project//;"
  uuid "E6CF82DF-159E-4B88-B903-4B3BBCDD3233"
end
