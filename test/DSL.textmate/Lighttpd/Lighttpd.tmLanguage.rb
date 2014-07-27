# encoding: utf-8

language 'Lighttpd' => 'source.lighttpd-config' do
  # FIXME: no file types
  key_equivalent "^~L"  # TextMate only
  uuid "C244BFF4-2C1A-490F-831E-8EF7DF4E0C9B"  # TextMate only

  rule do
    from %r/(^[ \t]+)?(?=#)/,
      1 => 'punctuation.whitespace.comment.leading.lighttpd-config'
    to %r/(?!\G)/
    rule 'comment.line.number-sign.lighttpd-config' do
      from %r/#/,
        0 => 'punctuation.definition.comment.lighttpd-config'
      to %r/\n/
    end
  end
  rule do
    match %r/(=~|!~)\s*((").*("))/,
      1 => 'punctuation.separator.key-value.lighttpd-config',
      2 => 'string.regexp.lighttpd-config',
      3 => 'punctuation.definition.string.begin.lighttpd-config',
      4 => 'punctuation.definition.string.end.lighttpd-config'
  end
  rule do
    match %r/(=>?)\s*([0-9]+)/,
      1 => 'punctuation.separator.key-value.lighttpd-config',
      2 => 'constant.numeric.lighttpd-config'
  end
  rule 'punctuation.separator.key-value.lighttpd-config' do
    match %r/=|\+=|==|!=|=~|!~|=>/
  end
  rule 'string.quoted.double.lighttpd-config' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.lighttpd-config'
    to %r/"/,
      0 => 'punctuation.definition.string.end.lighttpd-config'
    rule 'constant.character.escape.quote.lighttpd-config' do
      match %r/""/
    end
  end
  rule 'variable.language.lighttpd-config' do
    match %r/(\$)[a-zA-Z][0-9a-zA-Z]*/,
      1 => 'punctuation.definition.variable.lighttpd-config'
  end
  rule 'support.constant.name.lighttpd-config' do
    match %r/^\s*[a-zA-Z][0-9a-zA-Z.-]*/
  end
  rule do
    match %r/(;)\s*$/,
      1 => 'invalid.illegal.semicolon-at-end-of-line.lighttpd-config'
  end
end
