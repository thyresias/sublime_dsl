# encoding: utf-8

preferences 'Indent: Raw Block' => 'markup.raw.block.markdown', file: 'Indent%3A Raw' do
  decrease_indent_pattern %r'^(.*\*/)?\s*\}[;\s]*$'
  increase_indent_pattern %r/^.*(\{[^}"']*|\([^)"']*)$/
  uuid "E23C5DD2-9A36-4B4A-9729-2A769A055B92"
end

preferences 'Symbol List: Heading' => 'text.html.markdown markup.heading.markdown', file: 'Symbol List - Heading' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/\s*#*\s*\z//g;			# strip trailing space and #'s
    s/(?<=#)#/ /g;			# change all but first # to m-space
    s/^#( *)\s+(.*)/$1$2/;		# strip first # and space before title
  TXT
  uuid "C02A37C1-E770-472F-A13E-358FF0C6AD89"
end
