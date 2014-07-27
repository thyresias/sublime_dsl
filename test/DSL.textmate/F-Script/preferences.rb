# encoding: utf-8

preferences 'Typing Pairs: Blocks' => 'source.fscript meta.block.header.fscript', file: 'Block typing pairs for blocks' do
  smart_typing_pairs "'' \"\" () {} [] ||"
  uuid "FEFBC3CD-E647-4DF0-903E-491E892E8484"
end

preferences 'Typing Pairs: Default' => 'source.fscript', file: 'Block typing pairs' do
  smart_typing_pairs "'' \"\" () {} []"
  uuid "DCAC81A0-6701-4EEC-B499-7C5859C7140F"
end

preferences 'Folding' => 'source.fscript' do
  folding_start_marker %r/\[/
  folding_stop_marker %r/\]/
  uuid "61D30E32-F07A-48A3-AF29-98A7E313859E"
end

preferences 'Miscellaneous' => 'source.fscript' do
  decrease_indent_pattern %r/^\s*\][.\s]*$/
  increase_indent_pattern %r/^.*\[[^\]']*$/
  shell_variable 'TM_COMMENT_START', '"'
  shell_variable 'TM_COMMENT_END', '"'
  shell_variable 'TM_LINE_TERMINATOR', '.'
  uuid "5FFB327F-3DF9-42B1-8B00-87F6B4BE164E"
end
