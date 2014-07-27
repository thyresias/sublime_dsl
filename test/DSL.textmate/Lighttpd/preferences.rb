# encoding: utf-8

preferences 'Folding' => 'source.lighttpd-config' do
  folding_start_marker %r/(\{|\()\s*$/
  folding_stop_marker %r/^\s*(\}|\))/
  uuid "670195D8-D6BB-4114-AFDD-8C5DABE6A5E8"
end
