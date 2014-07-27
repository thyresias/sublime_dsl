# encoding: utf-8

language 'Slate' => 'source.slate' do
  file_types %w(slate)
  key_equivalent "^~S"  # TextMate only
  uuid "A7676F36-C7D2-4C3E-8519-944577C66C6A"  # TextMate only

  rule 'keyword.control.slate' do
    match %r/\b(ifTrue:|ifFalse:|whileTrue:|whileFalse:|loop|ifNil:|ifNotNil:|ifNotNilDo:|if:|then:|else:|do:|\^|error:|warn:|signal)\b/
  end
  rule 'keyword.operator.slate' do
    match %r'\b(clone|new|copy|resend|forwardTo:|is:|isReally:|as:|[-+=<>,;/\\*]+)\b'
  end
  rule 'keyword.other.name-of-parameter.slate' do
    match %r/&[A-Za-z0-9_]+:?/
  end
  rule 'variable.language.slate' do
    match %r/\b(lobby|it|thisContext|here)\b/
  end
  rule 'string.quoted.double.slate' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.slate'
    to %r/"/,
      0 => 'punctuation.definition.string.end.slate'
    rule 'constant.character.escape.slate' do
      match %r/\\./
    end
  end
  rule 'string.quoted.single.slate' do
    from %r/'/,
      0 => 'punctuation.definition.string.begin.slate'
    to %r/'/,
      0 => 'punctuation.definition.string.end.slate'
    rule 'constant.character.escape.slate' do
      match %r/\\./
    end
  end
  rule 'meta.array.slate' do
    from %r/\#\{/,
      0 => 'punctuation.definition.array.begin.slate'
    to %r/\}/,
      0 => 'punctuation.definition.array.end.slate'
    include "#nest_curly"
    include "$self"
  end
  rule 'meta.array.literal.slate' do
    # Should restrict contents to literals.
    from %r/\#\(/,
      0 => 'punctuation.definition.array.begin.slate'
    to %r/\)/,
      0 => 'punctuation.definition.array.end.slate'
    include "#nest_parens"
  end
  rule 'meta.block.compact.slate' do
    match %r'#([[:lower:]]|_|[+=\-/!%&*|><~?])(\w|[+=\-/!%&*|><~?:])*'
  end
  rule 'meta.block.slate' do
    from %r/(\[)(?:\s*\|\s*((?::\w+\s+)*:\w+)\s*\|)?/
    to %r/(\])/
    both 1 => 'punctuation.section.block.slate',
         2 => 'variable.parameter.block.slate'
    rule 'meta.block.header.slate' do
      match %r/\s+/
    end
    rule 'meta.block.content.slate' do
      from %r/(?:\|(\s*(?:\w+\s+)*\w+\s*)?\||(?=[^\s|]))/
      to %r/(?=\])/
      both 1 => 'variable.other.local.slate'
      include "$base"
    end
  end
  rule 'meta.definition.slate' do
    from %r/define: #(\w+)/,
      1 => 'entity.name.type.slate'
    to %r/\s/
  end
  rule 'variable.parameter.slate' do
    match %r/\b(:\w+|\w+@)/
  end
  rule 'keyword.operator.logical.slate' do
    match %r'\b(/\\|\\/|and:|or:|not|xor:)\b'
  end
  rule 'constant.language.slate' do
    match %r/\b(True|False|Nil|NoRole)\b/
  end
  rule 'constant.numeric.slate' do
    match %r/\b[+-]?([0-9]+[Rr][0-9A-Za-z]+([.][0-9A-Za-z]+)?|[0-9]+([.][0-9]+)?)\b/
  end
  rule 'constant.character.slate' do
    match %r/(\$)(\S|\\[\\ntsbre0avf])/,
      1 => 'punctuation.definition.constant.slate'
  end
  rule 'constant.other.slate' do
    match %r/(#)\S+/,
      1 => 'punctuation.definition.constant.slate'
  end
  rule 'support.class.slate' do
    match %r/(\b\w+ traits\b)/
  end
  rule 'keyword.control.import.slate' do
    match %r'\`[-A-Za-z0-9+=*^<>?,;/\\]+:?'
  end
  rule 'invalid.deprecated.trailing-whitespace.slate' do
    match %r/\s+$/
  end
  include "#keyword"
  rule 'meta.function.unary.slate' do
    from %r/(\w+)@/,
      1 => 'variable.parameter.function.slate'
    to %r/($|\[)/,
      1 => 'entity.name.function.slate'
    include "$self"
  end

  # FIXME: this fragment is never referenced
  fragment :"binary-selector" do
    rule do
      # FIXME: (warning) character class has duplicated range
      match %r'\b([=+-\/?<>,;^*]+[A-Za-z0-9_=+-\/?<>,;^*]+[=+-\/?<>,;^*]+)\b'
    end
  end

  # FIXME: this fragment is never referenced
  fragment :"escaped-char" do
    rule do
      match %r/\\./
    end
  end

  fragment :keyword do
    rule 'variable.other.slate' do
      match %r/\b([A-Za-z_][A-Za-z_0-9]+:)\b/
    end
  end

  fragment :nest_curly do
    rule do
      from %r/\{/
      to %r/\}/
      include "#nest_curly"
    end
  end

  fragment :nest_parens do
    rule do
      from %r/\(/
      to %r/\)/
      include "#nest_parens"
    end
  end

  # FIXME: this fragment is never referenced
  fragment :"unary-selector" do
    rule do
      match %r/\b([A-Za-z_][A-Za-z_0-9]+)\b/
    end
  end
end
