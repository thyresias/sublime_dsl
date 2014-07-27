# encoding: utf-8

preferences 'Folding' => 'source.mel' do
  folding_start_marker %r'(/\*\*|\{\s*$)'
  folding_stop_marker %r'(\*\*/|^\s*\})'
  uuid "F46A82C0-5F91-4E77-912D-387475157EBE"
end

preferences 'Miscellaneous' => 'source.mel' do
  increase_indent_pattern %r/^.*(\{[^}"']*|\([^)"']*)$/
  uuid "1C33AB7C-A008-4148-85CB-5303C7ED8CC5"
end

preferences 'Symbol List' => 'meta.function.mel' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/(?:(?:global\s*)?proc)\s*(\w+\s*\[?\]?\s+|\s+)/ /g;
    s/\s*\(.*\)?/ /g;
  TXT
  uuid "7FC6AD09-BA7B-4A76-BDFC-9D52BE631802"
end
