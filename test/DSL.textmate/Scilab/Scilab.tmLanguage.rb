# encoding: utf-8

language 'Scilab' => 'source.scilab' do
  file_types %w(sce sci tst dem)
  uuid "14374AA3-A329-4623-8DFA-1ACC2CE222B9"  # TextMate only

  rule do
    from %r'(^[ \t]+)?(?=//)',
      1 => 'punctuation.whitespace.comment.leading.scilab'
    to %r/(?!\G)/
    rule 'comment.line.double-slash.scilab' do
      from %r'//',
        0 => 'punctuation.definition.comment.scilab'
      to %r/\n/
    end
  end
  rule 'constant.numeric.scilab' do
    match %r/\b(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?\b/
  end
  rule 'support.constant.scilab' do
    match %r/(%inf|%i|%pi|%eps|%e|%nan|%s|%t|%f)\b/
  end
  rule 'string.quoted.double.scilab' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.scilab'
    to %r/"(?!")/,
      0 => 'punctuation.definition.string.end.scilab'
    rule 'constant.character.escape.scilab' do
      match %r/''|""/
    end
  end
  rule 'string.quoted.single.scilab' do
    from %r/(?<![\w\]\)])'/,
      0 => 'punctuation.definition.string.begin.scilab'
    to %r/'(?!')/,
      0 => 'punctuation.definition.string.end.scilab'
    rule 'constant.character.escape.scilab' do
      match %r/''|""/
    end
  end
  rule do
    match %r/\b(function)\s+(?:[^=]+=\s*)?(\w+)(?:\s*\(.*\))?/,
      1 => 'keyword.control.scilab',
      2 => 'entity.name.function.scilab'
  end
  rule 'keyword.control.scilab' do
    match %r/\b(if|then|else|elseif|while|for|function|end|endfunction|return|select|case|break|global)\b/
  end
  rule 'punctuation.separator.continuation.scilab' do
    match %r/\.\.\.\s*$/
  end
end
