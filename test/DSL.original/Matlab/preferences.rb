# encoding: utf-8

preferences 'Miscellaneous Matlab' => 'source.matlab', file: 'Indent' do
  decrease_indent_pattern %r/^\s*\b(end\w*|catch|else|elseif|case|otherwise)\b/
  highlight_pairs "() [] {} \"\""
  increase_indent_pattern %r/(?x)^\s*
    \b(
       function
       |if|else|elseif
       |switch|case|otherwise
       |for|while
    |try|catch
       |unwind_protect
  )\b/
  smart_typing_pairs "() [] {} \"\" ''"
  uuid "2CD1353B-AEC7-4BBF-8061-6038D1E93FA8"
end

preferences 'Miscellaneous' => 'source.matlab' do
  decrease_indent_pattern %r/^\s*end\b/
  highlight_pairs "() [] {} \"\""
  increase_indent_pattern %r/^\s*\\begin\{.*\}/
  shell_variable 'TM_COMMENT_START', '% '
  smart_typing_pairs "() [] {} \"\""
  uuid "E190EAB2-D99C-4DDC-90A2-0F17A014FE07"
end

preferences 'Symbol List: Functions' => 'source.matlab meta.function.with-arguments, source.matlab meta.function.without-arguments', file: 'Symbols' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/^\s*function\s+//;
    s/(?>.*=)\s*//; # remove output args
  TXT
  uuid "5EC2B9C8-1311-4C27-A421-A7982E6418AA"
end
