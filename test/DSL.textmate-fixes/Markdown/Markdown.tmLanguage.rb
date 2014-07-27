# encoding: utf-8

language 'Markdown' => 'text.html.markdown' do
  file_types %w(md mdown markdown markdn)
  key_equivalent "^~M"  # TextMate only
  uuid "0A1D9874-B448-11D9-BD50-000D93B6E43C"  # TextMate only

  include "#block"

  fragment :block do
    include "#separator"
    include "#heading"
    include "#blockquote"
    include "#lists"
    include "#raw_block"
    include "#link-def"
    include "#html"
    include "#paragraph"
  end

  fragment :blockquote do
    rule 'markup.quote.markdown' do
      from %r/(^|\G)(>) ?/
      to %r//
      both 2 => 'punctuation.definition.quote.markdown'
      include "#block"
    end
  end

  fragment :heading do
    rule 'markup.heading.${1/(#)(#)?(#)?(#)?(#)?(#)?/${6:?6:${5:?5:${4:?4:${3:?3:${2:?2:1}}}}}/}.markdown' do
      content_scope "entity.name.section.markdown"
      # FIXME: (error) '#{' will be interpreted as interpolation: escape '#' as '\#'
      from %r/(?:^|\G)(\#{1,6})\s*(?=[\S[^#]])/
      # FIXME: (error) '#{' will be interpreted as interpolation: escape '#' as '\#'
      to %r/\s*(\#{1,6})?$\n?/
      both 1 => 'punctuation.definition.heading.markdown'
      include "#inline"
    end
  end

  fragment :"heading-setext" do
    rule 'markup.heading.setext.1.markdown' do
      match %r/^(={3,})(?=[ \t]*$\n?)/
    end
    rule 'markup.heading.setext.2.markdown' do
      match %r/^(-{3,})(?=[ \t]*$\n?)/
    end
  end

  fragment :html do
    rule do
      from %r'(?i)(^|\G)(?=<(p|div|h[1-6]|blockquote|pre|table|dl|ol|ul|script|noscript|form|fieldset|iframe|math|ins|del).*</\2\s*>\s*$)'
      to %r/$/
      include "text.html.basic"
    end
    rule do
      from %r/(?i)(^|\G)(?=<(p|div|h[1-6]|blockquote|pre|table|dl|ol|ul|script|noscript|form|fieldset|iframe|math|ins|del))/
      to %r//
      include "text.html.basic"
    end
  end

  fragment :"link-def" do
    rule 'meta.link.reference.def.markdown' do
      match %r/^(?x:
                \s*           # Leading whitespace
                (\[)(.+?)(\])(:)    # Reference name
                [ \t]*          # Optional whitespace
                (<?)(\S+?)(>?)      # The url
                [ \t]*          # Optional whitespace
                (?:
                    ((\().+?(\)))   # Match title in quotes…
                  | ((").+?("))   # or in parens.
                )?            # Title is optional
                \s*           # Optional whitespace
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
  end

  fragment :list_paragraph do
    rule 'meta.paragraph.markdown' do
      from %r/(^|\G)(?=\S)(?![*+-]\s|[0-9]+\.\s)/
      to %r//
      include "#inline"
      include "text.html.basic"
      include "#heading-setext"
    end
  end

  fragment :lists do
    rule 'markup.list.unnumbered.markdown' do
      # Currently does not support un-indented second lines.
      from %r/(^|\G)([ ]{0,3})([*+-])([ ]{1,3}|\t)/,
        3 => 'punctuation.definition.list.markdown'
      to %r//
      include "#list_paragraph"
      include "#block"
    end
    rule 'markup.list.numbered.markdown' do
      from %r/(^|\G)([ ]{0,3})([0-9]+\.)([ ]{1,3}|\t)/,
        3 => 'punctuation.definition.list.markdown'
      to %r//
      include "#list_paragraph"
      include "#block"
    end
  end

  fragment :paragraph do
    rule 'meta.paragraph.markdown' do
      from %r/(^|\G)(?=\S)/
      to %r//
      include "#inline"
      include "text.html.basic"
      include "#heading-setext"
    end
  end

  fragment :raw_block do
    rule 'markup.raw.block.markdown' do
      from %r/(^|\G)([ ]{4}|\t)/
      to %r//
    end
  end

  fragment :separator do
    rule 'meta.separator.markdown' do
      match %r/(^|\G)[ ]{,3}([-*_])([ ]{,2}\2){2,}[ \t]*$\n?/
    end
  end

  fragment :inline do
    include "#ampersand"
    include "#bracket"
    include "#bold"
    include "#italic"
    include "#raw"
    include "#escape"
    include "#image-inline"
    include "#image-ref"
    include "#link-email"
    include "#link-inet"
    include "#link-inline"
    include "#link-ref"
    include "#link-ref-literal"
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

  fragment :bold do
    rule 'markup.bold.markdown' do
      # FIXME: (error) numbered backref/call is not allowed. (use name)
      from %r/(?x)
            (?<open>\*\*|__)(?=\S)               # Open
            (?=
              (
                  <[^>]*+>             # HTML tags
                | (?<raw>`+)([^`]|(?!(?<!`)\k<raw>(?!`))`)*+\k<raw>
                                  # Raw
                | \\[\\`*_{}\[\]()#.!+\->]?+     # Escapes
                | \[
                (
                        (?<square>          # Named group
                      [^\[\]\\]       # Match most chars
                          | \\.           # Escaped chars
                          | \[ \g<square>*+ \]    # Nested brackets
                        )*+
                  \]
                  (
                    (             # Reference Link
                      [ ]?          # Optional space
                      \[[^\]]*+\]       # Ref name
                    )
                    | (             # Inline Link
                      \(            # Opening paren
                        [ \t]*+       # Optional whtiespace
                        <?(.*?)>?     # URL
                        [ \t]*+       # Optional whtiespace
                        (         # Optional Title
                          (?<title>['"])
                          (.*?)
                          \k<title>
                        )?
                      \)
                    )
                  )
                )
                | (?!(?<=\S)\k<open>).           # Everything besides
                                  # style closer
              )++
              (?<=\S)\k<open>                # Close
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
              ((\().+?(\)))   # Match title in parens…
            | ((").+?("))   # or in quotes.
          )?            # Title is optional
          \s*           # Optional whitespace
        (\))
       )/,
        1 => 'punctuation.definition.string.begin.markdown',
        2 => 'string.other.link.description.markdown',
        4 => 'punctuation.definition.string.end.markdown',
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

  fragment :italic do
    rule 'markup.italic.markdown' do
      # FIXME: (error) numbered backref/call is not allowed. (use name)
      from %r/(?x)
            (?<open>\*|_)(?=\S)                # Open
            (?=
              (
                  <[^>]*+>             # HTML tags
                | (?<raw>`+)([^`]|(?!(?<!`)\k<raw>(?!`))`)*+\k<raw>
                                  # Raw
                | \\[\\`*_{}\[\]()#.!+\->]?+     # Escapes
                | \[
                (
                        (?<square>          # Named group
                      [^\[\]\\]       # Match most chars
                          | \\.           # Escaped chars
                          | \[ \g<square>*+ \]    # Nested brackets
                        )*+
                  \]
                  (
                    (             # Reference Link
                      [ ]?          # Optional space
                      \[[^\]]*+\]       # Ref name
                    )
                    | (             # Inline Link
                      \(            # Opening paren
                        [ \t]*+       # Optional whtiespace
                        <?(.*?)>?     # URL
                        [ \t]*+       # Optional whtiespace
                        (         # Optional Title
                          (?<title>['"])
                          (.*?)
                          \k<title>
                        )?
                      \)
                    )
                  )
                )
                | \k<open>\k<open>                # Must be bold closer
                | (?!(?<=\S)\k<open>).           # Everything besides
                                  # style closer
              )++
              (?<=\S)\k<open>                # Close
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
          (<?)(.*?)(>?)     # The url
          [ \t]*          # Optional whitespace
          (?:
              ((\().+?(\)))   # Match title in parens…
            | ((").+?("))   # or in quotes.
          )?            # Title is optional
          \s*           # Optional whitespace
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

  fragment :raw do
    rule 'markup.raw.inline.markdown' do
      match %r/(`+)([^`]|(?!(?<!`)\1(?!`))`)*+(\1)/,
        1 => 'punctuation.definition.raw.markdown',
        3 => 'punctuation.definition.raw.markdown'
    end
  end
end
