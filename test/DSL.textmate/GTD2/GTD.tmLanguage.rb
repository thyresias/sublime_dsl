# encoding: utf-8

language 'GTD' => 'text.html.markdown.wiki.gtd' do
  file_types %w(gtd)
  key_equivalent "^~G"  # TextMate only
  uuid "A984336E-2C65-4152-8FC0-34D2E73721DA"  # TextMate only

  rule 'markup.other.pagename' do
    match %r/[A-Z][a-z]+([A-Z][a-z]*)+/
  end
  rule 'string.unquoted.gtd' do
    match %r/^-\s{2}\S+\s/
  end
  rule 'entity.name.tag.gtd' do
    match %r/^<-\s\S+\s/
  end
  rule 'constant.language.gtd' do
    match %r/^->\s\S+\s/
  end
  rule 'variable.language.gtd' do
    match %r/^\+\s{2}\S+\s/
  end
  rule 'comment.line.gtd' do
    match %r/^\^\s{2}\S+\s/
  end
  rule 'support.class.exception.gtd' do
    match %r/^\!\s{2}\S+\s/
  end
end
