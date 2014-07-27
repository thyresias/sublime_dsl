# encoding: utf-8

preferences 'Comments' => 'source.r' do
  shell_variable 'TM_COMMENT_START', '# '
  uuid "F38E1657-C2D9-48CE-9FFD-3EEA36D8B320"
end

preferences 'Folding (Documentation)' => 'text.tex.latex.rd', file: 'Folding - Documentation' do
  folding_start_marker %r'/\w*\{\s*$'
  folding_stop_marker %r/^\s*\}/
  uuid "60CD1452-8D51-4AAA-938F-A40628EA7B9A"
end

preferences 'Folding (R)' => 'source.r', file: 'Folding - R' do
  folding_start_marker %r/^[^#]*(\([^\)]*$|\{\s*$)/
  folding_stop_marker %r/(^\s*\)|^\s*\})/
  uuid "88425650-DA1A-44DF-98E8-D37EA091ACA0"
end

preferences 'Indentation Rules' => 'source.r' do
  indent_next_line_pattern %r/^\s*(repeat|else|(((else\s+)?if|for|while)\s*\(.+\)))/
  uuid "8A8DFE5C-EA28-46EB-BD5C-C2B08CAA7352"
end

preferences 'Symbol List: Method' => 'keyword.name.function, meta.method.declaration.r', file: 'Methods' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/^.*?\(\s*([\w\d]+\s*=\s*)?(["\x{27}])(.*?)\2[^"\x{27}]+?(["\x{27}])(.*?)\4.*/- $3 ($5)/;
    s/^\s*(\S+?)\s*\(\s*([\w\d]+\s*=\s*)?(["\x{27}])([^\3]+?)\3.*/- $1:$4/;
  TXT
  uuid "0AE8C5E0-C202-4965-B877-4CD0B9420A7D"
end

preferences 'Symbol List (Rd Documentation)' => 'keyword.other.section.rd' do
  show_in_symbol_list true
  symbol_transformation 's/\\\(.*)/$1/;'
  uuid "5DBBC018-D895-4A52-91D4-60196BC76B49"
end

preferences 'Symbol List: Pragma' => 'comment.line.pragma-mark' do
  show_in_symbol_list true
  symbol_transformation 's/^.*?mark\s+\-+\s*/-/;s/^.*?mark\s+([^\-].+?)/# $1/;s/\s+$//;'
  uuid "E4D3F9E2-CE92-4142-B164-0CE1EB1AD453"
end
