# encoding: utf-8

theme 'Blackboard' do

  author 'Domenico Carbotta'
  uuid 'A2C6BAA7-90D0-4147-BBF5-96B0CD92D109'

  color0  = '#0C1021'
  color1  = '#FFFFFFA6'
  color2  = '#F8F8F8'
  color3  = '#FFFFFF40'
  color4  = '#FFFFFF0F'
  color5  = '#253B76'
  color6  = '#AEAEAE'
  color7  = '#D8FA3C'
  color8  = '#FF6400'
  color9  = '#FBDE2D'
  color10 = '#61CE3C'
  color11 = '#8DA6CE'
  color12 = '#AB2A1D'
  color13 = '#9D1E15'
  color14 = '#BECDE6'
  color15 = '#7F90AA'
  white   = '#FFFFFF'
  color17 = '#D5E0F3'
  color18 = '#FFFFFF08'
  color19 = '#7A96FA08'

  base_colors(
    background: color0,
    caret: color1,
    foreground: color2,
    invisibles: color3,
    line_highlight: color4,
    selection: color5,
  )

  item 'Comment', 'comment', color6
  item 'Constant', 'constant', color7
  item 'Entity', 'entity', color8
  item 'Keyword', 'keyword', color9
  item 'Storage', 'storage', color9
  item 'String', 'string, meta.verbatim', color10
  item 'Support', 'support', color11
  item 'Variable', 'variable'
  item 'Invalid – Deprecated', 'invalid.deprecated', color12, italic
  item 'Invalid – Illegal', 'invalid.illegal', color2, back: color13
  item 'Superclass', 'entity.other.inherited-class', color8, italic
  item 'String interpolation', 'string constant.other.placeholder', color8
  item 'meta.function-call.py', 'meta.function-call.py', color14
  item 'meta.tag', 'meta.tag, meta.tag entity', color15
  item 'entity.name.section', 'entity.name.section', white
  item 'OCaml variant', 'keyword.type.variant', color17
  item 'OCaml operator', 'source.ocaml keyword.operator.symbol', color2
  item 'OCaml infix operator', 'source.ocaml keyword.operator.symbol.infix', color11
  item 'OCaml prefix operator', 'source.ocaml keyword.operator.symbol.prefix', color11
  item 'OCaml f-p infix operator', 'source.ocaml keyword.operator.symbol.infix.floating-point', underline
  item 'OCaml f-p prefix operator', 'source.ocaml keyword.operator.symbol.prefix.floating-point', underline
  item 'OCaml f-p constant', 'source.ocaml constant.numeric.floating-point', underline
  item 'LaTeX environment', 'text.tex.latex meta.function.environment', back: color18
  item 'LaTeX environment (nested)', 'text.tex.latex meta.function.environment meta.function.environment', back: color19
  item 'Latex support', 'text.tex.latex support.function', color9
  item 'PList unquoted string', 'source.plist string.unquoted, source.plist keyword.operator', white

end
