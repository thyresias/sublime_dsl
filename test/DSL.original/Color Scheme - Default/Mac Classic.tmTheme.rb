# encoding: utf-8

theme 'Mac Classic' do

  author 'Chris Thomas'
  uuid '71D40D9D-AE48-11D9-920A-000D93589AF6'

  white       = '#FFFFFF'
  black       = '#000000'
  color2      = '#BFBFBF'
  color3      = '#00000012'
  color4      = '#4D97FF54'
  color5      = '#0066FF'
  blue        = '#0000FF'
  medium_blue = '#0000CD'
  color8      = '#C5060B'
  color9      = '#585CF6'
  color10     = '#318495'
  color11     = '#036A07'
  color12     = '#26B31A'
  color13     = '#1A921C'
  color14     = '#0C450D'
  color15     = '#0000A2'
  color16     = '#70727E'
  color17     = '#3C4C72'
  color18     = '#6D79DE'
  color19     = '#06960E'
  color20     = '#21439C'
  color21     = '#687687'
  color22     = '#990000'
  color23     = '#FFD0D0'
  color24     = '#0000000D'
  color25     = '#0000000F'
  color26     = '#68685B'
  color27     = '#888888'
  color28     = '#1C02FF'
  color29     = '#0C07FF'
  color30     = '#B90690'

  base_colors(
    background: white,
    caret: black,
    foreground: black,
    invisibles: color2,
    line_highlight: color3,
    selection: color4,
  )

  item 'Comment', 'comment', color5, italic
  item 'Keyword', 'keyword, storage', blue, bold
  item 'Number', 'constant.numeric', medium_blue
  item 'User-defined constant', 'constant', color8, bold
  item 'Built-in constant', 'constant.language', color9, bold
  item 'Variable', 'variable.language, variable.other', color10
  item 'String', 'string', color11
  item 'String interpolation', 'constant.character.escape, string source', color12
  item 'Preprocessor line', 'meta.preprocessor', color13
  item 'Preprocessor directive', 'keyword.control.import', color14, bold
  item 'Function name', 'entity.name.function, support.function.any-method', color15, bold
  item 'Type name', 'entity.name.type', underline
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
  item 'Embedded embedded source', 'text source string.unquoted, text source text source', back: color25
  item 'Markup XML declaration', 'meta.tag.preprocessor.xml', color26
  item 'Markup DOCTYPE', <<-SCOPE, color27
    meta.tag.sgml.doctype, meta.tag.sgml.doctype entity, meta.tag.sgml.doctype
    string, meta.tag.preprocessor.xml, meta.tag.preprocessor.xml entity,
    meta.tag.preprocessor.xml string
  SCOPE
  item 'Markup DTD', 'string.quoted.docinfo.doctype.DTD', italic
  item 'Markup tag', 'meta.tag, declaration.tag', color28
  item 'Markup name of tag', 'entity.name.tag', bold
  item 'Markup tag attribute', 'entity.other.attribute-name', italic
  item 'Markup: Heading', 'markup.heading', color29, bold
  item 'Markup: Quote', 'markup.quote', black, italic
  item 'Markup: List', 'markup.list', color30

end
