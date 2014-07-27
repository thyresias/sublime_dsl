# encoding: utf-8

theme 'iPlastic' do

  author 'Jeroen van der Ham'
  uuid '4FCFA210-B247-11D9-9D00-000D93347A42'

  color0  = '#EEEEEEEB'
  black   = '#000000'
  color2  = '#B3B3B3F4'
  color3  = '#0000001A'
  color4  = '#BAD6FD'
  color5  = '#009933'
  color6  = '#0066FF'
  color7  = '#FF0080'
  blue    = '#0000FF'
  color9  = '#9700CC'
  color10 = '#990000'
  color11 = '#FF8000'
  color12 = '#E71A114D'
  red     = '#FF0000'
  color14 = '#E71A1100'
  color15 = '#FAFAFAFC'
  color16 = '#0033CC'
  color17 = '#6782D3'
  color18 = '#3333FF'
  color19 = '#333333'
  color20 = '#3366CC'

  base_colors(
    background: color0,
    caret: black,
    foreground: black,
    invisibles: color2,
    line_highlight: color3,
    selection: color4,
  )

  item 'String', 'string', color5
  item 'Number', 'constant.numeric', color6
  item 'Regular expression', 'string.regexp', color7
  item 'Keyword', 'keyword', blue
  item 'Identifier', 'constant.language', color9
  item 'Exception', 'support.class.exception', color10
  item 'Function name', 'entity.name.function', color11
  item 'Type name', 'entity.name.type', bold, underline
  item 'Arguments', 'variable.parameter', italic
  item 'Comment', 'comment', color6, italic
  item 'Invalid', 'invalid', red, back: color12
  item 'Trailing whitespace', 'invalid.deprecated.trailing-whitespace', back: color14
  item 'Embedded source', 'text source', black, back: color15
  item 'Tag', 'meta.tag, declaration.tag', color16
  item 'Constant', 'constant, support.constant', color17
  item 'Support', 'support', color18, bold
  item 'Storage', 'storage', bold
  item 'Section name', 'entity.name.section', bold, underline
  item 'Frame title', 'entity.name.function.frame', black, bold
  item 'XML Declaration', 'meta.tag.preprocessor.xml', color19
  item 'Tag Attribute', 'entity.other.attribute-name', color20, italic
  item 'Tag Name', 'entity.name.tag', bold

end
