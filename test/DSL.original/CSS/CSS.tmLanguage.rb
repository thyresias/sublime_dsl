# encoding: utf-8

language 'CSS' => 'source.css' do
  file_types %w(css css.erb)
  folding_start_marker %r'/\*\*(?!\*)|\{\s*($|/\*(?!.*?\*/.*\S))'
  folding_stop_marker %r'(?<!\*)\*\*/|^\s*\}'
  key_equivalent "^~C"  # TextMate only
  uuid "69AA0917-B7BB-11D9-A7E2-000D93C8BE28"  # TextMate only

  include "#comment-block"
  include "#selector"
  rule 'meta.at-rule.charset.css' do
    from %r/\s*((@)charset\b)\s*/
    to %r/\s*((?=;|$))/
    both 1 => 'keyword.control.at-rule.charset.css',
         2 => 'punctuation.definition.keyword.css'
    include "#string-double"
    include "#string-single"
  end
  rule 'meta.at-rule.import.css' do
    from %r/\s*((@)import\b)\s*/
    to %r/\s*((?=;|\}))/
    both 1 => 'keyword.control.at-rule.import.css',
         2 => 'punctuation.definition.keyword.css'
    include "#string-double"
    include "#string-single"
    rule do
      from %r/\s*(url)\s*(\()\s*/,
        1 => 'support.function.url.css',
        2 => 'punctuation.section.function.css'
      to %r/\s*(\))\s*/,
        1 => 'punctuation.section.function.css'
      rule 'variable.parameter.url.css' do
        match %r/[^'") \t]+/
      end
      include "#string-single"
      include "#string-double"
    end
    include "#media-query-list"
  end
  rule 'meta.at-rule.font-face.css' do
    from %r/^\s*((@)font-face)\s*(?=\{)/,
      1 => 'keyword.control.at-rule.font-face.css',
      2 => 'punctuation.definition.keyword.css'
    to %r/\s*(\})/,
      1 => 'punctuation.section.property-list.css'
    include "#rule-list"
  end
  rule do
    from %r/(?=^\s*@media\s*.*?\{)/
    to %r/\s*(\})/,
      1 => 'punctuation.section.property-list.css'
    rule 'meta.at-rule.media.css' do
      from %r/^\s*((@)media)(?=.*?\{)/,
        1 => 'keyword.control.at-rule.media.css',
        2 => 'punctuation.definition.keyword.css',
        3 => 'support.constant.media.css'
      to %r/\s*(?=\{)/
      include "#media-query-list"
    end
    rule do
      from %r/\s*(\{)/,
        1 => 'punctuation.section.property-list.css'
      to %r/(?=\})/
      include "$self"
    end
  end
  rule do
    from %r/(?=\{)/
    to %r/\}/,
      1 => 'punctuation.section.property-list.css'
    include "#rule-list"
  end

  fragment :"color-values" do
    rule 'support.constant.color.w3c-standard-color-name.css' do
      # http://www.w3.org/TR/CSS21/syndata.html#value-def-color
      match %r/\b(aqua|black|blue|fuchsia|gray|green|lime|maroon|navy|olive|orange|purple|red|silver|teal|white|yellow)\b/
    end
    rule 'invalid.deprecated.color.w3c-non-standard-color-name.css' do
      # These colours are mostly recognised but will not validate. ref: http://www.w3schools.com/css/css_colornames.asp
      match %r/\b(aliceblue|antiquewhite|aquamarine|azure|beige|bisque|blanchedalmond|blueviolet|brown|burlywood|cadetblue|chartreuse|chocolate|coral|cornflowerblue|cornsilk|crimson|cyan|darkblue|darkcyan|darkgoldenrod|darkgray|darkgreen|darkgrey|darkkhaki|darkmagenta|darkolivegreen|darkorange|darkorchid|darkred|darksalmon|darkseagreen|darkslateblue|darkslategray|darkslategrey|darkturquoise|darkviolet|deeppink|deepskyblue|dimgray|dimgrey|dodgerblue|firebrick|floralwhite|forestgreen|gainsboro|ghostwhite|gold|goldenrod|greenyellow|grey|honeydew|hotpink|indianred|indigo|ivory|khaki|lavender|lavenderblush|lawngreen|lemonchiffon|lightblue|lightcoral|lightcyan|lightgoldenrodyellow|lightgray|lightgreen|lightgrey|lightpink|lightsalmon|lightseagreen|lightskyblue|lightslategray|lightslategrey|lightsteelblue|lightyellow|limegreen|linen|magenta|mediumaquamarine|mediumblue|mediumorchid|mediumpurple|mediumseagreen|mediumslateblue|mediumspringgreen|mediumturquoise|mediumvioletred|midnightblue|mintcream|mistyrose|moccasin|navajowhite|oldlace|olivedrab|orangered|orchid|palegoldenrod|palegreen|paleturquoise|palevioletred|papayawhip|peachpuff|peru|pink|plum|powderblue|rosybrown|royalblue|saddlebrown|salmon|sandybrown|seagreen|seashell|sienna|skyblue|slateblue|slategray|slategrey|snow|springgreen|steelblue|tan|thistle|tomato|turquoise|violet|wheat|whitesmoke|yellowgreen)\b/
    end
    rule do
      from %r/(hsla?|rgba?)\s*(\()/,
        1 => 'support.function.misc.css',
        2 => 'punctuation.section.function.css'
      to %r/(\))/,
        1 => 'punctuation.section.function.css'
      rule 'constant.other.color.rgb-value.css' do
        match %r/(?x)\b
                  (0*((1?[0-9]{1,2})|(2([0-4][0-9]|5[0-5])))\s*,\s*){2}
                  (0*((1?[0-9]{1,2})|(2([0-4][0-9]|5[0-5])))\b)
                  (\s*,\s*((0?\.[0-9]+)|[0-1]))?
              /
      end
      rule 'constant.other.color.rgb-percentage.css' do
        match %r/\b([0-9]{1,2}|100)\s*%,\s*([0-9]{1,2}|100)\s*%,\s*([0-9]{1,2}|100)\s*%/
      end
      include "#numeric-values"
    end
  end

  fragment :"comment-block" do
    rule 'comment.block.css' do
      from %r'/\*'
      to %r'\*/'
      both 0 => 'punctuation.definition.comment.css'
    end
  end

  fragment :"media-query" do
    rule do
      from %r/(?i)\s*(only|not)?\s*(all|aural|braille|embossed|handheld|print|projection|screen|tty|tv)?/,
        1 => 'keyword.operator.logic.media.css',
        2 => 'support.constant.media.css'
      to %r/\s*(?:(,)|(?=[{;]))/,
        1 => 'punctuation.definition.arbitrary-repitition.css'
      rule do
        from %r/\s*(and)?\s*(\()\s*/,
          1 => 'keyword.operator.logic.media.css'
        to %r/\)/
        rule do
          from %r/(?x)
                              (
                                  ((min|max)-)?
                                  (
                                      ((device-)?(height|width|aspect-ratio))|
                                      (color(-index)?)|monochrome|resolution
                                  )
                              )|grid|scan|orientation
                              \s*(?=[:)])/,
            0 => 'support.type.property-name.media.css'
          to %r/(:)|(?=\))/,
            1 => 'punctuation.separator.key-value.css'
        end
        rule 'support.constant.property-value.css' do
          match %r/\b(portrait|landscape|progressive|interlace)/
        end
        rule do
          match %r'\s*(\d+)(/)(\d+)',
            1 => 'constant.numeric.css',
            2 => 'keyword.operator.arithmetic.css',
            3 => 'constant.numeric.css'
        end
        include "#numeric-values"
      end
    end
  end

  fragment :"media-query-list" do
    rule do
      from %r/\s*(?=[^{;])/
      to %r/\s*(?=[{;])/
      include "#media-query"
    end
  end

  fragment :"numeric-values" do
    rule 'constant.other.color.rgb-value.css' do
      match %r/(#)([0-9a-fA-F]{3}|[0-9a-fA-F]{6})\b/,
        1 => 'punctuation.definition.constant.css'
    end
    rule 'constant.numeric.css' do
      match %r/(?x)
              (?:-|\+)?(?:(?:[0-9]+(?:\.[0-9]+)?)|(?:\.[0-9]+))
              ((?:px|pt|ch|cm|mm|in|r?em|ex|pc|deg|g?rad|dpi|dpcm|s)\b|%)?
          /,
        1 => 'keyword.other.unit.css'
    end
  end

  fragment :"property-values" do
    rule 'support.constant.property-value.css' do
      match %r/\b(absolute|all(-scroll)?|always|armenian|auto|avoid|baseline|below|bidi-override|block|bold|bolder|both|bottom|break-all|break-word|capitalize|center|char|circle|cjk-ideographic|col-resize|collapse|crosshair|dashed|decimal-leading-zero|decimal|default|disabled|disc|distribute-all-lines|distribute-letter|distribute-space|distribute|dotted|double|e-resize|ellipsis|fixed|geometricPrecision|georgian|groove|hand|hebrew|help|hidden|hiragana-iroha|hiragana|horizontal|ideograph-alpha|ideograph-numeric|ideograph-parenthesis|ideograph-space|inactive|inherit|inline-block|inline|inset|inside|inter-ideograph|inter-word|italic|justify|katakana-iroha|katakana|keep-all|left|lighter|line-edge|line-through|line|list-item|loose|lower-alpha|lower-greek|lower-latin|lower-roman|lowercase|lr-tb|ltr|medium|middle|move|n-resize|ne-resize|newspaper|no-drop|no-repeat|nw-resize|none|normal|not-allowed|nowrap|oblique|optimize(Legibility|Quality|Speed)|outset|outside|overline|pointer|pre(-(wrap|line))?|progress|relative|repeat-x|repeat-y|repeat|right|ridge|row-resize|rtl|s-resize|scroll|se-resize|separate|small-caps|solid|square|static|strict|sub|super|sw-resize|table-footer-group|table-header-group|tb-rl|text-bottom|text-top|text|thick|thin|top|transparent|underline|upper-alpha|upper-latin|upper-roman|uppercase|vertical(-(ideographic|text))?|visible(Painted|Fill|Stroke)?|w-resize|wait|whitespace|zero|smaller|larger|((xx?-)?(small|large))|painted|fill|stroke)\b/
    end
    rule 'support.constant.font-name.css' do
      match %r/(\b(?i:arial|century|comic|courier|garamond|georgia|helvetica|impact|lucida|symbol|system|tahoma|times|trebuchet|utopia|verdana|webdings|sans-serif|serif|monospace)\b)/
    end
    include "#numeric-values"
    include "#color-values"
    include "#string-double"
    include "#string-single"
    rule do
      from %r/(rect)\s*(\()/,
        1 => 'support.function.misc.css',
        2 => 'punctuation.section.function.css'
      to %r/(\))/,
        1 => 'punctuation.section.function.css'
      include "#numeric-values"
    end
    rule do
      from %r/(format|local|url|attr|counter|counters)\s*(\()/,
        1 => 'support.function.misc.css',
        2 => 'punctuation.section.function.css'
      to %r/(\))/,
        1 => 'punctuation.section.function.css'
      include "#string-single"
      include "#string-double"
      rule 'variable.parameter.misc.css' do
        match %r/[^'") \t]+/
      end
    end
    rule 'keyword.other.important.css' do
      match %r/\!\s*important/
    end
  end

  fragment :"rule-list" do
    rule 'meta.property-list.css' do
      from %r/\{/,
        0 => 'punctuation.section.property-list.css'
      to %r/(?=\s*\})/
      include "#comment-block"
      rule 'meta.property-name.css' do
        from %r/(?<![-a-z])(?=[-a-z])/
        to %r/$|(?![-a-z])/
        rule 'support.type.property-name.css' do
          match %r/\b(azimuth|background-attachment|background-color|background-image|background-position|background-repeat|background|box-shadow|border-radius|border-bottom-color|border-bottom-style|border-bottom-width|border-bottom|border-collapse|border-color|border-left-color|border-left-style|border-left-width|border-left|border-right-color|border-right-style|border-right-width|border-right|border-spacing|border-style|border-top-color|border-top-style|border-top-width|border-top|border-width|border|bottom|caption-side|clear|clip|color|content|counter-increment|counter-reset|cue-after|cue-before|cue|cursor|direction|display|elevation|empty-cells|float|font-family|font-size-adjust|font-size|font-stretch|font-style|font-variant|font-weight|font|height|image-rendering|left|letter-spacing|line-height|list-style-image|list-style-position|list-style-type|list-style|margin-bottom|margin-left|margin-right|margin-top|marker-offset|margin|marks|max-height|max-width|min-height|min-width|-moz-border-radius|opacity|orphans|outline-color|outline-style|outline-width|outline|overflow(-[xy])?|padding-bottom|padding-left|padding-right|padding-top|padding|page-break-after|page-break-before|page-break-inside|page|pause-after|pause-before|pause|pitch-range|pitch|play-during|pointer-events|position|quotes|resize|richness|right|size|speak-header|speak-numeral|speak-punctuation|speech-rate|speak|src|stress|table-layout|text-(align|decoration|indent|rendering|shadow|transform)|top|unicode-bidi|vertical-align|visibility|voice-family|volume|white-space|widows|width|word-(spacing|wrap)|zoom|z-index)\b/
        end
      end
      rule 'meta.property-value.css' do
        from %r/(:)\s*/,
          1 => 'punctuation.separator.key-value.css'
        to %r/\s*(;|(?=\}))/,
          1 => 'punctuation.terminator.rule.css'
        include "#property-values"
      end
    end
  end

  fragment :selector do
    rule 'meta.selector.css' do
      from %r/\s*(?=[:.*#a-zA-Z])/
      to %r'(?=[/@{)])'
      rule 'entity.name.tag.css' do
        match %r/\b(a|abbr|acronym|address|area|article|aside|audio|b|base|big|blockquote|body|br|button|canvas|caption|cite|code|col|colgroup|datalist|dd|del|details|dfn|dialog|div|dl|dt|em|eventsource|fieldset|figure|figcaption|footer|form|frame|frameset|(h[1-6])|head|header|hgroup|hr|html|i|iframe|img|input|ins|kbd|label|legend|li|link|map|mark|menu|meta|meter|nav|noframes|noscript|object|ol|optgroup|option|output|p|param|pre|progress|q|samp|script|section|select|small|span|strike|strong|style|sub|summary|sup|table|tbody|td|textarea|tfoot|th|thead|time|title|tr|tt|ul|var|video)\b/
      end
      rule 'entity.other.attribute-name.class.css' do
        match %r/(\.)[a-zA-Z0-9_-]+/,
          1 => 'punctuation.definition.entity.css'
      end
      rule 'entity.other.attribute-name.id.css' do
        match %r/(#)[a-zA-Z][a-zA-Z0-9_-]*/,
          1 => 'punctuation.definition.entity.css'
      end
      rule 'entity.name.tag.wildcard.css' do
        match %r/\*/
      end
      rule 'entity.other.attribute-name.pseudo-element.css' do
        match %r/(:+)(after|before|first-letter|first-line|selection)\b/,
          1 => 'punctuation.definition.entity.css'
      end
      rule 'entity.other.attribute-name.pseudo-class.css' do
        match %r/(:)((first|last)-child|(first|last|only)-of-type|empty|root|target|first|left|right)\b/,
          1 => 'punctuation.definition.entity.css'
      end
      rule 'entity.other.attribute-name.pseudo-class.ui-state.css' do
        match %r/(:)(checked|enabled|default|disabled|indeterminate|invalid|optional|required|valid)\b/,
          1 => 'punctuation.definition.entity.css'
      end
      rule do
        from %r/((:)not)(\()/,
          1 => 'entity.other.attribute-name.pseudo-class.css',
          2 => 'punctuation.definition.entity.css',
          3 => 'punctuation.section.function.css'
        to %r/\)/,
          0 => 'punctuation.section.function.css'
        include "#selector"
      end
      rule do
        match %r/((:)nth-(?:(?:last-)?child|(?:last-)?of-type))(\()(\-?(?:\d+n?|n)(?:\+\d+)?|even|odd)(\))/,
          1 => 'entity.other.attribute-name.pseudo-class.css',
          2 => 'punctuation.definition.entity.css',
          3 => 'punctuation.section.function.css',
          4 => 'constant.numeric.css',
          5 => 'punctuation.section.function.css'
      end
      rule 'entity.other.attribute-name.pseudo-class.css' do
        match %r/(:)(active|hover|link|visited|focus)\b/,
          1 => 'punctuation.definition.entity.css'
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
    end
  end

  fragment :"string-double" do
    rule 'string.quoted.double.css' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.css'
      to %r/"/,
        0 => 'punctuation.definition.string.end.css'
      rule 'constant.character.escape.css' do
        match %r/\\./
      end
    end
  end

  fragment :"string-single" do
    rule 'string.quoted.single.css' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.css'
      to %r/'/,
        0 => 'punctuation.definition.string.end.css'
      rule 'constant.character.escape.css' do
        match %r/\\./
      end
    end
  end
end
