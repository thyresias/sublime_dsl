# encoding: utf-8

language 'Subrip' => 'source.subrip' do

  file_types %w(srt)
  # first_line_match %r'^#!/.*\bruby'
  # folding_start_marker %r:(?x)^ ... $:
  # folding_stop_marker %r/(?x) ... /
  # key_equivalent "^~R"  # TextMate only
  # uuid "E00B62AC-6B1C-11D9-9B1F-000D93589AF6"  # TextMate only

  rule 'markup.italic.subrip' do
    from %r'<i>', 0 => 'markup.tag.begin.subrip'
    to %r'</i>', 0 => 'markup.tag.end.subrip'
  end

  rule 'markup.bold.subrip' do
    from %r'<b>', 0 => 'markup.tag.begin.subrip'
    to %r'</b>', 0 => 'markup.tag.end.subrip'
  end

  rule 'markup.number.subrip' do
    match %r'^\d+$'
  end

  rule do
    match %r'^(\d\d:\d\d:\d\d,\d\d\d) (-->) (\d\d:\d\d:\d\d,\d\d\d)$',
      1 => 'markup.timing.start.subrip',
      2 => 'markup.punctuation.subrip',
      3 => 'markup.timing.end.subrip'
  end

end
