# encoding: utf-8

preferences 'Spell Checking: Disable for Raw' => 'text.html.textile markup.raw', file: 'Disable Spell Check in Raw' do
  spell_checking false
  uuid "399D65CB-7CA9-4F91-B454-11EA9F6D1501"
end

preferences 'Typing Pairs: Defaults' => 'text.html.textile', file: 'Preferences' do
  smart_typing_pairs "__ ** \"\" () {} [] “” `` @@ %% ^^ ~~"
  uuid "18DE9523-B3B2-42EE-A099-210635E7FFEB"
end

preferences 'Symbol List: Heading' => 'text.html.textile markup.heading.textile' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/\s*$//;				# strip spaces
    s/^\s*//;
    s/(^(h[1-6])([<>=()]+)?)(\([^)]*\)|{[^}]*})*(\.)/$2/;
    s/^h1//;				# indent headers
    s/^h2/  /;
    s/^h3/   /;
    s/^h4/    /;
    s/^h5/     /;
    s/^h6/      /;
  TXT
  uuid "1D499ACC-5612-4D30-A405-2B0488AC6F74"
end
