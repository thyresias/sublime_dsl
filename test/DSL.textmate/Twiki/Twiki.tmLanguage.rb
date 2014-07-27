# encoding: utf-8

language 'Twiki' => 'text.html.twiki' do
  # FIXME: no file types
  key_equivalent "^~T"  # TextMate only
  uuid "B2FD7223-BE64-4134-B43D-F7443EA54CCD"  # TextMate only

  rule 'string.quoted.double.twiki' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.twiki'
    to %r/"/,
      0 => 'punctuation.definition.string.end.twiki'
    rule 'constant.character.escape.twiki' do
      match %r/\\./
    end
  end
  rule 'markup.heading.twiki' do
    match %r/^(-{3}\+{1,6})(.*)$/,
      1 => 'punctuation.definition.heading.twiki',
      2 => 'entity.name.function.twiki'
  end
  rule 'markup.raw.twiki' do
    from %r/(<)verbatim(>)|(<)pre(>)/
    to %r'(</)verbatim(>)|(</)pre(>)'
    both 1 => 'punctuation.definition.tag.twiki',
         2 => 'punctuation.definition.tag.twiki',
         3 => 'punctuation.definition.tag.twiki',
         4 => 'punctuation.definition.tag.twiki'
    rule 'constant.character.escape.twiki' do
      match %r/\\./
    end
  end
  rule 'meta.separator.twiki' do
    match %r/^-{3,}$\n/
  end
  rule 'markup.other.def.twiki' do
    from %r/^ {3}([a-zA-Z0-9]+: )/
    to %r/$\n?/
    both 1 => 'markup.other.def.term.twiki',
         2 => 'markup.other.def.def.twiki'
    include "#list-paragraph"
  end
  rule 'markup.other.table.twiki' do
    from %r/^(\|)/,
      1 => 'punctuation.definition.table.twiki'
    to %r/^(?:\s*$|(?=\s*>|[=-]{3,}$))/
    include "#inline"
  end
  rule 'markup.list.unnumbered.1.twiki' do
    from %r/^ {3}(\*)/,
      1 => 'punctuation.definition.list_item.twiki'
    to %r/$\n?/
    include "#list-paragraph"
  end
  rule 'markup.list.unnumbered.2.twiki' do
    from %r/^ {6}(\*)/,
      1 => 'punctuation.definition.list_item.twiki'
    to %r/$\n?/
    include "#list-paragraph"
  end
  rule 'markup.list.unnumbered.3.twiki' do
    from %r/^ {9}(\*)/,
      1 => 'punctuation.definition.list_item.twiki'
    to %r/$\n?/
    include "#list-paragraph"
  end
  rule 'markup.list.unnumbered.4.twiki' do
    from %r/^ {12}(\*)/,
      1 => 'punctuation.definition.list_item.twiki'
    to %r/$\n?/
    include "#list-paragraph"
  end
  rule 'markup.list.unnumbered.5.twiki' do
    from %r/^ {15}(\*)/,
      1 => 'punctuation.definition.list_item.twiki'
    to %r/$\n?/
    include "#list-paragraph"
  end
  rule 'markup.list.unnumbered.6.twiki' do
    from %r/^ {18}(\*)/,
      1 => 'punctuation.definition.list_item.twiki'
    to %r/$\n?/
    include "#list-paragraph"
  end
  rule 'markup.list.numbered.1.twiki' do
    from %r/^ {3}\d/
    to %r/$\n?/
    include "#numlist-paragraph"
  end
  rule 'markup.list.numbered.2.twiki' do
    from %r/^ {6}\d/
    to %r/$\n?/
    include "#numlist-paragraph"
  end
  rule 'markup.list.numbered.3.twiki' do
    from %r/^ {9}\d/
    to %r/$\n?/
    include "#numlist-paragraph"
  end
  rule 'markup.list.numbered.4.twiki' do
    from %r/^ {12}\d/
    to %r/$\n?/
    include "#numlist-paragraph"
  end
  rule 'markup.list.numbered.5.twiki' do
    from %r/^ {15}\d/
    to %r/$\n?/
    include "#numlist-paragraph"
  end
  rule 'markup.list.numbered.6.twiki' do
    from %r/^ {18}\d/
    to %r/$\n?/
    include "#numlist-paragraph"
  end
  rule 'meta.paragraph.twiki' do
    from %r/^(?=\S)/
    to %r/^\s*$/
    include "#inline"
    include "text.html.basic"
  end

  fragment :inline do
    rule 'markup.bold.twiki' do
      # FIXME: (warning) character class has duplicated range
      match %r/([\*])[\s\w :.\?']*([\*])/,
        1 => 'punctuation.definition.bold.twiki',
        2 => 'punctuation.definition.bold.twiki'
    end
    rule do
      # FIXME: (warning) character class has duplicated range
      match %r/((((__))[\s\w :.\?']*((__))))/,
        1 => 'markup.bold.twiki',
        2 => 'markup.italic.twiki',
        3 => 'punctuation.definition.bold.twiki',
        4 => 'punctuation.definition.italic.twiki',
        5 => 'punctuation.definition.bold.twiki',
        6 => 'punctuation.definition.italic.twiki'
    end
    rule 'markup.italic.twiki' do
      # FIXME: (warning) character class has duplicated range
      match %r/\b(_)[\s\w :.\?']*(_)\b/,
        1 => 'punctuation.definition.italic.twiki',
        2 => 'punctuation.definition.italic.twiki'
    end
    rule do
      # FIXME: (warning) character class has duplicated range
      match %r/((((\=\=))[\s\w :.\?']*((\=\=))))/,
        1 => 'markup.bold.twiki',
        2 => 'markup.raw.fixed.twiki',
        3 => 'punctuation.definition.bold.twiki',
        4 => 'punctuation.definition.raw.fixed.twiki',
        5 => 'punctuation.definition.bold.twiki',
        6 => 'punctuation.definition.raw.fixed.twiki'
    end
    rule 'markup.raw.fixed.twiki' do
      # FIXME: (warning) character class has duplicated range
      match %r/(\=)[\s\w :.\?']*(\=)/,
        1 => 'punctuation.definition.raw.fixed.twiki',
        2 => 'punctuation.definition.raw.fixed.twiki'
    end
    rule 'variable.other.twiki' do
      match %r/(%)([A-Z0-9]+)(%)/,
        1 => 'punctuation.definition.variable.twiki',
        3 => 'punctuation.definition.variable.twiki'
    end
    rule 'constant.character.entity.html' do
      match %r/(&)([a-zA-Z0-9]+|#[0-9]+|#x[0-9a-fA-F]+)(;)/,
        1 => 'punctuation.definition.constant.twiki',
        3 => 'punctuation.definition.constant.twiki'
    end
    rule 'meta.link.inline' do
      # FIXME: (warning) character class has ']' without escape
      match %r/(\[)([^]]*)(\]) *(\[)(.*?)(\])/,
        1 => 'punctuation.definition.link.twiki',
        2 => 'markup.underline.link.twiki',
        3 => 'punctuation.definition.link.twiki',
        4 => 'punctuation.definition.link.twiki',
        5 => 'string.other.link.title.twiki',
        6 => 'punctuation.definition.link.twiki'
    end
  end

  fragment :"list-paragraph" do
    rule 'markup.list.unnumbered.paragraph' do
      from %r/\G\s+\S/
      to %r/^\s*$/
      include "#inline"
      include "text.html.basic"
    end
  end

  fragment :"numlist-paragraph" do
    rule 'markup.list.numbered.paragraph' do
      from %r/\G\s+\S/
      to %r/^\s*$/
      include "#inline"
      include "text.html.basic"
    end
  end
end
