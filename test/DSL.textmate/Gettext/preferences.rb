# encoding: utf-8

preferences 'Completions' => 'source.po' do
  completions %w(
    msgid " msgstr " msgctxt " msgid_plural "
  )
  uuid "82CD3F28-8E89-4B51-B480-695AD359989F"
end

preferences 'Folding' => 'source.po' do
  folding_start_marker %r/#[ \.:,|]/
  folding_stop_marker %r/^\s*$/
  uuid "971CDC40-8DD2-4EEF-88AE-B4F9A933E1BE"
end

preferences 'Symbols' => 'keyword.control.msgid.po' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/^msgid\s+"(.*)"\s*$/$1/g;
    s/^msgid_plural\s+"(.*)"\s*$/$1/g;
  TXT
  uuid "18BD097D-CDB4-431C-AE3F-52D96B452985"
end
