# encoding: utf-8

preferences 'Comments' => 'text.haml' do
  shell_variable 'TM_COMMENT_START', '/ '
  uuid "4C2E088A-2EDB-44DF-9C62-CE0112B4C237"
end

preferences 'Disable Indent Correction' => 'text.haml' do
  disable_indent_corrections true
  indent_on_paste "simple"
  uuid "89AF053C-4F7D-4E44-A3CB-96920E37F13B"
end

preferences 'Folding' => 'text.haml' do
  folding_start_marker %r/^\s*([-%#\:\.\w\=].*)\s$/
  folding_stop_marker %r/^\s*$/
  uuid "700FE566-3855-4D9B-92C6-26B09F34218C"
end

preferences 'Indented Soft Wrap' => 'text.haml' do
  indented_soft_wrap match: /\A[ \t]*/, format: '$0'
  uuid "3DA2A57F-4A36-497E-B240-7BB0530F1B9C"
end
