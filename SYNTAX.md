
This preliminary documentation supposes you are familiar with the configuration files
of TextMate (grammars, preferences, snippets and themes) and Sublime Text (commands,
keymaps, mousemaps, menus, settings).

## General Design

### Import: Converting to DSL

When importing a ST package, some files are grouped into one DSL file:

- all macros (*.sublime-macro) are grouped into macros.rb
- all snippets (*.sublime-snippet, *.tmSnippet) are grouped into snippets.rb
- all commands (*.sublime-commands) are grouped into commands.rb
- all preferences (*.tmPreferences) are grouped into preferences.rb
- all settings (*.sublime-settings) are grouped into settings.rb

Other files generate one DSL file:

- *.tmLanguage => *.tmLanguage.rb
- *.sublime-menu => *.menu.rb
- *.sublime-keymap => *.keymap.rb
- *.sublime-mousemap => *.mousemap.rb

Finally, files with an extension not listed above (e.g., *.py) are copied "as is".
In particular, there is no DSL (yet?) for *.sublime-build and *.sublime-completions.

### Export: Converting from DSL

The export processes all *.rb files located in the DSL directory, and copies
other files "as is". Therefore, the organization of DSL files is free: a whole
package can be specified into one source file, or into several source files.

## Grammars

Grammars are defined with the `language` method:

```ruby
language 'Ruby' => 'source.ruby' do
  # definitions
end
```

The exported file by will be named 'Ruby.tmLanguage', unless a :file option is given:

```ruby
language 'Ruby' => 'source.ruby', :file => 'MyRuby' do
  # definitions
end
```

Inside the `language` block, the properties correspond to method calls with the
"snake case" version of the property:

```ruby
file_types %w(rb rbx rjs Rakefile rake cgi fcgi gemspec irbrc capfile Gemfile)
first_line_match %r'^#!/.*\bruby'
folding_start_marker %r:(?x)^
  ...
:
folding_stop_marker %r/(?x)
  ...
/
key_equivalent "^~R"  # TextMate only
uuid "E00B62AC-6B1C-11D9-9B1F-000D93589AF6"  # TextMate only
```

There are 3 exceptions:

- `scopeName` is not available, since it is specified in the arguments of the `language` method.

- `patterns` is not there: each rule inside patterns= corresponds to a `rule` block.

- `repository` is not there either: each fragment inside repository= corresponds to a `fragment`
  block.

Rules are specified in `rule` blocks, the scope name being the (optional) argument of the
`rule` method:

```
  { name = 'string.unquoted.here-doc';
    begin = '<<(\w+)';  // match here-doc token
    end = '^\1$';       // match end of here-doc
  }
```

becomes:

```ruby
  rule 'string.unquoted.here-doc' do
    from %r/<<(\w+)/  # match here-doc token
    to %r/^§1$/       # match end of here-doc
  end
```

`begin` and `end` being reserved words in Ruby, they are replaced by `from` and `to` (and
`applyEndPatternLast` is just `to_last`).

Notice also how back-references in `to` are noted with `§` instead of `\\`:
otherwise, the corresponding Ruby Regexp would be invalid.

Finally, the leading `%r` is to avoid syntactic warnings from Ruby.
One could also write (matter of taste):

```ruby
  rule 'string.unquoted.here-doc' do
    from(/<<(\w+)/)
    to(/^§1$/)
  end
```

Or, if you accept warnings (frown):

```ruby
  rule 'string.unquoted.here-doc' do
    from /<<(\w+)/
    to /^§1$/
  end
```

Nesting is performed by nesting rules, without patterns=:

```
  { begin = '<%'
    end = '%>'
    patterns = (
      { match = '\b(def|end)\b'; … },
      …
    );
  };
```

becomes:

```ruby
  rule do
    from %r'<%'
    to %r'%>'
    rule do
      match %r'\b(def|end)\b'
      …
    end
    …
  end
```

`contentName` is `content_scope`:

