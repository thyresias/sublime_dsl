# encoding: utf-8

preferences 'Folding' => 'source.pascal' do
  folding_start_marker %r/\b(?i:(function|package|procedure|try|type))\b/
  folding_stop_marker %r/\b(?i:(end))\b/
  uuid "68AA0379-4DA7-45CF-82A8-7E0E1623C341"
end

preferences 'Miscellaneous' => 'source.pascal' do
  highlight_pairs "() [] {}"
  increase_indent_pattern %r/\b(?i:(begin|declare|else|except|exception|finally|for|if|loop|package|procedure|task|try|type|when))\b/
  shell_variable 'TM_COMMENT_START', '// '
  shell_variable 'TM_COMMENT_START_2', '/*'
  shell_variable 'TM_COMMENT_END_2', '*/'
  smart_typing_pairs "() [] {} \"\" ''"
  uuid "84E8D096-0C4D-4830-A9EA-9C1DE257775F"
end
