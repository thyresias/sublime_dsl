# encoding: utf-8

language 'HTML (Erlang)' => 'text.html.erlang.yaws' do
  file_types %w(yaws)
  folding_start_marker %r'(?x)
    (<(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl|erl)\b.*?>
    |<!--(?!.*-->)
    |\{\s*($|\?>\s*$|//|/\*(.*\*/\s*$|(?!.*?\*/)))
    )'
  folding_stop_marker %r'(?x)
    (</(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl|erl)>
    |^\s*-->
    |(^|\s)\}
    )'
  key_equivalent "^~E"  # TextMate only
  uuid "3FBFF015-B650-4734-848C-47B53ACD5E32"  # TextMate only

  rule 'source.erlang.embedded.html' do
    from %r/<erl>/
    to %r'</erl>'
    both 0 => 'punctuation.section.embedded.erlang'
    include "source.erlang"
  end
  include "text.html.basic"
end
