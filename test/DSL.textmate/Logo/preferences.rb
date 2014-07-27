# encoding: utf-8

preferences 'Comments' => 'source.logo' do
  shell_variable 'TM_COMMENT_START', '; '
  uuid "C77C1250-3F12-4739-BEDD-50E79B234A5D"
end

preferences 'Folding' => 'source.logo' do
  folding_start_marker %r/^to \w+/
  folding_stop_marker %r/^end$/
  uuid "A4942AF5-B6FC-43A3-A737-B398939F572B"
end

preferences 'Miscellaneous' => 'source.logo', file: 'Misc' do
  highlight_pairs "() {} [] ||"
  smart_typing_pairs "() {} [] ||"
  uuid "113270D8-98E6-4128-BBBB-D8BC931AC698"
end
