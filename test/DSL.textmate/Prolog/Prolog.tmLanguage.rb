# encoding: utf-8

language 'Prolog' => 'source.prolog' do
  # FIXME: no file types
  key_equivalent "^~P"  # TextMate only
  uuid "C0E2ADB0-1706-4A28-8DB7-263BDC8B5C5C"  # TextMate only

  rule 'string.quoted.single.prolog' do
    from %r/'/,
      0 => 'punctuation.definition.string.begin.prolog'
    to %r/'/,
      0 => 'punctuation.definition.string.end.prolog'
    rule 'constant.character.escape.prolog' do
      match %r/\\./
    end
    rule 'constant.character.escape.quote.prolog' do
      match %r/''/
    end
  end
  rule 'comment.block.prolog' do
    from %r'/\*'
    to %r'\*/'
    both 0 => 'punctuation.definition.comment.prolog'
  end
  rule do
    from %r/(^[ \t]+)?(?=%)/,
      1 => 'punctuation.whitespace.comment.leading.prolog'
    to %r/(?!\G)/
    rule 'comment.line.percentage.prolog' do
      from %r/%/,
        0 => 'punctuation.definition.comment.prolog'
      to %r/\n/
    end
  end
  rule 'keyword.operator.definition.prolog' do
    match %r/:-/
  end
  rule 'variable.other.prolog' do
    match %r/\b[A-Z][a-zA-Z0-9_]*\b/
  end
  rule 'constant.other.symbol.prolog' do
    #
    # I changed this from entity to storage.type, but have no idea what it is -- Allan
    # And I changed this to constant.other.symbol after glancing over the docs,
    #     might still be wrong.  -- Infininight
    match %r/\b[a-z][a-zA-Z0-9_]*\b/
  end
end
