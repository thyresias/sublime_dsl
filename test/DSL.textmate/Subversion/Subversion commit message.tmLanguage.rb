# encoding: utf-8

language 'Subversion Commit Message' => 'text.svn-commit', file: 'Subversion commit message' do
  file_types %w(svn-commit.tmp svn-commit.2.tmp)
  uuid "5B201F55-90BC-4A69-9A44-1BABE5A9FE99"  # TextMate only

  rule 'meta.scope.message.svn-commit' do
    from %r/\A(?!^--.*--$)/
    to %r/(?=^--.*--$)/
    rule 'markup.list.unnumbered.svn-commit' do
      from %r/^\s*([•·*\-+]).*$\n?/,
        1 => 'punctuation.definition.item.svn-commit'
      to %r/(?=^\s*([•·*\-+]|$))/
    end
  end
  rule 'meta.scope.metadata.svn-commit' do
    content_scope "meta.scope.changed-files.svn-commit"
    from %r/^--.*--$\n?/,
      0 => 'meta.separator.svn-commit'
    to %r/\z/
    include "#metadata"
  end

  fragment :metadata do
    rule 'markup.changed.svn-commit' do
      match %r/^(M|.M)\s+.*$\n?/
    end
    rule 'markup.inserted.svn-commit' do
      match %r/^A\s+.*$\n?/
    end
    rule 'markup.deleted.svn-commit' do
      match %r/^D\s+.*$\n?/
    end
  end
end
