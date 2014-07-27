# encoding: utf-8

language 'CSS' => 'source.css' do
  file_types %w(css css.erb)
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
    to %r/(?!\G)/
    include "#rule-list"
  end
  rule do
    from %r/(?=^\s*@media\s*.*?\{)/
    to %r/\s*(\})/,
      1 => 'punctuation.section.property-list.end.css'
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
        1 => 'punctuation.section.property-list.begin.css'
      to %r/(?=\})/
      include "$self"
    end
  end
  rule do
    from %r/(?=\{)/
    to %r/(?!\G)/
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
        0 => 'punctuation.section.property-list.begin.css'
      to %r/\}/,
        0 => 'punctuation.section.property-list.end.css'
      include "#comment-block"
      rule 'meta.property-name.css' do
        from %r/(?<![-a-z])(?=[-a-z])/
        to %r/$|(?![-a-z])/
        rule 'support.type.property-name.css' do
          match %r/\b(-webkit-[A-Za-z]+|-moz-[A-Za-z]+|-o-[A-Za-z]+|-ms-[A-Za-z]+|-khtml-[A-Za-z]+|zoom|z-index|y|x|wrap|word-wrap|word-spacing|word-break|word|width|widows|white-space-collapse|white-space|white|weight|volume|voice-volume|voice-stress|voice-rate|voice-pitch-range|voice-pitch|voice-family|voice-duration|voice-balance|voice|visibility|vertical-align|variant|user-select|up|unicode-bidi|unicode|trim|transition-timing-function|transition-property|transition-duration|transition-delay|transition|transform|top-width|top-style|top-right-radius|top-left-radius|top-color|top|timing-function|text-wrap|text-transform|text-shadow|text-replace|text-outline|text-justify|text-indent|text-height|text-emphasis|text-decoration|text-align-last|text-align|text|target-position|target-new|target-name|target|table-layout|tab-size|style-type|style-position|style-image|style|string-set|stretch|stress|stacking-strategy|stacking-shift|stacking-ruby|stacking|src|speed|speech-rate|speech|speak-punctuation|speak-numeral|speak-header|speak|span|spacing|space-collapse|space|sizing|size-adjust|size|shadow|respond-to|rule-width|rule-style|rule-color|rule|ruby-span|ruby-position|ruby-overhang|ruby-align|ruby|rows|rotation-point|rotation|role|right-width|right-style|right-color|right|richness|rest-before|rest-after|rest|resource|resolution|resize|reset|replace|repeat|rendering-intent|rate|radius|quotes|punctuation-trim|punctuation|property|profile|presentation-level|presentation|position|pointer-events|point|play-state|play-during|play-count|pitch-range|pitch|phonemes|pause-before|pause-after|pause|page-policy|page-break-inside|page-break-before|page-break-after|page|padding-top|padding-right|padding-left|padding-bottom|padding|pack|overhang|overflow-y|overflow-x|overflow-style|overflow|outline-width|outline-style|outline-offset|outline-color|outline|orphans|origin|orientation|orient|ordinal-group|opacity|offset|numeral|new|nav-up|nav-right|nav-left|nav-index|nav-down|nav|name|move-to|model|min-width|min-height|min|max-width|max-height|max|marquee-style|marquee-speed|marquee-play-count|marquee-direction|marquee|marks|mark-before|mark-after|mark|margin-top|margin-right|margin-left|margin-bottom|margin|mask-image|list-style-type|list-style-position|list-style-image|list-style|list|lines|line-stacking-strategy|line-stacking-shift|line-stacking-ruby|line-stacking|line-height|line|level|letter-spacing|length|left-width|left-style|left-color|left|label|justify|iteration-count|inline-box-align|initial-value|initial-size|initial-before-align|initial-before-adjust|initial-after-align|initial-after-adjust|index|indent|increment|image-resolution|image-orientation|image|icon|hyphens|hyphenate-resource|hyphenate-lines|hyphenate-character|hyphenate-before|hyphenate-after|hyphenate|height|header|hanging-punctuation|grid-rows|grid-columns|grid|gap|font-weight|font-variant|font-style|font-stretch|font-size-adjust|font-size|font-family|font|float-offset|float|flex-group|flex|fit-position|fit|fill|filter|family|empty-cells|emphasis|elevation|duration|drop-initial-value|drop-initial-size|drop-initial-before-align|drop-initial-before-adjust|drop-initial-after-align|drop-initial-after-adjust|drop|down|dominant-baseline|display-role|display-model|display|direction|delay|decoration-break|decoration|cursor|cue-before|cue-after|cue|crop|counter-reset|counter-increment|counter|count|content|columns|column-width|column-span|column-rule-width|column-rule-style|column-rule-color|column-rule|column-gap|column-fill|column-count|column-break-before|column-break-after|column|color-profile|color|collapse|clip|clear|character|caption-side|break-inside|break-before|break-after|break|box-sizing|box-shadow|box-pack|box-orient|box-ordinal-group|box-lines|box-flex-group|box-flex|box-direction|box-decoration-break|box-align|box|bottom-width|bottom-style|bottom-right-radius|bottom-left-radius|bottom-color|bottom|border-width|border-top-width|border-top-style|border-top-right-radius|border-top-left-radius|border-top-color|border-top|border-style|border-spacing|border-right-width|border-right-style|border-right-color|border-right|border-radius|border-length|border-left-width|border-left-style|border-left-color|border-left|border-image|border-color|border-collapse|border-bottom-width|border-bottom-style|border-bottom-right-radius|border-bottom-left-radius|border-bottom-color|border-bottom|border|bookmark-target|bookmark-level|bookmark-label|bookmark|binding|bidi|before|baseline-shift|baseline|balance|background-size|background-repeat|background-position|background-origin|background-image|background-color|background-clip|background-break|background-attachment|background|azimuth|attachment|appearance|animation-timing-function|animation-play-state|animation-name|animation-iteration-count|animation-duration|animation-direction|animation-delay|animation|alignment-baseline|alignment-adjust|alignment|align-last|align|after|adjust)\b/
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
