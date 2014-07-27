# encoding: utf-8

preferences 'Folding' => 'source.prolog' do
  folding_start_marker %r/%\s*region \w*/
  folding_stop_marker %r/%\s*end(\s*region)?/
  uuid "A57BAF2A-6426-4C5C-AC9A-5CC5228909BA"
end

preferences 'Miscellaneous' => 'source.prolog' do
  disable_indent_corrections true
  highlight_pairs "[] ()"
  increase_indent_pattern %r/:-\s*$/
  indent_on_paste "simple"
  shell_variable 'TM_COMMENT_START', '% '
  shell_variable 'TM_COMMENT_START_2', '/*'
  shell_variable 'TM_COMMENT_END_2', '*/'
  smart_typing_pairs "[] ()"
  uuid "487758CF-13E2-413E-8A12-224771481FE9"
end
