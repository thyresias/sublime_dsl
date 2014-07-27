# encoding: utf-8

language 'reStructuredText' => 'text.restructuredtext' do
  # syntax highlighting for reStructuredText http://docutils.sourceforge.net, based on rst mode from jEdit
  file_types %w(rst rest)
  key_equivalent "^~R"  # TextMate only
  uuid "62DA9AD6-36E1-4AB7-BB87-E933AD9FD1A4"  # TextMate only

  rule do
    content_scope "meta.paragraph.restructuredtext"
    from %r/^([ \t]*)(?=\S)/
    to %r/^(?!§1(?=\S))/
    include "#inline"
  end

  fragment :inline do
    rule do
      # directives.html
      from %r/^([ \t]*)((\.\.)\sraw(::)) html/
      to %r/^(?!§1[ \t])/
      both 2 => 'meta.directive.restructuredtext',
           3 => 'punctuation.definition.directive.restructuredtext',
           4 => 'punctuation.separator.key-value.restructuredtext'
      include "text.html.basic"
    end
    rule 'meta.other.directive.restructuredtext' do
      # directives
      # FIXME: (warning) character class has '-' without escape
      # FIXME: (warning) character class has duplicated range
      match %r/(\.\.)\s[A-z][A-z0-9-_]+(::)\s*$/,
        1 => 'punctuation.definition.directive.restructuredtext',
        2 => 'punctuation.separator.key-value.restructuredtext'
    end
    rule 'meta.raw.block.restructuredtext' do
      # verbatim blocks
      from %r/^([ \t]*).*?((::))/
      to %r/^(?=§1[^\s]+)/
      both 2 => 'markup.raw.restructuredtext',
           3 => 'punctuation.definition.raw.restructuredtext'
      rule 'markup.raw.restructuredtext' do
        match %r/.+/
      end
    end
    rule 'meta.startraw.restructuredtext' do
      # directives
      match %r/::/
    end
    rule 'markup.bold.restructuredtext' do
      # strong emphasis
      match %r/(\*\*)[^*]+(\*\*)/,
        1 => 'punctuation.definition.italic.restructuredtext',
        2 => 'punctuation.definition.italic.restructuredtext'
    end
    rule 'markup.italic.restructuredtext' do
      # emphasis
      match %r/(\*)\w[^*]+\w(\*)/,
        1 => 'punctuation.definition.italic.restructuredtext',
        2 => 'punctuation.definition.italic.restructuredtext'
    end
    rule 'meta.link.reference.def.restructuredtext' do
      # replacement
      match %r/(\.\.)\s+(_)([\w\s]+)(:)\s+(.*)/,
        1 => 'punctuation.definition.link.restructuredtext',
        2 => 'punctuation.definition.string.restructuredtext',
        3 => 'string.other.link.title.restructuredtext',
        4 => 'punctuation.separator.key-value.restructuredtext',
        5 => 'markup.underline.link.restructuredtext'
    end
    rule 'markup.underline.substitution.restructuredtext' do
      # substitution
      match %r/(\|)[^|]+(\|_{0,2})/,
        1 => 'punctuation.definition.substitution.restructuredtext'
    end
    rule 'meta.link.reference' do
      # links `...`_ or `...`__
      match %r/\b(\w+)(_)\b/,
        1 => 'string.other.link.title.restructuredtext',
        2 => 'punctuation.definition.link.restructuredtext'
    end
    rule 'meta.link.reference' do
      # links `...`_ or `...`__
      match %r/(`)([\w\s]+)(`_)/,
        1 => 'punctuation.definition.link.restructuredtext',
        2 => 'string.other.link.title.restructuredtext',
        3 => 'punctuation.definition.link.restructuredtext'
    end
    rule 'meta.link.inline.restructuredtext' do
      # links `...`_
      match %r/(`)([\w\s]+)\s+(<)(.*?)(>)(`_)/,
        1 => 'punctuation.definition.link.restructuredtext',
        2 => 'string.other.link.title.restructuredtext',
        3 => 'punctuation.definition.location.restructuredtext',
        4 => 'markup.underline.link.restructuredtext',
        5 => 'punctuation.definition.location.restructuredtext',
        6 => 'punctuation.definition.link.restructuredtext'
    end
    rule 'meta.link.footnote.def.restructuredtext' do
      # replacement
      # FIXME: (warning) character class has ']' without escape
      match %r/^(\.\.)\s+((\[)(((#?)[^]]*?)|\*)(\]))\s+(.*)/,
        1 => 'punctuation.definition.link.restructuredtext',
        2 => 'constant.other.footnote.link.restructuredtext',
        3 => 'punctuation.definition.constant.restructuredtext',
        6 => 'punctuation.definition.constant.restructuredtext',
        7 => 'punctuation.definition.constant.restructuredtext',
        8 => 'string.other.footnote.restructuredtext'
    end
    rule 'meta.link.footnote.numeric.restructuredtext' do
      # footnote reference: [0]_
      match %r/((\[)[0-9]+(\]))(_)/,
        1 => 'constant.other.footnote.link',
        2 => 'punctuation.definition.constant.restructuredtext',
        3 => 'punctuation.definition.constant.restructuredtext',
        4 => 'punctuation.definition.constant.restructuredtext'
    end
    rule 'meta.link.footnote.auto.restructuredtext' do
      # footnote reference [#]_ or [#foo]_
      # FIXME: (warning) character class has duplicated range
      match %r/((\[#)[A-z0-9_]*(\]))(_)/,
        1 => 'constant.other.footnote.link',
        2 => 'punctuation.definition.constant.restructuredtext',
        3 => 'punctuation.definition.constant.restructuredtext',
        4 => 'punctuation.definition.constant.restructuredtext'
    end
    rule 'meta.link.footnote.symbol.auto.restructuredtext' do
      # footnote reference [*]_
      match %r/((\[)\*(\]))(_)/,
        1 => 'constant.other.footnote.link.restructuredtext',
        2 => 'punctuation.definition.constant.restructuredtext',
        3 => 'punctuation.definition.constant.restructuredtext',
        4 => 'punctuation.definition.constant.restructuredtext'
    end
    rule 'meta.link.citation.def.restructuredtext' do
      # replacement
      match %r/^(\.\.)\s+((\[)[A-z][A-z0-9]*(\]))(_)\s+(.*)/,
        1 => 'punctuation.definition.link.restructuredtext',
        2 => 'constant.other.citation.link.restructuredtext',
        3 => 'punctuation.definition.constant.restructuredtext',
        4 => 'punctuation.definition.constant.restructuredtext',
        5 => 'punctuation.definition.constant.restructuredtext',
        6 => 'string.other.citation.restructuredtext'
    end
    rule 'meta.link.citation.restructuredtext' do
      # citation reference
      # FIXME: (warning) character class has duplicated range
      match %r/((\[)[A-z][A-z0-9_-]*(\]))(_)/,
        1 => 'constant.other.citation.link.restructuredtext',
        2 => 'punctuation.definition.constant.restructuredtext',
        3 => 'punctuation.definition.constant.restructuredtext',
        4 => 'punctuation.definition.constant.restructuredtext'
    end
    rule 'markup.raw.restructuredtext' do
      # inline literal
      from %r/``/
      to %r/``/
      both 0 => 'punctuation.definition.raw.restructuredtext'
    end
    rule 'markup.other.command.restructuredtext' do
      # intepreted text
      match %r/(`)[^`]+(`)(?!_)/,
        1 => 'punctuation.definition.intepreted.restructuredtext',
        2 => 'punctuation.definition.intepreted.restructuredtext'
    end
    rule 'entity.name.tag.restructuredtext' do
      # field list
      # FIXME: (warning) character class has duplicated range
      match %r/(:)[A-z][A-z0-9  =\s\t_]*(:)/,
        1 => 'punctuation.definition.field.restructuredtext',
        2 => 'punctuation.definition.field.restructuredtext'
    end
    rule 'markup.other.table.restructuredtext' do
      # table
      match %r/\+-[+-]+/,
        0 => 'punctuation.definition.table.restructuredtext'
    end
    rule 'markup.other.table.restructuredtext' do
      # table
      match %r/\+=[+=]+/,
        0 => 'punctuation.definition.table.restructuredtext'
    end
    rule 'markup.heading.restructuredtext' do
      match %r/(^(=|-|~|`|#|"|\^|\+|\*){3,}$){1,1}?/,
        1 => 'punctuation.definition.heading.restructuredtext'
    end
    rule 'comment.line.double-dot.restructuredtext' do
      # comment
      from %r/^(\.\.)/,
        1 => 'punctuation.definition.comment.restructuredtext'
      to %r/$\n?/
    end
  end
end
