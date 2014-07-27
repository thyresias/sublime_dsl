# encoding: utf-8

language 'Diff' => 'source.diff' do
  file_types %w(diff patch)
  first_line_match %r'(?x)^
    (===\ modified\ file
    |==== \s* // .+ \s - \s .+ \s+ ====
    |Index:[ ]
    |---\ [^%]
    |\*\*\*.*\d{4}\s*$
    |\d+(,\d+)* (a|d|c) \d+(,\d+)* $
    |diff\ --git[ ]
    )
  '
  folding_start_marker %r/^\+\+\+/
  folding_stop_marker %r/^---|^$/
  key_equivalent "^~D"  # TextMate only
  uuid "7E848FF4-708E-11D9-97B4-0011242E4184"  # TextMate only

  rule 'meta.separator.diff' do
    match %r/^((\*{15})|(={67})|(-{3}))$\n?/,
      1 => 'punctuation.definition.separator.diff'
  end
  rule 'meta.diff.range.normal' do
    match %r/^\d+(,\d+)*(a|d|c)\d+(,\d+)*$\n?/
  end
  rule 'meta.diff.range.unified' do
    match %r/^(@@)\s*(.+?)\s*(@@)($\n?)?/,
      1 => 'punctuation.definition.range.diff',
      2 => 'meta.toc-list.line-number.diff',
      3 => 'punctuation.definition.range.diff'
  end
  rule 'meta.diff.range.context' do
    match %r/^(((\-{3}) .+ (\-{4}))|((\*{3}) .+ (\*{4})))$\n?/,
      3 => 'punctuation.definition.range.diff',
      4 => 'punctuation.definition.range.diff',
      6 => 'punctuation.definition.range.diff',
      7 => 'punctuation.definition.range.diff'
  end
  rule 'meta.diff.header.from-file' do
    match %r/(^(((-{3}) .+)|((\*{3}) .+))$\n?|^(={4}) .+(?= - ))/,
      4 => 'punctuation.definition.from-file.diff',
      6 => 'punctuation.definition.from-file.diff',
      7 => 'punctuation.definition.from-file.diff'
  end
  rule 'meta.diff.header.to-file' do
    match %r/(^(\+{3}) .+$\n?| (-) .* (={4})$\n?)/,
      2 => 'punctuation.definition.to-file.diff',
      3 => 'punctuation.definition.to-file.diff',
      4 => 'punctuation.definition.to-file.diff'
  end
  rule 'markup.inserted.diff' do
    match %r/^(((>)( .*)?)|((\+).*))$\n?/,
      3 => 'punctuation.definition.inserted.diff',
      6 => 'punctuation.definition.inserted.diff'
  end
  rule 'markup.changed.diff' do
    match %r/^(!).*$\n?/,
      1 => 'punctuation.definition.inserted.diff'
  end
  rule 'markup.deleted.diff' do
    match %r/^(((<)( .*)?)|((-).*))$\n?/,
      3 => 'punctuation.definition.inserted.diff',
      6 => 'punctuation.definition.inserted.diff'
  end
  rule 'meta.diff.index' do
    match %r/^Index(:) (.+)$\n?/,
      1 => 'punctuation.separator.key-value.diff',
      2 => 'meta.toc-list.file-name.diff'
  end
end
