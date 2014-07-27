# encoding: utf-8

language 'MoinMoin' => 'text.moinmoin' do
  file_types %w(moinmoin)
  key_equivalent "^~M"  # TextMate only
  uuid "DB315CBC-23FD-4952-9D64-F2AC0618A840"  # TextMate only

  rule 'markup.heading.1.moinmoin' do
    match %r/^\s*(=)\s.*\s(=)$\n?/,
      1 => 'punctuation.definition.heading.moimoin',
      2 => 'punctuation.definition.heading.moimoin'
  end
  rule 'markup.heading.2.moinmoin' do
    match %r/^\s*(==)\s.*\s(==)$\n?/,
      1 => 'punctuation.definition.heading.moimoin',
      2 => 'punctuation.definition.heading.moimoin'
  end
  rule 'markup.heading.3.moinmoin' do
    match %r/^\s*(===)\s.*\s(===)$\n?/,
      1 => 'punctuation.definition.heading.moimoin',
      2 => 'punctuation.definition.heading.moimoin'
  end
  rule 'markup.heading.4.moinmoin' do
    match %r/^\s*(====)\s.*\s(====)$\n?/,
      1 => 'punctuation.definition.heading.moimoin',
      2 => 'punctuation.definition.heading.moimoin'
  end
  rule 'markup.heading.5.moinmoin' do
    match %r/^\s*(=====)\s.*\s(=====)$\n?/,
      1 => 'punctuation.definition.heading.moimoin',
      2 => 'punctuation.definition.heading.moimoin'
  end
  rule 'meta.separator.moinmoin' do
    match %r/^\s*-----\s*$\n?/
  end
  rule 'meta.pragma.moimoin' do
    match %r/^#pragma.*/
  end
  rule 'comment.line.double-number-sign.moimoin' do
    match %r/^##/,
      0 => 'punctuation.definition.comment.moimoin'
  end
  rule do
    content_scope "markup.list.definition.moinmoin"
    from %r/^\s+(.*?(::))(?=\s+\S)/
    to %r/\n/
    both 1 => 'markup.list.definition.term.moinmoin',
         2 => 'punctuation.separator.definition.moinmoin'
    include "#inline"
  end
  rule do
    content_scope "markup.list.unnumbered.moinmoin"
    from %r/^\s+(\*)(\s)/
    to %r/\n/
    both 1 => 'punctuation.definition.list_item.moinmoin',
         2 => 'markup.list.unnumbered.moinmoin'
    include "#inline"
  end
  rule do
    content_scope "markup.list.numbered.moinmoin"
    from %r/^\s+((?:[aAiI]|\d+)\.(?:\#\d+)?)(\s)/
    to %r/\n/
    both 1 => 'punctuation.definition.list_item.moinmoin',
         2 => 'markup.list.numbered.moinmoin'
    include "#inline"
  end
  rule do
    content_scope "meta.table.moinmoin"
    from %r/^\s*(\|\|)/
    to %r/(\|\|$)|\n/
    both 1 => 'punctuation.definition.table.column.moinmoin',
         2 => 'punctuation.definition.table.column.moinmoin'
    include "#inline"
  end
  rule 'meta.paragraph.moinmoin' do
    from %r/^\s*(?=\S)/
    to %r/\n/
    include "#inline"
  end

  fragment :inline do
    rule 'markup.raw.block.moinmoin' do
      from %r/\{{3}(?!.*\}{3})/
      to %r/\}{3}/
      both 0 => 'punctuation.definition.raw.moinmoin'
    end
    rule 'markup.raw.inline.moinmoin' do
      match %r/(`)[^`]*(`)|({{{).*?(}}})/,
        1 => 'punctuation.definition.raw.moinmoin',
        2 => 'punctuation.definition.raw.moinmoin',
        3 => 'punctuation.definition.raw.moinmoin',
        4 => 'punctuation.definition.raw.moinmoin'
    end
    rule do
      content_scope "markup.italic.moinmoin"
      from %r/'{2}(?='{3}[^']*'{3})/
      to %r/'{2}(?!')|'{2}(?='{3})/
      both 0 => 'punctuation.definition.italic.moinmoin'
      include "#inline"
    end
    rule do
      content_scope "markup.bold.moinmoin"
      from %r/'{3}/
      to %r/'{3}/
      both 0 => 'punctuation.definition.bold.moinmoin'
      include "#inline"
    end
    rule do
      content_scope "markup.italic.moinmoin"
      from %r/'{2}/
      to %r/'{2}(?!')|'{2}(?='{3})/
      both 0 => 'punctuation.definition.italic.moinmoin'
      include "#inline"
    end
    rule do
      content_scope "markup.underline.moinmoin"
      from %r/__/
      to %r/__/
      both 0 => 'punctuation.definition.underline.moinmoin'
      include "#inline"
    end
    rule 'markup.underline.link.moinmoin' do
      match %r'(?<!\!)/?(?:[A-Z][a-z0-9]+[A-Z][a-z0-9]+[A-Za-z0-9]*)'
    end
    rule 'markup.underline.link.moinmoin' do
      match %r/(\[").*?("\])/,
        1 => 'punctuation.definition.link.moinmoin',
        2 => 'punctuation.definition.link.moinmoin'
    end
    rule 'markup.underline.link.moinmoin' do
      match %r/(\[):.*?:.*?(\])/,
        1 => 'punctuation.definition.link.moinmoin',
        2 => 'punctuation.definition.link.moinmoin'
    end
    rule 'markup.underline.link.moinmoin' do
      match %r'https?://\S+'
    end
    rule 'markup.underline.link.moinmoin' do
      match %r'(\[)https?://.*?(\])',
        1 => 'punctuation.definition.link.moinmoin',
        2 => 'punctuation.definition.link.moinmoin'
    end
    rule 'markup.underline.link.moinmoin' do
      match %r/attachment(:)\S+/,
        1 => 'punctuation.separator.key-value.moinmoin'
    end
    rule 'meta.table.column.moinmoin' do
      match %r/\|\|/,
        0 => 'punctuation.definition.table.column.moinmoin'
    end
    rule 'meta.macro.moinmoin' do
      match %r/(\[\[).*?(\]\])/,
        0 => 'punctuation.definition.macro.moinmoin'
    end
  end
end
