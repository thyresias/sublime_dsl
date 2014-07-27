# encoding: utf-8

language 'Rd (R Documentation)' => 'text.tex.latex.rd' do
  file_types %w(rd Rd)
  key_equivalent "^~R"  # TextMate only
  uuid "80A00288-FE7E-4E66-B5BF-4948A2828203"  # TextMate only

  rule 'meta.section.rd' do
    content_scope "entity.name.tag.rd"
    from %r/((\\)(?:alias|docType|keyword|name|title|description|value|note|concept|keyword|details|format|references|source|arguments|seealso|author))(\{)/,
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
    to %r/(^\}$)/,
      1 => 'punctuation.definition.arguments.end.rd'
    include "source.r"
  end
  rule 'meta.author.rd' do
    from %r/((\\)(?:author))(\{)(?:\n)?/,
      1 => 'keyword.other.author.rd',
      2 => 'punctuation.definition.function.rd',
      3 => 'punctuation.definition.arguments.begin.rd'
    to %r/(\})/,
      1 => 'punctuation.definition.arguments.end.rd'
  end
  include "text.tex.latex"
end
