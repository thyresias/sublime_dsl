# encoding: utf-8

theme 'Amy' do

  author 'William D. Neumann'
  uuid '3C01FADD-7592-49DD-B7A5-1B82CA4E57B5'

  color0  = '#200020'
  color1  = '#7070FF'
  color2  = '#D0D0FF'
  color3  = '#BFBFBF'
  color4  = '#80000040'
  color5  = '#80000080'
  color6  = '#404080'
  color7  = '#999999'
  color8  = '#707090'
  color9  = '#7090B0'
  color10 = '#666666'
  color11 = '#8080A0'
  teal    = '#008080'
  color13 = '#A080FF'
  color14 = '#A0A0FF'
  color15 = '#C080C0'
  color16 = '#80A0FF'
  color17 = '#B0FFF0'
  color18 = '#60B0FF'
  color19 = '#B000B0'
  color20 = '#A00050'
  color21 = '#70E080'
  color22 = '#70E0A0'
  color23 = '#50A0A0'
  color24 = '#80B0B0'
  color25 = '#3080A0'
  color26 = '#3CB0D0'
  color27 = '#90E0E0'
  color28 = '#C0F0F0'
  color29 = '#009090'
  yellow  = '#FFFF00'
  color31 = '#400080'
  color32 = '#CC66FF'
  color33 = '#40008054'
  color34 = '#805080'

  base_colors(
    background: color0,
    caret: color1,
    foreground: color2,
    invisibles: color3,
    line_highlight: color4,
    selection: color5,
  )

  item 'Comment', 'comment.block', color6, italic, back: color0
  item 'String', 'string', color7
  # FIXME: duplicate name:
  item 'Built-in constant', 'constant.language', color8
  item 'Integer', 'constant.numeric', color9
  item 'Int32 constant', 'constant.numeric.integer.int32', bold
  item 'Int64 constant', 'constant.numeric.integer.int64', italic
  item 'Nativeint constant', 'constant.numeric.integer.nativeint', bold, italic
  item 'Floating-point constant', 'constant.numeric.floating-point.ocaml', underline
  item 'Character constant', 'constant.character', color10
  item 'Boolean constant', 'constant.language.boolean', color11
  # FIXME: duplicate name:
  item 'Built-in constant', 'constant.language'
  item 'User-defined constant', 'constant.other'
  item 'Variable', 'variable.language, variable.other', teal
  item 'Keyword', 'keyword', color13
  item 'Keyword operator', 'keyword.operator', color14
  item 'Keyword decorator', 'keyword.other.decorator', color2
  item 'Floating-point infix operator', 'keyword.operator.infix.floating-point.ocaml', underline
  item 'Floating-point prefix operator', 'keyword.operator.prefix.floating-point.ocaml', underline
  item 'Compiler directives', 'keyword.other.directive', color15
  item 'Line-number directives', 'keyword.other.directive.line-number', color15, underline
  item 'Control keyword', 'keyword.control', color16
  item 'Storage', 'storage', color17
  item 'Variants', 'entity.name.type.variant', color18
  item 'Polymorphic variants', 'storage.type.variant.polymorphic, entity.name.type.variant.polymorphic', color18, italic
  item 'Module definitions', 'entity.name.type.module', color19
  item 'Module type definitions', 'entity.name.type.module-type.ocaml', color19, underline
  item 'Support modules', 'support.other', color20
  item 'Class name', 'entity.name.type.class', color21
  item 'Class type', 'entity.name.type.class-type', color22
  item 'Inherited class', 'entity.other.inherited-class'
  item 'Function name', 'entity.name.function', color23
  item 'Function argument', 'variable.parameter', color24
  item 'Token definition (ocamlyacc)', 'entity.name.type.token', color25
  item 'Token reference (ocamlyacc)', 'entity.name.type.token.reference', color26
  item 'Non-terminal definition (ocamlyacc)', 'entity.name.function.non-terminal', color27
  item 'Non-terminal reference (ocamlyacc)', 'entity.name.function.non-terminal.reference', color28
  item 'Tag name', 'entity.name.tag', color29
  item 'Tag attribute', 'entity.other.attribute-name'
  # FIXME: no scope:
  item 'Library function', '', back: color0
  item 'Library constant', 'support.constant', back: color0
  item 'Library class/type', 'support.type, support.class'
  item 'Library variable', 'support.other.variable'
  item 'Invalid - illegal', 'invalid.illegal', color31, bold, back: yellow
  item 'Invalid - depricated', 'invalid.deprecated', color0, back: color32
  item 'Camlp4 code', 'source.camlp4.embedded', back: color33
  item 'Camlp4 temp (parser)', 'source.camlp4.embedded.parser.ocaml'
  item 'Punctuation', 'punctuation', color34

end
