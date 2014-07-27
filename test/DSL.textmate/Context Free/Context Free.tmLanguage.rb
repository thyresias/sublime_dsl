# encoding: utf-8

language 'Context Free' => 'source.context-free' do
  file_types ['cfdg', 'context free']
  key_equivalent "^~C"  # TextMate only
  uuid "8D0EE5A2-FB60-40F8-8D0F-1E1FFB506462"  # TextMate only

  include "#comment"
  include "#startshape-directive"
  include "#include-directive"
  include "#background-directive"
  include "#rule-directive"

  fragment :"background-directive" do
    rule do
      from %r/\b(background)/,
        1 => 'keyword.control.background.cfdg'
      to %r/(\})|(\])/,
        1 => 'punctuation.section.unordered-block.end.cfdg',
        2 => 'punctuation.section.ordered-block.end.cfdg'
      include "#color-adjustment-block"
      include "#comment"
    end
  end

  fragment :"color-adjustment" do
    rule 'constant.language.color-adjustment.cfdg' do
      match %r/\||\b(h(ue)?|sat(uration)?|b(rightness)?|a(lpha)?)\b/
    end
  end

  fragment :"color-adjustment-block" do
    rule do
      from %r/(\{)/,
        1 => 'punctuation.section.unordered-block.begin.cfdg'
      to %r/(?=\})/
      include "#color-adjustment"
      include "#number"
      include "#comment"
    end
    rule do
      from %r/(\[)/,
        1 => 'punctuation.section.ordered-block.begin.cfdg'
      to %r/(?=\])/
      include "#color-adjustment"
      include "#number"
      include "#comment"
    end
  end

  fragment :comment do
    rule do
      from %r/(^[ \t]+)?(?=#)/,
        1 => 'punctuation.whitespace.comment.leading.cfdg'
      to %r/(?!\G)/
      rule 'comment.line.number-sign.cfdg' do
        from %r/#/,
          0 => 'punctuation.definition.comment.cfdg'
        to %r/\n/
      end
    end
    rule do
      from %r'(^[ \t]+)?(?=//)',
        1 => 'punctuation.whitespace.comment.leading.cfdg'
      to %r/(?!\G)/
      rule 'comment.line.double-slash.cfdg' do
        from %r'//',
          0 => 'punctuation.definition.comment.cfdg'
        to %r/\n/
      end
    end
    rule 'comment.block.cfdg' do
      from %r'(/\*)',
        1 => 'punctuation.definition.comment.begin.cfdg'
      to %r'(\*/)',
        1 => 'punctuation.definition.comment.end.cfdg'
    end
  end

  fragment :"geometry-adjustment" do
    rule 'constant.language.geometry-adjustment.cfdg' do
      match %r/\b(x|y|z|s(ize)?|r(ot(ate)?)?|f(lip)?|skew)\b/
    end
  end

  fragment :"include-directive" do
    rule do
      match %r/\b(include)\s++(\S++)/,
        1 => 'keyword.control.include.cfdg',
        2 => 'string.unquoted.file-name.cfdg'
    end
  end

  fragment :loop do
    rule do
      from %r/(\d++)\s*+(\*)/,
        1 => 'constant.numeric.cfdg',
        2 => 'keyword.operator.loop.cfdg'
      to %r/(\})|(\])/,
        1 => 'punctuation.section.unordered-block.end.cfdg',
        2 => 'punctuation.section.ordered-block.end.cfdg'
      include "#shape-adjustment-block"
      include "#comment"
    end
  end

  fragment :number do
    rule 'constant.numeric.cfdg' do
      match %r/(\+|\-)?((\d++)?(\.))?\d++/,
        1 => 'keyword.operator.sign.cfdg',
        4 => 'punctuation.separator.integer-float.cfdg'
    end
  end

  fragment :rule do
    rule do
      from %r/(\{)/,
        1 => 'punctuation.section.rule.begin.cfdg'
      to %r/(?=\})/
      include "#loop"
      include "#shape-replacement"
      include "#comment"
    end
  end

  fragment :"rule-directive" do
    rule do
      from %r/\b(rule)\s++([a-zA-Z_][a-zA-Z_\.\d]*+)(\s++(((\d++)?(\.))?\d++))?/,
        1 => 'keyword.control.rule.cfdg',
        2 => 'entity.name.function.rule.definition.cfdg',
        4 => 'constant.numeric.cfdg',
        7 => 'punctuation.separator.integer-float.cfdg'
      to %r/(\})/,
        1 => 'punctuation.section.rule.end.cfdg'
      include "#rule"
      include "#comment"
    end
  end

  fragment :"shape-adjustment-block" do
    rule do
      from %r/(\{)/,
        1 => 'punctuation.section.unordered-block.begin.cfdg'
      to %r/(?=\})/
      include "#color-adjustment"
      include "#geometry-adjustment"
      include "#number"
      include "#comment"
    end
    rule do
      from %r/(\[)/,
        1 => 'punctuation.section.ordered-block.begin.cfdg'
      to %r/(?=\])/
      include "#color-adjustment"
      include "#geometry-adjustment"
      include "#number"
      include "#comment"
    end
  end

  fragment :"shape-replacement" do
    rule do
      from %r/([a-zA-Z_][a-zA-Z_\.\d]*+)/,
        1 => 'entity.name.function.rule.cfdg'
      to %r/(\})|(\])/,
        1 => 'punctuation.section.unordered-block.end.cfdg',
        2 => 'punctuation.section.ordered-block.end.cfdg'
      include "#shape-adjustment-block"
      include "#comment"
    end
  end

  fragment :"startshape-directive" do
    rule do
      match %r/\b(startshape)\s++([a-zA-Z_][a-zA-Z_\.\d]*+)/,
        1 => 'keyword.control.startshape.cfdg',
        2 => 'entity.name.function.rule.cfdg'
    end
  end
end
