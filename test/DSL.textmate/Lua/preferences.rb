# encoding: utf-8

preferences 'Comments' => 'source.lua' do
  shell_variable 'TM_COMMENT_START', '-- '
  uuid "8A2A2BE0-B474-49B4-85C3-BAF2BD2FCAFB"
end

preferences 'Folding' => 'source.lua' do
  folding_start_marker %r/\b(function|local\s+function|then|do|repeat)\b|{[ \t]*$|\[\[/
  folding_stop_marker %r/\bend\b|^\s*}|\]\]/
  uuid "CE28318D-3498-47D5-86DA-B79D8C8AC2EB"
end

preferences 'Indent' => 'source.lua' do
  decrease_indent_pattern %r/^\s*(elseif|else|end|\})\s*$/
  increase_indent_pattern %r/\b(else|elseif|(local\s+)?function|then|do|repeat)\b((?!end).)*$|\{\s*$/
  uuid "411468A8-E0AC-415A-9E71-E2BD091EB571"
end
