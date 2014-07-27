# encoding: utf-8

language 'Mediawiki' => 'text.html.mediawiki' do
  #
  # TODO: language
  #  1. Add a bunch of HTML tags.  See the #block and #style sections.
  #  2. Correctly scope all the parser functions and their contents.
  #     This on will be complicated, as there are several: expr, if, etc.
  #  3. Get some kind of folding by heading (Not possible with TM1 rules).
  #  4. Make sure that illegal things are correctly scoped illegal.
  #     This is non-trivial, and has several parts
  #     - Bold/italic are based on brain-dead heuristics.  Also, we should
  #       scope as illegal when for instance a new heading starts
  #       before an italic has been closed.
  #     - Templates... these will be pretty tough as they are flexible.
  #  5. <timeline></timeline> tag.  Not sure this one is worth the effort
  #
  #  6. Figure out a better scope for meta.function-call.  Infininight
  #     suggests entity.name.function.call, to be paralleled by
  #     entity.name.function.definition.  I am not completely sure I like
  #     that solution, but it is probably better than meta.function-call
  #
  # TODO snippets and commands
  #  1. Add a drop command (and keyboard shortcuts) for links/images
  #  2. Make sure all the preference items are sorted out, for instance
  #  smart typing pairs, indent patterns, etc.
  #  3. Command: big/small
  #
  # FINISHED:
  #  1. Add support for LaTeX math mode inside of <math></math> tags.
  #  2. Add a command for new list item.  This one is trivial
  #  3. Get the symbol list working on headings.  Trivial.
  #  4. <gallery></gallery> tag.  This one adds some complication, but
  #     is worth supporting.
  #  5. commands for bold/italic  (tbates)
  #  6. All lists scoped by type of list.  (tbates)
  #
  file_types %w(mediawiki wikipedia wiki)
  key_equivalent "^~M"  # TextMate only
  uuid "6AF21ADF-316A-47D1-A8B6-1BB38637DE9A"  # TextMate only

  include "#block"
  include "#inline"

  fragment :block do
    rule 'meta.redirect.mediawiki' do
      from %r/^\s*(?i)(#redirect)/,
        1 => 'keyword.control.redirect.mediawiki'
      to %r/\n/
      include "#link"
    end
    rule 'meta.tag.source.mediawiki' do
      # source: <source lang="R">
      from %r/ ?(<)(source)[ \t]+(lang)(=)("[^"]+")(>)/,
        1 => 'punctuation.definition.tag.mediawiki',
        2 => 'storage.type.mediawiki',
        3 => 'storage.type.mediawiki',
        4 => 'punctuation.section.mediawiki',
        5 => 'string.quoted.mediawiki',
        6 => 'punctuation.definition.tag.mediawiki'
      to %r' ?(</)(source)(>)',
        1 => 'punctuation.definition.tag.mediawiki',
        2 => 'storage.type.mediawiki',
        3 => 'punctuation.definition.tag.mediawiki'
      include "#tag-stuff"
    end
    rule 'markup.heading.${1/=(?<b>=)?(?<c>=)?(?<d>=)?(?<e>=)?(?<f>=)?/${f:?6:${e:?5:${d:?4:${c:?3:${b:?2:1}}}}}/}.mediawiki' do
      match %r/^(={1,6})(?!=)((.+))(\1)\s*$\n?/,
        1 => 'punctuation.definition.heading.mediawiki',
        2 => 'entity.name.section.mediawiki',
        4 => 'punctuation.definition.heading.mediawiki'
    end
    rule 'meta.separator.mediawiki' do
      #
      # A separator is made up of 4 or more -s alone on a
      # line by themselves.
      #
      match %r/^-{4,}[ \t]*($\n)?/
    end
    rule 'markup.raw.block.mediawiki' do
      #
      # Code blocks start with one space.  Wiki text and
      # html are still interpreted in MediaWiki, unlike in
      # mediawiki.
      #
      from %r/^ (?=\s*\S)/
      to %r/^(?=[^ ])/
      include "#inline"
    end
    rule 'markup.list.numbered.mediawiki' do
      #
      # need to scope nested lists
      #   - need to cope with
      #                     definition lists (; :)
      #     indented paragraphs, as used on talk pages (:)
      #
      from %r/^([#:;])/
      to %r/^(?!§1)/
      include "#inline"
    end
    rule 'markup.list.unnumbered.mediawiki' do
      # unordered list
      from %r/^([*])/
      to %r/^(?!§1)/
      include "#inline"
    end
    include "#table"
    include "#comments"
    rule 'meta.paragraph.mediawiki' do
      #
      # Anything that is not a code block, list, header, etc.
      # is a paragraph.
      #
      from %r/^(?![\t ;*#:=]|----|$)/
      to %r/^(?:\s*$|(?=[;*#:=]|----))/
      include "#inline"
    end
  end

  fragment :block_html do
    #
    # The available block HTML tags supported are:
    #   * blockquote, center, pre, div, hr, p
    #   * tables: table, th, tr, td, caption
    #   * lists: ul, ol, li
    #   * definition lists: dl, dt, dd
    #   * headers: h1, h2, h3, h4, h5, h6
    #   * br
    #
    rule 'meta.embedded.tex.math' do
      content_scope "source.tex.math"
      from %r/(<math>)/
      to %r'((<)/math>)'
      both 0 => 'punctuation.section.embedded.tex.math',
           1 => 'meta.tag.inline.math.mediawiki',
           2 => 'source.tex.math'
      include "text.tex.math"
    end
    rule 'meta.embedded.html.table' do
      content_scope "source.html"
      from %r/<table[^>]*>/
      to %r'</table>'
      include "text.html"
    end
    rule 'meta.reference.mediawiki' do
      # <ref>content</ref> TODO: Redundant with named tag
      content_scope "meta.reference.content.mediawiki"
      from %r/(<)(ref)(>)/
      to %r'(</)(ref)(>)'
      both 1 => 'meta.tag.inline.ref.mediawiki',
           2 => 'entity.name.tag.ref.mediawiki',
           3 => 'meta.tag.inline.ref.mediawiki'
      include "#inline"
    end
    rule 'meta.reference.named.cite.mediawiki' do
      # <ref name="label"/>
      match %r'(<)(ref) *((name) *(=) *([^>]*))(/>)',
        1 => 'meta.tag.inline.ref.mediawiki',
        2 => 'entity.name.tag.ref.mediawiki',
        4 => 'entity.name.tag.name.mediawiki',
        5 => 'meta.tag.inline.ref.mediawiki',
        6 => 'string.quoted.ref.name.mediawiki',
        7 => 'meta.tag.inline.ref.mediawiki'
    end
    rule do
      # <ref name="label">content</ref>
      content_scope "meta.reference.content.labelled.mediawiki"
      from %r/(<)(ref) *((name) *(=) *([^>]*))(>)/,
        1 => 'meta.tag.inline.ref.mediawiki',
        2 => 'entity.name.tag.ref.mediawiki',
        4 => 'entity.name.tag.name.mediawiki',
        5 => 'meta.tag.inline.ref.mediawiki',
        6 => 'string.quoted.ref.name.mediawiki',
        7 => 'meta.tag.inline.ref.mediawiki'
      to %r'(</ref>)',
        1 => 'meta.tag.inline.ref.mediawiki'
      include "#inline"
    end
    rule do
      content_scope "meta.gallery.mediawiki"
      from %r/(<gallery>)/
      to %r'(</gallery>)'
      both 1 => 'meta.tag.inline.ref.mediawiki'
      rule 'meta.item.gallery.mediawiki' do
        from %r/(?x)
                ^(?!\s*\n)            # not an empty line
                ( [ ]*(((i|I)mage)(:))  # spaces, image, colon
                  ([^\[\]|]+)           # anything
                  (?<!\s)[ ]*           # spaces
                )?
              /,
          3 => 'constant.other.namespace.image.mediawiki',
          5 => 'punctuation.fix_this_later.colon.mediawiki',
          6 => 'constant.other.wiki-link.image.mediawiki'
        to %r/\n/
        rule do
          content_scope "string.other.title.gallery.mediawiki"
          from %r/^(?!\|)|(\|)/,
            1 => 'punctuation.fix_this_later.pipe.mediawiki'
          to %r/\n|(?=\|)/
          include "#inline"
        end
        rule 'punctuation.fix_this_later.pipe.mediawiki' do
          match %r/\|/
        end
      end
    end
  end

  fragment :comments do
    rule 'comment.block.html.mediawiki' do
      from %r/<!--/
      to %r/--\s*>/
      rule 'invalid.illegal.bad-comments-or-CDATA.html.mediawiki' do
        match %r/--/
      end
    end
  end

  # FIXME: this fragment is never referenced
  fragment :entities do
    #
    # Mediawiki supports Unicode, so these should not usually be
    # necessary, but they do show up on pages from time to time.
    #
    rule 'constant.character.entity.html.mediawiki' do
      match %r/&([a-zA-Z0-9]+|#[0-9]+|#x[0-9a-fA-F]+);/
    end
    rule 'invalid.illegal.bad-ampersand.html.mediawiki' do
      match %r/&/
    end
  end

  fragment :inline do
    rule do
      match %r/(~~~~~)(~{0,2})(?!~)/,
        1 => 'constant.other.date-time.mediawiki',
        2 => 'invalid.illegal.too-many-tildes.mediawiki'
    end
    rule 'constant.other.signature.mediawiki' do
      # 3 ~s for sig, 4 for sig + timestamp
      match %r/~~~~?/
    end
    include "#link"
    include "#style"
    include "#table"
    include "#template"
    include "#block_html"
    include "#comments"
  end

  fragment :link do
    rule 'meta.image.wiki.mediawiki' do
      from %r/(?x:
            (\[\[)                         # opening brackets
              ( [ ]*(((i|I)mage)(:))       # spaces, image, colon
                ([^\[\]|]+)                # anything
                (?<!\s)[ ]*                # spaces
              )
          )/,
        1 => 'meta.tag.inline.any.mediawiki',
        4 => 'constant.other.namespace.image.mediawiki',
        6 => 'punctuation.fix_this_later.colon.mediawiki',
        7 => 'constant.other.wiki-link.image.mediawiki'
      to %r/(?x:
              ((\|)[ ]*( [^\[\]|]+ )[ ]*)? # pipe, spaces, anything, spaces
            (\]\])                         # closing brackets
          )/,
        2 => 'punctuation.fix_this_later.pipe.mediawiki',
        3 => 'string.other.title.link.wiki-link.mediawiki'
      to_last true
      rule do
        match %r/(?x)
                (\|)[ ]*
                ( (thumb|thumbnail|frame)
                 |(right|left|center|none)
                 |([0-9]+)(px)
                )[ ]*
              /,
          1 => 'punctuation.fix_this_later.pipe.mediawiki',
          2 => 'keyword.control.image.formatting.mediawiki',
          3 => 'keyword.control.image.alignment.mediawiki',
          4 => 'constant.numeric.image.width.mediawiki',
          5 => 'constant.other.unit.mediawiki'
      end
      rule 'punctuation.fix_this_later.pipe.mediawiki' do
        match %r/\|/
      end
      include "#style_in_link"
    end
    rule 'meta.link.wiki.redirect.mediawiki' do
      from %r/(?x:
          ({{)                       # opening brackets
            ([Rr]edirect|subst:.*)   # redirect?
            [ ]*                   # spaces
            (\|)                   # pipe
          )/,
        1 => 'meta.tag.inline.redirect.mediawiki',
        2 => 'keyword.operator.wiki-link.redirect.mediawiki',
        3 => 'constant.other.pipe.mediawiki'
      to %r/(?x:
              (([\|}]+)(\|)([\|}]+))?   #  from | to 
              ([^}]*)                   # anything
              (}})                      # closing brackets
          )/,
        2 => 'meta.tag.inline.any.mediawiki',
        3 => 'markup.underline.link.internal.mediawiki',
        4 => 'constant.other.pipe.mediawiki',
        6 => 'meta.tag.inline.redirect.mediawiki'
      include "#style_in_link"
    end
    rule 'meta.link.wiki.mediawiki' do
      from %r/(?x:
            (\[\[)                       # opening brackets
              (:)?                       # colon to suppress image or category?
              ((\s+):[^\[\]]*(?=\]\]))?  # a colon after spaces is invalid
              [ ]*                       # spaces
              ( (([^\[\]|]+)(:))?        # namespace
                ([^\[\]|]+)(?<!\s)[ ]*   # link name
              )?
          )/,
        1 => 'meta.tag.inline.any.mediawiki',
        2 => 'keyword.operator.wiki-link.suppress-image-or-category.mediawiki',
        4 => 'invalid.illegal.whitespace.mediawiki',
        7 => 'constant.other.namespace.mediawiki',
        8 => 'punctuation.fix_this_later.colon.mediawiki',
        9 => 'constant.other.wiki-link.mediawiki'
      to %r/(?x:
              (\|[ ]*([^\[\]\|]+)[ ]*)?     # pipe, spaces, anything, spaces
            (\]\])                         # closing brackets
          )/,
        2 => 'string.other.title.link.wiki-link.mediawiki',
        3 => 'meta.tag.inline.any.mediawiki'
      include "#style_in_link"
    end
    rule 'meta.link.inline.external.mediawiki' do
      content_scope "string.other.title.link.external.mediawiki"
      from %r/\[(\S+)\s*(?=[^\]]*\])/,
        1 => 'markup.underline.link.external.mediawiki'
      to %r/\]/
      include "#style_in_link"
    end
    rule 'markup.underline.link.external.mediawiki' do
      match %r'((https?|ftp|file)://|mailto:)[-:@a-zA-Z0-9_.~%+/?=&#]+(?<![.?:])'
    end
  end

  fragment :style do
    #
    # TODO: Still need to add:
    #   * font
    #   * ruby, rb, rp, rt
    #   * cite
    # inline tags to this section, and make sure that the other
    # tags can accept attributes in the tag opening, etc.  The
    # current implementation is intended to be naive, but covering
    # the majority of uses in mediawiki code.
    #
    # We also need to add mediawiki-specific tags:
    #   * nowiki, noinclude, includeonly
    #
    #
    rule 'markup.bold.mediawiki' do
      from %r/'''/
      to %r/'''/
      include "#inline"
    end
    rule 'markup.italic.mediawiki' do
      from %r/''/
      to %r/''(?!'[^'])/
      include "#inline"
    end
    rule do
      content_scope "markup.bold.html.mediawiki"
      from %r/(<(b|strong)>)/
      to %r'(</§2>)'
      both 1 => 'meta.tag.inline.bold.html.mediawiki'
      include "#inline"
    end
    rule do
      content_scope "markup.italic.html.mediawiki"
      from %r/(<(i|em)>)/
      to %r'(</§2>)'
      both 1 => 'meta.tag.inline.italic.html.mediawiki'
      include "#inline"
    end
    rule do
      content_scope "markup.other.strikethrough.html.mediawiki"
      from %r/(<(s|strike)>)/
      to %r'(</§2>)'
      both 1 => 'meta.tag.inline.strikethrough.html.mediawiki'
      include "#inline"
    end
    rule do
      content_scope "markup.underline.html.mediawiki"
      from %r/(<(u)>)/
      to %r'(</§2>)'
      both 1 => 'meta.tag.inline.underline.html.mediawiki'
      include "#inline"
    end
    rule do
      content_scope "markup.raw.html.mediawiki"
      from %r/(<(tt|code)>)/
      to %r'(</§2>)'
      both 1 => 'meta.tag.inline.raw.html.mediawiki'
      include "#inline"
    end
    rule do
      content_scope "markup.other.inline-styles.html.mediawiki"
      from %r/(<(big|small|sub|sup)>)/
      to %r'(</§2>)'
      both 1 => 'meta.tag.inline.any.html.mediawiki'
      include "#inline"
    end
  end

  fragment :style_in_link do
    rule 'markup.bold.mediawiki' do
      from %r/'''/
      to %r/'''/
      include "#style_in_link"
    end
    rule 'markup.italic.mediawiki' do
      from %r/''/
      to %r/''/
      include "#style_in_link"
    end
    rule do
      content_scope "markup.bold.html.mediawiki"
      from %r/(<(b|strong)>)/
      to %r'(</§2>)'
      both 1 => 'meta.tag.inline.bold.html.mediawiki'
      include "#style_in_link"
    end
    rule do
      content_scope "markup.italic.html.mediawiki"
      from %r/(<(i|em)>)/
      to %r'(</§2>)'
      both 1 => 'meta.tag.inline.italic.html.mediawiki'
      include "#style_in_link"
    end
    rule do
      content_scope "markup.other.strikethrough.html.mediawiki"
      from %r/(<(s|strike)>)/
      to %r'(</§2>)'
      both 1 => 'meta.tag.inline.strikethrough.html.mediawiki'
      include "#style_in_link"
    end
    rule do
      content_scope "markup.underline.html.mediawiki"
      from %r/(<(u)>)/
      to %r'(</§2>)'
      both 1 => 'meta.tag.inline.underline.html.mediawiki'
      include "#style_in_link"
    end
    rule do
      content_scope "markup.raw.html.mediawiki"
      from %r/(<(tt|code)>)/
      to %r'(</§2>)'
      both 1 => 'meta.tag.inline.raw.html.mediawiki'
      include "#style_in_link"
    end
    rule do
      content_scope "markup.other.inline-styles.html.mediawiki"
      from %r/(<(big|small|sub|sup)>)/
      to %r'(</§2>)'
      both 1 => 'meta.tag.inline.any.html.mediawiki'
      include "#style_in_link"
    end
    include "#comments"
  end

  fragment :table do
    rule 'markup.other.table.mediawiki' do
      # TODO: add styling capabilities
      from %r/^({\|)/
      to %r/(^\|})/
      both 1 => 'meta.tag.inline.table.mediawiki'
      rule 'meta.table.caption.mediawiki' do
        match %r/^(\|\+)[\t ]*(.*)$/,
          1 => 'meta.tag.inline.table.caption.mediawiki',
          2 => 'variable.parameter.name.string.mediawiki'
      end
      rule 'markup.other.table.row.mediawiki' do
        # TODO: allow selection of rows; move row up/down, etc.
        from %r/^\|-/,
          1 => 'meta.tag.inline.table.mediawiki'
        to %r/^(?=\|-|^\|})/
        include "#inline"
      end
      rule 'meta.table.cell.mediawiki' do
        match %r/(^\||\|\|) *([^\|]*) */,
          1 => 'meta.tag.inline.table.cellwall.mediawiki',
          2 => 'string.other.table.cellcontents.mediawiki'
      end
      include "#inline"
    end
  end

  fragment :template do
    #
    # This repository item covers templates and parser functions.
    #
    rule 'meta.template-parameter.mediawiki' do
      match %r/{{{[ ]*([0-9]+)[ ]*}}}/,
        1 => 'variable.parameter.template.numeric.mediawiki'
    end
    rule 'meta.template-parameter.mediawiki' do
      match %r/{{{[ ]*(.*?)[ ]*}}}/,
        1 => 'variable.parameter.template.named.mediawiki'
    end
    rule 'meta.template.parser-function.mediawiki' do
      #
      # Why oh why did mediawiki have to add these??
      #
      from %r/({{)(?=[ ]*#)/,
        1 => 'meta.tag.inline.template.mediawiki',
        2 => 'meta.function-call.template.mediawiki'
      to %r/(}})/,
        1 => 'meta.tag.inline.template.mediawiki'
      include "#inline"
    end
    rule 'meta.template.mediawiki' do
      # scope as meta.function-call as the closest thing to a template with parameters, etc.
      from %r/({{)([^{}\|]+)?/,
        1 => 'meta.tag.inline.template.mediawiki',
        2 => 'meta.function-call.template.mediawiki'
      to %r/(}})/,
        1 => 'meta.tag.inline.template.mediawiki'
      include "#comments"
      rule do
        content_scope "comment.block.template-hack.mediawiki"
        from %r/(\|)\s*(=)/,
          1 => 'punctuation.fix_this_later.pipe.mediawiki',
          2 => 'punctuation.fix_this_later.equals-sign.mediawiki'
        to %r/(?=[|}])/
      end
      rule do
        content_scope "meta.value.template.mediawiki"
        from %r/(\|)(([^{}\|=]+)(=))?/,
          1 => 'punctuation.fix_this_later.pipe.mediawiki',
          2 => 'variable.parameter.template.mediawiki',
          3 => 'punctuation.fix_this_later.equals-sign.mediawiki'
        to %r/(?=[|}])/
        include "#inline"
      end
      rule 'punctuation.fix_this_later.pipe.mediawiki' do
        match %r/\|/
      end
    end
  end
end
