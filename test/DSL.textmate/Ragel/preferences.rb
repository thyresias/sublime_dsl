# encoding: utf-8

preferences 'Comments' => 'source.ragel' do
  shell_variable 'TM_COMMENT_START', '# '
  uuid "FB00D5C4-5BA7-4C55-BDE5-5E9EC1889A9E"
end

preferences 'Folding' => 'source.c.ragel' do
  folding_start_marker %r'(?x)
     /\*\*(?!\*)
    |^(?![^{]*?//|[^{]*?/\*(?!.*?\*/.*?\{)).*?\{\s*($|//|/\*(?!.*?\*/.*\S))
    '
  folding_stop_marker %r'(?<!\*)\*\*/|^\s*\}'
  uuid "212C9E00-6E78-4EC3-808C-7E7A52E75BC3"
end
