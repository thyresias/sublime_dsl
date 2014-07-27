# encoding: utf-8

preferences 'Symbol List: Exclude Colors' => 'source.fxscript entity.name.function.color', file: "Don't show colors in Symbol List" do
  show_in_symbol_list false
  uuid "7E143628-C80C-4CAC-9F5E-DED6A66CDF29"
end

preferences 'Folding' => 'source.fxscript' do
  folding_start_marker %r/(^|(?<=;)[ \t]*)on[ \t]+(\w+)[ \t]*/
  folding_stop_marker %r'end(;|;?[ \t]*|;?[ \t]*//.*[ \t]*)'
  uuid "D98B938B-CF08-4F3E-8293-5C4515430F29"
end

preferences 'Misc' => 'source.fxscript' do
  decrease_indent_pattern %r/^\s*(end|next|else)\b/
  highlight_pairs "\"\" () {} []"
  increase_indent_pattern %r/^\s*(if|else|on|for)\b.*$/
  shell_variable 'TM_COMMENT_START', '//	'
  shell_variable 'TM_COMMENT_END', ''
  shell_variable 'TM_COMMENT_MODE', 'line'
  smart_typing_pairs "\"\" () {} []"
  uuid "051C9F35-F904-4082-A164-0841A260208E"
end

preferences 'Symbol List: Globals' => 'source.fxscript variable.global.fxscript', file: 'Show Globals in Symbol List' do
  show_in_symbol_list true
  symbol_transformation 's/(.*)/\tinput: $1/'
  uuid "30F79A23-EF2C-4DEB-93D1-69547C894B7B"
end
