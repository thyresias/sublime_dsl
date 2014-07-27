# encoding: utf-8

language 'SQL (Rails)' => 'source.sql.ruby' do
  file_types %w(erbsql sql.erb)
  folding_start_marker %r/\s*\(\s*$/
  folding_stop_marker %r/^\s*\)/
  key_equivalent "^~R"  # TextMate only
  uuid "D54FBDED-5481-4CC7-B75F-66465A499882"  # TextMate only

  rule 'source.ruby.rails.embedded.sql' do
    from %r/<%+(?!>)=?/
    to %r/%>/
    rule 'comment.line.number-sign.ruby' do
      match %r/#.*?(?=%>)/
    end
    include "source.ruby.rails"
  end
  include "source.sql"
end
