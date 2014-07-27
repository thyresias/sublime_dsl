# encoding: utf-8

preferences 'Folding (ASP)' => 'source.asp.vb.net', file: 'Folding - ASP' do
  folding_start_marker %r/(<(?i:(head|table|div|style|script|ul|ol|form|dl))\b.*?>|\{|^\s*<?%?\s*'?\s*(?i:(sub|private\s+Sub|public\s+Sub|function|if|while|For))\s*.*$)/
  folding_stop_marker %r!(</(?i:(head|table|div|style|script|ul|ol|form|dl))>?|\}|^\s*<?%?\s*\s*'?\s*(?i:(end|Next))\s*.*$)!
  uuid "AD84EF71-8D41-489E-9437-D59B2A74E82C"
end

preferences 'Folding (HTML)' => 'text.html.asp.net', file: 'Folding - HTML' do
  folding_start_marker %r'(?x)
    (<(?i:mm:dataset|mm:insert|mm:update|asp:DataGrid|asp:Repeater|asp:TemplateColumn|head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl)\b
    |<!--(?!.*-->)
    |<%(?!.*%>)
    |\{\{?(if|foreach|capture|literal|foreach|php|section|strip)
    |\{\s*($|\?>\s*$|//|/\*(.*\*/\s*$|(?!.*?\*/)))
    )'
  folding_stop_marker %r'(?x)
    (</(?i:mm:dataset|mm:insert|mm:update|asp:DataGrid|asp:Repeater|asp:TemplateColumn|head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl)>
    |^\s*-->
    |^\s*%>
    |\{\{?/(if|foreach|capture|literal|foreach|php|section|strip)
    |(^|\s)\}
    )'
  uuid "E18256A2-B1EF-4C1E-B928-B165A2F3474E"
end
