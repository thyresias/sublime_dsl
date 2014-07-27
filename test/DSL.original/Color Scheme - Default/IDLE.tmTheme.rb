# encoding: utf-8

theme 'IDLE' do

  author 'Domenico Carbotta'
  uuid 'DDC0CBE1-442B-4CB5-80E4-26E4CFB3A277'

  white   = '#FFFFFF'
  black   = '#000000'
  color2  = '#BFBFBF'
  color3  = '#00000012'
  color4  = '#BAD6FD'
  color5  = '#919191'
  color6  = '#00A33F'
  color7  = '#A535AE'
  color8  = '#FF5600'
  color9  = '#21439C'
  color10 = '#990000'

  base_colors(
    background: white,
    caret: black,
    foreground: black,
    invisibles: color2,
    line_highlight: color3,
    selection: color4,
  )

  item 'Comment', 'comment', color5
  item 'String', 'string', color6
  item 'Number', 'constant.numeric'
  item 'Built-in constant', 'constant.language', color7
  item 'User-defined constant', 'constant.character, constant.other'
  item 'Variable', 'variable.language, variable.other'
  item 'Keyword', 'keyword', color8
  item 'Storage', 'storage', color8
  item 'Type name', 'entity.name.type', color9
  item 'Inherited class', 'entity.other.inherited-class'
  item 'Function name', 'entity.name.function', color9
  item 'Function argument', 'variable.parameter'
  item 'Tag name', 'entity.name.tag'
  item 'Tag attribute', 'entity.other.attribute-name'
  item 'Library function', 'support.function', color7
  item 'Library constant', 'support.constant', color7
  item 'Library class/type', 'support.type, support.class', color7
  item 'Library variable', 'support.variable', color7
  item 'Invalid', 'invalid', white, back: color10
  item 'String interpolation', 'constant.other.placeholder.py', color10

end
