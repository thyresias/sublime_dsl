# encoding: utf-8

# Inspired by the original 8 MagicWB colors from Martin Huttenloher

theme 'MagicWB (Amiga)' do

  author 'Allan Odgaard'
  uuid 'B0A18BAA-6220-481C-9914-F6D3E51B5410'

  color0  = '#969696'
  white   = '#FFFFFF'
  black   = '#000000'
  color3  = '#FF38FF'
  color4  = '#00000012'
  color5  = '#B1B1B1'
  color6  = '#8D2E75'
  color7  = '#FF000033'
  color8  = '#FFA995'
  color9  = '#0000FF33'
  color10 = '#3A68A3'
  blue    = '#0000FF'
  color12 = '#E5B3FF'
  color13 = '#797979'
  color14 = '#4D4E60'
  color15 = '#00F0C9'
  color16 = '#4C457E'
  color17 = '#8A9ECB'

  base_colors(
    background: color0,
    caret: white,
    foreground: black,
    invisibles: color3,
    line_highlight: color4,
    selection: color5,
  )

  item 'Comment', 'comment', color6, italic
  item 'String', 'string', white, back: color7
  item 'Number', 'constant.numeric', white
  item 'Constant: Built-in', 'constant.language', color8, bold
  item 'Constant: User-defined', 'constant.character, constant.other', color8, back: color9
  item 'Variable', 'variable.language, variable.other', color8
  item 'Keyword', 'keyword', bold
  item 'Storage', 'storage', color10, bold
  item 'Type Name', 'entity.name.type', underline
  item 'Inherited Class', 'entity.other.inherited-class', italic
  item 'Function Name', 'entity.name.function', color8
  item 'Function Argument', 'variable.parameter', italic
  item 'Entity Name', 'entity.name', blue, bold
  item 'Tag Attribute', 'entity.other.attribute-name', color10, italic
  item 'Library Function', 'support.function', color12
  item 'Objective-C Method Call', 'support.function.any-method', black
  item 'Objective-C Method Call - :', 'support.function.any-method - punctuation', italic
  item 'Library Constant', 'support.constant', white
  item 'Library Class/Type', 'support.type, support.class', color8
  item 'Library Variable', 'support.variable', color10
  item 'Invalid', 'invalid', white, back: color13
  item 'Include <system>', 'string.quoted.other.lt-gt.include', color8, italic, back: color0
  item 'Include "user"', 'string.quoted.double.include', color8, back: color0
  item 'Markup: List Item', 'markup.list', color14
  item 'Markup: Raw', 'markup.raw', white, back: blue
  item 'Markup: Quote (Email)', 'markup.quote', color15
  item 'Markup: Quote Double (Email)', 'markup.quote markup.quote', color16
  item 'Embedded Source', 'text.html source', back: color17

end
