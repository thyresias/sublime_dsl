# encoding: utf-8

theme "All Hallow's Eve" do

  author 'David Heinemeier Hansson'
  uuid '37F22BDC-B2F4-11D9-850C-000A95A89C98'

  black   = '#000000'
  white   = '#FFFFFF'
  color2  = '#404040'
  color3  = '#333300'
  color4  = '#73597EE0'
  color5  = '#434242'
  color6  = '#9933CC'
  color7  = '#3387CC'
  color8  = '#CC7833'
  color9  = '#D0D0FF'
  color10 = '#9B9B9B'
  color11 = '#66CC33'
  color12 = '#AAAAAA'
  color13 = '#CCCC33'
  color14 = '#555555'
  color15 = '#C83730'

  base_colors(
    background: black,
    caret: white,
    foreground: white,
    invisibles: color2,
    line_highlight: color3,
    selection: color4,
  )

  item 'Text base', 'text', white, back: color5
  item 'Source base', 'source', white, back: black
  item 'Comment', 'comment', color6
  item 'Constant', 'constant', color7
  item 'Keyword', 'keyword', color8
  item 'Pre-processor Line', 'meta.preprocessor.c', color9
  item 'Pre-processor Directive', 'keyword.control.import'
  item 'Function name', 'entity.name.function'
  item 'Function argument', 'variable.parameter', italic
  item 'Block comment', 'source comment.block', white, back: color10
  item 'String', 'string', color11
  item 'String escapes', 'string constant.character.escape', color12
  item 'String (executed)', 'string.interpolated', black, back: color13
  item 'Regular expression', 'string.regexp', color13
  item 'String (literal)', 'string.literal', color13
  item 'String escapes (executed)', 'string.interpolated constant.character.escape', color14
  item 'Type name', 'entity.name.type', underline
  item 'Class inheritance', 'entity.other.inherited-class', italic, underline
  item 'Tag name', 'entity.name.tag', underline
  item 'Tag attribute', 'entity.other.attribute-name'
  item 'Support function', 'support.function', color15

end
