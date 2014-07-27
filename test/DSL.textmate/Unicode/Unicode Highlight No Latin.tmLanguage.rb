# encoding: utf-8

language 'Unicode Highlight No Latin' => 'unicode.check.noLatin' do
  # FIXME: no file types
  folding_start_marker %r//
  folding_stop_marker %r//
  key_equivalent "^~U"  # TextMate only
  uuid "16D31FDD-06BB-4072-80B7-AD4E5D6C997E"  # TextMate only

  rule 'invalid' do
    # FIXME: (error) invalid hex escape
    match %r/[\x{250}-\x{1C7F}\x{1F00}-\x{1FFF}\x{2C00}-\x{2C5F}\x{2C80}-\x{2DFF}\x{2E80}-\x{A69F}\x{A800}-\x{10FFFF}]+/
  end
end
