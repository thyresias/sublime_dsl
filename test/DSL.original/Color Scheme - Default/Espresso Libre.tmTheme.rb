# encoding: utf-8

theme 'Espresso Libre' do

  author 'Chris Thomas'
  uuid '6B90703E-4E4B-43C8-9D32-921BEDF6D725'

  color0  = '#2A211C'
  color1  = '#889AFF'
  color2  = '#BDAE9D'
  color3  = '#BFBFBF'
  color4  = '#3A312C'
  color5  = '#C3DCFF'
  color6  = '#0066FF'
  color7  = '#43A8ED'
  color8  = '#44AA43'
  color9  = '#C5656B'
  color10 = '#585CF6'
  color11 = '#318495'
  color12 = '#049B0A'
  color13 = '#2FE420'
  color14 = '#1A921C'
  color15 = '#9AFF87'
  color16 = '#FF9358'
  color17 = '#8B8E9C'
  color18 = '#7290D9'
  color19 = '#6D79DE'
  color20 = '#00AF0E'
  color21 = '#2F5FE0'
  color22 = '#687687'
  color23 = '#990000'
  white   = '#FFFFFF'
  color25 = '#FFD0D0'
  color26 = '#F5AA7730'
  color27 = '#8F7E65'
  color28 = '#888888'

  base_colors(
    background: color0,
    caret: color1,
    foreground: color2,
    invisibles: color3,
    line_highlight: color4,
    selection: color5,
  )

  item 'Comment', 'comment', color6, italic
  item 'Keyword', 'keyword, storage', color7, bold
  item 'Number', 'constant.numeric', color8
  item 'User-defined constant', 'constant', color9, bold
  item 'Built-in constant', 'constant.language', color10, bold
  item 'Variable', 'variable.language, variable.other', color11
  item 'String', 'string', color12
  item 'String interpolation', 'constant.character.escape, string source', color13
  item 'Preprocessor line', 'meta.preprocessor', color14
  item 'Preprocessor directive', 'keyword.control.import', color15, bold
  item 'Function name', 'entity.name.function, keyword.other.name-of-parameter.objc', color16, bold
  item 'Type name', 'entity.name.type', underline
  item 'Inherited class name', 'entity.other.inherited-class', italic
  item 'Function parameter', 'variable.parameter', italic
  item 'Function argument and result types', 'storage.type.method', color17
  item 'Section', <<-SCOPE, italic
    meta.section entity.name.section, declaration.section entity.name.section
  SCOPE
  item 'Library function', 'support.function', color18, bold
  item 'Library object', 'support.class, support.type', color19, bold
  item 'Library constant', 'support.constant', color20, bold
  item 'Library variable', 'support.variable', color21, bold
  item 'JS: Operator', 'keyword.operator.js', color22
  item 'Invalid', 'invalid', white, back: color23
  item 'Invalid trailing whitespace', 'invalid.deprecated.trailing-whitespace', back: color25
  item 'Embedded source', 'text source, string.unquoted', back: color26
  item 'Markup XML declaration', 'meta.tag.preprocessor.xml', color27
  item 'Markup DOCTYPE', 'meta.tag.sgml.doctype', color28
  item 'Markup DTD', 'string.quoted.docinfo.doctype.DTD', italic
  item 'Markup tag', 'meta.tag, declaration.tag', color7
  item 'Markup name of tag', 'entity.name.tag', bold
  item 'Markup tag attribute', 'entity.other.attribute-name', italic

end
