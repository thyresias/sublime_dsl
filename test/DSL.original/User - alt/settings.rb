# encoding: utf-8

settings 'JSON' do

  extensions %w(sublime-commands sublime-workspace)

end

settings 'Preferences' do

  auto_complete true
  auto_complete_commit_on_tab true
  auto_match_enabled false
  caret_style 'smooth'
  color_scheme 'Packages/Color Scheme - Default/Thierry.tmTheme'
  default_line_ending 'unix'
  detect_indentation false
  dictionary 'Packages/Language - English/en_US.dic'
  draw_indent_guides false
  font_face 'Consolas'
  font_size 9
  highlight_modified_tabs true
  hot_exit false
  margin 0
  match_brackets false
  remember_open_files true
  rulers [100, 120]
  tab_size 2
  theme 'Thierry.sublime-theme'
  translate_tabs_to_spaces true
  trim_trailing_white_space_on_save true

end
