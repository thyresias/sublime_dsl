# encoding: utf-8

preferences 'Comments' => 'source.verilog' do
  shell_variable 'TM_COMMENT_START', '// '
  shell_variable 'TM_COMMENT_START_2', '/*'
  shell_variable 'TM_COMMENT_END_2', '*/'
  shell_variable 'TM_COMMENT_DISABLE_INDENT_2', 'yes'
  uuid "A036E4EB-B440-459B-B78F-8B6D21F0C547"
end

preferences 'Disable Indention Correction' => 'source.verilog' do
  disable_indent_corrections "1"
  indent_on_paste "simple"
  uuid "25203842-5801-404D-93BA-21092E6E6535"
end

preferences 'Folding' => 'source.verilog' do
  folding_start_marker %r'^[^/]*-?(?!/)\s*(begin|^\s*case(x|z)?|^\s*module|^`ifdef)\b'
  folding_stop_marker %r/\s*(end(case|module)?|`endif)\b/
  uuid "62B90509-268C-42EC-B49C-AE0471DC68A4"
end

preferences 'Symbol List - Instantiation (Parameterless)' => 'meta.block.instantiation.parameterless.verilog' do
  show_in_symbol_list true
  symbol_transformation 's/\s*// ; s/(\S+)\s+([a-zA-Z][a-zA-Z0-9_]*).*/    $1 $2/'
  uuid "AD2DB09A-2214-4E0A-8B10-742BA5D77304"
end

preferences 'Symbol List - Instantiation (With Parameters)' => 'meta.block.instantiation.with.parameters.verilog' do
  show_in_symbol_list true
  symbol_transformation 's/\s*// ; s/(\S+).*(?<=\))\s*([a-zA-Z][a-zA-Z0-9_]*).*/    $1 $2/'
  uuid "4AC194C6-BCFF-48AA-8694-275CC4D8087C"
end

preferences 'Symbol List - Module' => 'entity.name.type.module.verilog' do
  show_in_symbol_list true
  symbol_transformation 's/^\s*// ; s/(.*)/module $1/'
  uuid "A175D810-05BD-490F-B487-29D75352B745"
end

preferences 'Typing Pairs' => 'source.verilog' do
  smart_typing_pairs "\"\" () {} [] “” ‘’"
  uuid "4D24FF05-9055-4512-B820-306F86C78DED"
end
