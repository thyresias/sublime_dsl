# encoding: utf-8

preferences 'Comments' => 'source.applescript' do
  shell_variable 'TM_COMMENT_START', '-- '
  shell_variable 'TM_COMMENT_START_2', '(* '
  shell_variable 'TM_COMMENT_END_2', ' *)'
  uuid "C293E159-C4ED-4757-AD60-82E068A13962"
end

preferences 'Completion: Application Name' => 'string.quoted.double.application-name.applescript' do
  completion_command 'ps -xco command|grep "^$TM_CURRENT_WORD"|sort|uniq'
  uuid "F4324AFF-97E6-4D2D-B425-B24E99383AA3"
end

preferences 'Folding' => 'source.applescript' do
  folding_start_marker %r/(?x)
    ^\s*
    (
     tell \s+ (?! .* \b(to)\b) .*
    |tell\b.*?\bto\ tell \s+ (?! .* \b(to)\b) .*
    |using \s+ terms \s+ from \s+ .*
    |if\b .* \bthen\b
    |repeat\b .*
    |( on | to )\b (?!\s+ error) .*
    |try\b
    |with \s+ timeout\b .*
    |script\b .*
    |( considering | ignoring )\b .*
    )\s*(--.*?)?$
  /
  folding_stop_marker %r/^\s*end\b.*$/
  uuid "30F4F4CB-26DE-414B-A2CC-A251D06D413F"
end

preferences 'Indent' => 'source.applescript' do
  decrease_indent_pattern %r/(?x)
    ^\s* (end|else|on\ error) \b .*$
  /
  increase_indent_pattern %r/(?x)
    ^\s*
    (
     tell \s+ (?! .* \b(to)\b) .*
    |tell\b.*?\bto\ tell \s+ (?! .* \b(to)\b) .*
    |using\ terms\ from\b.*
    |if\b .* \bthen\b
    |else\b .*
    |repeat\b .*
    |( on | to ) \b .*
    |try
    |with \s+ timeout\b .*
    |ignoring\b .*
    )\s*(--.*?)?$
  /
  indent_next_line_pattern %r/¬$/
  uuid "8F2DBD25-3DED-44CE-A902-05DCBC185A99"
end

preferences 'Smart Typing Pairs / Highlight Pairs' => 'source.applescript', file: 'Smart Typing Pairs' do
  highlight_pairs "() \"\" {} [] “” «»"
  smart_typing_pairs "\"\" () {} «»"
  uuid "1E1529C4-A9D6-43AC-AB48-975F9BFCD7B7"
end
