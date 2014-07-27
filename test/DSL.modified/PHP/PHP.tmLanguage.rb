# encoding: utf-8

language 'PHP' => 'source.php' do
  # TODO:
  # • Try to improve parameters list syntax – scope numbers, ‘=’, ‘,’ and possibly be intelligent about entity ordering
  # • Is meta.function-call the correct scope? I've added it to my theme but by default it's not highlighted
  file_types %w(php)
  first_line_match %r/^#!.*(?<!-)php[0-9]{0,1}\b/
  folding_start_marker %r'(/\*|\{\s*$|<<<HTML)'
  folding_stop_marker %r'(\*/|^\s*\}|^HTML;)'
  uuid "22986475-8CA5-11D9-AEDD-000D93C8BE28"  # TextMate only

  rule do
    # Matches empty tags.
    match %r/(?x)
        (^\s*)?              # 1 - Leading whitespace
          (              # 2 - meta.embedded.line.empty.php
            (            # 3 - Open Tag
              (?:
                ((?<=\?>)<)    # 4 - Consecutive tags
                | <
              )
              \?(?i:php|=)?
            )
              (\s*)        # 5 - Loneliness
            ((\?)>)          # 6 - Close Tag
                        # 7 - Scope ? as scope.php
          )
        (
          \1              # Match nothing if there was no
                        #   leading whitespace...
          | (\s*$\n)?          # or match trailing whitespace.
        )
      /,
      1 => 'punctuation.whitespace.embedded.leading.php',
      2 => 'source.php.embedded.line.empty.html',
      3 => 'punctuation.section.embedded.begin.php',
      4 => 'meta.consecutive-tags.php',
      5 => 'source.php',
      6 => 'punctuation.section.embedded.end.php',
      7 => 'source.php',
      8 => 'punctuation.whitespace.embedded.trailing.php'
  end
  rule do
    # Catches tags with preceeding whitespace.
    from %r/^\s*(?=<\?)/,
      0 => 'punctuation.whitespace.embedded.leading.php'
    to %r/(?<=\?>)(\s*$\n)?/,
      0 => 'punctuation.whitespace.embedded.trailing.php'
    rule 'source.php.embedded.block.html' do
      from %r/<\?(?i:php|=)?/,
        0 => 'punctuation.section.embedded.begin.php'
      to %r/(\?)>/,
        0 => 'punctuation.section.embedded.end.php',
        1 => 'source.php'
      include "#language"
    end
  end
  rule 'source.php.embedded.line.html' do
    # Catches the remainder.
    from %r/(((?<=\?>)<)|<)\?(?i:php|=)?/,
      0 => 'punctuation.section.embedded.begin.php',
      2 => 'meta.consecutive-tags.php'
    to %r/(\?)>/,
      0 => 'punctuation.section.embedded.end.php',
      1 => 'source.php'
    include "#language"
  end

  idnext = "[[:alnum:]_]"       # was [a-zA-Z0-9_\x7f-\xff]
  id = "[[:alpha:]_]#{idnext}*" # was [a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*

  fragment :constants do
    rule 'constant.language.php' do
      match %r/(?i)\b(TRUE|FALSE|NULL|__(FILE|FUNCTION|CLASS|METHOD|LINE)__|ON|OFF|YES|NO|NL|BR|TAB)\b/
    end
    rule 'support.constant.core.php' do
      match %r/\b(DEFAULT_INCLUDE_PATH|E_(ALL|COMPILE_(ERROR|WARNING)|CORE_(ERROR|WARNING)|(RECOVERABLE_)?ERROR|NOTICE|PARSE|STRICT|USER_(ERROR|NOTICE|WARNING)|WARNING)|PEAR_(EXTENSION_DIR|INSTALL_DIR)|PHP_(BINDIR|CONFIG_FILE_PATH|DATADIR|E(OL|XTENSION_DIR)|L(IBDIR|OCALSTATEDIR)|O(S|UTPUT_HANDLER_CONT|UTPUT_HANDLER_END|UTPUT_HANDLER_START)|SYSCONFDIR|VERSION))\b/
    end
    rule 'support.constant.std.php' do
      match %r/\b(A(B(DAY_([1-7])|MON_([0-9]{1,2}))|LT_DIGITS|M_STR|SSERT_(ACTIVE|BAIL|CALLBACK|QUIET_EVAL|WARNING))|C(ASE_(LOWER|UPPER)|HAR_MAX|O(DESET|NNECTION_(ABORTED|NORMAL|TIMEOUT)|UNT_(NORMAL|RECURSIVE))|REDITS_(ALL|DOCS|FULLPAGE|GENERAL|GROUP|MODULES|QA|SAPI)|RNCYSTR|RYPT_(BLOWFISH|EXT_DES|MD5|SALT_LENGTH|STD_DES)|URRENCY_SYMBOL)|D(AY_([1-7])|ECIMAL_POINT|IRECTORY_SEPARATOR|_(FMT|T_FMT))|E(NT_(COMPAT|NOQUOTES|QUOTES)|RA(|_D_FMT|_D_T_FMT|_T_FMT|_YEAR)|XTR_(IF_EXISTS|OVERWRITE|PREFIX_(ALL|IF_EXISTS|INVALID|SAME)|SKIP))|FRAC_DIGITS|GROUPING|HTML_(ENTITIES|SPECIALCHARS)|IN(FO_(ALL|CONFIGURATION|CREDITS|ENVIRONMENT|GENERAL|LICENSE|MODULES|VARIABLES)|I_(ALL|PERDIR|SYSTEM|USER)|T_(CURR_SYMBOL|FRAC_DIGITS))|L(C_(ALL|COLLATE|CTYPE|MESSAGES|MONETARY|NUMERIC|TIME)|O(CK_(EX|NB|SH|UN)|G_(ALERT|AUTH(|PRIV)|CONS|CRIT|CRON|DAEMON|DEBUG|EMERG|ERR|INFO|KERN|LOCAL([0-7])|LPR|MAIL|NDELAY|NEWS|NOTICE|NOWAIT|ODELAY|PERROR|PID|SYSLOG|USER|UUCP|WARNING)))|M(ON_([0-9]{1,2}|DECIMAL_POINT|GROUPING|THOUSANDS_SEP)|YSQL_(ASSOC|BOTH|NUM)|_(1_PI|2_(PI|SQRTPI)|E|L(N10|N2|OG(10E|2E))|PI(|_2|_4)|SQRT1_2|SQRT2))|N(EGATIVE_SIGN|O(EXPR|STR)|_(CS_PRECEDES|SEP_BY_SPACE|SIGN_POSN))|P(ATH(INFO_(BASENAME|DIRNAME|EXTENSION|FILENAME)|_SEPARATOR)|M_STR|OSITIVE_SIGN|_(CS_PRECEDES|SEP_BY_SPACE|SIGN_POSN))|RADIXCHAR|S(EEK_(CUR|END|SET)|ORT_(ASC|DESC|NUMERIC|REGULAR|STRING)|TR_PAD_(BOTH|LEFT|RIGHT))|T(HOUS(ANDS_SEP|EP)|_(FMT(|_AMPM)))|YES(EXPR|STR))\b/
    end
    rule 'constant.other.php' do
      # In PHP, any identifier which is not a variable is taken to be a constant.
      #         However, if there is no constant defined with the given name then a notice
      #         is generated and the constant is assumed to have the value of its name.
      match %r/#{id}/
    end
  end

  fragment :"function-call" do
    rule 'meta.function-call.php' do
      match %r/[A-Za-z_][A-Za-z_0-9]*(?=\s*\()/
    end
  end

  fragment :instantiation do
    rule do
      match %r/(?i)\b(new)\s+(?:(\$#{id})|(\w+))|(\w+)(?=::)/,
        1 => 'keyword.other.new.php',
        2 => 'variable.other.php',
        3 => 'support.class.php',
        4 => 'support.class.php'
    end
  end

  fragment :interpolation do
    # http://www.php.net/manual/en/language.types.string.php#language.types.string.parsing
    rule 'constant.numeric.octal.php' do
      match %r/\\[0-7]{1,3}/
    end
    rule 'constant.numeric.hex.php' do
      match %r/\\x[0-9A-Fa-f]{1,2}/
    end
    rule 'constant.character.escape.php' do
      match %r/\\[nrt\\\$\"]/
    end
    rule do
      # Simple syntax with braces: "foo${bar}baz"
      match %r/(?x)
            ((\$\{)(?<name>#{id})(\}))
            /,
        1 => 'variable.other.php',
        2 => 'punctuation.definition.variable.php',
        4 => 'punctuation.definition.variable.php'
    end
    rule do
      # Simple syntax: $foo, $foo[0], $foo[$bar], $foo->bar
      match %r/(?x)
            ((\$)(?<name>#{id}))
            (?:
              (->)
                (?:
                  (\g<name>)
                  |
                  (\$\g<name>)
                )
              |
              (\[)
                (?:(\d+)|((\$)\g<name>)|(\w+)|(.*?))
              (\])
            )?
            /,
        1 => 'variable.other.php',
        2 => 'punctuation.definition.variable.php',
        4 => 'keyword.operator.class.php',
        5 => 'variable.other.property.php',
        6 => 'invalid.illegal.php',
        7 => 'keyword.operator.index-start.php',
        8 => 'constant.numeric.index.php',
        9 => 'variable.other.index.php',
        10 => 'punctuation.definition.variable.php',
        11 => 'string.unquoted.index.php',
        12 => 'invalid.illegal.invalid-simple-array-index.php',
        13 => 'keyword.operator.index-end.php'
    end
    rule do
      # Complex syntax. It seems this now supports complex method calls, as of PHP5.
      #                  I've put wildcards into the function call parameter lists to handle this, but this may break the pattern.
      #                  It also might be better to disable it as I shouldn't imagine it's used often (hopefully) and it may confuse PHP4 users.
      from %r/(?=(?<regex>(?#simple syntax)\$(?<name>#{id})(?:\[(?<index>#{idnext}+|\$\g<name>)\]|->\g<name>(\(.*?\))?)?|(?#simple syntax with braces)\$\{(?:\g<name>(?<indices>\[(?:\g<index>|'(?:\\.|[^'\\])*'|"(?:\g<regex>|\\.|[^"\\])*")\])?|\g<complex>|\$\{\g<complex>\})\}|(?#complex syntax)\{(?<complex>\$(?<segment>\g<name>(\g<indices>*|\(.*?\))?)(?:->\g<segment>)*|\$\g<complex>|\$\{\g<complex>\})\}))\{/
      to %r/\}/
      both 0 => 'punctuation.definition.variable.php'
      include "#function-call"
      include "#var_basic"
      include "#object"
      include "#numbers"
      rule 'keyword.operator.index-start.php' do
        match %r/\[/
      end
      rule 'keyword.operator.index-end.php' do
        match %r/\]/
      end
    end
  end

  fragment :language do
    rule 'string.unquoted.heredoc.php' do
      from %r/(?=<<<\s*(HTML|XML|SQL|JAVASCRIPT)\s*$)/
      to %r/(?!<?<<\s*(HTML|XML|SQL|JAVASCRIPT)\s*$)/
      rule 'meta.embedded.html' do
        content_scope "text.html"
        from %r/(<<<)\s*(HTML)\s*$\n?/,
          0 => 'punctuation.section.embedded.begin.php',
          1 => 'punctuation.definition.string.php',
          2 => 'keyword.operator.heredoc.php'
        to %r/^(HTML)(;?)$\n?/,
          0 => 'punctuation.section.embedded.end.php',
          1 => 'keyword.operator.heredoc.php',
          2 => 'punctuation.definition.string.php'
        include "text.html.basic"
        include "#interpolation"
      end
      rule 'meta.embedded.xml' do
        content_scope "text.xml"
        from %r/(<<<)\s*(XML)\s*$\n?/,
          0 => 'punctuation.section.embedded.begin.php',
          1 => 'punctuation.definition.string.php',
          2 => 'keyword.operator.heredoc.php'
        to %r/^(XML)(;?)$\n?/,
          0 => 'punctuation.section.embedded.end.php',
          1 => 'keyword.operator.heredoc.php',
          2 => 'punctuation.definition.string.php'
        include "text.xml"
        include "#interpolation"
      end
      rule 'meta.embedded.sql' do
        content_scope "source.sql"
        from %r/(<<<)\s*(SQL)\s*$\n?/,
          0 => 'punctuation.section.embedded.begin.php',
          1 => 'punctuation.definition.string.php',
          2 => 'keyword.operator.heredoc.php'
        to %r/^(SQL)(;?)$\n?/,
          0 => 'punctuation.section.embedded.end.php',
          1 => 'keyword.operator.heredoc.php',
          2 => 'punctuation.definition.string.php'
        include "source.sql"
        include "#interpolation"
      end
      rule 'meta.embedded.js' do
        content_scope "source.js"
        from %r/(<<<)\s*(JAVASCRIPT)\s*$\n?/,
          0 => 'punctuation.section.embedded.begin.php',
          1 => 'punctuation.definition.string.php',
          2 => 'keyword.operator.heredoc.php'
        to %r/^(JAVASCRIPT)(;?)$\n?/,
          0 => 'punctuation.section.embedded.end.php',
          1 => 'keyword.operator.heredoc.php',
          2 => 'punctuation.definition.string.php'
        include "source.js"
        include "#interpolation"
      end
    end
    rule 'comment.block.documentation.phpdoc.php' do
      # This now only highlights a docblock if the first line contains only /**
      #                 - this is to stop highlighting everything as invalid when people do comment banners with /******** ...
      #                 - Now matches /**#@+ too - used for docblock templates: http://manual.phpdoc.org/HTMLframesConverter/default/phpDocumentor/tutorial_phpDocumentor.howto.pkg.html#basics.docblocktemplate
      from %r'\/\*\*(?:\#@\+)?\s*$'
      to %r'\*/'
      both 0 => 'punctuation.definition.comment.php'
      include "#php_doc"
    end
    rule 'comment.block.php' do
      from %r'/\*'
      to %r'\*/'
      both 0 => 'punctuation.definition.comment.php'
    end
    rule 'comment.line.double-slash.php' do
      match %r'(//).*?($\n?|(?=\?>))',
        1 => 'punctuation.definition.comment.php'
    end
    rule 'comment.line.number-sign.php' do
      match %r/(#).*?($\n?|(?=\?>))/,
        1 => 'punctuation.definition.comment.php'
    end
    rule 'meta.interface.php' do
      from %r/^(?i)\s*(interface)\s+([a-z0-9_]+)\s*(extends)?\s*/,
        1 => 'storage.type.interface.php',
        2 => 'entity.name.type.interface.php',
        3 => 'storage.modifier.extends.php'
      to %r/$/
      rule 'entity.other.inherited-class.php' do
        match %r/[a-zA-Z0-9_]+/
      end
    end
    rule 'meta.class.php' do
      from %r/(?i)^\s*(abstract|final)?\s*(class)\s+([a-z0-9_]+)\s*/,
        1 => 'storage.modifier.abstract.php',
        2 => 'storage.type.class.php',
        3 => 'entity.name.type.class.php'
      to %r/$/
      rule do
        match %r/(?i:(extends))\s+([a-zA-Z0-9_]+)\s*/,
          1 => 'storage.modifier.extends.php',
          2 => 'entity.other.inherited-class.php'
      end
      rule do
        from %r/(?i:(implements))\s+([a-zA-Z0-9_]+)\s*/,
          1 => 'storage.modifier.implements.php',
          2 => 'support.class.implements.php'
        to %r/(?=\s*\b(?i:(extends)))|$/
        rule do
          match %r/,\s*([a-zA-Z0-9_]+)\s*/,
            1 => 'support.class.implements.php'
        end
      end
    end
    rule 'keyword.control.php' do
      match %r/\b(break|c(ase|ontinue)|d(e(clare|fault)|ie|o)|e(lse(if)?|nd(declare|for(each)?|if|switch|while)|xit)|for(each)?|if|return|switch|use|while)\b/
    end
    rule 'meta.include.php' do
      from %r/(?i)\b((?:require|include)(?:_once)?)\b\s*/,
        1 => 'keyword.control.import.include.php'
      to %r/(?=\s|;|$)/
      include "#language"
    end
    rule 'meta.catch.php' do
      match %r/\b(catch)\b\s*\(\s*([A-Za-z_][A-Za-z_0-9]*)\s*((\$+)#{id})\s*\)/,
        1 => 'keyword.control.exception.php',
        2 => 'support.class.php',
        3 => 'variable.other.php',
        4 => 'punctuation.definition.variable.php'
    end
    rule 'keyword.control.exception.php' do
      match %r/\b(catch|try|throw|exception)\b/
    end
    rule 'meta.function.php' do
      content_scope "meta.function.arguments.php"
      from %r/(?:^\s*)((?:(?:final|abstract|public|private|protected|static)\s+)*)(function)(?:\s+|(\s*&\s*))(?:(__(?:call|(?:con|de)struct|get|(?:is|un)?set|tostring|clone|set_state|sleep|wakeup|autoload))|([a-zA-Z0-9_]+))\s*(\()/,
        1 => 'storage.modifier.php',
        2 => 'storage.type.function.php',
        3 => 'storage.modifier.reference.php',
        4 => 'support.function.magic.php',
        5 => 'entity.name.function.php',
        6 => 'punctuation.definition.parameters.begin.php'
      to %r/\)/,
        1 => 'punctuation.definition.parameters.end.php'
      rule 'meta.function.argument.array.php' do
        content_scope "meta.array.php"
        from %r/(?x)
                  \s*(array) # Typehint
                  \s*(&)?           # Reference
                  \s*((\$+)#{id}) # The variable name
                  \s*(=)  # A default value
                  \s*(array)\s*(\()
                  /,
          1 => 'storage.type.php',
          2 => 'storage.modifier.php',
          3 => 'variable.other.php',
          4 => 'punctuation.definition.variable.php',
          5 => 'keyword.operator.assignment.php',
          6 => 'support.function.construct.php',
          7 => 'punctuation.definition.array.begin.php'
        to %r/\)/,
          0 => 'punctuation.definition.array.end.php'
        include "#strings"
        include "#numbers"
      end
      rule 'meta.function.argument.array.php' do
        match %r/(?x)
                  \s*(array) # Typehint
                  \s*(&)?           # Reference
                  \s*((\$+)#{id}) # The variable name
                  (?:
                    \s*(=)  # A default value
                    \s*(?i:
                      (NULL)
                      |
                      (\S.*?)
                      )?
                  )?
                  \s*(?=,|\)) # A closing parentheses (end of argument list) or a comma
                  /,
          1 => 'storage.type.php',
          2 => 'storage.modifier.php',
          3 => 'variable.other.php',
          4 => 'punctuation.definition.variable.php',
          5 => 'keyword.operator.assignment.php',
          6 => 'constant.language.php',
          7 => 'invalid.illegal.non-null-typehinted.php'
      end
      rule 'meta.function.argument.typehinted.php' do
        match %r/(?x)
                  \s*([A-Za-z_][A-Za-z_0-9]*) # Typehinted class name
                  \s*(&)?           # Reference
                  \s*((\$+)#{id}) # The variable name
                  (?:
                    \s*(=)  # A default value
                    \s*(?i:
                      (NULL)
                      |
                      (\S.*?)
                      )?
                  )?
                  \s*(?=,|\)) # A closing parentheses (end of argument list) or a comma
                  /,
          1 => 'support.class.php',
          2 => 'storage.modifier.php',
          3 => 'variable.other.php',
          4 => 'punctuation.definition.variable.php',
          5 => 'keyword.operator.assignment.php',
          6 => 'constant.language.php',
          7 => 'invalid.illegal.non-null-typehinted.php'
      end
      rule 'meta.function.argument.no-default.php' do
        match %r/(\s*&)?\s*((\$+)#{id})\s*(?=,|\))/,
          1 => 'storage.modifier.php',
          2 => 'variable.other.php',
          3 => 'punctuation.definition.variable.php'
      end
      rule 'meta.function.argument.default.php' do
        from %r/(\s*&)?\s*((\$+)#{id})(?:\s*(=)\s*)\s*/
        to %r/(?=,|\))/
        both 1 => 'storage.modifier.php',
             2 => 'variable.other.php',
             3 => 'punctuation.definition.variable.php',
             4 => 'keyword.operator.assignment.php'
        include "#parameter-default-types"
      end
      rule 'comment.block.php' do
        from %r'/\*'
        to %r'\*/'
        both 0 => 'punctuation.definition.comment.php'
      end
    end
    rule 'storage.type.php' do
      match %r/(?i)\b(real|double|float|int(eger)?|bool(ean)?|string|class|clone|var|function|interface|parent|self|object)\b/
    end
    rule 'storage.modifier.php' do
      match %r/(?i)\b(global|abstract|const|extends|implements|final|p(r(ivate|otected)|ublic)|static)\b/
    end
    include "#object"
    rule do
      match %r/(?x)(::)
                        (?:
                    ([A-Za-z_][A-Za-z_0-9]*)\s*\(
                    |
                    ((\$+)#{id})
                    |
                    (#{id})
                )?/,
        1 => 'keyword.operator.class.php',
        2 => 'meta.function-call.static.php',
        3 => 'variable.other.class.php',
        4 => 'punctuation.definition.variable.php',
        5 => 'constant.other.class.php'
    end
    include "#support"
    rule 'string.unquoted.heredoc.php' do
      from %r/(<<<)\s*([a-zA-Z_]+[a-zA-Z0-9_]*)/,
        1 => 'punctuation.definition.string.php',
        2 => 'keyword.operator.heredoc.php'
      to %r/^(\2)(;?)$/,
        1 => 'keyword.operator.heredoc.php',
        2 => 'punctuation.definition.string.php'
      include "#interpolation"
    end
    rule 'keyword.operator.key.php' do
      match %r/=>/
    end
    rule 'storage.modifier.reference.php' do
      match %r/&(?=\s*(\$|new|[A-Za-z_][A-Za-z_0-9]+(?=\s*\()))/
    end
    rule 'punctuation.terminator.expression.php' do
      match %r/;/
    end
    rule 'keyword.operator.error-control.php' do
      match %r/(@)/
    end
    rule 'keyword.operator.increment-decrement.php' do
      match %r/(\-\-|\+\+)/
    end
    rule 'keyword.operator.arithmetic.php' do
      match %r'(\-|\+|\*|/|%)'
    end
    rule 'keyword.operator.logical.php' do
      match %r/(?i)(!|&&|\|\|)|\b(and|or|xor|as)\b/
    end
    rule 'keyword.operator.bitwise.php' do
      match %r/<<|>>|~|\^|&|\|/
    end
    rule 'keyword.operator.comparison.php' do
      match %r/(===|==|!==|!=|<=|>=|<>|<|>)/
    end
    rule 'keyword.operator.string.php' do
      match %r/(\.=|\.)/
    end
    rule 'keyword.operator.assignment.php' do
      match %r/=/
    end
    rule do
      match %r/(?i)\b(instanceof)\b(?:\s+(\w+))?/,
        1 => 'keyword.operator.type.php',
        2 => 'support.class.php'
    end
    include "#numbers"
    include "#strings"
    include "#string-backtick"
    include "#function-call"
    include "#variables"
    rule do
      match %r/(?<=#{idnext})(->)(#{id}?)\b/,
        1 => 'keyword.operator.php',
        2 => 'variable.other.property.php'
    end
    include "#instantiation"
    include "#constants"
  end

  fragment :numbers do
    rule 'constant.numeric.php' do
      match %r/\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)\b/
    end
  end

  fragment :object do
    rule do
      match %r/(?x)(->)
            (?:
                ([A-Za-z_][A-Za-z_0-9]*)\s*\(
                |
                ((\$+)?#{id})
            )?/,
        1 => 'keyword.operator.class.php',
        2 => 'meta.function-call.object.php',
        3 => 'variable.other.property.php',
        4 => 'punctuation.definition.variable.php'
    end
  end

  fragment :"parameter-default-types" do
    include "#strings"
    include "#numbers"
    include "#string-backtick"
    include "#variables"
    rule 'keyword.operator.key.php' do
      match %r/=>/
    end
    rule 'keyword.operator.assignment.php' do
      match %r/=/
    end
    rule 'storage.modifier.reference.php' do
      match %r/&(?=\s*\$)/
    end
    rule 'meta.array.php' do
      from %r/(array)\s*(\()/,
        1 => 'support.function.construct.php',
        2 => 'punctuation.definition.array.begin.php'
      to %r/\)/,
        0 => 'punctuation.definition.array.end.php'
      include "#parameter-default-types"
    end
    include "#instantiation"
    include "#constants"
  end

  fragment :php_doc do
    rule 'invalid.illegal.missing-asterisk.phpdoc.php' do
      # PHPDocumentor only recognises lines with an asterisk as the first non-whitespaces character
      match %r/^(?!\s*\*).*$\n?/
    end
    rule do
      match %r/^\s*\*\s*(@access)\s+((public|private|protected)|(.+))\s*$/,
        1 => 'keyword.other.phpdoc.php',
        3 => 'storage.modifier.php',
        4 => 'invalid.illegal.wrong-access-type.phpdoc.php'
    end
    rule 'markup.underline.link.php' do
      match %r'((https?|s?ftp|ftps|file|smb|afp|nfs|(x-)?man|gopher|txmt)://|mailto:)[-:@a-zA-Z0-9_.~%+/?=&#]+(?<![.?:])'
    end
    rule do
      match %r/(@xlink)\s+(.+)\s*$/,
        1 => 'keyword.other.phpdoc.php',
        2 => 'markup.underline.link.php'
    end
    rule 'keyword.other.phpdoc.php' do
      match %r/\@(a(bstract|uthor)|c(ategory|opyright)|example|global|internal|li(cense|nk)|pa(ckage|ram)|return|s(ee|ince|tatic|ubpackage)|t(hrows|odo)|v(ar|ersion)|uses|deprecated|final)\b/
    end
    rule 'meta.tag.inline.phpdoc.php' do
      match %r/\{(@(link)).+?\}/,
        1 => 'keyword.other.phpdoc.php'
    end
  end

  fragment :"regex-double-quoted" do
    rule 'string.regexp.double-quoted.php' do
      from %r'(?x)"/ (?= (\\.|[^"/])++/[imsxeADSUXu]*" )',
        0 => 'punctuation.definition.string.begin.php'
      to %r'(/)([imsxeADSUXu]*)(")',
        0 => 'punctuation.definition.string.end.php'
      rule 'constant.character.escape.regex.php' do
        # Escaped from the regexp – there can also be 2 backslashes (since 1 will escape the first)
        match %r/(\\){1,2}[.$^\[\]{}]/
      end
      include "#interpolation"
      rule 'string.regexp.arbitrary-repitition.php' do
        match %r/(\{)\d+(,\d+)?(\})/,
          1 => 'punctuation.definition.arbitrary-repitition.php',
          3 => 'punctuation.definition.arbitrary-repitition.php'
      end
      rule 'string.regexp.character-class.php' do
        from %r/\[(?:\^?\])?/
        to %r/\]/
        both 0 => 'punctuation.definition.character-class.php'
        include "#interpolation"
      end
      rule 'keyword.operator.regexp.php' do
        match %r/[$^+*]/
      end
    end
  end

  fragment :"regex-single-quoted" do
    rule 'string.regexp.single-quoted.php' do
      from %r:(?x)'/ (?= (\\.|[^'/])++/[imsxeADSUXu]*' ):,
        0 => 'punctuation.definition.string.begin.php'
      to %r:(/)([imsxeADSUXu]*)('):,
        0 => 'punctuation.definition.string.end.php'
      rule 'string.regexp.arbitrary-repitition.php' do
        match %r/(\{)\d+(,\d+)?(\})/,
          1 => 'punctuation.definition.arbitrary-repitition.php',
          3 => 'punctuation.definition.arbitrary-repitition.php'
      end
      rule 'constant.character.escape.regex.php' do
        # Escaped from the regexp – there can also be 2 backslashes (since 1 will escape the first)
        match %r/(\\){1,2}[.$^\[\]{}]/
      end
      rule 'constant.character.escape.php' do
        # Escaped from the PHP string – there can also be 2 backslashes (since 1 will escape the first)
        match %r/\\{1,2}[\\']/
      end
      rule 'string.regexp.character-class.php' do
        from %r/\[(?:\^?\])?/
        to %r/\]/
        both 0 => 'punctuation.definition.character-class.php'
        rule 'constant.character.escape.php' do
          match %r/\\[\\'\[\]]/
        end
      end
      rule 'keyword.operator.regexp.php' do
        match %r/[$^+*]/
      end
    end
  end

  fragment :"sql-string-double-quoted" do
    rule 'string.quoted.double.sql.php' do
      content_scope "source.sql.embedded.php"
      from %r/"\s*(?=(SELECT|INSERT|UPDATE|DELETE|CREATE|REPLACE|ALTER)\b)/,
        0 => 'punctuation.definition.string.begin.php'
      to %r/"/,
        0 => 'punctuation.definition.string.end.php'
      rule 'comment.line.number-sign.sql' do
        match %r/#(\\"|[^"])*(?="|$\n?)/
      end
      rule 'comment.line.double-dash.sql' do
        match %r/--(\\"|[^"])*(?="|$\n?)/
      end
      rule 'string.quoted.single.unclosed.sql' do
        # Unclosed strings must be captured to avoid them eating the remainder of the PHP script
        #           Sample case: $sql = "SELECT * FROM bar WHERE foo = '" . $variable . "'"
        from %r/'(?=[^']*?")/
        to %r/(?=")/
        rule 'constant.character.escape.php' do
          match %r/\\[\\']/
        end
      end
      rule 'string.quoted.other.backtick.unclosed.sql' do
        # Unclosed strings must be captured to avoid them eating the remainder of the PHP script
        #           Sample case: $sql = "SELECT * FROM bar WHERE foo = '" . $variable . "'"
        from %r/`(?=[^`]*?")/
        to %r/(?=")/
        rule 'constant.character.escape.php' do
          match %r/\\[\\']/
        end
      end
      rule 'string.quoted.double.unclosed.sql' do
        # Unclosed strings must be captured to avoid them eating the remainder of the PHP script
        #           Sample case: $sql = "SELECT * FROM bar WHERE foo = '" . $variable . "'"
        from %r/\\"(?!([^\\"]|\\[^"])*\\")(?=(\\[^"]|.)*?")/
        to %r/(?=")/
        rule 'constant.character.escape.php' do
          match %r/\\[\\']/
        end
      end
      rule 'string.quoted.double.sql' do
        from %r/\\"/
        to %r/\\"/
        both 0 => 'constant.character.escape.php'
        include "#interpolation"
      end
      rule 'string.quoted.other.backtick.sql' do
        from %r/`/
        to %r/`/
        include "#interpolation"
      end
      rule 'string.quoted.single.sql' do
        from %r/'/
        to %r/'/
        include "#interpolation"
      end
      rule 'constant.character.escape.php' do
        match %r/\\./
      end
      include "#interpolation"
      include "source.sql"
    end
  end

  fragment :"sql-string-single-quoted" do
    rule 'string.quoted.single.sql.php' do
      content_scope "source.sql.embedded.php"
      from %r/'\s*(?=(SELECT|INSERT|UPDATE|DELETE|CREATE|REPLACE|ALTER)\b)/,
        0 => 'punctuation.definition.string.begin.php'
      to %r/'/,
        0 => 'punctuation.definition.string.end.php'
      rule 'comment.line.number-sign.sql' do
        match %r/#(\\'|[^'])*(?='|$\n?)/
      end
      rule 'comment.line.double-dash.sql' do
        match %r/--(\\'|[^'])*(?='|$\n?)/
      end
      rule 'string.quoted.single.unclosed.sql' do
        # Unclosed strings must be captured to avoid them eating the remainder of the PHP script
        #           Sample case: $sql = "SELECT * FROM bar WHERE foo = '" . $variable . "'"
        from %r/\\'(?!([^\\']|\\[^'])*\\')(?=(\\[^']|.)*?')/
        to %r/(?=')/
        rule 'constant.character.escape.php' do
          match %r/\\[\\']/
        end
      end
      rule 'string.quoted.other.backtick.unclosed.sql' do
        # Unclosed strings must be captured to avoid them eating the remainder of the PHP script
        #           Sample case: $sql = "SELECT * FROM bar WHERE foo = '" . $variable . "'"
        from %r/`(?=[^`]*?')/
        to %r/(?=')/
        rule 'constant.character.escape.php' do
          match %r/\\[\\']/
        end
      end
      rule 'string.quoted.double.unclosed.sql' do
        # Unclosed strings must be captured to avoid them eating the remainder of the PHP script
        #           Sample case: $sql = "SELECT * FROM bar WHERE foo = '" . $variable . "'"
        from %r/"(?=[^"]*?')/
        to %r/(?=')/
        rule 'constant.character.escape.php' do
          match %r/\\[\\']/
        end
      end
      rule 'string.quoted.single.sql' do
        from %r/\\'/
        to %r/\\'/
        both 0 => 'constant.character.escape.php'
      end
      rule 'constant.character.escape.php' do
        match %r/\\[\\']/
      end
      include "source.sql"
    end
  end

  fragment :"string-backtick" do
    rule 'string.interpolated.php' do
      from %r/`/,
        0 => 'punctuation.definition.string.begin.php'
      to %r/`/,
        0 => 'punctuation.definition.string.end.php'
      rule 'constant.character.escape.php' do
        match %r/\\./
      end
      include "#interpolation"
    end
  end

  fragment :"string-double-quoted" do
    rule 'string.quoted.double.php' do
      # This contentName is just to allow the usage of “select scope” to select the string contents first, then the string with quotes
      content_scope "meta.string-contents.quoted.double.php"
      from %r/"/,
        0 => 'punctuation.definition.string.begin.php'
      to %r/"/,
        0 => 'punctuation.definition.string.end.php'
      include "#interpolation"
    end
  end

  fragment :"string-single-quoted" do
    rule 'string.quoted.single.php' do
      content_scope "meta.string-contents.quoted.single.php"
      from %r/'/,
        0 => 'punctuation.definition.string.begin.php'
      to %r/'/,
        0 => 'punctuation.definition.string.end.php'
      rule 'constant.character.escape.php' do
        match %r/\\[\\']/
      end
    end
  end

  fragment :strings do
    include "#regex-double-quoted"
    include "#sql-string-double-quoted"
    include "#string-double-quoted"
    include "#regex-single-quoted"
    include "#sql-string-single-quoted"
    include "#string-single-quoted"
  end

  fragment :support do
    rule 'meta.array.php' do
      from %r/(array)(\()/,
        1 => 'support.function.construct.php',
        2 => 'punctuation.definition.array.begin.php'
      to %r/\)/,
        0 => 'punctuation.definition.array.end.php'
      include "#language"
    end
    rule 'support.function.array.php' do
      match %r/(?i)\b(s(huffle|ort)|n(ext|at(sort|casesort))|c(o(unt|mpact)|urrent)|in_array|u(sort|ksort|asort)|prev|e(nd|xtract)|k(sort|ey|rsort)|a(sort|r(sort|ray_(s(hift|um|plice|earch|lice)|c(h(unk|ange_key_case)|o(unt_values|mbine))|intersect(_(u(key|assoc)|key|assoc))?|diff(_(u(key|assoc)|key|assoc))?|u(n(shift|ique)|intersect(_(uassoc|assoc))?|diff(_(uassoc|assoc))?)|p(op|ush|ad|roduct)|values|key(s|_exists)|f(il(ter|l(_keys)?)|lip)|walk(_recursive)?|r(e(duce|verse)|and)|m(ultisort|erge(_recursive)?|ap))))|r(sort|eset|ange)|m(in|ax))(?=\s*\()/
    end
    rule 'support.function.assert.php' do
      match %r/(?i)\bassert(_options)?(?=\s*\()/
    end
    rule 'support.function.attr.php' do
      match %r/(?i)\bdom_attr_is_id(?=\s*\()/
    end
    rule 'support.function.base64.php' do
      match %r/(?i)\bbase64_(decode|encode)(?=\s*\()/
    end
    rule 'support.function.basic_functions.php' do
      match %r/(?i)\b(highlight_(string|file)|s(ys_getloadavg|et_(include_path|magic_quotes_runtime)|leep)|c(on(stant|nection_(status|aborted))|all_user_(func(_array)?|method(_array)?))|time_(sleep_until|nanosleep)|i(s_uploaded_file|n(i_(set|restore|get(_all)?)|et_(ntop|pton))|p2long|gnore_user_abort|mport_request_variables)|u(sleep|nregister_tick_function)|error_(log|get_last)|p(hp_strip_whitespace|utenv|arse_ini_file|rint_r)|flush|long2ip|re(store_include_path|gister_(shutdown_function|tick_function))|get(servby(name|port)|opt|_(c(urrent_user|fg_var)|include_path|magic_quotes_(gpc|runtime))|protobyn(umber|ame)|env)|move_uploaded_file)(?=\s*\()/
    end
    rule 'support.function.bcmath.php' do
      match %r/(?i)\bbc(s(cale|ub|qrt)|comp|div|pow(mod)?|add|m(od|ul))(?=\s*\()/
    end
    rule 'support.function.birdstep.php' do
      match %r/(?i)\bbirdstep_(c(o(nnect|mmit)|lose)|off_autocommit|exec|f(ieldn(um|ame)|etch|reeresult)|autocommit|r(ollback|esult))(?=\s*\()/
    end
    rule 'support.function.browscap.php' do
      match %r/(?i)\bget_browser(?=\s*\()/
    end
    rule 'support.function.builtin_functions.php' do
      match %r/(?i)\b(s(tr(nc(asecmp|mp)|c(asecmp|mp)|len)|et_e(rror_handler|xception_handler))|c(lass_exists|reate_function)|trigger_error|i(s_(subclass_of|a)|nterface_exists)|de(fine(d)?|bug_(print_backtrace|backtrace))|zend_version|property_exists|e(ach|rror_reporting|xtension_loaded)|func(tion_exists|_(num_args|get_arg(s)?))|leak|restore_e(rror_handler|xception_handler)|get_(class(_(vars|methods))?|included_files|de(clared_(classes|interfaces)|fined_(constants|vars|functions))|object_vars|extension_funcs|parent_class|loaded_extensions|resource_type)|method_exists)(?=\s*\()/
    end
    rule 'support.function.bz2.php' do
      match %r/(?i)\bbz(compress|decompress|open|err(str|no|or)|read)(?=\s*\()/
    end
    rule 'support.function.cal_unix.php' do
      match %r/(?i)\b(jdtounix|unixtojd)(?=\s*\()/
    end
    rule 'support.function.calendar.php' do
      match %r/(?i)\b(cal_(to_jd|info|days_in_month|from_jd)|j(d(to(j(ulian|ewish)|french|gregorian)|dayofweek|monthname)|uliantojd|ewishtojd)|frenchtojd|gregoriantojd)(?=\s*\()/
    end
    rule 'support.function.characterdata.php' do
      match %r/(?i)\bdom_characterdata_(substring_data|insert_data|delete_data|append_data|replace_data)(?=\s*\()/
    end
    rule 'support.function.com_com.php' do
      match %r/(?i)\bcom_(create_guid|print_typeinfo|event_sink|load_typelib|get_active_object|message_pump)(?=\s*\()/
    end
    rule 'support.function.com_variant.php' do
      match %r/(?i)\bvariant_(s(ub|et(_type)?)|n(ot|eg)|c(a(st|t)|mp)|i(nt|div|mp)|or|d(iv|ate_(to_timestamp|from_timestamp))|pow|eqv|fix|a(nd|dd|bs)|get_type|round|xor|m(od|ul))(?=\s*\()/
    end
    rule 'support.function.crc32.php' do
      match %r/(?i)\bcrc32(?=\s*\()/
    end
    rule 'support.function.crypt.php' do
      match %r/(?i)\bcrypt(?=\s*\()/
    end
    rule 'support.function.ctype.php' do
      match %r/(?i)\bctype_(space|cntrl|digit|upper|p(unct|rint)|lower|al(num|pha)|graph|xdigit)(?=\s*\()/
    end
    rule 'support.function.cyr_convert.php' do
      match %r/(?i)\bconvert_cyr_string(?=\s*\()/
    end
    rule 'support.function.datetime.php' do
      match %r/(?i)\bstrptime(?=\s*\()/
    end
    rule 'support.function.dba.php' do
      match %r/(?i)\bdba_(handlers|sync|nextkey|close|insert|delete|op(timize|en)|exists|popen|key_split|f(irstkey|etch)|list|replace)(?=\s*\()/
    end
    rule 'support.function.dbase.php' do
      match %r/(?i)\bdbase_(num(fields|records)|c(lose|reate)|delete_record|open|pack|add_record|get_(header_info|record(_with_names)?)|replace_record)(?=\s*\()/
    end
    rule 'support.function.dir.php' do
      match %r/(?i)\b(scandir|c(h(dir|root)|losedir)|dir|opendir|re(addir|winddir)|g(etcwd|lob))(?=\s*\()/
    end
    rule 'support.function.dl.php' do
      match %r/(?i)\bdl(?=\s*\()/
    end
    rule 'support.function.dns.php' do
      match %r/(?i)\b(dns_(check_record|get_(record|mx))|gethostby(name(l)?|addr))(?=\s*\()/
    end
    rule 'support.function.document.php' do
      match %r/(?i)\bdom_document_(s(chema_validate(_file)?|ave(_html(_file)?|xml)?)|normalize_document|create_(c(datasection|omment)|text_node|document_fragment|processing_instruction|e(ntity_reference|lement(_ns)?)|attribute(_ns)?)|import_node|validate|load(_html(_file)?|xml)?|adopt_node|re(name_node|laxNG_validate_(file|xml))|get_element(s_by_tag_name(_ns)?|_by_id)|xinclude)(?=\s*\()/
    end
    rule 'support.function.domconfiguration.php' do
      match %r/(?i)\bdom_domconfiguration_(set_parameter|can_set_parameter|get_parameter)(?=\s*\()/
    end
    rule 'support.function.domerrorhandler.php' do
      match %r/(?i)\bdom_domerrorhandler_handle_error(?=\s*\()/
    end
    rule 'support.function.domimplementation.php' do
      match %r/(?i)\bdom_domimplementation_(has_feature|create_document(_type)?|get_feature)(?=\s*\()/
    end
    rule 'support.function.domimplementationlist.php' do
      match %r/(?i)\bdom_domimplementationlist_item(?=\s*\()/
    end
    rule 'support.function.domimplementationsource.php' do
      match %r/(?i)\bdom_domimplementationsource_get_domimplementation(s)?(?=\s*\()/
    end
    rule 'support.function.domstringlist.php' do
      match %r/(?i)\bdom_domstringlist_item(?=\s*\()/
    end
    rule 'support.function.easter.php' do
      match %r/(?i)\beaster_da(ys|te)(?=\s*\()/
    end
    rule 'support.function.element.php' do
      match %r/(?i)\bdom_element_(has_attribute(_ns)?|set_(id_attribute(_n(s|ode))?|attribute(_n(s|ode(_ns)?))?)|remove_attribute(_n(s|ode))?|get_(elements_by_tag_name(_ns)?|attribute(_n(s|ode(_ns)?))?))(?=\s*\()/
    end
    rule 'support.function.exec.php' do
      match %r/(?i)\b(s(hell_exec|ystem)|p(assthru|roc_nice)|e(scapeshell(cmd|arg)|xec))(?=\s*\()/
    end
    rule 'support.function.exif.php' do
      match %r/(?i)\bexif_(imagetype|t(humbnail|agname)|read_data)(?=\s*\()/
    end
    rule 'support.function.fdf.php' do
      match %r/(?i)\bfdf_(header|s(et_(s(tatus|ubmit_form_action)|target_frame|o(n_import_javascript|pt)|javascript_action|encoding|v(ersion|alue)|f(ile|lags)|ap)|ave(_string)?)|next_field_name|c(lose|reate)|open(_string)?|e(num_values|rr(no|or))|add_(template|doc_javascript)|remove_item|get_(status|opt|encoding|v(ersion|alue)|f(ile|lags)|a(ttachment|p)))(?=\s*\()/
    end
    rule 'support.function.file.php' do
      match %r/(?i)\b(sys_get_temp_dir|copy|t(empnam|mpfile)|u(nlink|mask)|p(close|open)|f(s(canf|tat|eek)|nmatch|close|t(ell|runcate)|ile(_(put_contents|get_contents))?|open|p(utcsv|assthru)|eof|flush|write|lock|read|get(s(s)?|c(sv)?))|r(e(name|a(dfile|lpath)|wind)|mdir)|get_meta_tags|mkdir)(?=\s*\()/
    end
    rule 'support.function.filestat.php' do
      match %r/(?i)\b(stat|c(h(own|grp|mod)|learstatcache)|is_(dir|executable|file|link|writable|readable)|touch|disk_(total_space|free_space)|file(size|ctime|type|inode|owner|_exists|perms|atime|group|mtime)|l(stat|chgrp))(?=\s*\()/
    end
    rule 'support.function.filter.php' do
      match %r/(?i)\bfilter_(has_var|input(_array)?|var(_array)?)(?=\s*\()/
    end
    rule 'support.function.formatted_print.php' do
      match %r/(?i)\b(sprintf|printf|v(sprintf|printf|fprintf)|fprintf)(?=\s*\()/
    end
    rule 'support.function.fsock.php' do
      match %r/(?i)\b(pfsockopen|fsockopen)(?=\s*\()/
    end
    rule 'support.function.ftok.php' do
      match %r/(?i)\bftok(?=\s*\()/
    end
    rule 'support.function.gd.php' do
      match %r/(?i)\b(image(s(y|tring(up)?|et(style|t(hickness|ile)|pixel|brush)|avealpha|x)|c(har(up)?|o(nvolution|py(res(ized|ampled)|merge(gray)?)?|lor(s(total|et|forindex)|closest(hwb|alpha)?|transparent|deallocate|exact(alpha)?|a(t|llocate(alpha)?)|resolve(alpha)?|match))|reate(truecolor|from(string|jpeg|png|wbmp|g(if|d(2(part)?)?)|x(pm|bm)))?)|2wbmp|t(ypes|tf(text|bbox)|ruecolortopalette)|i(struecolor|nterlace)|d(estroy|ashedline)|jpeg|ellipse|p(s(slantfont|copyfont|text|e(ncodefont|xtendfont)|freefont|loadfont|bbox)|ng|olygon|alettecopy)|f(t(text|bbox)|il(ter|l(toborder|ed(polygon|ellipse|arc|rectangle))?)|ont(height|width))|wbmp|a(ntialias|lphablending|rc)|l(ine|oadfont|ayereffect)|r(otate|ectangle)|g(if|d(2)?|ammacorrect|rab(screen|window))|xbm)|jpeg2wbmp|png2wbmp|gd_info)(?=\s*\()/
    end
    rule 'support.function.gettext.php' do
      match %r/(?i)\b(ngettext|textdomain|d(ngettext|c(ngettext|gettext)|gettext)|gettext|bind(textdomain|_textdomain_codeset))(?=\s*\()/
    end
    rule 'support.function.gmp.php' do
      match %r/(?i)\bgmp_(hamdist|s(can(1|0)|ign|trval|ub|etbit|qrt(rem)?)|c(om|lrbit|mp)|ne(g|xtprime)|in(tval|it|vert)|or|div(_(q(r)?|r)|exact)|jacobi|p(o(pcount|w(m)?)|erfect_square|rob_prime)|fact|legendre|a(nd|dd|bs)|random|gcd(ext)?|xor|m(od|ul))(?=\s*\()/
    end
    rule 'support.function.hash.php' do
      match %r/(?i)\bhash(_(hmac(_file)?|init|update(_(stream|file))?|fi(nal|le)|algos))?(?=\s*\()/
    end
    rule 'support.function.hash_md.php' do
      match %r/(?i)\bmd5(_file)?(?=\s*\()/
    end
    rule 'support.function.hash_sha.php' do
      match %r/(?i)\bsha1(_file)?(?=\s*\()/
    end
    rule 'support.function.head.php' do
      match %r/(?i)\b(set(cookie|rawcookie)|header(s_(sent|list))?)(?=\s*\()/
    end
    rule 'support.function.html.php' do
      match %r/(?i)\b(html(specialchars(_decode)?|_entity_decode|entities)|get_html_translation_table)(?=\s*\()/
    end
    rule 'support.function.http.php' do
      match %r/(?i)\bhttp_build_query(?=\s*\()/
    end
    rule 'support.function.ibase_blobs.php' do
      match %r/(?i)\bibase_blob_(c(ancel|lose|reate)|i(nfo|mport)|open|echo|add|get)(?=\s*\()/
    end
    rule 'support.function.ibase_events.php' do
      match %r/(?i)\bibase_(set_event_handler|free_event_handler|wait_event)(?=\s*\()/
    end
    rule 'support.function.ibase_query.php' do
      match %r/(?i)\bibase_(n(um_(params|fields|rows)|ame_result)|execute|p(aram_info|repare)|f(ield_info|etch_(object|assoc|row)|ree_(query|result))|query|affected_rows)(?=\s*\()/
    end
    rule 'support.function.ibase_service.php' do
      match %r/(?i)\bibase_(serv(ice_(detach|attach)|er_info)|d(elete_user|b_info)|add_user|restore|backup|m(odify_user|aintain_db))(?=\s*\()/
    end
    rule 'support.function.iconv.php' do
      match %r/(?i)\b(iconv(_(s(tr(pos|len|rpos)|ubstr|et_encoding)|get_encoding|mime_(decode(_headers)?|encode)))?|ob_iconv_handler)(?=\s*\()/
    end
    rule 'support.function.image.php' do
      match %r/(?i)\b(image_type_to_(extension|mime_type)|getimagesize)(?=\s*\()/
    end
    rule 'support.function.info.php' do
      match %r/(?i)\b(zend_logo_guid|php(credits|info|_(sapi_name|ini_scanned_files|uname|egg_logo_guid|logo_guid|real_logo_guid)|version))(?=\s*\()/
    end
    rule 'support.function.interbase.php' do
      match %r/(?i)\bibase_(c(o(nnect|mmit(_ret)?)|lose)|trans|drop_db|pconnect|err(code|msg)|gen_id|rollback(_ret)?)(?=\s*\()/
    end
    rule 'support.function.interface.php' do
      match %r/(?i)\bcurl_(setopt(_array)?|c(opy_handle|lose)|init|e(rr(no|or)|xec)|version|getinfo)(?=\s*\()/
    end
    rule 'support.function.iptc.php' do
      match %r/(?i)\biptc(parse|embed)(?=\s*\()/
    end
    rule 'support.function.json.php' do
      match %r/(?i)\bjson_(decode|encode)(?=\s*\()/
    end
    rule 'support.function.lcg.php' do
      match %r/(?i)\blcg_value(?=\s*\()/
    end
    rule 'support.function.ldap.php' do
      match %r/(?i)\bldap_(s(tart_tls|ort|e(t_(option|rebind_proc)|arch)|asl_bind)|next_(entry|attribute|reference)|co(nnect|unt_entries|mpare)|t61_to_8859|8859_to_t61|d(n2ufn|elete)|unbind|parse_re(sult|ference)|e(rr(no|2str|or)|xplode_dn)|f(irst_(entry|attribute|reference)|ree_result)|add|list|get_(option|dn|entries|values_len|attributes)|re(name|ad)|mod_(del|add|replace)|bind)(?=\s*\()/
    end
    rule 'support.function.levenshtein.php' do
      match %r/(?i)\blevenshtein(?=\s*\()/
    end
    rule 'support.function.libxml.php' do
      match %r/(?i)\blibxml_(set_streams_context|clear_errors|use_internal_errors|get_(errors|last_error))(?=\s*\()/
    end
    rule 'support.function.link.php' do
      match %r/(?i)\b(symlink|link(info)?|readlink)(?=\s*\()/
    end
    rule 'support.function.mail.php' do
      match %r/(?i)\b(ezmlm_hash|mail)(?=\s*\()/
    end
    rule 'support.function.main.php' do
      match %r/(?i)\bset_time_limit(?=\s*\()/
    end
    rule 'support.function.math.php' do
      match %r/(?i)\b(h(ypot|exdec)|s(in(h)?|qrt)|number_format|c(os(h)?|eil)|is_(nan|infinite|finite)|tan(h)?|octdec|de(c(hex|oct|bin)|g2rad)|exp(m1)?|p(i|ow)|f(loor|mod)|log(1(p|0))?|a(sin(h)?|cos(h)?|tan(h|2)?|bs)|r(ound|ad2deg)|b(indec|ase_convert))(?=\s*\()/
    end
    rule 'support.function.mbstring.php' do
      match %r/(?i)\bmb_(s(tr(str|cut|to(upper|lower)|i(str|pos|mwidth)|pos|width|len|r(chr|i(chr|pos)|pos))|ubst(itute_character|r(_count)?)|end_mail)|http_(input|output)|c(heck_encoding|onvert_(case|encoding|variables|kana))|internal_encoding|output_handler|de(code_(numericentity|mimeheader)|tect_(order|encoding))|encode_(numericentity|mimeheader)|p(arse_str|referred_mime_name)|l(ist_(encodings(_alias_names)?|mime_names)|anguage)|get_info)(?=\s*\()/
    end
    rule 'support.function.mcrypt.php' do
      match %r/(?i)\bm(crypt_(c(fb|reate_iv|bc)|ofb|decrypt|e(cb|nc(_(self_test|is_block_(algorithm(_mode)?|mode)|get_(supported_key_sizes|iv_size|key_size|algorithms_name|modes_name|block_size))|rypt))|list_(algorithms|modes)|ge(neric(_(init|deinit))?|t_(cipher_name|iv_size|key_size|block_size))|module_(self_test|close|is_block_(algorithm(_mode)?|mode)|open|get_(supported_key_sizes|algo_(key_size|block_size))))|decrypt_generic)(?=\s*\()/
    end
    rule 'support.function.md5.php' do
      match %r/(?i)\bmd5(_file)?(?=\s*\()/
    end
    rule 'support.function.metaphone.php' do
      match %r/(?i)\bmetaphone(?=\s*\()/
    end
    rule 'support.function.mhash.php' do
      match %r/(?i)\bmhash(_(count|keygen_s2k|get_(hash_name|block_size)))?(?=\s*\()/
    end
    rule 'support.function.microtime.php' do
      match %r/(?i)\b(get(timeofday|rusage)|microtime)(?=\s*\()/
    end
    rule 'support.function.mime_magic.php' do
      match %r/(?i)\bmime_content_type(?=\s*\()/
    end
    rule 'support.function.ming.php' do
      match %r/(?i)\b(swf(prebuiltclip_init|videostream_init)|ming_(set(scale|cubicthreshold)|use(swfversion|constants)|keypress))(?=\s*\()/
    end
    rule 'support.function.multi.php' do
      match %r/(?i)\bcurl_multi_(select|close|in(it|fo_read)|exec|add_handle|getcontent|remove_handle)(?=\s*\()/
    end
    rule 'support.function.mysqli_api.php' do
      match %r/(?i)\bmysqli_(s(sl_set|t(ore_result|at|mt_(s(tore_result|end_long_data|qlstate)|num_rows|close|in(sert_id|it)|data_seek|p(aram_count|repare)|e(rr(no|or)|xecute)|f(ield_count|etch|ree_result)|a(ttr_(set|get)|ffected_rows)|res(ult_metadata|et)|bind_(param|result)))|e(t_local_infile_(handler|default)|lect_db)|qlstate)|n(um_(fields|rows)|ext_result)|c(ha(nge_user|racter_set_name)|ommit|lose)|thread_(safe|id)|in(sert_id|it|fo)|options|d(ump_debug_info|ebug|ata_seek)|use_result|p(ing|repare)|err(no|or)|kill|f(ield_(seek|count|tell)|etch_(field(s|_direct)?|lengths|row)|ree_result)|warning_count|a(utocommit|ffected_rows)|r(ollback|eal_(connect|escape_string|query))|get_(server_(info|version)|host_info|client_(info|version)|proto_info)|more_results)(?=\s*\()/
    end
    rule 'support.function.mysqli_embedded.php' do
      match %r/(?i)\bmysqli_embedded_server_(start|end)(?=\s*\()/
    end
    rule 'support.function.mysqli_nonapi.php' do
      match %r/(?i)\bmysqli_(s(tmt_get_warnings|et_charset)|connect(_err(no|or))?|query|fetch_(object|a(ssoc|rray))|get_(charset|warnings)|multi_query)(?=\s*\()/
    end
    rule 'support.function.mysqli_repl.php' do
      match %r/(?i)\bmysqli_(s(end_query|lave_query)|disable_r(pl_parse|eads_from_master)|enable_r(pl_parse|eads_from_master)|rpl_(p(arse_enabled|robe)|query_type)|master_query)(?=\s*\()/
    end
    rule 'support.function.mysqli_report.php' do
      match %r/(?i)\bmysqli_report(?=\s*\()/
    end
    rule 'support.function.namednodemap.php' do
      match %r/(?i)\bdom_namednodemap_(set_named_item(_ns)?|item|remove_named_item(_ns)?|get_named_item(_ns)?)(?=\s*\()/
    end
    rule 'support.function.namelist.php' do
      match %r/(?i)\bdom_namelist_get_name(space_uri)?(?=\s*\()/
    end
    rule 'support.function.ncurses_functions.php' do
      match %r/(?i)\bncurses_(s(how_panel|cr(_(set|init|dump|restore)|l)|ta(nd(out|end)|rt_color)|lk_(set|noutrefresh|c(olor|lear)|init|touch|attr(set|o(n|ff))?|re(store|fresh))|avetty)|h(ide_panel|line|a(s_(colors|i(c|l)|key)|lfdelay))|n(o(nl|cbreak|echo|qiflush|raw)|ew(_panel|pad|win)|apms|l)|c(olor_(set|content)|urs_set|l(ear|rto(eol|bot))|an_change_color|break)|t(ypeahead|imeout|op_panel|erm(name|attrs))|i(sendwin|n(s(str|ch|tr|delln|ertln)|ch|it(_(color|pair))?))|d(oupdate|e(f(ine_key|_(shell_mode|prog_mode))|l(ch|_panel|eteln|ay_output|win)))|u(se_(default_colors|e(nv|xtended_names))|nget(ch|mouse)|pdate_panels)|p(noutrefresh|utp|a(nel_(window|above|below)|ir_content)|refresh)|e(cho(char)?|nd|rase(char)?)|v(idattr|line)|k(illchar|ey(ok|pad))|qiflush|f(ilter|l(ushinp|ash))|longname|w(stand(out|end)|hline|noutrefresh|c(olor_set|lear)|erase|vline|a(ttr(set|o(n|ff))|dd(str|ch))|getch|refresh|mo(use_trafo|ve)|border)|a(ssume_default_colors|ttr(set|o(n|ff))|dd(str|nstr|ch(str|nstr)?))|r(e(set(ty|_(shell_mode|prog_mode))|place_panel|fresh)|aw)|get(yx|ch|m(ouse|axyx))|b(o(ttom_panel|rder)|eep|kgd(set)?|audrate)|m(o(use(interval|_trafo|mask)|ve(_panel)?)|eta|v(hline|cur|inch|delch|vline|waddstr|add(str|nstr|ch(str|nstr)?)|getch)))(?=\s*\()/
    end
    rule 'support.function.node.php' do
      match %r/(?i)\bdom_node_(set_user_data|has_(child_nodes|attributes)|normalize|c(ompare_document_position|lone_node)|i(s_(s(upported|ame_node)|default_namespace|equal_node)|nsert_before)|lookup_(namespace_uri|prefix)|append_child|get_(user_data|feature)|re(place_child|move_child))(?=\s*\()/
    end
    rule 'support.function.nodelist.php' do
      match %r/(?i)\bdom_nodelist_item(?=\s*\()/
    end
    rule 'support.function.nsapi.php' do
      match %r/(?i)\bnsapi_(virtual|re(sponse_headers|quest_headers))(?=\s*\()/
    end
    rule 'support.function.oci8_interface.php' do
      match %r/(?i)\boci(setbufferinglob|_(s(tatement_type|e(t_prefetch|rver_version))|c(o(nnect|llection_(size|trim|element_(assign|get)|a(ssign|ppend)|max)|mmit)|lose|ancel)|n(um_(fields|rows)|ew_(c(o(nnect|llection)|ursor)|descriptor))|internal_debug|define_by_name|p(connect|a(ssword_change|rse))|e(rror|xecute)|f(ield_(s(cale|ize)|name|is_null|type(_raw)?|precision)|etch(_(object|a(ssoc|ll|rray)|row))?|ree_(statement|collection|descriptor))|lob_(s(ize|eek|ave)|c(opy|lose)|t(ell|runcate)|i(s_equal|mport)|e(of|rase|xport)|flush|append|write(_temporary)?|load|re(wind|ad))|r(ollback|esult)|bind_(array_by_name|by_name))|fetchinto|getbufferinglob)(?=\s*\()/
    end
    rule 'support.function.openssl.php' do
      match %r/(?i)\bopenssl_(s(ign|eal)|csr_(sign|new|export(_to_file)?|get_(subject|public_key))|open|error_string|p(ublic_(decrypt|encrypt)|k(cs(12_(export(_to_file)?|read)|7_(sign|decrypt|encrypt|verify))|ey_(new|export(_to_file)?|free|get_(details|p(ublic|rivate))))|rivate_(decrypt|encrypt))|verify|x509_(check(_private_key|purpose)|parse|export(_to_file)?|free|read))(?=\s*\()/
    end
    rule 'support.function.output.php' do
      match %r/(?i)\bo(utput_(add_rewrite_var|reset_rewrite_vars)|b_(start|clean|implicit_flush|end_(clean|flush)|flush|list_handlers|get_(status|c(ontents|lean)|flush|le(ngth|vel))))(?=\s*\()/
    end
    rule 'support.function.pack.php' do
      match %r/(?i)\b(unpack|pack)(?=\s*\()/
    end
    rule 'support.function.pageinfo.php' do
      match %r/(?i)\bget(lastmod|my(inode|uid|pid|gid))(?=\s*\()/
    end
    rule 'support.function.pcntl.php' do
      match %r/(?i)\bpcntl_(s(ignal|etpriority)|exec|fork|w(stopsig|termsig|if(s(ignaled|topped)|exited)|exitstatus|ait(pid)?)|alarm|getpriority)(?=\s*\()/
    end
    rule 'support.function.pdo.php' do
      match %r/(?i)\bpdo_drivers(?=\s*\()/
    end
    rule 'support.function.pdo_dbh.php' do
      match %r/(?i)\bpdo_drivers(?=\s*\()/
    end
    rule 'support.function.pgsql.php' do
      match %r/(?i)\bpg_(se(nd_(execute|prepare|query(_params)?)|t_(client_encoding|error_verbosity)|lect)|host|num_(fields|rows)|c(o(n(nect(ion_(status|reset|busy))?|vert)|py_(to|from))|ancel_query|l(ient_encoding|ose))|insert|t(ty|ra(nsaction_status|ce))|options|d(elete|bname)|u(n(trace|escape_bytea)|pdate)|e(scape_(string|bytea)|nd_copy|xecute)|p(connect|ing|ort|ut_line|arameter_status|repare)|version|f(ield_(size|n(um|ame)|is_null|t(ype(_oid)?|able)|prtlen)|etch_(object|a(ssoc|ll(_columns)?|rray)|r(ow|esult))|ree_result)|query(_params)?|affected_rows|l(o_(seek|c(lose|reate)|tell|import|open|unlink|export|write|read(_all)?)|ast_(notice|oid|error))|get_(notify|pid|result)|result_(s(tatus|eek)|error(_field)?)|meta_data)(?=\s*\()/
    end
    rule 'support.function.php_apache.php' do
      match %r/(?i)\b(virtual|apache_(setenv|note|child_terminate|lookup_uri|get_(version|modules)|re(s(et_timeout|ponse_headers)|quest_(s(ome_auth_required|ub_req_(lookup_(uri|file)|method_uri)|e(t_(etag|last_modified)|rver_port)|atisfies)|headers(_(in|out))?|is_initial_req|discard_request_body|update_mtime|err_headers_out|log_error|auth_(name|type)|r(un|emote_host)|meets_conditions)))|getallheaders)(?=\s*\()/
    end
    rule 'support.function.php_date.php' do
      match %r/(?i)\b(str(totime|ftime)|checkdate|time(zone_(name_(from_abbr|get)|identifiers_list|transitions_get|o(pen|ffset_get)|abbreviations_list))?|idate|date(_(sun(set|_info|rise)|create|isodate_set|time(zone_(set|get)|_set)|d(efault_timezone_(set|get)|ate_set)|offset_get|parse|format|modify))?|localtime|g(etdate|m(strftime|date|mktime))|mktime)(?=\s*\()/
    end
    rule 'support.function.php_dom.php' do
      match %r/(?i)\bdom_import_simplexml(?=\s*\()/
    end
    rule 'support.function.php_fbsql.php' do
      match %r/(?i)\bfbsql_(hostname|s(t(op_db|art_db)|e(t_(characterset|transaction|password|lob_mode)|lect_db))|n(um_(fields|rows)|ext_result)|c(hange_user|o(nnect|mmit)|lo(se|b_size)|reate_(clob|db|blob))|table_name|insert_id|d(ata(_seek|base(_password)?)|rop_db|b_(status|query))|username|err(no|or)|p(connect|assword)|f(ield_(seek|name|t(ype|able)|flags|len)|etch_(object|field|lengths|a(ssoc|rray)|row)|ree_result)|query|warnings|list_(tables|dbs|fields)|a(utocommit|ffected_rows)|get_autostart_info|r(o(ws_fetched|llback)|e(sult|ad_(clob|blob)))|blob_size)(?=\s*\()/
    end
    rule 'support.function.php_ftp.php' do
      match %r/(?i)\bftp_(s(sl_connect|ystype|i(te|ze)|et_option)|n(list|b_(continue|put|f(put|get)|get))|c(h(dir|mod)|dup|onnect|lose)|delete|exec|p(ut|asv|wd)|f(put|get)|alloc|login|get(_option)?|r(ename|aw(list)?|mdir)|m(dtm|kdir))(?=\s*\()/
    end
    rule 'support.function.php_functions.php' do
      match %r/(?i)\b(virtual|apache_(setenv|note|get(_(version|modules)|env)|response_headers)|getallheaders)(?=\s*\()/
    end
    rule 'support.function.php_imap.php' do
      match %r/(?i)\bimap_(header(s|info)|s(can|tatus|ort|ubscribe|e(t(_quota|flag_full|acl)|arch)|avebody)|c(heck|l(ose|earflag_full)|reatemailbox)|num_(recent|msg)|t(hread|imeout)|8bit|delete(mailbox)?|open|u(n(subscribe|delete)|id|tf(7_(decode|encode)|8))|e(rrors|xpunge)|ping|qprint|fetch(header|structure|_overview|body)|l(sub|ist|ast_error)|a(ppend|lerts)|get(subscribed|_quota(root)?|acl|mailboxes)|r(e(namemailbox|open)|fc822_(parse_(headers|adrlist)|write_address))|m(sgno|ime_header_decode|ail(_(co(py|mpose)|move)|boxmsginfo)?)|b(inary|ody(struct)?|ase64))(?=\s*\()/
    end
    rule 'support.function.php_mbregex.php' do
      match %r/(?i)\bmb_(split|ereg(i(_replace)?|_(search(_(setpos|init|pos|get(pos|regs)|regs))?|replace|match))?|regex_(set_options|encoding))(?=\s*\()/
    end
    rule 'support.function.php_milter.php' do
      match %r/(?i)\bsmfi_(set(timeout|flags|reply)|chgheader|delrcpt|add(header|rcpt)|replacebody|getsymval)(?=\s*\()/
    end
    rule 'support.function.php_msql.php' do
      match %r/(?i)\bmsql_(select_db|num_(fields|rows)|c(onnect|lose|reate_db)|d(ata_seek|rop_db|b_query)|error|pconnect|f(ield_(seek|name|t(ype|able)|flags|len)|etch_(object|field|array|row)|ree_result)|query|affected_rows|list_(tables|dbs|fields)|result)(?=\s*\()/
    end
    rule 'support.function.php_mssql.php' do
      match %r/(?i)\bmssql_(select_db|n(um_(fields|rows)|ext_result)|c(onnect|lose)|init|data_seek|execute|pconnect|query|f(ield_(seek|name|type|length)|etch_(object|field|a(ssoc|rray)|row|batch)|ree_(statement|result))|g(uid_string|et_last_message)|r(ows_affected|esult)|bind|min_(error_severity|message_severity))(?=\s*\()/
    end
    rule 'support.function.php_mysql.php' do
      match %r/(?i)\bmysql_(s(tat|e(t_charset|lect_db))|num_(fields|rows)|c(onnect|l(ient_encoding|ose)|reate_db)|thread_id|in(sert_id|fo)|d(ata_seek|rop_db|b_query)|unbuffered_query|e(scape_string|rr(no|or))|p(connect|ing)|f(ield_(seek|name|t(ype|able)|flags|len)|etch_(object|field|lengths|a(ssoc|rray)|row)|ree_result)|query|affected_rows|list_(tables|dbs|processes|fields)|re(sult|al_escape_string)|get_(server_info|host_info|client_info|proto_info))(?=\s*\()/
    end
    rule 'support.function.php_odbc.php' do
      match %r/(?i)\b(solid_fetch_prev|odbc_(s(tatistics|pecialcolumns|etoption)|n(um_(fields|rows)|ext_result)|c(o(nnect|lumn(s|privileges)|mmit)|ursor|lose(_all)?)|table(s|privileges)|data_source|e(rror(msg)?|xec(ute)?)|p(connect|r(imarykeys|ocedure(s|columns)|epare))|f(ield_(scale|n(um|ame)|type|len)|oreignkeys|etch_(into|object|array|row)|ree_result)|autocommit|longreadlen|gettypeinfo|r(ollback|esult(_all)?)|binmode))(?=\s*\()/
    end
    rule 'support.function.php_pcre.php' do
      match %r/(?i)\bpreg_(split|quote|last_error|grep|replace(_callback)?|match(_all)?)(?=\s*\()/
    end
    rule 'support.function.php_spl.php' do
      match %r/(?i)\b(spl_(classes|object_hash|autoload(_(call|unregister|extensions|functions|register))?)|class_(implements|parents))(?=\s*\()/
    end
    rule 'support.function.php_sybase_ct.php' do
      match %r/(?i)\bsybase_(se(t_message_handler|lect_db)|num_(fields|rows)|c(onnect|lose)|d(eadlock_retry_count|ata_seek)|unbuffered_query|pconnect|f(ield_seek|etch_(object|field|a(ssoc|rray)|row)|ree_result)|query|affected_rows|result|get_last_message|min_(server_severity|client_severity))(?=\s*\()/
    end
    rule 'support.function.php_sybase_db.php' do
      match %r/(?i)\bsybase_(select_db|num_(fields|rows)|c(onnect|lose)|data_seek|pconnect|f(ield_seek|etch_(object|field|array|row)|ree_result)|query|affected_rows|result|get_last_message|min_(error_severity|message_severity))(?=\s*\()/
    end
    rule 'support.function.php_xmlwriter.php' do
      match %r/(?i)\bxmlwriter_(s(tart_(c(omment|data)|d(td(_(e(ntity|lement)|attlist))?|ocument)|pi|element(_ns)?|attribute(_ns)?)|et_indent(_string)?)|text|o(utput_memory|pen_(uri|memory))|end_(c(omment|data)|d(td(_(e(ntity|lement)|attlist))?|ocument)|pi|element|attribute)|f(ull_end_element|lush)|write_(c(omment|data)|dtd(_(e(ntity|lement)|attlist))?|pi|element(_ns)?|attribute(_ns)?|raw))(?=\s*\()/
    end
    rule 'support.function.php_zip.php' do
      match %r/(?i)\b(s(tat(Name|Index)|et(Comment(Name|Index)|ArchiveComment))|c(lose|reateEmptyDir)|delete(Name|Index)|open|zip_(close|open|entry_(name|c(ompress(ionmethod|edsize)|lose)|open|filesize|read)|read)|unchange(Name|Index|All)|locateName|addF(ile|romString)|rename(Name|Index)|get(Stream|Comment(Name|Index)|NameIndex|From(Name|Index)|ArchiveComment))(?=\s*\()/
    end
    rule 'support.function.posix.php' do
      match %r/(?i)\bposix_(s(trerror|et(sid|uid|pgid|e(uid|gid)|gid))|ctermid|i(satty|nitgroups)|t(tyname|imes)|uname|kill|access|get(sid|cwd|_last_error|uid|e(uid|gid)|p(id|pid|w(nam|uid)|g(id|rp))|login|rlimit|g(id|r(nam|oups|gid)))|mk(nod|fifo))(?=\s*\()/
    end
    rule 'support.function.proc_open.php' do
      match %r/(?i)\bproc_(close|terminate|open|get_status)(?=\s*\()/
    end
    rule 'support.function.pspell.php' do
      match %r/(?i)\bpspell_(s(tore_replacement|uggest|ave_wordlist)|c(heck|onfig_(save_repl|create|ignore|d(ict_dir|ata_dir)|personal|r(untogether|epl)|mode)|lear_session)|new(_(config|personal))?|add_to_(session|personal))(?=\s*\()/
    end
    rule 'support.function.quot_print.php' do
      match %r/(?i)\bquoted_printable_decode(?=\s*\()/
    end
    rule 'support.function.rand.php' do
      match %r/(?i)\b(srand|getrandmax|rand|mt_(srand|getrandmax|rand))(?=\s*\()/
    end
    rule 'support.function.readline.php' do
      match %r/(?i)\breadline(_(c(ompletion_function|allback_(handler_(install|remove)|read_char)|lear_history)|info|on_new_line|write_history|list_history|add_history|re(display|ad_history)))?(?=\s*\()/
    end
    rule 'support.function.recode.php' do
      match %r/(?i)\brecode_(string|file)(?=\s*\()/
    end
    rule 'support.function.reg.php' do
      match %r/(?i)\b(s(plit(i)?|ql_regcase)|ereg(i(_replace)?|_replace)?)(?=\s*\()/
    end
    rule 'support.function.session.php' do
      match %r/(?i)\bsession_(s(tart|et_(save_handler|cookie_params)|ave_path)|cache_(expire|limiter)|name|i(s_registered|d)|de(stroy|code)|un(set|register)|encode|write_close|reg(ister|enerate_id)|get_cookie_params|module_name)(?=\s*\()/
    end
    rule 'support.function.sha1.php' do
      match %r/(?i)\bsha1(_file)?(?=\s*\()/
    end
    rule 'support.function.shmop.php' do
      match %r/(?i)\bshmop_(size|close|delete|open|write|read)(?=\s*\()/
    end
    rule 'support.function.simplexml.php' do
      match %r/(?i)\bsimplexml_(import_dom|load_(string|file))(?=\s*\()/
    end
    rule 'support.function.skeleton.php' do
      match %r/(?i)\bconfirm_extname_compiled(?=\s*\()/
    end
    rule 'support.function.snmp.php' do
      match %r/(?i)\b(snmp(set|2_(set|walk|real_walk|get(next)?)|3_(set|walk|real_walk|get(next)?)|_(set_(oid_output_format|enum_print|valueretrieval|quick_print)|read_mib|get_(valueretrieval|quick_print))|walk|realwalk|get(next)?)|php_snmpv3)(?=\s*\()/
    end
    rule 'support.function.sockets.php' do
      match %r/(?i)\bsocket_(s(hutdown|trerror|e(nd(to)?|t_(nonblock|option|block)|lect))|c(onnect|l(ose|ear_error)|reate(_(pair|listen))?)|write|l(isten|ast_error)|accept|get(sockname|_option|peername)|re(cv(from)?|ad)|bind)(?=\s*\()/
    end
    rule 'support.function.soundex.php' do
      match %r/(?i)\bsoundex(?=\s*\()/
    end
    rule 'support.function.spl_iterators.php' do
      match %r/(?i)\biterator_(count|to_array|apply)(?=\s*\()/
    end
    rule 'support.function.sqlite.php' do
      match %r/(?i)\bsqlite_(has_prev|s(ingle_query|eek)|n(um_(fields|rows)|ext)|c(hanges|olumn|urrent|lose|reate_(function|aggregate))|open|u(nbuffered_query|df_(decode_binary|encode_binary))|e(scape_string|rror_string|xec)|p(open|rev)|key|valid|query|f(ield_name|etch_(single|column_types|object|a(ll|rray))|actory)|l(ib(encoding|version)|ast_(insert_rowid|error))|array_query|rewind|busy_timeout)(?=\s*\()/
    end
    rule 'support.function.streamsfuncs.php' do
      match %r/(?i)\bstream_(s(ocket_(s(hutdown|e(ndto|rver))|client|enable_crypto|pair|accept|recvfrom|get_name)|e(t_(timeout|write_buffer|blocking)|lect))|co(ntext_(set_(option|params)|create|get_(default|options))|py_to_stream)|filter_(prepend|append|remove)|get_(contents|transports|line|wrappers|meta_data))(?=\s*\()/
    end
    rule 'support.function.string.php' do
      match %r/(?i)\b(hebrev(c)?|s(scanf|imilar_text|tr(s(tr|pn)|natc(asecmp|mp)|c(hr|spn|oll)|i(str|p(slashes|cslashes|os|_tags))|t(o(upper|k|lower)|r)|_(s(huffle|plit)|ireplace|pad|word_count|r(ot13|ep(eat|lace)))|p(os|brk)|r(chr|ipos|ev|pos))|ubstr(_(co(unt|mpare)|replace))?|etlocale)|c(h(unk_split|r)|ount_chars)|nl(2br|_langinfo)|implode|trim|ord|dirname|uc(first|words)|join|pa(thinfo|rse_str)|explode|quotemeta|add(slashes|cslashes)|wordwrap|l(trim|ocaleconv)|rtrim|money_format|b(in2hex|asename))(?=\s*\()/
    end
    rule 'support.function.string_extend.php' do
      match %r/(?i)\bdom_string_extend_find_offset(16|32)(?=\s*\()/
    end
    rule 'support.function.syslog.php' do
      match %r/(?i)\b(syslog|closelog|openlog|define_syslog_variables)(?=\s*\()/
    end
    rule 'support.function.sysvmsg.php' do
      match %r/(?i)\bmsg_(s(tat_queue|e(nd|t_queue))|re(ceive|move_queue)|get_queue)(?=\s*\()/
    end
    rule 'support.function.sysvsem.php' do
      match %r/(?i)\bsem_(acquire|re(lease|move)|get)(?=\s*\()/
    end
    rule 'support.function.sysvshm.php' do
      match %r/(?i)\bshm_(detach|put_var|attach|get_var|remove(_var)?)(?=\s*\()/
    end
    rule 'support.function.text.php' do
      match %r/(?i)\bdom_text_(split_text|is_whitespace_in_element_content|replace_whole_text)(?=\s*\()/
    end
    rule 'support.function.tidy.php' do
      match %r/(?i)\btidy_(c(onfig_count|lean_repair)|is_x(html|ml)|diagnose|error_count|parse_(string|file)|access_count|warning_count|repair_(string|file)|get(opt|_(h(tml(_ver)?|ead)|status|config|o(utput|pt_doc)|error_buffer|r(oot|elease)|body)))(?=\s*\()/
    end
    rule 'support.function.tokenizer.php' do
      match %r/(?i)\btoken_(name|get_all)(?=\s*\()/
    end
    rule 'support.function.type.php' do
      match %r/(?i)\b(s(trval|ettype)|i(s_(s(calar|tring)|callable|nu(ll|meric)|object|float|array|long|resource|bool)|ntval)|floatval|gettype)(?=\s*\()/
    end
    rule 'support.function.uniqid.php' do
      match %r/(?i)\buniqid(?=\s*\()/
    end
    rule 'support.function.url.php' do
      match %r/(?i)\b(url(decode|encode)|parse_url|get_headers|rawurl(decode|encode))(?=\s*\()/
    end
    rule 'support.function.user_filters.php' do
      match %r/(?i)\bstream_(filter_register|get_filters|bucket_(new|prepend|append|make_writeable))(?=\s*\()/
    end
    rule 'support.function.userdatahandler.php' do
      match %r/(?i)\bdom_userdatahandler_handle(?=\s*\()/
    end
    rule 'support.function.userspace.php' do
      match %r/(?i)\bstream_wrapper_(unregister|re(store|gister))(?=\s*\()/
    end
    rule 'support.function.uuencode.php' do
      match %r/(?i)\bconvert_uu(decode|encode)(?=\s*\()/
    end
    rule 'support.function.var.php' do
      match %r/(?i)\b(serialize|debug_zval_dump|unserialize|var_(dump|export)|memory_get_(usage|peak_usage))(?=\s*\()/
    end
    rule 'support.function.versioning.php' do
      match %r/(?i)\bversion_compare(?=\s*\()/
    end
    rule 'support.function.wddx.php' do
      match %r/(?i)\bwddx_(serialize_va(lue|rs)|deserialize|packet_(start|end)|add_vars)(?=\s*\()/
    end
    rule 'support.function.xml.php' do
      match %r/(?i)\b(utf8_(decode|encode)|xml_(set_(start_namespace_decl_handler|notation_decl_handler|character_data_handler|default_handler|object|unparsed_entity_decl_handler|processing_instruction_handler|e(nd_namespace_decl_handler|lement_handler|xternal_entity_ref_handler))|error_string|parse(_into_struct|r_(set_option|create(_ns)?|free|get_option))?|get_(current_(column_number|line_number|byte_index)|error_code)))(?=\s*\()/
    end
    rule 'support.function.xmlrpc-epi-php.php' do
      match %r/(?i)\bxmlrpc_(se(t_type|rver_(c(all_method|reate)|destroy|add_introspection_data|register_(introspection_callback|method)))|is_fault|decode(_request)?|parse_method_descriptions|encode(_request)?|get_type)(?=\s*\()/
    end
    rule 'support.function.xpath.php' do
      match %r/(?i)\bdom_xpath_(evaluate|query|register_ns)(?=\s*\()/
    end
    rule 'support.function.xsltprocessor.php' do
      match %r/(?i)\bxsl_xsltprocessor_(has_exslt_support|set_parameter|transform_to_(doc|uri|xml)|import_stylesheet|re(gister_php_functions|move_parameter)|get_parameter)(?=\s*\()/
    end
    rule 'support.function.zlib.php' do
      match %r/(?i)\b(ob_gzhandler|zlib_get_coding_type|readgzfile|gz(compress|inflate|deflate|open|uncompress|encode|file))(?=\s*\()/
    end
    rule 'support.function.alias.php' do
      match %r/(?i)\bis_int(eger)?(?=\s*\()/
    end
    rule 'support.class.builtin.php' do
      match %r/(?i)\b(Re(cursive(RegexIterator|CachingIterator|IteratorIterator|DirectoryIterator|FilterIterator|ArrayIterator)|flection(Method|Class|Object|Extension|P(arameter|roperty)|Function)?|gexIterator)|s(tdClass|wf(s(hape|ound|prite)|text(field)?|displayitem|f(ill|ont(cha(r)?)?)|action|gradient|mo(vie|rph)|b(itmap|utton)))|XMLReader|tidyNode|S(impleXML(Iterator|Element)|oap(Server|Header|Client|Param|Var|Fault)|pl(TempFileObject|ObjectStorage|File(Info|Object)))|NoRewindIterator|C(OMPersistHelper|achingIterator)|I(nfiniteIterator|teratorIterator)|D(irectoryIterator|OM(XPath|Node|C(omment|dataSection)|Text|Document(Fragment)?|ProcessingInstruction|E(ntityReference|lement)|Attr))|P(DO(Statement)?|arentIterator)|E(rrorException|mptyIterator|xception)|FilterIterator|LimitIterator|A(p(pendIterator|acheRequest)|rray(Iterator|Object)))(?=\s*\()/
    end
    rule 'support.function.construct.php' do
      match %r/(?i)\b((print|echo)\b|(isset|unset|e(val|mpty)|list)(?=\s*\())/
    end
  end

  fragment :var_basic do
    rule 'variable.other.php' do
      match %r/(?x) (\$+)#{id}?\b/,
        1 => 'punctuation.definition.variable.php'
    end
  end

  fragment :var_global do
    rule 'variable.other.global.php' do
      match %r/(\$)(_(COOKIE|FILES|GET|POST|REQUEST))\b/,
        1 => 'punctuation.definition.variable.php'
    end
  end

  fragment :var_global_safer do
    rule 'variable.other.global.safer.php' do
      match %r/((\$)(GLOBALS|_(ENV|SERVER|SESSION)))|\b(global)\b/,
        2 => 'punctuation.definition.variable.php'
    end
  end

  fragment :variables do
    include "#var_global"
    include "#var_global_safer"
    include "#var_basic"
  end
end
