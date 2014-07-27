# encoding: utf-8

preferences 'Folding' => 'text.bbcode' do
  folding_start_marker %r'(?x)
        (\[(?i:quote|code|list)\b.*?\]
        |<!--(?!.*-->)
        |\{\s*($|\?>\s*$|//|/\*(.*\*/\s*$|(?!.*?\*/)))
        )'
  folding_stop_marker %r'(?x)
        (\[/(?i:quote|code|list)\b.*?\]
        |^\s*-->
        |(^|\s)\}
        )'
  uuid "66A5CA37-7E8E-4A70-BA06-0CC9E1B8168F"
end

preferences 'Spell Checking: Disable' => 'text.bbcode markup.raw, text.bbcode meta.tag, text.bbcode markup.underline.link' do
  spell_checking false
  uuid "EE397CA8-3F51-4A4B-9A5A-E491154D0615"
end
