# encoding: utf-8

menu 'Indentation' do

  item 'Indent Using Spaces', toggle_setting("translate_tabs_to_spaces"), checkbox: true
  item '-'
  item 'Tab Width: 1', set_setting("tab_size", value: 1), checkbox: true
  item 'Tab Width: 2', set_setting("tab_size", value: 2), checkbox: true
  item 'Tab Width: 3', set_setting("tab_size", value: 3), checkbox: true
  item 'Tab Width: 4', set_setting("tab_size", value: 4), checkbox: true
  item 'Tab Width: 5', set_setting("tab_size", value: 5), checkbox: true
  item 'Tab Width: 6', set_setting("tab_size", value: 6), checkbox: true
  item 'Tab Width: 7', set_setting("tab_size", value: 7), checkbox: true
  item 'Tab Width: 8', set_setting("tab_size", value: 8), checkbox: true
  item '-'
  item 'Guess Settings From Buffer', detect_indentation
  item '-'
  item 'Convert Indentation to Spaces', expand_tabs(set_translate_tabs: true)
  item 'Convert Indentation to Tabs', unexpand_tabs(set_translate_tabs: true)

end
