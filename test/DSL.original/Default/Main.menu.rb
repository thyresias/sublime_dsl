# encoding: utf-8

menu 'Main' do

  item '&File', id: 'file' do
    item '&New File', new_file
    item '&Open File…', prompt_open_file, platform: '!OSX'
    item 'Open Folder…', prompt_open_folder, platform: '!OSX'
    item 'Open…', prompt_open, platform: 'OSX'
    item 'Open &Recent' do
      item 'Reopen Closed File', reopen_last_file
      item '-'
      item open_recent_file(index: 0)
      item open_recent_file(index: 1)
      item open_recent_file(index: 2)
      item open_recent_file(index: 3)
      item open_recent_file(index: 4)
      item open_recent_file(index: 5)
      item open_recent_file(index: 6)
      item open_recent_file(index: 7)
      item '-'
      item open_recent_folder(index: 0)
      item open_recent_folder(index: 1)
      item open_recent_folder(index: 2)
      item open_recent_folder(index: 3)
      item open_recent_folder(index: 4)
      item open_recent_folder(index: 5)
      item open_recent_folder(index: 6)
      item open_recent_folder(index: 7)
      item '-'
      item 'Clear Items', clear_recent_files
    end
    item 'Reopen with Encoding' do
      item 'UTF-8', reopen(encoding: "utf-8")
      item 'UTF-16 LE', reopen(encoding: "utf-16 le")
      item 'UTF-16 BE', reopen(encoding: "utf-16 be")
      item '-'
      item 'Western (Windows 1252)', reopen(encoding: "Western (Windows 1252)")
      item 'Western (ISO 8859-1)', reopen(encoding: "Western (ISO 8859-1)")
      item 'Western (ISO 8859-3)', reopen(encoding: "Western (ISO 8859-3)")
      item 'Western (ISO 8859-15)', reopen(encoding: "Western (ISO 8859-15)")
      item 'Western (Mac Roman)', reopen(encoding: "Western (Mac Roman)")
      item 'DOS (CP 437)', reopen(encoding: "DOS (CP 437)")
      item 'Arabic (Windows 1256)', reopen(encoding: "Arabic (Windows 1256)")
      item 'Arabic (ISO 8859-6)', reopen(encoding: "Arabic (ISO 8859-6)")
      item 'Baltic (Windows 1257)', reopen(encoding: "Baltic (Windows 1257)")
      item 'Baltic (ISO 8859-4)', reopen(encoding: "Baltic (ISO 8859-4)")
      item 'Celtic (ISO 8859-14)', reopen(encoding: "Celtic (ISO 8859-14)")
      item 'Central European (Windows 1250)', reopen(encoding: "Central European (Windows 1250)")
      item 'Central European (ISO 8859-2)', reopen(encoding: "Central European (ISO 8859-2)")
      item 'Cyrillic (Windows 1251)', reopen(encoding: "Cyrillic (Windows 1251)")
      item 'Cyrillic (Windows 866)', reopen(encoding: "Cyrillic (Windows 866)")
      item 'Cyrillic (ISO 8859-5)', reopen(encoding: "Cyrillic (ISO 8859-5)")
      item 'Cyrillic (KOI8-R)', reopen(encoding: "Cyrillic (KOI8-R)")
      item 'Cyrillic (KOI8-U)', reopen(encoding: "Cyrillic (KOI8-U)")
      item 'Estonian (ISO 8859-13)', reopen(encoding: "Estonian (ISO 8859-13)")
      item 'Greek (Windows 1253)', reopen(encoding: "Greek (Windows 1253)")
      item 'Greek (ISO 8859-7)', reopen(encoding: "Greek (ISO 8859-7)")
      item 'Hebrew (Windows 1255)', reopen(encoding: "Hebrew (Windows 1255)")
      item 'Hebrew (ISO 8859-8)', reopen(encoding: "Hebrew (ISO 8859-8)")
      item 'Nordic (ISO 8859-10)', reopen(encoding: "Nordic (ISO 8859-10)")
      item 'Romanian (ISO 8859-16)', reopen(encoding: "Romanian (ISO 8859-16)")
      item 'Turkish (Windows 1254)', reopen(encoding: "Turkish (Windows 1254)")
      item 'Turkish (ISO 8859-9)', reopen(encoding: "Turkish (ISO 8859-9)")
      item 'Vietnamese (Windows 1258)', reopen(encoding: "Vietnamese (Windows 1258)")
      item '-'
      item 'Hexadecimal', reopen(encoding: "Hexadecimal")
    end
    item 'N&ew View into File', clone_file
    item '&Save', save
    item 'Save with Encoding' do
      item 'UTF-8', save(encoding: "utf-8")
      item 'UTF-8 with BOM', save(encoding: "utf-8 with bom")
      item 'UTF-16 LE', save(encoding: "utf-16 le")
      item 'UTF-16 LE with BOM', save(encoding: "utf-16 le with bom")
      item 'UTF-16 BE', save(encoding: "utf-16 be")
      item 'UTF-16 BE with BOM', save(encoding: "utf-16 be with bom")
      item '-'
      item 'Western (Windows 1252)', save(encoding: "Western (Windows 1252)")
      item 'Western (ISO 8859-1)', save(encoding: "Western (ISO 8859-1)")
      item 'Western (ISO 8859-3)', save(encoding: "Western (ISO 8859-3)")
      item 'Western (ISO 8859-15)', save(encoding: "Western (ISO 8859-15)")
      item 'Western (Mac Roman)', save(encoding: "Western (Mac Roman)")
      item 'DOS (CP 437)', save(encoding: "DOS (CP 437)")
      item 'Arabic (Windows 1256)', save(encoding: "Arabic (Windows 1256)")
      item 'Arabic (ISO 8859-6)', save(encoding: "Arabic (ISO 8859-6)")
      item 'Baltic (Windows 1257)', save(encoding: "Baltic (Windows 1257)")
      item 'Baltic (ISO 8859-4)', save(encoding: "Baltic (ISO 8859-4)")
      item 'Celtic (ISO 8859-14)', save(encoding: "Celtic (ISO 8859-14)")
      item 'Central European (Windows 1250)', save(encoding: "Central European (Windows 1250)")
      item 'Central European (ISO 8859-2)', save(encoding: "Central European (ISO 8859-2)")
      item 'Cyrillic (Windows 1251)', save(encoding: "Cyrillic (Windows 1251)")
      item 'Cyrillic (Windows 866)', save(encoding: "Cyrillic (Windows 866)")
      item 'Cyrillic (ISO 8859-5)', save(encoding: "Cyrillic (ISO 8859-5)")
      item 'Cyrillic (KOI8-R)', save(encoding: "Cyrillic (KOI8-R)")
      item 'Cyrillic (KOI8-U)', save(encoding: "Cyrillic (KOI8-U)")
      item 'Estonian (ISO 8859-13)', save(encoding: "Estonian (ISO 8859-13)")
      item 'Greek (Windows 1253)', save(encoding: "Greek (Windows 1253)")
      item 'Greek (ISO 8859-7)', save(encoding: "Greek (ISO 8859-7)")
      item 'Hebrew (Windows 1255)', save(encoding: "Hebrew (Windows 1255)")
      item 'Hebrew (ISO 8859-8)', save(encoding: "Hebrew (ISO 8859-8)")
      item 'Nordic (ISO 8859-10)', save(encoding: "Nordic (ISO 8859-10)")
      item 'Romanian (ISO 8859-16)', save(encoding: "Romanian (ISO 8859-16)")
      item 'Turkish (Windows 1254)', save(encoding: "Turkish (Windows 1254)")
      item 'Turkish (ISO 8859-9)', save(encoding: "Turkish (ISO 8859-9)")
      item 'Vietnamese (Windows 1258)', save(encoding: "Vietnamese (Windows 1258)")
      item '-'
      item 'Hexadecimal', save(encoding: "Hexadecimal")
    end
    item 'S&ave As…', prompt_save_as
    item 'Save A&ll', save_all
    item '-', id: 'window'
    item 'Ne&w Window', new_window
    item 'Close Window', close_window
    item '-', id: 'close'
    item '&Close File', close
    item 'Re&vert File', revert
    item 'Close All Files', close_all
    item '-', id: 'exit'
    item exit, mnemonic: 'x'
  end
  item '&Edit', id: 'edit' do
    item undo, mnemonic: 'U'
    item redo_or_repeat, mnemonic: 'R'
    item 'Undo Selection' do
      item soft_undo
      item soft_redo
    end
    item '-', id: 'clipboard'
    item copy, mnemonic: 'C'
    item cut, mnemonic: 'n'
    item paste, mnemonic: 'P'
    item paste_and_indent, mnemonic: 'I'
    item '-'
    item '&Line', id: 'line' do
      item indent
      item unindent
      item reindent(single_line: true)
      item swap_line_up
      item swap_line_down
      item duplicate_line
      item 'Delete Line', run_macro_file("Packages/Default/Delete Line.sublime-macro")
      item join_lines
    end
    item 'Co&mment', id: 'comment' do
      item 'Toggle Comment', toggle_comment(block: false)
      item 'Toggle Block Comment', toggle_comment(block: true)
    end
    item '&Text', id: 'text' do
      item 'Insert Line Before', run_macro_file("Packages/Default/Add Line Before.sublime-macro")
      item 'Insert Line After', run_macro_file("Packages/Default/Add Line.sublime-macro")
      item '-'
      item 'Delete Word Forward', delete_word(forward: true)
      item 'Delete Word Backward', delete_word(forward: false)
      item 'Delete Line', run_macro_file("Packages/Default/Delete Line.sublime-macro")
      item 'Delete to End', run_macro_file("Packages/Default/Delete to Hard EOL.sublime-macro")
      item 'Delete to Beginning', run_macro_file("Packages/Default/Delete to Hard BOL.sublime-macro")
      item '-'
      item transpose
    end
    item 'Tag', id: 'tag' do
      item close_tag
      item 'Expand Selection to Tag', expand_selection(to: "tag")
      item 'Wrap Selection With Tag', insert_snippet(name: "Packages/XML/long-tag.sublime-snippet")
    end
    item 'Mark', id: 'mark' do
      item set_mark
      item select_to_mark
      item delete_to_mark
      item swap_with_mark
      item 'Clear Mark', clear_bookmarks(name: "mark")
      item '-'
      item yank
    end
    item 'Code Folding', id: 'fold' do
      item fold
      item unfold
      item 'Unfold All', unfold_all
      item '-'
      item 'Fold All', fold_by_level(1)
      item 'Fold Level 2', fold_by_level(2)
      item 'Fold Level 3', fold_by_level(3)
      item 'Fold Level 4', fold_by_level(4)
      item 'Fold Level 5', fold_by_level(5)
      item 'Fold Level 6', fold_by_level(6)
      item 'Fold Level 7', fold_by_level(7)
      item 'Fold Level 8', fold_by_level(8)
      item 'Fold Level 9', fold_by_level(9)
      item '-'
      item 'Fold Tag Attributes', fold_tag_attributes
    end
    item 'Convert C&ase', id: 'convert_case' do
      item 'Title Case', title_case
      item 'Upper Case', upper_case
      item 'Lower Case', lower_case
      item 'Swap Case', swap_case
    end
    item 'Wrap', id: 'wrap' do
      item 'Wrap Paragraph at Ruler', wrap_lines
      item 'Wrap paragraph at 70 characters', wrap_lines(width: 70)
      item 'Wrap paragraph at 78 characters', wrap_lines(width: 78)
      item 'Wrap paragraph at 80 characters', wrap_lines(width: 80)
      item 'Wrap paragraph at 100 characters', wrap_lines(width: 100)
      item 'Wrap paragraph at 120 characters', wrap_lines(width: 120)
    end
    item 'Show Completions', auto_complete
    item '-', id: 'permute'
    item '&Sort Lines', sort_lines(case_sensitive: false)
    item 'Sort Lines (Case Sensitive)', sort_lines(case_sensitive: true)
    item 'Permute Lines' do
      item 'Reverse', permute_lines(operation: "reverse")
      item 'Unique', permute_lines(operation: "unique")
      item 'Shuffle', permute_lines(operation: "shuffle")
    end
    item 'Permute Selections' do
      item 'Sort', sort_selection(case_sensitive: false)
      item 'Sort (Case Sensitive)', sort_selection(case_sensitive: true)
      item 'Reverse', permute_selection(operation: "reverse")
      item 'Unique', permute_selection(operation: "unique")
      item 'Shuffle', permute_selection(operation: "shuffle")
    end
    item '-', id: 'end'
  end
  item '&Selection', id: 'selection' do
    item 'Split into Lines', split_selection_into_lines
    item 'Add Previous Line', select_lines(forward: false)
    item 'Add Next Line', select_lines(forward: true)
    item single_selection
    item '-'
    item select_all
    item 'Expand Selection to Line', expand_selection(to: "line")
    item 'Expand Selection to Word', find_under_expand
    item 'Expand Selection to Paragraph', expand_selection_to_paragraph
    item 'Expand Selection to Scope', expand_selection(to: "scope")
    item 'Expand Selection to Brackets', expand_selection(to: "brackets")
    item 'Expand Selection to Indentation', expand_selection(to: "indentation")
    item 'Expand Selection to Tag', expand_selection(to: "tag")
  end
  item 'F&ind', id: 'find' do
    item 'Find…', show_panel("find")
    item find_next
    item 'Find Previous', find_prev
    item 'Incremental Find', show_panel("incremental_find", reverse: false)
    item '-'
    item 'Replace…', show_panel("replace")
    item replace_next
    item '-'
    item 'Quick Find', find_under
    item 'Quick Find All', find_all_under
    item 'Quick Add Next', find_under_expand
    item 'Quick Skip Next', find_under_expand_skip, platform: '!OSX'
    item '-'
    item 'Use Selection for Find', slurp_find_string
    item 'Use Selection for Replace', slurp_replace_string
    item '-'
    item 'Find in Files…', show_panel("find_in_files")
    item 'Find &Results' do
      item 'Show Results Panel', show_panel("output.find_results")
      item next_result
      item 'Previous Result', prev_result
    end
  end
  item '&View', id: 'view' do
    item 'Side Bar', id: 'side_bar' do
      item toggle_side_bar
      item '-'
      item toggle_show_open_files
    end
    item toggle_minimap
    item toggle_tabs
    item toggle_status_bar
    item toggle_menu
    item show_panel("console", toggle: true)
    item '-', id: 'full_screen'
    item toggle_full_screen
    item toggle_distraction_free
    item '-', id: 'groups'
    item '&Layout', id: 'layout' do
      item 'Single', set_layout(cols: [0.0, 1.0], rows: [0.0, 1.0], cells: [[0, 0, 1, 1]])
      item 'Columns: 2', set_layout(cols: [0.0, 0.5, 1.0], rows: [0.0, 1.0], cells: [[0, 0, 1, 1], [1, 0, 2, 1]])
      item 'Columns: 3', set_layout(cols: [0.0, 0.33, 0.66, 1.0], rows: [0.0, 1.0], cells: [[0, 0, 1, 1], [1, 0, 2, 1], [2, 0, 3, 1]])
      item 'Columns: 4', set_layout(cols: [0.0, 0.25, 0.5, 0.75, 1.0], rows: [0.0, 1.0], cells: [[0, 0, 1, 1], [1, 0, 2, 1], [2, 0, 3, 1], [3, 0, 4, 1]])
      item 'Rows: 2', set_layout(cols: [0.0, 1.0], rows: [0.0, 0.5, 1.0], cells: [[0, 0, 1, 1], [0, 1, 1, 2]])
      item 'Rows: 3', set_layout(cols: [0.0, 1.0], rows: [0.0, 0.33, 0.66, 1.0], cells: [[0, 0, 1, 1], [0, 1, 1, 2], [0, 2, 1, 3]])
      item 'Grid: 4', set_layout(cols: [0.0, 0.5, 1.0], rows: [0.0, 0.5, 1.0], cells: [[0, 0, 1, 1], [1, 0, 2, 1], [0, 1, 1, 2], [1, 1, 2, 2]])
    end
    item '&Focus Group' do
      item 'Group 1', focus_group(0)
      item 'Group 2', focus_group(1)
      item 'Group 3', focus_group(2)
      item 'Group 4', focus_group(3)
    end
    item '&Move File To Group' do
      item 'Group 1', move_to_group(0)
      item 'Group 2', move_to_group(1)
      item 'Group 3', move_to_group(2)
      item 'Group 4', move_to_group(3)
    end
    item '-'
    item '&Syntax', id: 'syntax' do
      item _dollar_file_types
    end
    item '&Indentation', id: 'indentation' do
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
    item 'Li&ne Endings', id: 'line_endings' do
      item 'Windows', set_line_ending(type: "windows"), checkbox: true
      item 'Unix', set_line_ending(type: "unix"), checkbox: true
      item 'Mac OS 9', set_line_ending(type: "cr"), checkbox: true
    end
    item '-', id: 'settings'
    item '&Word Wrap', toggle_setting("word_wrap"), checkbox: true
    item 'Word Wrap Column' do
      item 'Automatic', set_setting("wrap_width", value: 0), checkbox: true
      item '-'
      item '70', set_setting("wrap_width", value: 70), checkbox: true
      item '78', set_setting("wrap_width", value: 78), checkbox: true
      item '80', set_setting("wrap_width", value: 80), checkbox: true
      item '100', set_setting("wrap_width", value: 100), checkbox: true
      item '120', set_setting("wrap_width", value: 120), checkbox: true
    end
    item 'Ruler' do
      item 'None', set_setting("rulers", value: []), checkbox: true
      item '-'
      item '70', set_setting("rulers", value: [70]), checkbox: true
      item '78', set_setting("rulers", value: [78]), checkbox: true
      item '80', set_setting("rulers", value: [80]), checkbox: true
      item '100', set_setting("rulers", value: [100]), checkbox: true
      item '120', set_setting("rulers", value: [120]), checkbox: true
    end
    item '-'
    item 'Spell Check', toggle_setting("spell_check"), checkbox: true
    item next_misspelling
    item prev_misspelling
    item 'Dictionary' do
      item _dollar_dictionaries
    end
  end
  item '&Goto', id: 'goto' do
    item 'Goto &Anything…', show_overlay("goto", show_files: true)
    item '-'
    item 'Goto Symbol…', show_overlay("goto", text: "@")
    item 'Goto Line…', show_overlay("goto", text: ":")
    item '-'
    item 'Swi&tch File', id: 'switch_file' do
      item 'Next File', next_view
      item 'Previous File', prev_view
      item '-'
      item 'Next File in Stack', next_view_in_stack
      item 'Previous File in Stack', prev_view_in_stack
      item '-'
      item 'Switc&h Header/Implementation', switch_file(extensions: %w(cpp cxx cc c hpp hxx h ipp inl m mm))
      item '-'
      item select_by_index(0)
      item select_by_index(1)
      item select_by_index(2)
      item select_by_index(3)
      item select_by_index(4)
      item select_by_index(5)
      item select_by_index(6)
      item select_by_index(7)
      item select_by_index(8)
      item select_by_index(9)
    end
    item '-'
    item '&Scroll', id: 'scroll' do
      item 'Scroll to Selection', show_at_center
      item 'Line Up', scroll_lines(amount: 1.0)
      item 'Line Down', scroll_lines(amount: -1.0)
    end
    item '&Bookmarks', id: 'bookmarks' do
      item toggle_bookmark
      item next_bookmark
      item prev_bookmark
      item clear_bookmarks
      item select_all_bookmarks
      item '-'
      item select_bookmark(index: 0)
      item select_bookmark(index: 1)
      item select_bookmark(index: 2)
      item select_bookmark(index: 3)
      item select_bookmark(index: 4)
      item select_bookmark(index: 5)
      item select_bookmark(index: 6)
      item select_bookmark(index: 7)
      item select_bookmark(index: 8)
      item select_bookmark(index: 9)
      item select_bookmark(index: 10)
      item select_bookmark(index: 11)
      item select_bookmark(index: 12)
      item select_bookmark(index: 13)
      item select_bookmark(index: 14)
      item select_bookmark(index: 15)
    end
    item '-'
    item 'Jump to Matching Bracket', move_to("brackets")
  end
  item '&Tools', id: 'tools' do
    item 'Command Palette…', show_overlay("command_palette")
    item 'Snippets…', show_overlay("command_palette", text: "Snippet: ")
    item '-', id: 'build'
    item 'B&uild System' do
      item 'Automatic', set_build_system(file: ""), checkbox: true
      item '-'
      item set_build_system(index: 0), checkbox: true
      item set_build_system(index: 1), checkbox: true
      item set_build_system(index: 2), checkbox: true
      item set_build_system(index: 3), checkbox: true
      item set_build_system(index: 4), checkbox: true
      item set_build_system(index: 5), checkbox: true
      item set_build_system(index: 6), checkbox: true
      item set_build_system(index: 7), checkbox: true
      item _dollar_build_systems
      item '-'
      item 'New Build System…', new_build_system
    end
    item build, mnemonic: 'B'
    item build(variant: "Run"), mnemonic: 'R'
    item '&Cancel Build', exec(kill: true)
    item 'Build &Results' do
      item '&Show Build Results', show_panel("output.exec")
      item next_result, mnemonic: 'N'
      item '&Previous Result', prev_result
    end
    item 'S&ave All on Build', toggle_save_all_on_build, checkbox: true
    item '-', id: 'macros'
    item toggle_record_macro, mnemonic: 'M'
    item '&Playback Macro', run_macro
    item 'Sa&ve Macro…', save_macro
    item 'Macros' do
      item _dollar_macros
    end
    item '-'
    item 'New Plugin…', new_plugin
    item 'New Snippet…', new_snippet
    item '-', id: 'end'
  end
  item '&Project', id: 'project' do
    item '&Open Project…', prompt_open_project
    item '&Recent Projects' do
      item open_recent_project(index: 0)
      item open_recent_project(index: 1)
      item open_recent_project(index: 2)
      item open_recent_project(index: 3)
      item open_recent_project(index: 4)
      item open_recent_project(index: 5)
      item open_recent_project(index: 6)
      item open_recent_project(index: 7)
      item '-'
      item 'Clear Items', clear_recent_projects
    end
    item '-'
    item '&Switch Project in Window…', prompt_select_project
    item 'S&ave Project As…', save_project_as
    item close_project, mnemonic: 'C'
    item 'Edit Project', open_file("${project}")
    item '-'
    item 'A&dd Folder to Project…', prompt_add_folder
    item 'Re&move all Folders from Project', close_folder_list
    item 'R&efresh Folders', refresh_folder_list
    item '-'
    item '-', id: 'end'
  end
  item 'Prefere&nces', id: 'preferences' do
    item '&Browse Packages…', open_dir("$packages")
    item '-'
    item 'Settings – Default', open_file("${packages}/Default/Preferences.sublime-settings")
    item 'Settings – User', open_file("${packages}/User/Preferences.sublime-settings")
    item 'Settings – More' do
      item 'Syntax Specific – User', open_file_settings
      item 'Distraction Free – User', open_file("${packages}/User/Distraction Free.sublime-settings")
    end
    item '-'
    item 'Key Bindings – Default', open_file("${packages}/Default/Default ($platform).sublime-keymap")
    item 'Key Bindings – User', open_file("${packages}/User/Default ($platform).sublime-keymap")
    item '-'
    item 'Font' do
      item 'Larger', increase_font_size
      item 'Smaller', decrease_font_size
      item '-'
      item 'Reset', reset_font_size
    end
    item 'Color Scheme' do
      item _dollar_color_schemes
    end
  end
  item '&Help', id: 'help' do
    item 'Documentation', open_url("http://www.sublimetext.com/docs/2/")
    item 'Twitter', open_url("http://twitter.com/sublimehq")
    item '-'
    item purchase_license
    item 'Enter License', show_license_window
    item remove_license
    item '-'
    item '&About Sublime Text 2', show_about_window
  end

end
