# encoding: utf-8

language 'JavaScript (Rails)' => 'source.js.rails' do
  file_types %w(js.erb)
  folding_start_marker %r'/\*\*|\{\s*$'
  folding_stop_marker %r'\*\*/|^\s*\}'
  key_equivalent "^~J"  # TextMate only
  uuid "4A3E6DA7-67A3-45B1-9EE0-ECFF9C7FA6C0"  # TextMate only

  rule 'comment.block.erb' do
    from %r/<%+#/
    to %r/%>/
    both 0 => 'punctuation.definition.comment.erb'
  end
  rule 'source.ruby.rails.erb' do
    from %r/<%+(?!>)[-=]?/
    to %r/-?%>/
    both 0 => 'punctuation.section.embedded.ruby'
    rule 'comment.line.number-sign.ruby' do
      match %r/(#).*?(?=-?%>)/,
        1 => 'punctuation.definition.comment.ruby'
    end
    include "source.ruby.rails"
  end
  include "source.js"
end
