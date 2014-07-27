# encoding: utf-8

preferences 'Comments' => 'source.yaml' do
  shell_variable 'TM_COMMENT_START', '# '
  uuid "EDFB82EE-8F5A-497F-8D53-38D4E7BD4F08"
end

preferences 'Folding' => 'source.yaml' do
  folding_start_marker %r/^[^#]\s*.*:(\s*\[?| &.+)?$/
  folding_stop_marker %r/^\s*$|^\s*\}|^\s*\]|^\s*\)/
  uuid "38D0A8EE-DA69-457B-99DA-1559256DE8A7"
end

preferences 'Indenting' => 'source.yaml' do
  decrease_indent_pattern %r/^\s+\}$/
  disable_indent_corrections true
  increase_indent_pattern %r/^\s*.*(:|-) ?(&\w+)?(\{[^}"']*|\([^)"']*)?$/
  indent_on_paste "simple"
  uuid "78CB70FF-5071-11DA-B402-000A95AF0064"
end
