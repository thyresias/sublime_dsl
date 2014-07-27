# encoding: utf-8

preferences 'Comments' => 'text.html.mt.pure' do
  shell_variable 'TM_COMMENT_START', '<mt:Ignore>'
  shell_variable 'TM_COMMENT_END', '</mt:Ignore>'
  shell_variable 'TM_COMMENT_DISABLE_INDENT_2', 'yes'
  uuid "34906968-4D08-4AD4-8652-22BC3A5713AA"
end

preferences 'Folding' => 'text.html.mt' do
  folding_start_marker %r'(?x)
    (<(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|li|form|dl)\b.*?>
    |<(?i:MT:?(?!Else))(\w+:)?\w+\b.*?>
    |<!--(?!.*--\s*>)
    |^<!--\ \#tminclude\ (?>.*?-->)$
    |<\?(?:php)?.*\b(if|for(each)?|while)\b.+:
    |\{\{?(if|foreach|capture|literal|foreach|php|section|strip)
    |\{\s*($|\?>\s*$|//|/\*(.*\*/\s*$|(?!.*?\*/)))
    )'
  folding_stop_marker %r'(?x)
    (</(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|li|form|dl)>
    |<\/(?i:MT:?(?!Else))(\w+:)?\w+\b.*?>
    |^(?!.*?<!--).*?--\s*>
    |^<!--\ end\ tminclude\ -->$
    |<\?(?:php)?.*\bend(if|for(each)?|while)\b
    |\{\{?/(if|foreach|capture|literal|foreach|php|section|strip)
    |^[^{]*\}
    )'
  uuid "167A894A-70B8-45F7-8E1D-9463722DC6A0"
end

preferences 'Tag Preferences' => 'text.html.mt entity.name.tag.mt, text.html.mt variable.other.mt, text.html.mt meta.tag' do
  spell_checking false
  uuid "23367101-9398-4601-8521-D6C2C6FEBDBE"
end

preferences 'Miscellaneous' => 'text.html.mt', file: 'Typing Pairs˸ Defaults' do
  decrease_indent_pattern %r'(?x)
    ^\s*
    (</(?!html)
      [A-Za-z0-9]+\b[^>]*>
    |-->
    |\}
    )'
  highlight_pairs "() {} [] “” <>"
  increase_indent_pattern %r:(?x)
    (<(?!area|base|br|col|frame|hr|html|img|input|link|meta|param|[^>]*/>)
      ([A-Za-z0-9]+)\b[^>]*>(?!.*</\2>)
    |<!--(?!.*-->)
    |\{[^}"']*$
    ):
  indent_next_line_pattern %r/<!DOCTYPE(?!.*>)/
  smart_typing_pairs "\"\" () {} [] “” <> ''"
  uuid "52B12AFE-F559-40D2-943B-0F70F702B4AC"
end

preferences 'Typing Pairs: Empty Tag' => 'text.html.mt invalid.illegal.incomplete', file: 'Typing Tags˸ Empty Tag' do
  smart_typing_pairs "\"\" () {} [] “” '' $$"
  spell_checking false
  uuid "DD648860-34B2-4350-8684-E1C13C54DEEC"
end
