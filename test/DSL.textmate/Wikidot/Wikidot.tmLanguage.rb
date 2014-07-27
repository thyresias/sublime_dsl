# encoding: utf-8

language 'Wikidot' => 'text.html.wikidot' do
  file_types %w(wikidot)
  first_line_match %r/(^\s*\+{1,}(.*)\s*$)|\[\!-- ?wikidot ?--\]/
  key_equivalent "^~W"  # TextMate only
  uuid "3E4B200F-1C2B-46B9-A715-822F6C0CB4F5"  # TextMate only

  include "#php"
  rule 'comment.line.documentation.wikidot' do
    # derived from html comment, using square brackets
    match %r/(\[!--(.*)--\])/
  end
  rule 'comment.block.documentation.wikidot' do
    from %r/\[!--/
    to %r/--\]/
    both 0 => 'comment.block.documentation.wikidot'
  end
  rule do
    from %r/(\[\[)(html)(\]\])/
    to %r'(\[\[/)(html)(\]\])'
    both 0 => 'meta.tag.template.block.wikidot',
         1 => 'punctuation.definition.tag.wikidot',
         2 => 'entity.name.tag.wikidot',
         3 => 'punctuation.definition.tag.wikidot'
    include "text.html.basic"
  end
  rule 'source.r.embedded' do
    from %r/(\[\[)(code)(\]\])/
    to %r'(\[\[/)(code)(\]\])'
    both 1 => 'punctuation.definition.tag.wikidot',
         2 => 'entity.name.tag.wikidot',
         3 => 'punctuation.definition.tag.wikidot'
    include "source.r"
  end
  rule 'markup.heading.1.wikidot' do
    match %r/^\s*(\+{1}) (.*)$\n?/,
      1 => 'punctuation.definition.heading.1.wikidot'
  end
  rule 'markup.heading.2.wikidot' do
    match %r/^\s*(\+{2}) (.*)$\n?/,
      1 => 'punctuation.definition.heading.2.wikidot'
  end
  rule 'markup.heading.3.wikidot' do
    match %r/^\s*(\+{3}) (.*)$\n?/,
      1 => 'punctuation.definition.heading.3.wikidot'
  end
  rule 'markup.heading.4.wikidot' do
    match %r/^\s*(\+{4}) (.*)$\n?/,
      1 => 'punctuation.definition.heading.4.wikidot'
  end
  rule 'markup.heading.5.wikidot' do
    match %r/^\s*(\+{5}) (.*)$\n?/,
      1 => 'punctuation.definition.heading.5.wikidot'
  end
  rule 'meta.separator.wikidot' do
    match %r/^\s*-{4,}\s*$\n?/
  end
  rule 'markup.other.paragraph.wikidot' do
    match %r/\\\\\s/
  end
  rule 'markup.bold.wikidot' do
    from %r/\*\*/
    to %r/\*\*/
    both 0 => 'punctuation.definition.bold.wikidot'
    include "#inline"
  end
  rule 'markup.list.unnumbered.wikidot' do
    # * list item
    from %r/^([\t ]*\*)/,
      1 => 'punctuation.definition.list_item.wikidot'
    to %r/$\n?/,
      0 => 'punctuation.definition.list_item.wikidot'
    include "#inline"
  end
  rule 'markup.list.numbered.wikidot' do
    # # list item
    from %r/^([\t ]*\#)/,
      1 => 'punctuation.definition.list_item.wikidot'
    to %r/$\n?/,
      0 => 'punctuation.definition.list_item.wikidot'
    include "#inline"
  end
  rule 'markup.heading.table.wikidot' do
    # || cell || cell ||
    match %r/\|\|~?/
  end
  rule 'markup.raw.wikidot' do
    from %r/(\<)(file|nowiki)(\>)/
    to %r'(<\/)(\2)(\>)'
    both 0 => 'meta.tag.template.wikidot',
         1 => 'punctuation.definition.tag.wikidot',
         2 => 'entity.name.tag.wikidot',
         3 => 'punctuation.definition.tag.wikidot'
  end
  rule 'markup.raw.wikidot' do
    from %r/(%%|\'\')/
    to %r/§1/
    both 0 => 'punctuation.definition.raw.wikidot'
  end
  rule 'markup.raw.wikidot' do
    match %r/^((\s\s)|(\t))[^\*\-#].*$\n?/
  end
  rule 'markup.other.wikidot' do
    from %r/(\<)(sub|sup|del)(\>)/
    to %r'(\</)(\2)(\>)'
    both 0 => 'meta.tag.template.wikidot',
         1 => 'punctuation.definition.tag.wikidot',
         2 => 'entity.name.tag.wikidot',
         3 => 'punctuation.definition.tag.wikidot'
    include "#inline"
  end
  rule 'markup.raw.wikidot' do
    from %r/(<)(code)(?:\s+[^>]*)?(>)/
    to %r'(</)(code)(>)'
    both 0 => 'meta.tag.template.code.wikidot',
         1 => 'punctuation.definition.tag.wikidot',
         2 => 'entity.name.tag.wikidot',
         3 => 'punctuation.definition.tag.wikidot'
  end
  include "#inline"
  rule 'string.quoted.double.wikidot' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.wikidot'
    to %r/"/,
      0 => 'punctuation.definition.string.end.wikidot'
    rule 'constant.character.escape.wikidot' do
      match %r/\\./
    end
  end

  fragment :inline do
    rule 'markup.bold.wikidot' do
      from %r/\*\*/
      to %r/\*\*/
      both 0 => 'punctuation.definition.bold.wikidot'
      include "#inline"
    end
    rule 'markup.italic.wikidot' do
      from %r'//'
      to %r'//'
      both 0 => 'punctuation.definition.italic.wikidot'
      include "#inline"
    end
    rule 'markup.underline.wikidot' do
      from %r/__/
      to %r/__/
      both 0 => 'punctuation.definition.underline.wikidot'
      include "#inline"
    end
    rule 'meta.image.inline.wikidot' do
      match %r/(\{\{)(.+?)(\}\})/,
        1 => 'punctuation.definition.image.wikidot',
        2 => 'markup.underline.link.wikidot',
        3 => 'punctuation.definition.image.wikidot'
    end
    rule 'meta.link.to.anchor.wikidot' do
      # [#anchorName display text]
      match %r/(\[)(#.+?) (.+?)(\])/,
        1 => 'punctuation.definition.link.wikidot',
        2 => 'entity.name.tag.wikidot',
        3 => 'markup.underline.link.wikidot',
        4 => 'punctuation.definition.link.wikidot'
    end
    rule 'meta.link.bibcite.wikidot' do
      # [((bibcite Ebstein1996))]
      match %r/(\[\(\()(bibcite) +(.+)(\)\)\])/,
        1 => 'punctuation.definition.link.wikidot',
        2 => 'entity.name.tag.wikidot',
        3 => 'markup.underline.link.wikidot',
        4 => 'punctuation.definition.link.wikidot'
    end
    rule 'meta.link.bibEntry.wikidot' do
      # : name: reference
      match %r/^(: )([^:]*)(:)/,
        1 => 'punctuation.definition.link.wikidot',
        2 => 'markup.underline.link.wikidot',
        3 => 'punctuation.definition.link.wikidot'
    end
    rule 'meta.tag.bib.wikidot' do
      # [[bibliography]]
      match %r'(\[\[/?)(bibliography)(\]\])',
        1 => 'punctuation.definition.link.wikidot',
        2 => 'entity.name.tag.wikidot',
        3 => 'punctuation.definition.link.wikidot'
    end
    rule 'meta.anchor.wikidot' do
      # [[# anchor-name]]
      match %r/(\[\[)(# )(.+?)(\]\])/,
        1 => 'punctuation.definition.link.wikidot',
        2 => 'entity.name.tag.wikidot',
        3 => 'markup.underline.link.wikidot',
        4 => 'punctuation.definition.link.wikidot'
    end
    rule 'meta.link.wikidot' do
      # [[[match any link]]]
      match %r/(\[{1,3})([^\] ]*)(| )?([^\]]*)?(\]{1,3})/,
        1 => 'punctuation.definition.link.wikidot',
        2 => 'markup.underline.link.wikidot',
        3 => 'entity.name.tag.wikidot',
        4 => 'punctuation.definition.link.wikidot'
    end
    rule do
      match %r/(\[\[)([^\[\]]+\>[^|\]]+)(\]\])/,
        1 => 'punctuation.definition.link.wikidot',
        2 => 'markup.underline.link.interwiki.wikidot',
        3 => 'punctuation.definition.link.wikidot'
    end
    rule do
      match %r'((https?|telnet|gopher|wais|ftp|ed2k|irc)://[\w/\#~:.?+=&%@!\-;,]+?(?=[.:?\-;,]*[^\w/\#~:.?+=&%@!\-;,]))',
        1 => 'markup.underline.link.wikidot'
    end
    rule 'meta.link.email.wikidot' do
      # FIXME: (warning) character class has duplicated range
      match %r/(<)([\w0-9\-_.]+?@[\w\-]+\.[\w\-\.]+\.*[\w]+)(\>)/,
        1 => 'punctuation.definition.link.wikidot',
        2 => 'markup.underline.link.wikidot',
        3 => 'punctuation.definition.link.wikidot'
    end
  end

  fragment :php do
    include "source.php"
    rule do
      content_scope "meta.embedded.php"
      from %r/(^\s*)?(?=<php>)/,
        1 => 'punctuation.whitespace.embedded.leading.wikidot'
      to %r'(?<=</php>)(?!<php>)(\s*$\n?)',
        1 => 'punctuation.whitespace.embedded.trailing.wikidot'
      rule do
        content_scope "source.php"
        from %r/((<)(php)(>))/,
          0 => 'punctuation.definition.embedded.begin.wikidot',
          1 => 'meta.tag.template.wikidot',
          2 => 'punctuation.definition.tag.wikidot',
          3 => 'entity.name.tag.wikidot',
          4 => 'punctuation.definition.tag.wikidot'
        to %r'(((</))(php)(>))',
          0 => 'punctuation.definition.embedded.end.wikidot',
          1 => 'meta.tag.template.wikidot',
          2 => 'punctuation.definition.tag.wikidot',
          3 => 'source.php',
          4 => 'entity.name.tag.wikidot',
          5 => 'punctuation.definition.tag.wikidot'
        include "source.php"
      end
    end
  end
end
