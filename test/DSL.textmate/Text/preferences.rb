# encoding: utf-8

preferences 'Disable Indention Correction' => 'text - (text source | text.html)' do
  disable_indent_corrections true
  indent_on_paste "simple"
  uuid "29B976F9-853F-43FF-AA50-7A6A518EDC81"
end

preferences 'Style: Bold' => 'markup.bold', file: 'Markup style˸ Bold' do
  bold "1"
  uuid "A088E2CA-03E7-4A8C-855C-AC954E739D6D"
end

preferences 'Style: Italic' => 'markup.italic', file: 'Markup style˸ Italic' do
  italic "1"
  uuid "2EE6D01F-50BC-434B-BE45-54D29CACB3E0"
end

preferences 'Style: Underline' => 'markup.underline', file: 'Markup style˸ Underline' do
  underline "1"
  uuid "4CCD8369-40E4-422A-ABE7-C32F3721AFEF"
end

# FIXME: no scope
preferences 'Miscellaneous' => nil do
  highlight_pairs "() {} [] “” ‘’ „“ ‚‘ «» ‹› 「」 『』 《》"
  smart_typing_pairs "\"\" () {} [] “” ‘’ „“ ‚‘ «» ‹› 「」 『』 《》"
  un_indented_line_pattern %r/^\s*$/
  uuid "3E8C2307-8175-4A58-BE07-785713D5837A"
end

preferences 'Spell Checking: Disable' => 'markup.underline.link, markup.raw', file: 'Spell checking' do
  spell_checking false
  uuid "613405D5-67B6-4281-94C9-9148E54C66FB"
end

preferences 'Style: Numbered List' => 'markup.list.numbered' do
  indented_soft_wrap match: /\A\s*((\d+\.|[-*]|#+)\s+|(?=\w))/, format: '${0/\S/ /g}'
  uuid "EEDAA012-BFBD-4FE8-9253-4EDC5F7309F1"
end

preferences 'Style: Raw' => 'markup.raw.block' do
  soft_wrap false
  uuid "47A88FB7-A084-48F6-9B54-078E9C888BE6"
end

preferences 'Style: Unnumbered List' => 'markup.list.unnumbered' do
  indented_soft_wrap match: /\A\s*[-*]\s+/, format: '${0/\S/ /g}'
  uuid "93CBCCEB-32BE-41F3-9F00-B975831F33EC"
end
