# encoding: utf-8

language 'MultiMarkdown' => 'text.html.markdown.multimarkdown' do
  # FIXME: no file types
  first_line_match %r/^Format:\s*(?i:complete)\s*$/
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
  key_equivalent "^~M"  # TextMate only
  uuid "F5E04BF4-69A9-45AE-9205-B3F3C2B00130"  # TextMate only

  rule 'meta.header.multimarkdown' do
    from %r/^([A-Za-z0-9]+)(:)\s*/,
      1 => 'keyword.other.multimarkdown',
      2 => 'punctuation.separator.key-value.multimarkdown'
    to %r/^$|^(?=[A-Za-z0-9]+:)/
    rule 'string.unquoted.multimarkdown' do
      # The reason for not setting scopeName = "string.unquoted"
      #             (for the parent rule) is that we do not want
      #             newlines to be marked as string.unquoted
      match %r/.+/
    end
  end
  rule 'meta.content.multimarkdown' do
    from %r/^(?!=[A-Za-z0-9]+:)/
    to %r/^(?=not)possible$/
    include "text.html.markdown"
  end
end
