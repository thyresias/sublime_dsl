# encoding: utf-8

language 'Git Commit Message' => 'text.git-commit' do
  file_types %w(COMMIT_EDITMSG MERGE_MSG)
  folding_start_marker %r/^\+\+\+/
  folding_stop_marker %r/^---/
  uuid "BFE83C06-8508-44BE-A975-95A57BF619A7"  # TextMate only

  rule 'meta.scope.message.git-commit' do
    from %r/\A(?!#)/
    to %r/(?=# Please enter the commit message)/
    rule do
      from %r/\G/
      to %r/^(?!\G)/
      rule do
        match %r/\G((fixup|squash)!)\s*/,
          1 => 'keyword.other.$2.git-commit'
      end
      rule 'invalid.illegal.line-too-long.git-commit' do
        match %r/.{66,}$/
      end
      rule 'invalid.deprecated.line-too-long.git-commit' do
        match %r/.{51,}$/
      end
    end
  end
  rule 'meta.scope.metadata.git-commit' do
    from %r/(?=# Please enter the commit message)/
    to %r/\z/
    include "#metadata"
  end

  fragment :metadata do
    rule do
      from %r/(?=^# Changes to be committed:)/
      to %r/(?!\G)((?=^# \w)|(?!^#))/
      rule do
        content_scope "comment.line.number-sign.git-commit"
        from %r/(^[ \t]+)?(?=#)/,
          1 => 'punctuation.whitespace.comment.leading.git-commit'
        to %r/(?!\G)^/
        rule 'punctuation.definition.comment.git-commit' do
          match %r/\G#/
        end
        rule 'markup.changed.git-commit' do
          match %r/((modified|renamed):.*)$\n?/
        end
        rule 'markup.inserted.git-commit' do
          match %r/(new file:.*)$\n?/
        end
        rule 'markup.deleted.git-commit' do
          match %r/(deleted:.*)$\n?/
        end
      end
    end
    rule do
      content_scope "comment.line.number-sign.git-commit"
      from %r/(^[ \t]+)?(?=#)/,
        1 => 'punctuation.whitespace.comment.leading.git-commit'
      to %r/(?!\G)^/
      rule 'punctuation.definition.comment.git-commit' do
        match %r/\G#/
      end
    end
    rule 'meta.embedded.diff.git-commit' do
      # diff presented at the end of the commit message when using commit -v.
      content_scope "source.diff"
      from %r/(?=diff\ \-\-git)/
      to %r/\z/
      include "source.diff"
    end
  end
end
