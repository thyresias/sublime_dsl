# encoding: windows-1252

language 'Lid File' => 'source.lid' do
  file_types %w(lid)
  uuid "7E074E76-1515-4B0D-BFAB-E0D9D8854163"  # TextMate only

  rule 'meta.header.mail' do
    # FIXME: (error) invalid hex escape
    from %r/([\x21-\x39\x3B-\x7E]+)(:)\s*/,
      1 => 'keyword.other.mail',
      2 => 'punctuation.separator.key-value.mail'
    to %r/^(?![ \t\v])/
  end
end
