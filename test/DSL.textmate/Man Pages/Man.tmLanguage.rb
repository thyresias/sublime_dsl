# encoding: utf-8

language 'Man' => 'text.man' do
  file_types %w(man)
  uuid "E8BAC30A-16BF-498D-941D-73FBAED37891"  # TextMate only

  rule 'markup.heading.man' do
    match %r/^[A-Z](?>\S|\s(?!\s))*$/
  end
  rule 'markup.underline.link.man' do
    match %r'((https?|ftp|file|txmt)://|mailto:)[-:@a-zA-Z0-9_.~%+/?=&#]+(?<![.?:])'
  end
  rule 'markup.underline.link.internal.man' do
    match %r/([\w\.]+\(\d[a-z]?\))/
  end
  rule 'meta.foldingStopMarker.man' do
    match %r/^_{2,}$/
  end
end
