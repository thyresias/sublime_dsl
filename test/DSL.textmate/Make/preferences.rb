# encoding: utf-8

preferences 'Folding' => 'source.antlr' do
  folding_start_marker %r/^(((override\s*)?define)|ifdef|ifndef|ifeq|ifneq)\b/
  folding_stop_marker %r/^(endef|endif)\b/
  uuid "60544971-D81D-4569-B25A-D09025F41B80"
end

preferences 'Indentation' => 'source.makefile' do
  disable_indent_corrections "1"
  increase_indent_pattern %r/^[^\t ]+:/
  indent_on_paste "simple"
  uuid "FA4E2642-684D-44FC-AC3A-1513718119AC"
end

preferences 'Miscellaneous' => 'source.makefile' do
  shell_variable 'TM_COMMENT_START', '# '
  uuid "E05AF624-5BD8-4A54-A0E8-F80E8191D69E"
end
