# encoding: utf-8

language 'Textile' => 'text.html.textile' do
  file_types %w(textile)
  first_line_match %r/textile/
  key_equivalent "^~T"  # TextMate only
  uuid "68F0B1A5-3274-4E85-8B3A-A481C5F5B194"  # TextMate only

  rule 'markup.heading.textile' do
    from %r/(^h[1-6]([<>=()]+)?)(\([^)]*\)|{[^}]*})*(\.)/
    to %r/^$/
    both 1 => 'entity.name.tag.heading.textile',
         3 => 'entity.name.type.textile',
         4 => 'entity.name.tag.heading.textile'
    include "#inline"
    include "text.html.basic"
  end
  rule 'markup.quote.textile' do
    from %r/(^bq([<>=()]+)?)(\([^)]*\)|{[^}]*})*(\.)/
    to %r/^$/
    both 1 => 'entity.name.tag.blockquote.textile',
         3 => 'entity.name.type.textile',
         4 => 'entity.name.tag.blockquote.textile'
    include "#inline"
    include "text.html.basic"
  end
  rule 'markup.other.footnote.textile' do
    from %r/(^fn[0-9]+([<>=()]+)?)(\([^)]*\)|{[^}]*})*(\.)/
    to %r/^$/
    both 1 => 'entity.name.tag.footnote.textile',
         3 => 'entity.name.type.textile',
         4 => 'entity.name.tag.footnote.textile'
    include "#inline"
    include "text.html.basic"
  end
  rule 'markup.other.table.textile' do
    from %r/(^table([<>=()]+)?)(\([^)]*\)|{[^}]*})*(\.)/
    to %r/^$/
    both 1 => 'entity.name.tag.footnote.textile',
         3 => 'entity.name.type.textile',
         4 => 'entity.name.tag.footnote.textile'
    include "#inline"
    include "text.html.basic"
  end
  rule 'meta.paragraph.textile' do
    from %r/^(?=\S)/
    to %r/^$/
    rule 'entity.name.section.paragraph.textile' do
      match %r/(^p([<>=()]+)?)(\([^)]*\)|{[^}]*})*(\.)/,
        1 => 'entity.name.tag.paragraph.textile',
        3 => 'entity.name.type.textile',
        4 => 'entity.name.tag.paragraph.textile'
    end
    include "#inline"
    include "text.html.basic"
  end
  # Since html is valid in Textile include the html patterns
  include "text.html.basic"

  fragment :inline do
    rule 'text.html.textile' do
      # & is handled automagically by textile, so we match it to avoid text.html.basic from flagging it
      match %r/&(?![A-Za-z0-9]+;)/
    end
    rule 'markup.list.unnumbered.textile' do
      match %r/^\*+(\([^)]*\)|{[^}]*})*(\s+|$)/,
        1 => 'entity.name.type.textile'
    end
    rule 'markup.list.numbered.textile' do
      match %r/^#+(\([^)]*\)|{[^}]*})*\s+/,
        1 => 'entity.name.type.textile'
    end
    rule 'meta.link.reference.textile' do
      match %r'(?x)
                "                # Start name, etc
                  (?:              # Attributes
                    # I swear, this is how the language is defined,
                    # couldnt make it up if I tried.
                    (?:\([^)]+\))?(?:\{[^}]+\})?(?:\[[^\]]+\])?
                      # Class, Style, Lang
                    | (?:\{[^}]+\})?(?:\[[^\]]+\])?(?:\([^)]+\))?
                      # Style, Lang, Class
                    | (?:\[[^\]]+\])?(?:\{[^}]+\})?(?:\([^)]+\))?
                      # Lang, Style, Class
                  )?
                  ([^"]+?)          # Link name
                  \s?              # Optional whitespace
                  (?:\(([^)]+?)\))?
                ":                # End name
                (\w[-\w]*)            # Linkref
                (?=[^\w/;]*?(<|\s|$))      # Catch closing punctuation
                                #  and end of meta.link
          ',
        1 => 'string.other.link.title.textile',
        2 => 'string.other.link.description.title.textile',
        3 => 'constant.other.reference.link.textile'
    end
    rule 'meta.link.inline.textile' do
      match %r'(?x)
                "                # Start name, etc
                  (?:              # Attributes
                    # I swear, this is how the language is defined,
                    # couldnt make it up if I tried.
                    (?:\([^)]+\))?(?:\{[^}]+\})?(?:\[[^\]]+\])?
                      # Class, Style, Lang
                    | (?:\{[^}]+\})?(?:\[[^\]]+\])?(?:\([^)]+\))?
                      # Style, Lang, Class
                    | (?:\[[^\]]+\])?(?:\{[^}]+\})?(?:\([^)]+\))?
                      # Lang, Style, Class
                  )?
                  ([^"]+?)          # Link name
                  \s?              # Optional whitespace
                  (?:\(([^)]+?)\))?
                ":                # End Name
                (\S*?(?:\w|/|;))        # URL
                (?=[^\w/;]*?(<|\s|$))      # Catch closing punctuation
                                #  and end of meta.link
          ',
        1 => 'string.other.link.title.textile',
        2 => 'string.other.link.description.title.textile',
        3 => 'markup.underline.link.textile'
    end
    rule 'meta.image.inline.textile' do
      match %r'(?x)
                \!                    # Open image
                (\<|\=|\>)?                # Optional alignment
                (?:                    # Attributes
                  # I swear, this is how the language is defined,
                  # couldnt make it up if I tried.
                  (?:\([^)]+\))?(?:\{[^}]+\})?(?:\[[^\]]+\])?
                    # Class, Style, Lang
                  | (?:\{[^}]+\})?(?:\[[^\]]+\])?(?:\([^)]+\))?
                    # Style, Lang, Class
                  | (?:\[[^\]]+\])?(?:\{[^}]+\})?(?:\([^)]+\))?
                    # Lang, Style, Class
                )?
                (?:\.[ ])?                      # Optional
                ([^\s(!]+?)                   # Image URL
                \s?                            # Optional space
                (?:\(((?:[^\(\)]|\([^\)]+\))+?)\))?     # Optional title
                \!                    # Close image
                (?:
                  :
                  (\S*?(?:\w|/|;))          # URL
                  (?=[^\w/;]*?(<|\s|$))        # Catch closing punctuation
                )?
          ',
        2 => 'markup.underline.link.image.textile',
        3 => 'string.other.link.description.textile',
        4 => 'markup.underline.link.textile'
    end
    rule 'markup.other.table.cell.textile' do
      match %r/\|(\([^)]*\)|{[^}]*})*(\\\||.)+\|/,
        1 => 'entity.name.type.textile'
    end
    rule 'markup.bold.textile' do
      match %r/\B(\*\*?)((\([^\)]*\)|{[^}]*}|\[[^\]]+\]){0,3})(\S.*?\S|\S)\1\B/,
        3 => 'entity.name.type.textile'
    end
    rule 'markup.deleted.textile' do
      match %r/\B-((\([^\)]*\)|{[^}]*}|\[[^\]]+\]){0,3})(\S.*?\S|\S)-\B/,
        2 => 'entity.name.type.textile'
    end
    rule 'markup.inserted.textile' do
      match %r/\B\+((\([^\)]*\)|{[^}]*}|\[[^\]]+\]){0,3})(\S.*?\S|\S)\+\B/,
        2 => 'entity.name.type.textile'
    end
    rule 'markup.italic.textile' do
      match %r/(?:\b|\s)_((\([^\)]*\)|{[^}]*}|\[[^\]]+\]){0,3})(\S.*?\S|\S)_(?:\b|\s)/,
        2 => 'entity.name.type.textile'
    end
    rule 'markup.italic.phrasemodifiers.textile' do
      match %r/\B([@\^~%]|\?\?)((\([^\)]*\)|{[^}]*}|\[[^\]]+\]){0,3})(\S.*?\S|\S)\1/,
        3 => 'entity.name.type.textile'
    end
    rule 'entity.name.tag.textile' do
      # Footnotes
      match %r/(?<!w)\[[0-9+]\]/
    end
  end
end
