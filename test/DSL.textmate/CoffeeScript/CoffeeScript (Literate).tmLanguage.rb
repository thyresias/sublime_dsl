# encoding: utf-8

language 'CoffeeScript (Literate)' => 'source.litcoffee' do
  # CoffeeScript (Literate)
  file_types %w(litcoffee litcoffee.erb coffee.md)
  folding_start_marker %r'(?x)
    (<(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl)\b.*?>
    |<!--(?!.*-->)
    |\{\s*($|\?>\s*$|//|/\*(.*\*/\s*$|(?!.*?\*/)))
    )'
  folding_stop_marker %r'(?x)
    (</(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl)>
    |^\s*-->
    |(^|\s)\}
    )'
  uuid "70456B1D-AC94-4E9B-81AB-426F0D1ACB86"  # TextMate only

  rule 'markup.raw.block.markdown' do
    from %r/(?x)^
        (?=  ([ ]{4}|\t)(?!$))/
    to %r/(?x)^
        (?!  ([ ]{4}|\t))/
    include "#block_raw"
  end
  rule 'meta.block-level.markdown' do
    #
    # We could also use an empty end match and set
    # applyEndPatternLast, but then we must be sure that the begin
    # pattern will only match stuff matched by the sub-patterns.
    #
    from %r/(?x)^
        (?=  [ ]{,3}>.
        |  [#]{1,6}\s*+
        |  [ ]{,3}(?<marker>[-*_])([ ]{,2}\k<marker>){2,}[ \t]*+$
        )/
    to %r/(?x)^
        (?!  [ ]{,3}>.
        |  [#]{1,6}\s*+
        |  [ ]{,3}(?<marker>[-*_])([ ]{,2}\k<marker>){2,}[ \t]*+$
        )/
    include "#block_quote"
    include "#heading"
    include "#separator"
  end
  rule 'markup.list.unnumbered.markdown' do
    from %r/^[ ]{0,3}([*+-])(?=\s)/
    to %r/^(?=\S)/
    both 1 => 'punctuation.definition.list_item.markdown'
    include "#list-paragraph"
  end
  rule 'markup.list.numbered.markdown' do
    from %r/^[ ]{0,3}([0-9]+\.)(?=\s)/
    to %r/^(?=\S)/
    both 1 => 'punctuation.definition.list_item.markdown'
    include "#list-paragraph"
  end
  rule 'meta.disable-markdown' do
    #
    # Markdown formatting is disabled inside block-level tags.
    #
    from %r'^(?=<(p|div|h[1-6]|blockquote|pre|table|dl|ol|ul|script|noscript|form|fieldset|iframe|math|ins|del)\b)(?!.*?</\1>)'
    to %r'(?<=^</§1>$\n)'
    include "text.html.basic"
  end
  rule 'meta.disable-markdown' do
    # Same rule but for one line disables.
    from %r/^(?=<(p|div|h[1-6]|blockquote|pre|table|dl|ol|ul|script|noscript|form|fieldset|iframe|math|ins|del)\b)/
    to %r/$\n?/
    include "text.html.basic"
  end
  rule 'meta.link.reference.def.markdown' do
    match %r/(?x:
        \s*            # Leading whitespace
        (\[)(.+?)(\])(:)    # Reference name
        [ \t]*          # Optional whitespace
        (<?)(\S+?)(>?)      # The url
        [ \t]*          # Optional whitespace
        (?:
            ((\().+?(\)))    # Match title in quotes…
          | ((").+?("))    # or in parens.
        )?            # Title is optional
        \s*            # Optional whitespace
        $
      )/,
      1 => 'punctuation.definition.constant.markdown',
      2 => 'constant.other.reference.link.markdown',
      3 => 'punctuation.definition.constant.markdown',
      4 => 'punctuation.separator.key-value.markdown',
      5 => 'punctuation.definition.link.markdown',
      6 => 'markup.underline.link.markdown',
      7 => 'punctuation.definition.link.markdown',
      8 => 'string.other.link.description.title.markdown',
      9 => 'punctuation.definition.string.begin.markdown',
      10 => 'punctuation.definition.string.end.markdown',
      11 => 'string.other.link.description.title.markdown',
      12 => 'punctuation.definition.string.begin.markdown',
      13 => 'punctuation.definition.string.end.markdown'
  end
  rule 'meta.paragraph.markdown' do
    from %r/^(?=\S)(?![=-]{3,}(?=$))/
    to %r/^(?:\s*$|(?=[ ]{,3}>.))|(?=[ \t]*\n)(?<=^===|^====|=====|^---|^----|-----)[ \t]*\n|(?=^#)/
    include "#inline"
    include "text.html.basic"
    rule 'markup.heading.1.markdown' do
      match %r/^(={3,})(?=[ \t]*$)/,
        1 => 'punctuation.definition.heading.markdown'
    end
    rule 'markup.heading.2.markdown' do
      match %r/^(-{3,})(?=[ \t]*$)/,
        1 => 'punctuation.definition.heading.markdown'
    end
  end

  fragment :ampersand do
    rule 'meta.other.valid-ampersand.markdown' do
      #
      # Markdown will convert this for us. We match it so that the
      # HTML grammar will not mark it up as invalid.
      #
      match %r/&(?!([a-zA-Z0-9]+|#[0-9]+|#x[0-9a-fA-F]+);)/
    end
  end

  fragment :block_quote do
    rule 'markup.quote.markdown' do
      #
      # We terminate the block quote when seeing an empty line, a
      # separator or a line with leading > characters. The latter is
      # to “reset” the quote level for quoted lines.
      #
      from %r/\G[ ]{,3}(>)(?!$)[ ]?/,
        1 => 'punctuation.definition.blockquote.markdown'
      to %r/(?x)^
        (?=  \s*$
        |  [ ]{,3}(?<marker>[-*_])([ ]{,2}\k<marker>){2,}[ \t]*+$
        |  [ ]{,3}>.
        )/
      rule do
        from %r/(?x)\G
            (?=  [ ]{,3}>.
            )/
        to %r/^/
        include "#block_quote"
      end
      rule do
        from %r/(?x)\G
            (?=  ([ ]{4}|\t)
            |  [#]{1,6}\s*+
            |  [ ]{,3}(?<marker>[-*_])([ ]{,2}\k<marker>){2,}[ \t]*+$
            )/
        to %r/^/
        to_last true
        include "#block_raw"
        include "#heading"
        include "#separator"
      end
      rule do
        from %r/(?x)\G
            (?!  $
            |  [ ]{,3}>.
            |  ([ ]{4}|\t)
            |  [#]{1,6}\s*+
            |  [ ]{,3}(?<marker>[-*_])([ ]{,2}\k<marker>){2,}[ \t]*+$
            )/
        to %r/$|(?<=\n)/
        include "#inline"
      end
    end
  end

  fragment :block_raw do
    # FIXME: no "match" nor "begin/end"
    rule 'markup.raw.block.markdown' do
      include "#coffee_script"
    end
  end

  fragment :bold do
    rule 'markup.bold.markdown' do
      # FIXME: (error) numbered backref/call is not allowed. (use name)
      from %r/(?x)
            (\*\*|__)(?=\S)                # Open
            (?=
              (
                  <[^>]*+>              # HTML tags
                | (?<raw>`+)([^`]|(?!(?<!`)\k<raw>(?!`))`)*+\k<raw>
                                  # Raw
                | \\[\\`*_{}\[\]()#.!+\->]?+      # Escapes
                | \[
                (        
                        (?<square>          # Named group
                      [^\[\]\\]        # Match most chars
                          | \\.            # Escaped chars
                          | \[ \g<square>*+ \]    # Nested brackets
                        )*+
                  \]
                  (
                    (              # Reference Link
                      [ ]?          # Optional space
                      \[[^\]]*+\]        # Ref name
                    )
                    | (              # Inline Link
                      \(            # Opening paren
                        [ \t]*+        # Optional whtiespace
                        <?(.*?)>?      # URL
                        [ \t]*+        # Optional whtiespace
                        (          # Optional Title
                          (?<title>['"])
                          (.*?)
                          \k<title>
                        )?
                      \)
                    )
                  )
                )
                | (?!(?<=\S)\1).            # Everything besides
                                  # style closer
              )++
              (?<=\S)\1                # Close
            )
          /
      to %r/(?<=\S)(\1)/
      both 1 => 'punctuation.definition.bold.markdown'
      rule do
        from %r/(?=<[^>]*?>)/
        to %r/(?<=>)/
        to_last true
        include "text.html.basic"
      end
      include "#escape"
      include "#ampersand"
      include "#bracket"
      include "#raw"
      include "#italic"
      include "#image-inline"
      include "#link-inline"
      include "#link-inet"
      include "#link-email"
      include "#image-ref"
      include "#link-ref-literal"
      include "#link-ref"
    end
  end

  fragment :bracket do
    rule 'meta.other.valid-bracket.markdown' do
      #
      # Markdown will convert this for us. We match it so that the
      # HTML grammar will not mark it up as invalid.
      #
      match %r'<(?![a-z/?\$!])'
    end
  end

  fragment :coffee_script do
    rule 'meta.inline.function.coffee' do
      # match stuff like: a -> …
      match %r/(\()([^()]*?)(\))\s*([=-]>)/,
        1 => 'punctuation.definition.parameters.begin.coffee',
        3 => 'punctuation.definition.parameters.begin.coffee',
        4 => 'storage.type.function.coffee'
    end
    rule 'meta.class.instance.constructor' do
      match %r/(new)\s+(\w+(?:\.\w*)*)/,
        1 => 'keyword.operator.new.coffee',
        2 => 'entity.name.type.instance.coffee'
    end
    rule 'string.quoted.heredoc.coffee' do
      from %r/'''/,
        0 => 'punctuation.definition.string.begin.coffee'
      to %r/'''/,
        0 => 'punctuation.definition.string.end.coffee'
    end
    rule 'string.quoted.double.heredoc.coffee' do
      from %r/"""/,
        0 => 'punctuation.definition.string.begin.coffee'
      to %r/"""/,
        0 => 'punctuation.definition.string.end.coffee'
      rule 'constant.character.escape.coffee' do
        match %r/\\./
      end
      include "#interpolated_coffee"
    end
    rule 'string.quoted.script.coffee' do
      from %r/`/,
        0 => 'punctuation.definition.string.begin.coffee'
      to %r/`/,
        0 => 'punctuation.definition.string.end.coffee'
      rule 'constant.character.escape.coffee' do
        match %r/\\(x\h{2}|[0-2][0-7]{,2}|3[0-6][0-7]|37[0-7]?|[4-7][0-7]?|.)/
      end
    end
    rule 'comment.block.coffee' do
      from %r/(?<!#)###(?!#)/
      to %r/###(?:[ \t]*\n)/
      both 0 => 'punctuation.definition.comment.coffee'
      rule 'storage.type.annotation.coffeescript' do
        match %r/@\w*/
      end
    end
    rule 'comment.line.number-sign.coffee' do
      match %r/(#)(?!\{).*$\n?/,
        1 => 'punctuation.definition.comment.coffee'
    end
    rule 'string.regexp.block.coffee' do
      from %r'/{3}',
        0 => 'punctuation.definition.string.begin.coffee'
      to %r'(/{3})[imgy]{0,4}',
        1 => 'punctuation.definition.string.end.coffee'
      include "source.js.regexp"
    end
    rule 'string.regexp.coffee' do
      from %r'/(?![\s=/*+{}?])',
        0 => 'punctuation.definition.string.begin.coffee'
      to %r'(/)[igmy]*(?![a-zA-Z0-9])',
        1 => 'punctuation.definition.string.end.coffee'
      include "source.js.regexp"
    end
    rule 'keyword.control.coffee' do
      match %r/\b(?<![\.\$])(break|by|catch|continue|else|finally|for|in|of|if|return|switch|then|throw|try|unless|when|while|until|loop|do|(?<=for)\s+own)(?!\s*:)\b/
    end
    rule 'keyword.operator.coffee' do
      match %r'and=|or=|!|%|&|\^|\*|\/|\-\-|\-|\+\+|\+|~|===|==|=|!=|!==|<=|>=|<<=|>>=|>>>=|<>|<|>|!|&&|\?|\||\|\||\:|\*=|(?<!\()/=|%=|\+=|\-=|&=|\^=|\b(?<![\.\$])(instanceof|new|delete|typeof|and|or|is|isnt|not)\b'
    end
    rule 'variable.assignment.coffee' do
      match %r/([a-zA-Z\$_](\w|\$|\.)*\s*(?!\::)((:)|(=))(?!(\s*\(.*\))?\s*((=|-)>)))/,
        1 => 'variable.assignment.coffee',
        4 => 'punctuation.separator.key-value',
        5 => 'keyword.operator.coffee'
    end
    rule 'meta.variable.assignment.destructured.coffee' do
      from %r/(?<=\s|^)([\[\{])(?=.*?[\]\}]\s+[:=])/
      to %r/([\]\}]\s*[:=])/
      both 0 => 'keyword.operator.coffee'
      include "#variable_name"
      include "#instance_variable"
      include "#single_quoted_string"
      include "#double_quoted_string"
      include "#numeric"
    end
    rule 'meta.function.coffee' do
      match %r/(\s*)(?=@?[a-zA-Z\$_])(@?[a-zA-Z\$_](\w|\$|:|\.)*\s*(?=[:=](\s*(\()(.*)(\)))?\s*((=|-)>)))/,
        2 => 'entity.name.function.coffee',
        3 => 'entity.name.function.coffee',
        5 => 'punctuation.definition.parameters.begin.coffee',
        7 => 'punctuation.definition.parameters.begin.coffee',
        8 => 'storage.type.function.coffee'
    end
    rule 'storage.type.function.coffee' do
      match %r/(=|-)>/
    end
    rule 'constant.language.boolean.true.coffee' do
      match %r/\b(?<!\.)(true|on|yes)(?!\s*[:=])\b/
    end
    rule 'constant.language.boolean.false.coffee' do
      match %r/\b(?<!\.)(false|off|no)(?!\s*[:=])\b/
    end
    rule 'constant.language.null.coffee' do
      match %r/\b(?<!\.)null(?!\s*[:=])\b/
    end
    rule 'variable.language.coffee' do
      match %r/\b(?<!\.)(super|this|extends)(?!\s*[:=])\b/
    end
    rule 'meta.class.coffee' do
      match %r/(class\b)(?:\s+(extends)\s+(@?[a-zA-Z\$\._][\w\.]*))/,
        1 => 'storage.type.class.coffee',
        2 => 'keyword.control.inheritance.coffee',
        3 => 'entity.other.inherited-class.coffee'
    end
    rule 'meta.class.coffee' do
      match %r/(class\b)\s+(@?[a-zA-Z\$_][\w\.]*)?(?:\s+(extends)\s+(@?[a-zA-Z\$\._][\w\.]*))?/,
        1 => 'storage.type.class.coffee',
        2 => 'entity.name.type.class.coffee',
        3 => 'keyword.control.inheritance.coffee',
        4 => 'entity.other.inherited-class.coffee'
    end
    rule 'keyword.other.coffee' do
      match %r/\b(debugger|\\)\b/
    end
    rule 'constant.language.coffee' do
      match %r/\b(Infinity|NaN|undefined)\b/
    end
    rule 'punctuation.terminator.statement.coffee' do
      match %r/\;/
    end
    rule 'meta.delimiter.object.comma.coffee' do
      match %r/,[ |\t]*/
    end
    rule 'meta.delimiter.method.period.coffee' do
      match %r/\./
    end
    rule 'meta.brace.curly.coffee' do
      match %r/\{|\}/
    end
    rule 'meta.brace.round.coffee' do
      match %r/\(|\)/
    end
    rule 'meta.brace.square.coffee' do
      match %r/\[|\]\s*/
    end
    include "#instance_variable"
    include "#single_quoted_string"
    include "#double_quoted_string"
    include "#numeric"
  end

  fragment :double_quoted_string do
    rule 'string.quoted.double.coffee' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.coffee'
      to %r/"/,
        0 => 'punctuation.definition.string.end.coffee'
      rule 'constant.character.escape.coffee' do
        match %r/\\(x\h{2}|[0-2][0-7]{,2}|3[0-6][0-7]|37[0-7]?|[4-7][0-7]?|.)/
      end
      include "#interpolated_coffee"
    end
  end

  # FIXME: this fragment is never referenced
  fragment :embedded_comment do
    rule 'comment.line.number-sign.coffee' do
      match %r/(?<!\\)(#).*$\n?/,
        1 => 'punctuation.definition.comment.coffee'
    end
  end

  fragment :escape do
    rule 'constant.character.escape.markdown' do
      match %r/\\[-`*_#+.!(){}\[\]\\>]/
    end
  end

  fragment :heading do
    rule 'markup.heading.markdown' do
      content_scope "entity.name.section.markdown"
      # FIXME: (error) '#{' will be interpreted as interpolation: escape '#' as '\#'
      from %r/\G(#{1,6})(?!#)\s*(?=\S)/
      to %r/\s*(#*)$\n?/
      both 1 => 'punctuation.definition.heading.markdown'
      include "#inline"
    end
  end

  fragment :"image-inline" do
    rule 'meta.image.inline.markdown' do
      match %r/(?x:
        \!              # Images start with !
        (\[)((?<square>[^\[\]\\]|\\.|\[\g<square>*+\])*+)(\])  
                      # Match the link text.
        ([ ])?            # Space not allowed
        (\()            # Opening paren for url
          (<?)(\S+?)(>?)      # The url
          [ \t]*          # Optional whitespace
          (?:
              ((\().+?(\)))    # Match title in parens…
            | ((").+?("))    # or in quotes.
          )?            # Title is optional
          \s*            # Optional whitespace
        (\))
       )/,
        1 => 'punctuation.definition.string.begin.markdown',
        2 => 'string.other.link.description.markdown',
        3 => 'punctuation.definition.string.end.markdown',
        5 => 'invalid.illegal.whitespace.markdown',
        6 => 'punctuation.definition.metadata.markdown',
        7 => 'punctuation.definition.link.markdown',
        8 => 'markup.underline.link.image.markdown',
        9 => 'punctuation.definition.link.markdown',
        10 => 'string.other.link.description.title.markdown',
        11 => 'punctuation.definition.string.markdown',
        12 => 'punctuation.definition.string.markdown',
        13 => 'string.other.link.description.title.markdown',
        14 => 'punctuation.definition.string.markdown',
        15 => 'punctuation.definition.string.markdown',
        16 => 'punctuation.definition.metadata.markdown'
    end
  end

  fragment :"image-ref" do
    rule 'meta.image.reference.markdown' do
      match %r/\!(\[)((?<square>[^\[\]\\]|\\.|\[\g<square>*+\])*+)(\])[ ]?(\[)(.*?)(\])/,
        1 => 'punctuation.definition.string.begin.markdown',
        2 => 'string.other.link.description.markdown',
        4 => 'punctuation.definition.string.begin.markdown',
        5 => 'punctuation.definition.constant.markdown',
        6 => 'constant.other.reference.link.markdown',
        7 => 'punctuation.definition.constant.markdown'
    end
  end

  fragment :inline do
    include "#escape"
    include "#ampersand"
    include "#bracket"
    include "#raw"
    include "#bold"
    include "#italic"
    include "#line-break"
    include "#image-inline"
    include "#link-inline"
    include "#link-inet"
    include "#link-email"
    include "#image-ref"
    include "#link-ref-literal"
    include "#link-ref"
  end

  fragment :instance_variable do
    rule 'variable.other.readwrite.instance.coffee' do
      match %r/(@)([a-zA-Z_\$]\w*)?/
    end
  end

  fragment :interpolated_coffee do
    rule 'meta.embedded.line.coffee' do
      content_scope "source.coffee"
      from %r/#\{/,
        0 => 'punctuation.section.embedded.begin.coffee'
      to %r/(\})/,
        0 => 'punctuation.section.embedded.end.coffee',
        1 => 'source.coffee'
      include "$self"
    end
  end

  fragment :italic do
    rule 'markup.italic.markdown' do
      # FIXME: (error) numbered backref/call is not allowed. (use name)
      from %r/(?x)
            (\*|_)(?=\S)                # Open
            (?=
              (
                  <[^>]*+>              # HTML tags
                | (?<raw>`+)([^`]|(?!(?<!`)\k<raw>(?!`))`)*+\k<raw>
                                  # Raw
                | \\[\\`*_{}\[\]()#.!+\->]?+      # Escapes
                | \[
                (        
                        (?<square>          # Named group
                      [^\[\]\\]        # Match most chars
                          | \\.            # Escaped chars
                          | \[ \g<square>*+ \]    # Nested brackets
                        )*+
                  \]
                  (
                    (              # Reference Link
                      [ ]?          # Optional space
                      \[[^\]]*+\]        # Ref name
                    )
                    | (              # Inline Link
                      \(            # Opening paren
                        [ \t]*+        # Optional whtiespace
                        <?(.*?)>?      # URL
                        [ \t]*+        # Optional whtiespace
                        (          # Optional Title
                          (?<title>['"])
                          (.*?)
                          \k<title>
                        )?
                      \)
                    )
                  )
                )
                | \1\1                # Must be bold closer
                | (?!(?<=\S)\1).            # Everything besides
                                  # style closer
              )++
              (?<=\S)\1                # Close
            )
          /
      to %r/(?<=\S)(\1)((?!\1)|(?=\1\1))/
      both 1 => 'punctuation.definition.italic.markdown'
      rule do
        from %r/(?=<[^>]*?>)/
        to %r/(?<=>)/
        to_last true
        include "text.html.basic"
      end
      include "#escape"
      include "#ampersand"
      include "#bracket"
      include "#raw"
      include "#bold"
      include "#image-inline"
      include "#link-inline"
      include "#link-inet"
      include "#link-email"
      include "#image-ref"
      include "#link-ref-literal"
      include "#link-ref"
    end
  end

  fragment :"line-break" do
    rule 'meta.dummy.line-break' do
      match %r/ {2,}$/
    end
  end

  fragment :"link-email" do
    rule 'meta.link.email.lt-gt.markdown' do
      match %r/(<)((?:mailto:)?[-.\w]+@[-a-z0-9]+(\.[-a-z0-9]+)*\.[a-z]+)(>)/,
        1 => 'punctuation.definition.link.markdown',
        2 => 'markup.underline.link.markdown',
        4 => 'punctuation.definition.link.markdown'
    end
  end

  fragment :"link-inet" do
    rule 'meta.link.inet.markdown' do
      match %r'(<)((?:https?|ftp)://.*?)(>)',
        1 => 'punctuation.definition.link.markdown',
        2 => 'markup.underline.link.markdown',
        3 => 'punctuation.definition.link.markdown'
    end
  end

  fragment :"link-inline" do
    rule 'meta.link.inline.markdown' do
      match %r/(?x:
        (\[)((?<square>[^\[\]\\]|\\.|\[\g<square>*+\])*+)(\])  
                      # Match the link text.
        ([ ])?            # Space not allowed
        (\()            # Opening paren for url
          (<?)(.*?)(>?)      # The url
          [ \t]*          # Optional whitespace
          (?:
              ((\().+?(\)))    # Match title in parens…
            | ((").+?("))    # or in quotes.
          )?            # Title is optional
          \s*            # Optional whitespace
        (\))
       )/,
        1 => 'punctuation.definition.string.begin.markdown',
        2 => 'string.other.link.title.markdown',
        4 => 'punctuation.definition.string.end.markdown',
        5 => 'invalid.illegal.whitespace.markdown',
        6 => 'punctuation.definition.metadata.markdown',
        7 => 'punctuation.definition.link.markdown',
        8 => 'markup.underline.link.markdown',
        9 => 'punctuation.definition.link.markdown',
        10 => 'string.other.link.description.title.markdown',
        11 => 'punctuation.definition.string.begin.markdown',
        12 => 'punctuation.definition.string.end.markdown',
        13 => 'string.other.link.description.title.markdown',
        14 => 'punctuation.definition.string.begin.markdown',
        15 => 'punctuation.definition.string.end.markdown',
        16 => 'punctuation.definition.metadata.markdown'
    end
  end

  fragment :"link-ref" do
    rule 'meta.link.reference.markdown' do
      match %r/(\[)((?<square>[^\[\]\\]|\\.|\[\g<square>*+\])*+)(\])[ ]?(\[)([^\]]*+)(\])/,
        1 => 'punctuation.definition.string.begin.markdown',
        2 => 'string.other.link.title.markdown',
        4 => 'punctuation.definition.string.end.markdown',
        5 => 'punctuation.definition.constant.begin.markdown',
        6 => 'constant.other.reference.link.markdown',
        7 => 'punctuation.definition.constant.end.markdown'
    end
  end

  fragment :"link-ref-literal" do
    rule 'meta.link.reference.literal.markdown' do
      match %r/(\[)((?<square>[^\[\]\\]|\\.|\[\g<square>*+\])*+)(\])[ ]?(\[)(\])/,
        1 => 'punctuation.definition.string.begin.markdown',
        2 => 'string.other.link.title.markdown',
        4 => 'punctuation.definition.string.end.markdown',
        5 => 'punctuation.definition.constant.begin.markdown',
        6 => 'punctuation.definition.constant.end.markdown'
    end
  end

  fragment :"list-paragraph" do
    rule 'meta.paragraph.list.markdown' do
      from %r/\G\s+(?=\S)/
      to %r/^\s*$/
      include "#inline"
      rule do
        # Match the list punctuation
        match %r/^\s*([*+-]|[0-9]+\.)/,
          1 => 'punctuation.definition.list_item.markdown'
      end
    end
  end

  fragment :numeric do
    rule 'constant.numeric.coffee' do
      match %r/(?<!\$)\b((0([box])[0-9a-fA-F]+)|([0-9]+(\.[0-9]+)?(e[+\-]?[0-9]+)?))\b/
    end
  end

  fragment :raw do
    rule 'markup.raw.inline.markdown' do
      match %r/(`+)([^`]|(?!(?<!`)\1(?!`))`)*+(\1)/,
        1 => 'punctuation.definition.raw.markdown',
        3 => 'punctuation.definition.raw.markdown'
    end
  end

  fragment :separator do
    rule 'meta.separator.markdown' do
      match %r/\G[ ]{,3}([-*_])([ ]{,2}\1){2,}[ \t]*$\n?/
    end
  end

  fragment :single_quoted_string do
    rule 'string.quoted.single.coffee' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.coffee'
      to %r/'/,
        0 => 'punctuation.definition.string.end.coffee'
      rule 'constant.character.escape.coffee' do
        match %r/\\(x\h{2}|[0-2][0-7]{,2}|3[0-6][0-7]?|37[0-7]?|[4-7][0-7]?|.)/
      end
    end
  end

  fragment :variable_name do
    rule 'variable.assignment.coffee' do
      match %r/([a-zA-Z\$_]\w*(\.\w+)*)/,
        1 => 'variable.assignment.coffee'
    end
  end
end
