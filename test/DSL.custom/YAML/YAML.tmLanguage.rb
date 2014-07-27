# encoding: utf-8

language 'YAML' => 'source.yaml' do
  file_types %w(yaml yml)
  key_equivalent "^~Y"  # TextMate only
  uuid "B0C44228-4F1F-11DA-AFF2-000A95AF0064"  # TextMate only

  # document separator
  rule do
    from %r/^---/, 0 => 'entity.name.section.begin.yaml'
    to %r/$/
    include "#line_content"
  end

  # document end
  rule 'entity.name.section.end.yaml' do
    match %r/^...\s*$/
  end

  # block of text >- |- etc., no leading dash
  rule do
    content_scope "string.unquoted.block.yaml"
    from %r/(?x)^ (\s*) (:?\w[\w\s\-]*\s*(:)\s+)? (?: (\&\w\S*)\s+ )? \s*
        (?: \|-?|>-? )
        \s*\n/,
      2 => 'entity.name.tag.yaml',
      3 => 'punctuation.separator.key-value.yaml',
      4 => 'variable.other.yaml'
    to %r/^(?!§1 )|^(?=§1(-|\w[\w\s\-]*\s*:)|#)/
  end

  # block of text >- |- etc., 1 leading dash
  rule do
    content_scope "string.unquoted.block.yaml"
    from %r/(?x)^ (\s*) (?: (-)(\s+) (:?\w[\w\s\-]*\s*(:)\s+)? ) (?: (\&\w\S*)\s+ )? \s*
        (?: \|-?|>-? )
        \s*\n/,
      2 => 'punctuation.definition.entry.yaml',
      4 => 'entity.name.tag.yaml',
      5 => 'punctuation.separator.key-value.yaml',
      6 => 'variable.other.yaml'
    to %r/^(?!^§1 §3)|^(?=§1 §3\S)/
  end

  # block of text >- |- etc., 2 leading dashes
  rule do
    content_scope "string.unquoted.block.yaml"
    from %r/(?x)^ (\s*) (?: (-)(\s+) (-)(\s+) (:?\w[\w\s\-]*\s*(:)\s+)? ) (?: (\&\w\S*)\s+ )? \s*
        (?: \|-?|>-? )
        \s*\n/,
      2 => 'punctuation.definition.entry.yaml',
      6 => 'entity.name.tag.yaml',
      7 => 'punctuation.separator.key-value.yaml',
      8 => 'variable.other.yaml'
    to %r/^(?!^§1 §3 §5)|^(?=§1 §3 §5\S)/
  end

  # comment
  rule 'comment.line.yaml' do
    match %r/\s*\#.*$/
  end

  # type name like !ruby/object:Test
  rule do
    match %r'(?x)^\s* (?: (?:(-)\s+)* (:?\w[\w\s\-]*\s*(:)\s+)? ) (?: (\&\w\S*)\s+ )?
        \s*
        (!!?(?:\w[\w:/]*)?)
        \s*$',
      1 => 'punctuation.definition.entry.yaml',
      2 => 'entity.name.tag.yaml',
      3 => 'punctuation.separator.key-value.yaml',
      4 => 'variable.other.yaml',
      5 => 'entity.name.type.yaml'
  end

  # number
  rule do
    match %r'(?x)^\s* (?: (?:(-)\s+)* (:?\w[\w\s\-]*\s*(:)\s+)? )  (?: (\&\w\S*)\s+ )? (?: (!!?(?:\w[\w:/]*)?)? \s+ )? \s*
        (
          ( (0(x|X)[0-9a-fA-F]*)
          | (([0-9]+\.?[0-9]*) | (\.[0-9]+)) ((e|E)(\+|-)?[0-9]+)?
          ) (L|l|UL|ul|u|U|F|f)?
        ) \s*(?=$|\#)',
      1 => 'punctuation.definition.entry.yaml',
      2 => 'entity.name.tag.yaml',
      3 => 'punctuation.separator.key-value.yaml',
      4 => 'variable.other.yaml',
      5 => 'entity.name.type.yaml',
      6 => 'constant.numeric.yaml'
  end

  # date/time
  rule do
    match %r'(?x)^\s* (?: (?:(-)\s+)* (:?\w[\w\s\-]*\s*(:)\s+)? )  (?: (\&\w\S*)\s+ )? (?: (!!?(?:\w[\w:/]*)?)? \s+ )? \s*
        (
          [0-9]{4}-[0-9]{2}-[0-9]{2}
          (\s[0-9:\.]+ (\s[\+-][0-9:]+)? )?
        )\s*(?=$|\#)',
      1 => 'punctuation.definition.entry.yaml',
      2 => 'entity.name.tag.yaml',
      3 => 'punctuation.separator.key-value.yaml',
      4 => 'variable.other.yaml',
      5 => 'entity.name.type.yaml',
      6 => 'constant.numeric.date.yaml'
  end

  # true, false etc.
  rule do
    match %r'(?x)^\s* (?: (?:(-)\s+)* (:?\w[\w\s\-]*\s*(:))? )  (?: (\&\w\S*)\s+ )? (?: (!!?(?:\w[\w:/]*)?)? \s+ )? \s*
        (true|false|yes|no|~) \s* (?=$|\#)',
      1 => 'punctuation.definition.entry.yaml',
      2 => 'entity.name.tag.yaml',
      3 => 'punctuation.separator.key-value.yaml',
      4 => 'variable.other.yaml',
      5 => 'entity.name.type.yaml',
      6 => 'constant.language.yaml'
  end

  # anchor reference
  rule do
    match %r'(?x)^\s* (?: (?:(-)\s+)* (:?\w[\w\s\-]*\s*(:))? ) (?: (!!?(?:\w[\w:/]*)?)? \s+ )? \s*
        ( \*\w\S* ) \s* (?=$|\#)',
      1 => 'punctuation.definition.entry.yaml',
      2 => 'entity.name.tag.yaml',
      3 => 'punctuation.separator.key-value.yaml',
      4 => 'entity.name.type.yaml',
      5 => 'variable.other.yaml'
  end

  # a key name alone on the line
  rule do
    match %r'(?x)^\s* (?: (?:(-)\s+)* (:?\w[\w\s\-]*\s*(:))? ) (?: (\&\w\S*)\s+ )? (?: (!!?(?:\w[\w:/]*)?)? \s+ )? \s* (?=$|\#)',
      1 => 'punctuation.definition.entry.yaml',
      2 => 'entity.name.tag.yaml',
      3 => 'punctuation.separator.key-value.yaml',
      4 => 'variable.other.yaml',
      5 => 'entity.name.type.yaml'
  end

  # a double-quoted string (cannot spot punctuation.definition.string.begin/end.yaml)
  rule do
    content_scope "string.quoted.double.yaml"
    from %r'(?x)^\s* (?: (?:(-)\s+)* (:?\w[\w\s\-]*\s*(:)\s+)? ) (?: (\&\w\S*)\s+ )? (?: (!!?(?:\w[\w:/]*)?)? \s+ )? \s* (")',
      1 => 'punctuation.definition.entry.yaml',
      2 => 'entity.name.tag.yaml',
      3 => 'punctuation.separator.key-value.yaml',
      4 => 'variable.other.yaml',
      5 => 'entity.name.type.yaml',
      6 => 'string.quoted.double.yaml'
    to %r/"/,
      0 => 'string.quoted.double.yaml'
    include "#escaped_char"
  end

  # a single-quoted string (same problem)
  rule do
    content_scope "string.quoted.double.yaml"
    from %r/(?x)^\s* (?: (?:(-)\s+)* (:?\w[\w\s\-]*\s*(:)\s+)? ) (?: (\&\w\S*)\s+ )? (?: (!!?(?:\w[\w:\/]*)?)? \s+ )? \s* (')/,
      1 => 'punctuation.definition.entry.yaml',
      2 => 'entity.name.tag.yaml',
      3 => 'punctuation.separator.key-value.yaml',
      4 => 'variable.other.yaml',
      5 => 'entity.name.type.yaml',
      6 => 'string.quoted.single.yaml'
    to %r/('(?!'))/,
      0 => 'string.quoted.double.yaml'
    to_last true
    rule 'constant.character.escape.yaml' do
      match %r/''/
    end
    include "#escaped_char"
  end

  # leading backtick and @ are reserved
  rule do
    match %r/(?x)^\s* (?: (?:(-)\s+)* (:?\w[\w\s\-]*\s*(:)\s+)? ) \s* ([@`].*) (?=$|\#)/,
      1 => 'punctuation.definition.entry.yaml',
      2 => 'entity.name.tag.yaml',
      3 => 'punctuation.separator.key-value.yaml',
      4 => 'invalid.illegal.reserved-leading.yaml'
  end

  # a non-quoted string
  rule do
    match %r/(?x)^\s* (?: (?:(-)\s+)* (:?\w[\w\s\-]*\s*(:)\s+)? )
        (?: (\&\w\S*)\s+ )?
        (?: (!!?(?:\w[\w:\/]*)?)? \s+ )? \s*
        ([^\s'"].*?)
        (?=\s*($|\#))/,
      1 => 'punctuation.definition.entry.yaml',
      2 => 'entity.name.tag.yaml',
      3 => 'punctuation.separator.key-value.yaml',
      4 => 'variable.other.yaml',
      5 => 'entity.name.type.yaml',
      6 => 'string.unquoted.yaml'
  end

  rule 'invalid.deprecated.trailing-whitespace.yaml' do
    disabled true
    match %r/( |  )+$/
  end

  fragment :escaped_char do
    rule 'constant.character.escape.yaml' do
      match %r/\\./
    end
  end

  fragment :line_content do
    # type name like !ruby/object:Test
    rule 'entity.name.type.yaml' do
      match %r'!!?(\w[\w:/]*)?'
    end
  end

end
