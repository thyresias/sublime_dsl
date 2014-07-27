# encoding: utf-8

language 'Blog — Markdown' => 'text.blog.markdown', file: 'Blog (Markdown)' do
  file_types %w(blog.md blog.markdown blog.mdown blog.mkdn)
  first_line_match %r/^Type: Blog Post \(Markdown\)/
  key_equivalent "^~B"  # TextMate only
  uuid "6AA68B5B-18B8-4922-9CED-0E2295582955"  # TextMate only

  rule 'meta.header.blog' do
    match %r/^([Tt]itle|[Dd]ate|[Bb]asename|[Ss]lug|[Kk]eywords|[Bb]log|[Tt]ype|[Ll]ink|[Pp]ost|[Tt]ags|[Cc]omments|[Pp]ings?|[Cc]ategory|[Ss]tatus|[Ff]ormat|[Pp]ostformat)(:)\s*(.*)$\n?/,
      1 => 'keyword.other.blog',
      2 => 'punctuation.separator.key-value.blog',
      3 => 'string.unquoted.blog'
  end
  rule 'invalid.illegal.meta.header.blog' do
    match %r/^([A-Za-z0-9]+):\s*(.*)$\n?/
  end
  rule 'text.html.markdown' do
    from %r/^(?![A-Za-z0-9]+:)/
    to %r/^(?=not)possible$/
    rule 'meta.separator.blog' do
      match %r/^✂-[✂-]+$\n/
    end
    include "text.html.markdown"
  end
end
