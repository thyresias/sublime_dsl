# encoding: utf-8

theme 'Pastels on Dark' do

  author 'Mats Persson'
  uuid '343011CC-B7DF-11D9-B5C6-000D93C8BE28'

  color0  = '#211E1E'
  white   = '#FFFFFF'
  color2  = '#DADADA'
  color3  = '#4F4D4D'
  color4  = '#353030'
  color5  = '#73597E80'
  color6  = '#555555'
  color7  = '#AD9361'
  color8  = '#CCCCCC'
  color9  = '#A1A1FF'
  color10 = '#2F006E'
  blue    = '#0000FF'
  red     = '#FF0000'
  color13 = '#FFF9F9'
  color14 = '#FFD0D0'
  color15 = '#C10006'
  color16 = '#666666'
  color17 = '#C1C144'
  color18 = '#6782D3'
  color19 = '#AFA472'
  color20 = '#DE8E30'
  color21 = '#858EF4'
  color22 = '#9B456F'
  color23 = '#C82255'
  color24 = '#47B8D6'
  color25 = '#6969FA'
  color26 = '#68685B'
  color27 = '#888888'
  color28 = '#909090'
  color29 = '#777777'
  color30 = '#DE8E20'
  color31 = '#DE8E10'
  color32 = '#B72E1D'
  lime    = '#00FF00'
  color34 = '#BFA36D'
  color35 = '#EC9E00'
  color36 = '#B8CD06'
  color37 = '#EDCA06'
  color38 = '#2E759C'
  color39 = '#9B2E4D'
  color40 = '#E1C96B'
  color41 = '#666633'
  color42 = '#7171F3'

  base_colors(
    background: color0,
    caret: white,
    foreground: color2,
    invisibles: color3,
    line_highlight: color4,
    selection: color5,
  )

  item 'Comments', 'comment', color6
  item 'Comments Block', 'comment.block', color6
  item 'Strings', 'string', color7
  item 'Numbers', 'constant.numeric', color8
  item 'Keywords', 'keyword', color9
  item 'Preprocessor Line', 'meta.preprocessor', color10
  item 'Preprocessor Directive', 'keyword.control.import', bold
  item 'Functions', 'support.function', color9
  item 'Function result', 'declaration.function function-result', blue
  item 'Function name', 'declaration.function function-name', bold
  item 'Function argument name', 'declaration.function argument-name', bold
  item 'Function argument type', 'declaration.function function-arg-type', blue
  item 'Function argument variable', 'declaration.function function-argument', italic
  item 'Class name', 'declaration.class class-name', underline
  item 'Class inheritance', 'declaration.class class-inheritance', italic, underline
  item 'Invalid', 'invalid', color13, bold, back: red
  item 'Invalid Trailing Whitespace', 'invalid.deprecated.trailing-whitespace', back: color14
  item 'Section', 'declaration.section section-name', italic
  item 'Interpolation', 'string.interpolation', color15
  item 'Regular Expressions', 'string.regexp', color16
  item 'Variables', 'variable', color17
  item 'Constants', 'constant', color18
  item 'Character Constants', 'constant.character', color19
  item 'Language Constants', 'constant.language', color20, bold
  item 'Embedded Code', 'embedded', underline
  item 'Tag name', 'keyword.markup.element-name', color21
  item 'Attribute name', 'keyword.markup.attribute-name', color22
  item 'Attribute with Value', 'meta.attribute-with-value', color22
  item 'Exceptions', 'keyword.exception', color23, bold
  item 'Operators', 'keyword.operator', color24
  item 'Control Structures', 'keyword.control', color25, bold
  item 'HTML: DocInfo XML', 'meta.tag.preprocessor.xml', color26
  item 'HTML: DocType', 'meta.tag.sgml.doctype', color27
  item 'HTML: DocInfo DTD', 'string.quoted.docinfo.doctype.DTD', italic
  item 'HTML: ServerSide Includes', <<-SCOPE, color28
    comment.other.server-side-include.xhtml, comment.other.server-side-include.html
  SCOPE
  item 'HTML: Tag', <<-SCOPE, color21
    text.html declaration.tag, text.html meta.tag, text.html entity.name.tag.xhtml
  SCOPE
  item 'HTML: attribute=""', 'keyword.markup.attribute-name', color22
  item 'PHP: PHPdocs', 'keyword.other.phpdoc.php', color29
  item 'PHP: Include() & Require()', 'keyword.other.include.php', color23
  item 'PHP: Constants Core Predefined', 'support.constant.core.php', color30, bold
  item 'PHP: Constants Standard Predefined', 'support.constant.std.php', color31, bold
  item 'PHP: Variables Globals', 'variable.other.global.php', color32
  item 'PHP: Variables Safer Globals', 'variable.other.global.safer.php', lime
  item 'PHP: Strings Single-Quoted', 'string.quoted.single.php', color34
  item 'PHP: Keywords Storage', 'keyword.storage.php', color25
  item 'PHP: Strings Double-Quoted', 'string.quoted.double.php', color7
  item 'CSS: Selectors #ID', 'entity.other.attribute-name.id.css', color35
  item 'CSS: Selectors <Elements>', 'entity.name.tag.css', color36, bold
  item 'CSS: Selectors .ClassName', 'entity.other.attribute-name.class.css', color37
  item 'CSS: Selectors :PseudoClass', 'entity.other.attribute-name.pseudo-class.css', color38
  item 'CSS: Invalid Comma', 'invalid.bad-comma.css', white, back: red
  item 'CSS: Property Value', 'support.constant.property-value.css', color39
  item 'CSS: Property Keyword', 'support.type.property-name.css', color40
  item 'CSS: Property Colours', 'constant.other.rgb-value.css', color41
  item 'CSS: Font Names', 'support.constant.font-name.css', color41
  item 'TMLangDef: Keys', <<-SCOPE, color42
    support.constant.tm-language-def, support.constant.name.tm-language-def
  SCOPE
  item 'CSS: Units', 'keyword.other.unit.css', color25

end
