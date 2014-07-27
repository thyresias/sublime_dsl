# encoding: utf-8

language 'Pascal' => 'source.pascal' do
  file_types %w(pas p)
  key_equivalent "^~P"  # TextMate only
  uuid "F42FA544-6B1C-11D9-9517-000D93589AF6"  # TextMate only

  rule 'keyword.control.pascal' do
    match %r/\b(?i:(absolute|abstract|all|and|and_then|array|as|asm|attribute|begin|bindable|case|class|const|constructor|destructor|div|do|do|else|end|except|export|exports|external|far|file|finalization|finally|for|forward|goto|if|implementation|import|in|inherited|initialization|interface|interrupt|is|label|library|mod|module|name|near|nil|not|object|of|only|operator|or|or_else|otherwise|packed|pow|private|program|property|protected|public|published|qualified|record|repeat|resident|restricted|segment|set|shl|shr|then|to|try|type|unit|until|uses|value|var|view|virtual|while|with|xor))\b/
  end
  rule 'meta.function.prototype.pascal' do
    match %r/\b(?i:(function|procedure))\b\s+(\w+(\.\w+)?)(\(.*?\))?;\s*(?=(?i:attribute|forward|external))/,
      1 => 'storage.type.prototype.pascal',
      2 => 'entity.name.function.prototype.pascal'
  end
  rule 'meta.function.pascal' do
    match %r/\b(?i:(function|procedure))\b\s+(\w+(\.\w+)?)/,
      1 => 'storage.type.function.pascal',
      2 => 'entity.name.function.pascal'
  end
  rule 'constant.numeric.pascal' do
    match %r/\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)(L|l|UL|ul|u|U|F|f|ll|LL|ull|ULL)?\b/
  end
  rule do
    from %r/(^[ \t]+)?(?=--)/,
      1 => 'punctuation.whitespace.comment.leading.pascal'
    to %r/(?!\G)/
    rule 'comment.line.double-dash.pascal.one' do
      from %r/--/,
        0 => 'punctuation.definition.comment.pascal'
      to %r/\n/
    end
  end
  rule do
    from %r'(^[ \t]+)?(?=//)',
      1 => 'punctuation.whitespace.comment.leading.pascal'
    to %r/(?!\G)/
    rule 'comment.line.double-slash.pascal.two' do
      from %r'//',
        0 => 'punctuation.definition.comment.pascal'
      to %r/\n/
    end
  end
  rule 'comment.block.pascal.one' do
    from %r/\(\*/
    to %r/\*\)/
    both 0 => 'punctuation.definition.comment.pascal'
  end
  rule 'comment.block.pascal.two' do
    from %r/\{/
    to %r/\}/
    both 0 => 'punctuation.definition.comment.pascal'
  end
  rule 'string.quoted.double.pascal' do
    # Double quoted strings are an extension and (generally) support C-style escape sequences.
    from %r/"/,
      0 => 'punctuation.definition.string.begin.pascal'
    to %r/"/,
      0 => 'punctuation.definition.string.end.pascal'
    rule 'constant.character.escape.pascal' do
      match %r/\\./
    end
  end
  rule 'string.quoted.single.pascal' do
    from %r/'/,
      0 => 'punctuation.definition.string.begin.pascal'
    to %r/'/,
      0 => 'punctuation.definition.string.end.pascal'
    to_last true
    rule 'constant.character.escape.apostrophe.pascal' do
      match %r/''/
    end
  end
end
