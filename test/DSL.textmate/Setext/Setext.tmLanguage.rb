# encoding: utf-8

language 'Setext' => 'text.setext' do
  file_types %w(etx etx.txt)
  first_line_match %r/setext/
  key_equivalent "^~S"  # TextMate only
  uuid "FB227CE6-DC4C-4632-BCA3-965AE0D8E419"  # TextMate only

  include "#inline"
  rule 'meta.header.setext' do
    match %r/^(Subject|Date|From)(:) (.+)/,
      1 => 'keyword.other.setext',
      2 => 'punctuation.separator.key-value.setext',
      3 => 'string.unquoted.setext'
  end
  rule 'markup.heading.1.setext' do
    match %r/^={3,}\s*$\n?/
  end
  rule 'markup.heading.2.setext' do
    match %r/^-{3,}\s*$\n?/
  end
  rule 'markup.quote.setext' do
    from %r/^(>)\s/
    to %r/$/
    both 1 => 'punctuation.definition.quote.setext'
    include "#inline"
  end
  rule 'markup.other.bullet.setext' do
    from %r/^([*])\s/
    to %r/$/
    both 1 => 'punctuation.definition.bullet.setext'
    include "#inline"
  end
  rule 'markup.raw.setext' do
    from %r/`/,
      0 => 'punctuation.definition.raw.begin.setext'
    to %r/`/,
      0 => 'punctuation.definition.raw.end.setext'
  end
  rule 'meta.note.def.setext' do
    match %r/^(\.{2}) ((_)[-\w.]+) +((\()(.+(\))|.+))$/,
      1 => 'punctuation.definition.note.setext',
      2 => 'constant.other.reference.note.setext',
      3 => 'punctuation.definition.reference.setext',
      4 => 'string.quoted.other.note.setext',
      5 => 'punctuation.definition.string.begin.setext',
      7 => 'punctuation.definition.string.end.setext'
  end
  rule 'meta.link.reference.def.setext' do
    match %r/^(\.{2}) ((_)[-\w.]+) +(.{2,})$/,
      1 => 'punctuation.definition.reference.setext',
      2 => 'constant.other.reference.link.setext',
      3 => 'punctuation.definition.reference.setext',
      4 => 'markup.underline.link.setext'
  end
  rule 'comment.line.double-dot.setext' do
    match %r/^(\.{2}) (?![.]).+$\n?/,
      1 => 'punctuation.definition.comment.setext'
  end
  rule 'comment.block.logical_end_of_text.setext' do
    from %r/^(\.{2})$/
    to %r/not(?<=possible)/
    both 1 => 'punctuation.definition.comment.setext'
  end

  fragment :bold do
    rule 'markup.bold.setext' do
      match %r/([*]{2}).+?([*]{2})/,
        1 => 'punctuation.definition.bold.setext',
        2 => 'punctuation.definition.bold.setext'
    end
  end

  fragment :doc_separator do
    rule 'meta.separator.document.setext' do
      match %r/\s*(\$\$)$\n?/,
        1 => 'punctuation.definition.separator.setext'
    end
  end

  fragment :hotword do
    rule 'meta.link.reference.setext' do
      match %r/\b[-\w.]*\w(?<!_)(_)\b/,
        0 => 'constant.other.reference.link.setext',
        1 => 'punctuation.definition.reference.setext'
    end
  end

  fragment :inline do
    include "#italic"
    include "#bold"
    include "#underline"
    include "#hotword"
    include "#link"
    include "#doc_separator"
  end

  fragment :italic do
    rule 'markup.italic.setext' do
      match %r/(~)\w+(~)/,
        1 => 'punctuation.definition.italic.setext',
        2 => 'punctuation.definition.italic.setext'
    end
  end

  fragment :link do
    rule do
      # Not actually part of setext, added for Tidbits.
      match %r'(<)((?i:mailto|https?|ftp|news)://.*?)(>)',
        1 => 'punctuation.definition.link.setext',
        2 => 'markup.underline.link.setext',
        3 => 'punctuation.definition.link.setext'
    end
  end

  fragment :underline do
    rule 'markup.underline.setext' do
      match %r/\b(_)\w+(?<!_)(_)\b|\b(_).+(?<!_)(_)\b/,
        1 => 'punctuation.definition.underline.setext',
        2 => 'punctuation.definition.underline.setext',
        3 => 'punctuation.definition.underline.setext',
        4 => 'punctuation.definition.underline.setext'
    end
  end
end
