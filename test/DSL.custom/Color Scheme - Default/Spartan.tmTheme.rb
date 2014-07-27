theme 'Spartan' do

  # I dont't like code looking like a Christmas tree.
  # The template was Mac Classic by Chris Thomas.

  author 'Thierry Lambert'
  uuid '85C02434-2B86-488A-A8F2-E7A9A53385C5'

  white = '#FFFFFF'
  black = '#000000'
  brown = '#804000'
  navy  = '#0000A0'  # a bit brighter than 'official' navy
  blue  = '#0000FF'
  red   = '#FF0000'
  green = '#008000'

  gray = '#666666'
  light_gray = '#888888'
  pale_gray = '#BFBFBF'
  blue_gray = '#365F91'

  very_transparent_gray = '#D0D0D040'
  more_transparent_gray = '#80808020'
  transparent_gray      = '#80808030'
  less_transparent_gray = '#80808050'

  turquoise_green = '#009070'

  pale_red = '#FFD0D0'

  base_colors \
    background: white,
    foreground: black,
    caret: black,
    invisibles: pale_gray,
    line_highlight: transparent_gray,
    selection: transparent_gray,
    selection_border: less_transparent_gray,
    inactive_selection: more_transparent_gray

  item 'Marks', 'mark, bookmark', red

  item 'Comment', 'comment', green

  item 'String', 'string', brown
  item 'Unquoted String', 'string.unquoted', back: very_transparent_gray
  # item 'Regular Expression', 'string.regexp', brown
  item 'Ruby Symbol', 'constant.other.symbol', brown
  item 'Number', 'constant.numeric', brown
  item 'Character Escape', 'constant.character.escape', brown, bold
  item 'Markup: Character Entity', 'constant.character.entity, constant.character.parameter-entity', brown

  item 'Keyword', 'keyword.control, keyword.other, storage', blue
  item 'Language Constant', 'constant.language', blue
  item 'Language Variable', 'variable.language', blue

  item 'Library Constant', 'support.constant', navy
  item 'Operator', 'keyword.operator', navy
  item 'Other Keyword: Unit', 'keyword.other.unit, keyword.other.ini', navy

  item 'Source in String', 'string source', bold
  item 'Embedded Source', 'text source', back: '#D0D0A020' # looks bluish otherwise

  item 'Type Name', 'entity.name.type', bold
  # item 'Inherited Type Name', 'entity.other.inherited-class'
  # item 'Type Reference', 'support.class'

  item 'Function Name', 'entity.name.function, support.function.any-method', bold
  item 'Library Function', 'support.function', navy

  item 'Marked Variable', 'variable.other.readwrite, variable.other.macro', navy
  # item 'Parameter Variable', 'variable.parameter'

  item 'Property Name', 'support.type, support.constant.tm-grammar', navy
  item 'Section Name', 'entity.name.section', bold

  item 'Preprocessor Line', 'meta.preprocessor', turquoise_green
  item 'Preprocessor Directive', 'keyword.control.import', turquoise_green, bold

  item 'Deprecated', 'invalid.deprecated', red
  item 'Deprecated Trailing Whitespace', 'invalid.deprecated.trailing-whitespace', back: pale_red
  item 'Illegal', 'invalid.illegal', red

  # XML, HTML, CSS
  item 'ML DOCTYPE', <<-SCOPE, gray
    meta.tag.sgml.doctype, meta.tag.sgml.doctype entity, meta.tag.sgml.doctype string,
    meta.tag.preprocessor.xml, meta.tag.preprocessor.xml entity, meta.tag.preprocessor.xml string
  SCOPE
  item 'ML Tag Characters', 'meta.tag, declaration.tag', navy
  item 'ML Tag Name', 'entity.name.tag', navy
  item 'ML Attribute Name', 'entity.other.attribute-name', navy
  item 'CSS Selectors', 'source.css entity.name.tag, source.css entity.other.attribute-name', blue

  # Markdown, Textile, etc.
  item 'Markup: Heading Characters', 'markup.heading', bold
  # item 'Markup: List', 'markup.list'
  # item 'Markup: Quote', 'markup.quote'
  item 'Markup: Raw', 'markup.raw', back: very_transparent_gray
  item 'Markup: Bold', 'markup.bold', bold
  item 'Markup: Italic', 'markup.italic', italic
  item 'Markup: Underline', 'markup.underline', underline
  # item 'Markup: Deleted', 'markup.deleted'
  # item 'Markup: Inserted', 'markup.inserted'

  # Subtitles
  item 'Markup: Number', 'markup.number', pale_gray
  item 'Markup: Timing', 'markup.timing', light_gray
  item 'Markup: Timing Arrow', 'markup.punctuation', light_gray

end
