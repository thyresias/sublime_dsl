# encoding: utf-8

preferences 'Comments' => 'source.ruby' do
  shell_variable 'TM_COMMENT_START', '# '
  shell_variable 'TM_COMMENT_START_2', "=begin\n"
  shell_variable 'TM_COMMENT_END_2', "=end\n"
  uuid '1D26F26C-C6F7-434F-84F8-FEE895372E8A'
end

# preferences 'Completion Rules' => 'source.ruby' do
#   cancel_completion %r/^\s*(else|end|do|begin|rescue|(class|def|module|include)\s*[a-zA-Z_0-9]+)$/
# end

preferences 'Indent' => 'source.ruby' do
  decrease_indent_pattern %r/^\s*([}\]]\s*$|(end|rescue|ensure|else|elsif|when)\b)/
  increase_indent_pattern %r:(?x)^
    (\s*
      ( module|class|def|unless|if|else|elsif
      | case|when|begin|rescue|ensure|for|while|until
      | (?= .*? \b(do|begin|case|if|unless)\b)
        # the look-ahead above is to quickly discard non-candidates
        # below, *+ is 'possessive' - greedy and does not backtrack after repeated
        ( "(\\.|[^\\"])*+"  # eat a double quoted string
        | '(\\.|[^\\'])*+'  # eat a single quoted string
        | [^#"']            # eat all but comments and strings
        )*
        ( \s (do|begin|case)
        | [-+=&|*/~%^<>](?<!\$.) \s*+ (if|unless)
        )
      )\b
      (?! [^;]*+ ; .*? \bend\b )
      |
      ( "(\\.|[^\\"])*+"  # eat a double quoted string
      | '(\\.|[^\\'])*+'  # eat a single quoted string
      | [^#"']            # eat all but comments and strings
      )*
      ( \{ (?!  [^}]*+ \} )
      | \[ (?! [^\]]*+ \] )
      )
    ).*$:
  uuid '6FEAF60F-F0F3-4618-9259-DE93285F50D1'
end

preferences 'Symbol List: Method' => 'source.ruby meta.function' do
  show_in_symbol_list true
  symbol_transformation 's/^\s*def\s+//'
  uuid '92E190C9-A861-4025-92D4-D6B5A24C22D4'
end

preferences 'Symbol List: No Function Call' => 'source.ruby meta.function-call entity.name.function' do
  show_in_symbol_list false
  uuid 'A5D50494-EB97-48DE-A2BE-322DF52A7A7A'
end
