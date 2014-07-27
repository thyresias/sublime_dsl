# encoding: utf-8

language 'Io' => 'source.io' do
  file_types %w(io)
  key_equivalent "^~I"  # TextMate only
  uuid "BD798537-3548-47F3-A6AB-7FB95C45DB83"  # TextMate only

  rule do
    # we match this to overload return inside () --Allan; scoping rules for what gets the scope have changed, so we now group the ) instead of the ( -- Rob
    match %r/\((\))/,
      1 => 'meta.empty-parenthesis.io'
  end
  rule do
    # We want to do the same for ,) -- Seckar; same as above -- Rob
    match %r/\,(\))/,
      1 => 'meta.comma-parenthesis.io'
  end
  rule 'keyword.control.io' do
    match %r/\b(if|ifTrue|ifFalse|ifTrueIfFalse|for|loop|reverseForeach|foreach|map|continue|break|while|do|return)\b/
  end
  rule 'comment.block.io' do
    from %r'/\*'
    to %r'\*/'
    both 0 => 'punctuation.definition.comment.io'
  end
  rule do
    from %r'(^[ \t]+)?(?=//)',
      1 => 'punctuation.whitespace.comment.leading.io'
    to %r/(?!\G)/
    rule 'comment.line.double-slash.io' do
      from %r'//',
        0 => 'punctuation.definition.comment.io'
      to %r/\n/
    end
  end
  rule do
    from %r/(^[ \t]+)?(?=#)/,
      1 => 'punctuation.whitespace.comment.leading.io'
    to %r/(?!\G)/
    rule 'comment.line.number-sign.io' do
      from %r/#/,
        0 => 'punctuation.definition.comment.io'
      to %r/\n/
    end
  end
  rule 'variable.language.io' do
    # I wonder if some of this isn't variable.other.language? --Allan; scoping this as variable.language to match Objective-C's handling of 'self', which is inconsistent with C++'s handling of 'this' but perhaps intentionally so -- Rob
    match %r/\b(self|sender|target|proto|protos|parent)\b/
  end
  rule 'keyword.operator.io' do
    match %r'<=|>=|=|:=|\*|\||\|\||\+|-|/|&|&&|>|<|\?|@|@@|\b(and|or)\b'
  end
  rule 'constant.other.io' do
    # FIXME: (warning) character class has duplicated range
    match %r/\bGL[\w_]+\b/
  end
  rule 'support.class.io' do
    match %r/\b([A-Z](\w+)?)\b/
  end
  rule 'support.function.io' do
    match %r/\b(clone|call|init|method|list|vector|block|(\w+(?=\s*\()))\b/
  end
  rule 'support.function.open-gl.io' do
    match %r/\b(gl(u|ut)?[A-Z]\w+)\b/
  end
  rule 'string.quoted.triple.io' do
    from %r/"""/,
      0 => 'punctuation.definition.string.begin.io'
    to %r/"""/,
      0 => 'punctuation.definition.string.end.io'
    rule 'constant.character.escape.io' do
      match %r/\\./
    end
  end
  rule 'string.quoted.double.io' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.io'
    to %r/"/,
      0 => 'punctuation.definition.string.end.io'
    rule 'constant.character.escape.io' do
      match %r/\\./
    end
  end
  rule 'constant.numeric.io' do
    match %r/\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)(L|l|UL|ul|u|U|F|f)?\b/
  end
  rule 'variable.other.global.io' do
    match %r/(Lobby)\b/
  end
  rule 'constant.language.io' do
    match %r/\b(TRUE|true|FALSE|false|NULL|null|Null|Nil|nil|YES|NO)\b/
  end
end
