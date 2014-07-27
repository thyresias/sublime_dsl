# encoding: utf-8

language 'SWeave' => 'text.tex.latex.sweave' do
  file_types %w(Snw Rnw snw rnw)
  key_equivalent "^~S"  # TextMate only
  uuid "1F450973-8259-4BA2-A754-48C634561A13"  # TextMate only

  rule 'meta.block.parameters.sweave' do
    from %r/^(<<)/,
      1 => 'punctuation.definition.parameters.begin.sweave'
    to %r/(>>)(?==)/,
      1 => 'punctuation.definition.parameters.end.sweave'
    rule 'meta.parameter.sweave' do
      match %r/(\w+)(=)(?:(true|false)|(verbatim|tex|hide)|([\w.]+))/,
        1 => 'keyword.other.name-of-parameter.sweave',
        2 => 'punctuation.separator.key-value.sweave',
        3 => 'constant.language.boolean.sweave',
        4 => 'constant.language.results.sweave',
        5 => 'string.unquoted.label.sweave'
    end
    rule 'string.unquoted.label.sweave' do
      match %r/[\w.]+/
    end
    rule 'punctuation.separator.parameters.sweave' do
      match %r/,/
    end
  end
  rule 'meta.block.code.sweave' do
    content_scope "source.r.embedded.sweave"
    from %r/(?<=>>)(=)(.*)\n/,
      1 => 'punctuation.section.embedded.begin.sweave',
      2 => 'comment.line.other.sweave'
    to %r/^(@)(.*)$/,
      1 => 'punctuation.section.embedded.end.sweave',
      2 => 'comment.line.other.sweave'
    rule 'invalid.illegal.sweave' do
      match %r/^\s+@.*\n?/
    end
    include "source.r"
  end
  rule 'invalid.illegal.sweave' do
    match %r/^\s+<<.*\n?/
  end
  rule 'meta.block.source.r' do
    content_scope "source.r.embedded.sweave"
    from %r/^\\begin(\{)Scode(\})/
    to %r/^\\end(\{)Scode(\})/
    both 1 => 'punctuation.definition.arguments.begin.latex',
         2 => 'punctuation.definition.arguments.end.latex'
    include "source.r"
  end
  rule 'source.r.embedded.sweave' do
    from %r/\\Sexpr(\{)/,
      1 => 'punctuation.definition.arguments.begin.latex'
    to %r/(\})/,
      1 => 'punctuation.definition.arguments.end.latex'
    include "source.r"
  end
  include "text.tex.latex"
end