```
  {  begin = '#if 0(\s.*)?$'; end = '#endif';
     contentName = 'comment.block.preprocessor';
  };
```

becomes:

```ruby
  rule do
    from %r'#if 0(\s.*)?$'
    to %r'#endif'
    content_scope 'comment.block.preprocessor'
  end
```

`captures`, `beginCaptures`, `endCaptures` are specified as a final hash argument
for `match`, `from` and `to`, respectively:

```
  {  match = '(@selector\()(.*?)(\))';
     captures = {
        1 = { name = 'storage.type.objc'; };
        3 = { name = 'storage.type.objc'; };
     };
  };
```

becomes:

```ruby
  rule do
    match %r'(@selector\()(.*?)(\))',
      1 => 'storage.type.objc',
      2 => 'storage.type.objc'
  end
```

Captures that are common to `from` and `to` can be specified with `both`:

```ruby
  rule 'comment.block.documentation.ruby' do
    from %r/^=begin/
    to %r/^=end/
    both 0 => 'punctuation.definition.comment.ruby'
  end
```

`include` is specified without patterns=:

```
  { begin = '<\?(php|=)?'; end = '\?>'; patterns = (
      { include = "source.php"; }
    );
  }
```

becomes:

```ruby
  rule do
    from %r'<\?(php|=)?'
    to %r'\?>'
    include 'source.php'
  end
```

Finally, repository entries use `fragment`:

```
  patterns = (
     {  name = 'string.unquoted.qq.perl';
        begin = 'qq\('; end = '\)'; patterns = (
           { include = '#qq_string_content'; },
        );
     },
     …
  ); // end of patterns
  repository = {
     qq_string_content = {
        begin = '\('; end = '\)'; patterns = (
           { include = '#qq_string_content'; },
        );
     };
  };
```

becomes:

```ruby
  rule 'string.unquoted.qq.perl' do
    from %r'qq\('
    to %r'\)'
    include '#qq_string_content'
  end

  fragment :qq_string_content
    rule do
      from %r'\('
      to %r'\)'
      include '#qq_string_content'
    end
  end
```


## Commands

Commands are specified in a `commands` block by the `item` method:

```json
  // in Default.sublime-commands:
  { "caption": "Word Wrap: Toggle", "command": "toggle_setting", "args": {"setting": "word_wrap"} },
  { "caption": "Convert Case: Upper Case", "command": "upper_case" },
  { "command": "toggle_comment", "args": {"block": false}, "caption": "Toggle Comment" },
```

becomes:

```ruby
  commands 'Default' do
    item 'Word Wrap: Toggle', toggle_setting("word_wrap")
    item 'Convert Case: Upper Case', upper_case
    item 'Toggle Comment', toggle_comment(block: false)
  end
```

Commands are transcribed as Ruby method invocations. If the first argument key is the same
as the last word of the command, it is not written: `toggle_setting(setting: "word_wrap")`
is transcribed as `toggle_setting("word_wrap")`. This is the case everywhere ST commands are
specified (mouse & key bindings, macros).

## Menus

Menus are specified in a `menu` block with the `item` method, that accepts an optional
block to define submenus:

```ruby
  menu 'Main' do
    item '&File', id: 'file' do
      item '&New File', new_file
      item '&Open File…', prompt_open_file, platform: '!OSX'
      item 'Open Folder…', prompt_open_folder, platform: '!OSX'
      item 'Open…', prompt_open, platform: 'OSX'
      item 'Open &Recent' do
        item 'Reopen Closed File', reopen_last_file
        item '-'
        0.upto(7) { |i| item open_recent_file(index: i) }
        item '-'
        0.upto(7) { |i| item open_recent_folder(index: i) }
        item '-'
        item 'Clear Items', clear_recent_files
      end
      ...
    end
  end
```

The `mnemonic` option can be specified, but is also obtained by prefixing
the letter by `&` in the caption (use `&&` to obtain the character `&`).

## Mouse Bindings

Mouse bindings use the `mousemap` method with a block:

