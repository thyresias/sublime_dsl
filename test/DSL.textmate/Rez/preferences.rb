# encoding: utf-8

preferences 'Folding' => 'source.rez' do
  folding_start_marker %r'(/\*\*|\{\s*$)'
  folding_stop_marker %r'(\*\*/|^\s*\})'
  uuid "69BAEDA5-8C8D-49E2-B605-FF200B9A4C59"
end

preferences 'Miscellaneous' => 'source.rez' do
  highlight_pairs "() [] {}"
  increase_indent_pattern %r/^.*(\{[^}"']*|\([^)"']*)$/
  smart_typing_pairs "() [] {} \"\" ''"
  uuid "41DDC38F-A053-46D3-982A-202157A76F32"
end
