# encoding: utf-8

preferences 'Comments' => 'source.eiffel' do
  shell_variable 'TM_COMMENT_START', '-- '
  uuid "9D16332B-96F7-4631-92CD-B981ABC180E9"
end

preferences 'Folding' => 'source.eiffel' do
  folding_start_marker %r/(class|once|do|external)/
  folding_stop_marker %r/(ensure|end)/
  uuid "F936F258-2ACE-40CA-B84D-47BC1B48D289"
end

preferences 'Indentation' => 'source.eiffel', file: 'indentation' do
  decrease_indent_pattern %r/^\s*(index|class|inherit|end|else|elseif|when|require|ensure|invariant|rescue|export|undefine|redefine|select|variant|until|loop)/
  increase_indent_pattern %r/^\s*(index|class|inherit|do|if\s.*\sthen|else|elseif\s.*\sthen|inspect|when\s.*\sthen|require|ensure|invariant|rescue|check|debug|rename|export|undefine|redefine|select|local|from|variant|until|loop)\s*$/
  uuid "F2662AB4-3EF8-4282-A485-7138F1486B8E"
end

preferences 'Typing pairs' => 'source.eiffel' do
  highlight_pairs "\"\" <> ()"
  smart_typing_pairs "\"\" <> ()"
  uuid "4579A9BF-CBE7-4863-A60F-7838F33EFC56"
end
