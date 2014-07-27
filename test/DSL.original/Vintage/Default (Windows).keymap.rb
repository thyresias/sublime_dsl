
keymap 'Default (Windows)' do

  conditionals if: 'si', and: 'et', or: 'ou'

  bind 'left', set_motion("vi_move_by_characters_in_line", motion_args: {"forward"=>false, "extend"=>true})
    si setting.command_mode
  bind 'right', set_motion("vi_move_by_characters_in_line", motion_args: {"forward"=>true, "extend"=>true, "visual"=>false})
    si setting.command_mode
  bind 'up', set_motion("move", motion_args: {"by"=>"lines", "forward"=>false, "extend"=>true})
    si setting.command_mode
  bind 'down', set_motion("move", motion_args: {"by"=>"lines", "forward"=>true, "extend"=>true})
    si setting.command_mode
  bind 'ctrl+left', set_motion("move", motion_args: {"by"=>"stops", "word_begin"=>true, "punct_begin"=>true, "empty_line"=>true, "forward"=>false, "extend"=>true})
    si setting.command_mode
  bind 'ctrl+right', set_motion("move", motion_args: {"by"=>"stops", "word_begin"=>true, "punct_begin"=>true, "empty_line"=>true, "forward"=>true, "extend"=>true})
    si setting.command_mode
  bind 'alt+left', set_motion("move", motion_args: {"by"=>"stops", "word_begin"=>true, "sub_word_begin"=>true, "punct_begin"=>true, "empty_line"=>true, "forward"=>false, "extend"=>true})
    si setting.command_mode
  bind 'alt+right', set_motion("move", motion_args: {"by"=>"stops", "word_begin"=>true, "sub_word_begin"=>true, "punct_begin"=>true, "empty_line"=>true, "forward"=>true, "extend"=>true})
    si setting.command_mode
  bind 'pageup', set_motion("move", motion_args: {"by"=>"pages", "forward"=>false, "extend"=>true})
    si setting.command_mode
    et setting.vintage_ctrl_keys
  bind 'pagedown', set_motion("move", motion_args: {"by"=>"pages", "forward"=>true, "extend"=>true})
    si setting.command_mode
    et setting.vintage_ctrl_keys
  bind 'home', set_motion("vi_move_to_first_non_white_space_character", motion_args: {"extend"=>true})
    si setting.command_mode
  bind 'end', set_motion("vi_move_to_hard_eol", motion_args: {"repeat"=>1, "extend"=>true}, inclusive: true)
    si setting.command_mode
  bind 'ctrl+home', set_motion("move_to", motion_args: {"to"=>"bof", "extend"=>true}, inclusive: true)
    si setting.command_mode
  bind 'ctrl+end', set_motion("move_to", motion_args: {"to"=>"eof", "extend"=>true}, inclusive: true)
    si setting.command_mode

end
