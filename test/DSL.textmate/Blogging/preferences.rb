# encoding: utf-8

preferences 'Folding (HTML)' => 'text.blog.html', file: 'Folding - HTML' do
  folding_start_marker %r'(?x)
    (<(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl)\b.*?>
    |<!--(?!.*--\s*>)
    |\{\{?(if|foreach|capture|literal|foreach|php|section|strip)
    |\{\s*($|\?>\s*$|//|/\*(.*\*/\s*$|(?!.*?\*/)))
    )'
  folding_stop_marker %r'(?x)
    (</(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl)>
    |^(?!.*?<!--).*?--\s*>
    |\{\{?/(if|foreach|capture|literal|foreach|php|section|strip)
    |^[^{]*\}
    )'
  uuid "EF0D28C3-6199-4379-B5C7-7E9C678C4005"
end

preferences 'Folding (Markdown)' => 'text.blog.markdown', file: 'Folding - Markdown' do
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
  uuid "3E820DE3-BAAC-4B77-BE9A-1663DFBFFC5E"
end
