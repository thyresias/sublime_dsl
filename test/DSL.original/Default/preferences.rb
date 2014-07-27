# encoding: utf-8

preferences 'Indentation Rules - Comments' => 'comment' do
  preserve_indent true
end

preferences 'Indentation Rules' => 'source' do
  decrease_indent_pattern %r'^(.*\*/)?\s*\}[;\s]*$'
  increase_indent_pattern %r/^.*(\{[^}"']*)$/
  disable_indent_next_line_pattern %r/^\s*\{[\]})]*\s*$/
  indent_parens true
end

preferences 'Symbol List' => 'entity.name.function, entity.name.type, meta.toc-list' do
  show_in_symbol_list true
  uuid "0A0DA1FC-59DE-4FD9-9A2C-63C6811A3C39"
end
