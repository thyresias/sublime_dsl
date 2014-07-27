# encoding: utf-8

language 'Java Properties' => 'source.java-properties', file: 'JavaProperties' do
  file_types %w(properties)
  # FIXME: (warning) character class has duplicated range
  folding_start_marker %r/^[a-zA-Z0-9.-_]+=.*/
  # FIXME: (error) end pattern with unmatched parenthesis
  folding_stop_marker %r/^(.*(?<!\)\n))/
  key_equivalent "^~J"  # TextMate only
  uuid "D364E829-7643-4AFF-948D-3C0D6B4EA8A4"  # TextMate only

  rule do
    from %r/(^[ \t]+)?(?=#)/,
      1 => 'punctuation.whitespace.comment.leading.java-properties'
    to %r/(?!\G)/
    rule 'comment.line.number-sign.java-properties' do
      from %r/#/,
        0 => 'punctuation.definition.comment.java-properties'
      to %r/\n/
    end
  end
  rule do
    from %r/(^[ \t]+)?(?=!)/,
      1 => 'punctuation.whitespace.comment.leading.java-properties'
    to %r/(?!\G)/
    rule 'comment.line.exclamation.java-properties' do
      from %r/!/,
        0 => 'punctuation.definition.comment.java-properties'
      to %r/\n/
    end
  end
  rule 'meta.key-pair.java-properties' do
    from %r/^\s*(([\S&&[^:=\\]]|\\.)+)\s*([:=])?/,
      1 => 'support.constant.java-properties',
      3 => 'punctuation.separator.key-value.java-properties'
    to %r/\n/
    rule 'string.unquoted.java-properties' do
      from %r/(?=\S)/
      to %r/(?<!\\)(?=\n)/
      rule 'constant.character.escape.java-properties' do
        match %r/\\([tnfr"'\\]|u\h{4}|)/
      end
    end
  end
end
