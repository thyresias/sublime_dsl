# encoding: utf-8

# Created by Jacob Rus.  Based on ‘Slate’ by Wilson Miner

theme 'Cobalt' do

  author 'Jacob Rus'
  uuid '06CD1FB2-A00A-4F8C-97B2-60E131980454'

  color0  = '#002240'
  white   = '#FFFFFF'
  color2  = '#FFFFFF26'
  color3  = '#00000059'
  color4  = '#B36539BF'
  color5  = '#E1EFFF'
  color6  = '#FF628C'
  color7  = '#FFDD00'
  color8  = '#FF9D00'
  color9  = '#FFEE80'
  color10 = '#3AD900'
  color11 = '#0088FF'
  color12 = '#80FFBB'
  color13 = '#CCCCCC'
  color14 = '#FF80E1'
  color15 = '#800F00'
  color16 = '#F8F8F8'
  color17 = '#223545'
  color18 = '#80FCFF'
  color19 = '#9EFF80'
  color20 = '#80FF82'
  color21 = '#80FFC2'
  color22 = '#EDEF7D'
  color23 = '#FFB054'
  color24 = '#EB939A'
  color25 = '#FF1E00'
  color26 = '#8996A8'
  color27 = '#AFC4DB'
  color28 = '#73817D'
  color29 = '#9EFFFF'
  color30 = '#FFB454'
  color31 = '#5FE461'
  color32 = '#9DF39F'
  color33 = '#F6F080'
  color34 = '#F6AA11'
  color35 = '#EDF080'
  color36 = '#000E1A'
  color37 = '#4C0900'
  color38 = '#806F00'
  color39 = '#154F00'
  color40 = '#8FDDF630'
  color41 = '#004480'
  color42 = '#130D26'
  color43 = '#C1AFFF'
  color44 = '#B8FFD9'
  color45 = '#001221'
  color46 = '#C8E4FD'

  base_colors(
    background: color0,
    caret: white,
    foreground: white,
    invisibles: color2,
    line_highlight: color3,
    selection: color4,
  )

  item 'Punctuation', <<-SCOPE, color5
    punctuation - (punctuation.definition.string || punctuation.definition.comment)
  SCOPE
  item 'Constant', 'constant', color6
  item 'Entity', 'entity', color7
  item 'Keyword', 'keyword', color8
  item 'Storage', 'storage', color9
  item 'String', <<-SCOPE, color10
    string -string.unquoted.old-plist -string.unquoted.heredoc,
    string.unquoted.heredoc string
  SCOPE
  item 'Comment', 'comment', color11, italic
  item 'Support', 'support', color12
  item 'Variable', 'variable', color13
  item 'Lang Variable', 'variable.language', color14
  item 'Function Call', 'meta.function-call', color9
  item 'Invalid', 'invalid', color16, back: color15
  item 'Embedded Source', 'text source, string.unquoted.heredoc, source source', white, back: color17
  item 'Entity inherited-class', 'entity.other.inherited-class', color18, italic
  item 'String embedded-source', 'string.quoted source', color19
  item 'String constant', 'string constant', color20
  item 'String.regexp', 'string.regexp', color21
  item 'String variable', 'string variable', color22
  item 'Support.function', 'support.function', color23
  item 'Support.constant', 'support.constant', color24
  item 'Exception', 'support.type.exception', color25
  item 'C/C++ Preprocessor Line', 'meta.preprocessor.c', color26
  item 'C/C++ Preprocessor Directive', 'meta.preprocessor.c keyword', color27
  item 'Doctype/XML Processing', <<-SCOPE, color28
    meta.sgml.html meta.doctype, meta.sgml.html meta.doctype entity, meta.sgml.html
    meta.doctype string, meta.xml-processing, meta.xml-processing entity,
    meta.xml-processing string
  SCOPE
  item 'Meta.tag.A', 'meta.tag, meta.tag entity', color29
  item 'css tag-name', 'meta.selector.css entity.name.tag', color29
  item 'css#id', 'meta.selector.css entity.other.attribute-name.id', color30
  item 'css.class', 'meta.selector.css entity.other.attribute-name.class', color31
  item 'css property-name:', 'support.type.property-name.css', color32
  item 'css property-value;', <<-SCOPE, color33
    meta.property-group support.constant.property-value.css, meta.property-value
    support.constant.property-value.css
  SCOPE
  item 'css @at-rule', 'meta.preprocessor.at-rule keyword.control.at-rule', color34
  item 'css additional-constants', <<-SCOPE, color35
    meta.property-value support.constant.named-color.css, meta.property-value
    constant
  SCOPE
  item 'css constructor.argument', 'meta.constructor.argument.css', color24
  item 'diff.header', 'meta.diff, meta.diff.header', color16, back: color36
  item 'diff.deleted', 'markup.deleted', color16, back: color37
  item 'diff.changed', 'markup.changed', color16, back: color38
  item 'diff.inserted', 'markup.inserted', color16, back: color39
  item 'Raw Markup', 'markup.raw', back: color40
  item 'Block Quote', 'markup.quote', back: color41
  item 'List', 'markup.list', back: color42
  item 'Bold Markup', 'markup.bold', color43, bold
  item 'Italic Markup', 'markup.italic', color44, italic
  item 'Heading Markup', 'markup.heading', color46, bold, back: color45

end
