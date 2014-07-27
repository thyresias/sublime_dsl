# encoding: utf-8

preferences 'Comments' => 'source.ssh-config' do
  shell_variable 'TM_COMMENT_START', '# '
  uuid "B5A64964-30AE-4732-B88E-C03785265DFD"
end

preferences 'Disable Indentation Corrections' => 'source.ssh-config' do
  disable_indent_corrections true
  indent_on_paste "simple"
  uuid "1123E46F-8E8C-4208-ABBC-A8B83DF5835D"
end
