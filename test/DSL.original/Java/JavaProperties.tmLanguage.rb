# encoding: utf-8

language 'Java Properties' => 'source.java-props', file: 'JavaProperties' do
  file_types %w(properties)
  key_equivalent "^~J"  # TextMate only
  uuid "2A28E50A-6B1D-11D9-8689-000D93589AF6"  # TextMate only

  rule 'comment.line.number-sign.java-props' do
    match %r/([#!])(.+)?$\n?/,
      1 => 'punctuation.definition.comment.java-props'
  end
  rule 'comment.block.java-props' do
    from %r'/\*'
    to %r'\*/'
    both 0 => 'punctuation.definition.comment.java-props'
  end
  rule do
    # Not compliant with the properties file spec, but this works for me, and I'm the one who counts around here.
    match %r/^([^:=]+)([:=])(.*)$/,
      1 => 'keyword.other.java-props',
      2 => 'punctuation.separator.key-value.java-props'
  end
end
