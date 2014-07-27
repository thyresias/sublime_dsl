# encoding: utf-8

preferences 'Comments' => 'source.plist' do
  shell_variable 'TM_COMMENT_START', '// '
  shell_variable 'TM_COMMENT_START_2', '/*'
  shell_variable 'TM_COMMENT_END_2', '*/'
  uuid "CDA3D2D7-63C8-4208-9ADA-2D5031128B34"
end

preferences 'Folding (Old-Style)' => 'source.plist', file: 'Folding - Old-Style' do
  folding_start_marker %r/^\s*(([a-zA-Z_-]+|"[^"]+"|'[^']+')\s+=\s+)?[{(](?!.*[)}][;,]?\s*$)/
  folding_stop_marker %r/^\s*(\}|\))/
  uuid "EE080C84-800A-49E5-B0C1-0C5DF8E6A519"
end

preferences 'Indentation Rules' => 'source.plist' do
  decrease_indent_pattern %r/^\s*(\}|\))/
  increase_indent_pattern %r/^\s*(([a-zA-Z_-]+|"[^"]+"|'[^']+')\s+=\s+)?[{(](?!.*[)}][;,]?\s*$)/
  uuid "0473E42E-A64E-4D3E-B20B-BA66E0145BC4"
end

preferences 'Symbol List' => 'constant.other.name.xml.plist' do
  show_in_symbol_list true
  uuid "F8D1160E-C397-45DD-86A8-BC1CC0C8676A"
end

preferences 'Typing Pairs' => 'source.plist - string - comment - constant.other.key' do
  smart_typing_pairs "=; \"\" () {} [] “” '' ``"
  uuid "88C56C14-B8C2-409E-9E1E-55777FB354EE"
end
