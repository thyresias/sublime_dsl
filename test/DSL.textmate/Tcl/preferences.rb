# encoding: utf-8

preferences 'Comments' => 'source.tcl' do
  shell_variable 'TM_COMMENT_START', '# '
  uuid "742ABED6-94AD-4150-B0C8-329825E18B61"
end

preferences 'Folding' => 'source.antlr' do
  folding_start_marker %r/\{\s*$/
  folding_stop_marker %r/^\s*\}/
  uuid "1960A078-66F4-48B8-97E1-2A105293FED0"
end

preferences 'Miscellaneous' => 'source.tcl' do
  highlight_pairs "[] {}"
  increase_indent_pattern %r/\{[^"'}]*$/
  smart_typing_pairs "[] {} \"\""
  uuid "806FD10F-E1F2-4B59-A049-83014D4CBD16"
end

preferences 'Regexp highlight pairs' => 'string.regexp.tcl' do
  highlight_pairs "[] {} ()"
  smart_typing_pairs "[] {} ()"
  uuid "0FC70800-0EC9-436E-B290-67E83A3C8B53"
end
