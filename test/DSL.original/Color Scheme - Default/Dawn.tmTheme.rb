# encoding: utf-8

# Dawn

theme 'Dawn' do

  author 'David Powers'
  uuid 'E7E82498-F9EA-49A6-A0D8-12327EA46B01'

  color0    = '#F9F9F9'
  black     = '#000000'
  color2    = '#080808'
  color3    = '#4B4B7E80'
  color4    = '#2463B41F'
  color5    = '#275FFF4D'
  gray      = '#808080'
  color7    = '6'
  color8    = '#5A525F'
  color9    = '#811F24'
  color10   = '#BF4F24'
  color11   = '#794938'
  color12   = '#A71D5D'
  color13   = '#0B6125'
  color14   = '#691C97'
  color15   = '#234A97'
  color16   = '#B52A1D'
  color17   = '#F8F8F8'
  color18   = '#6F8BBA26'
  dim_gray  = '#696969'
  color20   = '#CF5628'
  color21   = '#693A17'
  color22   = '#B4371F'
  color23   = '#19356D'
  color24   = '#BBBBBB30'
  gainsboro = '#DCDCDC'

  base_colors(
    background: color0,
    caret: black,
    foreground: color2,
    invisibles: color3,
    line_highlight: color4,
    selection: color5,
    shadow: gray,
    shadow_width: color7,
  )

  item 'Comment', 'comment', color8, italic
  item 'Constant', 'constant', color9, bold
  item 'Entity', 'entity', color10
  item 'Keyword', 'keyword', color11
  item 'Storage', 'storage', color12, italic
  item 'String', 'string | punctuation.definition.string', color13
  item 'Support', 'support', color14
  item 'Variable', 'variable', color15
  item 'Punctuation.separator', 'punctuation.separator', color11
  item 'Invalid – Deprecated', 'invalid.deprecated', color16, bold, italic, underline
  item 'Invalid – Illegal', 'invalid.illegal', color17, italic, underline, back: color16
  item 'String embedded-source', 'string source', color2, back: color18
  item 'String constant', 'string constant', dim_gray, bold
  item 'String variable', 'string variable', color15
  item 'String.regexp', 'string.regexp', color20
  item 'String.regexp.«special»', <<-SCOPE, color20, bold, italic
    string.regexp.character-class, string.regexp constant.character.escaped,
    string.regexp source.ruby.embedded, string.regexp
    string.regexp.arbitrary-repitition
  SCOPE
  item 'String.regexp constant.character.escape', 'string.regexp constant.character.escape', color9, bold
  item 'Embedded Source', 'text source', back: color18
  item 'Support.function', 'support.function', color21
  item 'Support.constant', 'support.constant', color22
  item 'Support.variable', 'support.variable', color15
  item 'Markup.list', 'markup.list', color21
  item 'Markup.heading', 'markup.heading | markup.heading entity.name', color23, bold
  item 'Markup.quote', 'markup.quote', color13, italic, back: color24
  item 'Markup.italic', 'markup.italic', color2, italic
  item 'Markup.bold', 'markup.bold', color2, bold
  item 'Markup.underline', 'markup.underline', color2, underline
  item 'Markup.link', 'markup.link', color15, italic, underline
  item 'Markup.raw', 'markup.raw', color15, back: color24
  item 'Markup.deleted', 'markup.deleted', color16
  item 'Meta.separator', 'meta.separator', color23, bold, back: gainsboro

end
