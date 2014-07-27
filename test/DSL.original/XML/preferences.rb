# encoding: utf-8

preferences 'Comments' => 'text.xml' do
  shell_variable 'TM_COMMENT_START', '<!-- '
  shell_variable 'TM_COMMENT_END', ' -->'
  uuid "41A5608C-C589-411E-9581-548D7DE335AC"
end

preferences 'Miscellaneous' => 'text.xml' do
  # 
  #     /*
  #      * Don't indent:
  #      *  <?, </, <!
  #      *  <whatever></whatever>
  #      *  <whatever />
  #      *  <% %>
  #      *  <!-- -->
  #      *  <%-- --%>
  #      *
  #      * Do indent:
  #      *  <whatever>
  #      *  <%
  #      *  <!--
  #      *  <%--
  #      *
  #      * Decrease indent for:
  #      *  </whatever>
  #      *  -->
  #      *  --%>
  #      */
  decrease_indent_pattern %r'^\s*(</[^>]+>|-->|--%>)'
  highlight_pairs "() [] {} \"\" <>"
  increase_indent_pattern %r'^\s*<(([^!/?]|%)(?!.+?([/%]>|</.+?>))|[%!]--\s*$)'
  uuid "95788610-7E2E-45CE-9CCE-708FE0C90BF7"
end

preferences 'Symbol List: Templates' => 'text.xml.xsl meta.tag.xml.template', file: 'Symbol List%3A Templates' do
  show_in_symbol_list true
  symbol_transformation 's/^\s*<xsl:template\s+(.*)\s*>/$1/'
  uuid "0B6F39CC-AF39-46CD-85FB-7F895D14F04A"
end
