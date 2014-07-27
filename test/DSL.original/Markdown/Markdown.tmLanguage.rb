# encoding: utf-8

language 'Markdown' => 'text.html.markdown' do
  file_types %w(mdown markdown markdn md)
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
  key_equivalent "^~M"  # TextMate only
  uuid "0A1D9874-B448-11D9-BD50-000D93B6E43C"  # TextMate only

  rule 'meta.block-level.markdown' do
    #
    # We could also use an empty end match and set
    # applyEndPatternLast, but then we must be sure that the begin
    # pattern will only match stuff matched by the sub-patterns.
    #
    from %r/(?x)^
        (?=  [ ]{,3}>.
        |  ([ ]{4}|\t)(?!$)
        |  [#]{1,6}\s*+
        |  [ ]{,3}(?<marker>[-*_])([ ]{,2}\k<marker>){2,}[ \t]*+$
        )/
    to %r/(?x)^
        (?!  [ ]{,3}>.
        |  ([ ]{4}|\t)
        |  [#]{1,6}\s*+
        |  [ ]{,3}(?<marker>[-*_])([ ]{,2}\k<marker>){2,}[ \t]*+$
        )/
    include "#block_quote"
    include "#block_raw"
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
    from %r/^[ ]{0,3}[0-9]+(\.)(?=\s)/
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
    rule 'markup.raw.block.markdown' do
      match %r/\G([ ]{4}|\t).*$\n?/
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
end
