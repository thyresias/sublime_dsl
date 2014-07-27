# encoding: utf-8

language 'Ninja' => 'source.ninja' do
  file_types %w(ninja)
  key_equivalent "^~N"  # TextMate only
  uuid "012183BB-F02F-496D-9910-3B2504674FEC"  # TextMate only

  rule 'invalid.illegal.tab-not-allowed-here.ninja' do
    match %r/^\t+(?![#\t]).*\n?/
  end
  rule 'constant.character.escape.ninja' do
    match %r/$[$: ]/
  end
  rule 'storage.type.$1.ninja' do
    match %r/\b(build|rule|default)\b/
  end
  rule 'keyword.control.$1.ninja' do
    match %r/\b(include|subninja)\b/
  end
  rule 'variable.other.normal.ninja' do
    match %r/(\$)[a-zA-Z_][a-zA-Z0-9_]*/,
      1 => 'punctuation.definition.variable.ninja'
  end
  rule 'variable.other.bracket.ninja' do
    match %r/(\$)\{.*?\}/,
      1 => 'punctuation.definition.variable.ninja'
  end
  rule do
    from %r/^([ \t]+)?(?=#)/,
      1 => 'punctuation.whitespace.comment.leading.ninja'
    to %r/(?!\G)/
    rule 'comment.line.number-sign.ninja' do
      from %r/#/,
        0 => 'punctuation.definition.comment.ninja'
      to %r/\n/
    end
  end
end
