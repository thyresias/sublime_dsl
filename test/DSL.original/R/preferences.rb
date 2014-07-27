# encoding: utf-8

preferences 'Comments' => 'source.r' do
  shell_variable 'TM_COMMENT_START', '# '
  uuid "F38E1657-C2D9-48CE-9FFD-3EEA36D8B320"
end

preferences 'Symbol List: Method' => 'meta.method.declaration.r', file: 'Methods' do
  show_in_symbol_list true
  symbol_transformation 's/\s*(.+?)\s*\(\s*("|\x27)(.*?)\s*\2/$1 "$3"/;'
  uuid "0AE8C5E0-C202-4965-B877-4CD0B9420A7D"
end

preferences 'Symbol List (Rd Documentation)' => 'keyword.other.section.rd' do
  show_in_symbol_list true
  symbol_transformation 's/\\\(.*)/$1/;'
  uuid "5DBBC018-D895-4A52-91D4-60196BC76B49"
end
