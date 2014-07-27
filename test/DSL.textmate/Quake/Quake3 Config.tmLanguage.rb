# encoding: utf-8

language 'Quake Style .cfg' => 'source.quake-config', file: 'Quake3 Config' do
  file_types %w(cfg)
  key_equivalent "^~Q"  # TextMate only
  uuid "AAB8717E-6E5C-11D9-9BE0-0011242E4184"  # TextMate only

  rule 'keyword.other.quake3' do
    # the 2nd part of the regex is just to capture binds to number-keys and prevent them from getting highlighted as values.
    match %r/\b(set(a|u|s)?|bind|undbind|unbindall|vstr|exec|kill|say|say_team|quit|echo)(\s+\d)?\b/
  end
  rule 'constant.numeric.quake3' do
    match %r/\b\d+(\.\d+)?\b/
  end
  rule 'string.quoted.double.quake3' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.quake3'
    to %r/"/,
      0 => 'punctuation.definition.string.end.quake3'
    rule 'constant.character.escape.quake3' do
      match %r/\\./
    end
    rule 'keyword.other.string-embedded.quake3' do
      match %r/\b(set(a|u|s)?|bind|unbindall|vstr|exec|kill|say|say_team|quit|echo)\b/
    end
  end
  rule do
    from %r'(^[ \t]+)?(?=//)',
      1 => 'punctuation.whitespace.comment.leading.quake3'
    to %r/(?!\G)/
    rule 'comment.line.double-slash.quake3' do
      from %r'//',
        0 => 'punctuation.definition.comment.quake3'
      to %r/\n/
    end
  end
end
