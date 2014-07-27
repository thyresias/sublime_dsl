# encoding: utf-8

language 'Unicode Highlight Combining Marks' => 'unicode.check.combiningMarks' do
  # FIXME: no file types
  folding_start_marker %r//
  folding_stop_marker %r//
  key_equivalent "^~U"  # TextMate only
  uuid "B48EDCF6-3E73-4115-A0C9-10B17778F8F5"  # TextMate only

  rule 'invalid' do
    # FIXME: (error) invalid hex escape
    match %r/[\x{0300}-\x{036F}\x{1DC0}-\x{1DFF}\x{20D0}-\x{20FF}\x{FE20}-\x{FE2F}]+/
  end
end
