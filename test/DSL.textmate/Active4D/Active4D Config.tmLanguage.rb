# encoding: utf-8

language 'Active4D Config' => 'text.active4d-ini' do
  file_types %w(ini)
  key_equivalent "^~A"  # TextMate only
  uuid "BECA5580-F845-4715-889C-134DF4BF67C2"  # TextMate only

  rule do
    from %r/(^[ \t]+)?(?=`)/,
      1 => 'punctuation.whitespace.comment.leading.active4d-ini'
    to %r/(?!\G)/
    rule 'comment.line.backtick.active4d-ini' do
      from %r/`/,
        0 => 'punctuation.definition.comment.active4d-ini'
      to %r/\n/
    end
  end
  rule do
    from %r'(^[ \t]+)?(?=//)',
      1 => 'punctuation.whitespace.comment.leading.active4d-ini'
    to %r/(?!\G)/
    rule 'comment.line.double-slash.active4d-ini' do
      from %r'//',
        0 => 'punctuation.definition.comment.active4d-ini'
      to %r/\n/
    end
  end
  rule do
    from %r/(^[ \t]+)?(?=\\\\)/,
      1 => 'punctuation.whitespace.comment.leading.active4d-ini'
    to %r/(?!\G)/
    rule 'comment.line.double-backslash.continuation.active4d-ini' do
      from %r/\\\\/,
        0 => 'punctuation.definition.comment.active4d-ini'
      to %r/\n/
    end
  end
  rule 'comment.block.active4d-ini' do
    from %r'/\*'
    to %r'\*/'
    both 0 => 'punctuation.definition.comment.active4d-ini'
  end
  rule 'string.quoted.double.active4d-ini' do
    from %r/"(?!"")/,
      0 => 'punctuation.definition.string.begin.active4d-ini'
    to %r/"/,
      0 => 'punctuation.definition.string.end.active4d-ini'
    include "#escaped_char"
  end
  rule 'constant.language.boolean.active4d-ini' do
    match %r/\b(?i)(true|false|yes|no)\b/
  end
  rule 'keyword.operator.active4d-ini' do
    match %r/=/
  end
  rule 'support.constant.active4d-ini' do
    match %r/(?i)((\b(use sessions|use session cookies|session var name|session timeout|session purge interval|session cookie path|session cookie name|session cookie domain|serve nonexecutables|script timeout|safe script dirs|safe doc dirs|root|refresh interval|receive timeout|platform charset|parameter mode|output encoding|output charset|max request size|log level|locale|lib extension|lib dirs|http error page|fusebox page|expires|executable extensions|error page|encrypted source|default page|content charset|client is web server|cache control|auto relate one|auto relate many|auto refresh libs|auto create vars|auto create sessions)\b)|(\<default\>|\<web\>|\<4d volume\>|\<boot volume\>))/
  end

  fragment :escaped_char do
    rule 'constant.character.escape.active4d-ini' do
      match %r/\\./
    end
  end
end
