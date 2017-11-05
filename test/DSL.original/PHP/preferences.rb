# encoding: utf-8

preferences 'Comments' => 'source.php' do
  shell_variable 'TM_COMMENT_START', '// '
  shell_variable 'TM_COMMENT_START_2', '# '
  shell_variable 'TM_COMMENT_START_3', '/*'
  shell_variable 'TM_COMMENT_END_3', '*/'
  uuid "06276449-AA4E-424F-A2B6-9F4138416E50"
end

preferences 'Completion Rules' => 'source.php' do
  # FIXME: (warning) nested repeat operator '+' and '*' was replaced with '*' in regular expression
  cancel_completion %r/^\s*(\}?\s*(else|do|try)|(class|function)\s*[a-zA-Z_0-9]+*)$/
end

preferences 'Indentation Rules Annex' => 'source.php' do
  un_indented_line_pattern %r'^\s*((\*/|#|//| \*).*)?$'
end

preferences 'Indentation Rules' => 'source.php - comment' do
  decrease_indent_pattern %r'(?x) ^ (.*\*/)? \s* \} .* $|<\?(php)?\s+(else(if)?|end(if|for(each)?|while))'
  indent_next_line_pattern %r'^(?!.*(#|//|\*/|<\?))(?!.*[};:]\s*(//|/\*.*\*/\s*$)).*[^\s;:{}]\s*$|<\?php.+?\b(if|else(?:if)?|for(?:each)?|while)\b.*:(?!.*end\1)'
  bracket_indent_next_line_pattern %r/(?x)
    ^ \s* \b(if|while|else|elseif|foreach)\b [^;]* $
    | ^ \s* \b(for)\b .* $
    /
  uuid "CA15DF69-E80D-46DA-BD45-E88C68E92117"
end

preferences 'Symbols List: Indent Functions' => 'entity.name.function.php, support.function.magic.php', file: 'Symbol List' do
  show_in_symbol_list true
  uuid "5157F71C-2801-4385-92EA-3D0B72AEE7C5"
end
