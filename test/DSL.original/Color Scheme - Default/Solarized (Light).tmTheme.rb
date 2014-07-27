# encoding: utf-8

theme 'Solarized (light)', file: 'Solarized (Light)' do

  uuid '38E819D9-AE02-452F-9231-ECC3B204AFD7'

  license <<-TXT

    Permission is hereby granted, free of charge, to any person obtaining a copy of
    this software and associated documentation files (the "Software"), to deal in
    the Software without restriction, including without limitation the rights to
    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
    the Software, and to permit persons to whom the Software is furnished to do so,
    subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

  TXT

  color0  = '#FDF6E3'
  black   = '#000000'
  color2  = '#586E75'
  color3  = '#EAE3C9'
  color4  = '#EEE8D5'
  color5  = '#073642'
  color6  = '#93A1A1'
  color7  = '#2AA198'
  color8  = '#D30102'
  color9  = '#D33682'
  color10 = '#268BD2'
  color11 = '#859900'
  color12 = '#B58900'
  color13 = '#CB4B16'
  color14 = '#269186'
  color15 = '#C60000'
  color16 = '#A57800'
  color17 = '#D01F1E'
  color18 = '#536871'
  color19 = '#5A74CF'
  color20 = '#738A13'
  color21 = '#BD3800'
  color22 = '#899090'
  color23 = '#839496'
  color24 = '#708284'
  color25 = '#819090'
  color26 = '#469186'
  color27 = '#738A05'
  color28 = '#748B00'
  color29 = '#D31E1E'
  color30 = '#BD3613'
  color31 = '#BB3700'
  color32 = '#A57706'
  color33 = '#E0EDDD'
  color34 = '#EAE3CA'
  color35 = '#D3201F'
  color36 = '#BF3904'
  color37 = '#219186'
  color38 = '#B81D1C'
  color39 = '#A57705'
  color40 = '#CD1E1D'
  color41 = '#DC322F'

  base_colors(
    background: color0,
    caret: black,
    foreground: color2,
    invisibles: color3,
    line_highlight: color4,
    selection: color5,
  )

  item 'Comment', 'comment', color6
  item 'String', 'string', color7
  item 'StringNumber', 'string', color2
  item 'Regexp', 'string.regexp', color8
  item 'Number', 'constant.numeric', color9
  item 'Variable', 'variable.language, variable.other', color10
  item 'Keyword', 'keyword', color11
  item 'Storage', 'storage', color5, bold
  item 'Class name', 'entity.name.class, entity.name.type.class', color10
  item 'Function name', 'entity.name.function', color10
  item 'Variable start', 'punctuation.definition.variable', color11
  item 'Embedded code markers', 'punctuation.section.embedded.begin, punctuation.section.embedded.end', color8
  item 'Built-in constant', 'constant.language, meta.preprocessor', color12
  item 'Support.construct', 'support.function.construct, keyword.other.new', color8
  item 'User-defined constant', 'constant.character, constant.other', color13
  item 'Inherited class', 'entity.other.inherited-class'
  item 'Function argument', 'variable.parameter'
  item 'Tag name', 'entity.name.tag', color10, bold
  item 'Tag start/end', <<-SCOPE, color6
    punctuation.definition.tag.html, punctuation.definition.tag.begin,
    punctuation.definition.tag.end
  SCOPE
  item 'Tag attribute', 'entity.other.attribute-name', color6
  item 'Library function', 'support.function', color10
  item 'Continuation', 'punctuation.separator.continuation', color8
  item 'Library constant', 'support.constant'
  item 'Library class/type', 'support.type, support.class', color11
  item 'Library Exception', 'support.type.exception', color13
  item 'Special', 'keyword.other.special-method', color13
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
  item 'CSS .class', 'entity.other.attribute-name.class.css', color10
  item 'CSS :pseudo', <<-SCOPE, color21
    entity.other.attribute-name.pseudo-element.css,
    entity.other.attribute-name.pseudo-class.css
  SCOPE
  item 'CSS: #id', 'entity.other.attribute-name.id.css', color10
  item 'JS: Function Name', 'meta.function.js, entity.name.function.js, support.function.dom.js', color16
  item 'JS: Source', 'text.html.basic source.js.embedded.html', color16
  item 'JS: Function', 'storage.type.function.js', color10
  item 'JS: Numeric Constant', 'constant.numeric.js', color14
  item 'JS: []', 'meta.brace.square.js', color10
  item 'JS: Storage Type', 'storage.type.js', color10
  item '()', <<-SCOPE, color6
    meta.brace.round, punctuation.definition.parameters.begin.js,
    punctuation.definition.parameters.end.js
  SCOPE
  item '{}', 'meta.brace.curly.js', color10
  item 'HTML: Doctype', <<-SCOPE, color22, italic
    entity.name.tag.doctype.html, meta.tag.sgml.html,
    string.quoted.double.doctype.identifiers-and-DTDs.html
  SCOPE
  item 'HTML: Comment Block', 'comment.block.html', color23, italic
  item 'HTML: Script', 'entity.name.tag.script.html', italic
  item 'HTML: Style', 'source.css.embedded.html string.quoted.double.html', color14
  item 'HTML: Text', 'text.html.ruby', color21, bold
  item 'HTML: =', <<-SCOPE, color24
    text.html.basic meta.tag.other.html, text.html.basic meta.tag.any.html,
    text.html.basic meta.tag.block.any, text.html.basic meta.tag.inline.any,
    text.html.basic meta.tag.structure.any.html, text.html.basic
    source.js.embedded.html, punctuation.separator.key-value.html
  SCOPE
  item 'HTML: something=', 'text.html.basic entity.other.attribute-name.html', color24
  item 'HTML: "', <<-SCOPE, color14
    text.html.basic meta.tag.structure.any.html
    punctuation.definition.string.begin.html,
    punctuation.definition.string.begin.html, punctuation.definition.string.end.html
  SCOPE
  item 'HTML: <tag>', 'entity.name.tag.block.any.html', color10, bold
  item 'HTML: style', 'source.css.embedded.html entity.name.tag.style.html', italic
  item 'HTML: <style>', 'entity.name.tag.style.html'
  item 'HTML: {}', 'text.html.basic punctuation.section.property-list.css'
  item 'HTML: Embeddable', 'source.css.embedded.html, comment.block.html', color25, italic
  item 'Ruby: Variable definition', 'punctuation.definition.variable.ruby', color10
  item 'Ruby: Function Name', 'meta.function.method.with-arguments.ruby', color24
  item 'Ruby: Variable', 'variable.language.ruby', color26
  item 'Ruby: Function', 'entity.name.function.ruby', color10
  item 'Ruby: Keyword Control', 'keyword.control.ruby, keyword.control.def.ruby', color27, bold
  item 'Ruby: Class', 'keyword.control.class.ruby, meta.class.ruby', color28
  item 'Ruby: Class Name', 'entity.name.type.class.ruby', color16
  item 'Ruby: Keyword', 'keyword.control.ruby', color28
  item 'Ruby: Support Class', 'support.class.ruby', color16
  # FIXME: duplicate name:
  item 'Ruby: Special Method', 'keyword.other.special-method.ruby', color28
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
  item 'Ruby: erb =', 'text.html.ruby meta.tag.inline.any.html', color25
  item 'Ruby: erb ""', <<-SCOPE, color14
    text.html.ruby punctuation.definition.string.begin, text.html.ruby
    punctuation.definition.string.end
  SCOPE
  item 'PHP: Quoted Single', 'punctuation.definition.string.begin, punctuation.definition.string.end', color23
  item 'PHP: []', 'keyword.operator.index-start.php, keyword.operator.index-end.php', color29
  item 'PHP: Array', 'meta.array.php', color18
  item 'PHP: Array()', <<-SCOPE, color16
    meta.array.php support.function.construct.php, meta.array.empty.php
    support.function.construct.php
  SCOPE
  item 'PHP: Array Construct', 'support.function.construct.php', color16
  item 'PHP: Array Begin', 'punctuation.definition.array.begin, punctuation.definition.array.end', color29
  item 'PHP: Numeric Constant', 'constant.numeric.php', color14
  item 'PHP: New', 'keyword.other.new.php', color13
  item 'PHP: ::', 'support.class.php, keyword.operator.class', color18
  item 'PHP: Other Property', 'variable.other.property.php', color22
  item 'PHP: Class', <<-SCOPE, color16
    storage.modifier.extends.php, storage.type.class.php, keyword.operator.class.php
  SCOPE
  # FIXME: no scope:
  item 'PHP: Class Function', ''
  item 'PHP: Inherited Class', 'meta.other.inherited-class.php', color18
  item 'PHP: Storage Type', 'storage.type.php', color28
  item 'PHP: Function', 'entity.name.function.php', color22
  item 'PHP: Function Construct', 'support.function.construct.php', color28
  item 'PHP: Function Call', <<-SCOPE, color23
    entity.name.type.class.php, meta.function-call.php,
    meta.function-call.static.php, meta.function-call.object.php
  SCOPE
  item 'PHP: Comment', 'keyword.other.phpdoc', color22
  item 'PHP: Source Emebedded', 'source.php.embedded.block.html', color30
  item 'PHP: Storage Type Function', 'storage.type.function.php', color21
  item 'C: constant', 'constant.numeric.c', color14
  item 'C: Meta Preprocessor', 'meta.preprocessor.c.include, meta.preprocessor.macro.c', color31
  item 'C: Keyword', 'keyword.control.import.define.c, keyword.control.import.include.c', color31
  item 'C: Function Preprocessor', 'entity.name.function.preprocessor.c', color31
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
  item 'diff: header', 'meta.diff, meta.diff.header', color33, italic, back: color32
  item 'diff: deleted', 'markup.deleted', color35, back: color34
  item 'diff: changed', 'markup.changed', color36, back: color34
  item 'diff: inserted', 'markup.inserted', color37, back: color34
  item 'Markdown: Linebreak', 'text.html.markdown meta.dummy.line-break', color33, back: color32
  item 'Markdown: Raw', 'text.html.markdown markup.raw.inline', color14
  item 'reST raw', 'text.restructuredtext markup.raw', color14
  item 'Other: Removal', 'other.package.exclude, other.remove', color35
  item 'Other: Add', 'other.add', color14
  item 'Tex: {}', <<-SCOPE, color38
    punctuation.section.group.tex , punctuation.definition.arguments.begin.latex,
    punctuation.definition.arguments.end.latex,
    punctuation.definition.arguments.latex
  SCOPE
  item 'Tex: {text}', 'meta.group.braces.tex', color39
  item 'Tex: Other Math', 'string.other.math.tex', color39
  item 'Tex: {var}', 'variable.parameter.function.latex', color21
  item 'Tex: Math \\\\', 'punctuation.definition.constant.math.tex', color17
  item 'Tex: Constant Math', <<-SCOPE, color14
    text.tex.latex constant.other.math.tex, constant.other.general.math.tex,
    constant.other.general.math.tex, constant.character.math.tex
  SCOPE
  item 'Tex: Other Math String', 'string.other.math.tex', color16
  item 'Tex: $', <<-SCOPE, color35
    punctuation.definition.string.begin.tex, punctuation.definition.string.end.tex
  SCOPE
  item 'Tex: \label', <<-SCOPE, color14
    keyword.control.label.latex, text.tex.latex constant.other.general.math.tex
  SCOPE
  item 'Tex: \label { }', 'variable.parameter.definition.label.latex', color17
  item 'Tex: Function ', 'support.function.be.latex', color28
  item 'Tex: Support Function Section', 'support.function.section.latex', color21
  item 'Tex: Support Function', 'support.function.general.tex', color14
  item 'Tex: Comment', 'punctuation.definition.comment.tex, comment.line.percentage.tex', italic
  item 'Tex: Reference Label', 'keyword.control.ref.latex', color14
  item 'Python: storage', <<-SCOPE, color28
    storage.type.class.python, storage.type.function.python,
    storage.modifier.global.python
  SCOPE
  item 'Python: import', 'keyword.control.import.python, keyword.control.import.from.python', color21
  item 'Python: Support.exception', 'support.type.exception.python', color16
  item 'Shell: builtin', 'support.function.builtin.shell', color28
  item 'Shell: variable', 'variable.other.normal.shell', color21
  item 'Shell: DOT_FILES', 'source.shell', color10
  item 'Shell: meta scope in loop', 'meta.scope.for-in-loop.shell, variable.other.loop.shell', color18
  item 'Shell: ""', <<-SCOPE, color28
    punctuation.definition.string.end.shell,
    punctuation.definition.string.begin.shell
  SCOPE
  item 'Shell: Meta Block', 'meta.scope.case-block.shell, meta.scope.case-body.shell', color18
  item 'Shell: []', 'punctuation.definition.logical-expression.shell', color40
  item 'Shell: Comment', 'comment.line.number-sign.shell', italic
  item 'Java: import', 'keyword.other.import.java', color21
  item 'Java: meta-import', 'storage.modifier.import.java', color2
  item 'Java: Class', 'meta.class.java storage.modifier.java', color16
  item 'Java: /* comment */', 'source.java comment.block', color18
  item 'Java: /* @param */', <<-SCOPE, color18
    comment.block meta.documentation.tag.param.javadoc
    keyword.other.documentation.param.javadoc
  SCOPE
  item 'Perl: variables', <<-SCOPE, color12
    punctuation.definition.variable.perl, variable.other.readwrite.global.perl,
    variable.other.predefined.perl, keyword.operator.comparison.perl
  SCOPE
  item 'Perl: functions', 'support.function.perl', color11
  item 'Perl: comments', 'comment.line.number-sign.perl', color2, italic
  item 'Perl: quotes', <<-SCOPE, color7
    punctuation.definition.string.begin.perl, punctuation.definition.string.end.perl
  SCOPE
  item 'Perl: \char', 'constant.character.escape.perl', color41

end
