# encoding: utf-8

preferences 'Folding' => 'source.context-free' do
  folding_start_marker %r/[\{\[]\s*$/
  folding_stop_marker %r/^\s*[\}\]]/
  uuid "1FCF425E-A3A1-46D0-9030-7EECEFD6E638"
end

preferences 'Indentation Rules' => 'source.context-free' do
  decrease_indent_pattern %r'^(.*\*/)?\s*[\}\]]\s*$'
  increase_indent_pattern %r/^.*[\{\[][^\}\]]*$/
  uuid "8EF0593F-78AB-4D96-BB8C-51BFA61D29CD"
end

preferences 'Rules' => 'source.context-free entity.name.function.definition' do
  show_in_symbol_list true
  uuid "563F7F3C-A0BD-4E1E-AA5C-FEB12D7371C6"
end

preferences 'Symbol Overrides' => 'source.context-free entity.name.function' do
  show_in_symbol_list false
  uuid "C63A09B4-482D-4B91-B4BA-5B844BAEBB2B"
end
