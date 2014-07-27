# encoding: utf-8

language 'Rd (R Documentation)' => 'text.tex.latex.rd' do
  file_types %w(rd)
  folding_start_marker %r'/\w*\{\s*$'
  folding_stop_marker %r/^\s*\}/
  key_equivalent "^~R"  # TextMate only
  uuid "80A00288-FE7E-4E66-B5BF-4948A2828203"  # TextMate only

  rule 'meta.section.rd' do
    content_scope "entity.name.tag.rd"
    from %r/((\\)(?:alias|docType|keyword|name|title))(\{)/,
      1 => 'keyword.other.section.rd',
      2 => 'punctuation.definition.function.rd',
      3 => 'punctuation.definition.arguments.begin.rd'
    to %r/(\})/,
      1 => 'punctuation.definition.arguments.end.rd'
    include "$self"
  end
  rule 'meta.section.rd' do
    from %r/((\\)(?:details|format|references|source))(\{)/,
      1 => 'keyword.other.section.rd',
      2 => 'punctuation.definition.function.rd',
      3 => 'punctuation.definition.arguments.begin.rd'
    to %r/(\})/,
      1 => 'punctuation.definition.arguments.end.rd'
    include "$self"
  end
  rule 'meta.usage.rd' do
    content_scope "source.r.embedded"
    from %r/((\\)(?:usage))(\{)(?:\n)?/,
      1 => 'keyword.other.usage.rd',
      2 => 'punctuation.definition.function.rd',
      3 => 'punctuation.definition.arguments.begin.rd'
    to %r/(\})/,
      1 => 'punctuation.definition.arguments.end.rd'
    include "source.r"
  end
  rule 'meta.examples.rd' do
    content_scope "source.r.embedded"
    from %r/((\\)(?:examples))(\{)(?:\n)?/,
      1 => 'keyword.other.examples.rd',
      2 => 'punctuation.definition.function.rd',
      3 => 'punctuation.definition.arguments.begin.rd'
    to %r/(\})/,
      1 => 'punctuation.definition.arguments.end.rd'
    include "source.r"
  end
  rule 'meta.author.rd' do
    match %r/((\\)(?:author))(\{)([\w\s]+?)\s+(<)([^>]*)(>)/,
      1 => 'keyword.other.author.rd',
      2 => 'punctuation.definition.function.rd',
      3 => 'punctuation.definition.arguments.begin.rd',
      4 => 'entity.name.tag.author.rd',
      5 => 'punctuation.definition.link.rd',
      6 => 'markup.underline.link.rd',
      7 => 'punctuation.definition.link.rd'
  end
  include "text.tex.latex"
end
