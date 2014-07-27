# encoding: utf-8

language 'R' => 'source.r' do
  file_types %w(R r s S Rprofile)
  folding_start_marker %r/(\(\s*$|\{\s*$)/
  folding_stop_marker %r/(^\s*\)|^\s*\})/
  key_equivalent "^~R"  # TextMate only
  uuid "B2E6B78D-6E70-11D9-A369-000D93B3A10E"  # TextMate only

  rule 'comment.line.number-sign.r' do
    match %r/(#).*$\n?/,
      1 => 'punctuation.definition.comment.r'
  end
  rule 'storage.type.r' do
    match %r/\b(logical|numeric|character|complex|matrix|array|data\.frame|list|factor)(?=\s*\()/
  end
  rule 'keyword.control.r' do
    match %r/\b(function|if|break|next|repeat|else|for|return|switch|while|in|invisible)\b/
  end
  rule 'constant.numeric.r' do
    match %r/\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)(L|l|UL|ul|u|U|F|f|ll|LL|ull|ULL)?\b/
  end
  rule 'constant.language.r' do
    match %r/\b(TRUE|FALSE|NULL|NA|Inf|NaN)\b/
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
    match %r/(\.\.\.|\$|:|\~)/
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
    match %r/([a-zA-Z._][a-zA-Z0-9._]*)\s*(<-)\s*(function)/,
      1 => 'entity.name.function.r',
      2 => 'keyword.operator.assignment.r',
      3 => 'keyword.control.r'
  end
  rule do
    match %r/([a-zA-Z._][a-zA-Z0-9._]*)\s*\(/
  end
  rule do
    match %r/([a-zA-Z._][a-zA-Z0-9._]*)\s*(=)(?=[^=])/,
      1 => 'variable.parameter.r',
      2 => 'keyword.operator.assignment.r'
  end
  rule 'variable.other.r' do
    match %r/\b([a-zA-Z._][a-zA-Z0-9._]*)\b/
  end
end
