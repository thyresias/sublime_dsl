# encoding: utf-8

preferences 'Comments: Git Config' => 'source.git-config' do
  shell_variable 'TM_COMMENT_START', '# '
  shell_variable 'TM_COMMENT_START_2', '; '
  uuid "1E1882B3-9578-427F-9EF8-3C56EF407F13"
end

preferences 'Folding (Git Commit Message)' => 'text.git-commit', file: 'Folding - Git Commit Message' do
  folding_start_marker %r/^\+\+\+/
  folding_stop_marker %r/^---/
  uuid "1A0DB209-7219-4BA5-BB32-3A282919890B"
end

preferences 'Spell Checking: Disable' => 'meta.scope.metadata.git-commit' do
  spell_checking false
  uuid "5CF68FFF-6562-4A58-8056-6034EF93E88A"
end

preferences 'Style: Diff' => 'text.git-commit source.diff' do
  soft_wrap false
  uuid "EFA849A8-00DF-4D9A-BA37-504323969746"
end

preferences 'Symbol Popup: Git Config Subsection' => 'entity.name.section.subsection.git-config - punctuation.definition.section.subsection' do
  show_in_symbol_list true
  symbol_transformation "s/^/ /; # indent subsections"
  uuid "E6D2DCFE-A40D-4BF1-9B43-7E3199CF00B4"
end

preferences 'Symbol Popup: Git Config Section' => 'entity.name.section.git-config', file: 'Symbol Popup˸ Git Config' do
  show_in_symbol_list true
  uuid "3E646038-6F79-46BE-96A3-9802E7011162"
end
