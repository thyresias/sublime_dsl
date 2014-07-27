# encoding: utf-8

preferences 'Comments' => 'source.postscript' do
  shell_variable 'TM_COMMENT_START', '% '
  uuid "26898EAD-9BC4-4809-A836-A9F2F705CB1A"
end

preferences 'Folding' => 'source.postscript' do
  folding_start_marker %r'/\*\*|\{\s*$'
  folding_stop_marker %r'\*\*/|^\s*\}'
  uuid "F1931D2C-5608-46FD-8748-EAE1F79506C3"
end
