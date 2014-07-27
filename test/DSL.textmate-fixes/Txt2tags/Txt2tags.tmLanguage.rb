# encoding: utf-8

language 'Txt2tags' => 'text.txt2tags' do
  file_types %w(t2t)
  key_equivalent "^~T"  # TextMate only
  uuid "B5A751C0-2CE4-41A5-99FB-7B673943DE60"  # TextMate only

  rule 'comment.block.txt2tags' do
    from %r/^%%%\s*$/
    to %r/^%%%\s*$\n?/
  end
  rule 'string.unquoted.txt2tags' do
    match %r/^\s*[_=-]{20,}\s*$\n?/
  end
  rule 'markup.underline.txt2tags' do
    match %r/__([^\s](|.*?[^\s])_*)__/
  end
  rule 'markup.bold.txt2tags' do
    match %r/\*\*([^\s](|.*?[^\s])\**)\*\*/
  end
  rule 'markup.heading.1.txt2tags' do
    match %r/^\s*={1}[^=](|.*[^=])={1}(\[[\w-]*\])?\s*$\n?/
  end
  rule 'markup.heading.2.txt2tags' do
    match %r/^\s*={2}[^=](|.*[^=])={2}(\[[\w-]*\])?\s*$\n?/
  end
  rule 'markup.heading.3.txt2tags' do
    match %r/^\s*={3}[^=](|.*[^=])={3}(\[[\w-]*\])?\s*$\n?/
  end
  rule 'markup.heading.4.txt2tags' do
    match %r/^\s*={4}[^=](|.*[^=])={4}(\[[\w-]*\])?\s*$\n?/
  end
  rule 'markup.heading.5.txt2tags' do
    match %r/^\s*={5}[^=](|.*[^=])={5}(\[[\w-]*\])?\s*$\n?/
  end
  rule 'markup.heading.1.txt2tags' do
    match %r/^\s*\+{1}[^+](|.*[^+])\+{1}(\[[\w-]*\])?\s*$\n?/
  end
  rule 'markup.heading.2.txt2tags' do
    match %r/^\s*\+{2}[^+](|.*[^+])\+{2}(\[[\w-]*\])?\s*$\n?/
  end
  rule 'markup.heading.3.txt2tags' do
    match %r/^\s*\+{3}[^+](|.*[^+])\+{3}(\[[\w-]*\])?\s*$\n?/
  end
  rule 'markup.heading.4.txt2tags' do
    match %r/^\s*\+{4}[^+](|.*[^+])\+{4}(\[[\w-]*\])?\s*$\n?/
  end
  rule 'markup.heading.5.txt2tags' do
    match %r/^\s*\+{5}[^+](|.*[^+])\+{5}(\[[\w-]*\])?\s*$\n?/
  end
  rule 'markup.italic.txt2tags' do
    match %r'//([^\s](|.*?[^\s])/*)//'
  end
  rule 'invalid.deprecated.strike.txt2tags' do
    match %r/--([^\s](|.*?[^\s])-*)--/
  end
  rule 'string.quoted.other.raw.inline.txt2tags' do
    match %r/""([^\s](|.*?[^\s])"*)""/
  end
  rule 'string.quoted.other.raw.line.txt2tags' do
    match %r/^""" (?=.).*$\n?/
  end
  rule 'string.quoted.other.raw.block.txt2tags' do
    from %r/^"""\s*$/
    to %r/^"""\s*$\n?/
  end
  rule 'string.quoted.other.tagged.inline.txt2tags' do
    match %r/''([^\s](|.*?[^\s])'*)''/
  end
  rule 'string.quoted.other.tagged.line.txt2tags' do
    match %r/^''' (?=.).*$\n?/
  end
  rule 'string.quoted.other.tagged.block.txt2tags' do
    from %r/^'''\s*$/
    to %r/^'''\s*$\n?/
  end
  rule 'markup.list.numbered.txt2tags' do
    match %r/^ *\+ (?=[^ ])/
  end
  rule 'markup.list.unnumbered.txt2tags' do
    match %r/^ *- (?=[^ ])/
  end
  rule 'markup.list.unnumbered.txt2tags' do
    match %r/^ *: (?=.)/
  end
  rule 'markup.list.txt2tags' do
    match %r/^( *)([-+:])\s*$/
  end
  rule 'markup.raw.verb.block.txt2tags' do
    from %r/^```\s*$/
    to %r/^```\s*$\n?/
  end
  rule 'markup.raw.verb.line.txt2tags' do
    match %r/^``` (?=.).*$\n?/
  end
  rule 'markup.raw.verb.inline.txt2tags' do
    match %r/``([^\s](|.*?[^\s])`*)``/
  end
  rule 'invalid.deprecated.trailing-whitespace.txt2tags' do
    match %r/\s+$/
  end
  rule 'string.interpolated.txt2tags' do
    match %r/(?i)%%(date|mtime|infile|outfile)(\(.*?\))?|%%toc/
  end
  rule 'constant.character.txt2tags' do
    match %r/(?i)^%!\s*(target|encoding|style|options|include|includeconf|preproc|postproc|guicolors)\s*(\(\w*\))?\s*:.*/
  end
  rule 'meta.tag.image.txt2tags' do
    # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
    # FIXME: (warning) character class has duplicated range
    match %r'\[[\w_,.+%$\#@!?+~/-]+\.(png|jpe?g|gif|eps|bmp)\]'
  end
  rule 'meta.tag.email.txt2tags' do
    match %r'(?i)\b[A-Za-z0-9_.-]+@([A-Za-z0-9_-]+\.)+[A-Za-z]{2,4}\b(\?[A-Za-z0-9/%&=+;.,$@*_-]+)?'
  end
  rule 'meta.tag.url.txt2tags' do
    match %r'(?i)\b((https?|ftp|news|telnet|gopher|wais)://([A-Za-z0-9_.-]+(:[^ @]*)?@)?|(www[23]?|ftp)\.)[A-Za-z0-9%._/~:,=$@&+-]+\b/*(\?[A-Za-z0-9/%&=+;.,$@*_-]+)?(#[A-Za-z0-9%._-]*)?'
  end
  rule 'meta.tag.link.txt2tags' do
    # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
    # FIXME: (warning) character class has duplicated range
    # FIXME: (warning) character class has ']' without escape
    match %r'(?i)\[(\[[\w_,.+%$\#@!?+~/-]+\.(png|jpe?g|gif|eps|bmp)\]|[^]]+) (((https?|ftp|news|telnet|gopher|wais)://([A-Za-z0-9_.-]+(:[^ @]*)?@)?|(www[23]?|ftp)\.)[A-Za-z0-9%._/~:,=$@&+-]+\b/*(\?[A-Za-z0-9/%&=+;.,$@*_-]+)?(#[A-Za-z0-9%._-]*)?|[A-Za-z0-9_.-]+@([A-Za-z0-9_-]+\.)+[A-Za-z]{2,4}\b(\?[A-Za-z0-9/%&=+;.,$@*_-]+)?|[A-Za-z0-9%._/~:,=$@&+-]+|[A-Za-z0-9%._/~:,=$@&+-]*(#[A-Za-z0-9%._-]*))\]'
  end
  rule 'markup.quote.txt2tags' do
    match %r/^\t.*$\n?/
  end
  rule 'comment.line.txt2tags' do
    match %r/^%.*$\n?/
  end
end
