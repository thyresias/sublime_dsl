# encoding: utf-8

preferences 'Comments' => 'source.go' do
  shell_variable 'TM_COMMENT_START', '// '
  shell_variable 'TM_COMMENT_START_2', '/*'
  shell_variable 'TM_COMMENT_END_2', '*/'
  shell_variable 'TM_COMMENT_DISABLE_INDENT_2', 'yes'
  uuid "05400837-EE8F-44D1-A636-3EEB0E82FFF5"
end

preferences 'Indentation Rules' => 'source.go' do
  decrease_indent_pattern %r/(?x)
      ^                            # start of line
          (.*\*\/)?                 # skip comments if present
             (          # three possibilities
             \s* \}                # whitespace and a closing curly brace
             (                     # capture:
               [^}{"']* \{        # anything other than curly braces or quotes, then open curly
             )?                    # (optional)
             [;\s]*?               # any whitespace or semicolons
           |
                (?:\s* (case|default).*:)  # case statements pop back one indent
              |
                (?: \) (?<! \( ) )    # closing braces not preceded by opening braces
             )
          (\/\/.*|\/\*.*\*\/\s*)?      # skip any comments (optional)
      $                            # end of line
  /
  increase_indent_pattern %r!(?x)
      ^ 
          (?: .* \*/ )?        # skip any comments
          (?:
           (.* \{ [^}"'\n]*)    # lines containing an open curly but no quotes or close curly
           |            # OR
           (?:\s* (case|default).*:)  # case statements
           |            # OR
           (.* \( [^)"'\n]*)    # lines containing an open brace but no quotes or close brace
          )
       (//.*|/\*.*\*/\s*)?    # skip any comments (optional)
         $
  !
  un_indented_line_pattern %r'^\s*((/\*|\*/|//|import\b.*|package\b.*).*)?$'
  uuid "160118A4-208D-4422-AFF0-0C21B5B78AAF"
end
