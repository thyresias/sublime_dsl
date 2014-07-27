# encoding: utf-8

preferences 'Comments' => 'source.haskell' do
  shell_variable 'TM_COMMENT_START_2', '{-'
  shell_variable 'TM_COMMENT_END_2', '-}'
  shell_variable 'TM_COMMENT_START', '-- '
  uuid "E3994307-4D9E-44D6-832E-52C244F1CDF3"
end

preferences 'Indentation' => 'source.haskell' do
  decrease_indent_pattern %r/^\s*$/
  disable_indent_corrections true
  increase_indent_pattern %r/((^.*(=|\bdo|\bwhere|\bthen|\belse|\bof)\s*$)|(^.*\bif(?!.*\bthen\b.*\belse\b.*).*$))/
  indent_on_paste "simple"
  uuid "39417FB9-B85C-4213-BB1D-C19BCDD4E487"
end

preferences 'Symbol List' => 'source.haskell entity.name.function.infix' do
  show_in_symbol_list false
  uuid "0C39B945-E2C0-4E43-8A5B-332F6FA73C67"
end

preferences 'Typing Pairs' => 'source.haskell - comment' do
  smart_typing_pairs "\"\" {} [] () ``"
  uuid "FBF9D932-D5CE-4EC4-9162-122E511C8627"
end
