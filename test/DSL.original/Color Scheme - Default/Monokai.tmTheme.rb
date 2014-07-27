# encoding: utf-8

theme 'Monokai' do

  uuid 'D8D5E82E-3D5B-46B5-B38E-8C841C21347D'

  color0  = '#272822'
  color1  = '#F8F8F0'
  color2  = '#F8F8F2'
  color3  = '#3B3A32'
  color4  = '#3E3D32'
  color5  = '#49483E'
  color6  = '#FFE792'
  black   = '#000000'
  color8  = '#222218'
  color9  = '#9D550FB0'
  color10 = '#F8F8F2A5'
  color11 = 'underline'
  color12 = 'stippled_underline'
  color13 = '#75715E'
  color14 = '#E6DB74'
  color15 = '#AE81FF'
  color16 = '#F92672'
  color17 = '#66D9EF'
  color18 = '#A6E22E'
  color19 = '#FD971F'
  color20 = '#CFCFC2'
  color21 = '#AE81FFA0'

  base_colors(
    background: color0,
    caret: color1,
    foreground: color2,
    invisibles: color3,
    line_highlight: color4,
    selection: color5,
    find_highlight: color6,
    find_highlight_foreground: black,
    selection_border: color8,
    active_guide: color9,
    brackets_foreground: color10,
    brackets_options: color11,
    bracket_contents_foreground: color10,
    bracket_contents_options: color11,
    tags_options: color12,
  )

  item 'Comment', 'comment', color13
  item 'String', 'string', color14
  item 'Number', 'constant.numeric', color15
  item 'Built-in constant', 'constant.language', color15
  item 'User-defined constant', 'constant.character, constant.other', color15
  item 'Variable', 'variable'
  item 'Keyword', 'keyword', color16
  item 'Storage', 'storage', color16
  item 'Storage type', 'storage.type', color17, italic
  item 'Class name', 'entity.name.class', color18, underline
  item 'Inherited class', 'entity.other.inherited-class', color18, italic, underline
  item 'Function name', 'entity.name.function', color18
  item 'Function argument', 'variable.parameter', color19, italic
  item 'Tag name', 'entity.name.tag', color16
  item 'Tag attribute', 'entity.other.attribute-name', color18
  item 'Library function', 'support.function', color17
  item 'Library constant', 'support.constant', color17
  item 'Library class/type', 'support.type, support.class', color17, italic
  item 'Library variable', 'support.other.variable'
  item 'Invalid', 'invalid', color1, back: color16
  item 'Invalid deprecated', 'invalid.deprecated', color1, back: color15
  item 'JSON String', 'meta.structure.dictionary.json string.quoted.double.json', color20
  item 'diff.header', 'meta.diff, meta.diff.header', color13
  item 'diff.deleted', 'markup.deleted', color16
  item 'diff.inserted', 'markup.inserted', color18
  item 'diff.changed', 'markup.changed', color14
  # FIXME: no name:
  item '', 'constant.numeric.line-number.find-in-files - match', color21
  # FIXME: no name:
  item '', 'entity.name.filename.find-in-files', color14

end
