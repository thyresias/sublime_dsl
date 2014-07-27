# encoding: utf-8

preferences 'Beamer Symbol List' => 'text.tex.latex.beamer meta.function.frametitle.latex' do
  show_in_symbol_list true
  symbol_transformation 's/^\\\frametitle\*?(?:\[[^]]*\])?\{(.+)\}/    fr: $1/; # \frametitle'
  uuid "4192C345-63CB-4B38-A873-6C185E377C71"
end

preferences 'Cite Completion' => 'text.tex.latex meta.citation.latex' do
  completion_command '"$TM_BUNDLE_SUPPORT/bin/LatexCiteKeys.rb"'
  disable_default_completion true
  uuid "086F7794-CE1E-423A-9BF2-E27466A56067"
end

preferences 'Comments' => 'text.tex' do
  shell_variable 'TM_COMMENT_START', '% '
  uuid "678850E6-C630-4EEF-B307-14ADEE2B2994"
end

preferences 'Disable Smart Typing after Backslashes' => 'text.tex constant.character.escape.tex' do
  highlight_pairs ""
  smart_typing_pairs ""
  uuid "C8BC77A9-CF8E-4510-A8C2-F48C6E7BC93E"
end

preferences 'Folding: BibTeX' => 'text.bibtex', file: 'Folding - BibTeX' do
  folding_start_marker %r/\@[a-zA-Z]+\s*[{(].+,/
  folding_stop_marker %r/^\s*[)}]\s*$/
  uuid "D67A92D5-BF71-4F97-9A26-67C05956B61F"
end

preferences 'Folding: LaTeX' => 'text.tex.latex', file: 'Folding - LaTeX' do
  folding_start_marker %r/\\begin\{.*\}|%.*\(fold\)\s*$/
  folding_stop_marker %r/\\end\{.*\}|%.*\(end\)\s*$/
  uuid "077E5491-2438-46A4-B150-E9C743EDEE8B"
end

preferences 'Folding: Log' => 'text.log.latex', file: 'Folding - Log' do
  folding_start_marker %r'/\*\*|\(\s*$'
  folding_stop_marker %r'\*\*/|^\s*\)'
  uuid "08123B8C-5F5F-4EA9-83BC-1DF01F6E0C0C"
end

preferences 'Folding: TeX' => 'text.tex', file: 'Folding - TeX' do
  folding_start_marker %r'/\*\*|\{\s*$'
  folding_stop_marker %r'\*\*/|^\s*\}'
  uuid "794D9A7A-E3E3-4DFF-8FF9-E2F8F7618BD2"
end

preferences 'Label Completion' => 'text.tex.latex meta.reference.label' do
  completion_command '"$TM_BUNDLE_SUPPORT/bin/LatexLabelCompletions.rb"'
  disable_default_completion true
  uuid "76086A65-97AA-48FE-B3C6-026B25E15958"
end

preferences 'Miscellaneous (BibTeX)' => 'text.bibtex' do
  highlight_pairs "() [] {} \"\""
  smart_typing_pairs "() [] {} \"\""
  uuid "73CE04EB-B78D-456A-AB07-CAED9C4E2BDB"
end

preferences 'Miscellaneous' => 'text.tex.latex' do
  completions %w(
    corollary definition description enumerate equation itemize lemma proof
    proposition verbatim
  )
  decrease_indent_pattern %r/^\s*\\end(\{.*\})?$/
  highlight_pairs "\"\" () {} [] “” $$ `'"
  increase_indent_pattern %r/^\s*\\begin\{.*\}/
  smart_typing_pairs "\"\" () {} [] “” $$ `'"
  uuid "4830CA58-1F08-421C-9703-BE586DC1FE7A"
end

preferences 'Smart Typing (Strings)' => 'text.tex.latex string.quoted.double, text.tex.latex string.quoted.single' do
  highlight_pairs "() {} [] “” $$"
  smart_typing_pairs "() `' {} [] “” $$"
  uuid "D4961019-E3EF-4D0C-904F-FBE2C74A6DE9"
end

preferences 'Spell Checking in Strings' => 'text.tex string.quoted' do
  spell_checking true
  uuid "C6B468AE-5BD0-48D1-9D54-F4D09C42C505"
end

preferences 'Spell Checking: Disable for Comments' => 'text.tex comment' do
  spell_checking false
  uuid "B4EEDFA2-5AD3-4F15-875A-6D3498ED1477"
end

preferences 'Symbol List' => 'text.tex.latex meta.function.section.*.latex', file: 'Symbol list' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/^\\part\*?(?:\[[^]]*\])?\{(.+)\}/$1/; # \part
    s/^\\chapter\*?(?:\[[^]]*\])?\{(.+)\}/ $1/; # \part
    s/^\\section\*?(?:\[[^]]*\])?\{(.+)\}/  $1/; # \section
    s/^\\subsection\*?(?:\[[^]]*\])?\{(.+)\}/   $1/; # \section
    s/^\\subsubsection\*?(?:\[[^]]*\])?\{(.+)\}/    $1/; # \section
    s/^\\paragraph\*?(?:\[[^]]*\])?\{(.+)\}/     $1/; # \paragraph
    s/^\\subparagraph\*?(?:\[[^]]*\])?\{(.+)\}/      $1/; # \paragraph
    s/^\\.*\{(.+)\}/$1/;     # take care of everything else
  TXT
  uuid "AF20835B-CB64-46F3-9E91-F3330378C4AE"
end

preferences 'TexShop %: comments' => 'text.tex.latex comment.line.percentage.semicolon.texshop.tex', file: 'TexShop comments' do
  show_in_symbol_list true
  uuid "955AA9F7-F8BA-4A46-9A8D-F7C88DB3FB26"
end
