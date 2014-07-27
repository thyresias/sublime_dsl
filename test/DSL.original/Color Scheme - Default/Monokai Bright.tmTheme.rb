# encoding: utf-8

theme 'Monokai Bright' do

  uuid 'D8D5E82E-3D5B-46B5-B38E-8C841C21347E'

  color0  = '#272822'
  color1  = '#F8F8F0'
  color2  = '#F8F8F2'
  color3  = '#3B3A32'
  color4  = '#3E3D32'
  color5  = '#9D550F'
  color6  = '#FFFFF8'
  color7  = '#BBBBBB'
  color8  = '#222222'
  color9  = '#FFE792'
  black   = '#000000'
  color11 = '#9D550FB0'
  color12 = '#F8F8F2A5'
  color13 = 'underline'
  color14 = 'stippled_underline'
  color15 = '#75715E'
  color16 = '#E6DB74'
  color17 = '#AE81FF'
  color18 = '#F92672'
  color19 = '#66D9EF'
  color20 = '#A6E22E'
  color21 = '#FD971F'
  color22 = '#CFCFC2'
  color23 = '#AE81FFA0'

  base_colors(
    background: color0,
    caret: color1,
    foreground: color2,
    invisibles: color3,
    line_highlight: color4,
    selection: color5,
    selection_foreground: color6,
    inactive_selection: color7,
    inactive_selection_foreground: color8,
    find_highlight: color9,
    find_highlight_foreground: black,
    active_guide: color11,
    brackets_foreground: color12,
    brackets_options: color13,
    bracket_contents_foreground: color12,
    bracket_contents_options: color13,
    tags_options: color14,
  )

  item 'Comment', 'comment', color15
  item 'String', 'string', color16
  item 'Number', 'constant.numeric', color17
  item 'Built-in constant', 'constant.language', color17
  item 'User-defined constant', 'constant.character, constant.other', color17
  item 'Variable', 'variable'
  item 'Keyword', 'keyword', color18
  item 'Storage', 'storage', color18
  item 'Storage type', 'storage.type', color19, italic
  item 'Class name', 'entity.name.class', color20, underline
  item 'Inherited class', 'entity.other.inherited-class', color20, italic, underline
  item 'Function name', 'entity.name.function', color20
  item 'Function argument', 'variable.parameter', color21, italic
  item 'Tag name', 'entity.name.tag', color18
  item 'Tag attribute', 'entity.other.attribute-name', color20
  item 'Library function', 'support.function', color19
  item 'Library constant', 'support.constant', color19
  item 'Library class/type', 'support.type, support.class', color19, italic
  item 'Library variable', 'support.other.variable'
  item 'Invalid', 'invalid', color1, back: color18
  item 'Invalid deprecated', 'invalid.deprecated', color1, back: color17
  item 'JSON String', 'meta.structure.dictionary.json string.quoted.double.json', color22
  item 'diff.header', 'meta.diff, meta.diff.header', color15
  item 'diff.deleted', 'markup.deleted', color18
  item 'diff.inserted', 'markup.inserted', color20
  item 'diff.changed', 'markup.changed', color16
  # FIXME: no name:
  item '', 'constant.numeric.line-number.find-in-files - match', color23
  # FIXME: no name:
  item '', 'entity.name.filename.find-in-files', color16

end
