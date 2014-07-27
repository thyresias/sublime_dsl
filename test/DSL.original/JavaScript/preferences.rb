# encoding: utf-8

preferences 'Comments' => 'source.js, source.json' do
  shell_variable 'TM_COMMENT_START', '// '
  shell_variable 'TM_COMMENT_START_2', '/*'
  shell_variable 'TM_COMMENT_END_2', '*/'
  uuid "A67A8BD9-A951-406F-9175-018DD4B52FD1"
end

preferences 'Completion Rules' => 'source.js' do
  cancel_completion %r/^\s*(\{?\s*(else|return|do)|(function)\s*[a-zA-Z_0-9]+)$/
end

preferences 'JavaScript Indent' => 'source.js' do
  decrease_indent_pattern %r'^(.*\*/)?\s*\}.*$'
  increase_indent_pattern %r/^.*\{[^}"']*$/
  bracket_indent_next_line_pattern %r/(?x)
    ^ \s* \b(if|while|else)\b [^;]* $
    | ^ \s* \b(for)\b .* $
    /
  uuid "BC062860-3346-4D3B-8421-C5543F83D11F"
end

preferences 'Symbol List Banned' => 'source.js meta.property.function entity.name.function' do
  show_in_symbol_list false
  uuid "834BC727-6B31-4073-A161-4823227219EF"
end

preferences 'Symbol List Class' => 'source.js entity.name.type.class' do
  show_in_symbol_list true
  symbol_transformation "s/^/• /g;"
  uuid "3CEA49B2-A5C5-405C-82E2-B8B668877C37"
end

preferences 'Symbol List Function' => 'source.js meta.function.js, source.js meta.function.json.js' do
  show_in_symbol_list true
  uuid "3CEA49B2-A5C5-405C-82E2-B8B668877C38"
end

preferences 'Symbol List Instance' => 'source.js entity.name.instance' do
  show_in_symbol_list true
  symbol_transformation 's/^/\t/g;'
  uuid "E6EB7CC8-04E8-43A9-93B2-BC9EF5BA862B"
end

preferences 'Symbol List Sub 1' => 'source.js object.property.function -(meta.group meta.group)' do
  show_in_symbol_list true
  symbol_transformation "s/^/ :/g;"
  uuid "73557394-4F0F-4DD3-8029-EEE8201AC7F5"
end

preferences 'Symbol List Sub 2' => 'source.js meta.group meta.group object.property.function' do
  show_in_symbol_list true
  symbol_transformation "s/^/  :/g;"
  uuid "51841DDB-C2A4-461C-A8AB-6C124AD50EAE"
end
