# encoding: utf-8

language 'F-Script' => 'source.fscript' do
  file_types %w(fscript)
  key_equivalent "^~F"  # TextMate only
  uuid "C2CB9A74-C9FC-4F63-8BAF-E64B72A60DD4"  # TextMate only

  rule 'meta.dummy.symbol.ignore.fscript' do
    match %r/(:|\w):/
  end
  rule 'constant.other.symbol.fscript' do
    match %r/(:)\w+\b/,
      1 => 'punctuation.definition.symbol.fscript'
  end
  rule 'constant.numeric.fscript' do
    match %r/\b((([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)\b/
  end
  rule 'constant.other.block.compact.fscript' do
    match %r'#([[:lower:]]|_|[+=\-/!%&*|><~?])(\w|[+=\-/!%&*|><~?:])*'
  end
  rule 'meta.block.empty.fscript' do
    match %r/(\[)(?:\s*((?::\w+\s+)*:\w+)\s*\|)?\s*(\])/,
      1 => 'punctuation.section.block.fscript',
      2 => 'variable.parameter.block.fscript',
      3 => 'punctuation.section.block.fscript'
  end
  rule 'meta.block.fscript' do
    from %r/(\[)(?:\s*((?::\w+\s+)*:\w+)\s*\|)?/,
      1 => 'punctuation.section.block.fscript',
      2 => 'variable.parameter.block.fscript'
    to %r/\]/,
      0 => 'punctuation.section.block.fscript'
    rule 'meta.block.header.fscript' do
      match %r/\s+/
    end
    rule 'meta.block.content.fscript' do
      from %r/(?:\|(\s*(?:\w+\s+)*\w+\s*)?\||(?=[^\s|]))/
      to %r/(?=\])/
      both 1 => 'variable.other.local.fscript'
      include "$base"
    end
  end
  rule 'constant.language.fscript' do
    match %r/\b(true|YES|false|NO|sys|nil)\b/
  end
  rule do
    # a hack for the symbol popup
    match %r/^(\w+)\s*:=\s*(?=\[)/,
      1 => 'entity.name.function.fscript'
  end
  rule 'comment.block.quotes.fscript' do
    from %r/"/,
      0 => 'punctuation.definition.comment.begin.fscript'
    to %r/"/,
      0 => 'punctuation.definition.comment.end.fscript'
  end
  rule 'string.quoted.single.fscript' do
    from %r/'/,
      0 => 'punctuation.definition.string.begin.fscript'
    to %r/'/,
      0 => 'punctuation.definition.string.end.fscript'
    rule 'constant.character.escape.fscript' do
      match %r/\\./
    end
  end
end
