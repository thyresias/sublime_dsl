
keymap 'Default' do

  keyboard 'AZERTY-fr-FR-v6 (Windows 7)'
  conditionals if: 'si', and: 'et', or: 'ou'

  bind 'esc', exit_insert_mode
    si setting.command_mode is false
    et setting.is_widget is false
  bind 'esc', exit_visual_mode
    si setting.command_mode
    et num_selections is 1
    et selection_empty == false
  bind 'esc', hide_auto_complete
    si auto_complete_visible == true
  bind 'esc', vi_cancel_current_action
    si setting.command_mode
    et selection_empty == true
    et vi_has_input_state
  # FIXME: ctrl+) also generates the character '@'
  bind 'ctrl+)', exit_insert_mode
    si setting.command_mode is false
    et setting.is_widget is false
    et setting.vintage_ctrl_keys
  # FIXME: ctrl+) also generates the character '@'
  bind 'ctrl+)', exit_visual_mode
    si setting.command_mode
    et num_selections is 1
    et selection_empty == false
    et setting.vintage_ctrl_keys
  # FIXME: ctrl+) also generates the character '@'
  bind 'ctrl+)', vi_cancel_current_action
    si setting.command_mode
    et vi_has_input_state
    et selection_empty == true
    et setting.vintage_ctrl_keys
  bind 'z, z', center_on_cursor
    si setting.command_mode
  bind 'z, t', scroll_cursor_line_to_top
    si setting.command_mode
  bind 'z, b', scroll_cursor_line_to_bottom
    si setting.command_mode
  bind 'Z, Z', vi_save_and_exit
    si setting.command_mode
  bind 'i', enter_insert_mode
    si setting.command_mode
    et selection_empty
  bind 'I', enter_insert_mode(insert_command: "vi_move_to_first_non_white_space_character")
    si setting.command_mode
  bind 'I', enter_insert_mode(insert_command: "shrink_selections_to_beginning")
    si setting.command_mode
    et selection_empty == false
  bind 'a', enter_insert_mode(insert_command: "move", insert_args: {"by"=>"characters", "forward"=>true})
    si setting.command_mode
    et selection_empty
  bind 'A', enter_insert_mode(insert_command: "move_to", insert_args: {"to"=>"hardeol"})
    si setting.command_mode
  bind 'A', enter_insert_mode(insert_command: "shrink_selections_to_end")
    si setting.command_mode
    et selection_empty == false
  bind 'o', enter_insert_mode(insert_command: "run_macro_file", insert_args: {"file"=>"Packages/Default/Add Line.sublime-macro"})
    si setting.command_mode
  bind 'o', vi_reverse_selections_direction
    si setting.command_mode
    et selection_empty == false
  bind 'O', enter_insert_mode(insert_command: "run_macro_file", insert_args: {"file"=>"Packages/Default/Add Line Before.sublime-macro"})
    si setting.command_mode
  bind 'u', undo
    si setting.command_mode
  bind 'ctrl+r', _redo
    si setting.command_mode
    et setting.vintage_ctrl_keys
  bind 'u', visual_lower_case
    si setting.command_mode
    et selection_empty == false
  bind 'U', visual_upper_case
    si setting.command_mode
    et selection_empty == false
  bind 'v', enter_visual_mode
    si setting.command_mode
  bind 'v', set_motion_mode("normal")
    si setting.command_mode
    et vi_has_action
  bind 'v', exit_visual_mode(toggle: true)
    si setting.command_mode
    et selection_empty == false
  bind 'V', enter_visual_line_mode
    si setting.command_mode
  bind 'V', enter_visual_line_mode
    si setting.command_mode
    et vi_motion_mode == :line
  bind 'V', set_motion_mode("line")
    si setting.command_mode
    et vi_has_action
  bind '", <character>', set_register
    si setting.command_mode
  bind 'P', vi_paste_left
    si setting.command_mode
  bind 'p', vi_paste_right
    si setting.command_mode
  bind '/', show_panel("incremental_find", select_text: false, reverse: false)
    si setting.command_mode
  bind '?', show_panel("incremental_find", select_text: false, reverse: true)
    si setting.command_mode
  bind ':', show_overlay("command_palette", text: ":")
    si setting.command_mode
  bind '*', find_under(select_text: false)
    si setting.command_mode
  bind '#', find_under_prev(select_text: false)
    si setting.command_mode
  bind 'n', find_next(select_text: false)
    si setting.command_mode
  bind 'N', find_prev(select_text: false)
    si setting.command_mode
  bind 'J', join_lines
    si setting.command_mode
  bind '.', repeat
    si setting.command_mode
  bind 'r, enter', replace_character("\n")
    si setting.command_mode
  bind 'r, <character>', replace_character
    si setting.command_mode
  bind 'X', set_action_motion(action: "vi_left_delete", motion: nil)
    si setting.command_mode
  bind 'x', set_action_motion(action: "vi_right_delete", motion: nil)
    si setting.command_mode
  bind 'm, <character>', vi_set_bookmark
    si setting.command_mode
  bind '`, <character>', vi_select_bookmark
    si setting.command_mode
  bind "', <character>", vi_select_bookmark(select_bol: true)
    si setting.command_mode
  bind '~', set_action_motion(action: "swap_case", motion: "vi_move_by_characters_in_line", motion_args: {"forward"=>true, "extend"=>true, "visual"=>false})
    si selection_empty == true
    et setting.command_mode
  bind '~', swap_case
    si selection_empty == false
    et setting.command_mode
  bind 'q, <character>', vi_begin_record_macro
    si setting.command_mode
  bind 'q', vi_end_record_macro
    si setting.command_mode
    et is_recording_macro
  bind '@, <character>', vi_replay_macro
    si setting.command_mode
  bind 'ctrl+y', scroll_lines(amount: 1.0)
    si setting.command_mode
    et setting.vintage_ctrl_keys
  bind 'ctrl+e', scroll_lines(amount: -1.0)
    si setting.command_mode
    et setting.vintage_ctrl_keys
  bind 'ctrl+w, c', close
    si setting.vintage_ctrl_keys
    et setting.command_mode
  bind 'ctrl+w, q', close
    si setting.vintage_ctrl_keys
    et setting.command_mode
  bind 'ctrl+w, o', set_layout(cols: [0.0, 1.0], rows: [0.0, 1.0], cells: [[0, 0, 1, 1]])
    si setting.vintage_ctrl_keys
    et setting.command_mode
  bind 'ctrl+w, s', set_layout(cols: [0.0, 1.0], rows: [0.0, 0.5, 1.0], cells: [[0, 0, 1, 1], [0, 1, 1, 2]])
    si setting.vintage_ctrl_keys
    et setting.command_mode
  bind 'ctrl+w, v', set_layout(cols: [0.0, 0.5, 1.0], rows: [0.0, 1.0], cells: [[0, 0, 1, 1], [1, 0, 2, 1]])
    si setting.vintage_ctrl_keys
    et setting.command_mode
  bind 'ctrl+w, k', move_group_focus(direction: "up")
    si setting.vintage_ctrl_keys
    et setting.command_mode
  bind 'ctrl+w, j', move_group_focus(direction: "down")
    si setting.vintage_ctrl_keys
    et setting.command_mode
  bind 'ctrl+w, l', move_group_focus(direction: "right")
    si setting.vintage_ctrl_keys
    et setting.command_mode
  bind 'ctrl+w, h', move_group_focus(direction: "left")
    si setting.vintage_ctrl_keys
    et setting.command_mode
  bind 'd', set_action("vi_delete", description: "Delete")
    si setting.command_mode
  bind 'y', set_action("vi_copy", description: "Yank")
    si setting.command_mode
  bind 'c', set_action("enter_insert_mode", description: "Change", action_args: {"insert_command"=>"vi_delete"})
    si setting.command_mode
  bind 'g, u', set_action("lower_case", description: "Lower Case")
    si setting.command_mode
  bind 'g, U', set_action("upper_case", description: "Upper Case")
    si setting.command_mode
  bind 'g, ~', set_action("swap_case", description: "Swap Case")
    si setting.command_mode
  bind 'g, ?', set_action("rot13", description: "Rot13")
    si setting.command_mode
  bind 'g, a', show_ascii_info
    si setting.command_mode
  bind 'g, f', vi_open_file_under_selection
    si setting.command_mode
  bind 'g, q', set_action("wrap_lines", description: "Wrap Lines")
    si setting.command_mode
  bind '>', set_action("vi_indent", description: "Indent")
    si setting.command_mode
  bind '<', set_action("vi_unindent", description: "Unindent")
    si setting.command_mode
  bind '=', set_action("reindent", description: "Reindent", action_args: {"force_indent"=>false})
    si setting.command_mode
  bind '{', set_motion("move", motion_args: {"by"=>"stops", "word_begin"=>false, "empty_line"=>true, "separators"=>"", "forward"=>false, "extend"=>true})
    si setting.command_mode
  bind '}', set_motion("move", motion_args: {"by"=>"stops", "word_begin"=>false, "empty_line"=>true, "separators"=>"", "forward"=>true, "extend"=>true})
    si setting.command_mode
  bind 'W', set_motion("move", motion_args: {"by"=>"stops", "word_begin"=>true, "empty_line"=>true, "separators"=>"", "forward"=>true, "extend"=>true}, clip_to_line: true)
    si setting.command_mode
  bind 'w', set_motion("move", motion_args: {"by"=>"stops", "word_begin"=>true, "punct_begin"=>true, "empty_line"=>true, "forward"=>true, "extend"=>true}, clip_to_line: true)
    si setting.command_mode
  bind 'b', set_motion("move", motion_args: {"by"=>"stops", "word_begin"=>true, "punct_begin"=>true, "empty_line"=>true, "forward"=>false, "extend"=>true}, clip_to_line: true)
    si setting.command_mode
  bind 'B', set_motion("move", motion_args: {"by"=>"stops", "word_begin"=>true, "empty_line"=>true, "separators"=>"", "forward"=>false, "extend"=>true}, clip_to_line: true)
    si setting.command_mode
  bind 'e', set_motion("move", motion_args: {"by"=>"stops", "word_end"=>true, "punct_end"=>true, "empty_line"=>true, "forward"=>true, "extend"=>true}, inclusive: true, clip_to_line: true)
    si setting.command_mode
  bind 'E', set_motion("move", motion_args: {"by"=>"stops", "word_end"=>true, "empty_line"=>true, "separators"=>"", "forward"=>true, "extend"=>true}, inclusive: true, clip_to_line: true)
    si setting.command_mode
  bind 'w', set_motion("vi_extend_to_end_of_whitespace_or_word", motion_args: {"repeat"=>1}, inclusive: true, clip_to_line: true)
    si setting.command_mode
    et vi_action == :enter_insert_mode
  bind 'W', set_motion("vi_extend_to_end_of_whitespace_or_word", motion_args: {"repeat"=>1, "separators"=>""}, inclusive: true, clip_to_line: true)
    si setting.command_mode
    et vi_action == :enter_insert_mode
  bind 'alt+w', set_motion("move", motion_args: {"by"=>"stops", "word_begin"=>true, "sub_word_begin"=>true, "punct_begin"=>true, "empty_line"=>true, "forward"=>true, "extend"=>true}, clip_to_line: true)
    si setting.command_mode
  bind 'alt+w', set_motion("move", motion_args: {"by"=>"stops", "word_end"=>true, "sub_word_end"=>true, "punct_end"=>true, "empty_line"=>true, "forward"=>true, "extend"=>true}, inclusive: true, clip_to_line: true)
    si setting.command_mode
    et vi_action == :enter_insert_mode
  bind 'alt+b', set_motion("move", motion_args: {"by"=>"stops", "word_begin"=>true, "sub_word_begin"=>true, "punct_begin"=>true, "empty_line"=>true, "forward"=>false, "extend"=>true}, clip_to_line: true)
    si setting.command_mode
  bind '$', set_motion("vi_move_to_hard_eol", motion_args: {"repeat"=>1, "extend"=>true}, inclusive: true, clip_to_line: true)
    si setting.command_mode
  bind '^', set_motion("vi_move_to_first_non_white_space_character", motion_args: {"extend"=>true}, clip_to_line: true)
    si setting.command_mode
  bind '_', set_motion("vi_move_to_first_non_white_space_character", motion_args: {"extend"=>true, "repeat"=>1}, linewise: true, clip_to_line: true)
    si setting.command_mode
  bind ' ', set_motion("vi_move_by_characters", motion_args: {"forward"=>true, "extend"=>true, "visual"=>false}, clip_to_line: true)
    si setting.command_mode
  bind 'enter', set_motion("move", motion_args: {"by"=>"lines", "forward"=>true, "extend"=>true})
    si setting.command_mode
  bind 'backspace', set_motion("vi_move_by_characters", motion_args: {"forward"=>false, "extend"=>true})
    si setting.command_mode
  bind 'shift+enter', set_motion("move", motion_args: {"by"=>"lines", "forward"=>true, "extend"=>true})
    si setting.command_mode
  bind 'l', set_motion("vi_move_by_characters_in_line", motion_args: {"forward"=>true, "extend"=>true, "visual"=>false})
    si setting.command_mode
  bind 'h', set_motion("vi_move_by_characters_in_line", motion_args: {"forward"=>false, "extend"=>true})
    si setting.command_mode
  bind 'j', set_motion("move", motion_args: {"by"=>"lines", "forward"=>true, "extend"=>true}, linewise: true)
    si setting.command_mode
  bind 'k', set_motion("move", motion_args: {"by"=>"lines", "forward"=>false, "extend"=>true}, linewise: true)
    si setting.command_mode
  bind 'G', set_motion("vi_goto_line", motion_args: {"repeat"=>1, "explicit_repeat"=>true, "extend"=>true, "ending"=>"eof"}, linewise: true)
    si setting.command_mode
  bind 'g, g', set_motion("vi_goto_line", motion_args: {"repeat"=>1, "explicit_repeat"=>true, "extend"=>true, "ending"=>"bof"}, linewise: true)
    si setting.command_mode
  bind 'f, <character>', set_motion("vi_move_to_character", motion_args: {"extend"=>true}, inclusive: true, clip_to_line: true)
    si setting.command_mode
  bind 'F, <character>', set_motion("vi_move_to_character", motion_args: {"extend"=>true, "forward"=>false}, inclusive: true, clip_to_line: true)
    si setting.command_mode
  bind 't, <character>', set_motion("vi_move_to_character", motion_args: {"extend"=>true, "before"=>true}, inclusive: true, clip_to_line: true)
    si setting.command_mode
  bind 'T, <character>', set_motion("vi_move_to_character", motion_args: {"extend"=>true, "forward"=>false, "before"=>true}, inclusive: true, clip_to_line: true)
    si setting.command_mode
  bind ';', set_repeat_move_to_character_motion
    si setting.command_mode
  bind ',', set_repeat_move_to_character_motion(reverse: true)
    si setting.command_mode
  bind '%', set_motion("vi_move_to_brackets", motion_args: {"repeat"=>1}, inclusive: true)
    si setting.command_mode
  bind 'ctrl+f', set_motion("move", motion_args: {"by"=>"pages", "forward"=>true, "extend"=>true})
    si setting.command_mode
    et setting.vintage_ctrl_keys
  bind 'ctrl+b', set_motion("move", motion_args: {"by"=>"pages", "forward"=>false, "extend"=>true})
    si setting.command_mode
    et setting.vintage_ctrl_keys
  bind 'ctrl+u', vi_scroll_lines(forward: false)
    si setting.command_mode
    et setting.vintage_ctrl_keys
  bind 'ctrl+d', vi_scroll_lines(forward: true)
    si setting.command_mode
    et setting.vintage_ctrl_keys
  bind 'H', set_motion("move_caret_to_screen_top", motion_args: {"repeat"=>1}, linewise: true)
    si setting.command_mode
  bind 'M', set_motion("move_caret_to_screen_center", linewise: true)
    si setting.command_mode
  bind 'L', set_motion("move_caret_to_screen_bottom", motion_args: {"repeat"=>1}, linewise: true)
    si setting.command_mode
  bind 'z, .', set_motion("scroll_current_line_to_screen_center", motion_args: {"repeat"=>1})
    si setting.command_mode
  bind 'z, enter', set_motion("scroll_current_line_to_screen_top", motion_args: {"repeat"=>1})
    si setting.command_mode
  bind 'z, o', unfold
    si setting.command_mode
  bind 'z, O', unfold
    si setting.command_mode
  bind 'z, c', fold
    si setting.command_mode
  bind 'z, C', fold
    si setting.command_mode
  bind 'z, n', unfold_all
    si setting.command_mode
  bind 'z, R', unfold_all
    si setting.command_mode
  bind 'c', set_motion("vi_span_count_lines", linewise: true, motion_args: {"repeat"=>1})
    si setting.command_mode
    et vi_action == :enter_insert_mode
  bind 'd', set_motion("expand_selection", motion_args: {"to"=>"line"}, mode: "normal")
    si setting.command_mode
    et vi_action == :vi_delete
  bind 'y', set_motion("expand_selection", motion_args: {"to"=>"line"}, mode: "normal")
    si setting.command_mode
    et vi_action == :vi_copy
  bind '>', set_motion("expand_selection", motion_args: {"to"=>"line"}, mode: "normal")
    si setting.command_mode
    et vi_action == :vi_indent
  bind '<', set_motion("expand_selection", motion_args: {"to"=>"line"}, mode: "normal")
    si setting.command_mode
    et vi_action == :vi_unindent
  bind '=', set_motion("expand_selection", mode: "normal")
    si setting.command_mode
    et vi_action == :reindent
  bind 'D', set_action_motion(action: "vi_delete", motion: "vi_move_to_hard_eol", motion_args: {"repeat"=>1, "extend"=>true}, motion_inclusive: true)
    si setting.command_mode
  bind 'C', set_action_motion(action: "enter_insert_mode", action_args: {"insert_command"=>"vi_delete"}, motion: "vi_move_to_hard_eol", motion_args: {"repeat"=>1, "extend"=>true}, motion_inclusive: true)
    si setting.command_mode
  bind 'Y', set_action_motion(action: "vi_copy", motion: "expand_selection", motion_args: {"to"=>"line"})
    si setting.command_mode
  bind 's', set_action_motion(action: "enter_insert_mode", action_args: {"insert_command"=>"vi_delete"}, motion: "vi_move_by_characters_in_line", motion_args: {"forward"=>true, "extend"=>true, "visual"=>false})
    si setting.command_mode
  bind 'S', set_action_motion(action: "enter_insert_mode", action_args: {"insert_command"=>"vi_delete"}, motion: "vi_span_count_lines", motion_linewise: true, motion_args: {"repeat"=>1})
    si setting.command_mode
  bind 'i, w', set_motion("vi_expand_to_words", motion_args: {"repeat"=>1})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'a, w', set_motion("vi_expand_to_words", motion_args: {"repeat"=>1, "outer"=>true})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'i, W', set_motion("vi_expand_to_big_words", motion_args: {"repeat"=>1})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'a, W', set_motion("vi_expand_to_big_words", motion_args: {"repeat"=>1, "outer"=>true})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'i, "', set_motion("vi_expand_to_quotes", motion_args: {"character"=>"\""})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'a, "', set_motion("vi_expand_to_quotes", motion_args: {"character"=>"\"", "outer"=>true})
    si setting.command_mode
    et vi_can_enter_text_object
  bind "i, '", set_motion("vi_expand_to_quotes", motion_args: {"character"=>"'"})
    si setting.command_mode
    et vi_can_enter_text_object
  bind "a, '", set_motion("vi_expand_to_quotes", motion_args: {"character"=>"'", "outer"=>true})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'i, t', set_motion("vi_expand_to_tag")
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'a, t', set_motion("vi_expand_to_tag", motion_args: {"outer"=>true})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'i, (', set_motion("vi_expand_to_brackets", motion_args: {"character"=>"("})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'a, (', set_motion("vi_expand_to_brackets", motion_args: {"character"=>"(", "outer"=>true})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'i, )', set_motion("vi_expand_to_brackets", motion_args: {"character"=>"("})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'a, )', set_motion("vi_expand_to_brackets", motion_args: {"character"=>"(", "outer"=>true})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'i, b', set_motion("vi_expand_to_brackets", motion_args: {"character"=>"("})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'a, b', set_motion("vi_expand_to_brackets", motion_args: {"character"=>"(", "outer"=>true})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'i, [', set_motion("vi_expand_to_brackets", motion_args: {"character"=>"["})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'a, [', set_motion("vi_expand_to_brackets", motion_args: {"character"=>"[", "outer"=>true})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'i, ]', set_motion("vi_expand_to_brackets", motion_args: {"character"=>"["})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'a, ]', set_motion("vi_expand_to_brackets", motion_args: {"character"=>"[", "outer"=>true})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'i, {', set_motion("vi_expand_to_brackets", motion_args: {"character"=>"{"})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'a, {', set_motion("vi_expand_to_brackets", motion_args: {"character"=>"{", "outer"=>true})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'i, }', set_motion("vi_expand_to_brackets", motion_args: {"character"=>"{"})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'a, }', set_motion("vi_expand_to_brackets", motion_args: {"character"=>"{", "outer"=>true})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'i, B', set_motion("vi_expand_to_brackets", motion_args: {"character"=>"{"})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'a, B', set_motion("vi_expand_to_brackets", motion_args: {"character"=>"{", "outer"=>true})
    si setting.command_mode
    et vi_can_enter_text_object
  bind 'a, p', set_motion("expand_selection_to_paragraph")
    si setting.command_mode
    et vi_can_enter_text_object
  bind '1', push_repeat_digit(1)
    si setting.command_mode
  bind '2', push_repeat_digit(2)
    si setting.command_mode
  bind '3', push_repeat_digit(3)
    si setting.command_mode
  bind '4', push_repeat_digit(4)
    si setting.command_mode
  bind '5', push_repeat_digit(5)
    si setting.command_mode
  bind '6', push_repeat_digit(6)
    si setting.command_mode
  bind '7', push_repeat_digit(7)
    si setting.command_mode
  bind '8', push_repeat_digit(8)
    si setting.command_mode
  bind '9', push_repeat_digit(9)
    si setting.command_mode
  bind '0', push_repeat_digit(0)
    si setting.command_mode
  bind '0', set_motion("move_to", motion_args: {"to"=>"hardbol", "extend"=>true})
    si setting.command_mode
    et vi_has_repeat_digit is false

end
