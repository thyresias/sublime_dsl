# encoding: utf-8

preferences 'Comments' => 'source.scala' do
  shell_variable 'TM_COMMENT_START', '// '
  shell_variable 'TM_COMMENT_START_2', '/*'
  shell_variable 'TM_COMMENT_END_2', '*/'
  uuid "99FB23BA-DD49-447F-9F1A-FF07630CB940"
end

preferences 'Symbol List' => 'entity.name.function.declaration, entity.name.class.declaration, entity.name.val.declaration, entity.name.type.declaration', file: 'Symbols' do
  show_in_symbol_list true
  uuid "31262BFB-520A-4253-A81C-60023C0CFC8B"
end
