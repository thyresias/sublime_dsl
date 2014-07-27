# encoding: utf-8

settings 'Distraction Free' do

  line_numbers false
  gutter false
  draw_centered true
  wrap_width 80
  word_wrap true
  scroll_past_end true

end

settings 'Minimap' do

  rulers []
  gutter false
  draw_indent_guides false

end

settings 'Preferences (Linux)' do

  font_face 'Monospace'
  font_size 10
  mouse_wheel_switches_tabs true

end

settings 'Preferences (OSX)' do

  font_face 'Menlo Regular'
  font_size 12
  scroll_past_end false
  find_selected_text false
  move_to_limit_on_up_down true
  close_windows_when_empty true
  show_full_path false

end

settings 'Preferences (Windows)' do

  font_face 'Consolas'
  font_size 10

end

settings 'Preferences' do

  color_scheme 'Packages/Color Scheme - Default/Monokai.tmTheme'
  font_face ''
  font_size 10
  font_options []
  word_separators './\()"\'-:,.;<>~!@#$%^&*|+=[]{}`~?'
  line_numbers true
  gutter true
  margin 4
  fold_buttons true
  fade_fold_buttons true
  rulers []
  spell_check false
  tab_size 4
  translate_tabs_to_spaces false
  use_tab_stops true
  detect_indentation true
  auto_indent true
  smart_indent true
  indent_to_bracket false
  trim_automatic_white_space true
  word_wrap 'auto'
  wrap_width 0
  indent_subsequent_lines true
  draw_centered false
  auto_match_enabled true
  dictionary 'Packages/Language - English/en_US.dic'
  draw_minimap_border false
  highlight_line false
  caret_style 'smooth'
  match_brackets true
  match_brackets_content true
  match_brackets_square true
  match_brackets_braces true
  match_brackets_angle false
  match_tags true
  match_selection true
  line_padding_top 0
  line_padding_bottom 0
  scroll_past_end true
  move_to_limit_on_up_down false
  draw_white_space 'selection'
  draw_indent_guides true
  indent_guide_options %w(draw_normal)
  trim_trailing_white_space_on_save false
  ensure_newline_at_eof_on_save false
  save_on_focus_lost false
  fallback_encoding 'Western (Windows 1252)'
  default_encoding 'UTF-8'
  enable_hexadecimal_encoding true
  default_line_ending 'system'
  tab_completion true
  auto_complete true
  auto_complete_size_limit 4194304
  auto_complete_delay 50
  auto_complete_selector 'source - comment'
  auto_complete_triggers [{"selector"=>"text.html", "characters"=>"<"}]
  auto_complete_commit_on_tab false
  auto_complete_with_fields false
  shift_tab_unindent false
  copy_with_empty_selection true
  find_selected_text true
  drag_text true
  theme 'Default.sublime-theme'
  scroll_speed 1.0
  tree_animation_enabled true
  highlight_modified_tabs false
  show_tab_close_buttons true
  bold_folder_labels false
  use_simple_full_screen false
  gpu_window_buffer 'auto'
  overlay_scroll_bars 'system'
  hot_exit true
  remember_open_files true
  open_files_in_new_window true
  create_window_at_startup true
  close_windows_when_empty false
  show_full_path true
  show_panel_on_build true
  preview_on_click true
  folder_exclude_patterns %w(.svn .git .hg CVS)
  file_exclude_patterns %w(*.pyc *.pyo *.exe *.dll *.obj *.o *.a *.lib *.so *.dylib *.ncb *.sdf *.suo *.pdb *.idb .DS_Store *.class *.psd *.db)
  binary_file_patterns %w(*.jpg *.jpeg *.png *.gif *.ttf *.tga *.dds *.ico *.eot *.pdf *.swf *.jar *.zip)
  ignored_packages %w(Vintage)

end

settings 'Regex Format Widget' do



end

settings 'Regex Widget' do

  syntax 'Packages/Regular Expressions/Regular Expressions (Oniguruma).tmLanguage'

end

settings 'Widget' do

  rulers []
  translate_tabs_to_spaces false
  gutter false
  margin 1
  syntax 'Packages/Text/Plain text.tmLanguage'
  is_widget true
  word_wrap false
  auto_match_enabled false
  scroll_past_end false
  draw_indent_guides false
  draw_centered false
  auto_complete false
  match_selection false

end
