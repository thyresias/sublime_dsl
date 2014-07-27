# encoding: windows-1252

language 'R' => 'source.r' do
  file_types %w(R r s S Rprofile)
  key_equivalent "^~R"  # TextMate only
  uuid "B2E6B78D-6E70-11D9-A369-000D93B3A10E"  # TextMate only

  rule 'comment.line.pragma-mark.r' do
    match %r/^(#pragma[ \t]+mark)[ \t](.*)/,
      1 => 'comment.line.pragma.r',
      2 => 'entity.name.pragma.name.r'
  end
  rule do
    from %r/(^[ \t]+)?(?=#)/,
      1 => 'punctuation.whitespace.comment.leading.r'
    to %r/(?!\G)/
    rule 'comment.line.number-sign.r' do
      from %r/#/,
        0 => 'punctuation.definition.comment.r'
      to %r/\n/
    end
  end
  rule 'storage.type.r' do
    match %r/\b(logical|numeric|character|complex|matrix|array|data\.frame|list|factor)(?=\s*\()/
  end
  rule 'keyword.control.r' do
    match %r/\b(function|if|break|next|repeat|else|for|return|switch|while|in|invisible)\b/
  end
  rule 'constant.numeric.r' do
    match %r/\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)(i|L|l|UL|ul|u|U|F|f|ll|LL|ull|ULL)?\b/
  end
  rule 'constant.language.r' do
    match %r/\b(T|F|TRUE|FALSE|NULL|NA|Inf|NaN)\b/
  end
  rule 'support.constant.misc.r' do
    match %r/\b(pi|letters|LETTERS|month\.abb|month\.name)\b/
  end
  rule 'keyword.operator.arithmetic.r' do
    match %r'(\-|\+|\*|\/|%\/%|%%|%\*%|%in%|%o%|%x%|\^)'
  end
  rule 'keyword.operator.assignment.r' do
    match %r/(=|<-|<<-|->|->>)/
  end
  rule 'keyword.operator.comparison.r' do
    match %r/(==|!=|<>|<|>|<=|>=)/
  end
  rule 'keyword.operator.logical.r' do
    match %r/(!|&{1,2}|[|]{1,2})/
  end
  rule 'keyword.other.r' do
    match %r/(\.\.\.|\$|@|:|\~)/
  end
  rule 'string.quoted.double.r' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.r'
    to %r/"/,
      0 => 'punctuation.definition.string.end.r'
    rule 'constant.character.escape.r' do
      match %r/\\./
    end
  end
  rule 'string.quoted.single.r' do
    from %r/'/,
      0 => 'punctuation.definition.string.begin.r'
    to %r/'/,
      0 => 'punctuation.definition.string.end.r'
    rule 'constant.character.escape.r' do
      match %r/\\./
    end
  end
  rule 'meta.function.r' do
    match %r/([[:alpha:].][[:alnum:]._]*)\s*(<-)\s*(function)/,
      1 => 'entity.name.function.r',
      2 => 'keyword.operator.assignment.r',
      3 => 'keyword.control.r'
  end
  rule 'meta.method.declaration.r' do
    # FIXME: (error) invalid hex escape
    match %r/(setMethod|setReplaceMethod|setGeneric|setGroupGeneric|setClass)\s*\(\s*([[:alpha:]\d]+\s*=\s*)?("|\x27)([a-zA-Z._\[\$@][a-zA-Z0-9._\[]*?)\3.*/,
      1 => 'entity.name.tag.r',
      4 => 'entity.name.type.r'
  end
  rule do
    match %r/([[:alpha:].][[:alnum:]._]*)\s*\(/
  end
  rule do
    match %r/([[:alpha:].][[:alnum:]._]*)\s*(=)(?=[^=])/,
      1 => 'variable.parameter.r',
      2 => 'keyword.operator.assignment.r'
  end
  rule 'invalid.illegal.variable.other.r' do
    match %r/\b([\d_][[:alnum:]._]+)\b/
  end
  rule 'entity.namespace.r' do
    match %r/\b([[:alnum:]_]+)(?=::)/
  end
  rule 'variable.other.r' do
    match %r/\b([[:alnum:]._]+)\b/
  end
  rule 'meta.block.r' do
    from %r/\{/,
      0 => 'punctuation.section.block.begin.r'
    to %r/\}/,
      0 => 'punctuation.section.block.end.r'
    include "source.r"
  end
end
