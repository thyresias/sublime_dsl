# encoding: utf-8

preferences 'Comments' => 'source.c, source.c++, source.objc, source.objc++', file: 'Comments (C++)' do
  shell_variable 'TM_COMMENT_START', '// '
  shell_variable 'TM_COMMENT_START_2', '/*'
  shell_variable 'TM_COMMENT_END_2', '*/'
  shell_variable 'TM_COMMENT_DISABLE_INDENT_2', 'yes'
  uuid "38DBCCE5-2005-410C-B7D7-013097751AC8"
end

preferences 'Completion Rules' => 'source.c, source.c++, source.objc, source.objc++' do
  # FIXME: (warning) nested repeat operator '+' and '*' was replaced with '*' in regular expression
  cancel_completion %r/^\s*(\}?\s*(else|try|do)|(class|struct|enum|namespace)\s*[a-zA-Z_0-9]+*)$/
end

preferences 'Indentation Rules' => 'source.c, source.c++, source.objc, source.objc++' do
  decrease_indent_pattern %r'(?x)
      ^ (.*\*/)? \s* \} .* $
  |   ^ \s* (public|private|protected): \s* $
  |   ^ \s* @(public|private|protected) \s* $
  '
  increase_indent_pattern %r/(?x)
      ^ .* \{ [^}"']* $
  |   ^ \s* (public|private|protected): \s* $
  |   ^ \s* @(public|private|protected) \s* $
  /
  bracket_indent_next_line_pattern %r/(?x)
    ^ \s* \b(if|while|else)\b [^;]* $
    | ^ \s* \b(for)\b .* $
    /
  un_indented_line_pattern %r'^\s*((/\*|.*\*/|//|#|template\b.*?>(?!\(.*\))|@protocol|@interface(?!.*\{)|@implementation|@end).*)?$'
  indent_square_brackets true
  uuid "02EB44C6-9203-4F4C-BFCB-7E3360B12812"
end

preferences 'Symbol List: Indent Class Methods' => 'meta.class-struct-block.c++ entity.name.function', file: 'Symbol List - Indent Class Methods' do
  symbol_transformation 's/^\s*/ /;  # pad'
  uuid "B2B97E23-E686-4410-991D-A92AF3A9FC95"
  bundle_uuid "4675A940-6227-11D9-BFB1-000D93589AF6"
end

preferences 'Symbol List: Prefix Banner Items' => 'meta.toc-list.banner', file: 'Symbol List - Prefix Banner Items' do
  symbol_transformation <<-'TXT'
    s/^\s+/# /;
    s/^=+$/-/;
  TXT
  uuid "A8E4E48A-81F3-4DB7-A7A2-88662C06E011"
end