```ruby
  mousemap 'Default (Windows)' do

    click 'button1', down: drag_select
    click 'ctrl+button1', down: drag_select(additive: true)
    click 'alt+button1', down: drag_select(subtractive: true)
    click 'shift+button1', down: drag_select(extend: true)
    click 'shift+ctrl+button1', down: drag_select(additive: true, extend: true)
    click 'shift+alt+button1', down: drag_select(subtractive: true, extend: true)
    click2 'button1', down: drag_select(by: "words")
    click2 'ctrl+button1', down: drag_select(by: "words", additive: true)
    click2 'alt+button1', down: drag_select(by: "words", subtractive: true)
    click3 'button1', down: drag_select(by: "lines")
    click3 'ctrl+button1', down: drag_select(by: "lines", additive: true)
    click3 'alt+button1', down: drag_select(by: "lines", subtractive: true)
    click 'shift+button2', down: drag_select(by: "columns")
    click 'shift+ctrl+button2', down: drag_select(by: "columns", additive: true)
    click 'shift+alt+button2', down: drag_select(by: "columns", subtractive: true)
    click 'button3', down: drag_select(by: "columns")
    click 'ctrl+button3', down: drag_select(by: "columns", additive: true)
    click 'alt+button3', down: drag_select(by: "columns", subtractive: true)
    click1 'button2+button1', down: drag_select, up: expand_selection(to: "line")
    click2 'button2+button1', up: expand_selection_to_paragraph
    click3 'button2+button1', up: select_all
    click 'button4', up: prev_view
    click 'button5', up: next_view
    click 'button2+scroll_down', up: next_view
    click 'button2+scroll_up', up: prev_view
    click 'ctrl+scroll_down', up: decrease_font_size
    click 'ctrl+scroll_up', up: increase_font_size
    click 'button2', up: context_menu

  end
```

The method `click` is for a single click (`click1` is also valid), while
`click2` is for a double-click and `click3` is for a triple-click. `press_command` is the
`down` option, `command` is the `up` option.

The buttons and modifiers can be renamed with `button_names`:

```ruby
  mousemap 'Default (Windows)' do

    button_names(
      'left'    => 'button1',
      'right'   => 'button2',
      'middle'  => 'button3',
      'back'    => 'button4',
      'forward' => 'button5',
      'down'    => 'scroll_down',
      'up'      => 'scroll_up',
      'win'     => 'super'
    )

    click 'left', down: drag_select
    click 'ctrl+left', down: drag_select(additive: true)
    click 'alt+left', down: drag_select(subtractive: true)
    click 'shift+left', down: drag_select(extend: true)
    click 'shift+ctrl+left', down: drag_select(additive: true, extend: true)
    click 'shift+alt+left', down: drag_select(subtractive: true, extend: true)
    click2 'left', down: drag_select(by: "words")
    click2 'ctrl+left', down: drag_select(by: "words", additive: true)
    click2 'alt+left', down: drag_select(by: "words", subtractive: true)
    click3 'left', down: drag_select(by: "lines")
    click3 'ctrl+left', down: drag_select(by: "lines", additive: true)
    click3 'alt+left', down: drag_select(by: "lines", subtractive: true)
    click 'shift+right', down: drag_select(by: "columns")
    click 'shift+ctrl+right', down: drag_select(by: "columns", additive: true)
    click 'shift+alt+right', down: drag_select(by: "columns", subtractive: true)
    click 'middle', down: drag_select(by: "columns")
    click 'ctrl+middle', down: drag_select(by: "columns", additive: true)
    click 'alt+middle', down: drag_select(by: "columns", subtractive: true)
    click1 'right+left', down: drag_select, up: expand_selection(to: "line")
    click2 'right+left', up: expand_selection_to_paragraph
    click3 'right+left', up: select_all
    click 'back', up: prev_view
    click 'forward', up: next_view
    click 'right+down', up: next_view
    click 'right+up', up: prev_view
    click 'ctrl+down', up: decrease_font_size
    click 'ctrl+up', up: increase_font_size
    click 'right', up: context_menu

  end
```

