# encoding: utf-8

preferences 'Disable Indention Correction' => 'source.python' do
  disable_indent_corrections "1"
  indent_on_paste "simple"
  uuid "5B3272DB-6253-4E35-8763-99B01EDF9B46"
end

preferences 'Folding Patterns' => 'source.python' do
  folding_indented_block_start %r/^\s*(class|def|for|while|if|elif|else|with|try|finally|except)\b.*:\s*(#.*)?$/
  uuid "4A5DB35F-D647-4357-9D9B-57313710B95B"
end

preferences 'Folding' => 'source.python' do
  folding_start_marker %r/^\s*"""(?=.)(?!.*""")/
  folding_stop_marker %r/^\s*"""\s*$/
  uuid "7FD3FA0D-A907-4142-9A64-70A5DA366AA4"
end

preferences 'Miscellaneous' => 'source.python' do
  decrease_indent_pattern %r/^\s*(elif|else|except|finally)\b.*:|^\s*\}/
  increase_indent_pattern %r/^\s*(class|def|elif|else|except|finally|for|if|try|with|while)\b.*:\s*$|\{\s*$/
  shell_variable 'TM_COMMENT_START', '# '
  shell_variable 'TM_LINE_TERMINATOR', ':'
  uuid "33877934-69D3-4773-8786-9B5211012A9A"
end

preferences 'Symbol List' => 'source.python meta.function.python, source.python meta.class.python' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/class\s+([A-Za-z_][A-Za-z0-9_]*.+?\)?)(\:|$)/$1/g;
    s/def\s+([A-Za-z_][A-Za-z0-9_]*\()(?:(.{,40}?\))|((.{40}).+?\)))(\:)/$1(?2:$2)(?3:$4…\))/g;
  TXT
  uuid "005BE156-8D74-4036-AF38-283708645115"
end

preferences 'Symbol List: Hide Decorator' => 'source.python meta.function.decorator.python entity.name.function.decorator.python' do
  show_in_symbol_list false
  uuid "F5CE4B1B-6167-4693-A49B-021D97C18F5A"
end

preferences 'Typing Pairs: Inside Strings' => 'source.python string.quoted.*.block - punctuation.definition.string.begin' do
  smart_typing_pairs "() {} [] “” ‘’ ``"
  uuid "DAD21D74-340F-43AC-9108-335BBA216A8B"
end
