# encoding: utf-8

preferences 'Folding' => 'source.json' do
  folding_start_marker %r/(?x:      # turn on extended mode
                            ^         # a line beginning with
                            \s*       # some optional space
                            [{\[]     # the start of an object or array
                            (?!       # but not followed by
                              .*      # whatever
                              [}\]]   # and the close of an object or array
                              ,?      # an optional comma
                              \s*     # some optional space
                              $       # at the end of the line
                            )         
                            |         # ...or...
                            [{\[]     # the start of an object or array
                            \s*       # some optional space
                            $         # at the end of the line
                          )/
  folding_stop_marker %r/(?x:        # turn on extended mode
                          ^        # a line beginning with
                          \s*      # some optional space
                          [}\]]    # and the close of an object or array
                        )/
  uuid "0CA8F9F2-FF0F-47BF-8D77-1DC5747C7D4C"
end

preferences 'Miscellaneous' => 'source.json' do
  decrease_indent_pattern %r/^\s*[}\]],?\s*$/
  increase_indent_pattern %r/^.*(\{[^}]*|\[[^\]]*)$/
  smart_typing_pairs "\"\" () {} []"
  uuid "9D83F5F7-ECAD-4EFE-ADAC-2063C7EFED56"
end
