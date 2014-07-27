# encoding: utf-8

language 'DokuWiki' => 'text.html.dokuwiki' do
  # FIXME: no file types
  first_line_match %r/^\s*={2,}(.*)={2,}\s*$/
  key_equivalent "^~D"  # TextMate only
  uuid "862D8B02-501E-4205-9DA4-FB7CDA7AE3DA"  # TextMate only

  include "#php"
  include "#inline"
  rule 'string.quoted.double.dokuwiki' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.dokuwiki'
    to %r/"/,
      0 => 'punctuation.definition.string.end.dokuwiki'
    rule 'constant.character.escape.dokuwiki' do
      match %r/\\./
    end
  end
  rule 'comment.block.documentation.dokuwiki' do
    from %r/\(\(/
    to %r/\)\)/
    both 0 => 'punctuation.definition.comment.dokuwiki'
  end
  rule 'markup.heading.dokuwiki' do
    match %r/^\s*(={2,})(.*)(={2,})\s*$\n?/,
      1 => 'punctuation.definition.heading.dokuwiki',
      3 => 'punctuation.definition.heading.dokuwiki'
  end
  rule 'keyword.other.notoc.dokuwiki' do
    match %r/~~NOTOC~~/
  end
  rule 'keyword.other.nocache.dokuwiki' do
    match %r/~~NOCACHE~~/
  end
  rule 'meta.separator.dokuwiki' do
    match %r/^\s*-{4,}\s*$/
  end
  rule 'markup.other.paragraph.dokuwiki' do
    match %r/\\\\\s/
  end
  rule 'markup.list.unnumbered.dokuwiki' do
    from %r/^((\t+)|( {2,}))(\*)/
    to %r/$\n?/
    both 4 => 'punctuation.definition.list_item.dokuwiki'
    include "#inline"
  end
  rule 'markup.list.numbered.dokuwiki' do
    from %r/^((\t+)|( {2,}))(-)/
    to %r/$\n?/
    both 4 => 'punctuation.definition.list_item.dokuwiki'
    include "#inline"
  end
  rule 'markup.other.table.dokuwiki' do
    from %r/^[|^]/,
      0 => 'punctuation.definition.table.dokuwiki'
    to %r/$/
    include "#inline"
  end
  rule 'markup.raw.dokuwiki' do
    from %r/(\<)(file|nowiki)(\>)/
    to %r'(<\/)(\2)(\>)'
    both 0 => 'meta.tag.template.dokuwiki',
         1 => 'punctuation.definition.tag.dokuwiki',
         2 => 'entity.name.tag.dokuwiki',
         3 => 'punctuation.definition.tag.dokuwiki'
  end
  rule 'markup.raw.dokuwiki' do
    from %r/(%%|\'\')/
    to %r/§1/
    both 0 => 'punctuation.definition.raw.dokuwiki'
  end
  rule do
    from %r/(<)(html)(>)/
    to %r'(</)(html)(>)'
    both 0 => 'meta.tag.template.block.dokuwiki',
         1 => 'punctuation.definition.tag.dokuwiki',
         2 => 'entity.name.tag.dokuwiki',
         3 => 'punctuation.definition.tag.dokuwiki'
    include "text.html.basic"
  end
  rule 'markup.raw.dokuwiki' do
    match %r/^((\s\s)|(\t))[^\*\-].*$/
  end
  rule 'markup.other.dokuwiki' do
    from %r/(\<)(sub|sup|del)(\>)/
    to %r'(\</)(\2)(\>)'
    both 0 => 'meta.tag.template.dokuwiki',
         1 => 'punctuation.definition.tag.dokuwiki',
         2 => 'entity.name.tag.dokuwiki',
         3 => 'punctuation.definition.tag.dokuwiki'
    include "#inline"
  end
  rule 'markup.raw.dokuwiki' do
    from %r/(<)(code)(?:\s+[^>]*)?(>)/
    to %r'(</)(code)(>)'
    both 0 => 'meta.tag.template.code.dokuwiki',
         1 => 'punctuation.definition.tag.dokuwiki',
         2 => 'entity.name.tag.dokuwiki',
         3 => 'punctuation.definition.tag.dokuwiki'
  end

  fragment :inline do
    rule 'markup.bold.dokuwiki' do
      from %r/\*\*/
      to %r/\*\*/
      both 0 => 'punctuation.definition.bold.dokuwiki'
      include "#inline"
    end
    rule 'markup.italic.dokuwiki' do
      from %r'//'
      to %r'//'
      both 0 => 'punctuation.definition.italic.dokuwiki'
      include "#inline"
    end
    rule 'markup.underline.dokuwiki' do
      from %r/__/
      to %r/__/
      both 0 => 'punctuation.definition.underline.dokuwiki'
      include "#inline"
    end
    rule 'meta.image.inline.dokuwiki' do
      match %r/(\{\{)(.+?)(\}\})/,
        1 => 'punctuation.definition.image.dokuwiki',
        2 => 'markup.underline.link.dokuwiki',
        3 => 'punctuation.definition.image.dokuwiki'
    end
    rule 'meta.link.dokuwiki' do
      match %r/(\[\[)(.*?)(\]\])/,
        1 => 'punctuation.definition.link.dokuwiki',
        2 => 'markup.underline.link.dokuwiki',
        3 => 'punctuation.definition.link.dokuwiki'
    end
    rule do
      match %r/(\[\[)([^\[\]]+\>[^|\]]+)(\]\])/,
        1 => 'punctuation.definition.link.dokuwiki',
        2 => 'markup.underline.link.interwiki.dokuwiki',
        3 => 'punctuation.definition.link.dokuwiki'
    end
    rule do
      match %r'((https?|telnet|gopher|wais|ftp|ed2k|irc)://[\w/\#~:.?+=&%@!\-;,]+?(?=[.:?\-;,]*[^\w/\#~:.?+=&%@!\-;,]))',
        1 => 'markup.underline.link.dokuwiki'
    end
    rule 'meta.link.email.dokuwiki' do
      # FIXME: (warning) character class has duplicated range
      match %r/(<)([\w0-9\-_.]+?@[\w\-]+\.[\w\-\.]+\.*[\w]+)(\>)/,
        1 => 'punctuation.definition.link.dokuwiki',
        2 => 'markup.underline.link.dokuwiki',
        3 => 'punctuation.definition.link.dokuwiki'
    end
  end

  fragment :php do
    include "source.php"
    rule do
      content_scope "meta.embedded.php"
      from %r/(^\s*)?(?=<php>)/,
        1 => 'punctuation.whitespace.embedded.leading.dokuwiki'
      to %r'(?<=</php>)(?!<php>)(\s*$\n?)',
        1 => 'punctuation.whitespace.embedded.trailing.dokuwiki'
      rule do
        content_scope "source.php"
        from %r/((<)(php)(>))/,
          0 => 'punctuation.definition.embedded.begin.dokuwiki',
          1 => 'meta.tag.template.dokuwiki',
          2 => 'punctuation.definition.tag.dokuwiki',
          3 => 'entity.name.tag.dokuwiki',
          4 => 'punctuation.definition.tag.dokuwiki'
        to %r'(((</))(php)(>))',
          0 => 'punctuation.definition.embedded.end.dokuwiki',
          1 => 'meta.tag.template.dokuwiki',
          2 => 'punctuation.definition.tag.dokuwiki',
          3 => 'source.php',
          4 => 'entity.name.tag.dokuwiki',
          5 => 'punctuation.definition.tag.dokuwiki'
        include "source.php"
      end
    end
  end
end
