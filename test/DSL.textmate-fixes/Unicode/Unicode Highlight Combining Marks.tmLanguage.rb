# encoding: utf-8

language 'Unicode Highlight Combining Marks' => 'unicode.check.combiningMarks' do
  # FIXME: no file types
  folding_start_marker %r//
  folding_stop_marker %r//
  key_equivalent "^~U"  # TextMate only
  uuid "B48EDCF6-3E73-4115-A0C9-10B17778F8F5"  # TextMate only

  rule 'invalid' do
    # FIXME: (error) invalid hex escape
    match %r/[\u0300-\u036F\u1DC0-\u1DFF\u20D0-\u20FF\uFE20-\uFE2F]+/
  end
end
