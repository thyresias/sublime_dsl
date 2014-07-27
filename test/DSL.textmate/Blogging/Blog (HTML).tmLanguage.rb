# encoding: utf-8

language 'Blog — HTML' => 'text.blog.html', file: 'Blog (HTML)' do
  file_types %w(blog.html)
  first_line_match %r/^Type: Blog Post \(HTML\)/
  key_equivalent "^~B"  # TextMate only
  uuid "E46F5C50-5D16-4B5C-8FBB-686BD3768284"  # TextMate only

  rule 'meta.header.blog' do
    match %r/^([Tt]itle|[Dd]ate|[Bb]asename|[Ss]lug|[Kk]eywords|[Bb]log|[Tt]ype|[Ll]ink|[Pp]ost|[Tt]ags|[Cc]omments|[Pp]ings?|[Cc]ategory|[Ss]tatus|[Ff]ormat|[Pp]ostformat)(:)\s*(.*)$\n?/,
      1 => 'keyword.other.blog',
      2 => 'punctuation.separator.key-value.blog',
      3 => 'string.unquoted.blog'
  end
  rule 'invalid.illegal.meta.header.blog' do
    match %r/^([A-Za-z0-9]+):\s*(.*)$\n?/
  end
  rule 'text.html' do
    from %r/^(?![A-Za-z0-9]+:)/
    to %r/^(?=not)possible$/
    rule 'meta.separator.blog' do
      match %r/^✂-[✂-]+$\n/
    end
    include "text.html.basic"
  end
end
