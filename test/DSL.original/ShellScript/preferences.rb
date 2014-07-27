# encoding: utf-8

preferences 'Comments' => 'source.shell' do
  shell_variable 'TM_COMMENT_START', '# '
  uuid "858E140E-51E5-4863-829F-EF6B4B8FA816"
end

preferences 'Miscellaneous' => 'source.shell' do
  decrease_indent_pattern %r/^\s*(\}|(elif|else|fi|esac|done)\b)/
  increase_indent_pattern %r/^\s*(if|elif|else|case)\b|^.*(\{|\b(do)\b)$/
  indent_next_line_pattern %r/^.*[^\\]\\$/
  uuid "E3637B21-3DAB-41D2-AD9D-03735778D7EE"
end
