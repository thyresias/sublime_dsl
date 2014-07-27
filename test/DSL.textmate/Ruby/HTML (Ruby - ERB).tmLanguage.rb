# encoding: utf-8

language 'HTML (Ruby - ERB)' => 'text.html.erb' do
  file_types %w(erb rhtml html.erb)
  key_equivalent "^~H"  # TextMate only
  uuid "13FF9439-15D0-4E74-9A8E-83ABF0BAA5E7"  # TextMate only

  include "text.html.basic"

  # FIXME: this fragment is never referenced
  fragment :comment do
    rule 'comment.block.erb' do
      from %r/<%+#/,
        0 => 'punctuation.definition.comment.begin.erb'
      to %r/%>/,
        0 => 'punctuation.definition.comment.end.erb'
    end
  end

  # FIXME: this fragment is never referenced
  fragment :tags do
    rule 'meta.embedded.block.erb' do
      content_scope "source.ruby"
      from %r/<%+(?!>)[-=]?(?![^%]*%>)/,
        0 => 'punctuation.section.embedded.begin.erb'
      to %r/(-?%)>/,
        0 => 'punctuation.section.embedded.end.erb',
        1 => 'source.ruby'
      rule 'comment.line.number-sign.erb' do
        match %r/(#).*?(?=-?%>)/,
          1 => 'punctuation.definition.comment.erb'
      end
      include "source.ruby"
    end
    rule 'meta.embedded.line.erb' do
      content_scope "source.ruby"
      from %r/<%+(?!>)[-=]?/,
        0 => 'punctuation.section.embedded.begin.erb'
      to %r/(-?%)>/,
        0 => 'punctuation.section.embedded.end.erb',
        1 => 'source.ruby'
      rule 'comment.line.number-sign.erb' do
        match %r/(#).*?(?=-?%>)/,
          1 => 'punctuation.definition.comment.erb'
      end
      include "source.ruby"
    end
  end
end
