# encoding: utf-8

language 'Active4D Library' => 'source.active4d.library' do
  file_types %w(a4l)
  key_equivalent "^~A"  # TextMate only
  uuid "A595B09A-3829-48CB-958B-7D6C4646409D"  # TextMate only

  rule 'keyword.other.active4d' do
    match %r/(?i:end library|library)/
  end
  include "source.active4d"
end
