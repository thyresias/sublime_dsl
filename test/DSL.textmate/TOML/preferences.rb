# encoding: utf-8

preferences 'Comments' => 'source.toml' do
  shell_variable 'TM_COMMENT_START', '# '
  uuid "57E002AF-9FB0-4EEF-A7E9-D966AF048D2C"
end

preferences 'Folding' => 'source.toml' do
  folding_indented_block_ignore %r/^(?!\s*\[[^\[\]]*\])/
  folding_indented_block_start %r/^\s*\[[^\[\]]*\]/
  uuid "EF7208F3-37FE-48A7-A399-483A053AC519"
end

preferences 'Indent' => 'source.toml' do
  decrease_indent_pattern %r/^\s*[\]]/
  disable_indent_corrections "1"
  increase_indent_pattern %r/\[\s*(#.*)?$/
  indent_on_paste "simple"
  uuid "D71CCB5E-824F-4CCC-9C95-E380ABEBAD59"
end

preferences 'Symbol List' => 'meta.group.toml' do
  show_in_symbol_list true
  symbol_transformation 's/\[|\]//g;'
  uuid "73D9E9DB-B037-4FEB-BB0C-99F5C55454C2"
end

preferences 'Typing Pairs' => 'source.toml' do
  smart_typing_pairs "\"\" []"
  uuid "11D23FEA-93F7-40C9-A996-EF6CF370D090"
end
