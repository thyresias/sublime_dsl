# encoding: utf-8

preferences 'Comments' => 'source.ninja' do
  shell_variable 'TM_COMMENT_START', '# '
  uuid "FF316688-5F1A-4484-B8BF-99113255B56D"
end

preferences 'Foldings' => 'source.ninja' do
  folding_indented_block_start %r/^\s*rule /
  uuid "29AF8406-3961-4AFC-8609-76237C489A56"
end

preferences 'Indentation' => 'source.ninja' do
  decrease_indent_pattern %r/^$/
  increase_indent_pattern %r/^rule /
  indent_on_paste "simple"
  uuid "BEBBF72F-AC25-400A-852E-76BD14CEFA62"
end
