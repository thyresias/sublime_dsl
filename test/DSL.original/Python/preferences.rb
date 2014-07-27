# encoding: utf-8

preferences 'Completion Rules' => 'source.python' do
  cancel_completion %r/^(.*\b(and|or)$)|(\s*(pass|return|and|or|(class|def|import)\s*[a-zA-Z_0-9]+)$)/
end

preferences 'Miscellaneous' => 'source.python' do
  decrease_indent_pattern %r/^\s*(elif|else|except|finally)\b.*:/
  increase_indent_pattern %r/^\s*(class|def|elif|else|except|finally|for|if|try|with|while)\b.*:\s*$/
  disable_indent_next_line_pattern %r//
  shell_variable 'TM_COMMENT_START', '# '
  shell_variable 'TM_LINE_TERMINATOR', ':'
  uuid "33877934-69D3-4773-8786-9B5211012A9A"
end

preferences 'Symbol List: Hide Decorator' => 'source.python meta.function.decorator.python entity.name.function.decorator.python', file: 'Symbol List Hide Decorator' do
  show_in_symbol_list false
  uuid "F5CE4B1B-6167-4693-A49B-021D97C18F5A"
end

preferences 'Symbol List' => 'source.python meta.function.python, source.python meta.class.python' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/class\s+([A-Za-z_][A-Za-z0-9_]*.+?\)?)(\:|$)/$1/g;
    s/def\s+([A-Za-z_][A-Za-z0-9_]*\()(?:(.{0,40}?\))|((.{40}).+?\)))(\:)/$1(?2:$2)(?3:$4…\))/g;
  TXT
  uuid "005BE156-8D74-4036-AF38-283708645115"
end
