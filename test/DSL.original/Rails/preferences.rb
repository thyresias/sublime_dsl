# encoding: utf-8

preferences 'Comments' => 'text.haml', file: 'Ruby Haml Comments' do
  shell_variable 'TM_COMMENT_START', '/ '
  uuid "4C2E088A-2EDB-44DF-9C62-CE0112B4C237"
end

preferences 'Template (ERB)' => 'text.html.ruby' do
  shell_variable 'TM_RAILS_TEMPLATE_START_RUBY_EXPR', '<%= '
  shell_variable 'TM_RAILS_TEMPLATE_END_RUBY_EXPR', ' %>'
  shell_variable 'TM_RAILS_TEMPLATE_START_RUBY_INLINE', '<% '
  shell_variable 'TM_RAILS_TEMPLATE_END_RUBY_INLINE', ' -%>'
  shell_variable 'TM_RAILS_TEMPLATE_END_RUBY_BLOCK', '<% end -%>'
  uuid "87EF33FE-E918-11DC-A399-00112475D960"
end

preferences 'Template (Haml)' => 'text.haml' do
  shell_variable 'TM_RAILS_TEMPLATE_START_RUBY_EXPR', '= '
  shell_variable 'TM_RAILS_TEMPLATE_END_RUBY_EXPR', ''
  shell_variable 'TM_RAILS_TEMPLATE_START_RUBY_INLINE', '- '
  shell_variable 'TM_RAILS_TEMPLATE_END_RUBY_INLINE', ''
  shell_variable 'TM_RAILS_TEMPLATE_END_RUBY_BLOCK', ''
  uuid "C0FD2646-E924-11DC-A399-00112475D960"
end
