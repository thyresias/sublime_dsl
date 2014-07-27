
keyboard 'AZERTY-fr-FR-v1 (OSX)' do

  # TODO: remove this, rely on naming
  os 'OSX'

  # modifiers
  # they will be displayed in the order given here

  add_modifiers 'shift ctrl alt cmd'

  map_modifier 'cmd' => 'super'

  # describe the physical keys present on the keyboard
  #
  # pas comme Windows: à moins qu'on ne dise le contraire,
  # les touches à 1 caractère génèrent effectivement tous
  # leurs key_events.

  add_keys 'esc', st_keys: 'escape'
  add_keys 'f1-f19'
  add_keys '@'
  # I prefer to see ctrl+1 rather than ctrl+&
  add_keys '1 2 3 4 5 6 7 8 9', st_keys: '& é " \' ( § è ! ç à'
  add_keys ') -'
  add_keys 'backspace tab'
  add_keys 'a z e r t y u i o  p ^ $ enter'
  add_keys 'q s d f g h j k l m ù `'
  add_keys '< w x c v b n , ; : ='
  add_keys 'space'

  add_keys 'del home end pgup pgdn', st_keys: 'delete home end pageup pagedown'
  add_keys 'up down left right' #, display: '↑ ↓ ← →'

  add_keys 'num=', st_keys: '='
  add_keys 'num/ num* num- num+', st_keys: '/ * - +'
  add_keys 'num0-num9', st_keys: '0-9'
  add_keys 'num.', st_keys: '.' # standard French: add_keys 'num,', st_keys: ','
  add_keys 'num_enter', st_keys: 'keypad_enter'

  # tous les alt+char key et shift+alt+char key => char
  # ST voit chr + key event

  %w!
    @1234567890)- •ë“‘{¶«¡Çø}—  Ÿ´„”’[å»ÛÁØ]–
    azertyuiop^$  æÂê®†Úºîœπô€   ÆÅÊ‚™ŸªïŒ∏Ô¥
    qsdfghjklmù`  ‡Ò∂ƒﬁÌÏÈ¬µÙ@   Ω∑∆·ﬂÎÍË|Ó‰#
    <wxcvbn,;:=   ≤‹≈©◊ß~∞…÷≠    ≥›⁄¢√∫ı¿•\±
  !.each do |keys, alt, shift_alt|
    keys.chars.each_with_index do |c,i|
      map_char "alt+#{c}" => alt[i]
      map_char "shift+alt+#{c}" => shift_alt[i]
    end
  end

  # assign general keystroke substitutions

  map_char 'ctrl+^' => "\e"
  map_char 'ctrl+`' => "\x1c"

  # OS-reserved keystokes (by default, means ST does not see the keystoke)

  os_action 'f9' => 'Exposé: All Windows'
  os_action 'f10' => 'Exposé: Application Windows'
  os_action 'f11' => 'Exposé: Show Desktop'

  os_action 'f12' => 'Dashboard: Hide and Show'
  os_action 'alt+cmd+d' => 'Toggle Dock Hiding'

  os_action 'ctrl+f7' => 'Change the way Tab moves focus'
  # disabled in System Preferences > Language & Text => Keyboard Shortcuts...
  # os_action 'ctrl+f2' => 'Move focus to the menu bar'
  # os_action 'ctrl+f3' => 'Move focus to the Dock'
  os_action 'ctrl+f4' => 'Move focus to active or next window'
  os_action 'ctrl+f5' => 'Move focus to the window toolbar'
  os_action 'ctrl+f6' => 'Move focus to the floating window'
  os_action 'cmd+`' => 'Move focus to next window in application'
  os_action "alt+cmd+'" => 'Move focus to the window drawer'
  os_action 'ctrl+f8' => 'Move focus to status menus'
  # disabled in System Preferences > Language & Text => Keyboard Shortcuts...
  # os_action 'cmd+space' => 'Select the previous input source'
  # os_action 'alt+cmd+space' => 'Select next source in Input menu'

  os_action 'shift+cmd+3' => 'Save picture of screen as a file'
  os_action 'actrl+shift+cmd+3' => 'Copy picture of screen to the clipboard'
  os_action 'shift+cmd+4' => 'Save picture of selected area as a file'
  os_action 'actrl+shift+cmd+4' => 'Copy picture of selected area to the clipboard'

  os_action 'cmd+space' => 'Show Spotlight search field'
  os_action 'alt+cmd+space' => 'Show Spotlight window'

  os_action 'shift+cmd+/' => 'Show Help menu'

end
