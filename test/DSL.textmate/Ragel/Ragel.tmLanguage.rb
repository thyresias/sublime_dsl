# encoding: utf-8

language 'Ragel' => 'source.c.ragel' do
  file_types %w(rl ragel)
  key_equivalent "^~R"  # TextMate only
  uuid "F1172666-F07C-4F6A-B07D-E1AD08DE2070"  # TextMate only

  rule 'source.ragel' do
    from %r/%%{/
    to %r/}%%/
    both 0 => 'punctuation.section.embedded.ragel'
    include "#source_ragel"
  end
  rule 'source.ragel' do
    from %r/%%$/,
      0 => 'punctuation.section.embedded.ragel'
    to %r/$/
    include "#source_ragel"
  end
  rule 'support.function.ragel' do
    from %r/%%/,
      0 => 'punctuation.section.embedded.ragel'
    to %r/$/
    include "#keywords"
  end
  include "source.c"

  fragment :action_name do
    rule 'entity.name.type.action-reference.ragel' do
      # FIXME: (warning) character class has duplicated range
      match %r/([@$>%])\s*([\w\d]+)/,
        1 => 'punctuation.definition.entity.ragel'
    end
  end

  fragment :comments do
    rule 'comment.line.ragel' do
      from %r/#/,
        0 => 'punctuation.definition.comment.ragel'
      to %r/$\n?/
    end
  end

  fragment :embedded_code do
    rule 'source.c' do
      from %r/\{/,
        0 => 'punctuation.section.embedded.c'
      to %r/\}/
      include "source.c"
    end
  end

  fragment :keywords do
    rule 'keyword.other.ragel' do
      match %r/\b(machine|action|context|include|variable|access|write|contained)\b/
    end
  end

  fragment :operators do
    rule 'keyword.operator.contatenation.ragel' do
      match %r/(\:\>\>?|\<\:)/
    end
  end

  fragment :regexp do
    rule 'string.regexp.character-class.ragel' do
      from %r/\[/,
        0 => 'punctuation.definition.string.begin.ragel'
      to %r/\]\s*[*?]?/,
        0 => 'punctuation.definition.string.end.ragel'
    end
    rule 'string.regexp.classic.ragel' do
      from %r'\/',
        0 => 'punctuation.definition.string.begin.ragel'
      to %r'\/\s*[*?]?',
        0 => 'punctuation.definition.string.end.ragel'
    end
  end

  fragment :source_ragel do
    include "#keywords"
    include "#regexp"
    include "#string"
    include "#comments"
    include "#embedded_code"
    rule 'meta.function.action.ragel' do
      # FIXME: (warning) character class has duplicated range
      from %r/(action)\s+([\w\d]+)\s+({)/,
        1 => 'keyword.other.action.ragel',
        2 => 'entity.name.type.action.ragel',
        3 => 'punctuation.section.function.ragel'
      to %r/(})/,
        1 => 'punctuation.section.function.ragel'
      include "source.c"
    end
    rule 'meta.machine-definition.ragel' do
      # FIXME: (warning) character class has duplicated range
      from %r/([\w\d]+)\s*(=)/,
        1 => 'entity.name.type.machine-definition.ragel',
        2 => 'punctuation.separator.key-value.ragel'
      to %r/(;)/,
        1 => 'punctuation.terminator.machine-definition.ragel'
      include "#regexp"
      include "#string"
      include "#action_name"
      include "#embedded_code"
      include "#operators"
      include "#comments"
    end
    rule 'meta.machine-instantiation.ragel' do
      # FIXME: (warning) character class has duplicated range
      from %r/([\w\d]+)\s*(:=)/,
        1 => 'entity.name.type.machine-instantiation.ragel',
        2 => 'punctuation.separator.key-value.ragel'
      to %r/;/,
        1 => 'punctuation.terminator.machine-instantiation.ragel'
      include "#regexp"
      include "#string"
      include "#action_name"
      include "#embedded_code"
      include "#operators"
      include "#comments"
      rule 'meta.ragel.longest-match' do
        from %r/\|\*/
        to %r/\*\|/
        include "#source_ragel"
      end
    end
  end

  fragment :string do
    rule 'string.quoted.double.ragel' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.ragel'
      to %r/"/,
        0 => 'punctuation.definition.string.end.ragel'
      include "#string_escaped_char"
      include "#string_placeholder"
    end
    rule 'string.quoted.single.ragel' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.ragel'
      to %r/'/,
        0 => 'punctuation.definition.string.end.ragel'
      include "#string_escaped_char"
    end
  end

  fragment :string_escaped_char do
    rule 'constant.character.escape.ragel' do
      match %r/\\(\\|[abefnprtv'"?]|[0-3]\d{,2}|[4-7]\d?|x[a-fA-F0-9]{,2})/
    end
    rule 'invalid.illegal.unknown-escape.ragel' do
      match %r/\\./
    end
  end

  fragment :string_placeholder do
    rule 'constant.other.placeholder.ragel' do
      match %r/(?x)%
            (\d+\$)?                             # field (argument #)
            [#0\- +']*                           # flags
            [,;:_]?                              # separator character (AltiVec)
            ((-?\d+)|\*(-?\d+\$)?)?              # minimum field width
            (\.((-?\d+)|\*(-?\d+\$)?)?)?         # precision
            (hh|h|ll|l|j|t|z|q|L|vh|vl|v|hv|hl)? # length modifier
            [diouxXDOUeEfFgGaACcSspn%]           # conversion type
          /
    end
    rule 'invalid.illegal.placeholder.ragel' do
      match %r/%/
    end
  end
end
