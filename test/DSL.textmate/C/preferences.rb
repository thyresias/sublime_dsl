# encoding: utf-8

preferences 'Comments' => 'source.c, source.c++, source.objc, source.objc++', file: 'Comments (C++)' do
  shell_variable 'TM_COMMENT_START', '// '
  shell_variable 'TM_COMMENT_START_2', '/*'
  shell_variable 'TM_COMMENT_END_2', '*/'
  shell_variable 'TM_COMMENT_DISABLE_INDENT_2', 'yes'
  uuid "38DBCCE5-2005-410C-B7D7-013097751AC8"
end

preferences 'Spell Checking: Disable for Include Strings' => 'meta.preprocessor.c.include string.quoted', file: 'Disable Spell Checking' do
  spell_checking false
  uuid "DC32505E-226B-409A-B3C3-8FC88BF4A131"
end

preferences 'Folding' => 'source.c, source.c++' do
  folding_start_marker %r'(?x)
     /\*\*(?!\*)
    |^(?![^{]*?//|[^{]*?/\*(?!.*?\*/.*?\{)).*?\{\s*($|//|/\*(?!.*?\*/.*\S))
  '
  folding_stop_marker %r'(?<!\*)\*\*/|^\s*\}'
  uuid "C7881C3D-B09F-405A-8E88-972EB244154A"
end

preferences 'Folding: Access/Comments' => 'source.c++, source.objc++', file: 'Folding˸ Access' do
  folding_indented_block_ignore %r/^\s*#/
  folding_indented_block_start %r'^\s*(public|protected|private):\s*(//.*)?$|^\s*/[*](?!.*[*]/)'
  uuid "4CA2F06B-4B5F-4618-BAF4-3F48AE647082"
end

preferences 'Highlight Pairs: #if…#endif' => 'source.c, source.c++, source.objc, source.objc++', file: 'Highlight Pairs˸ if...endif' do
  highlight_pairs "() [] {} “” ‘’"
  highlight_pair %r/^\s*#if\b/, /^\s*#(else|endif)\b/
  highlight_pair %r/^\s*#(if|else)\b/, /^\s*#endif\b/
  uuid "EF911492-6DBB-413B-9801-D7150BF6BD6A"
end

preferences 'Header Completion (System)' => 'meta.preprocessor.c.include string.quoted.other.lt-gt.include', file: 'Include Completion (System)' do
  completion_command '"$TM_BUNDLE_SUPPORT/bin/headers" -p"$TM_CURRENT_WORD"'
  disable_default_completion true
  uuid "9136716A-CE06-4801-ABC9-3D64300869F8"
end

preferences 'Header Completion (User)' => 'meta.preprocessor.c.include string.quoted.double', file: 'Include Completion' do
  completion_command '"$TM_BUNDLE_SUPPORT/bin/headers" -p"$TM_CURRENT_WORD" -duser -C"$TM_DIRECTORY"'
  disable_default_completion true
  uuid "66EE7D45-6AA0-4AB9-9699-A3DF4E2B9AE7"
end

preferences 'Typing Pairs: Include Statements' => 'meta.preprocessor.c.include', file: 'Include typing pairs' do
  highlight_pairs "\"\" <>"
  smart_typing_pairs "\"\" <>"
  uuid "1EACF554-A30C-44B0-B97A-11E3FA995045"
end

preferences 'Indentation Rules' => 'source.c, source.c++, source.objc, source.objc++' do
  decrease_indent_pattern %r'(?x)
      ^ \s* ( (?! \S.* /[*] ) .* [*]/ \s* )? \}
  |   ^ \s* (public|private|protected): \s* $
  |   ^ \s* @(public|private|protected) \s* $
  '
  increase_indent_pattern %r/(?x)
      ^ .* \{ [^}"']* $
  |   ^ \s* (public|private|protected): \s* $
  |   ^ \s* @(public|private|protected) \s* $
  |   ^ \s* \{ \} $
  /
  indent_next_line_pattern %r'(?x)^
      (?! .* [;:{},] \s*                  # do not indent when line ends with ;, :, {, }, or comma
          ( // .* | /[*] .* [*]/ \s* )? $ #  …account for potential trailing comment
      |   @(public|private|protected)     # do not indent after obj-c data access keywords
      )
      .                                  # the negative look-ahead above means we don’t care about what we match here
  '
  un_indented_line_pattern %r'^\s*((/\*|\*/|//|template\b.*?>(?!\(.*\))|@protocol|@optional|@interface(?!.*\{)|@implementation|@end).*)?$'
  zero_indent_pattern %r/^\s*#/
  uuid "02EB44C6-9203-4F4C-BFCB-7E3360B12812"
end

preferences 'Symbol List: Exclude class inheritance' => 'entity.name.type.inherited.c++' do
  show_in_symbol_list false
  uuid "DA926AFF-E231-4036-9197-AFD6E314A0DC"
  bundle_uuid "4675A940-6227-11D9-BFB1-000D93589AF6"
end

preferences 'Symbol List: Indent Class Methods' => 'meta.class-struct-block.c++ entity.name.function' do
  symbol_transformation 's/^\s*/ /;  # pad'
  uuid "B2B97E23-E686-4410-991D-A92AF3A9FC95"
  bundle_uuid "4675A940-6227-11D9-BFB1-000D93589AF6"
end

preferences 'Symbol List: Prefix Banner Items' => 'meta.toc-list.banner' do
  symbol_transformation <<-'TXT'
    s/^\s+/# /;
    s/^=+$/-/;
  TXT
  uuid "A8E4E48A-81F3-4DB7-A7A2-88662C06E011"
end

preferences 'Typing Pairs: Template/Cast' => 'storage.type.c++.template, keyword.operator.c++.cast', file: 'Template˸cast typing pairs' do
  highlight_pairs "<>"
  smart_typing_pairs "<>"
  uuid "47DD44E6-B4F5-4C2E-BC62-C6ACEBC02A0D"
end

preferences 'Typing Pairs: Selection' => '(source.c++ | source.objc++) & dyn.selection' do
  smart_typing_pairs "\"\" () {} [] <> “” ‘’ '' ``"
  uuid "F6AEAB37-D14E-49BF-BE1F-07883E248BFF"
end
