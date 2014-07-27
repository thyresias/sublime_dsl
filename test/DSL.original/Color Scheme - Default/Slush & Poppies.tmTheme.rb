# encoding: utf-8

theme 'Slush & Poppies' do

  author 'William D. Neumann'
  uuid 'D68685B8-1CFE-4C10-99C4-E21CBC892376'

  color0  = '#F1F1F1'
  black   = '#000000'
  color2  = '#BFBFBF'
  color3  = '#00000026'
  color4  = '#B0B0FF'
  color5  = '#406040'
  color6  = '#C03030'
  color7  = '#0080A0'
  maroon  = '#800000'
  color9  = '#2060A0'
  color10 = '#0080FF'
  color11 = '#A08000'
  teal    = '#008080'
  color13 = '#C08060'
  purple  = '#800080'
  color15 = '#8000C0'

  base_colors(
    background: color0,
    caret: black,
    foreground: black,
    invisibles: color2,
    line_highlight: color3,
    selection: color4,
  )

  item 'Comment', 'comment', color5
  item 'String', 'string', color6
  item 'Number', 'constant.numeric', color7
  item 'OCaml floating-point constants', 'source.ocaml constant.numeric.floating-point', underline
  item 'Character constants', 'constant.character', maroon
  item 'Built-in constant', 'constant.language'
  item 'User-defined constant', 'constant.character, constant.other'
  item 'Variable', 'variable.parameter, variable.other'
  item 'Keyword', 'keyword', color9
  item 'Operators', 'keyword.operator', color9
  item 'OCaml prefix f-p operators', 'source.ocaml keyword.operator.symbol.prefix.floating-point', underline
  item 'OCaml infix f-p operators', 'source.ocaml keyword.operator.symbol.infix.floating-point', underline
  item 'Module Keyword', 'entity.name.module, support.other.module', color10
  item 'Storage types', 'storage.type', color11
  item 'Storage', 'storage', teal
  item 'Variant types', 'entity.name.class.variant', color13
  item 'Directives', 'keyword.other.directive', bold
  item 'Line-number directives', 'source.ocaml keyword.other.directive.line-number'
  item 'Inherited class', 'entity.other.inherited-class'
  item 'Function name', 'entity.name.function', maroon
  item 'Type name', 'storage.type.user-defined', purple
  item 'Class type name', 'entity.name.type.class.type', color15
  item 'Function argument', 'variable.parameter'
  item 'Tag name', 'entity.name.tag'
  item 'Tag attribute', 'entity.other.attribute-name'
  item 'Library function', 'support.function'
  item 'Library constant', 'support.constant'
  item 'Library class/type', 'support.type, support.class'
  item 'Library variable', 'support.variable'
  item 'Invalid', 'invalid'

end
