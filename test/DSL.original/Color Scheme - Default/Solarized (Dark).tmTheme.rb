# encoding: utf-8

theme 'Solarized (dark)', file: 'Solarized (Dark)' do

  uuid 'A4299D9B-1DE5-4BC4-87F6-A757E71B1597'

  color0  = '#042029'
  color1  = '#819090'
  color2  = '#839496'
  color3  = '#0A2933'
  color4  = '#586E75'
  color5  = '#2AA198'
  color6  = '#D30102'
  color7  = '#D33682'
  color8  = '#268BD2'
  color9  = '#859900'
  color10 = '#738A05'
  color11 = '#B58900'
  color12 = '#CB4B16'
  color13 = '#93A1A1'
  color14 = '#269186'
  color15 = '#C60000'
  color16 = '#A57800'
  color17 = '#D01F1E'
  color18 = '#536871'
  color19 = '#5A74CF'
  color20 = '#738A13'
  color21 = '#BD3800'
  color22 = '#899090'
  color23 = '#708284'
  color24 = '#469186'
  color25 = '#748B00'
  color26 = '#D31E1E'
  color27 = '#BD3613'
  color28 = '#BB3700'
  color29 = '#A57706'
  color30 = '#E0EDDD'
  color31 = '#EAE3CA'
  color32 = '#D3201F'
  color33 = '#BF3904'
  color34 = '#219186'
  color35 = '#B81D1C'
  color36 = '#A57705'
  color37 = '#CD1E1D'
  color38 = '#DC322F'

  base_colors(
    background: color0,
    caret: color1,
    foreground: color2,
    invisibles: color3,
    line_highlight: color3,
    selection: color3,
  )

  item 'Comment', 'comment', color4
  item 'String', 'string', color5
  item 'StringNumber', 'string', color4
  item 'Regexp', 'string.regexp', color6
  item 'Number', 'constant.numeric', color7
  item 'Variable', 'variable.language, variable.other', color8
  item 'Keyword', 'keyword', color9
  item 'Storage', 'storage', color10
  item 'Class name', 'entity.name.class, entity.name.type.class', color8
  item 'Function name', 'entity.name.function', color8
  item 'Variable start', 'punctuation.definition.variable', color9
  item 'Embedded code markers', 'punctuation.section.embedded.begin, punctuation.section.embedded.end', color6
  item 'Built-in constant', 'constant.language, meta.preprocessor', color11
  item 'Support.construct', 'support.function.construct, keyword.other.new', color6
  item 'User-defined constant', 'constant.character, constant.other', color12
  item 'Inherited class', 'entity.other.inherited-class'
  item 'Function argument', 'variable.parameter'
  item 'Tag name', 'entity.name.tag', color8, bold
  item 'Tag start/end', <<-SCOPE, color4
    punctuation.definition.tag.html, punctuation.definition.tag.begin,
    punctuation.definition.tag.end
  SCOPE
  item 'Tag attribute', 'entity.other.attribute-name', color13
  item 'Library function', 'support.function', color8
  item 'Continuation', 'punctuation.separator.continuation', color6
  item 'Library constant', 'support.constant'
  item 'Library class/type', 'support.type, support.class', color9
  item 'Library Exception', 'support.type.exception', color12
  item 'Special', 'keyword.other.special-method', color12
  item 'Library variable', 'support.other.variable'
  item 'Invalid', 'invalid'
  item 'Quoted String', 'string.quoted.double, string.quoted.single', color14
  item 'Quotes', 'punctuation.definition.string.begin, punctuation.definition.string.end', color15
  item 'CSS: Property', <<-SCOPE, color16
    entity.name.tag.css, support.type.property-name.css, meta.property-name.css
  SCOPE
  item 'CSS: @font-face', 'source.css', color17
  item 'CSS: Selector', 'meta.selector.css', color18
  item 'CSS: {}', 'punctuation.section.property-list.css', color19
  item 'CSS: Numeric Value', <<-SCOPE, color14
    meta.property-value.css constant.numeric.css,
    keyword.other.unit.css,constant.other.color.rgb-value.css
  SCOPE
  item 'CSS: Value', 'meta.property-value.css', color14
  item 'CSS: !Important', 'keyword.other.important.css', color17
  item 'CSS: Standard Value', 'support.constant.color', color14
  item 'CSS: Tag', 'entity.name.tag.css', color20
  item 'CSS: : ,', 'punctuation.separator.key-value.css, punctuation.terminator.rule.css', color18
  item 'CSS .class', 'entity.other.attribute-name.class.css', color8
  item 'CSS :pseudo', <<-SCOPE, color21
    entity.other.attribute-name.pseudo-element.css,
    entity.other.attribute-name.pseudo-class.css
  SCOPE
  item 'CSS: #id', 'entity.other.attribute-name.id.css', color8
  item 'JS: Function Name', 'meta.function.js, entity.name.function.js, support.function.dom.js', color16
  item 'JS: Source', 'text.html.basic source.js.embedded.html', color16
  item 'JS: Function', 'storage.type.function.js', color8
  item 'JS: Numeric Constant', 'constant.numeric.js', color14
  item 'JS: []', 'meta.brace.square.js', color8
  item 'JS: Storage Type', 'storage.type.js', color8
  item '()', <<-SCOPE, color13
    meta.brace.round, punctuation.definition.parameters.begin.js,
    punctuation.definition.parameters.end.js
  SCOPE
  item '{}', 'meta.brace.curly.js', color8
  item 'HTML: Doctype', <<-SCOPE, color22, italic
    entity.name.tag.doctype.html, meta.tag.sgml.html,
    string.quoted.double.doctype.identifiers-and-DTDs.html
  SCOPE
  item 'HTML: Comment Block', 'comment.block.html', color2, italic
  item 'HTML: Script', 'entity.name.tag.script.html', italic
  item 'HTML: Style', 'source.css.embedded.html string.quoted.double.html', color14
  item 'HTML: Text', 'text.html.ruby', color21, bold
  item 'HTML: =', <<-SCOPE, color23
    text.html.basic meta.tag.other.html, text.html.basic meta.tag.any.html,
    text.html.basic meta.tag.block.any, text.html.basic meta.tag.inline.any,
    text.html.basic meta.tag.structure.any.html, text.html.basic
    source.js.embedded.html, punctuation.separator.key-value.html
  SCOPE
  item 'HTML: something=', 'text.html.basic entity.other.attribute-name.html', color23
  item 'HTML: "', <<-SCOPE, color14
    text.html.basic meta.tag.structure.any.html
    punctuation.definition.string.begin.html,
    punctuation.definition.string.begin.html, punctuation.definition.string.end.html
  SCOPE
  item 'HTML: <tag>', 'entity.name.tag.block.any.html', color8, bold
  item 'HTML: style', 'source.css.embedded.html entity.name.tag.style.html', italic
  item 'HTML: <style>', 'entity.name.tag.style.html'
  item 'HTML: {}', 'text.html.basic punctuation.section.property-list.css'
  item 'HTML: Embeddable', 'source.css.embedded.html, comment.block.html', color1, italic
  item 'Ruby: Variable definition', 'punctuation.definition.variable.ruby', color8
  item 'Ruby: Function Name', 'meta.function.method.with-arguments.ruby', color23
  item 'Ruby: Variable', 'variable.language.ruby', color24
  item 'Ruby: Function', 'entity.name.function.ruby', color8
  item 'Ruby: Keyword Control', 'keyword.control.ruby, keyword.control.def.ruby', color10, bold
  item 'Ruby: Class', 'keyword.control.class.ruby, meta.class.ruby', color25
  item 'Ruby: Class Name', 'entity.name.type.class.ruby', color16
  item 'Ruby: Keyword', 'keyword.control.ruby', color25
  item 'Ruby: Support Class', 'support.class.ruby', color16
  # FIXME: duplicate name:
  item 'Ruby: Special Method', 'keyword.other.special-method.ruby', color25
  item 'Ruby: Constant', 'constant.language.ruby, constant.numeric.ruby', color14
  item 'Ruby: Constant Other', 'variable.other.constant.ruby', color16
  item 'Ruby: :symbol', 'constant.other.symbol.ruby', color14
  item "Ruby: Punctuation Section ''", <<-SCOPE, color17
    punctuation.section.embedded.ruby, punctuation.definition.string.begin.ruby,
    punctuation.definition.string.end.ruby
  SCOPE
  # FIXME: duplicate name:
  item 'Ruby: Special Method', 'keyword.other.special-method.ruby', color21
  item 'PHP: Include', 'keyword.control.import.include.php', color21
  item 'Ruby: erb =', 'text.html.ruby meta.tag.inline.any.html', color1
  item 'Ruby: erb ""', <<-SCOPE, color14
    text.html.ruby punctuation.definition.string.begin, text.html.ruby
    punctuation.definition.string.end
  SCOPE
  item 'PHP: Quoted Single', 'punctuation.definition.string.begin, punctuation.definition.string.end', color2
  item 'PHP: Class Names', 'support.class.php', color2
  item 'PHP: []', 'keyword.operator.index-start.php, keyword.operator.index-end.php', color26
  item 'PHP: Array', 'meta.array.php', color18
  item 'PHP: Array()', <<-SCOPE, color16
    meta.array.php support.function.construct.php, meta.array.empty.php
    support.function.construct.php
  SCOPE
  item 'PHP: Array Construct', 'support.function.construct.php', color16
  item 'PHP: Array Begin', 'punctuation.definition.array.begin, punctuation.definition.array.end', color26
  item 'PHP: Numeric Constant', 'constant.numeric.php', color14
  item 'PHP: New', 'keyword.other.new.php', color12
  item 'PHP: ::', 'keyword.operator.class', color2
  item 'PHP: Other Property', 'variable.other.property.php', color22
  item 'PHP: Class', <<-SCOPE, color16
    storage.modifier.extends.php, storage.type.class.php, keyword.operator.class.php
  SCOPE
  # FIXME: no scope:
  item 'PHP: Class Function', ''
  item 'PHP: Semicolon', 'punctuation.terminator.expression.php', color2
  item 'PHP: Inherited Class', 'meta.other.inherited-class.php', color18
  item 'PHP: Storage Type', 'storage.type.php', color25
  item 'PHP: Function', 'entity.name.function.php', color22
  item 'PHP: Function Construct', 'support.function.construct.php', color25
  item 'PHP: Function Call', <<-SCOPE, color2
    entity.name.type.class.php, meta.function-call.php,
    meta.function-call.static.php, meta.function-call.object.php
  SCOPE
  item 'PHP: Comment', 'keyword.other.phpdoc', color22
  item 'PHP: Source Emebedded', 'source.php.embedded.block.html', color27
  item 'PHP: Storage Type Function', 'storage.type.function.php', color21
  item 'C: constant', 'constant.numeric.c', color14
  item 'C: Meta Preprocessor', 'meta.preprocessor.c.include, meta.preprocessor.macro.c', color28
  item 'C: Keyword', 'keyword.control.import.define.c, keyword.control.import.include.c', color28
  item 'C: Function Preprocessor', 'entity.name.function.preprocessor.c', color28
  item 'C: include <something.c>', <<-SCOPE, color14
    meta.preprocessor.c.include string.quoted.other.lt-gt.include.c,
    meta.preprocessor.c.include punctuation.definition.string.begin.c,
    meta.preprocessor.c.include punctuation.definition.string.end.c
  SCOPE
  item 'C: Function', <<-SCOPE, color18
    support.function.C99.c, support.function.any-method.c, entity.name.function.c
  SCOPE
  item 'C: "', <<-SCOPE, color14
    punctuation.definition.string.begin.c, punctuation.definition.string.end.c
  SCOPE
  item 'C: Storage Type', 'storage.type.c', color16
  item 'diff: header', 'meta.diff, meta.diff.header', color30, italic, back: color29
  item 'diff: deleted', 'markup.deleted', color32, back: color31
  item 'diff: changed', 'markup.changed', color33, back: color31
  item 'diff: inserted', 'markup.inserted', color34, back: color31
  item 'Markdown: Linebreak', 'text.html.markdown meta.dummy.line-break', color30, back: color29
  item 'Markdown: Raw', 'text.html.markdown markup.raw.inline', color14
  item 'reST raw', 'text.restructuredtext markup.raw', color14
  item 'Other: Removal', 'other.package.exclude, other.remove', color32
  item 'Other: Add', 'other.add', color14
  item 'Tex: {}', <<-SCOPE, color35
    punctuation.section.group.tex , punctuation.definition.arguments.begin.latex,
    punctuation.definition.arguments.end.latex,
    punctuation.definition.arguments.latex
  SCOPE
  item 'Tex: {text}', 'meta.group.braces.tex', color36
  item 'Tex: Other Math', 'string.other.math.tex', color36
  item 'Tex: {var}', 'variable.parameter.function.latex', color21
  item 'Tex: Math \\\\', 'punctuation.definition.constant.math.tex', color17
  item 'Tex: Constant Math', <<-SCOPE, color14
    text.tex.latex constant.other.math.tex, constant.other.general.math.tex,
    constant.other.general.math.tex, constant.character.math.tex
  SCOPE
  item 'Tex: Other Math String', 'string.other.math.tex', color16
  item 'Tex: $', <<-SCOPE, color32
    punctuation.definition.string.begin.tex, punctuation.definition.string.end.tex
  SCOPE
  item 'Tex: \label', <<-SCOPE, color14
    keyword.control.label.latex, text.tex.latex constant.other.general.math.tex
  SCOPE
  item 'Tex: \label { }', 'variable.parameter.definition.label.latex', color17
  item 'Tex: Function ', 'support.function.be.latex', color25
  item 'Tex: Support Function Section', 'support.function.section.latex', color21
  item 'Tex: Support Function', 'support.function.general.tex', color14
  item 'Tex: Comment', 'punctuation.definition.comment.tex, comment.line.percentage.tex', italic
  item 'Tex: Reference Label', 'keyword.control.ref.latex', color14
  item 'Python: storage', <<-SCOPE, color25
    storage.type.class.python, storage.type.function.python,
    storage.modifier.global.python
  SCOPE
  item 'Python: import', 'keyword.control.import.python, keyword.control.import.from.python', color21
  item 'Python: Support.exception', 'support.type.exception.python', color16
  item 'Shell: builtin', 'support.function.builtin.shell', color25
  item 'Shell: variable', 'variable.other.normal.shell', color21
  item 'Shell: DOT_FILES', 'source.shell', color8
  item 'Shell: meta scope in loop', 'meta.scope.for-in-loop.shell, variable.other.loop.shell', color18
  item 'Shell: ""', <<-SCOPE, color25
    punctuation.definition.string.end.shell,
    punctuation.definition.string.begin.shell
  SCOPE
  item 'Shell: Meta Block', 'meta.scope.case-block.shell, meta.scope.case-body.shell', color18
  item 'Shell: []', 'punctuation.definition.logical-expression.shell', color37
  item 'Shell: Comment', 'comment.line.number-sign.shell', italic
  item 'Java: import', 'keyword.other.import.java', color21
  item 'Java: meta-import', 'storage.modifier.import.java', color4
  item 'Java: Class', 'meta.class.java storage.modifier.java', color16
  item 'Java: /* comment */', 'source.java comment.block', color18
  item 'Java: /* @param */', <<-SCOPE, color18
    comment.block meta.documentation.tag.param.javadoc
    keyword.other.documentation.param.javadoc
  SCOPE
  item 'Perl: variables', <<-SCOPE, color11
    punctuation.definition.variable.perl, variable.other.readwrite.global.perl,
    variable.other.predefined.perl, keyword.operator.comparison.perl
  SCOPE
  item 'Perl: functions', 'support.function.perl', color9
  item 'Perl: comments', 'comment.line.number-sign.perl', color4, italic
  item 'Perl: quotes', <<-SCOPE, color5
    punctuation.definition.string.begin.perl, punctuation.definition.string.end.perl
  SCOPE
  item 'Perl: \char', 'constant.character.escape.perl', color38
  item 'Markdown: List', 'punctuation.definition.list_item.markdown', color8
  item 'Markup: Heading', 'markup.heading', color11
  item 'Markdown: Link', 'meta.link.inline.markdown, string.other.link.title.markdown', color9
  item 'Markdown: Image', 'meta.image.inline.markdown, string.other.link.description.markdown', color9
  item 'Markdown: Heading entity name', 'entity.name.section.markdown', color12
  item 'Markdown: separator', 'meta.separator.markdown', color8, back: color0
  item 'Markdown: code block', 'markup.raw.block.markdown', color11
  item 'Markdown: code inline', 'markup.raw.inline.markdown', color11
  item 'Markdown: punctuation definition', <<-SCOPE, color4
    punctuation.definition.raw.markdown, punctuation.definition.italic.markdown,
    punctuation.definition.bold.markdown,
    punctuation.definition.string.begin.markdown,punctuation.definition.string.end.markdown,punctuation.definition.metadata.markdown
  SCOPE
  item 'Markdown: blockquote punctuation definition', 'punctuation.definition.blockquote.markdown', color5

end
