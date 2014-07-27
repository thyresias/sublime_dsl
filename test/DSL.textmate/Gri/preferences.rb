# encoding: utf-8

preferences 'Folding' => 'source.gri' do
  folding_start_marker %r'(/\*\*|\{\s*$)'
  folding_stop_marker %r'(\*\*/|^\s*\})'
  uuid "BA8F4D0B-245A-4335-8955-666FFBB2C313"
end

preferences 'Miscellaneous' => 'source.gri' do
  highlight_pairs "() {}"
  increase_indent_pattern %r/\b(?i:(while))\b/
  smart_typing_pairs "() {} \"\""
  uuid "3BC63705-0826-4C6F-B0F4-7417722655DB"
end
