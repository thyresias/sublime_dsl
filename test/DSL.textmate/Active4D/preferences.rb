# encoding: utf-8

preferences 'Comments' => 'source.active4d' do
  shell_variable 'TM_COMMENT_START', '// '
  shell_variable 'TM_COMMENT_MODE', 'line'
  uuid "942A77CF-CBDC-46BE-9C9C-CA475F60B97A"
end

preferences 'Folding (HTML)' => 'text.html.strict.active4d', file: 'Folding - HTML' do
  folding_start_marker %r/(?x)
    (<(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl)\b.*?>
    |<!--(?!.*-->)
    |^\s*<%(?!.*%>)
    |(^\s*|<%\s*)(?i:if|while|for\ each|for|case\ of|repeat|method|save\ output)\b
    )/
  folding_stop_marker %r'(?x)
    (</(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl)>
    |^(?!.*?<!--).*?-->
    |^\s*%>
    |(^\s*|<%\s*)(?i:end\ (if|while|for\ each|for|case|method|save\ output)|until)\b
    )'
  uuid "5BD6DFD4-2799-4652-92A4-438A776A24E7"
end

preferences 'Folding (Library)' => 'source.active4d.library', file: 'Folding - Library' do
  folding_start_marker %r/(?x)
    (^\s*(?i:if|while|for\ each|for|case\ of|repeat|method)\b
    |^\s*<fusedoc\ fuse
    )/
  folding_stop_marker %r'(?x)
    (^\s*(?i:end\ (if|while|for\ each|for|case|method)|until)\b
    |^\s*</fusedoc>
    )'
  uuid "C9EDEB67-CADB-49AB-8EA6-F2F79D830FCC"
end

preferences 'Folding' => 'source.active4d' do
  folding_start_marker %r/(?x)
    (^\s*(?i:if|while|for\ each|for|case\ of|repeat|method|save output)\b
    )/
  folding_stop_marker %r/(?x)
    (^\s*(?i:end\ (if|while|for\ each|for|case|method|save output)|until)\b
    )/
  uuid "E0741CCC-A500-4441-AA3F-366884F61B51"
end

preferences 'Miscellaneous' => 'source.active4d' do
  decrease_indent_pattern %r/^\s*((?i:end\ (if|while|for\ each|for|case|method)|until|else)\b|%>)/
  highlight_pairs "\"\" () {} [] '' ``"
  increase_indent_pattern %r/^\s*((?i:if|while|for\ each|for|case\ of|repeat|method|else)\b|<%|:\()/
  smart_typing_pairs "\"\" () {} [] '' ``"
  uuid "22573B7E-1CE8-41CA-BFB5-32B01CA52D5F"
end

preferences 'Symbol List: Method' => 'entity.name.function.active4d' do
  show_in_symbol_list true
  symbol_transformation 's/"(.+?)"/$1/'
  uuid "9F07A325-1520-4386-890D-A14C62555121"
end
