# encoding: utf-8

preferences 'Comments' => 'source.css' do
  shell_variable 'TM_COMMENT_START', '/*'
  shell_variable 'TM_COMMENT_END', '*/'
  shell_variable 'TM_COMMENT_DISABLE_INDENT', 'yes'
  uuid "375CF370-8A7B-450A-895C-FD18B47957E2"
end

preferences 'Symbol List: Group' => 'source.css comment.block.css -source.css.embedded', file: 'Symbol List Group' do
  show_in_symbol_list true
  symbol_transformation 's/\/\*\*\s*(.*?)\s*\*\//** $1 **/; s/\/\*.*?\*\*\//./; s/\/\*[^\*].*?[^\*]\*\///'
  uuid "096894D8-6A5A-4F1D-B68C-782F0A850E52"
end

preferences 'Symbol List: Selector' => 'source.css meta.selector', file: 'Symbol List' do
  show_in_symbol_list true
  symbol_transformation 's/^\s*/CSS: /; s/\s+/ /g'
  uuid "17B2DD5B-D2EA-4DC5-9C7D-B09B505156C5"
end
