# encoding: utf-8

preferences 'Comments' => 'text.txt2tags' do
  shell_variable 'TM_COMMENT_DISABLE_INDENT', 'YES'
  shell_variable 'TM_COMMENT_START', '% '
  shell_variable 'TM_COMMENT_MODE', 'line'
  shell_variable 'TM_COMMENT_START_2', '%%%'
  shell_variable 'TM_COMMENT_END_2', '%%%'
  shell_variable 'TM_COMMENT_MODE_2', 'block'
  uuid "37D1F010-C1D8-4AE1-9E9B-23356FD7C17E"
end

preferences 'Miscellaneous' => 'text.txt2tags' do
  smart_typing_pairs "\"\" () {} [] “” ‘’ ``"
  uuid "B11166AF-3C5B-4494-87F1-FC0712FF795C"
end

preferences 'Symbol List: Headers' => 'markup.heading.1.txt2tags,markup.heading.2.txt2tags,markup.heading.3.txt2tags,markup.heading.4.txt2tags,markup.heading.5.txt2tags' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/^\s*//;                   # remove leading spaces
    s/\s*=+(\[[-\w]+\])?\s*$//; # remove anchor and close marks =
    s/^=====\s*/\t\t\t\t/;      # identify hierarchy with TABs
    s/^====\s*/\t\t\t/;
    s/^===\s*/\t\t/;
    s/^==\s*/\t/;
    s/^=\s*//;
  TXT
  uuid "BD01DD68-6B67-4768-A782-4BD8FD240FF2"
end
