
keyboard 'AZERTY-fr-FR-v6 (Windows 7)' do

  os 'Windows'

  # modifiers
  # they will be displayed in the order given

  add_modifiers 'shift ctrl win alt'

  map_modifier 'win' => 'super'

  # describe the physical keys present on the keyboard
  #
  # If the name matches a ST key name, this creates the association,
  # assuming the key behaves exactly like the ST key when the name
  # has more than 1 character. When it has only one character,
  # it is assumed to generate just a chr_event without modifiers,
  # and to behave like le ST key when modified.

  add_keys 'esc', st_keys: 'escape'
  add_keys 'f1-f12'
  add_keys 'print_screen scroll_lock'
  add_keys 'pause'

  add_keys '²'
  # we could do this:
  #   add_keys '& é " \' ( - è _ ç à', st_keys: '1 2 3 4 5 6 7 8 9 0'
  # but I prefer to see 'ctrl+1' rather than 'ctrl+&', for instance, so:
  add_keys '1 2 3 4 5 6 7 8 9 0'
  add_keys ') ='
  add_keys 'backspace tab'
  add_keys 'a z e r t y u i o  p ^ $ enter'
  add_keys 'q s d f g h j k l m ù *'
  add_keys '< w x c v b n , ; : !'
  add_keys 'space context_menu'

  add_keys 'ins del home end pgup pgdn', st_keys: 'insert delete home end pageup pagedown'
  add_keys 'up down left right' #, display: '↑ ↓ ← →'

  add_keys 'num/ num* num- num+', st_keys: 'keypad_divide keypad_multiply keypad_minus keypad_plus'
  add_keys 'num0-num9 num.', st_keys: 'keypad0-keypad9 keypad_period'
  add_keys 'num_enter', st_keys: 'keypad_enter'

  # assign general keystroke substitutions

  map_key '²' => "'"   # modifier+² is seen as modifier+'

  map_key ')' => '['
  map_key '=' => '='   # match

  map_key '^' => ']'
  map_key '$' => ';'

  map_key 'ù' => '`'
  map_key '*' => '\\'

  map_key ',' => ','   # match
  map_key ';' => '.'

  map_key ':' => '/'
  map_key '!' => nil   # modifier+! is not seen

  map_key '<' => nil

  # map some special keystrokes to characters
  # this does not remove the key mapping, if any:
  # it therefore means ST sees both a key event and a chr event
  # 'dead' means it's a dead key

  map_char 'ctrl+alt+2' => '~', dead: true
  map_char 'ctrl+alt+3' => '#'
  map_char "ctrl+alt+4" => '{'
  map_char 'ctrl+alt+5' => '['
  map_char 'ctrl+alt+6' => '|'
  map_char 'ctrl+alt+7' => '`', dead: true
  map_char 'ctrl+alt+8' => '\\'
  map_char 'ctrl+alt+9' => '^'
  map_char 'ctrl+alt+0' => '@'
  map_char 'ctrl+alt+)' => ']'
  map_char 'ctrl+alt+=' => '}'
  map_char 'ctrl+alt+e' => '€'
  map_char 'ctrl+alt+$' => '¤'

  # custom v6 mappings

  map_char  'ctrl+)' => '@'
  map_char  'ctrl+=' => '#'
  map_char  'ctrl+^' => '{'
  map_char  'ctrl+$' => '}'
  map_char  'ctrl+ù' => '['
  map_char  'ctrl+*' => ']'
  map_char  'ctrl+:' => '\\'
  map_char  'ctrl+!' => '|'

  # OS-reserved keystokes (by default, means ST does not see the keystoke)

  os_action 'win+f1' => 'Windows Help'

  os_action 'win+tab' => 'Aero Flip'
  os_action 'win+pause' => 'System Properties'
  os_action 'win+e' => 'Explorer (Computer)'
  os_action 'win+r' => 'Run'
  os_action 'win+t' => 'TaskBar'
  os_action 'win+u' => 'Ease of Access Center (Utility Manager)'
  os_action 'win+p' => 'Display Choice'
  os_action 'win+d' => 'Desktop'
  os_action 'win+f' => 'Find Files'
  os_action 'win+l' => 'Lock Computer'
  os_action 'win+m' => 'Minimize All'
  os_action 'win+shift+m' => 'Restore All'
  os_action 'win+b' => 'Focus Taskbar Icons'
  os_action 'win+num+' => 'Magnifier'

  os_action 'ctrl+alt+del' => 'System Menu/Reboot'
  os_action 'alt+tab' => 'Cycle Running Apps'
  os_action 'shift+alt+tab' => 'Cycle Back Running Apps'

  os_action 'print_screen' => 'Screen Capture'
  os_action 'alt+print_screen' => 'Window Capture'

  os_action 'ctrl+esc' => 'Start Menu'
  os_action 'ctrl+shift+esc' => 'Task Manager'

  os_action 'alt+esc' => 'Next Taskbar Window'
  os_action 'alt+space' => 'Window Control Menu', key_event: true

  # keystrokes not seen by ST

  map_key 'win+h' => nil
  map_key 'win+c' => nil
  map_key 'win+v' => nil

  # strange combinations generating characters

  map_char 'win+shift+d' => 'D'
  map_char 'ctrl+pause' => "\x03" # ETX

  map_key 'ctrl+pause' => nil   # implies that shift+ctrl+pause, alt+ctrl+pause are not seen either

  # numeric keypad (with NumLock on)

  '/*-+'.chars.each do |c|
    map_char 'num' << c => c
    map_char 'shift+num' << c => c
  end

  '0123456789'.chars.each do |c|
    map_char 'num' << c => c
  end

  map_char 'num.' =>  '.'

  %w(0:insert 1:end 2:down 3:pagedown 4:left 5:clear 6:right 7:home 8:up 9:pageup).each do |spec|
    n, k = spec.split(':')
    map_key "shift+num#{n}" => k
  end

  map_key 'shift+num.' => 'delete'

  map_key 'num_enter' => 'enter'   # so keypad_enter is not available

  # test: shift+ctrl+keypad5 is undestood as ctrl+clear

end
