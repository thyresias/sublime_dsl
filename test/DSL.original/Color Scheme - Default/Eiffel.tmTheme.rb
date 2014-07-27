# encoding: utf-8

theme 'Eiffel' do

  author 'Ian Joyner'
  uuid 'ADD7FDE7-C6BE-454B-A71A-7951ED54FB04'

  white   = '#FFFFFF'
  black   = '#000000'
  color2  = '#BFBFBF'
  color3  = '#00000012'
  color4  = '#C3DCFF'
  color5  = '#00B418'
  color6  = '#0206FF'
  color7  = '#0100B6'
  color8  = '#CD0000'
  color9  = '#C5060B'
  color10 = '#585CF6'
  color11 = '#D80800'
  color12 = '#26B31A'
  color13 = '#1A921C'
  color14 = '#0C450D'
  color15 = '#0000A2'
  color16 = '#70727E'
  color17 = '#3C4C72'
  color18 = '#6D79DE'
  color19 = '#06960E'
  color20 = '#21439C'
  color21 = '#687687'
  color22 = '#990000'
  color23 = '#FFD0D0'
  color24 = '#427FF530'
  color25 = '#68685B'
  color26 = '#888888'
  color27 = '#1C02FF'
  color28 = '#0C07FF'
  color29 = '#B90690'

  base_colors(
    background: white,
    caret: black,
    foreground: black,
    invisibles: color2,
    line_highlight: color3,
    selection: color4,
  )

  item 'Comment', 'comment', color5
  item 'Variable', 'variable', color6, italic
  item 'Keyword', 'keyword', color7, bold
  item 'Number', 'constant.numeric', color8, italic
  item 'User-defined constant', 'constant', color9, italic
  item 'Built-in constant', 'constant.language', color10, italic
  item 'String', 'string', color11
  item 'String interpolation', 'constant.character.escape, string source', color12
  item 'Preprocessor line', 'meta.preprocessor', color13
  item 'Preprocessor directive', 'keyword.control.import', color14, bold
  item 'Function name', 'entity.name.function, keyword.other.name-of-parameter.objc', color15, bold
  item 'Type name', 'entity.name.type', italic
  item 'Inherited class name', 'entity.other.inherited-class', italic
  item 'Function parameter', 'variable.parameter', italic
  item 'Function argument and result types', 'storage.type.method', color16
  item 'Section', <<-SCOPE, italic
    meta.section entity.name.section, declaration.section entity.name.section
  SCOPE
  item 'Library function', 'support.function', color17, bold
  item 'Library object', 'support.class, support.type', color18, bold
  item 'Library constant', 'support.constant', color19, bold
  item 'Library variable', 'support.variable', color20, bold
  item 'JS: Operator', 'keyword.operator.js', color21
  item 'Invalid', 'invalid', white, back: color22
  item 'Invalid trailing whitespace', 'invalid.deprecated.trailing-whitespace', back: color23
  item 'Embedded source', 'text source, string.unquoted', back: color24
  item 'Markup XML declaration', 'meta.xml-processing, declaration.xml-processing', color25
  item 'Markup DOCTYPE', 'meta.doctype, declaration.doctype', color26
  item 'Markup DTD', 'meta.doctype.DTD, declaration.doctype.DTD', italic
  item 'Markup tag', 'meta.tag, declaration.tag', color27
  item 'Markup name of tag', 'entity.name.tag', bold
  item 'Markup tag attribute', 'entity.other.attribute-name', italic
  item 'Markup: Heading', 'markup.heading', color28, bold
  item 'Markup: Quote', 'markup.quote', black, italic
  item 'Markup: List', 'markup.list', color29

end
