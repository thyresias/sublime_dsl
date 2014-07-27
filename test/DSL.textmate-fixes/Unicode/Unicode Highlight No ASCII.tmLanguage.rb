# encoding: utf-8

language 'Unicode Highlight No ASCII' => 'unicode.check.noASCII' do
  # FIXME: no file types
  folding_start_marker %r//
  folding_stop_marker %r//
  key_equivalent "^~U"  # TextMate only
  uuid "4C8FA2CF-79EA-4C56-B3F8-2036E6BFFF94"  # TextMate only

  # rule 'invalid' do
  #   # FIXME: (error) invalid hex escape
  #   match %r/[\x{80}-\x{10FFFF}]+/
  # end
end
