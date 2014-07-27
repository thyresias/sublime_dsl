# encoding: utf-8

language 'Gri' => 'source.gri' do
  file_types %w(gri)
  first_line_match %r/-[*]-( Mode:)? Gri -[*]-/
  uuid "A7E000BE-6A87-4D7E-A053-469DA0DFEA02"  # TextMate only

  rule 'meta.function.gri' do
    match %r/(\`)(.*)(')/,
      1 => 'punctuation.definition.function.gri',
      2 => 'entity.name.function.gri',
      3 => 'punctuation.definition.function.gri'
  end
  rule do
    from %r/(^[ \t]+)?(?=#)/,
      1 => 'punctuation.whitespace.comment.leading.gri'
    to %r/(?!\G)/
    rule 'comment.line.number-sign.gri' do
      from %r/#/,
        0 => 'punctuation.definition.comment.gri'
      to %r/\n/
      rule 'punctuation.separator.continuation.gri' do
        match %r/(?>\\\s*\n)/
      end
    end
  end
  rule do
    from %r'(^[ \t]+)?(?=//)',
      1 => 'punctuation.whitespace.comment.leading.gri'
    to %r/(?!\G)/
    rule 'comment.line.double-slash.gri' do
      from %r'//',
        0 => 'punctuation.definition.comment.gri'
      to %r/\n/
      rule 'punctuation.separator.continuation.gri' do
        match %r/(?>\\\s*\n)/
      end
    end
  end
  rule 'keyword.control.gri' do
    match %r/\b(break|else|end|if|return|rpn|while)\b/
  end
  rule 'keyword.operator.arithmetic.gri' do
    match %r'(\-|\+|\*|\/|%\/%|%%|\^)'
  end
  rule 'keyword.operator.assignment.gri' do
    match %r/(=|<-)/
  end
  rule 'keyword.operator.comparison.gri' do
    match %r/(==|!=)/
  end
  rule 'constant.numeric.gri' do
    match %r/\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)\b/
  end
  rule 'string.unquoted.heredoc.doublequote.gri' do
    from %r/(<< *")([^"]*)(")/
    to %r/^§2$/
    both 1 => 'punctuation.definition.heredoc.gri',
         3 => 'punctuation.definition.heredoc.gri'
  end
  rule 'variable.other.synonym.gri' do
    match %r/(\\)[\.a-zA-Z0-9_][\.a-zA-Z0-9_]*\b/,
      1 => 'punctuation.definition.variable.gri'
  end
  rule 'variable.other.variable.gri' do
    match %r/(\.)[a-zA-Z0-9_][a-zA-Z0-9_]*(\.)/,
      1 => 'punctuation.definition.variable.gri',
      2 => 'punctuation.definition.variable.gri'
  end
  rule 'variable.other.variabledot.gri' do
    match %r/(\.\.)[a-zA-Z0-9_][a-zA-Z0-9_]*(\.\.)/,
      1 => 'punctuation.definition.variable.gri',
      2 => 'punctuation.definition.variable.gri'
  end
  rule 'string.quoted.double.gri' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.gri'
    to %r/"/,
      0 => 'punctuation.definition.string.end.gri'
  end
end
