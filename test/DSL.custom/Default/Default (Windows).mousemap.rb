
mousemap 'Default (Windows)' do

  button_names \
    'left'    => 'button1',
    'right'   => 'button2',
    'middle'  => 'button3',
    'back'    => 'button4',
    'forward' => 'button5',
    'down'    => 'scroll_down',
    'up'      => 'scroll_up',
    'win'     => 'super'

  click 'right', up: context_menu

  # Basic drag select

  click 'left', down: drag_select
  click 'ctrl+left', down: drag_select(additive: true)
  click 'alt+left', down: drag_select(subtractive: true)

  # Select between selection and click location

  click 'shift+left', down: drag_select(extend: true)
  click 'shift+ctrl+left', down: drag_select(additive: true, extend: true)
  click 'shift+alt+left', down: drag_select(subtractive: true, extend: true)

  # Drag select by words

  click2 'left', down: drag_select(by: "words")
  click2 'ctrl+left', down: drag_select(by: "words", additive: true)
  click2 'alt+left', down: drag_select(by: "words", subtractive: true)

  # Drag select by lines

  click3 'left', down: drag_select(by: "lines")
  click3 'ctrl+left', down: drag_select(by: "lines", additive: true)
  click3 'alt+left', down: drag_select(by: "lines", subtractive: true)

  # Column select

  click 'shift+right', down: drag_select(by: "columns")
  click 'shift+ctrl+right', down: drag_select(by: "columns", additive: true)
  click 'shift+alt+right', down: drag_select(by: "columns", subtractive: true)

  click 'middle', down: drag_select(by: "columns")
  click 'ctrl+middle', down: drag_select(by: "columns", additive: true)
  click 'alt+middle', down: drag_select(by: "columns", subtractive: true)

  # Simple chording: hold down right, and click left

  click1 'right+left', down: drag_select, up: expand_selection(to: "line")
  click2 'right+left', up: expand_selection_to_paragraph
  click3 'right+left', up: select_all

  # Switch files

  click 'back', up: prev_view
  click 'forward', up: next_view

  # Switch files by holding down right, and using the scroll wheel

  click 'right+down', up: next_view
  click 'right+up', up: prev_view

  # Change font size with ctrl+scroll wheel

  # click 'ctrl+down', up: decrease_font_size
  # click 'ctrl+up', up: increase_font_size

end
