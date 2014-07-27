# encoding: utf-8

language 'Email Address' => 'text.mail' do
  # FIXME: no file types
  uuid "99F6D23C-2048-4F09-8558-6CECA7E2262A"  # TextMate only

  rule 'markup.underline.link.email.hyperlink' do
    match %r/(?i)\b([A-Z][A-Z0-9._%+-]+)@([A-Z0-9.\-]+)\.([A-Z]{2,4})\b/
  end
end
