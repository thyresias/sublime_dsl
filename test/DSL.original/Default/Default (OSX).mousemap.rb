
mousemap 'Default (OSX)' do

  click1 'button1', down: drag_select
  click 'shift+button1', down: drag_select(extend: true)
  click1 'super+button1', down: drag_select(additive: true)
  click1 'shift+super+button1', down: drag_select(subtractive: true)
  click2 'button1', down: drag_select(by: "words")
  click2 'super+button1', down: drag_select(by: "words", additive: true)
  click2 'shift+super+button1', down: drag_select(by: "words", subtractive: true)
  click3 'button1', down: drag_select(by: "lines")
  click3 'super+button1', down: drag_select(by: "lines", additive: true)
  click3 'shift+super+button1', down: drag_select(by: "lines", subtractive: true)
  click 'alt+button1', down: drag_select(by: "columns")
  click 'alt+super+button1', down: drag_select(by: "columns", additive: true)
  click 'shift+alt+super+button1', down: drag_select(by: "columns", subtractive: true)
  click 'button3', down: drag_select(by: "columns")
  click 'super+button3', down: drag_select(by: "columns", additive: true)
  click 'shift+super+button3', down: drag_select(by: "columns", subtractive: true)
  click 'button4', up: prev_view
  click 'button5', up: next_view
  click 'button2', down: context_menu
  click1 'ctrl+button1', down: context_menu

end
