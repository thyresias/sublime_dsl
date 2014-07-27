# encoding: utf-8

preferences 'Folding' => 'text.html.wikidot' do
  folding_indented_block_ignore %r/^(?!\++\s+)/
  folding_indented_block_start %r/^\++\s+/
  folding_start_marker %r'(<(php|html|file|nowiki)>|<code(\s*.*)?>)|/\*\*|\{\s*$|\[!--'
  folding_stop_marker %r'(</(code|php|html|file|nowiki)>)|\*\*/|^\s*\}|--\]'
  uuid "35F95440-2A63-4C98-B833-E82203F0E6C2"
end

preferences 'shellVariables' => 'text.html.wikidot' do
  shell_variable 'TM_COMMENT_START', '[!--'
  shell_variable 'TM_COMMENT_END', ' --]'
  shell_variable 'TM_COMMENT_MODE', 'line'
  shell_variable 'TM_COMMENT_START_1', '[!-- '
  shell_variable 'TM_COMMENT_END_1', ' --]'
  shell_variable 'TM_COMMENT_DISABLE_INDENT', 'yes'
  shell_variable 'TM_BOLD_MARKER', '**'
  shell_variable 'TM_ITALIC_MARKER', '//'
  shell_variable 'TM_UNDERLINED_MARKER', '__'
  uuid "131ADA9B-2794-4437-902A-75F29492E15F"
end

preferences 'Symbol List: Heading' => 'text.html.wikidot markup.heading.', file: 'Show Heading in list' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/\s*$//;				# strip trailing space
    s/(?<=\+)\+/ /g;			# use lookbehind to change all but first + to space
    s/^(\+)( *)\s?(.*)/ $2$3/;		# make the first + a space
  TXT
  uuid "1C4FB26E-519A-445B-AA1B-E6FCD672C216"
end

preferences 'Typing Pairs (outside heading)' => 'text.html.wikidot meta, text.html.wikidot markup - markup.heading.wikidot' do
  smart_typing_pairs "\"\" () {} [] “”"
  uuid "2E355586-74BC-4CE2-B206-CC84FE637B20"
end

preferences 'Typing Pairs' => 'text.html.wikidot' do
  smart_typing_pairs "\"\" () {} [] “”"
  uuid "96D31DC9-5707-4F5B-8FC1-59FA48468EEF"
end
