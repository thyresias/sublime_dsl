# encoding: utf-8

preferences 'Comments' => 'source.dylan' do
  shell_variable 'TM_COMMENT_START', '// '
  shell_variable 'TM_COMMENT_START_2', '/*'
  shell_variable 'TM_COMMENT_END_2', '*/'
  shell_variable 'TM_COMMENT_DISABLE_INDENT_2', 'yes'
  uuid "00E061FF-71A0-4E4E-9F66-30678B2144FA"
end

preferences 'Folding' => 'source.dylan' do
  # FIXME: (warning) character class has duplicated range
  folding_start_marker %r:(?x)^
    (\s*+
    (define |unless|if
    |case|select
    |local method|method
    |for|while|until
    |block
    |(  "(\\.|[^"])*+"                # eat a double quoted string
    | '(\\.|[^'])*+'               # eat a single quoted string
    |   [^#"']                       # eat all but comments and strings
    )*
    (                 \s   (do|begin|case)
    | [-+=&|*/~%^<>~] \s*+ (if|unless)
    )
    )\b
    (?! [^;]*+ ; .*? \bend\b )
    |(  "(\\.|[^"])*+"                  # eat a double quoted string
    | '(\\.|[^'])*+'                 # eat a single quoted string
    |   [^#"']                         # eat all but comments and strings
    )*
    ( \{ (?!  [^}]*+ \} )
    | \[ (?! [^\]]*+ \] )
    )
    ).*$
    |   [\/\/] .*? \(fold\) \s*+ $           # Sune’s special marker
    |    ^\s*\/\/\s*\#region
    :
  # FIXME: (warning) character class has duplicated range
  folding_stop_marker %r'(?x)
    (   ^\s*+end.*$
    |   [\/\/] .*? \(end\) \s*+ $        # Sune’s special marker
    |   ^\s*\/\/\s*\#endregion
    )'
  uuid "C5AB932B-1BCB-43FC-A22F-1C8AF9A67FA5"
end

preferences 'Spell Checking: Enable for comments' => 'comment.block.dylan, comment.line.double-slash.dylan' do
  spell_checking true
  uuid "25234BEA-1E99-4692-9DDA-00AE8F92AE3C"
end

preferences 'Symbol List: Definitions' => 'source.dylan entity.name.other' do
  show_in_symbol_list true
  uuid "0B637B57-866E-4C0E-A105-9CD94AE90C97"
end
