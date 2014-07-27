# encoding: utf-8

language 'JavaScript (jQuery)' => 'source.js.jquery', file: 'jQuery (JavaScript)' do
  # jQuery Javascript Framework. By Jonathan Chaffer & Karl Swedberg.
  # FIXME: no file types
  key_equivalent "^~J"  # TextMate only
  uuid "1AD8EB10-62BE-417C-BC4B-29B5C6F0B36A"  # TextMate only

  rule do
    content_scope "meta.selector.jquery"
    from %r/(\$)(\()/,
      1 => 'support.class.js.jquery',
      2 => 'punctuation.section.class.begin.js'
    to %r/(\))/,
      1 => 'punctuation.section.class.end.js'
    include "#nested-parens"
    rule do
      from %r/'(?!<)/,
        0 => 'punctuation.definition.selector.begin.js'
      to %r/'/,
        0 => 'punctuation.definition.selector.end.js'
      include "#css-selector"
    end
    rule do
      from %r/"(?!<)/,
        0 => 'punctuation.definition.selector.begin.js'
      to %r/"/,
        0 => 'punctuation.definition.selector.end.js'
      include "#css-selector"
    end
    rule do
      from %r/'(?=<)/,
        0 => 'punctuation.definition.selector.begin.js'
      to %r/'/,
        0 => 'punctuation.definition.selector.end.js'
      include "text.html.basic"
    end
    rule do
      from %r/"(?=<)/,
        0 => 'punctuation.definition.selector.begin.js'
      to %r/"/,
        0 => 'punctuation.definition.selector.end.js'
      include "text.html.basic"
    end
    include "source.js"
  end
  rule do
    content_scope "meta.selector.jquery"
    from %r/\b(filter|is|not|add|children|find|next|nextAll|parent|parents|prev|prevAll|siblings|appendTo|prependTo|insertAfter|insertBefore|replaceAll|remove)\s*(\()/,
      1 => 'support.function.js.jquery',
      2 => 'punctuation.section.function.begin.js'
    to %r/(\))/,
      1 => 'punctuation.section.function.end.js'
    include "#nested-parens"
    rule do
      from %r/'(?!<)/,
        0 => 'punctuation.definition.selector.begin.js'
      to %r/'/,
        0 => 'punctuation.definition.selector.end.js'
      include "#css-selector"
    end
    rule do
      from %r/"(?!<)/,
        0 => 'punctuation.definition.selector.begin.js'
      to %r/"/,
        0 => 'punctuation.definition.selector.end.js'
      include "#css-selector"
    end
    rule do
      from %r/'(?=<)/,
        0 => 'punctuation.definition.selector.begin.js'
      to %r/'/,
        0 => 'punctuation.definition.selector.end.js'
      include "text.html.basic"
    end
    rule do
      from %r/"(?=<)/,
        0 => 'punctuation.definition.selector.begin.js'
      to %r/"/,
        0 => 'punctuation.definition.selector.end.js'
      include "text.html.basic"
    end
    include "source.js"
  end
  rule 'support.function.js.jquery' do
    match %r/\.(each|size|length|get|index|extend|noConflict|attr|removeAttr|addClass|removeClass|toggleClass|html|text|val|eq|hasClass|map|slice|contents|andSelf|end|append|prepend|after|before|wrap|wrapAll|wrapInner|replaceWith|empty|clone|css|offset|height|width|ready|bind|one|trigger|triggerHandler|unbind|hover|toggle|blur|change|click|dblclick|error|focus|keydown|keypress|keyup|load|mousedown|mousemove|mouseout|mouseover|mouseup|resize|scroll|select|submit|unload|show|hide|toggle|slideDown|slideUp|slideToggle|fadeIn|fadeOut|fadeTo|animate|stop|queue|dequeue|load|ajaxComplete|ajaxError|ajaxSend|ajaxStart|ajaxStop|ajaxSuccess|serialize|serializeArray|ajax|get|getJSON|getScript|post|ajaxSetup|css|offset|height|width)\b/
  end
  include "source.js"

  fragment :"css-selector" do
    rule 'meta.selector.css' do
      from %r/(?=\s*[.*#a-zA-Z])/
      to %r/(?=["'])/
      rule 'entity.name.tag.css' do
        match %r/\b(a|abbr|acronym|address|area|b|base|big|blockquote|body|br|button|caption|cite|code|col|colgroup|dd|del|dfn|div|dl|dt|em|fieldset|form|frame|frameset|(h[1-6])|head|hr|html|i|iframe|img|input|ins|kbd|label|legend|li|link|map|meta|noframes|noscript|object|ol|optgroup|option|p|param|pre|q|samp|script|select|small|span|strike|strong|style|sub|sup|table|tbody|td|textarea|tfoot|th|thead|title|tr|tt|ul|var)\b/
      end
      rule 'entity.other.attribute-name.class.css' do
        match %r/(\.)[a-zA-Z0-9_-]+/,
          1 => 'punctuation.definition.attribute-name.css'
      end
      rule 'entity.other.attribute-name.id.css' do
        match %r/(#)[a-zA-Z0-9_-]+/,
          1 => 'punctuation.definition.attribute-name.css'
      end
      rule 'entity.name.tag.wildcard.css' do
        match %r/\*/
      end
      rule 'entity.other.attribute-name.pseudo-class.css' do
        match %r/(:)\b(active|after|before|first-letter|first-line|hover|link|visited)\b/,
          1 => 'punctuation.definition.attribute-name.css'
      end
    end
  end

  fragment :"nested-parens" do
    rule do
      from %r/\(/,
        0 => 'punctuation.section.scope.begin.js'
      to %r/\)/,
        0 => 'punctuation.section.scope.end.js'
      include "#nested-parens"
      include "source.js"
    end
  end
end
