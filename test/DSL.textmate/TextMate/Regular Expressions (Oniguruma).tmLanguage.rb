# encoding: utf-8

language 'Regular Expressions (Oniguruma)' => 'source.regexp.oniguruma' do
  # Matches Oniguruma's Ruby regexp syntax (TextMate uses Oniguruma in Ruby mode).
  file_types %w(re)
  uuid "D609BF3F-BEDB-41AE-BA6F-903CC77A7BB3"  # TextMate only

  rule 'keyword.control.anchor.regexp' do
    match %r/\\[bBAZzG]|\^|\$/
  end
  rule 'constant.character.numeric.regexp' do
    match %r/\\([0-7]{3}|x(\h\h|\{\h{,8}\}))/
  end
  rule 'keyword.other.back-reference.regexp' do
    match %r/\\[1-9]\d*/
  end
  rule 'keyword.other.back-reference.named.regexp' do
    match %r/(\\k\<)([a-z]\w*)(\>)/,
      1 => 'keyword.other.back-reference.named.regexp',
      2 => 'entity.name.section.back-reference',
      3 => 'keyword.other.back-reference.named.regexp'
  end
  rule 'constant.other.character-class.posix.regexp' do
    match %r/\[\:(\^)?(alnum|alpha|ascii|blank|cntrl|x?digit|graph|lower|print|punct|space|upper)\]/
  end
  rule 'keyword.operator.quantifier.regexp' do
    match %r/[?+*][?+]?|\{(\d+,\d+|\d+,|,\d+|\d+)\}\??/
  end
  rule 'keyword.operator.or.regexp' do
    match %r/\|/
  end
  rule 'comment.block.regexp' do
    from %r/\(\?\#/
    to %r/\)/
  end
  rule 'comment.line.number-sign.regexp' do
    # We are restrictive in what we allow to go after the comment character to avoid false positives, since the availability of comments depend on regexp flags.
    # FIXME: (error) invalid hex escape
    match %r/(?<=^|\s)#\s[[a-zA-Z0-9,. \t?!-:][^\x{00}-\x{7F}]]*$/
  end
  rule 'keyword.other.option-toggle.regexp' do
    match %r/\(\?[imx-]+\)/
  end
  rule 'meta.group.assertion.regexp' do
    from %r/(\()((\?=)|(\?!)|(\?<=)|(\?<!))/,
      1 => 'punctuation.definition.group.regexp',
      3 => 'meta.assertion.look-ahead.regexp',
      4 => 'meta.assertion.negative-look-ahead.regexp',
      5 => 'meta.assertion.look-behind.regexp',
      6 => 'meta.assertion.negative-look-behind.regexp'
    to %r/(\))/,
      1 => 'punctuation.definition.group.regexp'
    include "$self"
  end
  rule 'meta.group.regexp' do
    from %r/(\()((\?(>|[imx-]*:))|(\?<)([a-z]\w*)(>))?/,
      1 => 'punctuation.definition.group.regexp',
      3 => 'keyword.other.group-options.regexp',
      5 => 'keyword.other.group-options.regexp',
      6 => 'entity.name.section.group.regexp',
      7 => 'keyword.other.group-options.regexp'
    to %r/(\))/,
      1 => 'punctuation.definition.group.regexp'
    include "$self"
  end
  include "#character-class"

  fragment :"character-class" do
    rule 'constant.character.character-class.regexp' do
      match %r/\\[wWsSdDhH]|\./
    end
    rule 'constant.character.escape.backslash.regexp' do
      match %r/\\./
    end
    rule 'constant.other.character-class.set.regexp' do
      from %r/(\[)(\^)?/,
        1 => 'punctuation.definition.character-class.regexp',
        2 => 'keyword.operator.negation.regexp'
      to %r/(\])/,
        1 => 'punctuation.definition.character-class.regexp'
      include "#character-class"
      rule 'constant.other.character-class.range.regexp' do
        match %r/(.|(\\.))\-([^\]]|(\\.))/,
          2 => 'constant.character.escape.backslash.regexp',
          4 => 'constant.character.escape.backslash.regexp'
      end
      rule 'keyword.operator.intersection.regexp' do
        match %r/&&/
      end
    end
  end
end
