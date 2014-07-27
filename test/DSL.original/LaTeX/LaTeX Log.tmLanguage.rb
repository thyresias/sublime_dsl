# encoding: utf-8

language 'LaTeX Log' => 'text.log.latex' do
  # FIXME: no file types
  first_line_match %r/This is (pdf|pdfe)?TeXk?, Version /
  folding_start_marker %r'/\*\*|\(\s*$'
  folding_stop_marker %r'\*\*/|^\s*\)'
  uuid "F68ACE95-7DB3-4DFB-AA8A-89988B116B5C"  # TextMate only

  rule 'invalid.deprecated' do
    match %r/.*Warning:/
  end
  rule 'invalid.deprecated' do
    match %r/[^:]*:\d*:.*/
  end
  rule 'invalid.illegal' do
    match %r/.*Error|^!.*/
  end
  rule 'entity.name.function' do
    match %r/.*\.sty/
  end
  rule 'entity.name.type.class' do
    match %r/.*\.cls/
  end
  rule 'entity.name.tag.configuration' do
    match %r/.*\.cfg/
  end
  rule 'entity.name.tag.definition' do
    match %r/.*\.def/
  end
  rule 'comment.block.documentation' do
    match %r/.*Info.*/
  end
  rule 'meta.log.latex.fixme' do
    match %r/.*FiXme:/
  end
  rule 'meta.log.latex.hyphenation' do
    from %r/(Overfull|Underfull)/
    to %r/(\[\]\n)/
    both 1 => 'keyword.control.hyphenation.latex'
    rule 'variable.parameter.hyphenation.latex2' do
      match %r/[0-9]+\-\-[0-9]+/
    end
  end
  rule 'string.unquoted.other.filename.log.latex' do
    from %r/(<)/,
      0 => 'punctuation.definition.string.begin.log.latex'
    to %r/(>)/,
      0 => 'punctuation.definition.string.end.log.latex'
    rule 'support.function.with-arg.latex' do
      match %r'(.*/.*\.pdf)',
        1 => 'entity.name.function.filename.latex'
    end
  end
end
