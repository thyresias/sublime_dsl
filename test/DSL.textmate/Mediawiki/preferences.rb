# encoding: utf-8

preferences 'Folding' => 'text.html.mediawiki' do
  folding_indented_block_ignore %r/^(?!=+)/
  folding_indented_block_start %r/^=+/
  folding_start_marker %r'^\{\{[^\}]*$|<(?!/|br)$|{\|(?# fold on tags, pipe, {{)'
  folding_stop_marker %r'\}\}|\|}|</(?# stop fold on tag close, and } </)'
  uuid "4A4ECABE-1F4E-4933-8B40-7DF02FD73B6B"
end

preferences 'Symbol List' => 'text.html.mediawiki markup.heading' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/\s*=+\s*$//;                # strip trailing space and =
    s/(?<==)=/ /g;                # use look behind to change all but first = to space
    s/^(=)( *)\s?(.*)/ $2$3/;     # make the first = a space
  TXT
  uuid "5FB06962-01CA-4D3D-8DC7-B6C6996F6111"
end

preferences 'Typing Pairs (outside heading)' => 'text.html.mediawiki meta, text.html.mediawiki markup - markup.heading.mediawiki' do
  smart_typing_pairs "\"\" () {} [] “”"
  uuid "F8F06C9F-E761-46CD-867A-14865AA0915B"
end

preferences 'Typing Pairs' => 'text.html.mediawiki' do
  smart_typing_pairs "\"\" () {} [] “” =="
  uuid "9991014D-6D8B-4C8A-BCF6-0A3CB9C8E4C9"
end
