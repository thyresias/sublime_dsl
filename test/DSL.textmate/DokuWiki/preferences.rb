# encoding: utf-8

preferences 'Disable spell checking in raw' => 'markup.raw.dokuwiki' do
  spell_checking false
  uuid "B5C7FF05-8484-44B6-8343-BE44A9027261"
end

preferences 'Folding' => 'text.html.dokuwiki' do
  folding_start_marker %r'(<(php|html|file|nowiki)>|<code(\s*.*)?>)|/\*\*|\{\s*$'
  folding_stop_marker %r'(</(code|php|html|file|nowiki)>)|\*\*/|^\s*\}'
  uuid "AE5410CC-7AAD-461D-9E2D-3C9A5B493AE4"
end

preferences 'Show Heading in list' => 'markup.heading.dokuwiki' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/^\s*==\s*([^=].*)(?<!=)={2,}\s*$/    $1/;
    s/^\s*===\s*([^=].*)(?<!=)={2,}\s*$/   $1/;
    s/^\s*====\s*([^=].*)(?<!=)={2,}\s*$/  $1/;
    s/^\s*=====\s*([^=].*)(?<!=)={2,}\s*$/ $1/;
    s/^\s*======+\s*([^=].*)(?<!=)={2,}\s*$/$1/;
  TXT
  uuid "65F97C49-BBE9-447F-83EC-0A4598EF5558"
end
