# encoding: utf-8

language 'reStructuredText' => 'text.restructuredtext' do
  # Syntax highlighting for reStructuredText: http://docutils.sourceforge.net
  file_types %w(rst rest)
  key_equivalent "^~R"  # TextMate only
  uuid "62DA9AD6-36E1-4AB7-BB87-E933AD9FD1A4"  # TextMate only

  rule do
    content_scope "meta.paragraph.restructuredtext"
    from %r/^([ \t]*)(?=\S)/
    to %r/^(?!§1)/
    include "#all"
  end

  fragment :all do
    include "#directives"
    include "#raw-blocks"
    include "#emphasis"
    include "#link-def"
    rule 'markup.underline.substitution.restructuredtext' do
      # substitution
      match %r/(\|)[^|]+(\|_{0,2})/,
        1 => 'punctuation.definition.substitution.restructuredtext'
    end
    rule 'markup.raw.restructuredtext' do
      # inline literal
      from %r/``/
      # FIXME: (warning) character class has duplicated range
      to %r/``((?=[^`\w\d])|$)/
      both 0 => 'punctuation.definition.raw.restructuredtext'
    end
    rule 'markup.other.command.restructuredtext' do
      # intepreted text - single line
      match %r/(`)[^`]+(`)(?!_)/,
        1 => 'punctuation.definition.intepreted.restructuredtext',
        2 => 'punctuation.definition.intepreted.restructuredtext'
    end
    rule 'meta.link.restructuredtext' do
      # anonymous links __ url
      match %r/\s*(__)\s+(.+)/,
        1 => 'punctuation.definition.link.restructuredtext',
        2 => 'markup.underline.link.restructuredtext'
    end
    include "#link-reference"
    rule 'markup.other.command.restructuredtext' do
      # intepreted text - multiline with role
      content_scope "string.other.interpreted.restructuredtext"
      # FIXME: (warning) character class has duplicated range
      from %r/(:)([-A-z0-9_.]*)(:)(`)/,
        1 => 'punctuation.definition.intepreted.restructuredtext',
        2 => 'entity.name.role.restructuredtext',
        3 => 'punctuation.definition.intepreted.restructuredtext',
        4 => 'punctuation.definition.intepreted.restructuredtext'
      to %r/(`)/,
        1 => 'punctuation.definition.intepreted.restructuredtext'
    end
    rule 'meta.link.inline.restructuredtext' do
      # links `...`_
      match %r/(`)([^<`]+)\s+(<)(.*?)(>)(`_)/,
        1 => 'punctuation.definition.link.restructuredtext',
        2 => 'string.other.link.title.restructuredtext',
        3 => 'punctuation.definition.location.restructuredtext',
        4 => 'markup.underline.link.restructuredtext',
        5 => 'punctuation.definition.location.restructuredtext',
        6 => 'punctuation.definition.link.restructuredtext'
    end
    include "#footnotes"
    include "#citations"
    include "#tags"
    include "#tables"
    include "#headings"
    include "#comments"
  end

  fragment :citations do
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
  end

  fragment :comments do
    rule 'comment.line.double-dot.restructuredtext' do
      from %r/^(\.\.)[ ]/,
        1 => 'punctuation.definition.comment.restructuredtext'
      to %r/^[\s]*$\n?/
    end
  end

  fragment :directives do
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
      # FIXME: (warning) character class has duplicated range
      match %r/(\.\.)\s([A-z][-A-z0-9_]+)(::)\s*$/,
        1 => 'punctuation.definition.directive.restructuredtext',
        2 => 'support.directive.restructuredtext',
        3 => 'punctuation.separator.key-value.restructuredtext'
    end
    rule 'meta.other.directive.restructuredtext' do
      # directives with arguments
      # FIXME: (warning) character class has duplicated range
      match %r/(\.\.)\s([A-z][-A-z0-9_]+)(::)\s+(.+?)\s*$/,
        1 => 'punctuation.definition.directive.restructuredtext',
        2 => 'support.directive.restructuredtext',
        3 => 'punctuation.separator.key-value.restructuredtext',
        4 => 'entity.name.directive.restructuredtext'
    end
  end

  fragment :emphasis do
    rule 'markup.bold.restructuredtext' do
      match %r/(\*\*)[^*]+(\*\*)/,
        1 => 'punctuation.definition.bold.restructuredtext',
        2 => 'punctuation.definition.bold.restructuredtext'
    end
    rule 'markup.italic.restructuredtext' do
      match %r/(\*)\w[^*]+\w(\*)/,
        1 => 'punctuation.definition.italic.restructuredtext',
        2 => 'punctuation.definition.italic.restructuredtext'
    end
  end

  fragment :footnotes do
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
  end

  fragment :headings do
    rule 'markup.heading.restructuredtext' do
      match %r/(^(=|-|~|`|#|"|\^|\+|\*){3,}$){1,1}?/,
        1 => 'punctuation.definition.heading.restructuredtext'
    end
  end

  fragment :"link-def" do
    rule 'meta.link.reference.def.restructuredtext' do
      # replacement
      # FIXME: (warning) character class has duplicated range
      match %r/(\.\.)\s+(_)([-.\d\w\s()]+)(:)\s+(.*)/,
        1 => 'punctuation.definition.link.restructuredtext',
        2 => 'punctuation.definition.string.restructuredtext',
        3 => 'string.other.link.title.restructuredtext',
        4 => 'punctuation.separator.key-value.restructuredtext',
        5 => 'markup.underline.link.restructuredtext'
    end
    rule 'meta.link.reference.def.restructuredtext' do
      # replacement
      match %r/(\.\.)\s+(_`)([^`]+)(`:)\s+(.*)/,
        1 => 'punctuation.definition.link.restructuredtext',
        2 => 'punctuation.definition.string.restructuredtext',
        3 => 'string.other.link.title.restructuredtext',
        4 => 'punctuation.separator.key-value.restructuredtext',
        5 => 'markup.underline.link.restructuredtext'
    end
  end

  fragment :"link-reference" do
    rule 'meta.link.reference' do
      # FIXME: (warning) character class has duplicated range
      match %r/\b([-.:+_\d\w]+)(_)\b/,
        1 => 'string.other.link.title.restructuredtext',
        2 => 'punctuation.definition.link.restructuredtext'
    end
    rule 'meta.link.reference' do
      from %r/(`)/
      to %r/(`_)/
      both 1 => 'punctuation.definition.link.restructuredtext'
      rule 'string.other.link.title.restructuredtext' do
        match %r/[^`]+/
      end
    end
  end

  fragment :"raw-blocks" do
    rule do
      # Literal Blocks
      content_scope "meta.raw.block.restructuredtext"
      from %r/(::)$/,
        1 => 'punctuation.section.raw.restructuredtext'
      to %r/^(?=\S)/
      include "#raw-blocks-inner"
    end
  end

  fragment :"raw-blocks-inner" do
    rule 'markup.raw.inner.restructuredtext' do
      match %r/.+/
    end
  end

  fragment :tables do
    rule 'markup.other.table.restructuredtext' do
      match %r/\+-[+-]+/,
        0 => 'punctuation.definition.table.restructuredtext'
    end
    rule 'markup.other.table.restructuredtext' do
      match %r/\+=[+=]+/,
        0 => 'punctuation.definition.table.restructuredtext'
    end
  end

  fragment :tags do
    rule 'entity.name.tag.restructuredtext' do
      # tags (and field lists
      # FIXME: (warning) character class has duplicated range
      match %r/(:)[A-z][A-z0-9  =\s\t_]*(:)/,
        1 => 'punctuation.definition.field.restructuredtext',
        2 => 'punctuation.definition.field.restructuredtext'
    end
  end
end
