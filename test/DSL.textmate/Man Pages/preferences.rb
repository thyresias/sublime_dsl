# encoding: utf-8

preferences 'Folding' => 'text.man' do
  folding_start_marker %r/^[A-Z](?>\S|\s(?!\s))*$/
  folding_stop_marker %r/^_{2,}$/
  uuid "008559D7-D6B4-4F49-8C66-F17A6A4E4F1B"
end

preferences 'Miscellaneous' => 'text.man' do
  spell_checking false
  uuid "16CAE6EE-32B1-403A-86AF-E44379758C19"
end

preferences 'Symbol List' => 'markup.heading.man' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/([\w\-])([\w-]*)/$1\L$2\E/g;
    s/(\s)\b(The|A|An|And|To|Of|In|By)\b/$1\L$2\E/g;
  TXT
  uuid "5D5C2A96-0934-4F5C-AEAD-38FEBAF00E6D"
end
