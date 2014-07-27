# encoding: utf-8

preferences 'Spell Checking: Disable' => 'text.moinmoin markup.raw, meta.macro.moimoin, meta.pragma.moimoin, comment.line.moinmoin' do
  spell_checking false
  uuid "B55CE47F-D621-4D84-8C56-61FFDDD7E710"
end

preferences 'Symbol List' => 'text.moinmoin markup.heading' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/\s*=*[^=]*$//; # remove trailing space, =
    s/^\s*//;  # remove leading space
    s/\G=/ /g; # convert leading = to m-space
    s/^ //;    # strip first m-space
  TXT
  uuid "62CBBA22-7680-4213-A3CC-707336A65F5A"
end

preferences 'Typing Pairs: Defaults' => 'text.moinmoin' do
  smart_typing_pairs "\"\" () {} [] “” ``"
  uuid "ECAD7950-590C-4D8F-B17A-BF64DD5975A3"
end
