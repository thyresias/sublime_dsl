# encoding: utf-8

preferences 'Filename Settings' => 'string.quoted.double.filename.tt, string.unquoted.other.filename.tt' do
  spell_checking false
  uuid "D2C1547A-B175-410E-B3FD-C98439CCFE44"
end

preferences 'Folding' => 'text.html.tt' do
  folding_start_marker %r/(<(?i:(head|table|tr|div|style|script|ul|ol|form|dl))\b.*?>|^ *\[%[^%]*\b(?:FOR|WRAPPER|SWITCH|FOREACH|IF|UNLESS|BLOCK|MACRO|FILTER|PERL|TRY)\b(?!.*END *%\]))/
  folding_stop_marker %r'(</(?i:(head|table|tr|div|style|script|ul|ol|form|dl))>|^ *\[% *END *%\])'
  uuid "8EA9664E-A422-4962-8EFF-A4A7BBE03FF4"
end

preferences 'Miscellaneous' => 'text.html.tt' do
  smart_typing_pairs "\"\" () {} [] “” <> '' %%"
  uuid "6DB1153B-D616-433C-8626-FE1AC0041F04"
end
