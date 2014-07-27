# encoding: utf-8

language 'INI' => 'source.ini' do
  file_types %w(ini INI inf INF reg REG gitconfig config)
  uuid "957acd74-6d7c-4732-a25b-5f66a1e637cd"  # TextMate only

  rule 'comment.line.ini' do
    match %r/^(#|;).*$/
  end

  rule do
    match %r/^\s*\[(.*?)\]/, 1 => 'entity.name.section.ini'
  end

  rule do
    match %r/^(.+?)=.*?$/, 1 => 'keyword.other.ini'
  end

end
