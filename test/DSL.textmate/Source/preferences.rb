# encoding: utf-8

preferences 'Character Class: Constant' => 'constant' do
  character_class "constant"
  uuid "5B68F39E-1911-4861-90F8-35FC2F894BB2"
end

preferences 'Character Class: Escape' => 'constant.character.escape' do
  character_class "escape"
  uuid "67BB1E41-08BE-4F53-94A7-3BF84352B549"
end

preferences 'Character Class: Keyword' => 'keyword' do
  character_class "keyword"
  uuid "B418CC70-FF3E-4522-9B28-533C5336D71A"
end

preferences 'Character Class: Punctuation' => 'punctuation.separator' do
  character_class "punctuation"
  uuid "ACFE8A63-EE5C-42C2-87FE-21BAC1810FB9"
end

preferences 'Character Class: Storage' => 'storage' do
  character_class "storage"
  uuid "43832F61-AC35-4C9D-AAC2-1FF3E2D3ECB3"
end

preferences 'Character Class: Variable' => 'variable' do
  character_class "variable"
  uuid "DADE64F8-B3B0-4551-9C9D-1EEBAE2C6205"
end

preferences 'Comments' => 'source' do
  shell_variable 'TM_COMMENT_START', '/*'
  shell_variable 'TM_COMMENT_END', '*/'
  shell_variable 'TM_COMMENT_DISABLE_INDENT', 'YES'
  shell_variable 'TM_COMMENT_START_2', '// '
  shell_variable 'TM_COMMENT_START_3', '# '
  uuid "A8D04E65-97FA-4DE0-85A5-AC426B6184C6"
end

preferences 'Comments: Disable Indent' => 'comment.block', file: 'Comments˸ Disable Indent Corrections' do
  un_indented_line_pattern %r/.+/
  uuid "B0E99103-4A5D-45FC-B5BD-38F681FFF29E"
end

preferences 'Indent Corrections: Disable for Comments and Strings' => 'comment.block, string.quoted', file: 'Disable Indent Corrections' do
  disable_indent_corrections true
  uuid "C4826668-9334-460A-800A-D3E2D9A8A404"
end

preferences 'Spell Checking: Disable for Source' => 'source, constant, keyword, storage, support, variable', file: 'Disable spell checking for all' do
  spell_checking false
  uuid "67C15B0D-A505-4D6D-9443-6B1265C52DD7"
end

preferences 'Spell Checking: Enable for Strings' => '^ source string.quoted - punctuation', file: 'Enable spell checking for strings' do
  spell_checking true
  uuid "CF9BE765-81D0-4644-9684-4F310C94A3AD"
end

preferences 'Highlight Pairs: Disable in Escaped Characters' => 'constant.character.escape' do
  highlight_pairs ""
  uuid "94B7F596-0981-4B76-A909-BF3FC1C2EBE8"
end

preferences 'Miscellaneous' => 'source' do
  decrease_indent_pattern %r'^(.*\*/)?\s*\}[;\s]*$'
  increase_indent_pattern %r/^.*(\{\}?[^}"']*|\([^)"']*)$/
  smart_typing_pairs "\"\" () {} [] “” ‘’ '' ``"
  un_indented_line_pattern %r/^\s*$/
  uuid "9D03129B-D636-4F5B-A862-E52FD1F912F5"
end

preferences 'Typing Pairs: String and Comment' => 'string.quoted.double - dyn.selection, comment, string.unquoted.heredoc', file: 'String˸comment typing pairs' do
  smart_typing_pairs "\"\" () {} [] “” ‘’"
  uuid "BE261D59-88E3-47F6-AAAB-8ACB3E4ACEEC"
end

preferences 'Style: Line Comments - Apostrophe' => 'comment.line.apostrophe' do
  indented_soft_wrap match: /.*(')\s+/, format: '${0/(\s*)(.{,4}).*/$1${2/./ /g}/}'
  soft_wrap true
  uuid "41448D3A-7265-49B1-BF8F-0E8F0A6A57CD"
end

preferences 'Style: Line Comments - Asterisk' => 'comment.line.asterisk' do
  indented_soft_wrap match: /.*(\*)\s+/, format: '${0/(\s*)(.{,4}).*/$1${2/./ /g}/}'
  soft_wrap true
  uuid "CB39E715-315E-453E-92B3-6F03EF8DAD7F"
end

preferences 'Style: Line Comments - Backtick' => 'comment.line.backtick' do
  indented_soft_wrap match: /.*(`)\s+/, format: '${0/(\s*)(.{,4}).*/$1${2/./ /g}/}'
  soft_wrap true
  uuid "CB0DCC73-E48C-4923-9CE4-B8E177CFC723"
end

preferences 'Style: Line Comments - Misc.' => 'comment.line.at-sign, comment.line.double-backslash, comment.line.double-dash, comment.line.double-dot, comment.line.exclamation, comment.line.double-percentage, comment.line.percentage', file: 'Style˸ Line Comments - Misc' do
  indented_soft_wrap match: /.*(@|\\\\|--|\.\.|!|%%?)\s+/, format: '${0/(\s*)(.{,4}).*/$1${2/./ /g}/}'
  soft_wrap true
  uuid "2645C181-6C31-4487-8F98-895A059781C0"
end

preferences 'Style: Line Comments - Number-sign' => 'comment.line.number-sign, comment.line.double-number-sign' do
  indented_soft_wrap match: /.*(##?)\s+/, format: '${0/(\s*)(.{,4}).*/$1${2/./ /g}/}'
  soft_wrap true
  uuid "8CF53FBD-89AD-4F14-A268-1F061C02E91D"
end

preferences 'Style: Line Comments - Semicolon' => 'comment.line.semicolon' do
  indented_soft_wrap match: /.*(;)\s+/, format: '${0/(\s*)(.{,4}).*/$1${2/./ /g}/}'
  soft_wrap true
  uuid "0B427248-5D44-4106-A47E-F706561BA8F7"
end

preferences 'Style: Line Comments - Slash' => 'comment.line.slash, comment.line.double-slash' do
  indented_soft_wrap match: %r'.*(//?)\s+', format: '${0/(\s*)(.{,4}).*/$1${2/./ /g}/}'
  soft_wrap true
  uuid "B538AEB0-E3CE-48A6-8F32-D9AD82DC4085"
end

preferences 'Symbol List' => 'entity.name.function, entity.name.type, meta.toc-list', file: 'Symbol list' do
  show_in_symbol_list true
  uuid "0A0DA1FC-59DE-4FD9-9A2C-63C6811A3C39"
end

preferences 'Typing Pairs: Disable in Escaped Characters' => 'B:constant.character.escape - dyn.selection' do
  smart_typing_pairs ""
  uuid "F77060A4-2440-414B-9FBC-1E751A8E8FA7"
end
