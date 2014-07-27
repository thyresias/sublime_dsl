# encoding: utf-8

preferences 'Folding' => 'source.processing' do
  folding_start_marker %r'(\{\s*(//.*)?$|^\s*// \{\{\{|/\*\*)'
  folding_stop_marker %r'^\s*(\}|// \}\}\}$|\*\*/)'
  uuid "3CF3F9C8-DEF8-467B-9C7B-8E95F7D28B86"
end

preferences 'Miscellaneous' => 'source.processing' do
  increase_indent_pattern %r/^.*(\{[^}"']*|\([^)"']*)$/
  shell_variable 'TM_COMMENT_START', '// '
  shell_variable 'TM_COMMENT_START_2', '/* '
  shell_variable 'TM_COMMENT_END_2', ' */'
  shell_variable 'TM_COMMENT_START_3', '/** '
  shell_variable 'TM_COMMENT_END_3', ' */'
  uuid "9C2FA03B-5DEB-4814-9BC0-A2E4F83D1F99"
end
