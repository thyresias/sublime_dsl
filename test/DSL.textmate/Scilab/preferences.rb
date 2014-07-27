# encoding: utf-8

preferences 'Comments' => 'source.scilab' do
  shell_variable 'TM_COMMENT_START', '// '
  uuid "334A45F4-210A-48E2-A539-2576F882C4FE"
end

preferences 'Folding' => 'source.scilab' do
  folding_start_marker %r'^(?!.*//.*).*\b(if|while|for|function|select)\b'
  folding_stop_marker %r/\b(endfunction|end)\b/
  uuid "5EEBDA68-3032-4935-8880-BB22A9E07240"
end
