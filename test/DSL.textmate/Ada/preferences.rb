# encoding: utf-8

preferences 'Comments' => 'source.ada' do
  shell_variable 'TM_COMMENT_START', '--'
  uuid "93AE966F-B971-4709-87AE-F7274F113A40"
end

preferences 'Miscellaneous' => 'source.ada' do
  increase_indent_pattern %r/\b(?i:(loop|declare|begin|exception|when|is|then|else|task)[^;]*$)\b/
  decrease_indent_pattern %r/\b(begin|end|else)\b/
  folding_start_marker %r/\b(?i:(procedure|package|function|task|type|loop|declare)[^;]*$)/
  folding_stop_marker %r/\b(?i:(end))\b/
  uuid "D6D3DAAA-49B9-46C7-AFB4-C3BD4927C5EB"
end
