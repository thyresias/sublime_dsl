# encoding: utf-8

language 'PmWiki' => 'text.pmwiki' do
  file_types %w(pmwiki)
  key_equivalent "^~P"  # TextMate only
  uuid "B991CA22-EE93-410C-A4EB-7578D9CE6C8D"  # TextMate only

  rule 'comment.block.pmwiki' do
    from %r/>>comment<</
    to %r/>><</
    both 0 => 'punctuation.definition.comment.pmwiki'
    rule 'invalid.illegal.bad-comments-or-CDATA.pmwiki' do
      match %r/>>/
    end
    include "#embedded-code"
  end
  rule do
    from %r/(^[ \t]+)?(?=%comment%)/,
      1 => 'punctuation.whitespace.comment.leading.pmwiki'
    to %r/(?!\G)/
    rule 'comment.line.pmwiki' do
      from %r/%comment%/,
        0 => 'punctuation.definition.comment.pmwiki'
      to %r/\n/
      rule 'punctuation.separator.continuation.pmwiki' do
        match %r/(?>\\\s*\n)/
      end
    end
  end
  rule 'keyword.control.line-break.pmwiki' do
    match %r/\\\\$/
  end
  rule 'keyword.control.line-break.pmwiki' do
    match %r/\[\[<<\]\]/
  end
  rule 'keyword.control.continue-line.pmwiki' do
    match %r/\\$/
  end
  rule 'markup.raw.monospace.pmwiki' do
    from %r/^\s+/
    to %r/$/
    include "text.pmwiki"
  end
  rule 'meta.indented-paragraph.pmwiki' do
    from %r/^(-+>)/
    to %r/$/
    both 1 => 'keyword.control.indented-paragraph.pmwiki'
    include "text.pmwiki"
  end
  rule 'markup.heading.pmwiki' do
    from %r/^(!+)/
    to %r/$/
    both 1 => 'keyword.control.heading.pmwiki'
  end
  rule 'markup.list.unnumbered.pmwiki' do
    from %r/^(\*+)/
    to %r/$/
    both 1 => 'keyword.control.bullet-list.pmwiki'
    include "text.pmwiki"
  end
  rule 'markup.list.numbered.pmwiki' do
    from %r/^(#+)/
    to %r/$/
    both 1 => 'keyword.control.number-list.pmwiki'
    include "text.pmwiki"
  end
  rule 'meta.term-definition.pmwiki' do
    match %r/^(:+)(.*)(:)(.*)$/,
      1 => 'keyword.control.term-definition.pmwiki',
      2 => 'entity.name.type.term.pmwiki',
      3 => 'keyword.control.term-definition.pmwiki',
      4 => 'string.unquoted.definition.pmwiki'
  end
  rule 'meta.separator.pmwiki' do
    match %r/^-{4,}.*$/
  end
  rule 'markup.bold.strong.pmwiki' do
    from %r/'''/
    to %r/'''/
    include "text.pmwiki"
  end
  rule 'markup.italic.emphasis.pmwiki' do
    from %r/''/
    to %r/''(?!')/
    include "text.pmwiki"
  end
  rule 'markup.raw.monospace.pmwiki' do
    from %r/@@/
    to %r/@@/
    include "text.pmwiki"
  end
  rule 'meta.style.larger.pmwiki' do
    from %r/\[\+/
    to %r/\+\]/
    include "text.pmwiki"
  end
  rule 'meta.style.smaller.pmwiki' do
    from %r/\[-/
    to %r/-\]/
    include "text.pmwiki"
  end
  rule 'meta.normal-word.pmwiki' do
    match %r/`\w+/
  end
  # rule 'markup.underline.pmwiki' do
  #   # FIXME: (error) invalid Unicode escape
  #   match %r/\b\u\w+\u\w+/
  # end
  rule 'meta.link.inline.pmwiki' do
    content_scope "string.other.link.title.pmwiki"
    from %r/\[\[#/
    to %r/\]\]/
  end
  rule 'meta.link.inline.pmwiki' do
    match %r/\[\[(.*?)\s*(\||->)\s*(.*?)\]\]/,
      1 => 'markup.underline.link.pmwiki',
      2 => 'keyword.control.link.pmwiki',
      3 => 'string.other.link.title.pmwiki'
  end
  rule 'meta.link.inline.pmwiki' do
    match %r/\[\[(.*?)\]\]/,
      1 => 'markup.underline.link.pmwiki'
  end
  rule 'markup.raw.verbatim-text.pmwiki' do
    from %r/\[=/
    to %r/=\]/
  end
  include "text.html.basic"
end
