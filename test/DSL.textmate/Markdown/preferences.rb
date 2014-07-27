# encoding: utf-8

preferences 'Spell Checking: Disable' => 'text.html.markdown meta.reference, meta.link.markdown entity.name', file: 'Disable spell checking for raw' do
  spell_checking false
  uuid "C2DBC2F2-D859-4B35-A38E-244927A8447F"
end

preferences 'Folding' => 'text.html.markdown' do
  folding_indented_block_ignore %r/^(?!#+\s+)/
  folding_indented_block_start %r/^#+\s+/
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
  uuid "3B52CA89-648E-480E-AE45-20D4638B23B2"
end

preferences 'Indent: Raw Block' => 'markup.raw.block.markdown', file: 'Indent˸ Raw' do
  decrease_indent_pattern %r'^(.*\*/)?\s*\}[;\s]*$'
  increase_indent_pattern %r/^.*(\{[^}"']*|\([^)"']*)$/
  uuid "E23C5DD2-9A36-4B4A-9729-2A769A055B92"
end

preferences 'Typing Pairs: Defaults' => 'text.html.markdown', file: 'Miscellaneous' do
  smart_typing_pairs "\"\" () {} [] “” `` __ <>"
  uuid "15E0B3D5-8523-40EF-B767-5AF153FFD11E"
end

preferences 'Style: Default' => 'text.html.markdown' do
  indented_soft_wrap match: /^\s+/, format: '$0'
  uuid "C4159A0A-DAD0-4E35-9887-D85BE291ED8D"
end

preferences 'Symbol List: Heading' => 'text.html.markdown markup.heading' do
  show_in_symbol_list true
  symbol_transformation 's/^#(#*)\s+(.*?)[\s#]*$/${1/#/\x{2003}/g}$2/'
  uuid "C02A37C1-E770-472F-A13E-358FF0C6AD89"
end

preferences 'Typing Pairs: Disable _ for Raw and Links' => 'text.html.markdown markup.raw, text.html.markdown meta.link', file: 'Typing Pairs˸ Disable _ for Raw' do
  smart_typing_pairs "\"\" () {} [] “” ``"
  uuid "146B2643-D903-49A8-9586-BE9C509D65B1"
end
