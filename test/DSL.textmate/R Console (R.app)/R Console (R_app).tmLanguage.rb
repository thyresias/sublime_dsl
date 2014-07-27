# encoding: utf-8

language 'R Console (R.app)' => 'source.rapp-console', file: 'R Console (R_app)' do
  # FIXME: no file types
  key_equivalent "^~R"  # TextMate only
  uuid "F629C7F3-823B-4A4C-8EEE-9971490C5710"  # TextMate only

  rule 'source.r.embedded.rapp-console' do
    from %r/^> /,
      0 => 'punctuation.section.embedded.rapp-console'
    to %r/\n|\z/
    include "source.r"
  end
end
