# encoding: utf-8

preferences 'Folding (M)' => 'source.matlab', file: 'Folding - M' do
  folding_start_marker %r/^\s*(function|if|switch|while|for|parfor|try)\b(?!.*\bend\b).*$/
  folding_stop_marker %r/^\s*(end|return)\b.*$/
  uuid "75D71264-922A-440B-A0DC-CC865C2DC1D3"
end

preferences 'Folding (Octave)' => 'source.octave', file: 'Folding - Octave' do
  folding_start_marker %r/^\s*(function|if|switch|while|for|parfor|try)\b(?!.*\b(end|endfunction|endif|endswitch|endwhile|endfor|endparfor|endtry)\b).*$/
  folding_stop_marker %r/^\s*(end|return|endfunction|endif|endswitch|endwhile|endfor|endparfor|endtry)\b.*$/
  uuid "D861F822-4411-4330-8E9E-E9FCCF9C7449"
end

preferences 'Miscellaneous Matlab' => 'source.matlab', file: 'Indent' do
  decrease_indent_pattern %r/^\s*\b(end\w*|catch|else|elseif|case|otherwise)\b/
  highlight_pairs "() [] {} \"\""
  increase_indent_pattern %r/(?x)^\s*
    \b(
       function
       |if|else|elseif
       |switch|case|otherwise
       |for|parfor|while
       |try|catch
       |unwind_protect
  )\b/
  shell_variable 'TM_CLOSE_FUNCTIONS', '1'
  shell_variable 'TM_COMMENT_START', '% '
  shell_variable 'TM_USE_OCTAVE', '0'
  smart_typing_pairs "() [] {} \"\" ''"
  uuid "2CD1353B-AEC7-4BBF-8061-6038D1E93FA8"
end

preferences 'Miscellaneous Octave' => 'source.octave' do
  decrease_indent_pattern %r/^\s*(catch|else|elseif|end|endfunction|endif|endswitch|endwhile|endfor|endparfor|endtry)\b/
  highlight_pairs "() [] {} \"\""
  increase_indent_pattern %r/^\s*(catch|else|elseif|for|parfor|function|if|switch|while|try).*/
  shell_variable 'TM_USE_OCTAVE', '1'
  shell_variable 'TM_CLOSE_FUNCTIONS', '1'
  shell_variable 'TM_COMMENT_START', '% '
  shell_variable 'TM_COMMENT_START_2', '# '
  shell_variable 'TM_COMMENT_START_3', '%{'
  shell_variable 'TM_COMMENT_END_3', '%}'
  shell_variable 'TM_COMMENT_START_4', '#{'
  shell_variable 'TM_COMMENT_END_4', '#}'
  smart_typing_pairs "() [] {}"
  uuid "DCAA0C20-AF0B-4E64-A947-43DA07B901A4"
end

preferences 'Symbol List: Cells' => 'meta.cell.matlab' do
  show_in_symbol_list true
  symbol_transformation 's/=+\s*//'
  uuid "219A59CC-83FE-484F-B1C8-2F6357056F2F"
end

preferences 'Symbol List: Functions' => 'source.matlab meta.function.with-arguments, source.matlab meta.function.without-arguments', file: 'Symbols' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/^\s*function\s+//;
    s/(?>.*=)\s*//; # remove output args
  TXT
  uuid "5EC2B9C8-1311-4C27-A421-A7982E6418AA"
end
