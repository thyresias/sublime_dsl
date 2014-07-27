# encoding: utf-8

language 'TeX' => 'text.tex' do
  file_types %w(sty cls)
  folding_start_marker %r'/\*\*|\{\s*$'
  folding_stop_marker %r'\*\*/|^\s*\}'
  uuid "6BC8DE6F-9360-4C7E-AC3C-971385945346"  # TextMate only

  rule 'keyword.control.tex' do
    match %r/(\\)(backmatter|else|fi|frontmatter|ftrue|mainmatter|if(case|cat|dim|eof|false|hbox|hmode|inner|mmode|num|odd|undefined|vbox|vmode|void|x)?)\b/,
      1 => 'punctuation.definition.keyword.tex'
  end
  rule 'meta.catcode.tex' do
    match %r/((\\)catcode)`(?:\\)?.(=)(\d+)/,
      1 => 'keyword.control.catcode.tex',
      2 => 'punctuation.definition.keyword.tex',
      3 => 'punctuation.separator.key-value.tex',
      4 => 'constant.numeric.category.tex'
  end
  rule 'comment.line.percentage.semicolon.texshop.tex' do
    match %r/(%:).*$\n?/,
      1 => 'punctuation.definition.comment.tex'
  end
  rule 'comment.line.percentage.directive.texshop.tex' do
    match %r/^%!TEX (\S*) =\s*(.*)\s*$/
  end
  rule 'comment.line.percentage.tex' do
    match %r/(%).*$\n?/,
      1 => 'punctuation.definition.comment.tex'
  end
  rule 'meta.group.braces.tex' do
    from %r/\{/
    to %r/\}/
    both 0 => 'punctuation.section.group.tex'
    include "$base"
  end
  rule 'punctuation.definition.brackets.tex' do
    match %r/[\[\]]/
  end
  rule 'string.other.math.block.tex' do
    from %r/\$\$/,
      0 => 'punctuation.definition.string.begin.tex'
    to %r/\$\$/,
      0 => 'punctuation.definition.string.end.tex'
    include "text.tex.math"
    include "$self"
  end
  rule 'constant.character.newline.tex' do
    match %r/\\\\/
  end
  rule 'string.other.math.tex' do
    from %r/\$/,
      0 => 'punctuation.definition.string.begin.tex'
    to %r/\$/,
      0 => 'punctuation.definition.string.end.tex'
    rule 'constant.character.escape.tex' do
      match %r/\\\$/
    end
    include "text.tex.math"
    include "$self"
  end
  rule 'support.function.general.tex' do
    match %r/(\\)[A-Za-z@]+/,
      1 => 'punctuation.definition.function.tex'
  end
  rule 'constant.character.escape.tex' do
    match %r/(\\)[^a-zA-Z@]/,
      1 => 'punctuation.definition.keyword.tex'
  end
  rule 'meta.placeholder.greek.tex' do
    match %r/«press a-z and space for greek letter»[a-zA-Z]*/
  end
end
