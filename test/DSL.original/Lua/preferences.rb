# encoding: utf-8

preferences 'Comments' => 'source.lua' do
  shell_variable 'TM_COMMENT_START', '-- '
  uuid "8A2A2BE0-B474-49B4-85C3-BAF2BD2FCAFB"
end

preferences 'Indent' => 'source.lua' do
  decrease_indent_pattern %r/^\s*(elseif|else|end|\})\s*$/
  increase_indent_pattern %r/^\s*(else|elseif|for|(local\s+)?function|if|repeat|until|while)\b((?!end).)*$|\{\s*$/
  uuid "411468A8-E0AC-415A-9E71-E2BD091EB571"
end
