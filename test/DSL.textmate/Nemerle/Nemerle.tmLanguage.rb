# encoding: utf-8

language 'Nemerle' => 'source.nemerle' do
  file_types %w(n)
  key_equivalent "^~N"  # TextMate only
  uuid "F563968D-4CB3-11DB-9F95-00112474B8F0"  # TextMate only

  rule do
    from %r'(^[ \t]+)?(?=//)',
      1 => 'punctuation.whitespace.comment.leading.nemerle'
    to %r/(?!\G)/
    rule 'comment.line.double-slash.nemerle' do
      from %r'//',
        0 => 'punctuation.definition.comment.nemerle'
      to %r/\n/
    end
  end
  rule 'comment.block.nemerle' do
    from %r'/\*'
    to %r'\*/'
    both 0 => 'punctuation.definition.comment.nemerle'
  end
  rule 'constant.language.nemerle' do
    match %r/\b(|false|null|true)\b/
  end
  rule 'constant.numeric.nemerle' do
    match %r/\b(([0-9]+(\.|\_)?[0-9]*(b|bu|d|f|L|LU|m|u|ub|UL)?)|(0(b|o|x)[0-9]+))\b/
  end
  rule 'keyword.control.nemerle' do
    match %r/\b(catch|else|finally|for|foreach|if|match|repeat|try|unless|when|while)\b/
  end
  rule 'keyword.operator.nemerle' do
    match %r'(\+|\-|\*|\/|\%)\=?'
  end
  rule 'keyword.other.nemerle' do
    match %r/\b(\_|as|assert|base|checked|do|fun|get|ignore|implements|in|is|lock|namespace|out|params|ref|set|syntax|throw|typeof|unchecked|using|with)\b/
  end
  rule 'storage.type.nemerle' do
    match %r/\b(array|bool|byte|char|class|decimal|double|enum|float|int|interface|list|long|macro|module|object|sbyte|short|string|struct|type|uint|ulong|ushort|variant|void)\b/
  end
  rule 'storage.modifier.nemerle' do
    match %r/\b(abstract|def|delegate|event|extern|internal|mutable|override|public|private|protected|sealed|static|volatile|virtual|new)\b/
  end
  rule 'variable.language.nemerle' do
    match %r/this/
  end
  rule 'string.quoted.double.nemerle' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.nemerle'
    to %r/"/,
      0 => 'punctuation.definition.string.end.nemerle'
    rule 'constant.character.escape.nemerle' do
      match %r/\\(\\|'|\"|a|b|c[A-Z]+|e|f|n|r|u0+[0-9,A-Z]+|v)/
    end
  end
  rule 'string.interpolated.nemerle' do
    from %r/\$"/,
      0 => 'punctuation.definition.string.begin.nemerle'
    to %r/"/,
      0 => 'punctuation.definition.string.end.nemerle'
    rule 'constant.character.escape' do
      # FIXME: (warning) character class has duplicated range
      match %r'\$[a-z,A-Z]+[a-z,A-Z,0-9]*( |\+|\-|\*|\/|\%)'
    end
  end
  rule 'string.quoted.single.nemerle' do
    from %r/'/,
      0 => 'punctuation.definition.string.begin.nemerle'
    to %r/'/,
      0 => 'punctuation.definition.string.end.nemerle'
    rule 'constant.character.escape' do
      match %r/\\(\\|'|\"|a|b|c[A-Z]+|e|f|n|r|u0+[0-9,A-Z]+|v)/
    end
  end
end
