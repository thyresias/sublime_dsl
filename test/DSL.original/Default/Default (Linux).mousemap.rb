
mousemap 'Default (Linux)' do

  click1 'button1', down: drag_select
  click1 'ctrl+button1', down: drag_select(additive: true)
  click1 'alt+button1', down: drag_select(subtractive: true)
  click 'shift+button1', down: drag_select(extend: true)
  click 'shift+ctrl+button1', down: drag_select(additive: true, extend: true)
  click 'shift+alt+button1', down: drag_select(subtractive: true, extend: true)
  click2 'button1', down: drag_select(by: "words")
  click2 'ctrl+button1', down: drag_select(by: "words", additive: true)
  click2 'alt+button1', down: drag_select(by: "words", subtractive: true)
  click3 'button1', down: drag_select(by: "lines")
  click3 'ctrl+button1', down: drag_select(by: "lines", additive: true)
  click3 'alt+button1', down: drag_select(by: "lines", subtractive: true)
  click 'shift+button2', down: drag_select(by: "columns")
  click 'shift+ctrl+button2', down: drag_select(by: "columns", additive: true)
  click 'shift+alt+button2', down: drag_select(by: "columns", subtractive: true)
  click 'button3', up: paste_selection_clipboard
  click 'button4', up: prev_view
  click 'button5', up: next_view
  click 'button8', up: prev_view
  click 'button9', up: next_view
  click 'ctrl+scroll_down', up: decrease_font_size
  click 'ctrl+scroll_up', up: increase_font_size
  click 'button2', down: context_menu

end
