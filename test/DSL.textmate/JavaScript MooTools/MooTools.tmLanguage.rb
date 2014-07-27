# encoding: utf-8

language 'MooTools' => 'source.js.mootools' do
  #
  # MooTools Framework by Valerio Proietti.
  # http://mootools.net
  # This syntax document is largely based on the documentation at http://docs.mootools.net
  # Initial bundle by Joe Maller.
  # FIXME: no file types
  key_equivalent "^~J"  # TextMate only
  uuid "7E4B5859-2FB4-4D2A-9105-276BDE28B94E"  # TextMate only

  rule 'support.class.js.mootools' do
    #
    # Class
    # The base class object of the http://mootools.net framework.
    # http://docs.mootools.net/files/Core/Moo-js.html
    match %r/\b(Class|Array|Element|Event|Function|String)\b/
  end
  rule 'support.class.class.js.mootools' do
    match %r/\b(empty|extend|implement)\b/
  end
  rule 'support.function.class.js.mootools' do
    match %r/\b(extend|Native)\b/
  end
  rule 'support.function.utility.js.mootools' do
    #
    # Utility
    # Contains Utility functions
    # http://docs.mootools.net/files/Core/Utility-js.html
    match %r/\$(type|chk|pick|random|clear)\b/
  end
  rule do
    match %r/window\.(ie|ie6|ie7|khtml|gecko)\b/,
      1 => 'support.class.window.browser.js.mootools'
  end
  #
  # Array
  # A collection of The Array Object prototype methods.
  # http://docs.mootools.net/files/Native/Array-js.html
  include "#array-functions"
  rule 'support.class.array.js.mootools' do
    match %r/\b(forEach|filter|map|every|some|indexOf|each|copy|remove|test|extend|associate)\b/
  end
  #
  # Element
  # Custom class to allow all of its methods to be used with any DOM element via the dollar function $.
  # http://docs.mootools.net/files/Native/Element-js.html
  include "#element-functions"
  rule 'support.class.element.js.mootools' do
    match %r/\b(injectBefore|injectAfter|injectInside|adopt|remove|clone|replaceWith|appendText|hasClass|addClass|removeClass|toggleClass|setStyle|setStyles|setOpacity|getStyle|addEvent|removeEvent|removeEvents|fireEvent|getPrevious|getNext|getFirst|getLast|getParent|getChildren|setProperty|setProperties|setHTML|getProperty|getTag|scrollTo|getValue|getSize|getPosition|getTop|getLeft|getCoordinates)\b/
  end
  rule 'support.class.event.js.mootools' do
    #
    # Event
    # Cross browser methods to manage events.
    # http://docs.mootools.net/files/Native/Event-js.html
    match %r/\b(stop|stopPropagation|preventDefault|bindWithEvent)\b/
  end
  rule 'support.class.function.js.mootools' do
    #
    # Function
    # A collection of The Function Object prototype methods.
    # http://docs.mootools.net/files/Native/Function-js.html
    match %r/\b(create|pass|attempt|bind|bindAsEventListener|delay|periodical)\b/
  end
  rule 'support.class.string.js.mootools' do
    #
    # String
    # A collection of The String Object prototype methods.
    # http://docs.mootools.net/files/Native/String-js.html
    match %r/\b(test|toInt|camelCase|hyphenate|capitalize|trim|clean|rgbToHex|hexToRgb)\b/
  end
  rule 'support.class.number.js.mootools' do
    match %r/\btoInt\b/
  end
  #
  # DOM
  # Css Query related function and Element extensions.
  # http://docs.mootools.net/files/Addons/Dom-js.html
  include "#dom-functions"
  rule 'support.class.dom.js.mootools' do
    # document. getElementsByClassName  might belong somewhere else
    match %r/\b(getElements|getElementById|getElement|getElementsBySelector|getElementsByClassName)\b/
  end
  #
  # Hash
  # It wraps an object that it uses internally as a map.
  # http://docs.mootools.net/files/Addons/Hash-js.html
  #  -- note: several overlaps in here with named properties from array.js.mootools
  include "#hash-functions"
  rule 'support.class.hash.js.mootools' do
    match %r/\b(get|hasKey|set|remove|each|extend|empty|keys|values)\b/
  end
  rule 'support.class.color.js.mootools' do
    #
    # Color
    # Creates a new Color Object, which is an array with some color specific methods.
    # http://docs.mootools.net/files/Addons/Color-js.html
    match %r/\b(mix|invert|setHue|setSaturation|setBrightness)\b/
  end
  rule 'support.function.color.js.mootools' do
    match %r/\$(?:RGB|HSB)\(([^)]*)\)\b/,
      1 => 'variable.parameter.function.js'
  end
  rule 'support.function.chain.js.mootools' do
    #
    # Common
    # Contains common implementations for custom classes.
    # http://docs.mootools.net/files/Addons/Common-js.html
    match %r/\b(chain|(call|clear)Chain)\b/
  end
  rule 'support.function.events.js.mootools' do
    match %r/\b(add|fire|remove)Event\b/
  end
  rule 'support.function.options.js.mootools' do
    match %r/\bsetOptions\b/
  end
  rule 'support.class.base.window.js.mootools' do
    #
    # Window Base
    # Cross browser methods to get the window size, onDomReady method.
    # http://docs.mootools.net/files/Window/Window-Base-js.html
    #  -- note: addEvent is already listed under Element
    match %r/\bonDomReady\b/
  end
  rule 'support.class.size.window.js.mootools' do
    #
    # Window Size
    # Cross browser methods to get various window dimensions.
    # http://docs.mootools.net/files/Window/Window-Size-js.html
    #  -- note: getSize is already listed under Element
    match %r/\b(get(Width|Height|Scroll(Width|Height|Left|Top)))\b/
  end
  rule 'support.class.ajax.js.mootools' do
    #
    # Ajax
    # An Ajax class, For all your asynchronous needs.
    # http://docs.mootools.net/files/Remote/Ajax-js.html
    match %r/\b(request|evalScripts)\b/
  end
  rule 'support.function.js.mootools' do
    # note: both Object and Element have a toQueryString function/property
    match %r/\btoQueryString\b/
  end
  rule 'support.class.element.js' do
    match %r/\bsend\b/
  end
  rule 'support.function.asset.js.mootools' do
    #
    # Assets
    # provides dynamic loading for images, css and javascript files.
    # http://docs.mootools.net/files/Remote/Assets-js.html
    match %r/\b(javascript|css|images?)\b/
  end
  rule 'support.class.cookie.js.mootools' do
    #
    # Cookie
    # Class for creating, getting, and removing cookies.
    # http://docs.mootools.net/files/Remote/Assets-js.html
    match %r/\b(set|get|remove)\b/
  end
  rule 'support.class.json.js.mootools' do
    #
    # Json
    # Simple Json parser and Stringyfier, See: http://www.json.org/
    # http://docs.mootools.net/files/Remote/Json-js.html
    match %r/\b(toString|evaluate)\b/
  end
  rule 'support.class.json.js.mootools' do
    #
    # Json Remote
    # Wrapped XHR with automated sending and receiving of Javascript Objects in Json Format.
    # http://docs.mootools.net/files/Remote/Json-Remote-js.html
    match %r/\bJson\.Remote\b/
  end
  rule 'support.class.xhr.js.mootools' do
    #
    # XHR
    # Contains the basic XMLHttpRequest Class Wrapper.
    # http://docs.mootools.net/files/Remote/XHR-js.html
    match %r/\bXHR\b/
  end
  rule 'support.class.base.fx.js.mootools' do
    #
    # Fx.Base
    # Base class for the Mootools Effects (Moo.Fx) library.
    # http://docs.mootools.net/files/Effects/Fx-Base-js.html
    match %r/\b(set|start|stop)\b/
  end
  rule 'support.class.transitions.fx.js.mootools' do
    match %r/\b(linear|sineInOut)\b/
  end
  rule 'support.class.keys.options.transitions.fx' do
    match %r/\b(onStart|onComplete|transition|duration|unit|wait|fps)\b/
  end
  rule 'support.class.elements.fx.js.mootools' do
    #
    # Fx.Elements
    # Fx.Elements allows you to apply any number of styles transitions to a selection of elements.
    # http://docs.mootools.net/files/Effects/Fx-Elements-js.html
    match %r/\b(start)\b/
  end
  rule do
    content_scope "variable.parameter.fx.elements.js.mootools"
    from %r/(new)\s+(Fx\.Elements)(\()/,
      1 => 'keyword.operator.new.js',
      2 => 'entity.name.type.instance.js.mootools',
      3 => 'punctuation.definition.parameters.begin.js'
    to %r/(\)(;|$))/,
      1 => 'punctuation.definition.parameters.end.js'
    include "#element-functions"
    include "#array-functions"
    include "#dom-functions"
    include "#hash-functions"
    rule do
      content_scope "variable.parameter.fx.elements.options.js.mootools"
      from %r/(\{)/,
        1 => 'punctuation.definition.parameters.begin.js'
      to %r/(\})(?=\))/,
        1 => 'punctuation.definition.parameters.end.js'
      rule 'punctuation.separator.key-value.js.mootools' do
        match %r/(:)/
      end
      include "#fx-options"
      include "source.js"
    end
  end
  rule 'support.class.scroll.fx.js.mootools' do
    #
    # Fx.Scroll
    # Scroll any element with an overflow, including the window element.
    # http://docs.mootools.net/files/Effects/Fx-Scroll-js.html
    match %r/\b(scrollTo|to(Top|Bottom|Left|Right|Element))/
  end
  rule do
    content_scope "variable.parameter.fx.scroll.js.mootools"
    from %r/(new)\s+(Fx\.Scroll)(\()/,
      1 => 'keyword.operator.new.js',
      2 => 'entity.name.type.instance.js.mootools',
      3 => 'punctuation.definition.parameters.begin.js'
    to %r/(\)(;|$))/,
      1 => 'punctuation.definition.parameters.end.js'
    include "#element-functions"
    include "#array-functions"
    include "#dom-functions"
    include "#hash-functions"
    rule do
      content_scope "variable.parameter.fx.scroll.options.js.mootools"
      from %r/(\{)/,
        1 => 'punctuation.definition.parameters.begin.js'
      to %r/(\})(?=\))/,
        1 => 'punctuation.definition.parameters.end.js'
      rule 'punctuation.separator.key-value.js.mootools' do
        match %r/(:)/
      end
      include "#fx-options"
      include "source.js"
    end
  end
  rule 'support.class.slide.fx.js.mootools' do
    #
    # Fx.Slide
    # The slide effect; slides an element in horizontally or vertically, the contents will fold inside.
    # http://docs.mootools.net/files/Effects/Fx-Slide-js.html
    match %r/\b(slide(In|Out)|hide|show|toggle)\b/
  end
  rule do
    content_scope "variable.parameter.fx.slide.js.mootools"
    from %r/(new)\s+(Fx\.Slide)(\()/,
      1 => 'keyword.operator.new.js',
      2 => 'entity.name.type.instance.js.mootools',
      3 => 'punctuation.definition.parameters.begin.js'
    to %r/(\)(;|$))/,
      1 => 'punctuation.definition.parameters.end.js'
    include "#element-functions"
    include "#array-functions"
    include "#dom-functions"
    include "#hash-functions"
    rule do
      content_scope "variable.parameter.fx.slide.options.js.mootools"
      from %r/(\{)/,
        1 => 'punctuation.definition.parameters.begin.js'
      to %r/(\})(?=\))/,
        1 => 'punctuation.definition.parameters.end.js'
      rule 'punctuation.separator.key-value.js.mootools' do
        match %r/(:)/
      end
      include "#fx-options"
      include "source.js"
    end
  end
  rule 'support.class.slide.fx.js.mootools' do
    #
    # Fx.Style
    # The Style effect; Extends Fx.Base, inherits all its properties.
    # http://docs.mootools.net/files/Effects/Fx-Style-js.html
    match %r/\b(hide|start)\b/
  end
  rule do
    content_scope "variable.parameter.fx.style.js.mootools"
    from %r/(new)\s+(Fx\.Style)(\()/,
      1 => 'keyword.operator.new.js',
      2 => 'entity.name.type.instance.fx.style.js.mootools',
      3 => 'punctuation.definition.parameters.begin.js'
    to %r/(\)(;|$))/,
      1 => 'punctuation.definition.parameters.end.js'
    include "#element-functions"
    include "#array-functions"
    include "#dom-functions"
    include "#hash-functions"
    rule do
      content_scope "variable.parameter.fx.style.options.js.mootools"
      from %r/,\s*(\{)/,
        1 => 'punctuation.definition.parameters.begin.js'
      to %r/(\})(?=\))/,
        1 => 'punctuation.definition.parameters.end.js'
      rule 'punctuation.separator.key-value.js.mootools' do
        match %r/(:)/
      end
      include "#fx-options"
      include "source.js"
    end
  end
  rule 'support.class.element.js.mootools' do
    match %r/\b(effect)\b/
  end
  rule 'support.class.styles.fx.js.mootools' do
    #
    # Fx.Styles
    # Allows you to animate multiple css properties at once; Extends Fx.Base, inherits all its properties.
    # http://docs.mootools.net/files/Effects/Fx-Styles-js.html
    match %r/\b(start)\b/
  end
  rule do
    content_scope "variable.parameter.fx.styles.js.mootools"
    from %r/(new)\s+(Fx\.Styles)(\()/,
      1 => 'keyword.operator.new.js',
      2 => 'entity.name.type.instance.js.mootools',
      3 => 'punctuation.definition.parameters.begin.js'
    to %r/(\)(;|$))/,
      1 => 'punctuation.definition.parameters.end.js'
    include "#element-functions"
    include "#array-functions"
    include "#dom-functions"
    include "#hash-functions"
    rule do
      content_scope "variable.parameter.fx.styles.options.js.mootools"
      from %r/(\{)/,
        1 => 'punctuation.definition.parameters.begin.js'
      to %r/(\})(?=\))/,
        1 => 'punctuation.definition.parameters.end.js'
      rule 'punctuation.separator.key-value.js.mootools' do
        match %r/(:)/
      end
      include "#fx-options"
      include "source.js"
    end
  end
  rule 'support.class.element.js.mootools' do
    match %r/\b(effects)\b/
  end
  rule 'support.class.transitions.fx.js.mootools' do
    #
    # Fx.Transitions
    # A collection of tweaning transitions for use with the Fx.Base classes.
    # http://docs.mootools.net/files/Effects/Fx-Transitions-js.html
    match %r/\b(linear|quadIn|quadOut|quadInOut|cubicIn|cubicOut|cubicInOut|quartIn|quartOut|quartInOut|quintIn|quintOut|quintInOut|sineIn|sineOut|sineInOut|expoIn|expoOut|expoInOut|circIn|circOut|circInOut|elasticIn|elasticOut|elasticInOut|backIn|backOut|backInOut|bounceIn|bounceOut|bounceInOut)\b/
  end
  rule 'support.class.fx.utils.js.mootools' do
    #
    # Fx.Utils
    # Contains Fx.Height, Fx.Width, Fx.Opacity.
    # http://docs.mootools.net/files/Effects/Fx-Styles-js.html
    match %r/\b(toggle|show)\b/
  end
  rule do
    content_scope "variable.parameter.fx.utils.js.mootools"
    from %r/(new)\s+(Fx\.(?:Height|Width|Opacity))(\()/,
      1 => 'keyword.operator.new.js',
      2 => 'entity.name.type.instance.js.mootools',
      3 => 'punctuation.definition.parameters.begin.js'
    to %r/(\));?$/,
      1 => 'punctuation.definition.parameters.end.js'
    include "#element-functions"
    include "#array-functions"
    include "#dom-functions"
    include "#hash-functions"
    rule do
      content_scope "variable.parameter.fx.utils.options.js.mootools"
      from %r/(\{)/,
        1 => 'punctuation.definition.parameters.begin.js'
      to %r/(\})\)/,
        1 => 'punctuation.definition.parameters.end.js'
      rule 'punctuation.separator.key-value.js.mootools' do
        match %r/(:)/
      end
      include "#fx-options"
      include "source.js"
    end
  end
  rule 'support.class.element.js.mootools' do
    #
    # Drag.Base
    # Modify two css properties of an element based on the position of the mouse.
    # http://docs.mootools.net/files/Drag/Drag-Base-js.html
    match %r/\b(makeResizable)\b/
  end
  rule 'support.class.element.js.mootools' do
    #
    # Drag.Move
    # Modify two css properties of an element based on the position of the mouse.
    # http://docs.mootools.net/files/Drag/Drag-Base-js.html
    match %r/\b(makeDraggable)\b/
  end
  include "#leading-space"
  include "source.js"

  fragment :"array-functions" do
    rule 'meta.function.array.js.mootools' do
      content_scope "variable.parameter.function.array.js.mootools"
      from %r/(\$(?:each|A)\()/
      to %r/(\))/
      both 1 => 'support.function.array.js.mootools'
      include "source.js"
    end
  end

  fragment :"dom-functions" do
    rule 'meta.function.dom.js.mootools' do
      content_scope "variable.parameter.function.dom.js.mootools"
      from %r/(\$ES?\()/
      to %r/(\))/
      both 1 => 'support.function.dom.js.mootools'
      include "source.js"
    end
  end

  fragment :"element-functions" do
    rule 'meta.function.element.js.mootools' do
      content_scope "variable.parameter.function.element.js.mootools"
      from %r/(\$?\$\()/
      to %r/(\))/
      both 1 => 'support.function.element.js.mootools'
      include "source.js"
    end
  end

  fragment :"fx-options" do
    rule 'support.class.keys.fx.options.js.mootools' do
      match %r/\b(onStart|onComplete|transition|duration|unit|wait|fps)\b/
    end
    rule 'support.class.keys.fx.slide.options.js.mootools' do
      match %r/\b(mode)\b/
    end
  end

  fragment :"hash-functions" do
    rule 'meta.function.hash.js.mootools' do
      content_scope "variable.parameter.function.hash.js.mootools"
      from %r/(\$H\()/
      to %r/(\))/
      both 1 => 'support.function.hash.js.mootools'
      include "source.js"
    end
  end

  fragment :"leading-space" do
    #
    # The leading-space code is the ribbon highlighing thomas Aylott contributed to source.js.prototype.
    # More info in this thread:
    # http://comox.textdrive.com/pipermail/textmate/2006-August/012373.html
    rule 'meta.leading-tabs' do
      from %r/^(?=(\t|  ))/
      # FIXME: (warning) character class has duplicated range
      to %r/(?=[^\t\s])/
      rule do
        match %r/(  )(  )?(  )?(  )?(  )?(  )?(  )?(  )?(  )?(  )?(  )?/,
          1 => 'meta.odd-tab.group1.spaces',
          2 => 'meta.even-tab.group2.spaces',
          3 => 'meta.odd-tab.group3.spaces',
          4 => 'meta.even-tab.group4.spaces',
          5 => 'meta.odd-tab.group5.spaces',
          6 => 'meta.even-tab.group6.spaces',
          7 => 'meta.odd-tab.group7.spaces',
          8 => 'meta.even-tab.group8.spaces',
          9 => 'meta.odd-tab.group9.spaces',
          10 => 'meta.even-tab.group10.spaces',
          11 => 'meta.odd-tab.group11.spaces'
      end
      rule do
        match %r/(\t)(\t)?(\t)?(\t)?(\t)?(\t)?(\t)?(\t)?(\t)?(\t)?(\t)?/,
          1 => 'meta.odd-tab.group1.tab',
          2 => 'meta.even-tab.group2.tab',
          3 => 'meta.odd-tab.group3.tab',
          4 => 'meta.even-tab.group4.tab',
          5 => 'meta.odd-tab.group5.tab',
          6 => 'meta.even-tab.group6.tab',
          7 => 'meta.odd-tab.group7.tab',
          8 => 'meta.even-tab.group8.tab',
          9 => 'meta.odd-tab.group9.tab',
          10 => 'meta.even-tab.group10.tab',
          11 => 'meta.odd-tab.group11.tab'
      end
    end
  end
end
