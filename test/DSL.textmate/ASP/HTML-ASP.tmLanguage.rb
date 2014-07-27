# encoding: utf-8

language 'HTML (ASP)' => 'text.html.asp', file: 'HTML-ASP' do
  file_types %w(asp)
  key_equivalent "^~A"  # TextMate only
  uuid "27798CC6-6B1D-11D9-B8FA-000D93589AF6"  # TextMate only

  rule 'source.asp.embedded.html' do
    from %r/<%=?/,
      0 => 'punctuation.section.embedded.begin.asp'
    to %r/%>/,
      0 => 'punctuation.section.embedded.end.asp'
    rule 'comment.line.apostrophe.asp' do
      match %r/(').*?(?=%>)/,
        1 => 'punctuation.definition.comment.asp'
    end
    include "source.asp"
  end
  include "text.html.basic"
end
