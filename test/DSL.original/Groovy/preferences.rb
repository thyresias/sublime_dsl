# encoding: utf-8

preferences 'Symbol List: Class Variables' => 'source.groovy meta.definition.class meta.definition.class-variable.name', file: 'Symbol List%3A Class Variables' do
  show_in_symbol_list true
  symbol_transformation "s/.+/  $0/g"
  uuid "AAC3FB7F-5428-4B6A-B43E-62E4C6677E1F"
end

preferences 'Symbol List: Classes' => 'source.groovy entity.name.type.class', file: 'Symbol List%3A Classes' do
  show_in_symbol_list true
  uuid "6201F313-C9FB-4D7E-9D01-FB85287BE21C"
end

preferences 'Symbol List: Methods' => 'source.groovy meta.definition.method.signature', file: 'Symbol List%3A Methods' do
  show_in_symbol_list true
  symbol_transformation 's/\s*.*\s+(\w+)\s*(\(.*\)).*/    $1$2/g'
  uuid "6AF1B177-1700-478F-808B-78D85403FC19"
end

preferences 'Symbol List: Variables' => 'source.groovy meta.definition.class-variable.name', file: 'Symbol List%3A Variables' do
  show_in_symbol_list true
  symbol_transformation "s/.+/$0/g"
  uuid "CF622434-558B-4333-8B57-76576354D6DC"
end
