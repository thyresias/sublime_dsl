# encoding: utf-8

preferences 'Comments' => 'source.lisp' do
  shell_variable 'TM_COMMENT_START', '; '
  shell_variable 'TM_COMMENT_START_2', '#| '
  shell_variable 'TM_COMMENT_END_2', ' |#'
  uuid "DD4CB5ED-97E7-4619-A6AF-C88AA691EFBF"
end

preferences 'Folding' => 'source.lisp' do
  folding_start_marker %r/\(/
  folding_stop_marker %r/\)/
  uuid "BB337F90-149C-4B3E-AC05-3856795B60E8"
end

preferences 'Miscellaneous' => 'source.lisp' do
  highlight_pairs "() [] {}"
  increase_indent_pattern %r/^.*\(.*[^)"]$/
  smart_typing_pairs "() [] {} \"\""
  uuid "BC1D28C8-E02B-4040-AC25-F39ABE04F1AD"
end
