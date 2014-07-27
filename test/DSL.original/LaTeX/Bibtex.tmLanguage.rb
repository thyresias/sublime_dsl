# encoding: utf-8

language 'BibTeX' => 'text.bibtex', file: 'Bibtex' do
  # Grammar based on description from http://artis.imag.fr/~Xavier.Decoret/resources/xdkbibtex/bibtex_summary.html#comment
  #
  #   TODO: Does not support @preamble
  #
  file_types %w(bib)
  folding_start_marker %r/\@[a-zA-Z]+\s*[{(].+,/
  folding_stop_marker %r/^\s*[)}]\s*$/
  uuid "47F30BA1-6B1D-11D9-9A60-000D93589AF6"  # TextMate only

  rule 'comment.line.at-sign.bibtex' do
    from %r/@Comment/,
      0 => 'punctuation.definition.comment.bibtex'
    to %r/$\n?/
  end
  rule 'meta.string-constant.braces.bibtex' do
    from %r/((@)String)\s*(\{)\s*([a-zA-Z]*)/,
      1 => 'keyword.other.string-constant.bibtex',
      2 => 'punctuation.definition.keyword.bibtex',
      3 => 'punctuation.section.string-constant.begin.bibtex',
      4 => 'variable.other.bibtex'
    to %r/\}/,
      0 => 'punctuation.section.string-constant.end.bibtex'
    include "#string_content"
  end
  rule 'meta.string-constant.parenthesis.bibtex' do
    from %r/((@)String)\s*(\()\s*([a-zA-Z]*)/,
      1 => 'keyword.other.string-constant.bibtex',
      2 => 'punctuation.definition.keyword.bibtex',
      3 => 'punctuation.section.string-constant.begin.bibtex',
      4 => 'variable.other.bibtex'
    to %r/\)/,
      0 => 'punctuation.section.string-constant.end.bibtex'
    include "#string_content"
  end
  rule 'meta.entry.braces.bibtex' do
    from %r/((@)[a-zA-Z]+)\s*(\{)\s*([^\s,]*)/,
      1 => 'keyword.other.entry-type.bibtex',
      2 => 'punctuation.definition.keyword.bibtex',
      3 => 'punctuation.section.entry.begin.bibtex',
      4 => 'entity.name.type.entry-key.bibtex'
    to %r/\}/,
      0 => 'punctuation.section.entry.end.bibtex'
    rule 'meta.key-assignment.bibtex' do
      from %r/([a-zA-Z]+)\s*(\=)/,
        1 => 'string.unquoted.key.bibtex',
        2 => 'punctuation.separator.key-value.bibtex'
      to %r/(?=[,}])/
      include "#string_content"
      include "#integer"
    end
  end
  rule 'meta.entry.parenthesis.bibtex' do
    from %r/((@)[a-zA-Z]+)\s*(\()\s*([^\s,]*)/,
      1 => 'keyword.other.entry-type.bibtex',
      2 => 'punctuation.definition.keyword.bibtex',
      3 => 'punctuation.section.entry.begin.bibtex',
      4 => 'entity.name.type.entry-key.bibtex'
    to %r/\)/,
      0 => 'punctuation.section.entry.end.bibtex'
    rule 'meta.key-assignment.bibtex' do
      from %r/([a-zA-Z]+)\s*(\=)/,
        1 => 'string.unquoted.key.bibtex',
        2 => 'punctuation.separator.key-value.bibtex'
      to %r/(?=[,)])/
      include "#string_content"
      include "#integer"
    end
  end
  rule 'comment.block.bibtex' do
    from %r/[^@\n]/
    to %r/(?=@)/
  end

  fragment :integer do
    rule 'constant.numeric.bibtex' do
      match %r/\d+/
    end
  end

  fragment :nested_braces do
    rule do
      from %r/\{/,
        0 => 'punctuation.definition.group.begin.bibtex'
      to %r/\}/,
        0 => 'punctuation.definition.group.end.bibtex'
      include "#nested_braces"
    end
  end

  fragment :string_content do
    rule 'string.quoted.double.bibtex' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.bibtex'
      to %r/"/,
        0 => 'punctuation.definition.string.end.bibtex'
      include "#nested_braces"
    end
    rule 'string.quoted.other.braces.bibtex' do
      from %r/\{/,
        0 => 'punctuation.definition.string.begin.bibtex'
      to %r/\}/,
        0 => 'punctuation.definition.string.end.bibtex'
      rule 'invalid.illegal.at-sign.bibtex' do
        match %r/@/
      end
      include "#nested_braces"
    end
  end
end
