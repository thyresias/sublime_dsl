
keymap 'Default (Windows)' do

  conditionals if: 'si', and: 'et', or: 'ou'

  bind 'shift+ctrl+s', save_all
  bind 'ctrl+r', build
  bind 'ctrl+b', show_overlay("goto", text: "@")
  bind 'shift+ctrl+]', insert_snippet(contents: "{ |$0|  }")
  bind 'ctrl+keypad_divide', toggle_comment(block: false)
  bind 'shift+ctrl+keypad_divide', toggle_comment(block: true)
  bind 'ctrl+keypad_multiply', show_panel("console", toggle: true)
  bind 'ctrl+keypad_minus', fold
  bind 'ctrl+keypad_plus', unfold
  bind 'alt+up', select_lines(forward: false)
  bind 'alt+down', select_lines(forward: true)
  bind 'ctrl+c', clipboard_manager_copy
  bind 'ctrl+x', clipboard_manager_cut
  bind 'ctrl+v', paste_and_indent
  bind 'shift+ctrl+c', copy_append
  bind 'shift+ctrl+x', cut_append
  bind 'shift+ctrl+v', clipboard_manager_choose_and_paste
  bind 'ctrl+k, ctrl+s', snake_case
  bind 'ctrl+k, ctrl+p', pascal_case
  bind 'ctrl+k, ctrl+t', title_case
  bind 'shift+ctrl+alt+p', display_scopes
  bind 'ctrl+k, ctrl+i', in_dev

end
