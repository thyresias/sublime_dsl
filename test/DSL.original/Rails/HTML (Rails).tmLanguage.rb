# encoding: utf-8

language 'HTML (Rails)' => 'text.html.ruby' do
  file_types %w(rhtml erb html.erb)
  folding_start_marker %r'(?x)
    (<(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl)\b.*?>
    |<!--(?!.*-->)
    |\{\s*($|\?>\s*$|//|/\*(.*\*/\s*$|(?!.*?\*/)))
    )'
  folding_stop_marker %r'(?x)
    (</(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl)>
    |^\s*-->
    |(^|\s)\}
    )'
  key_equivalent "^~R"  # TextMate only
  uuid "45D7E1FC-7D0B-4105-A1A2-3D10BB555A5C"  # TextMate only

  rule 'comment.block.erb' do
    from %r/<%+#/
    to %r/%>/
    both 0 => 'punctuation.definition.comment.erb'
  end
  rule 'source.ruby.rails.embedded.html' do
    from %r/<%+(?!>)[-=]?/
    to %r/-?%>/
    both 0 => 'punctuation.section.embedded.ruby'
    rule 'comment.line.number-sign.ruby' do
      match %r/(#).*?(?=-?%>)/,
        1 => 'punctuation.definition.comment.ruby'
    end
    include "source.ruby.rails"
  end
  include "text.html.basic"
end
