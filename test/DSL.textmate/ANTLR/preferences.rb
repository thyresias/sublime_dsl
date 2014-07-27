# encoding: utf-8

preferences 'Folding' => 'source.antlr' do
  folding_start_marker %r'/\*(?!\*/)|\{\s*$'
  folding_stop_marker %r'\*/|^\s*\}'
  uuid "1762BD67-E4A2-4564-9C16-B127EAB87E82"
end

preferences 'Symbol List: Rule Names' => 'keyword.control.label.antlr', file: 'Symbol list' do
  show_in_symbol_list true
  uuid "61C20EDE-4C2A-44B5-9893-EB1E4CF9EF96"
end
