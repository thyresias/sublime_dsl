# encoding: utf-8

preferences 'Miscellaneous' => 'source.lilypond' do
  decrease_indent_pattern %r/[^{]*\}.*|>>/
  highlight_pairs "\"\" () {} [] “” <>"
  increase_indent_pattern %r/.*\{[^}]*$|<</
  shell_variable 'TM_COMMENT_START', '% '
  shell_variable 'TM_COMMENT_START_2', '%{'
  shell_variable 'TM_COMMENT_END_2', '%}'
  shell_variable 'TM_COMMENT_DISABLE_INDENT', 'yes'
  smart_typing_pairs "\"\" {} [] “” <>"
  uuid "70991DF0-7C6F-4B3D-AED4-2F9A56EAB687"
end
