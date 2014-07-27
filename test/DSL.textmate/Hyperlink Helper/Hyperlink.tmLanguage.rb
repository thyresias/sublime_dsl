# encoding: utf-8

language 'Hyperlink' => 'text.hyperlink' do
  # FIXME: no file types
  uuid "40FCD8FB-8FA6-4966-9B27-F18663188851"  # TextMate only

  rule 'markup.underline.link.$2.hyperlink' do
    match %r'(?x)
        ( (https?|s?ftp|ftps|file|smb|afp|nfs|(x-)?man(-page)?|gopher|txmt|issue)://|mailto:)
        [-:@a-zA-Z0-9_.,~%+/?=&#;]+(?<![-.,?:#;])
      '
  end
  rule 'markup.underline.link.rfc.$1.hyperlink' do
    match %r/(?i)\bRFC(?: |(?<= RFC))(\d+)\b/
  end
end