## Key Bindings

Key bindings are defined inside a `keymap` block. Each binding is specified
by the `bind` method, and the context by methods equivalent to `if`, `and`
and `or`. Because the latters are reserved in Ruby, `conditionals` gives
the method names used, which default to their French equivalent (`si`, `et`
and `ou`). You can also leave out `conditionals`, in which case you have to
use `_if`, `_and` and `_or`.

ST has three types of the context conditions:

- Just a key:
  ```json
  { "key": "auto_complete_visible" }
  ```
  becomes:
  ```ruby
  si auto_complete_visible
  ```

- A key and an operand.

  - If the operand is a string, it is rendered as "== symbol"
    ```json
    {"key": "panel", "operand": "find"}
    ```
    becomes:
    ```ruby
    si panel == :find
    ```

  - Otherwise, it is rendered with `is`:
    ```json
    { "key": "setting.auto_complete_commit_on_tab", "operand": false }
    ```
    becomes:
    ```ruby
    si setting.auto_complete_commit_on_tab is false
    ```

- A key, an operator and an operand: this is rendered as a Ruby condition, with
  the following operators:
  ```
    equal                ==
    not_equal            !=
    regex_contains       =~
    not_regex_contains   !~
    regex_match          .regex_match # comment
    not_regex_match      .not_regex_match # comment
  ```
  The comment is 'could use =~ (resp. !~) with \A and \z' (correct me if I'm wrong).

Example:

```ruby
  keymap 'Default (Windows)' do

    conditionals if: 'si', and: 'et', or: 'ou'

    bind 'esc', single_selection
      si num_selections != 1
    bind 'esc', clear_fields
      si has_next_field ## true
      ou has_prev_field ## true
    bind 'esc', hide_panel(cancel: true)
      si panel_visible ## true
    bind 'esc', hide_overlay
      si overlay_visible ## true
    bind 'esc', hide_auto_complete
      si auto_complete_visible ## true

    bind 'tab', insert_best_completion(default: "\t", exact: true)
    bind 'tab', insert_best_completion(default: "\t", exact: false)
      si setting.tab_completion ## true
    bind 'tab', replace_completion_with_next_completion
      si last_command ## "insert_best_completion"
      et setting.tab_completion ## true
    bind 'tab', reindent
      si setting.auto_indent ## true
      et all.selection_empty ## true
      et all.preceding_text =~ /\A\z/
      et all.following_text =~ /\A\z/
    bind 'tab', indent
      si text =~ /\n/
    bind 'tab', next_field
      si has_next_field ## true
    bind 'tab', commit_completion
      si auto_complete_visible
      et setting.auto_complete_commit_on_tab

    bind 'shift+tab', insert(characters: "\t")
    bind 'shift+tab', unindent
      si setting.shift_tab_unindent ## true
      ou preceding_text =~ /\A[\t ]*\z/
      ou text =~ /\n/
    bind 'shift+tab', prev_field
      si has_prev_field ## true

  end
```

## Keyboard Definitions

This feature is experimental. It allows translating keymaps between what you type and what ST sees.
For instance, when I type <kbd>ctrl+^</kbd> on my French keyboard on Windows, ST sees
<kbd>ctrl+]</kbd>. And when I type <kbd>ctrl+!</kbd>, it sees... nothing!

So unless your keyboard matches the Sublime Text one, you can describe your keyboard in
a keyboard definition file `*.keyboard.rb`, and specify it when importing the package:
this will convert the key bindings for your keyboard, adding an instruction
`keyboard '(name)'` inside the keymap block of key bindings. There will be a FIXME
comment when the keystroke is not available for your keyboard:

```ruby
# FIXME: no equivalent for keystroke: ctrl+break
# bind 'ctrl+break', exec(kill: true)
```

The key bindings will be converted back to ST key names when exporting.

