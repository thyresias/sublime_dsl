
keymap 'Default (OSX)' do

  conditionals if: 'si', and: 'et', or: 'ou'

  bind 'shift+super+n', new_window
  bind 'shift+super+w', close_window
  bind 'super+o', prompt_open
  bind 'shift+super+t', reopen_last_file
  bind 'alt+super+up', switch_file(extensions: %w(cpp cxx cc c hpp hxx h ipp inl m mm))
  bind 'super+n', new_file
  bind 'super+s', save
  bind 'shift+super+s', prompt_save_as
  bind 'alt+super+s', save_all
  bind 'super+w', close
  bind 'super+k, super+b', toggle_side_bar
  bind 'ctrl+super+f', toggle_full_screen
  bind 'shift+ctrl+super+f', toggle_distraction_free
  bind 'super+z', undo
  bind 'shift+super+z', _redo
  bind 'super+y', redo_or_repeat
  bind 'super+u', soft_undo
  bind 'shift+super+u', soft_redo
  bind 'super+x', cut
  bind 'super+c', copy
  bind 'super+v', paste
  bind 'shift+super+v', paste_and_indent
  bind 'ctrl+alt+left', move(by: "subwords", forward: false)
  bind 'ctrl+alt+right', move(by: "subword_ends", forward: true)
  bind 'shift+ctrl+alt+left', move(by: "subwords", forward: false, extend: true)
  bind 'shift+ctrl+alt+right', move(by: "subword_ends", forward: true, extend: true)
  bind 'ctrl+left', move(by: "subwords", forward: false)
  bind 'ctrl+right', move(by: "subword_ends", forward: true)
  bind 'shift+ctrl+left', move(by: "subwords", forward: false, extend: true)
  bind 'shift+ctrl+right', move(by: "subword_ends", forward: true, extend: true)
  bind 'ctrl+alt+up', scroll_lines(amount: 1.0)
  bind 'ctrl+alt+down', scroll_lines(amount: -1.0)
  bind 'shift+ctrl+up', select_lines(forward: false)
  bind 'shift+ctrl+down', select_lines(forward: true)
  bind 'shift+super+[', prev_view
  bind 'shift+super+]', next_view
  bind 'alt+super+left', prev_view
  bind 'alt+super+right', next_view
  bind 'ctrl+tab', next_view_in_stack
  bind 'shift+ctrl+tab', prev_view_in_stack
  bind 'super+a', select_all
  bind 'shift+super+l', split_selection_into_lines
  bind 'escape', single_selection
    si num_selections != 1
  bind 'escape', clear_fields
    si has_next_field == true
  bind 'escape', clear_fields
    si has_prev_field == true
  bind 'escape', hide_panel(cancel: true)
    si panel_visible == true
  bind 'escape', hide_overlay
    si overlay_visible == true
  bind 'escape', hide_auto_complete
    si auto_complete_visible == true
  bind 'super+]', indent
  bind 'super+[', unindent
  bind 'tab', insert_best_completion(default: "\t", exact: true)
  bind 'tab', insert_best_completion(default: "\t", exact: false)
    si setting.tab_completion == true
  bind 'tab', replace_completion_with_next_completion
    si last_command == "insert_best_completion"
    et setting.tab_completion == true
  bind 'tab', reindent
    si setting.auto_indent == true
    et all.selection_empty == true
    et all.preceding_text .regex_match %r/^$/ # could use =~ with \A and \z
    et all.following_text .regex_match %r/^$/ # could use =~ with \A and \z
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
  bind 'shift+tab', unindent
    si preceding_text .regex_match %r/^[\t ]*/ # could use =~ with \A and \z
  bind 'shift+tab', unindent
    si text =~ /\n/
  bind 'shift+tab', prev_field
    si has_prev_field == true
  bind 'super+l', expand_selection(to: "line")
  bind 'super+d', find_under_expand
  bind 'super+k, super+d', find_under_expand_skip
  bind 'shift+super+space', expand_selection(to: "scope")
  bind 'shift+ctrl+m', expand_selection(to: "brackets")
  bind 'ctrl+m', move_to("brackets")
  bind 'shift+super+j', expand_selection(to: "indentation")
  bind 'shift+super+a', expand_selection(to: "tag")
  bind 'alt+super+.', close_tag
  bind 'ctrl+q', toggle_record_macro
  bind 'shift+ctrl+q', run_macro
  bind 'super+enter', run_macro_file("Packages/Default/Add Line.sublime-macro")
  bind 'shift+super+enter', run_macro_file("Packages/Default/Add Line Before.sublime-macro")
  bind 'enter', commit_completion
    si auto_complete_visible
    et setting.auto_complete_commit_on_tab is false
  bind 'super+t', show_overlay("goto", show_files: true)
  bind 'super+p', show_overlay("goto", show_files: true)
  bind 'shift+super+p', show_overlay("command_palette")
  bind 'ctrl+super+p', prompt_select_project
  bind 'super+r', show_overlay("goto", text: "@")
  bind 'ctrl+g', show_overlay("goto", text: ":")
  bind 'super+i', show_panel("incremental_find", reverse: false)
  bind 'shift+super+i', show_panel("incremental_find", reverse: true)
  bind 'super+f', show_panel("find")
  bind 'alt+super+f', show_panel("replace")
  bind 'alt+super+e', replace_next
  bind 'super+g', find_next
  bind 'shift+super+g', find_prev
  bind 'super+e', slurp_find_string
  bind 'shift+super+e', slurp_replace_string
  bind 'alt+super+g', find_under
  bind 'shift+alt+super+g', find_under_prev
  bind 'ctrl+super+g', find_all_under
  bind 'shift+super+f', show_panel("find_in_files")
  bind 'f4', next_result
  bind 'shift+f4', prev_result
  bind 'f6', toggle_setting("spell_check")
  bind 'ctrl+f6', next_misspelling
  bind 'shift+ctrl+f6', prev_misspelling
  bind 'ctrl+super+up', swap_line_up
  bind 'ctrl+super+down', swap_line_down
  bind 'ctrl+backspace', delete_word(forward: false, sub_words: true)
  bind 'ctrl+delete', delete_word(forward: true, sub_words: true)
  bind 'super+/', toggle_comment(block: false)
  bind 'alt+super+/', toggle_comment(block: true)
  bind 'super+j', join_lines
  bind 'shift+super+d', duplicate_line
  bind 'ctrl+`', show_panel("console", toggle: true)
  bind 'ctrl+space', auto_complete
  bind 'ctrl+space', replace_completion_with_auto_complete
    si last_command == "insert_best_completion"
    et auto_complete_visible == false
    et setting.tab_completion == true
  bind 'alt+super+p', show_scope_name
  bind 'shift+ctrl+p', show_scope_name
  bind 'f7', build
  bind 'super+b', build
  bind 'shift+super+b', build(variant: "Run")
  bind 'ctrl+t', transpose
  bind 'f5', sort_lines(case_sensitive: false)
  bind 'ctrl+f5', sort_lines(case_sensitive: true)
  bind '"', insert_snippet(contents: "\"$0\"")
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    # FIXME: (warning) regular expression has ']' without escape
    et all.following_text =~ /^(?:\t| |\)|]|\}|>|$)/
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
    # FIXME: (warning) regular expression has ']' without escape
    et all.following_text =~ /^(?:\t| |\)|]|\}|>|$)/
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
    # FIXME: (warning) regular expression has ']' without escape
    et all.following_text =~ /^(?:\t| |\)|]|;|\}|$)/
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
    # FIXME: (warning) regular expression has ']' without escape
    et all.following_text =~ /^(?:\t| |\)|]|;|\}|$)/
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
    # FIXME: (warning) regular expression has ']' without escape
    et all.following_text =~ /^(?:\t| |\)|]|\}|$)/
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
  bind 'alt+super+1', set_layout(cols: [0.0, 1.0], rows: [0.0, 1.0], cells: [[0, 0, 1, 1]])
  bind 'alt+super+2', set_layout(cols: [0.0, 0.5, 1.0], rows: [0.0, 1.0], cells: [[0, 0, 1, 1], [1, 0, 2, 1]])
  bind 'alt+super+3', set_layout(cols: [0.0, 0.33, 0.66, 1.0], rows: [0.0, 1.0], cells: [[0, 0, 1, 1], [1, 0, 2, 1], [2, 0, 3, 1]])
  bind 'alt+super+4', set_layout(cols: [0.0, 0.25, 0.5, 0.75, 1.0], rows: [0.0, 1.0], cells: [[0, 0, 1, 1], [1, 0, 2, 1], [2, 0, 3, 1], [3, 0, 4, 1]])
  bind 'shift+alt+super+2', set_layout(cols: [0.0, 1.0], rows: [0.0, 0.5, 1.0], cells: [[0, 0, 1, 1], [0, 1, 1, 2]])
  bind 'shift+alt+super+3', set_layout(cols: [0.0, 1.0], rows: [0.0, 0.33, 0.66, 1.0], cells: [[0, 0, 1, 1], [0, 1, 1, 2], [0, 2, 1, 3]])
  bind 'alt+super+5', set_layout(cols: [0.0, 0.5, 1.0], rows: [0.0, 0.5, 1.0], cells: [[0, 0, 1, 1], [1, 0, 2, 1], [0, 1, 1, 2], [1, 1, 2, 2]])
  bind 'ctrl+1', focus_group(0)
  bind 'ctrl+2', focus_group(1)
  bind 'ctrl+3', focus_group(2)
  bind 'ctrl+4', focus_group(3)
  bind 'shift+ctrl+1', move_to_group(0)
  bind 'shift+ctrl+2', move_to_group(1)
  bind 'shift+ctrl+3', move_to_group(2)
  bind 'shift+ctrl+4', move_to_group(3)
  bind 'ctrl+0', focus_side_bar
  bind 'super+1', select_by_index(0)
  bind 'super+2', select_by_index(1)
  bind 'super+3', select_by_index(2)
  bind 'super+4', select_by_index(3)
  bind 'super+5', select_by_index(4)
  bind 'super+6', select_by_index(5)
  bind 'super+7', select_by_index(6)
  bind 'super+8', select_by_index(7)
  bind 'super+9', select_by_index(8)
  bind 'super+0', select_by_index(9)
  bind 'f2', next_bookmark
  bind 'shift+f2', prev_bookmark
  bind 'super+f2', toggle_bookmark
  bind 'shift+super+f2', clear_bookmarks
  # FIXME: assigned 2 times in this keymap
  bind 'alt+f2', select_all_bookmarks
  bind 'super+k, super+u', upper_case
  bind 'super+k, super+l', lower_case
  bind 'super+k, super+space', set_mark
  bind 'super+k, super+a', select_to_mark
  bind 'super+k, super+w', delete_to_mark
  bind 'super+k, super+x', swap_with_mark
  bind 'super+k, super+g', clear_bookmarks(name: "mark")
  bind 'super++', increase_font_size
  bind 'super+=', increase_font_size
  bind 'super+-', decrease_font_size
  bind 'shift+ctrl+w', insert_snippet(name: "Packages/XML/long-tag.sublime-snippet")
  bind 'shift+ctrl+k', run_macro_file("Packages/Default/Delete Line.sublime-macro")
  bind 'alt+super+q', wrap_lines
  bind 'alt+super+[', fold
  bind 'alt+super+]', unfold
  bind 'super+k, super+1', fold_by_level(1)
  bind 'super+k, super+2', fold_by_level(2)
  bind 'super+k, super+3', fold_by_level(3)
  bind 'super+k, super+4', fold_by_level(4)
  bind 'super+k, super+5', fold_by_level(5)
  bind 'super+k, super+6', fold_by_level(6)
  bind 'super+k, super+7', fold_by_level(7)
  bind 'super+k, super+8', fold_by_level(8)
  bind 'super+k, super+9', fold_by_level(9)
  bind 'super+k, super+0', unfold_all
  bind 'super+k, super+j', unfold_all
  bind 'super+k, super+t', fold_tag_attributes
  bind 'alt+super+o', toggle_overwrite
  # FIXME: assigned 2 times in this keymap
  bind 'alt+f2', context_menu
  bind 'alt+super+c', toggle_case_sensitive
    si setting.is_widget == true
  bind 'alt+super+r', toggle_regex
    si setting.is_widget == true
  bind 'alt+super+w', toggle_whole_word
    si setting.is_widget == true
  bind 'alt+super+a', toggle_preserve_case
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
  bind 'super+,', open_file("${packages}/User/Preferences.sublime-settings")
  bind 'super+k, super+y', yank
  bind 'super+k, super+k', run_macro_file("Packages/Default/Delete to Hard EOL.sublime-macro")
  bind 'super+k, super+backspace', run_macro_file("Packages/Default/Delete to Hard BOL.sublime-macro")
  bind 'super+k, super+c', show_at_center
  bind 'ctrl+y', yank
  bind 'super+backspace', run_macro_file("Packages/Default/Delete to Hard BOL.sublime-macro")
  bind 'super+delete', run_macro_file("Packages/Default/Delete to Hard EOL.sublime-macro")
  bind 'ctrl+k', run_macro_file("Packages/Default/Delete to Hard EOL.sublime-macro")
  bind 'ctrl+l', show_at_center
  bind 'ctrl+o', insert_snippet(contents: "$0\n")
  bind 'ctrl+super+d', noop
  bind 'shift+ctrl+super+d', noop

end
