# encoding: utf-8

preferences 'Comments' => 'text.html' do
  shell_variable 'TM_COMMENT_START', '<!-- '
  shell_variable 'TM_COMMENT_END', ' -->'
  uuid "B79BDBCF-D0C9-468E-BE62-744074D7825F"
end

preferences 'Miscellaneous' => 'text.html' do
  decrease_indent_pattern %r'(?x)
        ^\s*
        (</(?!html)
          [A-Za-z0-9]+\b[^>]*>
        |-->
        |<\?(php)?\s+(else(if)?|end(if|for(each)?|while))
        |\}
        )'
  increase_indent_pattern %r/(?x)
        ^\s*
        <(?!\?|area|base|br|col|frame|hr|html|img|input|link|meta|param|[^>]*\/>)
          ([A-Za-z0-9]+)(?=\s|>)\b[^>]*>(?!.*<\/\1>)
        |<!--(?!.*-->)
        |<\?php.+?\b(if|else(?:if)?|for(?:each)?|while)\b.*:(?!.*end\1)
        |\{[^}"']*$
        /
  bracket_indent_next_line_pattern %r/<!DOCTYPE(?!.*>)/
end

preferences 'Symbol List: ID' => 'text.html meta.toc-list.id.html', file: 'Symbol List - ID' do
  symbol_transformation "s/^/ID: /"
  uuid "E7C5859E-122D-4382-84BE-5AB584DC2409"
end
