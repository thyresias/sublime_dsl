# encoding: utf-8

language 'Blog — Textile' => 'text.blog.textile', file: 'Blog (Textile)' do
  file_types %w(blog.textile)
  first_line_match %r/^Type: Blog Post \(Textile\)/
  key_equivalent "^~B"  # TextMate only
  uuid "32E65853-CDBD-401A-ADBE-F94F195249BE"  # TextMate only

  rule 'meta.header.blog' do
    match %r/^([Tt]itle|[Dd]ate|[Bb]asename|[Ss]lug|[Kk]eywords|[Bb]log|[Tt]ype|[Ll]ink|[Pp]ost|[Tt]ags|[Cc]omments|[Pp]ings?|[Cc]ategory|[Ss]tatus|[Ff]ormat|[Pp]ostformat)(:)\s*(.*)$\n?/,
      1 => 'keyword.other.blog',
      2 => 'punctuation.separator.key-value.blog',
      3 => 'string.unquoted.blog'
  end
  rule 'invalid.illegal.meta.header.blog' do
    match %r/^([A-Za-z0-9]+):\s*(.*)$\n?/
  end
  rule 'text.html.textile' do
    from %r/^(?![A-Za-z0-9]+:)/
    to %r/^(?=not)possible$/
    rule 'meta.separator.blog' do
      match %r/^✂-[✂-]+$\n/
    end
    include "text.html.textile"
  end
end
