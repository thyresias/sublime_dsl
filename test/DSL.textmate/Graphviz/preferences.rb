# encoding: utf-8

preferences 'Folding' => 'source.dot' do
  folding_start_marker %r/\{/
  folding_stop_marker %r/\}/
  uuid "492F0744-66BD-44D5-9315-CB357DB9A041"
end

preferences 'Miscellaneous' => 'source.dot' do
  highlight_pairs "[] {} <>"
  increase_indent_pattern %r/^\s*\{/
  smart_typing_pairs "[] \"\" {} <>"
  uuid "10700B07-E666-40AF-BB93-A9FA60DE0904"
end
