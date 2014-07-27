# encoding: utf-8

theme 'LAZY' do

  author 'Domenico Carbotta'
  uuid 'A1E55FCB-3CD2-4811-9E73-D9B87419443A'

  white   = '#FFFFFF'
  color1  = '#7C7C7C'
  black   = '#000000'
  color3  = '#B6B6B6'
  color4  = '#EFFCA68F'
  color5  = '#E3FC8D'
  color6  = '#8C868F'
  color7  = '#3B5BB5'
  color8  = '#D62A28'
  color9  = '#FF7800'
  color10 = '#409B1C'
  color11 = '#990000'
  color12 = '#9D1E15'
  color13 = '#F8F8F8'
  color14 = '#671EBB'
  color15 = '#3E4558'
  color16 = '#3A4A64'
  color17 = '#7F90AA'

  base_colors(
    background: white,
    caret: color1,
    foreground: black,
    invisibles: color3,
    line_highlight: color4,
    selection: color5,
  )

  item 'Comment', 'comment', color6
  item 'Constant', 'constant', color7
  item 'Entity', 'entity', color7
  item 'Latex Entity', 'text.tex.latex entity', color8
  item 'Keyword', 'keyword, storage', color9
  item 'String', 'string, meta.verbatim', color10
  item 'Support', 'support', color7
  item 'Variable', 'variable'
  item 'Invalid – Deprecated', 'invalid.deprecated', color11, italic
  item 'Invalid – Illegal', 'invalid.illegal', color13, back: color12
  item 'Superclass', 'entity.other.inherited-class', color7, italic
  item 'String interpolation', 'string constant.other.placeholder', color14
  item 'meta.function-call.py', 'meta.function-call.py', color15
  item 'meta.tag', 'meta.tag, meta.tag entity', color16
  item 'OCaml variant', 'keyword.type.variant', color17
  item 'OCaml operator', 'source.ocaml keyword.operator', black
  item 'OCaml infix operator', 'source.ocaml keyword.operator.symbol.infix', color7
  item 'OCaml prefix operator', 'source.ocaml keyword.operator.symbol.prefix', color7
  item 'OCaml infix f-p operator', 'source.ocaml keyword.operator.symbol.infix.floating-point', underline
  item 'OCaml prefix f-p operator', 'source.ocaml keyword.operator.symbol.prefix.floating-point', underline
  item 'OCaml f-p constant', 'source.ocaml constant.numeric.floating-point', underline

end
