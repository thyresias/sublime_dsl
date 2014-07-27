# encoding: utf-8

language 'Properties' => 'source.tm-properties' do
  file_types %w(tm_properties tmProperties)
  uuid "DE84747E-90A6-4731-92A4-A9C6823D35DE"  # TextMate only

  rule do
    from %r/^([a-zA-Z0-9][a-zA-Z0-9_+\-]*)\s*(=)\s*/
    to %r/$/
    both 1 => 'support.constant.tm-properties',
         2 => 'punctuation.separator.key-value.tm-properties'
    include "#string"
  end
  rule 'meta.section.tm-properties' do
    from %r/^\[/,
      0 => 'punctuation.definition.section.begin.tm-properties'
    to %r/\]/,
      0 => 'punctuation.definition.section.end.tm-properties'
    include "#string"
  end
  include "#comment"

  fragment :comment do
    rule do
      from %r/(^[ \t]+)?(?=#)/,
        1 => 'punctuation.whitespace.comment.leading.tm-properties'
      to %r/(?!\G)/,
        1 => 'punctuation.definition.comment.tm-properties'
      rule 'comment.line.number-sign.tm-properties' do
        from %r/#/,
          0 => 'punctuation.definition.comment.tm-properties'
        to %r/\n/
      end
    end
  end

  fragment :string do
    rule 'string.unquoted.tm-properties' do
      match %r/[a-zA-Z0-9][a-zA-Z0-9_+\-]*/
    end
    rule 'string.quoted.double.tm-properties' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.tm-properties'
      to %r/"/,
        0 => 'punctuation.definition.string.end.tm-properties'
      rule 'constant.character.escape.tm-properties' do
        match %r/\\./
      end
    end
    rule 'string.quoted.single.tm-properties' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.tm-properties'
      to %r/'/,
        0 => 'punctuation.definition.string.end.tm-properties'
    end
  end
end
