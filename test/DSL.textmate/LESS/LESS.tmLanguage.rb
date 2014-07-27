# encoding: utf-8

language 'LESS' => 'source.css.less' do
  # LeSS
  file_types %w(less)
  folding_start_marker %r'/\*\*(?!\*)|\{\s*($|/\*(?!.*?\*/.*\S))'
  folding_stop_marker %r'(?<!\*)\*\*/|^\s*\}'
  key_equivalent "^~L"  # TextMate only
  uuid "9343D324-75A1-4733-A5C0-5D1D4B6182D0"  # TextMate only

  rule 'keyword.control.html.elements' do
    match %r/\b(a|abbr|acronym|address|applet|article|area|audio|video|b|base|big|blockquote|body|br|button|caption|canvas|center|cite|code|col|colgroup|dd|del|details|dfn|div|dl|dt|em|embed|fieldset|figure|figcaption|form|frame|frameset|(h[1-6])|head|hr|html|i|iframe|img|input|ins|kbd|label|legend|li|link|map|mark|meta|menu|nav|noframes|noscript|object|ol|optgroup|option|output|p|param|pre|q|ruby|s|samp|script|select|small|span|strike|strong|style|sub|sup|summary|svg|table|tbody|td|textarea|tfoot|th|thead|title|tr|tt|u|ul|var|header|section|footer|aside|hgroup|time)\b/
  end
  rule 'string.quoted.double.css' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.css'
    to %r/"/,
      0 => 'punctuation.definition.string.end.css'
    rule 'constant.character.escaped.css' do
      match %r/\\./
    end
  end
  rule 'string.quoted.single.css' do
    from %r/'/,
      0 => 'punctuation.definition.string.begin.css'
    to %r/'/,
      0 => 'punctuation.definition.string.end.css'
    rule 'constant.character.escaped.css' do
      match %r/\\./
    end
  end
  rule do
    match %r/(\.[a-zA-Z0-9_-]+)/,
      1 => 'entity.other.attribute-name.class.css'
  end
  rule 'support.function.any-method.builtin.css' do
    content_scope "variable.parameter.url"
    from %r/url\(/
    to %r/\)/
  end
  rule 'constant.other.rgb-value.css' do
    match %r/(#)([0-9a-fA-F]{3}|[0-9a-fA-F]{6})\b/
  end
  rule 'meta.selector.css' do
    match %r/#[a-zA-Z0-9_:\(\)-]+/,
      0 => 'entity.other.attribute-name.id'
  end
  rule 'comment.block.css' do
    from %r'/\*',
      0 => 'punctuation.definition.comment.begin.css'
    to %r'\*/',
      0 => 'punctuation.definition.comment.end.css'
  end
  rule 'constant.numeric.css' do
    match %r/(-|\+)?\s*[0-9]+(\.[0-9]+)?/
  end
  rule 'keyword.other.unit.css' do
    match %r/(?<=[\d])(px|pt|cm|mm|in|em|ex|pc)\b|%/
  end
  rule do
    match %r/(:+(after|before|not|last-child|nth-of-type|nth-child|first-child|first-letter|first-line|selection|root))/,
      1 => 'entity.other.attribute-name.pseudo-element.css'
  end
  rule do
    match %r/(:+(active|hover|link|visited|focus))/,
      1 => 'entity.other.attribute-name.pseudo-class.css'
  end
  rule 'meta.attribute-selector.css' do
    match %r/(?i)(\[)\s*(-?[_a-z\\[[:^ascii:]]][_a-z0-9\-\\[[:^ascii:]]]*)(?:\s*([~|^$*]?=)\s*(?:(-?[_a-z\\[[:^ascii:]]][_a-z0-9\-\\[[:^ascii:]]]*)|((?>(['"])(?:[^\\]|\\.)*?(\6)))))?\s*(\])/,
      1 => 'punctuation.definition.entity.css',
      2 => 'entity.other.attribute-name.attribute.css',
      3 => 'punctuation.separator.operator.css',
      4 => 'string.unquoted.attribute-value.css',
      5 => 'string.quoted.double.attribute-value.css',
      6 => 'punctuation.definition.string.begin.css',
      7 => 'punctuation.definition.string.end.css'
  end
  rule 'meta.at-rule.import.css' do
    match %r/^\s*((@)import\b)/,
      1 => 'keyword.control.at-rule.import.css',
      2 => 'punctuation.definition.keyword.css'
  end
  rule do
    match %r/(-(?:webkit|moz|khtml|o|icab|ms)-(?:background-size|border-radius|box-shadow|opacity|border-image))\s*:/,
      1 => 'support.type.property-name.css.vendor'
  end
  rule do
    match %r/\b(azimuth|background-attachment|background-color|background-clip|background-image|background-position|background-repeat|background-size|background|behavior|border-bottom-color|border-bottom-style|border-bottom-width|border-bottom|border-collapse|border-color|border-left-color|border-left-style|border-left-width|border-left|border-right-color|border-right-style|border-right-width|border-right|border-spacing|border-style|border-top-color|border-top-style|border-top-width|border-top|border-width|border-radius|border|box-shadow|bottom|caption-side|clear|clip|color|content|counter-increment|counter-reset|cue-after|cue-before|cue|cursor|direction|display|elevation|empty-cells|filter|float|font-family|font-size-adjust|font-size|font-stretch|font-style|font-variant|font-weight|font|height|left|letter-spacing|line-height|list-style-image|list-style-position|list-style-type|list-style|margin-bottom|margin-left|margin-right|margin-top|marker-offset|margin|marks|max-height|max-width|min-height|min-width|opacity|orphans|outline-color|outline-style|outline-width|outline|overflow(-[xy])?|padding-bottom|padding-left|padding-right|padding-top|padding|page-break-after|page-break-before|page-break-inside|page|pause-after|pause-before|pause|pitch-range|pitch|play-during|position|pre-wrap|quotes|richness|right|size|speak-header|speak-numeral|speak-punctuation|speech-rate|speak|stress|table-layout|text-align|text-decoration|text-indent|text-shadow|text-transform|top|unicode-bidi|vertical-align|visibility|voice-family|volume|white-space|widows|width|word-spacing|word-wrap|z-index|zoom)/,
      1 => 'support.type.property-name.css'
  end
  rule 'support.constant.property-value.css' do
    match %r/\b(absolute|all-scroll|always|auto|baseline|below|bidi-override|block|bold|bolder|both|bottom|break-all|break-word|capitalize|center|char|circle|col-resize|collapse|crosshair|dashed|decimal|default|disabled|disc|distribute-all-lines|distribute-letter|distribute-space|distribute|dotted|double|e-resize|ellipsis|fixed|groove|hand|help|hidden|horizontal|ideograph-alpha|ideograph-numeric|ideograph-parenthesis|ideograph-space|inactive|inherit|inline-block|inline|inset|inside|inter-ideograph|inter-word|italic|justify|keep-all|left|lighter|line-edge|line-through|line|linear|list-item|loose|lower-alpha|lower-roman|lowercase|lr-tb|ltr|medium|middle|move|n-resize|ne-resize|newspaper|no-drop|no-repeat|nw-resize|none|normal|not-allowed|nowrap|oblique|outset|outside|overline|pointer|progress|relative|repeat-x|repeat-y|repeat|right|ridge|row-resize|rtl|s-resize|scroll|se-resize|separate|small-caps|solid|square|static|strict|super|sw-resize|table-footer-group|table-header-group|tb-rl|text-bottom|text-top|text|thick|thin|top|transparent|underline|upper-alpha|upper-roman|uppercase|vertical-ideographic|vertical-text|visible|w-resize|wait|whitespace|padding-box)\b/
  end
  rule 'support.constant.font-name.css' do
    match %r/(\b(?i:arial|century|comic|courier|garamond|georgia|helvetica|impact|lucida|symbol|system|tahoma|times|trebuchet|utopia|verdana|webdings|sans-serif|serif|monospace)\b)/
  end
  rule 'support.constant.color.w3c-standard-color-name.css' do
    # http://www.w3.org/TR/CSS21/syndata.html#value-def-color
    match %r/\b(aqua|black|blue|fuchsia|gray|green|lime|maroon|navy|olive|orange|purple|red|silver|teal|white|yellow)\b/
  end
  rule 'support.function.any-method.builtin.less' do
    match %r/\b(saturate|desaturate|lighten|darken|grayscale)\b/
  end
  rule 'support.function.any-method.builtin.css' do
    match %r/\b(rgb|rgba|hsl|hsla|url)\b/
  end
  rule do
    match %r/(-(?:webkit|moz|khtml|o|icab)-(?:gradient|linear-gradient))/,
      1 => 'support.function.any-method.vendor.css'
  end
  rule 'support.function.any-method.webkit.gradient.css' do
    match %r/\b(color-stop|from|to)\b/
  end
  rule do
    match %r/(\.[a-zA-Z0-9_-]+)\s*(;|\()/,
      1 => 'support.function.less'
  end
  rule do
    from %r'(^[ \t]+)?(?=//)',
      1 => 'punctuation.whitespace.comment.leading.less'
    to %r/(?!\G)/
    rule 'comment.line.double-slash.less' do
      from %r'//',
        0 => 'punctuation.definition.comment.less'
      to %r/\n/
    end
  end
  rule 'variable.other.less' do
    match %r/@[a-zA-Z0-9_-][\w-]*/
  end
  rule 'keyword.operator.less' do
    match %r'\$|%|&|\*|\-\-|\-|\+\+|\+|~|===|==|=|!=|!==|<=|>=|<<=|>>=|>>>=|<>|<|>|!|&&|\|\||\?\:|\*=|(?<!\()/=|%=|\+=|\-=|&=|\^=|\/\b'
  end
  rule 'meta.brace.curly.less' do
    # Match empty braces to give proper ↩ action
    match %r/(\{)(\})/,
      1 => 'punctuation.section.property-list.begin.css',
      2 => 'punctuation.section.property-list.end.css'
  end
  rule 'meta.brace.curly.less' do
    match %r/\{|\}/
  end
  rule 'meta.brace.round.less' do
    match %r/\(|\)/
  end
  rule 'meta.brace.square.less' do
    match %r/\[|\]/
  end
end
