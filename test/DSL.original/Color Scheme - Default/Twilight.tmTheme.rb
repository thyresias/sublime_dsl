# encoding: utf-8

theme 'Twilight' do

  author 'Michael Sheets'
  uuid '766026CB-703D-4610-B070-8DE07D967C5F'

  color0  = '#141414'
  color1  = '#A7A7A7'
  color2  = '#F8F8F8'
  color3  = '#FFFFFF40'
  color4  = '#FFFFFF08'
  color5  = '#DDF0FF33'
  color6  = '#5F5A60'
  color7  = '#CF6A4C'
  color8  = '#9B703F'
  color9  = '#CDA869'
  color10 = '#F9EE98'
  color11 = '#8F9D6A'
  color12 = '#9B859D'
  color13 = '#7587A6'
  color14 = '#D2A8A1'
  color15 = '#562D56BF'
  color16 = '#B0B3BA14'
  color17 = '#B1B3BA21'
  color18 = '#9B5C2E'
  color19 = '#DAEFA3'
  color20 = '#DDF2A4'
  color21 = '#E9C062'
  color22 = '#CF7D34'
  color23 = '#8A9A95'
  color24 = '#DAD085'
  color25 = '#8996A8'
  color26 = '#AFC4DB'
  color27 = '#494949'
  color28 = '#AC885B'
  color29 = '#E0C589'
  color30 = '#8B98AB'
  color31 = '#C5AF75'
  color32 = '#8693A5'
  color33 = '#CA7840'
  color34 = '#0E2231'
  color35 = '#420E09'
  color36 = '#4A410D'
  color37 = '#253B22'

  base_colors(
    background: color0,
    caret: color1,
    foreground: color2,
    invisibles: color3,
    line_highlight: color4,
    selection: color5,
  )

  item 'Comment', 'comment', color6, italic
  item 'Constant', 'constant', color7
  item 'Entity', 'entity', color8
  item 'Keyword', 'keyword', color9
  item 'Storage', 'storage', color10
  item 'String', 'string', color11
  item 'Support', 'support', color12
  item 'Variable', 'variable', color13
  item 'Invalid – Deprecated', 'invalid.deprecated', color14, italic, underline
  item 'Invalid – Illegal', 'invalid.illegal', color2, back: color15
  # FIXME: no scope:
  item '-----------------------------------', ''
  item '♦ Embedded Source', 'text source', back: color16
  item '♦ Embedded Source (Bright)', 'text.html.ruby source', back: color17
  item '♦ Entity inherited-class', 'entity.other.inherited-class', color18, italic
  item '♦ String embedded-source', 'string source', color19
  item '♦ String constant', 'string constant', color20
  item '♦ String.regexp', 'string.regexp', color21
  item '♦ String.regexp.«special»', <<-SCOPE, color22
    string.regexp constant.character.escape, string.regexp source.ruby.embedded,
    string.regexp string.regexp.arbitrary-repitition
  SCOPE
  item '♦ String variable', 'string variable', color23
  item '♦ Support.function', 'support.function', color24
  item '♦ Support.constant', 'support.constant', color7
  item 'c C/C++ Preprocessor Line', 'meta.preprocessor.c', color25
  item 'c C/C++ Preprocessor Directive', 'meta.preprocessor.c keyword', color26
  item '✘ Doctype/XML Processing', <<-SCOPE, color27
    meta.tag.sgml.doctype, meta.tag.sgml.doctype entity, meta.tag.sgml.doctype
    string, meta.tag.preprocessor.xml, meta.tag.preprocessor.xml entity,
    meta.tag.preprocessor.xml string
  SCOPE
  item '✘ Meta.tag.«all»', 'declaration.tag, declaration.tag entity, meta.tag, meta.tag entity', color28
  item '✘ Meta.tag.inline', <<-SCOPE, color29
    declaration.tag.inline, declaration.tag.inline entity, source entity.name.tag,
    source entity.other.attribute-name, meta.tag.inline, meta.tag.inline entity
  SCOPE
  item '§ css tag-name', 'meta.selector.css entity.name.tag', color9
  item '§ css:pseudo-class', 'meta.selector.css entity.other.attribute-name.tag.pseudo-class', color11
  item '§ css#id', 'meta.selector.css entity.other.attribute-name.id', color30
  item '§ css.class', 'meta.selector.css entity.other.attribute-name.class', color8
  item '§ css property-name:', 'support.type.property-name.css', color31
  item '§ css property-value;', <<-SCOPE, color10
    meta.property-group support.constant.property-value.css, meta.property-value
    support.constant.property-value.css
  SCOPE
  item '§ css @at-rule', 'meta.preprocessor.at-rule keyword.control.at-rule', color32
  item '§ css additional-constants', <<-SCOPE, color33
    meta.property-value support.constant.named-color.css, meta.property-value
    constant
  SCOPE
  item '§ css constructor.argument', 'meta.constructor.argument.css', color11
  item '⎇ diff.header', 'meta.diff, meta.diff.header, meta.separator', color2, italic, back: color34
  item '⎇ diff.deleted', 'markup.deleted', color2, back: color35
  item '⎇ diff.changed', 'markup.changed', color2, back: color36
  item '⎇ diff.inserted', 'markup.inserted', color2, back: color37
  item 'Markup: List', 'markup.list', color10
  item 'Markup: Heading', 'markup.heading', color7

end
