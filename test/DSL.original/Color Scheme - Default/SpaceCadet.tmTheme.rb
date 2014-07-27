# encoding: utf-8

# Created by Alex Ross

theme 'SpaceCadet' do

  author 'Alex Ross'
  uuid '2C24E84F-F9FE-4C2E-92D2-F52198BA7E41'

  color0  = '#0D0D0D'
  color1  = '#7F005D'
  color2  = '#DDE6CF'
  color3  = '#BFBFBF'
  color4  = '#00000012'
  color5  = '#40002F'
  color6  = '#473C45'
  color7  = '#805978'
  color8  = '#A8885A'
  color9  = '#596380'
  color10 = '#728059'
  color11 = '#9EBF60'
  color12 = '#6078BF'
  color13 = '#8A4B66'
  color14 = '#893062'
  color15 = '#5F0047'
  color16 = '#371D28'

  base_colors(
    background: color0,
    caret: color1,
    foreground: color2,
    invisibles: color3,
    line_highlight: color4,
    selection: color5,
  )

  item 'Comment', 'comment', color6
  item 'String', 'string', color7
  item 'Constant', 'constant', color8
  item 'Variable', 'variable.parameter, variable.other', color9
  item 'Keyword', 'keyword - keyword.operator, keyword.operator.logical', color10
  item 'Storage', 'storage', color11
  item 'Entity', 'entity', color12
  item 'Inherited class', 'entity.other.inherited-class', italic
  item 'Support', 'support', color13
  item 'Exception', 'support.type.exception', color14
  item 'Tag name', 'entity.name.tag'
  item 'Tag attribute', 'entity.other.attribute-name'
  item 'Library constant', 'support.constant'
  item 'Library class/type', 'support.type, support.class'
  item 'Library variable', 'support.other.variable'
  item 'Invalid', 'invalid', back: color15
  # FIXME: no scope:
  item '- Meta', ''
  item '  function.section', 'meta.function.section', back: color16

end
