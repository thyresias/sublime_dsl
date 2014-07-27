# encoding: utf-8

language 'TOML' => 'source.toml' do
  file_types %w(toml)
  key_equivalent "^~T"  # TextMate only
  uuid "7DEF2EDB-5BB7-4DD2-9E78-3541A26B7923"  # TextMate only

  include "#comments"
  include "#groups"
  include "#key_pair"
  include "#invalid"

  fragment :comments do
    rule do
      from %r/(^[ \t]+)?(?=#)/,
        1 => 'punctuation.whitespace.comment.leading.toml'
      to %r/(?!\G)/
      rule 'comment.line.number-sign.toml' do
        from %r/#/,
          0 => 'punctuation.definition.comment.toml'
        to %r/\n/
      end
    end
  end

  fragment :groups do
    rule 'meta.group.toml' do
      match %r/^\s*(\[)([^\[\]]*)(\])/,
        1 => 'punctuation.definition.section.begin.toml',
        3 => 'punctuation.definition.section.begin.toml'
    end
  end

  fragment :invalid do
    rule 'invalid.illegal.not-allowed-here.toml' do
      match %r/\S+(\s*(?=\S))?/
    end
  end

  fragment :key_pair do
    rule do
      from %r/(\S+)\s*(=)\s*/
      to %r/(?<=\S)(?<!=)|$/
      both 1 => 'support.constant.toml',
           2 => 'punctuation.separator.key-value.toml'
      include "#primatives"
    end
  end

  fragment :primatives do
    rule 'string.quoted.double.toml' do
      from %r/\G"/,
        0 => 'punctuation.definition.string.begin.toml'
      to %r/"/,
        0 => 'punctuation.definition.string.end.toml'
      rule 'constant.character.escape.toml' do
        match %r/\\([tnr"\\]|x\h\h)/
      end
    end
    rule 'constant.other.date.toml' do
      match %r/\G[0-9]{4}-(0[1-9]|1[012])-(?!00|3[2-9])[0-3][0-9]T[0-9]{2}:[0-9]{2}:[0-9]{2}Z/
    end
    rule 'constant.language.boolean.toml' do
      match %r/\G(true|false)/
    end
    rule 'constant.numeric.float.toml' do
      match %r/\G-?[0-9]+\.[0-9]+/
    end
    rule 'constant.numeric.integer.toml' do
      match %r/\G-?[0-9]+/
    end
    rule 'meta.array.toml' do
      from %r/\G\[/,
        0 => 'punctuation.definition.array.begin.toml'
      to %r/\]/,
        0 => 'punctuation.definition.array.end.toml'
      rule do
        from %r/(?="|-?[0-9]|true|false|\[)/
        # FIXME: (warning) regular expression has ']' without escape
        to %r/,|(?=])/,
          0 => 'punctuation.separator.array.toml'
        include "#primatives"
        include "#comments"
        include "#invalid"
      end
      include "#comments"
      include "#invalid"
    end
  end
end
