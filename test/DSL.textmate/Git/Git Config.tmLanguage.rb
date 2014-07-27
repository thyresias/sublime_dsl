# encoding: utf-8

language 'Git Config' => 'source.git-config' do
  file_types %w(.git/config git/config .gitconfig etc/gitconfig .gitmodules)
  uuid "F0EFAC75-4357-45BD-AB08-682DAF8C6FBF"  # TextMate only

  include "#section"
  include "#comment"

  fragment :boolean do
    rule 'constant.language.boolean.git-config' do
      match %r/\b(?i:yes|no|0|1|true|false)\b/
    end
  end

  fragment :comment do
    rule do
      match %r/((#).*$\n?)|((;).*$\n?)/,
        1 => 'comment.line.number-sign.git-config',
        2 => 'punctuation.definition.comment.git-config',
        3 => 'comment.line.semi-colon.git-config',
        4 => 'punctuation.definition.comment.git-config'
    end
  end

  fragment :section do
    rule 'meta.section.git-config' do
      # FIXME: (warning) character class has duplicated range
      from %r/\[\s*([\w_-]+)(?:\s+((")(?:[^"\\]|\\["\\])*("))|\.([\w_-]+))?\s*\]/
      to %r/(?=\[)/
      both 1 => 'entity.name.section.git-config',
           2 => 'entity.name.section.subsection.git-config',
           3 => 'punctuation.definition.section.subsection.begin.git-config',
           4 => 'punctuation.definition.section.subsection.end.git-config',
           5 => 'entity.name.section.subsection.git-config'
      include "#value_pair"
      include "#comment"
    end
  end

  fragment :string do
    rule 'string.quoted.double.git-config' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.git-config'
      to %r/"/,
        0 => 'punctuation.definition.string.end.git-config'
      rule 'constant.character.escape.git-config' do
        match %r/\\[ntb"\\]/
      end
      rule 'invalid.illegal.unknown-escape.git-config' do
        match %r/\\./
      end
    end
  end

  fragment :value_pair do
    rule 'meta.value-pair.section-item.git-config' do
      from %r/([-\w]+)\s*(=)\s*(?!$)/
      to %r/$|(?=[#;])/
      both 1 => 'support.constant.git-config',
           2 => 'punctuation.separator.key-value.git-config'
      rule 'constant.character.escape.git-config' do
        match %r/\\[ntb"\\]/
      end
      include "#boolean"
      include "#string"
      include "#comment"
    end
  end
end
