# encoding: utf-8

preferences 'comment preferences' => 'text.sweave' do
  shell_variable 'TM_COMMENT_START', '% '
  shell_variable 'TM_COMMENT_END', ''
  shell_variable 'TM_COMMENT_MODE', 'line'
  uuid "B8C8B6BC-F038-40AB-BADF-F708DAC51F4D"
end

preferences 'Folding' => 'text.tex.latex.sweave' do
  # FIXME: (warning) nested repeat operator '?' and '*' was replaced with '*' in regular expression
  folding_start_marker %r/^<<(.?*)>>=|\\begin\{.*\}/
  # FIXME: (warning) nested repeat operator '?' and '*' was replaced with '*' in regular expression
  folding_stop_marker %r/^@(.?*)$|\\end\{.*\}/
  uuid "0D57AA28-9895-44AC-8B25-CF2EA38245CA"
end

preferences 'Named Code Blocks in Symbol List' => 'meta.block.parameters.sweave' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/^<<.*?(?:label=)\s*([^\s,>]*)\s*(?:,.*)?>>$/R: $1/; # explicit label
    s/^<<\s*([^\s,>=]+)\s*(?:,.*>>|>>)$/R: $1/; # First entry is a label
    s/^<<.*>>//; # Everything else just wont show up
  TXT
  uuid "6677D67A-999F-4F29-8151-3308967D51D7"
end
