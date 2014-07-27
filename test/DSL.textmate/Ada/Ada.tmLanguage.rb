# encoding: utf-8

language 'Ada' => 'source.ada' do
  # Ada -- chris@cjack.com. Feel free to modify, distribute, be happy. Share and enjoy.
  file_types %w(adb ads)
  key_equivalent "^~A"  # TextMate only
  uuid "0AB8A36E-6B1D-11D9-B034-000D93589AF6"  # TextMate only

  rule 'meta.function.ada' do
    match %r'\b(?i:(function|procedure))\b\s+(\w+(\.\w+)?|"(?:\+|-|=|\*|/)")',
      1 => 'storage.type.function.ada',
      2 => 'entity.name.function.ada'
  end
  rule 'meta.function.ada' do
    match %r'\b(?i:(package)(?:\b\s+(body))?)\b\s+(\w+(\.\w+)*|"(?:\+|-|=|\*|/)")',
      1 => 'storage.type.package.ada',
      2 => 'keyword.other.body.ada',
      3 => 'entity.name.type.package.ada'
  end
  rule 'meta.function.ada' do
    match %r'\b(?i:(end))\b\s+(\w+(\.\w+)*|"(\+|-|=|\*|/)")\s?;',
      1 => 'storage.type.function.ada',
      2 => 'entity.name.function.ada'
  end
  rule 'meta.function.ada' do
    match %r/(^|[\r\n])((?i:((limited[ \t]*)?(private[ \t]*)?with))[ \t]+(\w+(\.\w+)*);[ \t]*)+/,
      1 => 'keyword.control.import.ada',
      2 => 'string.unquoted.import.ada'
  end
  rule 'keyword.control.ada' do
    match %r/\b(?i:(begin|end|package))\b/
  end
  rule 'keyword.other.ada' do
    match %r/\b(?i:(\=>|abort|abs|abstract|accept|access|aliased|all|and|array|at|body|case|constant|declare|delay|delta|digits|do|else|elsif|entry|exception|exit|for|function|generic|goto|if|in|interface|is|limited|loop|mod|new|not|null|of|or|others|out|overriding|pragma|private|procedure|protected|raise|range|record|rem|renames|requeue|return|reverse|select|separate|some|subtype|synchronized|tagged|task|terminate|then|type|until|use|when|while|with|xor))\b/
  end
  rule 'constant.numeric.ada' do
    match %r/\b(?i:([0-9](_?[0-9])*((#[0-9a-f](_?[0-9a-f])*#((e(\+|-)?[0-9](_?[0-9])*\b)|\B))|((\.[0-9](_?[0-9])*)?(e(\+|-)?[0-9](_?[0-9])*)?\b))))/
  end
  rule 'string.quoted.double.ada' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.ada'
    to %r/"/,
      0 => 'punctuation.definition.string.end.ada'
    rule 'invalid.illegal.lf-in-string.ada' do
      match %r/\n/
    end
  end
  rule do
    from %r/(^[ \t]+)?(?=--)/,
      1 => 'punctuation.whitespace.comment.leading.ada'
    to %r/(?!\G)/
    rule 'comment.line.double-dash.ada' do
      from %r/--/,
        0 => 'punctuation.definition.comment.ada'
      to %r/\n/
    end
  end
end
