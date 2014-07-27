# encoding: utf-8

language 'Rez' => 'source.rez' do
  # Rez. Legacy Mac OS source code frequently contains Rez files. – chris@cjack.com
  file_types %w(r)
  key_equivalent "^~R"  # TextMate only
  uuid "F3EB29E9-8DB7-4052-9D48-5CDD2491D8D3"  # TextMate only

  rule 'comment.block.rez' do
    from %r'/\*'
    to %r'\*/'
    both 0 => 'punctuation.definition.comment.rez'
  end
  rule do
    from %r'(^[ \t]+)?(?=//)',
      1 => 'punctuation.whitespace.comment.leading.rez'
    to %r/(?!\G)/
    rule 'comment.line.double-slash.rez' do
      from %r'//',
        0 => 'punctuation.definition.comment.rez'
      to %r/\n/
    end
  end
  rule 'keyword.control.rez' do
    # Note that Xcode gets case sensitivity wrong (last checked Xcode 2.0). I'm not sure built-in functions are case-insensitive, though, so we might too.
    match %r/\b(?i:(change|data|delete|include|read|resource|type))\b/
  end
  rule 'storage.type.rez' do
    match %r/\b(?i:(align|array|binary|bit|bitstring|boolean|byte|case|char|cstring|decimal|enum|fill|hex|integer|key|literal|long|longint|nibble|octal|point|pstring|rect|string|switch|unsigned|wide|word|wstring))\b/
  end
  rule 'keyword.other.attributes.rez' do
    match %r/\b(?i:(appheap|locked|nonpurgeable|purgeable|sysheap|unlocked))\b/
  end
  rule 'support.function.built-in.rez' do
    match %r/(\$\$)(?i:(ArrayIndex|Attributes|BitField|Byte|CountOf|Date|Day|Format|Hour|ID|Long|Minute|Month|Name|PackedSize|Read|Resource|ResourceSize|Second|Shell|Time|Type|Version|Weekday|Word|Year))/,
      1 => 'punctuation.definition.function.rez'
  end
  rule 'constant.numeric.rez' do
    match %r/\b(((0(x|X|B)|\$)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)\b/
  end
  rule 'string.quoted.double.rez' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.rez'
    to %r/"/,
      0 => 'punctuation.definition.string.end.rez'
    include "#escaped_char"
  end
  rule 'string.quoted.single.rez' do
    from %r/'/,
      0 => 'punctuation.definition.string.begin.rez'
    to %r/'/,
      0 => 'punctuation.definition.string.end.rez'
    include "#escaped_char"
  end
  rule 'string.quoted.other.hex.rez' do
    from %r/\$"/,
      0 => 'punctuation.definition.string.begin.rez'
    to %r/"/,
      0 => 'punctuation.definition.string.end.rez'
    include "#escaped_char"
  end
  rule 'meta.preprocessor.rez' do
    match %r/^\s*(#)\s*(define|defined|else|elif|endif|if|ifdef|ifndef|include|line|printf|undef)\b/,
      1 => 'punctuation.definition.preprocessor.rez',
      2 => 'keyword.control.import.rez'
  end

  fragment :escaped_char do
    rule 'constant.character.escape.rez' do
      match %r/\\./
    end
  end
end