This works well on Windows, but so-so (if at all, I don't remember well) on my Mac with
French keyboard. Not tested on Linux.

To understand the instructions below, look at a French keyboard (from France).

```ruby
  keyboard 'AZERTY-fr-FR-v6 (Windows 7)' do

    os 'Windows'

    # modifiers
    # they will be displayed in the order given here

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

    # strange combinations generating character events

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
```

## Macros

Macros are rendered by `macro` blocks, like this:

```ruby
  macro "Add Line" do
    move_to "hardeol"
    insert characters: "\n"
  end

  macro "Add Line Before" do
    move_to "hardbol"
    insert characters: "\n"
    move by: "lines", forward: false
    reindent force_indent: false
  end

  macro "Add Line in Braces" do
    insert characters: "\n\n"
    move by: "lines", forward: false
    move_to "hardeol", extend: false
    reindent single_line: true
  end
```

## Settings

Settings are rendered as `settings` blocks:

```ruby
  settings 'Preferences' do

    color_scheme 'Packages/Color Scheme - Default/Monokai.tmTheme'
    font_size 10
    font_options []
    word_separators './\()"\'-:,.;<>~!@#$%^&*|+=[]{}`~?'
    line_numbers true
    ...
    auto_complete_triggers [{"selector"=>"text.html", "characters"=>"<"}]
    ...
    scroll_speed 1.0
    folder_exclude_patterns %w(.svn .git .hg CVS)
    ...

  end
```

## Themes

Themes are `theme` blocks. Here is my own coloring theme:

```ruby
  theme 'Spartan' do

    # I dont't like code looking like a Christmas tree.
    # Initially, it was Mac Classic by Chris Thomas.

    author 'Thierry Lambert'
    uuid '85C02434-2B86-488A-A8F2-E7A9A53385C5'

    white = '#FFFFFF'
    black = '#000000'
    brown = '#804000'
    navy  = '#0000A0'  # a bit brighter than 'official' navy
    blue  = '#0000FF'
    red   = '#FF0000'
    green = '#008000'

    gray = '#666666'
    light_gray = '#888888'
    pale_gray = '#BFBFBF'
    blue_gray = '#365F91'

    very_transparent_gray = '#D0D0D040'
    more_transparent_gray = '#80808020'
    transparent_gray      = '#80808030'
    less_transparent_gray = '#80808050'

    turquoise_green = '#009070'

    pale_red = '#FFD0D0'

    base_colors \
      background: white,
      foreground: black,
      caret: black,
      invisibles: pale_gray,
      line_highlight: transparent_gray,
      selection: transparent_gray,
      selection_border: less_transparent_gray,
      inactive_selection: more_transparent_gray

    item 'Marks', 'mark, bookmark', red

    item 'Comment', 'comment', green

    item 'String', 'string', brown
    item 'Unquoted String', 'string.unquoted', back: very_transparent_gray
    # item 'Regular Expression', 'string.regexp', brown
    item 'Ruby Symbol', 'constant.other.symbol', brown
    item 'Number', 'constant.numeric', brown
    item 'Character Escape', 'constant.character.escape', brown, bold
    item 'Markup: Character Entity', 'constant.character.entity, constant.character.parameter-entity', brown

    item 'Keyword', 'keyword.control, keyword.other, storage', blue
    item 'Language Constant', 'constant.language', blue
    item 'Language Variable', 'variable.language', blue

    item 'Library Constant', 'support.constant', navy
    item 'Operator', 'keyword.operator', navy
    item 'Other Keyword: Unit', 'keyword.other.unit, keyword.other.ini', navy

    item 'Source in String', 'string source', bold
    item 'Embedded Source', 'text source', back: '#D0D0A020' # looks bluish otherwise

    item 'Type Name', 'entity.name.type', bold
    # item 'Inherited Type Name', 'entity.other.inherited-class'
    # item 'Type Reference', 'support.class'

    item 'Function Name', 'entity.name.function, support.function.any-method', bold
    item 'Library Function', 'support.function', navy

    item 'Marked Variable', 'variable.other.readwrite, variable.other.macro', navy
    # item 'Parameter Variable', 'variable.parameter'

    item 'Property Name', 'support.type, support.constant.tm-grammar', navy
    item 'Section Name', 'entity.name.section', bold

    item 'Preprocessor Line', 'meta.preprocessor', turquoise_green
    item 'Preprocessor Directive', 'keyword.control.import', turquoise_green, bold

    item 'Deprecated', 'invalid.deprecated', red
    item 'Deprecated Trailing Whitespace', 'invalid.deprecated.trailing-whitespace', back: pale_red
    item 'Illegal', 'invalid.illegal', red

    # XML, HTML, CSS
    item 'ML DOCTYPE', <<-SCOPE, gray
      meta.tag.sgml.doctype, meta.tag.sgml.doctype entity, meta.tag.sgml.doctype string,
      meta.tag.preprocessor.xml, meta.tag.preprocessor.xml entity, meta.tag.preprocessor.xml string
    SCOPE
    item 'ML Tag Characters', 'meta.tag, declaration.tag', navy
    item 'ML Tag Name', 'entity.name.tag', navy
    item 'ML Attribute Name', 'entity.other.attribute-name', navy
    item 'CSS Selectors', 'source.css entity.name.tag, source.css entity.other.attribute-name', blue

    # Markdown, Textile, etc.
    item 'Markup: Heading Characters', 'markup.heading', bold
    # item 'Markup: List', 'markup.list'
    # item 'Markup: Quote', 'markup.quote'
    item 'Markup: Raw', 'markup.raw', back: very_transparent_gray
    item 'Markup: Bold', 'markup.bold', bold
    item 'Markup: Italic', 'markup.italic', italic
    item 'Markup: Underline', 'markup.underline', underline
    # item 'Markup: Deleted', 'markup.deleted'
    # item 'Markup: Inserted', 'markup.inserted'

    # Subtitles
    item 'Markup: Number', 'markup.number', pale_gray
    item 'Markup: Timing', 'markup.timing', light_gray
    item 'Markup: Timing Arrow', 'markup.punctuation', light_gray

  end
```

## Preferences

Preferences are specified in `preferences` blocks with a name and a scope:

```ruby
preferences 'Indentation Rules - Comments' => 'comment' do
  preserve_indent true
end

preferences 'Indentation Rules' => 'source' do
  decrease_indent_pattern %r'^(.*\*/)?\s*\}[;\s]*$'
  increase_indent_pattern %r/^.*(\{[^}"']*)$/
  disable_indent_next_line_pattern %r/^\s*\{[\]})]*\s*$/
  indent_parens true
end

preferences 'Symbol List' => 'entity.name.function, entity.name.type, meta.toc-list' do
  show_in_symbol_list true
  uuid "0A0DA1FC-59DE-4FD9-9A2C-63C6811A3C39"
end
```

## Snippets

Snippets are defined in `snippets` blocks.

```ruby
snippets do
  # definition statements
end
```

### Definition statements:

- `default_scope 'scope'`

  Sets the default scope for the following definitions.

- `file_format <format>`

  Defines the file format for the following definitions.
  Valid formats are `:textmate` and `:sublime_text`.
  The default is `:sublime_text`.

- `tab 'tab trigger', 'description', 'content' [, options]`

  Defines a snippet inserted by pressing <kbd>tab</kbd> after the
  text given by `'tab trigger'`.

- `key 'key equivalent', 'description', 'content' [, options]`

  Defines a snippet inserted by pressing the keystroke
  `'key equivalent'` (TextMate only)

### Options for 'tab' and 'key':

- `scope: 'scopes'`  (the default is given by default_scope)

- `file: 'base_file_name'`  (the default is the description)

### Options for TextMate only:

- `key_equivalent: 'key equivalent'`  (for 'tab')

- `tab_trigger: 'tab trigger'`  (for 'key')

- `semantic_class: 'semantic class scope'`

- `uuid: 'uuid'`

- `bundle_uuid: 'bundle uuid'`
