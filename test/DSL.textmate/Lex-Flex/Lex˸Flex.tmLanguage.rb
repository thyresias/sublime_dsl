# encoding: utf-8

language 'Lex/Flex' => 'source.lex', file: 'Lex˸Flex' do
  file_types %w(l)
  key_equivalent "^~L"  # TextMate only
  uuid "92E842A0-9DE6-4D31-A6AC-1CDE0F9547C5"  # TextMate only

  rule 'meta.section.definitions.lex' do
    # first section of the file - definitions
    from %r/\A(?!%%$)/
    to %r/^(?=%%$)/
    include "#includes"
    rule 'comment.block.c.lex' do
      from %r'/\*'
      to %r'\*/|$'
    end
    rule 'meta.definition.lex' do
      from %r/^(?i)([a-z_][a-z0-9_-]*)(?=\s|$)/,
        1 => 'entity.name.function.lex'
      to %r/$/
      include "#regexp"
    end
    rule 'meta.start-condition.lex' do
      from %r/^(%[sx])(?=\s|$)/,
        1 => 'punctuation.definition.start-condition.lex'
      to %r/$/
      rule do
        match %r/(?i)[a-z_][a-z0-9_-]*/
      end
      rule 'invalid.illegal.lex' do
        match %r/\S/
      end
    end
    rule 'meta.options.lex' do
      from %r/^(%option)\s(?=\S)/,
        1 => 'keyword.other.option.lex'
      to %r/$/
      rule 'support.other.option.lex' do
        match %r/\b(?:(?:no)?(?:[78]bit|align|backup|batch|c\+\+|debug|default|ecs|fast|full|interactive|lex-compat|meta-ecs|perf-report|read|stdout|verbose|warn|array|pointer|input|unput|yy_(?:(?:push|pop|top)_state|scan_(?:buffer|bytes|string))|main|stack|stdinit|yylineno|yywrap)|(?:case(?:ful|less)|case-(?:in)?sensitive|(?:always|never)-interactive))\b/
      end
    end
    rule 'keyword.other.option.lex' do
      from %r/^%(?:array|pointer)/
      to %r/$/
      rule 'invalid.illegal.lex' do
        match %r/\S/
      end
    end
  end
  rule do
    from %r/^(%%)$/,
      1 => 'punctuation.separator.sections.lex'
    to %r/\Z.\A(?# never end)/
    rule 'meta.section.rules.lex' do
      # second section of the file - rules
      from %r/^(?!%%$)/
      to %r/^(?=%%$)/
      rule 'meta.rule.lex' do
        from %r/^(?!$)/
        to %r/$/
        include "#includes"
        rule do
          # rule pattern
          from %r/(?i)^(<(?:(?:[a-z_][a-z0-9_-]*,)*[a-z_][a-z0-9_-]|\*)>)?(?:(<<EOF>>)(\s*))?(?=\S)/,
            1 => 'keyword.other.start-condition.lex',
            2 => 'keyword.operator.eof.lex',
            3 => 'invalid.illegal.regexp.lex'
          to %r/(?=\s)|$/
          include "#regexp"
        end
        rule do
          # TODO: %} should override embedded scopes
          from %r/(%\{)/,
            1 => 'punctuation.definition.code.lex'
          to %r/(%\})(.*)/,
            1 => 'punctuation.terminator.code.lex',
            2 => 'invalid.illegal.ignored.lex'
          include "#csource"
        end
        rule 'meta.rule.action.lex' do
          # TODO: eol should override embedded scopes
          from %r/(?=\S)/
          to %r/$/
          include "#csource"
        end
      end
    end
    rule do
      # third section of the file - user code
      content_scope "meta.section.user-code.lex"
      from %r/^(%%)$/,
        1 => 'punctuation.separator.sections.lex'
      to %r/\Z.\A(?# never end)/
      include "#csource"
    end
  end

  fragment :csource do
    rule 'support.function.c.lex' do
      match %r/\b(?:ECHO|BEGIN|REJECT|YY_FLUSH_BUFFER|YY_BREAK|yy(?:more|less|unput|input|terminate|text|leng|restart|_(?:push|pop|top)_state|_(?:create|switch_to|flush|delete)_buffer|_scan_(?:string|bytes|buffer)|_set_(?:bol|interactive))(?=\(|$))\b/
    end
    include "source.c"
  end

  fragment :includes do
    rule 'meta.embedded.source.c.lex' do
      # TODO: $} should override the embedded scopes
      from %r/^%\{$/
      to %r/^%\}$/
      include "source.c"
    end
    rule 'meta.embedded.source.c.lex' do
      # TODO: eol should override the embedded scopes
      from %r/^[ \t]+/
      to %r/$/
      include "source.c"
    end
  end

  fragment :re_escape do
    rule 'constant.character.escape.lex' do
      match %r/\\(?i:[0-9]{1,3}|x[0-9a-f]{1,2}|.)/
    end
  end

  # FIXME: this fragment is never referenced
  fragment :rec_csource do
    rule do
      from %r/\{/
      to %r/\}/
      include "source.c"
      include "#csource"
    end
  end

  fragment :regexp do
    rule 'string.regexp.lex' do
      from %r/\G(?=\S)(\^)?/
      to %r/(\$)?(?:(?=\s)|$)/
      both 1 => 'keyword.control.anchor.regexp.lex'
      include "#subregexp"
    end
  end

  fragment :subregexp do
    include "#re_escape"
    rule 'constant.other.character-class.set.lex' do
      from %r/(\[)(\^)?-?/,
        1 => 'punctuation.definition.character-class.set.lex',
        2 => 'keyword.operator.negation.regexp.lex'
      to %r/-?(\])/,
        1 => 'punctuation.terminator.character-class.set.lex'
      include "#re_escape"
      rule 'constant.other.character-class.set.lex' do
        match %r/\[:(?:(?:alnum|alpha|blank|cntrl|x?digit|graph|lower|print|punct|space|upper)|(.*?)):\]/,
          1 => 'invalid.illegal.regexp.lex'
      end
    end
    rule 'variable.other.lex' do
      match %r/(?i){[a-z_][a-z0-9_-]*}/
    end
    rule 'keyword.operator.quantifier.regexp.lex' do
      from %r/\{/
      to %r/\}/
      rule do
        match %r/(?<=\{)[0-9]*(?:,[0-9]*)?(?=\})/
      end
      rule 'invalid.illegal.regexp.lex' do
        # {3} counts should only have digit[,digit]
        match %r/[^}]/
      end
    end
    rule 'string.quoted.double.regexp.lex' do
      from %r/"/
      to %r/"/
      include "#re_escape"
    end
    rule do
      # make ** or +? or other combinations illegal
      from %r/([*+?])(?=[*+?])/,
        1 => 'keyword.operator.quantifier.regexp.lex'
      to %r/(?=[^*+?])/
      rule 'invalid.illegal.regexp.lex' do
        match %r/./
      end
    end
    rule 'keyword.operator.quantifier.regexp.lex' do
      match %r/[*+?]/
    end
    rule 'invalid.illegal.regexp.lex' do
      # <<EOF>> is handled in the rule pattern
      match %r/<<EOF>>/
    end
    rule 'meta.group.regexp.lex' do
      from %r/(\()/,
        1 => 'punctuation.definition.group.regexp.lex'
      to %r/(\))|(?=\s)|$(?#end on whitespace because regex does)/,
        1 => 'punctuation.terminator.group.regexp.lex'
      rule 'invalid.illegal.regexp.lex' do
        match %r'/'
      end
      include "#subregexp"
    end
    rule do
      # detection of multiple trailing contexts
      from %r'(/)',
        1 => 'keyword.operator.trailing-match.regexp.lex'
      to %r/(?=\s)|$/
      rule 'invalid.illegal.regexp.lex' do
        match %r'/|\$(?!\S)'
      end
      include "#subregexp"
    end
  end
end
