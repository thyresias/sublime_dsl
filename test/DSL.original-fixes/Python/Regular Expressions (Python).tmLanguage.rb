# encoding: windows-1252

language 'Regular Expressions (Python)' => 'source.regexp.python' do
  # Matches Python's regular expression syntax.
  file_types %w(re)
  folding_start_marker %r'(/\*|\{|\()'
  folding_stop_marker %r'(\*/|\}|\))'
  uuid "DD867ABF-1EC6-415D-B047-687F550A1D51"  # TextMate only

  rule 'keyword.control.anchor.regexp' do
    match %r/\\[bBAZzG]|\^|\$/
  end
  rule 'keyword.other.back-reference.regexp' do
    match %r/\\[1-9][0-9]?/
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
    match %r/(?<=^|\s)#\s[[a-zA-Z0-9,. \t?!-:][^\x00-\x7F]]*$/
  end
  rule 'keyword.other.option-toggle.regexp' do
    match %r/\(\?[iLmsux]+\)/
  end
  rule 'keyword.other.back-reference.named.regexp' do
    match %r/(\()(\?P=([a-zA-Z_][a-zA-Z_0-9]*\w*))(\))/
  end
  rule 'meta.group.assertion.regexp' do
    from %r/(\()((\?=)|(\?!)|(\?<=)|(\?<!))/,
      1 => 'punctuation.definition.group.regexp',
      2 => 'punctuation.definition.group.assertion.regexp',
      3 => 'meta.assertion.look-ahead.regexp',
      4 => 'meta.assertion.negative-look-ahead.regexp',
      5 => 'meta.assertion.look-behind.regexp',
      6 => 'meta.assertion.negative-look-behind.regexp'
    to %r/(\))/,
      1 => 'punctuation.definition.group.regexp'
    include "$self"
  end
  rule 'meta.group.assertion.conditional.regexp' do
    # we can make this more sophisticated to match the | character that separates yes-pattern from no-pattern, but it's not really necessary.
    from %r/(\()(\?\(([1-9][0-9]?|[a-zA-Z_][a-zA-Z_0-9]*)\))/,
      1 => 'punctuation.definition.group.regexp',
      2 => 'punctuation.definition.group.assertion.conditional.regexp',
      3 => 'entity.name.section.back-reference.regexp'
    to %r/(\))/
    include "$self"
  end
  rule 'meta.group.regexp' do
    from %r/(\()((\?P<)([a-z]\w*)(>)|(\?:))?/,
      1 => 'punctuation.definition.group.regexp',
      3 => 'punctuation.definition.group.capture.regexp',
      4 => 'entity.name.section.group.regexp',
      5 => 'punctuation.definition.group.capture.regexp',
      6 => 'punctuation.definition.group.no-capture.regexp'
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
        match %r/((\\.)|.)\-((\\.)|[^\]])/,
          2 => 'constant.character.escape.backslash.regexp',
          4 => 'constant.character.escape.backslash.regexp'
      end
    end
  end
end
