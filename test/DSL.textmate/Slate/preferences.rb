# encoding: utf-8

preferences 'Folding' => 'source.slate' do
  # FIXME: (warning) character class has duplicated range
  folding_start_marker %r/^\s*[_A-z0-9]+@.+$/
  folding_stop_marker %r/^.*(\])[A-z ]*\.$/
  uuid "EEA2B3D3-E16A-45B8-B8A4-43F0742A0EBE"
end

preferences 'Indentation' => 'source.slate' do
  decrease_indent_pattern %r/^\s*(\]|\}|\))$/
  highlight_pairs "\"\" () {} || [] “” ''"
  # FIXME: (error) end pattern with unmatched parenthesis
  increase_indent_pattern %r/^.*(\(|\[|\{].*[^)]}"]$/
  shell_variable 'TM_COMMENT_START', '"'
  shell_variable 'TM_COMMENT_END', '"'
  uuid "DCF79A2D-917F-4528-BC5F-4ACDF9891AB6"
end

preferences 'Typing Pairs Default' => 'source.slate' do
  smart_typing_pairs "'' \"\" () {} []"
  uuid "8B7EC0F3-2EFD-438E-AA61-0B2E9F5347FA"
end

preferences 'Typing Pairs in Blocks' => 'source.slate meta.block.header.slate' do
  smart_typing_pairs "'' \"\" () {} [] ||"
  uuid "C41BA7AC-7461-4109-A8F7-EA0D01E34616"
end
