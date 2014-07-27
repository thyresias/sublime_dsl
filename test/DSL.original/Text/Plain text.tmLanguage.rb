# encoding: utf-8

language 'Plain Text' => 'text.plain', file: 'Plain text' do
  file_types %w(txt)
  key_equivalent "^~P"  # TextMate only
  uuid "3130E4FA-B10E-11D9-9F75-000D93589AF6"  # TextMate only

  rule 'meta.bullet-point.strong.text' do
    match %r/^\s*(•).*$\n?/,
      1 => 'punctuation.definition.item.text'
  end
  rule 'meta.bullet-point.light.text' do
    match %r/^\s*(·).*$\n?/,
      1 => 'punctuation.definition.item.text'
  end
  rule 'meta.bullet-point.star.text' do
    match %r/^\s*(\*).*$\n?/,
      1 => 'punctuation.definition.item.text'
  end
  rule do
    content_scope "meta.paragraph.text"
    from %r/^([ \t]*)(?=\S)/
    to %r/^(?!§1(?=\S))/
    rule 'markup.underline.link.text' do
      match %r'(?x)
            ( (https?|s?ftp|ftps|file|smb|afp|nfs|(x-)?man|gopher|txmt)://|mailto:)
            [-:@a-zA-Z0-9_.,~%+/?=&#]+(?<![.,?:])
          '
    end
  end
end
