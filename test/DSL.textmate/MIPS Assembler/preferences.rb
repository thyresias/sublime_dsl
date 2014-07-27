# encoding: utf-8

preferences 'comments' => 'source.mips' do
  shell_variable 'TM_COMMENT_START', '# '
  uuid "FFB5E751-02C2-46B3-95A8-CA88BBEC2194"
end

preferences 'Miscellaneous' => 'source.mips' do
  highlight_pairs "()"
  increase_indent_pattern %r/^\s*[A-Za-z0-9_]+:\s*$/
  smart_typing_pairs "() \"\""
  uuid "FB546558-427E-4421-9817-07A4C79D2220"
end
