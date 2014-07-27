# encoding: utf-8

theme 'Zenburnesque' do

  author 'William D. Neumann'
  uuid '8D4988B9-ADD8-436F-B388-BC1360F8504B'

  color0  = '#404040'
  color1  = '#FFFF66'
  color2  = '#DEDEDE'
  color3  = '#A8A8A8'
  color4  = '#A0804026'
  color5  = '#A0A0C0'
  color6  = '#709070'
  color7  = '#FF8080'
  color8  = '#FF2020'
  color9  = '#22C0FF'
  color10 = '#FFFFA0'
  color11 = '#FF8000'
  color12 = '#6080FF'
  color13 = '#4080A0'
  color14 = '#F09040'
  color15 = '#FFCC66'
  color16 = '#FFE000'
  color17 = '#F4A020'

  base_colors(
    background: color0,
    caret: color1,
    foreground: color2,
    invisibles: color3,
    line_highlight: color4,
    selection: color5,
  )

  item 'Comment', 'comment', color6, italic
  item 'Directive', 'keyword.other.directive', bold
  item 'Line-number directives', 'keyword.other.directive.line-number', underline
  item 'Characters', 'constant.character', color7
  item 'String', 'string', color8
  item 'Number', 'constant.numeric', color9
  item 'Floating-point numbers', 'constant.numeric.floating-point', underline
  item 'Built-in constant', 'constant.language'
  item 'User-defined constant', 'constant.character, constant.other'
  item 'Variable', 'variable.parameter, variable.other'
  item 'Language Keyword', 'keyword', color10
  item 'Module Keyword', 'entity.name.module, support.other.module', color11, bold
  item 'Operators', 'keyword.operator', color10
  item 'Floating-point infix operators', 'source.ocaml keyword.operator.symbol.infix.floating-point', underline
  item 'Floating-point prefix operators', 'source.ocaml keyword.operator.symbol.prefix.floating-point', underline
  item 'Storage Types', 'storage.type', color12
  item 'Variant Types', 'entity.name.class.variant', color13
  item 'Storage', 'storage'
  # FIXME: duplicate name:
  item 'Type name', 'entity.name.type', color14
  item 'Inherited class', 'entity.other.inherited-class'
  item 'Function name', 'entity.name.function', color15, bold
  # FIXME: duplicate name:
  item 'Type name', 'storage.type.user-defined', color16
  item 'Class type name', 'entity.name.type.class.type', color17
  item 'Function argument', 'variable.parameter'
  item 'Tag name', 'entity.name.tag'
  item 'Tag attribute', 'entity.other.attribute-name'
  item 'Library function', 'support.function'
  item 'Library constant', 'support.constant'
  item 'Library class/type', 'support.type, support.class'
  item 'Library variable', 'support.variable'
  item 'Invalid', 'invalid'

end
