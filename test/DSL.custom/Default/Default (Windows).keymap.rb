
keymap 'Default (Windows)' do

  keyboard 'AZERTY-fr-FR-v6 (Windows 7)'
  conditionals if: 'si', and: 'et', or: 'ou'

  bind 'shift+ctrl+n', new_window
  bind 'shift+ctrl+w', close_window
  bind 'ctrl+o', prompt_open_file
  bind 'shift+ctrl+t', reopen_last_file
  bind 'alt+o', switch_file(extensions: %w(cpp cxx cc c hpp hxx h ipp inl m mm))
  bind 'ctrl+n', new_file
  bind 'ctrl+s', save
  bind 'shift+ctrl+s', prompt_save_as
  bind 'ctrl+f4', close_file
  bind 'ctrl+w', close
  bind 'ctrl+k, ctrl+b', toggle_side_bar
  bind 'f11', toggle_full_screen
  bind 'shift+f11', toggle_distraction_free
  bind 'backspace', left_delete
  bind 'shift+backspace', left_delete
  # overridden later in this keymap
  # bind 'shift+ctrl+backspace', left_delete
  bind 'del', right_delete
  bind 'enter', insert(characters: "\n")
  bind 'shift+enter', insert(characters: "\n")
  bind 'ctrl+z', undo
  bind 'shift+ctrl+z', _redo
  bind 'ctrl+y', redo_or_repeat
  bind 'ctrl+u', soft_undo
  bind 'shift+ctrl+u', soft_redo
  bind 'shift+ctrl+v', paste_and_indent
  bind 'shift+del', cut
  bind 'ctrl+ins', copy
  bind 'shift+ins', paste
  bind 'ctrl+x', cut
  bind 'ctrl+c', copy
  bind 'ctrl+v', paste
  bind 'left', move(by: "characters", forward: false)
  bind 'right', move(by: "characters", forward: true)
  bind 'up', move(by: "lines", forward: false)
  bind 'down', move(by: "lines", forward: true)
  bind 'shift+left', move(by: "characters", forward: false, extend: true)
  bind 'shift+right', move(by: "characters", forward: true, extend: true)
  bind 'shift+up', move(by: "lines", forward: false, extend: true)
  bind 'shift+down', move(by: "lines", forward: true, extend: true)
  bind 'ctrl+left', move(by: "words", forward: false)
  bind 'ctrl+right', move(by: "word_ends", forward: true)
  bind 'shift+ctrl+left', move(by: "words", forward: false, extend: true)
  bind 'shift+ctrl+right', move(by: "word_ends", forward: true, extend: true)
  bind 'alt+left', move(by: "subwords", forward: false)
  bind 'alt+right', move(by: "subword_ends", forward: true)
  bind 'shift+alt+left', move(by: "subwords", forward: false, extend: true)
  bind 'shift+alt+right', move(by: "subword_ends", forward: true, extend: true)
  bind 'ctrl+alt+up', select_lines(forward: false)
  bind 'ctrl+alt+down', select_lines(forward: true)
  bind 'pgup', move(by: "pages", forward: false)
  bind 'pgdn', move(by: "pages", forward: true)
  bind 'shift+pgup', move(by: "pages", forward: false, extend: true)
  bind 'shift+pgdn', move(by: "pages", forward: true, extend: true)
  bind 'home', move_to("bol", extend: false)
  bind 'end', move_to("eol", extend: false)
  bind 'shift+home', move_to("bol", extend: true)
  bind 'shift+end', move_to("eol", extend: true)
  bind 'ctrl+home', move_to("bof", extend: false)
  bind 'ctrl+end', move_to("eof", extend: false)
  bind 'shift+ctrl+home', move_to("bof", extend: true)
  bind 'shift+ctrl+end', move_to("eof", extend: true)
  bind 'ctrl+up', scroll_lines(amount: 1.0)
  bind 'ctrl+down', scroll_lines(amount: -1.0)
  bind 'ctrl+pgdn', next_view
  bind 'ctrl+pgup', prev_view
  bind 'ctrl+tab', next_view_in_stack
  bind 'shift+ctrl+tab', prev_view_in_stack
  bind 'ctrl+a', select_all
  bind 'shift+ctrl+l', split_selection_into_lines

  bind 'esc', single_selection
    si num_selections != 1
  bind 'esc', clear_fields
    si has_next_field == true
    ou has_prev_field == true
  bind 'esc', hide_panel(cancel: true)
    si panel_visible == true
  bind 'esc', hide_overlay
    si overlay_visible == true
  bind 'esc', hide_auto_complete
    si auto_complete_visible == true

  bind 'tab', insert_best_completion(default: "\t", exact: true)
  bind 'tab', insert_best_completion(default: "\t", exact: false)
    si setting.tab_completion == true
  bind 'tab', replace_completion_with_next_completion
    si last_command == "insert_best_completion"
    et setting.tab_completion == true
  bind 'tab', reindent
    si setting.auto_indent == true
    et all.selection_empty == true
    et all.preceding_text =~ /\A\z/
    et all.following_text =~ /\A\z/
  bind 'tab', indent
    si text =~ /\n/
  bind 'tab', next_field
    si has_next_field == true
  bind 'tab', commit_completion
    si auto_complete_visible
    et setting.auto_complete_commit_on_tab

  bind 'shift+tab', insert(characters: "\t")
  bind 'shift+tab', unindent
    si setting.shift_tab_unindent == true
    ou preceding_text =~ /\A[\t ]*\z/
    ou text =~ /\n/
  bind 'shift+tab', prev_field
    si has_prev_field == true

  # ctrl+^ also generates the character '{'
  # bind 'ctrl+^', indent
  # ctrl+) also generates the character '@'
  # bind 'ctrl+)', unindent
  bind 'ins', toggle_overwrite
  bind 'ctrl+l', expand_selection(to: "line")
  bind 'ctrl+d', find_under_expand
  bind 'ctrl+k, ctrl+d', find_under_expand_skip
  bind 'shift+ctrl+space', expand_selection(to: "scope")
  bind 'shift+ctrl+m', expand_selection(to: "brackets")
  bind 'ctrl+m', move_to("brackets")
  bind 'shift+ctrl+j', expand_selection(to: "indentation")
  bind 'shift+ctrl+a', expand_selection(to: "tag")
  bind 'alt+;', close_tag
  bind 'ctrl+q', toggle_record_macro
  bind 'shift+ctrl+q', run_macro
  bind 'ctrl+enter', run_macro_file("Packages/Default/Add Line.sublime-macro")
  bind 'shift+ctrl+enter', run_macro_file("Packages/Default/Add Line Before.sublime-macro")
  bind 'enter', commit_completion
    si auto_complete_visible
    et setting.auto_complete_commit_on_tab is false
  bind 'ctrl+p', show_overlay("goto", show_files: true)
  bind 'shift+ctrl+p', show_overlay("command_palette")
  bind 'ctrl+alt+p', prompt_select_project
  bind 'ctrl+r', show_overlay("goto", text: "@")
  bind 'ctrl+g', show_overlay("goto", text: ":")
  # ctrl+$ also generates the character '}'
  # bind 'ctrl+$', show_overlay("goto", text: "#")
  bind 'ctrl+i', show_panel("incremental_find", reverse: false)
  bind 'shift+ctrl+i', show_panel("incremental_find", reverse: true)
  bind 'ctrl+f', show_panel("find")
  bind 'ctrl+h', show_panel("replace")
  bind 'shift+ctrl+h', replace_next
  bind 'f3', find_next
  bind 'shift+f3', find_prev
  bind 'ctrl+f3', find_under
  bind 'shift+ctrl+f3', find_under_prev
  bind 'alt+f3', find_all_under
  bind 'ctrl+e', slurp_find_string
  bind 'shift+ctrl+e', slurp_replace_string
  bind 'shift+ctrl+f', show_panel("find_in_files")
  bind 'f4', next_result
  bind 'shift+f4', prev_result
  bind 'f6', toggle_setting("spell_check")
  bind 'ctrl+f6', next_misspelling
  bind 'shift+ctrl+f6', prev_misspelling
  bind 'shift+ctrl+up', swap_line_up
  bind 'shift+ctrl+down', swap_line_down
  bind 'ctrl+backspace', delete_word(forward: false)
  bind 'shift+ctrl+backspace', run_macro_file("Packages/Default/Delete to Hard BOL.sublime-macro")
  bind 'ctrl+del', delete_word(forward: true)
  bind 'shift+ctrl+del', run_macro_file("Packages/Default/Delete to Hard EOL.sublime-macro")
  # ctrl+: also generates the character '\\'
  # bind 'ctrl+:', toggle_comment(block: false)
  bind 'shift+ctrl+:', toggle_comment(block: true)
  bind 'ctrl+j', join_lines
  bind 'shift+ctrl+d', duplicate_line
  # ctrl+ù also generates the character '['
  # bind 'ctrl+ù', show_panel("console", toggle: true)
  bind 'ctrl+space', auto_complete
  bind 'ctrl+space', replace_completion_with_auto_complete
    si last_command == "insert_best_completion"
    et auto_complete_visible == false
    et setting.tab_completion == true
  bind 'shift+ctrl+alt+p', show_scope_name
  bind 'f7', build
  bind 'ctrl+b', build
  bind 'shift+ctrl+b', build(variant: "Run")
  # FIXME: no equivalent for keystroke: ctrl+break
  # bind 'ctrl+break', exec(kill: true)
  bind 'ctrl+t', transpose
  bind 'f9', sort_lines(case_sensitive: false)
  bind 'ctrl+f9', sort_lines(case_sensitive: true)
  bind '"', insert_snippet(contents: "\"$0\"")
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    et all.following_text =~ /^(?:\t| |\)|\]|\}|>|$)/
    et all.preceding_text !~ /["a-zA-Z0-9_]$/
    et all.eol_selector != "string.quoted.double"
  bind '"', insert_snippet(contents: "\"${0:$SELECTION}\"")
    si setting.auto_match_enabled == true
    et all.selection_empty == false
  bind '"', move(by: "characters", forward: true)
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    et all.following_text =~ /^"/
  bind 'backspace', run_macro_file("Packages/Default/Delete Left Right.sublime-macro")
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    et all.preceding_text =~ /"$/
    et all.following_text =~ /^"/
  bind "'", insert_snippet(contents: "'$0'")
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    et all.following_text =~ /^(?:\t| |\)|\]|\}|>|$)/
    et all.preceding_text !~ /['a-zA-Z0-9_]$/
    et all.eol_selector != "string.quoted.single"
  bind "'", insert_snippet(contents: "'${0:$SELECTION}'")
    si setting.auto_match_enabled == true
    et all.selection_empty == false
  bind "'", move(by: "characters", forward: true)
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    et all.following_text =~ /^'/
  bind 'backspace', run_macro_file("Packages/Default/Delete Left Right.sublime-macro")
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    et all.preceding_text =~ /'$/
    et all.following_text =~ /^'/
  bind '(', insert_snippet(contents: "($0)")
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    et all.following_text =~ /^(?:\t| |\)|\]|;|\}|$)/
  bind '(', insert_snippet(contents: "(${0:$SELECTION})")
    si setting.auto_match_enabled == true
    et all.selection_empty == false
  bind ')', move(by: "characters", forward: true)
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    et all.following_text =~ /^\)/
  bind 'backspace', run_macro_file("Packages/Default/Delete Left Right.sublime-macro")
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    et all.preceding_text =~ /\($/
    et all.following_text =~ /^\)/
  bind '[', insert_snippet(contents: "[$0]")
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    et all.following_text =~ /^(?:\t| |\)|\]|;|\}|$)/
  bind '[', insert_snippet(contents: "[${0:$SELECTION}]")
    si setting.auto_match_enabled == true
    et all.selection_empty == false
  bind ']', move(by: "characters", forward: true)
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    et all.following_text =~ /^\]/
  bind 'backspace', run_macro_file("Packages/Default/Delete Left Right.sublime-macro")
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    et all.preceding_text =~ /\[$/
    et all.following_text =~ /^\]/
  bind '{', insert_snippet(contents: "{$0}")
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    et all.following_text =~ /^(?:\t| |\)|\]|\}|$)/
  bind '{', insert_snippet(contents: "{${0:$SELECTION}}")
    si setting.auto_match_enabled == true
    et all.selection_empty == false
  bind '}', move(by: "characters", forward: true)
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    et all.following_text =~ /^\}/
  bind 'backspace', run_macro_file("Packages/Default/Delete Left Right.sublime-macro")
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    et all.preceding_text =~ /\{$/
    et all.following_text =~ /^\}/
  bind 'enter', run_macro_file("Packages/Default/Add Line in Braces.sublime-macro")
    si setting.auto_indent == true
    et all.selection_empty == true
    et all.preceding_text =~ /\{$/
    et all.following_text =~ /^\}/
  bind 'shift+enter', run_macro_file("Packages/Default/Add Line in Braces.sublime-macro")
    si setting.auto_indent == true
    et all.selection_empty == true
    et all.preceding_text =~ /\{$/
    et all.following_text =~ /^\}/
  bind 'shift+alt+1', set_layout(cols: [0.0, 1.0], rows: [0.0, 1.0], cells: [[0, 0, 1, 1]])
  bind 'shift+alt+2', set_layout(cols: [0.0, 0.5, 1.0], rows: [0.0, 1.0], cells: [[0, 0, 1, 1], [1, 0, 2, 1]])
  bind 'shift+alt+3', set_layout(cols: [0.0, 0.33, 0.66, 1.0], rows: [0.0, 1.0], cells: [[0, 0, 1, 1], [1, 0, 2, 1], [2, 0, 3, 1]])
  bind 'shift+alt+4', set_layout(cols: [0.0, 0.25, 0.5, 0.75, 1.0], rows: [0.0, 1.0], cells: [[0, 0, 1, 1], [1, 0, 2, 1], [2, 0, 3, 1], [3, 0, 4, 1]])
  bind 'shift+alt+8', set_layout(cols: [0.0, 1.0], rows: [0.0, 0.5, 1.0], cells: [[0, 0, 1, 1], [0, 1, 1, 2]])
  bind 'shift+alt+9', set_layout(cols: [0.0, 1.0], rows: [0.0, 0.33, 0.66, 1.0], cells: [[0, 0, 1, 1], [0, 1, 1, 2], [0, 2, 1, 3]])
  bind 'shift+alt+5', set_layout(cols: [0.0, 0.5, 1.0], rows: [0.0, 0.5, 1.0], cells: [[0, 0, 1, 1], [1, 0, 2, 1], [0, 1, 1, 2], [1, 1, 2, 2]])
  bind 'ctrl+1', focus_group(0)
  bind 'ctrl+2', focus_group(1)
  bind 'ctrl+3', focus_group(2)
  bind 'ctrl+4', focus_group(3)
  bind 'shift+ctrl+1', move_to_group(0)
  bind 'shift+ctrl+2', move_to_group(1)
  bind 'shift+ctrl+3', move_to_group(2)
  bind 'shift+ctrl+4', move_to_group(3)
  bind 'ctrl+0', focus_side_bar
  bind 'alt+1', select_by_index(0)
  bind 'alt+2', select_by_index(1)
  bind 'alt+3', select_by_index(2)
  bind 'alt+4', select_by_index(3)
  bind 'alt+5', select_by_index(4)
  bind 'alt+6', select_by_index(5)
  bind 'alt+7', select_by_index(6)
  bind 'alt+8', select_by_index(7)
  bind 'alt+9', select_by_index(8)
  bind 'alt+0', select_by_index(9)
  bind 'f2', next_bookmark
  bind 'shift+f2', prev_bookmark
  bind 'ctrl+f2', toggle_bookmark
  bind 'shift+ctrl+f2', clear_bookmarks
  bind 'alt+f2', select_all_bookmarks
  bind 'shift+ctrl+k', run_macro_file("Packages/Default/Delete Line.sublime-macro")
  bind 'alt+q', wrap_lines
  bind 'ctrl+k, ctrl+u', upper_case
  bind 'ctrl+k, ctrl+l', lower_case
  bind 'ctrl+k, ctrl+space', set_mark
  bind 'ctrl+k, ctrl+a', select_to_mark
  bind 'ctrl+k, ctrl+w', delete_to_mark
  bind 'ctrl+k, ctrl+x', swap_with_mark
  bind 'ctrl+k, ctrl+y', yank
  bind 'ctrl+k, ctrl+k', run_macro_file("Packages/Default/Delete to Hard EOL.sublime-macro")
  bind 'ctrl+k, ctrl+backspace', run_macro_file("Packages/Default/Delete to Hard BOL.sublime-macro")
  bind 'ctrl+k, ctrl+g', clear_bookmarks(name: "mark")
  bind 'ctrl+k, ctrl+c', show_at_center
  bind 'shift+ctrl+=', increase_font_size
  # ctrl+= also generates the character '#'
  # bind 'ctrl+=', increase_font_size
  bind 'ctrl+num+', increase_font_size
  # FIXME: no equivalent for keystroke: ctrl+-
  # bind 'ctrl+-', decrease_font_size
  bind 'ctrl+num-', decrease_font_size
  bind 'shift+alt+w', insert_snippet(name: "Packages/XML/long-tag.sublime-snippet")
  bind 'shift+ctrl+)', fold
  bind 'shift+ctrl+^', unfold
  bind 'ctrl+k, ctrl+1', fold_by_level(1)
  bind 'ctrl+k, ctrl+2', fold_by_level(2)
  bind 'ctrl+k, ctrl+3', fold_by_level(3)
  bind 'ctrl+k, ctrl+4', fold_by_level(4)
  bind 'ctrl+k, ctrl+5', fold_by_level(5)
  bind 'ctrl+k, ctrl+6', fold_by_level(6)
  bind 'ctrl+k, ctrl+7', fold_by_level(7)
  bind 'ctrl+k, ctrl+8', fold_by_level(8)
  bind 'ctrl+k, ctrl+9', fold_by_level(9)
  bind 'ctrl+k, ctrl+0', unfold_all
  bind 'ctrl+k, ctrl+j', unfold_all
  bind 'ctrl+k, ctrl+t', fold_tag_attributes
  bind 'context_menu', context_menu
  bind 'alt+c', toggle_case_sensitive
    si setting.is_widget == true
  bind 'alt+r', toggle_regex
    si setting.is_widget == true
  bind 'alt+w', toggle_whole_word
    si setting.is_widget == true
  bind 'alt+a', toggle_preserve_case
    si setting.is_widget == true
  bind 'enter', find_next
    si panel == :find
    et panel_has_focus
  bind 'shift+enter', find_prev
    si panel == :find
    et panel_has_focus
  bind 'alt+enter', find_all(close_panel: true)
    si panel == :find
    et panel_has_focus
  bind 'enter', find_next
    si panel == :replace
    et panel_has_focus
  bind 'shift+enter', find_prev
    si panel == :replace
    et panel_has_focus
  bind 'alt+enter', find_all(close_panel: true)
    si panel == :replace
    et panel_has_focus
  bind 'ctrl+alt+enter', replace_all(close_panel: true)
    si panel == :replace
    et panel_has_focus
  bind 'enter', hide_panel
    si panel == :incremental_find
    et panel_has_focus
  bind 'shift+enter', find_prev
    si panel == :incremental_find
    et panel_has_focus
  bind 'alt+enter', find_all(close_panel: true)
    si panel == :incremental_find
    et panel_has_focus

end