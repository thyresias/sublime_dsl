# encoding: utf-8

commands 'Default' do

  item 'Word Wrap: Toggle', toggle_setting("word_wrap")
  item 'Convert Case: Upper Case', upper_case
  item 'Convert Case: Lower Case', lower_case
  item 'Convert Case: Title Case', title_case
  item 'Convert Case: Swap Case', swap_case
  item 'Toggle Comment', toggle_comment(block: false)
  item 'Toggle Block Comment', toggle_comment(block: true)
  item 'Bookmarks: Toggle', toggle_bookmark
  item 'Bookmarks: Select Next', next_bookmark
  item 'Bookmarks: Select Previous', prev_bookmark
  item 'Bookmarks: Clear All', clear_bookmarks
  item 'Bookmarks: Select All', select_all_bookmarks
  item 'Indentation: Convert to Tabs', unexpand_tabs(set_translate_tabs: true)
  item 'Indentation: Convert to Spaces', expand_tabs(set_translate_tabs: true)
  item 'Indentation: Reindent Lines', reindent(single_line: false)
  item 'View: Toggle Side Bar', toggle_side_bar
  item 'View: Toggle Open Files in Side Bar', toggle_show_open_files
  item 'View: Toggle Minimap', toggle_minimap
  item 'View: Toggle Tabs', toggle_tabs
  item 'View: Toggle Status Bar', toggle_status_bar
  item 'View: Toggle Menu', toggle_menu
  item 'Project: Save As', save_project_as
  item 'Project: Close', close_project
  item 'Project: Add Folder', prompt_add_folder
  item 'Preferences: Settings - Default', open_file("${packages}/Default/Preferences.sublime-settings")
  item 'Preferences: Settings - User', open_file("${packages}/User/Preferences.sublime-settings")
  item 'Preferences: Browse Packages', open_dir("$packages")
  item 'Preferences: Key Bindings - Default', open_file("${packages}/Default/Default (Windows).sublime-keymap", platform: "Windows")
  item 'Preferences: Key Bindings - Default', open_file("${packages}/Default/Default (OSX).sublime-keymap", platform: "OSX")
  item 'Preferences: Key Bindings - Default', open_file("${packages}/Default/Default (Linux).sublime-keymap", platform: "Linux")
  item 'Preferences: Key Bindings - User', open_file("${packages}/User/Default (Windows).sublime-keymap", platform: "Windows")
  item 'Preferences: Key Bindings - User', open_file("${packages}/User/Default (OSX).sublime-keymap", platform: "OSX")
  item 'Preferences: Key Bindings - User', open_file("${packages}/User/Default (Linux).sublime-keymap", platform: "Linux")
  item 'File: Save All', save_all
  item 'File: Revert', revert
  item 'File: New View into File', clone_file
  item 'File: Close All', close_all
  item 'HTML: Wrap Selection With Tag', insert_snippet(name: "Packages/XML/long-tag.sublime-snippet")
  item 'HTML: Encode Special Characters', encode_html_entities
  item 'Rot13 Selection', rot13
  item 'Sort Lines', sort_lines(case_sensitive: false)
  item 'Sort Lines (Case Sensitive)', sort_lines(case_sensitive: true)
  item 'Code Folding: Unfold All', unfold_all
  item 'Code Folding: Fold Tag Attributes', fold_tag_attributes
  item 'About', show_about_window

end
