# encoding: utf-8

language 'Scheme' => 'source.scheme' do
  #
  # The foldings do not currently work the way I want them to. This
  # may be a limitation of the way they are applied rather than the
  # regexps in use. Nonetheless, the foldings will end on the last
  # identically indented blank line following an s-expression. Not
  # ideal perhaps, but it works. Also, the #illegal pattern never
  # matches an unpaired ( as being illegal. Why?! -- Rob Rix
  #
  # Ok, hopefully this grammar works better on quoted stuff now.  It
  # may break for fancy macros, but should generally work pretty
  # smoothly.  -- Jacob Rus
  #
  # I have attempted to get this under control but because of the way folding
  # and indentation interact in Textmate, I am not sure if it is possible. In the
  # meantime, I have implemented Python-style folding anchored at newlines.
  # Additionally, I have made some minor improvements to the numeric constant
  # highlighting. Next up is square bracket expressions, I guess, but that
  # should be trivial. -- ozy`
  #
  file_types %w(scm sch)
  key_equivalent "^~S"  # TextMate only
  uuid "3EC2CFD0-909C-4692-AC29-1A60ADBC161E"  # TextMate only

  include "#comment"
  include "#sexp"
  include "#string"
  include "#language-functions"
  include "#quote"
  include "#illegal"

  fragment :comment do
    rule do
      from %r/(^[ \t]+)?(?=;)/,
        1 => 'punctuation.whitespace.comment.leading.scheme'
      to %r/(?!\G)/
      rule 'comment.line.semicolon.scheme' do
        from %r/;/,
          0 => 'punctuation.definition.comment.scheme'
        to %r/\n/
      end
    end
  end

  fragment :constants do
    rule 'constant.language.boolean.scheme' do
      match %r/#[t|f]/
    end
    rule 'constant.numeric.scheme' do
      match %r/(?<=[\(\s])((#e|#i)?[0-9]+(\.[0-9]+)?|(#x)[0-9a-fA-F]+|(#o)[0-7]+|(#b)[01]+)(?=[\s;()'",\[\]])/
    end
  end

  fragment :illegal do
    rule 'invalid.illegal.parenthesis.scheme' do
      match %r/[()\[\]]/
    end
  end

  fragment :"language-functions" do
    rule 'keyword.control.scheme' do
      match %r/(?x)
            (?<=(\s|\(|\[)) # preceded by space or ( 
            ( do|or|and|else|quasiquote|begin|if|case|set!|
              cond|let|unquote|define|let\*|unquote-splicing|delay|
              letrec)
            (?=(\s|\())/
    end
    rule 'support.function.boolean-test.scheme' do
      #
      # These functions run a test, and return a boolean
      # answer.
      #
      match %r/(?x)
            (?<=(\s|\()) # preceded by space or (
            ( char-alphabetic|char-lower-case|char-numeric|
              char-ready|char-upper-case|char-whitespace|
              (?:char|string)(?:-ci)?(?:=|<=?|>=?)|
              atom|boolean|bound-identifier=|char|complex|
              identifier|integer|symbol|free-identifier=|inexact|
              eof-object|exact|list|(?:input|output)-port|pair|
              real|rational|zero|vector|negative|odd|null|string|
              eq|equal|eqv|even|number|positive|procedure
            )
            (\?)    # name ends with ? sign
            (?=(\s|\()) # followed by space or (
          /
    end
    rule 'support.function.convert-type.scheme' do
      #
      # These functions change one type into another.
      #
      match %r/(?x)
            (?<=(\s|\()) # preceded by space or (
            ( char->integer|exact->inexact|inexact->exact|
              integer->char|symbol->string|list->vector|
              list->string|identifier->symbol|vector->list|
              string->list|string->number|string->symbol|
              number->string
            )
            (?=(\s|\()) # followed by space or (          
          /
    end
    rule 'support.function.with-side-effects.scheme' do
      #
      # These functions are potentially dangerous because
      # they have side-effects which could affect other
      # parts of the program.
      #
      match %r'(?x)
            (?<=(\s|\()) # preceded by space or (
            ( set-(?:car|cdr)|         # set car/cdr
              (?:vector|string)-(?:fill|set) # fill/set string/vector
            )
            (!)      # name ends with ! sign
            (?=(\s|\()) # followed by space or (
          '
    end
    rule 'keyword.operator.arithmetic.scheme' do
      #
      # +, -, *, /, =, >, etc.
      #
      match %r'(?x)
            (?<=(\s|\()) # preceded by space or (
            ( >=?|<=?|=|[*/+-])
            (?=(\s|\()) # followed by space or (
            '
    end
    rule 'support.function.general.scheme' do
      match %r'(?x)
            (?<=(\s|\()) # preceded by space or (
            ( append|apply|approximate|
              call-with-current-continuation|call/cc|catch|
              construct-identifier|define-syntax|display|foo|
              for-each|force|cd|gen-counter|gen-loser|
              generate-identifier|last-pair|length|let-syntax|
              letrec-syntax|list|list-ref|list-tail|load|log|
              macro|magnitude|map|map-streams|max|member|memq|
              memv|min|newline|nil|not|peek-char|rationalize|
              read|read-char|return|reverse|sequence|substring|
              syntax|syntax-rules|transcript-off|transcript-on|
              truncate|unwrap-syntax|values-list|write|write-char|
              
              # cons, car, cdr, etc
              cons|c(a|d){1,4}r| 
                          
              # unary math operators
              abs|acos|angle|asin|assoc|assq|assv|atan|ceiling|
              cos|floor|round|sin|sqrt|tan|
              (?:real|imag)-part|numerator|denominator
                          
              # other math operators
              modulo|exp|expt|remainder|quotient|lcm|
                          
              # ports / files
              call-with-(?:input|output)-file|
              (?:close|current)-(?:input|output)-port|
              with-(?:input|output)-from-file|
              open-(?:input|output)-file|
              
              # char-«foo»
              char-(?:downcase|upcase|ready)|
              
              # make-«foo»
              make-(?:polar|promise|rectangular|string|vector)
              
              # string-«foo», vector-«foo»
              string(?:-(?:append|copy|length|ref))?|
              vector(?:-length|-ref)
            )
            (?=(\s|\()) # followed by space or (
          '
    end
  end

  fragment :quote do
    #
    # We need to be able to quote any kind of item, which creates
    # a tiny bit of complexity in our grammar.  It is hopefully
    # not overwhelming complexity.
    #
    # Note: the first two matches are special cases.  quoted
    # symbols, and quoted empty lists are considered constant.other
    #
    #
    rule 'constant.other.symbol.scheme' do
      match %r/(?x)
            (')\s*
            ([[:alnum:]][[:alnum:]!$%&*+-.\/:<=>?@^_~]*)
          /,
        1 => 'punctuation.section.quoted.symbol.scheme'
    end
    rule 'constant.other.empty-list.schem' do
      match %r/(?x)
            (')\s*
            ((\()\s*(\)))
          /,
        1 => 'punctuation.section.quoted.empty-list.scheme',
        2 => 'meta.expression.scheme',
        3 => 'punctuation.section.expression.begin.scheme',
        4 => 'punctuation.section.expression.end.scheme'
    end
    rule 'string.other.quoted-object.scheme' do
      # quoted double-quoted string or s-expression
      from %r/(')\s*/,
        1 => 'punctuation.section.quoted.scheme'
      to %r/(?=[\s()])|(?<=\n)/
      include "#quoted"
    end
  end

  fragment :"quote-sexp" do
    rule do
      #
      # Something quoted with (quote «thing»).  In this case «thing»
      # will not be evaluated, so we are considering it a string.
      #
      content_scope "string.other.quote.scheme"
      from %r/(?<=\()\s*(quote)\b\s*/,
        1 => 'keyword.control.quote.scheme'
      to %r/(?=[\s)])|(?<=\n)/
      include "#quoted"
    end
  end

  fragment :quoted do
    include "#string"
    rule 'meta.expression.scheme' do
      from %r/(\()/,
        1 => 'punctuation.section.expression.begin.scheme'
      to %r/(\))/,
        1 => 'punctuation.section.expression.end.scheme'
      include "#quoted"
    end
    include "#quote"
    include "#illegal"
  end

  fragment :sexp do
    rule 'meta.expression.scheme' do
      from %r/(\()/,
        1 => 'punctuation.section.expression.begin.scheme'
      to %r/(\))(\n)?/,
        1 => 'punctuation.section.expression.end.scheme',
        2 => 'meta.after-expression.scheme'
      include "#comment"
      rule 'meta.declaration.procedure.scheme' do
        from %r'(?x)
            (?<=\()       # preceded by (
            (define)\s+   # define
            (\()          # list of parameters
              ([[:alnum:]][[:alnum:]!$%&*+-./:<=>?@^_~]*)
              ((\s+
                ([[:alnum:]][[:alnum:]!$%&*+-./:<=>?@^_~]*|[._])
               )*
              )\s*
            (\))
          '
        to %r/(?=\))/
        both 1 => 'keyword.control.scheme',
             2 => 'punctuation.definition.function.scheme',
             3 => 'entity.name.function.scheme',
             4 => 'variable.parameter.function.scheme',
             7 => 'punctuation.definition.function.scheme'
        include "#comment"
        include "#sexp"
        include "#illegal"
      end
      rule 'meta.declaration.procedure.scheme' do
        #
        # Not sure this one is quite correct.  That \s* is
        # particularly troubling
        #
        from %r'(?x)
            (?<=\() # preceded by (
            (lambda)\s+
            (\() # opening paren
            ((?:
              ([[:alnum:]][[:alnum:]!$%&*+-./:<=>?@^_~]*|[._])
              \s+
            )*(?:
              ([[:alnum:]][[:alnum:]!$%&*+-./:<=>?@^_~]*|[._])
            )?)
            (\)) # closing paren
          '
        to %r/(?=\))/
        both 1 => 'keyword.control.scheme',
             2 => 'punctuation.definition.variable.scheme',
             3 => 'variable.parameter.scheme',
             6 => 'punctuation.definition.variable.scheme'
        include "#comment"
        include "#sexp"
        include "#illegal"
      end
      rule 'meta.declaration.variable.scheme' do
        from %r'(?<=\()(define)\s([[:alnum:]][[:alnum:]!$%&*+-./:<=>?@^_~]*)\s*.*?'
        to %r/(?=\))/
        both 1 => 'keyword.control.scheme',
             2 => 'variable.other.scheme'
        include "#comment"
        include "#sexp"
        include "#illegal"
      end
      include "#quote-sexp"
      include "#quote"
      include "#language-functions"
      include "#string"
      include "#constants"
      rule 'constant.character.named.scheme' do
        match %r/(?<=[\(\s])(#\\)(space|newline|tab)(?=[\s\)])/
      end
      rule 'constant.character.hex-literal.scheme' do
        match %r/(?<=[\(\s])(#\\)x[0-9A-F]{2,4}(?=[\s\)])/
      end
      rule 'constant.character.escape.scheme' do
        match %r/(?<=[\(\s])(#\\).(?=[\s\)])/
      end
      rule 'punctuation.separator.cons.scheme' do
        #
        # the . in (a . b) which conses together two elements
        # a and b. (a b c) == (a . (b . (c . nil)))
        #
        match %r/(?<=[ ()])\.(?=[ ()])/
      end
      include "#sexp"
      include "#illegal"
    end
  end

  fragment :string do
    rule 'string.quoted.double.scheme' do
      from %r/(")/,
        1 => 'punctuation.definition.string.begin.scheme'
      to %r/(")/,
        1 => 'punctuation.definition.string.end.scheme'
      rule 'constant.character.escape.scheme' do
        match %r/\\./
      end
    end
  end
end
