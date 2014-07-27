# encoding: utf-8

preferences 'Comments' => 'source.capnp' do
  shell_variable 'TM_COMMENT_START', '# '
  uuid "F465B957-A524-4E0B-8546-EF118B2938E3"
end

preferences 'Foldings' => 'source.capnp' do
  folding_start_marker %r/\{\s*($|#)/
  folding_stop_marker %r/^\s*\}/
  uuid "285717FA-6A06-4E11-9EFE-5F032D74DE2E"
end
