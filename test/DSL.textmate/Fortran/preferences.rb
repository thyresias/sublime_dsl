# encoding: utf-8

preferences 'Comments - Punchcard' => 'source.fortran', file: 'Comment (fortran)' do
  shell_variable 'TM_COMMENT_START', 'C '
  shell_variable 'TM_COMMENT_END', ''
  shell_variable 'TM_COMMENT_MODE', 'line'
  shell_variable 'TM_COMMENT_DISABLE_INDENT', 'yes'
  shell_variable 'TM_COMMENT_START_2', 'c '
  uuid "00465FB7-057F-4E7E-AFAC-B059DB0C03CF"
end

preferences 'Comments - Modern' => 'source.fortran.modern' do
  shell_variable 'TM_COMMENT_MODE', 'line'
  shell_variable 'TM_COMMENT_START', '! '
  shell_variable 'TM_COMMENT_END', ''
  shell_variable 'TM_COMMENT_START_2', '* '
  shell_variable 'TM_COMMENT_DISABLE_INDENT', 'yes'
  uuid "3F504D8D-A4FA-4CB9-9469-FAE360409C1E"
end

preferences 'Completion: Interface' => 'source.fortran meta.function.interface' do
  completions %w(
    module procedure operator assignment(=)
  )
  disable_default_completion false
  uuid "661D40B0-ABA8-4F53-93B8-9A3C96B74B58"
end

preferences 'Completion: Specification Attributes' => 'source.fortran meta.specification' do
  completions %w(
    parameter dimension() allocatable intent()
  )
  disable_default_completion true
  uuid "A5DF069E-A2A5-463A-A8A9-302A02B13DBC"
end

preferences 'Folding' => 'source.fortran' do
  folding_start_marker %r/(?x:              # extended mode
    ^\s*                      # start of line and some space
    (?i:                      # case insensitive match
      (
        if.*then                # if ... then
        |for|do|select\s+case|where|interface  # some easy keywords
        |module(?!\s*procedure)          # module not followed by procedure
        |type(?!\s*\()              # type but not type(
      )
      |                      # ...or...
      (
        [a-z]*(?<!end)\s*(function|subroutine)  # possibly some letters, but not the word end, and a space, then function
      )
    )
    .*$                        # anything until the end of the line
  )/
  folding_stop_marker %r/(?x:  # extended mode
    ^\s*          # start of line and some space
    (?i:(end))        # the word end, case insensitive
    .*$            # anything until the end of the line
  )/
  uuid "1BCD42C7-0623-4EE5-A68F-A7A78E02BC53"
end

preferences 'Completion: Include Strings' => 'source.fortran meta.preprocessor.include string', file: 'Include Completion' do
  completion_command 'find "$TM_DIRECTORY" -name "$TM_CURRENT_WORD*.h" -maxdepth 2 -exec basename "{}" \;|sort'
  disable_default_completion true
  uuid "77FE8E31-891F-498D-990B-1B3AF6986DB6"
end

preferences 'Indentation Rules' => 'source.fortran' do
  decrease_indent_pattern %r/(?i)^\s*(end(if)?\b|(contains|else)\s*$)/
  increase_indent_pattern %r/(?ix)
        ^\s*
        (
            (((integer\s+)?recursive|(recursive\s+)?integer)\s+)?function\b
          | ((if.*then)|for|do|else|elseif|program|where|type|module|program|subroutine|interface)\b
          | (contains|else)\s*$
        )/
  un_indented_line_pattern %r/^\s*[cC]\s+.*$/
  uuid "DF8B5C60-9DCD-4180-8FE0-6CEA5050EFE7"
end

preferences 'Spell Checking: Off for Include Strings' => 'source.fortran meta.preprocessor.include string', file: 'Spell Checking˸ Disable for Include Strings' do
  spell_checking false
  uuid "3A48C5DB-0AB8-42FD-8F99-84C30C155168"
end

preferences 'Symbol List: Add Custom Marks' => 'comment.line.exclamation.mark.fortran.modern' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/\!-//;
    s/\-/   /g;
  TXT
  uuid "A64DE2EC-3A2E-40E4-A26D-F53046DA8D42"
end

preferences 'Symbol List: Exclude Ends ' => 'source.fortran entity.name.function.end, source.fortran entity.name.type.end', file: 'Symbol List˸ Exclude Ends' do
  show_in_symbol_list false
  uuid "D3D60488-4BDD-468A-B1F4-19CC198D419A"
end

preferences 'Typing Pairs: Include Statements' => 'source.fortran meta.preprocessor.include' do
  highlight_pairs "\"\" ''"
  smart_typing_pairs "\"\" ''"
  uuid "98C10307-DA03-4243-A9BC-BE4C6708E5F5"
end
