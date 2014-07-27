# encoding: utf-8

language 'R Console' => 'source.r-console' do
  # FIXME: no file types
  key_equivalent "^~R"  # TextMate only
  uuid "F629C7F3-823B-4A4C-8EEE-9971490C5710"  # TextMate only

  rule 'source.r.embedded.r-console' do
    from %r/^> /,
      0 => 'punctuation.section.embedded.r-console'
    to %r/\n|\z/
    include "source.r"
  end
end
