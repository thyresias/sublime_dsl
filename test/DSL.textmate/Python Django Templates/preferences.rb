# encoding: utf-8

preferences 'Folding' => 'text.html.django' do
  folding_start_marker %r/(<(?i:a|head|body|table|thead|tbody|small|tfoot|tr|div|header|article|section|footer|aside|nav|select|fieldset|style|script|ul|ol|li|form|dl|p)\b.*?>|{% (block|comment|filter|for|if|ifchanged|ifequal|ifnotequal))/
  folding_stop_marker %r'(</(?i:a|head|body|table|thead|tbody|small|tfoot|tr|div|header|article|section|footer|aside|nav|select|fieldset|style|script|ul|ol|li|form|dl|p)\b.*?>|{% (endblock|endblocktrans|endcomment|endfilter|endfor|endif|endifchanged|endifequal|endifnotequal) %})'
  uuid "2A28484C-9F36-427B-8CFC-E2D72D776A63"
end

preferences 'Preferences' => 'text.html.django' do
  shell_variable 'TM_COMMENT_START', '{# '
  shell_variable 'TM_COMMENT_END', ' #}'
  shell_variable 'TM_COMMENT_MODE', 'line'
  shell_variable 'TM_COMMENT_START_2', '{% comment %}'
  shell_variable 'TM_COMMENT_END_2', '{% endcomment %}'
  shell_variable 'TM_COMMENT_MODE_2', 'block'
  uuid "A3452E24-5C3A-42AF-B7D4-1C509BEEB638"
end
