# encoding: utf-8

language 'Ini' => 'source.ini' do
  file_types %w(ini conf)
  key_equivalent "^~I"  # TextMate only
  uuid "77DC23B6-8A90-11D9-BAA4-000A9584EC8C"  # TextMate only

  rule do
    from %r/(^[ \t]+)?(?=#)/,
      1 => 'punctuation.whitespace.comment.leading.ini'
    to %r/(?!\G)/
    rule 'comment.line.number-sign.ini' do
      from %r/#/,
        0 => 'punctuation.definition.comment.ini'
      to %r/\n/
    end
  end
  rule do
    from %r/(^[ \t]+)?(?=;)/,
      1 => 'punctuation.whitespace.comment.leading.ini'
    to %r/(?!\G)/
    rule 'comment.line.semicolon.ini' do
      from %r/;/,
        0 => 'punctuation.definition.comment.ini'
      to %r/\n/
    end
  end
  rule do
    match %r/\b([a-zA-Z0-9_.-]+)\b\s*(=)/,
      1 => 'keyword.other.definition.ini',
      2 => 'punctuation.separator.key-value.ini'
  end
  rule 'entity.name.section.group-title.ini' do
    match %r/^(\[)(.*?)(\])/,
      1 => 'punctuation.definition.entity.ini',
      3 => 'punctuation.definition.entity.ini'
  end
  rule 'string.quoted.single.ini' do
    from %r/'/,
      0 => 'punctuation.definition.string.begin.ini'
    to %r/'/,
      0 => 'punctuation.definition.string.end.ini'
    rule 'constant.character.escape.ini' do
      match %r/\\./
    end
  end
  rule 'string.quoted.double.ini' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.ini'
    to %r/"/,
      0 => 'punctuation.definition.string.end.ini'
  end
end
