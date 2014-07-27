# encoding: utf-8

language 'Ruby' => 'source.ruby' do
  #
  # TODO: unresolved issues
  #
  # text:
  # "p << end
  # print me!
  # end"
  # symptoms:
  # not recognized as a heredoc
  # solution:
  # there is no way to distinguish perfectly between the << operator and the start
  # of a heredoc. Currently, we require assignment to recognize a heredoc. More
  # refinement is possible.
  # • Heredocs with indented terminators (<<-) are always distinguishable, however.
  # • Nested heredocs are not really supportable at present
  #
  # text:
  # print <<-'THERE'
  # This is single quoted.
  # The above used #{Time.now}
  # THERE
  # symtoms:
  # From Programming Ruby p306; should be a non-interpolated heredoc.
  #
  # text:
  # "a\332a"
  # symptoms:
  # '\332' is not recognized as slash3.. which should be octal 332.
  # solution:
  # plain regexp.. should be easy.
  #
  #   text:
  #   val?(a):p(b)
  #   val?'a':'b'
  #   symptoms:
  #   ':p' is recognized as a symbol.. its 2 things ':' and 'p'.
  #   :'b' has same problem.
  #   solution:
  #   ternary operator rule, precedence stuff, symbol rule.
  #   but also consider 'a.b?(:c)' ??
  file_types %w(
    rb rbx rjs Rakefile rake cgi fcgi gemspec irbrc capfile ru prawn Gemfile
    Guardfile Vagrantfile Appraisals Rantfile
  )
  first_line_match %r'^#!/.*\bruby'
  key_equivalent "^~R"  # TextMate only
  uuid "E00B62AC-6B1C-11D9-9B1F-000D93589AF6"  # TextMate only

  rule 'meta.class.ruby' do
    match %r/^\s*(class)\s+(([.a-zA-Z0-9_:]+(\s*(<)\s*[.a-zA-Z0-9_:]+)?)|((<<)\s*[.a-zA-Z0-9_:]+))/,
      1 => 'keyword.control.class.ruby',
      2 => 'entity.name.type.class.ruby',
      4 => 'entity.other.inherited-class.ruby',
      5 => 'punctuation.separator.inheritance.ruby',
      6 => 'variable.other.object.ruby',
      7 => 'punctuation.definition.variable.ruby'
  end
  rule 'meta.module.ruby' do
    match %r/^\s*(module)\s+(([A-Z]\w*(::))?([A-Z]\w*(::))?([A-Z]\w*(::))*[A-Z]\w*)/,
      1 => 'keyword.control.module.ruby',
      2 => 'entity.name.type.module.ruby',
      3 => 'entity.other.inherited-class.module.first.ruby',
      4 => 'punctuation.separator.inheritance.ruby',
      5 => 'entity.other.inherited-class.module.second.ruby',
      6 => 'punctuation.separator.inheritance.ruby',
      7 => 'entity.other.inherited-class.module.third.ruby',
      8 => 'punctuation.separator.inheritance.ruby'
  end
  rule 'invalid.deprecated.ruby' do
    # else if is a common mistake carried over from other languages. it works if you put in a second end, but it’s never what you want.
    match %r/(?<!\.)\belse(\s)+if\b/
  end
  rule 'constant.other.symbol.hashkey.ruby' do
    # symbols as hash key (1.9 syntax)
    match %r/(?>[a-zA-Z_]\w*(?>[?!])?)(:)(?!:)/,
      1 => 'punctuation.definition.constant.ruby'
  end
  rule 'constant.other.symbol.hashkey.ruby' do
    # symbols as hash key (1.8 syntax)
    match %r/(?<!:)(:)(?>[a-zA-Z_]\w*(?>[?!])?)(?=\s*=>)/,
      1 => 'punctuation.definition.constant.ruby'
  end
  rule 'keyword.control.ruby' do
    # everything being a reserved word, not a value and needing a 'end' is a..
    match %r/(?<!\.)\b(BEGIN|begin|case|class|else|elsif|END|end|ensure|for|if|in|module|rescue|then|unless|until|when|while)\b(?![?!])/
  end
  rule 'keyword.control.start-block.ruby' do
    # contextual smart pair support for block parameters
    match %r/(?<!\.)\bdo\b\s*/
  end
  rule 'meta.syntax.ruby.start-block' do
    # contextual smart pair support
    match %r/(?<=\{)(\s+)/
  end
  rule 'keyword.operator.logical.ruby' do
    # as above, just doesn't need a 'end' and does a logic operation
    match %r/(?<!\.)\b(and|not|or)\b/
  end
  rule 'keyword.control.pseudo-method.ruby' do
    # just as above but being not a logical operation
    match %r/(?<!\.)\b(alias|alias_method|break|next|redo|retry|return|super|undef|yield)\b(?![?!])|\bdefined\?|\bblock_given\?/
  end
  rule 'constant.language.ruby' do
    match %r/\b(nil|true|false)\b(?![?!])/
  end
  rule 'variable.language.ruby' do
    match %r/\b(__(FILE|LINE)__|self)\b(?![?!])/
  end
  rule 'keyword.other.special-method.ruby' do
    # everything being a method but having a special function is a..
    match %r/\b(initialize|new|loop|include|extend|prepend|raise|attr_reader|attr_writer|attr_accessor|attr|catch|throw|private|module_function|public|protected)\b(?![?!])/
  end
  rule 'meta.require.ruby' do
    from %r/\b(require|require_relative|gem)\b/
    to %r/$|(?=#|\})/
    both 1 => 'keyword.other.special-method.ruby'
    include "$self"
  end
  rule 'variable.other.readwrite.instance.ruby' do
    match %r/(@)[a-zA-Z_]\w*/,
      1 => 'punctuation.definition.variable.ruby'
  end
  rule 'variable.other.readwrite.class.ruby' do
    match %r/(@@)[a-zA-Z_]\w*/,
      1 => 'punctuation.definition.variable.ruby'
  end
  rule 'variable.other.readwrite.global.ruby' do
    match %r/(\$)[a-zA-Z_]\w*/,
      1 => 'punctuation.definition.variable.ruby'
  end
  rule 'variable.other.readwrite.global.pre-defined.ruby' do
    match %r/(\$)(!|@|&|`|'|\+|\d+|~|=|\/|\\|,|;|\.|<|>|_|\*|\$|\?|:|"|-[0adFiIlpv])/,
      1 => 'punctuation.definition.variable.ruby'
  end
  rule 'meta.environment-variable.ruby' do
    from %r/\b(ENV)\[/,
      1 => 'variable.other.constant.ruby'
    to %r/\]/
    include "$self"
  end
  rule 'support.class.ruby' do
    match %r/\b[A-Z]\w*(?=((\.|::)[A-Za-z]|\[))/
  end
  rule 'variable.other.constant.ruby' do
    match %r/\b[A-Z]\w*\b/
  end
  rule 'meta.function.method.with-arguments.ruby' do
    # the method pattern comes from the symbol pattern, see there for a explaination
    from %r'(?x)
               (?=def\b)                                                      # an optimization to help Oniguruma fail fast
               (?<=^|\s)(def)\s+                                              # the def keyword
               ( (?>[a-zA-Z_]\w*(?>\.|::))?                                   # a method name prefix
                 (?>[a-zA-Z_]\w*(?>[?!]|=(?!>))?                              # the method name
                 |===?|>[>=]?|<=>|<[<=]?|[%&`/\|]|\*\*?|=?~|[-+]@?|\[\]=?) )  # …or an operator method
               \s*(\()                                                        # the openning parenthesis for arguments
              ',
      1 => 'keyword.control.def.ruby',
      2 => 'entity.name.function.ruby',
      3 => 'punctuation.definition.parameters.ruby'
    to %r/\)/,
      0 => 'punctuation.definition.parameters.ruby'
    rule do
      from %r/(?![\s,)])/
      to %r/(?=[,)])/
      rule do
        match %r/\G([&*]?)([_a-zA-Z][_a-zA-Z0-9]*)/,
          1 => 'storage.type.variable.ruby',
          2 => 'variable.parameter.function.ruby'
      end
      include "$self"
    end
  end
  rule 'meta.function.method.with-arguments.ruby' do
    # same as the previous rule, but without parentheses around the arguments
    from %r'(?x)
               (?=def\b)                                                      # an optimization to help Oniguruma fail fast
               (?<=^|\s)(def)\s+                                              # the def keyword
               ( (?>[a-zA-Z_]\w*(?>\.|::))?                                   # a method name prefix
                 (?>[a-zA-Z_]\w*(?>[?!]|=(?!>))?                              # the method name
                 |===?|>[>=]?|<=>|<[<=]?|[%&`/\|]|\*\*?|=?~|[-+]@?|\[\]=?) )  # …or an operator method
               [ \t]                                                          # the space separating the arguments
               (?=[ \t]*[^\s#;])                                              # make sure arguments and not a comment follow
              ',
      1 => 'keyword.control.def.ruby',
      2 => 'entity.name.function.ruby'
    to %r/$/
    rule do
      from %r/(?![\s,])/
      to %r/(?=,|$)/
      rule 'variable.parameter.function.ruby' do
        match %r/\G([&*]?)[_a-zA-Z][_a-zA-Z0-9]*/,
          1 => 'punctuation.definition.variable.ruby'
      end
      include "$self"
    end
  end
  rule 'meta.function.method.without-arguments.ruby' do
    # the optional name is just to catch the def also without a method-name
    match %r'(?x)
               (?=def\b)                                                           # an optimization to help Oniguruma fail fast
               (?<=^|\s)(def)\b                                                    # the def keyword
               ( \s+                                                               # an optional group of whitespace followed by…
                 ( (?>[a-zA-Z_]\w*(?>\.|::))?                                      # a method name prefix
                   (?>[a-zA-Z_]\w*(?>[?!]|=(?!>))?                                 # the method name
                   |===?|>[>=]?|<=>|<[<=]?|[%&`/\|]|\*\*?|=?~|[-+]@?|\[\]=?) ) )?  # …or an operator method
              ',
      1 => 'keyword.control.def.ruby',
      3 => 'entity.name.function.ruby'
  end
  rule 'constant.numeric.ruby' do
    match %r/\b(0[xX]\h(?>_?\h)*|\d(?>_?\d)*(\.(?![^[:space:][:digit:]])(?>_?\d)*)?([eE][-+]?\d(?>_?\d)*)?|0[bB][01]+)\b/
  end
  rule 'constant.other.symbol.single-quoted.ruby' do
    from %r/:'/
    to %r/'/
    both 0 => 'punctuation.definition.constant.ruby'
    rule 'constant.character.escape.ruby' do
      match %r/\\['\\]/
    end
  end
  rule 'constant.other.symbol.double-quoted.ruby' do
    from %r/:"/
    to %r/"/
    both 0 => 'punctuation.definition.constant.ruby'
    include "#interpolated_ruby"
    include "#escaped_char"
  end
  rule 'keyword.operator.assignment.augmented.ruby' do
    # Needs higher precidence than regular expressions.
    match %r'(?<!\()/='
  end
  rule 'string.quoted.single.ruby' do
    # single quoted string (does not allow interpolation)
    from %r/'/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/'/,
      0 => 'punctuation.definition.string.end.ruby'
    rule 'constant.character.escape.ruby' do
      match %r/\\'|\\\\/
    end
  end
  rule 'string.quoted.double.ruby' do
    # double quoted string (allows for interpolation)
    from %r/"/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/"/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#interpolated_ruby"
    include "#escaped_char"
  end
  rule 'string.interpolated.ruby' do
    # execute string (allows for interpolation)
    from %r/`/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/`/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#interpolated_ruby"
    include "#escaped_char"
  end
  rule 'string.interpolated.ruby' do
    # execute string (allow for interpolation)
    from %r/%x\{/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/\}/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#interpolated_ruby"
    include "#escaped_char"
    include "#nest_curly_i"
  end
  rule 'string.interpolated.ruby' do
    # execute string (allow for interpolation)
    from %r/%x\[/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/\]/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#interpolated_ruby"
    include "#escaped_char"
    include "#nest_brackets_i"
  end
  rule 'string.interpolated.ruby' do
    # execute string (allow for interpolation)
    from %r/%x\</,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/\>/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#interpolated_ruby"
    include "#escaped_char"
    include "#nest_ltgt_i"
  end
  rule 'string.interpolated.ruby' do
    # execute string (allow for interpolation)
    from %r/%x\(/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/\)/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#interpolated_ruby"
    include "#escaped_char"
    include "#nest_parens_i"
  end
  rule 'string.interpolated.ruby' do
    # execute string (allow for interpolation)
    from %r/%x([^\w])/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/§1/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#interpolated_ruby"
    include "#escaped_char"
  end
  rule do
    # regular expressions (normal)
    #       we only start a regexp if the character before it (excluding whitespace)
    #       is what we think is before a regexp
    #
    content_scope "string.regexp.classic.ruby"
    from %r'(?x)
         (?:
           ^                      # beginning of line
         | (?<=                   # or look-behind on:
             [=>~(?:\[,|&;]
           | [\s;]if\s      # keywords
           | [\s;]elsif\s
           | [\s;]while\s
           | [\s;]unless\s
           | [\s;]when\s
           | [\s;]assert_match\s
           | [\s;]or\s      # boolean opperators
           | [\s;]and\s
           | [\s;]not\s
           | [\s.]index\s      # methods
           | [\s.]scan\s
           | [\s.]sub\s
           | [\s.]sub!\s
           | [\s.]gsub\s
           | [\s.]gsub!\s
           | [\s.]match\s
           )
         | (?<=                  # or a look-behind with line anchor:
              ^when\s            # duplication necessary due to limits of regex
            | ^if\s
            | ^elsif\s
            | ^while\s
            | ^unless\s
            )
         )
         \s*((/))(?![*+{}?])
      '
    to %r'((/[eimnosux]*))'
    both 1 => 'string.regexp.classic.ruby',
         2 => 'punctuation.definition.string.ruby'
    include "#regex_sub"
  end
  rule 'string.regexp.mod-r.ruby' do
    # regular expressions (literal)
    from %r/%r\{/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/\}[eimnosux]*/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#regex_sub"
    include "#nest_curly_r"
  end
  rule 'string.regexp.mod-r.ruby' do
    # regular expressions (literal)
    from %r/%r\[/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/\][eimnosux]*/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#regex_sub"
    include "#nest_brackets_r"
  end
  rule 'string.regexp.mod-r.ruby' do
    # regular expressions (literal)
    from %r/%r\(/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/\)[eimnosux]*/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#regex_sub"
    include "#nest_parens_r"
  end
  rule 'string.regexp.mod-r.ruby' do
    # regular expressions (literal)
    from %r/%r\</,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/\>[eimnosux]*/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#regex_sub"
    include "#nest_ltgt_r"
  end
  rule 'string.regexp.mod-r.ruby' do
    # regular expressions (literal)
    from %r/%r([^\w])/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/§1[eimnosux]*/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#regex_sub"
  end
  rule 'string.quoted.other.literal.upper.ruby' do
    # literal capable of interpolation ()
    from %r/%[QWSR]?\(/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/\)/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#interpolated_ruby"
    include "#escaped_char"
    include "#nest_parens_i"
  end
  rule 'string.quoted.other.literal.upper.ruby' do
    # literal capable of interpolation []
    from %r/%[QWSR]?\[/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/\]/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#interpolated_ruby"
    include "#escaped_char"
    include "#nest_brackets_i"
  end
  rule 'string.quoted.other.literal.upper.ruby' do
    # literal capable of interpolation <>
    from %r/%[QWSR]?\</,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/\>/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#interpolated_ruby"
    include "#escaped_char"
    include "#nest_ltgt_i"
  end
  rule 'string.quoted.double.ruby.mod' do
    # literal capable of interpolation -- {}
    from %r/%[QWSR]?\{/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/\}/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#interpolated_ruby"
    include "#escaped_char"
    include "#nest_curly_i"
  end
  rule 'string.quoted.other.literal.upper.ruby' do
    # literal capable of interpolation -- wildcard
    from %r/%[QWSR]([^\w])/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/§1/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#interpolated_ruby"
    include "#escaped_char"
  end
  rule 'string.quoted.other.literal.other.ruby' do
    # literal capable of interpolation -- wildcard
    from %r/%([^\w\s=])/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/§1/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#interpolated_ruby"
    include "#escaped_char"
  end
  rule 'string.quoted.other.literal.lower.ruby' do
    # literal incapable of interpolation -- ()
    from %r/%[qws]\(/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/\)/,
      0 => 'punctuation.definition.string.end.ruby'
    rule 'constant.character.escape.ruby' do
      match %r/\\\)|\\\\/
    end
    include "#nest_parens"
  end
  rule 'string.quoted.other.literal.lower.ruby' do
    # literal incapable of interpolation -- <>
    from %r/%[qws]\</,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/\>/,
      0 => 'punctuation.definition.string.end.ruby'
    rule 'constant.character.escape.ruby' do
      match %r/\\\>|\\\\/
    end
    include "#nest_ltgt"
  end
  rule 'string.quoted.other.literal.lower.ruby' do
    # literal incapable of interpolation -- []
    from %r/%[qws]\[/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/\]/,
      0 => 'punctuation.definition.string.end.ruby'
    rule 'constant.character.escape.ruby' do
      match %r/\\\]|\\\\/
    end
    include "#nest_brackets"
  end
  rule 'string.quoted.other.literal.lower.ruby' do
    # literal incapable of interpolation -- {}
    from %r/%[qws]\{/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/\}/,
      0 => 'punctuation.definition.string.end.ruby'
    rule 'constant.character.escape.ruby' do
      match %r/\\\}|\\\\/
    end
    include "#nest_curly"
  end
  rule 'string.quoted.other.literal.lower.ruby' do
    # literal incapable of interpolation -- wildcard
    from %r/%[qws]([^\w])/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/§1/,
      0 => 'punctuation.definition.string.end.ruby'
    rule do
      # Cant be named because its not neccesarily an escape.
      match %r/\\./
    end
  end
  rule 'constant.other.symbol.ruby' do
    # symbols
    match %r'(?<!:)(:)(?>[a-zA-Z_]\w*(?>[?!]|=(?![>=]))?|===?|>[>=]?|<[<=]?|<=>|[%&`/\|]|\*\*?|=?~|[-+]@?|\[\]=?|@@?[a-zA-Z_]\w*)',
      1 => 'punctuation.definition.constant.ruby'
  end
  rule 'comment.block.documentation.ruby' do
    # multiline comments
    from %r/^=begin/
    to %r/^=end/
    both 0 => 'punctuation.definition.comment.ruby'
  end
  rule do
    from %r/(^[ \t]+)?(?=#)/,
      1 => 'punctuation.whitespace.comment.leading.ruby'
    to %r/(?!\G)/
    rule 'comment.line.number-sign.ruby' do
      from %r/#/,
        0 => 'punctuation.definition.comment.ruby'
      to %r/\n/
    end
  end
  rule 'constant.numeric.ruby' do
    #
    # matches questionmark-letters.
    #
    # examples (1st alternation = hex):
    # ?\x1     ?\x61
    #
    # examples (2nd alternation = octal):
    # ?\0      ?\07     ?\017
    #
    # examples (3rd alternation = escaped):
    # ?\n      ?\b
    #
    # examples (4th alternation = meta-ctrl):
    # ?\C-a    ?\M-a    ?\C-\M-\C-\M-a
    #
    # examples (4th alternation = normal):
    # ?a       ?A       ?0
    # ?*       ?"       ?(
    # ?.       ?#
    #
    #
    # the negative lookbehind prevents against matching
    # p(42.tainted?)
    match %r/(?<!\w)\?(\\(x\h{1,2}(?!\h)\b|0[0-7]{0,2}(?![0-7])\b|[^x0MC])|(\\[MC]-)+\w|[^\s\\])/
  end
  rule do
    # __END__ marker
    content_scope "text.plain"
    from %r/^__END__\n/
    to %r/(?=not)impossible/
    both 0 => 'string.unquoted.program-block.ruby'
    rule 'text.html.embedded.ruby' do
      from %r/(?=<?xml|<(?i:html\b)|!DOCTYPE (?i:html\b))/
      to %r/(?=not)impossible/
      include "text.html.basic"
    end
  end
  rule 'meta.embedded.block.html' do
    # Heredoc with embedded html
    # FIXME: (warning) character class has duplicated range
    from %r/(?=(?><<-("?)((?:[_\w]+_|)HTML)\b\1))/
    to %r/(?!\G)/
    rule 'string.unquoted.heredoc.ruby' do
      content_scope "text.html"
      # FIXME: (warning) character class has duplicated range
      from %r/(?><<-("?)((?:[_\w]+_|)HTML)\b\1)/,
        0 => 'punctuation.definition.string.begin.ruby'
      # FIXME: (warning) contains references to a Regexp with warning(s)
      to %r/\s*§2$\n?/,
        0 => 'punctuation.definition.string.end.ruby'
      include "#heredoc"
      include "#interpolated_ruby"
      include "text.html.basic"
      include "#escaped_char"
    end
  end
  rule 'meta.embedded.block.sql' do
    # Heredoc with embedded sql
    # FIXME: (warning) character class has duplicated range
    from %r/(?=(?><<-("?)((?:[_\w]+_|)SQL)\b\1))/
    to %r/(?!\G)/
    rule 'string.unquoted.heredoc.ruby' do
      content_scope "source.sql"
      # FIXME: (warning) character class has duplicated range
      from %r/(?><<-("?)((?:[_\w]+_|)SQL)\b\1)/,
        0 => 'punctuation.definition.string.begin.ruby'
      # FIXME: (warning) contains references to a Regexp with warning(s)
      to %r/\s*§2$\n?/,
        0 => 'punctuation.definition.string.end.ruby'
      include "#heredoc"
      include "#interpolated_ruby"
      include "source.sql"
      include "#escaped_char"
    end
  end
  rule 'meta.embedded.block.css' do
    # Heredoc with embedded css
    # FIXME: (warning) character class has duplicated range
    from %r/(?=(?><<-("?)((?:[_\w]+_|)CSS)\b\1))/
    to %r/(?!\G)/
    rule 'string.unquoted.heredoc.ruby' do
      content_scope "source.css"
      # FIXME: (warning) character class has duplicated range
      from %r/(?><<-("?)((?:[_\w]+_|)CSS)\b\1)/,
        0 => 'punctuation.definition.string.begin.ruby'
      # FIXME: (warning) contains references to a Regexp with warning(s)
      to %r/\s*§2$\n?/,
        0 => 'punctuation.definition.string.end.ruby'
      include "#heredoc"
      include "#interpolated_ruby"
      include "source.css"
      include "#escaped_char"
    end
  end
  rule 'meta.embedded.block.c++' do
    # Heredoc with embedded c++
    # FIXME: (warning) character class has duplicated range
    from %r/(?=(?><<-("?)((?:[_\w]+_|)CPP)\b\1))/
    to %r/(?!\G)/
    rule 'string.unquoted.heredoc.ruby' do
      content_scope "source.c++"
      # FIXME: (warning) character class has duplicated range
      from %r/(?><<-("?)((?:[_\w]+_|)CPP)\b\1)/,
        0 => 'punctuation.definition.string.begin.ruby'
      # FIXME: (warning) contains references to a Regexp with warning(s)
      to %r/\s*§2$\n?/,
        0 => 'punctuation.definition.string.end.ruby'
      include "#heredoc"
      include "#interpolated_ruby"
      include "source.c++"
      include "#escaped_char"
    end
  end
  rule 'meta.embedded.block.c' do
    # Heredoc with embedded c
    # FIXME: (warning) character class has duplicated range
    from %r/(?=(?><<-("?)((?:[_\w]+_|)C)\b\1))/
    to %r/(?!\G)/
    rule 'string.unquoted.heredoc.ruby' do
      content_scope "source.c"
      # FIXME: (warning) character class has duplicated range
      from %r/(?><<-("?)((?:[_\w]+_|)C)\b\1)/,
        0 => 'punctuation.definition.string.begin.ruby'
      # FIXME: (warning) contains references to a Regexp with warning(s)
      to %r/\s*§2$\n?/,
        0 => 'punctuation.definition.string.end.ruby'
      include "#heredoc"
      include "#interpolated_ruby"
      include "source.c"
      include "#escaped_char"
    end
  end
  rule 'meta.embedded.block.js' do
    # Heredoc with embedded javascript
    # FIXME: (warning) character class has duplicated range
    from %r/(?=(?><<-("?)((?:[_\w]+_|)(?:JS|JAVASCRIPT))\b\1))/
    to %r/(?!\G)/
    rule 'string.unquoted.heredoc.ruby' do
      content_scope "source.js"
      # FIXME: (warning) character class has duplicated range
      from %r/(?><<-("?)((?:[_\w]+_|)(?:JS|JAVASCRIPT))\b\1)/,
        0 => 'punctuation.definition.string.begin.ruby'
      # FIXME: (warning) contains references to a Regexp with warning(s)
      to %r/\s*§2$\n?/,
        0 => 'punctuation.definition.string.end.ruby'
      include "#heredoc"
      include "#interpolated_ruby"
      include "source.js"
      include "#escaped_char"
    end
  end
  rule 'meta.embedded.block.js.jquery' do
    # Heredoc with embedded jQuery javascript
    # FIXME: (warning) character class has duplicated range
    from %r/(?=(?><<-("?)((?:[_\w]+_|)JQUERY)\b\1))/
    to %r/(?!\G)/
    rule 'string.unquoted.heredoc.ruby' do
      content_scope "source.js.jquery"
      # FIXME: (warning) character class has duplicated range
      from %r/(?><<-("?)((?:[_\w]+_|)JQUERY)\b\1)/,
        0 => 'punctuation.definition.string.begin.ruby'
      # FIXME: (warning) contains references to a Regexp with warning(s)
      to %r/\s*§2$\n?/,
        0 => 'punctuation.definition.string.end.ruby'
      include "#heredoc"
      include "#interpolated_ruby"
      include "source.js.jquery"
      include "#escaped_char"
    end
  end
  rule 'meta.embedded.block.shell' do
    # Heredoc with embedded shell
    # FIXME: (warning) character class has duplicated range
    from %r/(?=(?><<-("?)((?:[_\w]+_|)(?:SH|SHELL))\b\1))/
    to %r/(?!\G)/
    rule 'string.unquoted.heredoc.ruby' do
      content_scope "source.shell"
      # FIXME: (warning) character class has duplicated range
      from %r/(?><<-("?)((?:[_\w]+_|)(?:SH|SHELL))\b\1)/,
        0 => 'punctuation.definition.string.begin.ruby'
      # FIXME: (warning) contains references to a Regexp with warning(s)
      to %r/\s*§2$\n?/,
        0 => 'punctuation.definition.string.end.ruby'
      include "#heredoc"
      include "#interpolated_ruby"
      include "source.shell"
      include "#escaped_char"
    end
  end
  rule 'meta.embedded.block.lua' do
    # Heredoc with embedded lua
    # FIXME: (warning) character class has duplicated range
    from %r/(?=(?><<-("?)((?:[_\w]+_|)LUA)\b\1))/
    to %r/(?!\G)/
    rule 'string.unquoted.heredoc.ruby' do
      content_scope "source.lua"
      # FIXME: (warning) character class has duplicated range
      from %r/(?><<-("?)((?:[_\w]+_|)LUA)\b\1)/,
        0 => 'punctuation.definition.string.begin.ruby'
      # FIXME: (warning) contains references to a Regexp with warning(s)
      to %r/\s*§2$\n?/,
        0 => 'punctuation.definition.string.end.ruby'
      include "#heredoc"
      include "#interpolated_ruby"
      include "source.lua"
      include "#escaped_char"
    end
  end
  rule 'meta.embedded.block.ruby' do
    # Heredoc with embedded ruby
    # FIXME: (warning) character class has duplicated range
    from %r/(?=(?><<-("?)((?:[_\w]+_|)RUBY)\b\1))/
    to %r/(?!\G)/
    rule 'string.unquoted.heredoc.ruby' do
      content_scope "source.ruby"
      # FIXME: (warning) character class has duplicated range
      from %r/(?><<-("?)((?:[_\w]+_|)RUBY)\b\1)/,
        0 => 'punctuation.definition.string.begin.ruby'
      # FIXME: (warning) contains references to a Regexp with warning(s)
      to %r/\s*§2$\n?/,
        0 => 'punctuation.definition.string.end.ruby'
      include "#heredoc"
      include "#interpolated_ruby"
      include "source.ruby"
      include "#escaped_char"
    end
  end
  rule 'string.unquoted.heredoc.ruby' do
    from %r/(?>\=\s*<<(\w+))/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/^§1$/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#heredoc"
    include "#interpolated_ruby"
    include "#escaped_char"
  end
  rule 'string.unquoted.heredoc.ruby' do
    # heredoc with indented terminator
    from %r/(?><<-(\w+))/,
      0 => 'punctuation.definition.string.begin.ruby'
    to %r/\s*§1$/,
      0 => 'punctuation.definition.string.end.ruby'
    include "#heredoc"
    include "#interpolated_ruby"
    include "#escaped_char"
  end
  rule do
    from %r/(?<=\{|do|\{\s|do\s)(\|)/
    to %r/(\|)/
    both 1 => 'punctuation.separator.variable.ruby'
    rule 'variable.other.block.ruby' do
      match %r/[_a-zA-Z][_a-zA-Z0-9]*/
    end
    rule 'punctuation.separator.variable.ruby' do
      match %r/,/
    end
  end
  rule 'punctuation.separator.key-value' do
    match %r/=>/
  end
  rule 'keyword.operator.assignment.augmented.ruby' do
    match %r/<<=|%=|&=|\*=|\*\*=|\+=|\-=|\^=|\|{1,2}=|<</
  end
  rule 'keyword.operator.comparison.ruby' do
    match %r/<=>|<(?!<|=)|>(?!<|=|>)|<=|>=|===|==|=~|!=|!~|(?<=[ \t])\?/
  end
  rule 'keyword.operator.logical.ruby' do
    match %r/(?<=[ \t])!+|\bnot\b|&&|\band\b|\|\||\bor\b|\^/
  end
  rule 'keyword.operator.arithmetic.ruby' do
    match %r'(%|&|\*\*|\*|\+|\-|/)'
  end
  rule 'keyword.operator.assignment.ruby' do
    match %r/=/
  end
  rule 'keyword.operator.other.ruby' do
    match %r/\||~|>>/
  end
  rule 'punctuation.separator.other.ruby' do
    match %r/:/
  end
  rule 'punctuation.separator.statement.ruby' do
    match %r/\;/
  end
  rule 'punctuation.separator.object.ruby' do
    match %r/,/
  end
  rule 'punctuation.separator.method.ruby' do
    match %r/\.|::/
  end
  rule 'punctuation.section.scope.begin.ruby' do
    match %r/\{/
  end
  rule 'punctuation.section.scope.end.ruby' do
    match %r/\}/
  end
  rule 'punctuation.section.array.begin.ruby' do
    match %r/\[/
  end
  rule 'punctuation.section.array.end.ruby' do
    match %r/\]/
  end
  rule 'punctuation.section.function.ruby' do
    match %r/\(|\)/
  end

  fragment :escaped_char do
    rule 'constant.character.escape.ruby' do
      match %r/\\(?:[0-7]{1,3}|x[\da-fA-F]{1,2}|.)/
    end
  end

  fragment :heredoc do
    rule do
      from %r/^<<-?\w+/
      to %r/$/
      include "$self"
    end
  end

  fragment :interpolated_ruby do
    rule 'meta.embedded.line.ruby' do
      content_scope "source.ruby"
      from %r/#\{/,
        0 => 'punctuation.section.embedded.begin.ruby'
      to %r/(\})/,
        0 => 'punctuation.section.embedded.end.ruby',
        1 => 'source.ruby'
      include "#nest_curly_and_self"
      include "$self"
    end
    rule 'variable.other.readwrite.instance.ruby' do
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      match %r/(#@)[a-zA-Z_]\w*/,
        1 => 'punctuation.definition.variable.ruby'
    end
    rule 'variable.other.readwrite.class.ruby' do
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      match %r/(#@@)[a-zA-Z_]\w*/,
        1 => 'punctuation.definition.variable.ruby'
    end
    rule 'variable.other.readwrite.global.ruby' do
      match %r/(#\$)[a-zA-Z_]\w*/,
        1 => 'punctuation.definition.variable.ruby'
    end
  end

  fragment :nest_brackets do
    rule do
      from %r/\[/
      to %r/\]/
      both 0 => 'punctuation.section.scope.ruby'
      include "#nest_brackets"
    end
  end

  fragment :nest_brackets_i do
    rule do
      from %r/\[/
      to %r/\]/
      both 0 => 'punctuation.section.scope.ruby'
      include "#interpolated_ruby"
      include "#escaped_char"
      include "#nest_brackets_i"
    end
  end

  fragment :nest_brackets_r do
    rule do
      from %r/\[/
      to %r/\]/
      both 0 => 'punctuation.section.scope.ruby'
      include "#regex_sub"
      include "#nest_brackets_r"
    end
  end

  fragment :nest_curly do
    rule do
      from %r/\{/
      to %r/\}/
      both 0 => 'punctuation.section.scope.ruby'
      include "#nest_curly"
    end
  end

  fragment :nest_curly_and_self do
    rule do
      from %r/\{/
      to %r/\}/
      both 0 => 'punctuation.section.scope.ruby'
      include "#nest_curly_and_self"
    end
    include "$self"
  end

  fragment :nest_curly_i do
    rule do
      from %r/\{/
      to %r/\}/
      both 0 => 'punctuation.section.scope.ruby'
      include "#interpolated_ruby"
      include "#escaped_char"
      include "#nest_curly_i"
    end
  end

  fragment :nest_curly_r do
    rule do
      from %r/\{/
      to %r/\}/
      both 0 => 'punctuation.section.scope.ruby'
      include "#regex_sub"
      include "#nest_curly_r"
    end
  end

  fragment :nest_ltgt do
    rule do
      from %r/\</
      to %r/\>/
      both 0 => 'punctuation.section.scope.ruby'
      include "#nest_ltgt"
    end
  end

  fragment :nest_ltgt_i do
    rule do
      from %r/\</
      to %r/\>/
      both 0 => 'punctuation.section.scope.ruby'
      include "#interpolated_ruby"
      include "#escaped_char"
      include "#nest_ltgt_i"
    end
  end

  fragment :nest_ltgt_r do
    rule do
      from %r/\</
      to %r/\>/
      both 0 => 'punctuation.section.scope.ruby'
      include "#regex_sub"
      include "#nest_ltgt_r"
    end
  end

  fragment :nest_parens do
    rule do
      from %r/\(/
      to %r/\)/
      both 0 => 'punctuation.section.scope.ruby'
      include "#nest_parens"
    end
  end

  fragment :nest_parens_i do
    rule do
      from %r/\(/
      to %r/\)/
      both 0 => 'punctuation.section.scope.ruby'
      include "#interpolated_ruby"
      include "#escaped_char"
      include "#nest_parens_i"
    end
  end

  fragment :nest_parens_r do
    rule do
      from %r/\(/
      to %r/\)/
      both 0 => 'punctuation.section.scope.ruby'
      include "#regex_sub"
      include "#nest_parens_r"
    end
  end

  fragment :regex_sub do
    include "#interpolated_ruby"
    include "#escaped_char"
    rule 'string.regexp.arbitrary-repitition.ruby' do
      match %r/(\{)\d+(,\d+)?(\})/,
        1 => 'punctuation.definition.arbitrary-repitition.ruby',
        3 => 'punctuation.definition.arbitrary-repitition.ruby'
    end
    rule 'string.regexp.character-class.ruby' do
      from %r/\[(?:\^?\])?/
      to %r/\]/
      both 0 => 'punctuation.definition.character-class.ruby'
      include "#escaped_char"
    end
    rule 'comment.line.number-sign.ruby' do
      from %r/\(\?#/,
        0 => 'punctuation.definition.comment.begin.ruby'
      to %r/\)/,
        0 => 'punctuation.definition.comment.end.ruby'
      include "#escaped_char"
    end
    rule 'string.regexp.group.ruby' do
      from %r/\(/
      to %r/\)/
      both 0 => 'punctuation.definition.group.ruby'
      include "#regex_sub"
    end
    rule 'comment.line.number-sign.ruby' do
      # We are restrictive in what we allow to go after the comment character to avoid false positives, since the availability of comments depend on regexp flags.
      # FIXME: (error) invalid hex escape
      from %r/(?<=^|\s)(#)\s(?=[[a-zA-Z0-9,. \t?!-][^\x{00}-\x{7F}]]*$)/,
        1 => 'punctuation.definition.comment.ruby'
      to %r/$\n?/,
        0 => 'punctuation.definition.comment.ruby'
    end
  end
end
