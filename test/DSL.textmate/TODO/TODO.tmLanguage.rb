# encoding: utf-8

language 'TODO' => 'text.todo' do
  # FIXME: no file types
  uuid "94A00B36-AAEF-477A-BA78-9B081B116321"  # TextMate only

  rule 'storage.type.class.${1:/downcase}' do
    match %r/\b(TODO|FIXME|CHANGED)\b/
  end
  rule 'storage.type.class.radar' do
    match %r'<(ra?dar:/(?:/problem|)/(?:[&0-9]+))>',
      1 => 'markup.underline.link.radar'
  end
end
