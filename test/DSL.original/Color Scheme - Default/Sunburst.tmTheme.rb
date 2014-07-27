# encoding: utf-8

# (π) Soryu, 2005

theme 'Sunburst' do

  author 'Stanley Rost'
  uuid 'C8C58F9A-35FE-44A4-9BC2-2F3C343DC81D'

  black   = '#000000'
  color1  = '#A7A7A7'
  color2  = '#F8F8F8'
  color3  = '#CAE2FB3D'
  color4  = '#FFFFFF0D'
  color5  = '#DDF0FF33'
  color6  = '#AEAEAE'
  color7  = '#3387CC'
  color8  = '#89BDFF'
  color9  = '#E28964'
  color10 = '#99CF50'
  color11 = '#65B042'
  color12 = '#9B859D'
  color13 = '#3E87E3'
  color14 = '#FD5FF1'
  color15 = '#562D56BF'
  color16 = '#B1B3BA08'
  color17 = '#9B5C2E'
  color18 = '#DAEFA3'
  color19 = '#DDF2A4'
  color20 = '#E9C062'
  color21 = '#CF7D34'
  color22 = '#8A9A95'
  color23 = '#DAD085'
  color24 = '#CF6A4C'
  color25 = '#8996A8'
  color26 = '#AFC4DB'
  color27 = '#676767'
  color28 = '#494949'
  color29 = '#E0C589'
  color30 = '#E18964'
  color31 = '#CDA869'
  color32 = '#8F9D6A'
  color33 = '#8B98AB'
  color34 = '#9B703F'
  color35 = '#C5AF75'
  color36 = '#F9EE98'
  color37 = '#8693A5'
  color38 = '#DD7B3B'
  color39 = '#0E2231'
  color40 = '#420E09'
  color41 = '#4A410D'
  color42 = '#253B22'
  color43 = '#FEE09C12'
  color44 = '#E1D4B9'
  color45 = '#632D04'
  color46 = '#FEDCC5'
  color47 = '#578BB3'
  color48 = '#F67B37'
  color49 = '#242424'
  color50 = '#60A633'
  color51 = '#EEEEEE29'
  color52 = '#751012'

  base_colors(
    background: black,
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
  item 'Invalid – Illegal', 'invalid.illegal', color14, back: color15
  # FIXME: no scope:
  item '-----------------------------------', ''
  item '♦ Embedded Source (Bright)', 'text source', back: color16
  item '♦ Entity inherited-class', 'entity.other.inherited-class', color17, italic
  item '♦ String embedded-source', 'string.quoted source', color18
  item '♦ String constant', 'string constant', color19
  item '♦ String.regexp', 'string.regexp', color20
  item '♦ String.regexp.«special»', <<-SCOPE, color21
    string.regexp constant.character.escape, string.regexp source.ruby.embedded,
    string.regexp string.regexp.arbitrary-repitition
  SCOPE
  item '♦ String variable', 'string variable', color22
  item '♦ Support.function', 'support.function', color23
  item '♦ Support.constant', 'support.constant', color24
  item 'c C/C++ Preprocessor Line', 'meta.preprocessor.c', color25
  item 'c C/C++ Preprocessor Directive', 'meta.preprocessor.c keyword', color26
  item 'j Entity Name Type', 'entity.name.type', underline
  item 'j Cast', 'meta.cast', color27, italic
  item '✘ Doctype/XML Processing', <<-SCOPE, color28
    meta.sgml.html meta.doctype, meta.sgml.html meta.doctype entity, meta.sgml.html
    meta.doctype string, meta.xml-processing, meta.xml-processing entity,
    meta.xml-processing string
  SCOPE
  item '✘ Meta.tag.«all»', 'meta.tag, meta.tag entity', color8
  item '✘ Meta.tag.inline', <<-SCOPE, color29
    source entity.name.tag, source entity.other.attribute-name, meta.tag.inline,
    meta.tag.inline entity
  SCOPE
  item '✘ Namespaces', 'entity.name.tag.namespace, entity.other.attribute-name.namespace', color30
  item '§ css tag-name', 'meta.selector.css entity.name.tag', color31
  item '§ css:pseudo-class', 'meta.selector.css entity.other.attribute-name.tag.pseudo-class', color32
  item '§ css#id', 'meta.selector.css entity.other.attribute-name.id', color33
  item '§ css.class', 'meta.selector.css entity.other.attribute-name.class', color34
  item '§ css property-name:', 'support.type.property-name.css', color35
  item '§ css property-value;', <<-SCOPE, color36
    meta.property-group support.constant.property-value.css, meta.property-value
    support.constant.property-value.css
  SCOPE
  item '§ css @at-rule', 'meta.preprocessor.at-rule keyword.control.at-rule', color37
  item '§ css additional-constants', <<-SCOPE, color38
    meta.property-value support.constant.named-color.css, meta.property-value
    constant
  SCOPE
  item '§ css constructor.argument', 'meta.constructor.argument.css', color32
  item '⎇ diff.header', 'meta.diff, meta.diff.header', color2, italic, back: color39
  item '⎇ diff.deleted', 'markup.deleted', color2, back: color40
  item '⎇ diff.changed', 'markup.changed', color2, back: color41
  item '⎇ diff.inserted', 'markup.inserted', color2, back: color42
  # FIXME: no scope:
  item '--------------------------------', ''
  item 'Markup: Italic', 'markup.italic', color20, italic
  item 'Markup: Bold', 'markup.bold', color20, bold
  item 'Markup: Underline', 'markup.underline', color30, underline
  item 'Markup: Quote', 'markup.quote', color44, italic, back: color43
  item 'Markup: Heading', 'markup.heading, markup.heading entity', color46, back: color45
  item 'Markup: List', 'markup.list', color44
  item 'Markup: Raw', 'markup.raw', color47, back: color16
  item 'Markup: Comment', 'markup comment', color48, italic
  item 'Markup: Separator', 'meta.separator', color50, back: color49
  item 'Log Entry', 'meta.line.entry.logfile, meta.line.exit.logfile', back: color51
  item 'Log Entry Error', 'meta.line.error.logfile', back: color52

end
