# encoding: utf-8

language 'Git Rebase Message' => 'text.git-rebase' do
  file_types %w(git-rebase-todo)
  uuid "7F1CC209-5F6D-486A-8180-09FA282381A1"  # TextMate only

  rule 'comment.line.number-sign.git-rebase' do
    match %r/^\s*(#).*$\n?/,
      1 => 'punctuation.definition.comment.git-rebase'
  end
  rule 'meta.commit-command.git-rebase' do
    match %r/^\s*(pick|p|reword|r|edit|e|squash|s|fixup|f)\s+([0-9a-f]+)\s+(.*)$/,
      1 => 'support.function.git-rebase',
      2 => 'constant.sha.git-rebase',
      3 => 'meta.commit-message.git-rebase'
  end
end
