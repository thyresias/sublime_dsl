# encoding: utf-8

language 'Prototype & Script.aculo.us (JavaScript)' => 'source.js.prototype', file: 'JavaScript + Prototype' do
  # Prototype and Scriptaculous Javascript Frameworks. By Justin Palmer, Thomas Aylott & Martin Ström
  # FIXME: no file types
  key_equivalent "^~J"  # TextMate only
  uuid "0BD60463-DDF6-436F-9295-89DEF577FF30"  # TextMate only

  rule 'support.class.prototype.js' do
    match %r/\b(Prototype|Class|Abstract|Try|PeriodicalExecuter|Enumerable|Hash|ObjectRange|Element|Ajax|Responders|Base|Request|Updater|PeriodicalUpdater|Toggle|Insertion|Before|Top|Bottom|After|ClassNames|Form|Serializers|TimedObserver|Observer|EventObserver|Event|Position|Effect|Effect2|Transitions|ScopedQueue|Queues|DefaultOptions|Parallel|Opacity|Move|MoveBy|Scale|Highlight|ScrollTo|Fade|Appear|Puff|BlindUp|BlindDown|SwitchOff|DropOut|Shake|SlideDown|SlideUp|Squish|Grow|Shrink|Pulsate|Fold|console)\b/
  end
  rule 'support.function.js.prototype' do
    match %r/\b(Version|ScriptFragment|emptyFunction|K|create|toColorPart|succ|times|these|initialize|registerCallback|onTimerEvent|stripTags|stripScripts|extractScripts|evalScripts|escapeHTML|unescapeHTML|toQueryParams|toArray|camelize|inspect|each|inGroupsOf|eachSlice|all|any|collect|detect|findAll|grep|include|inject|invoke|max|min|partition|pluck|reject|sortBy|toArray|zip|inspect|map|find|select|member|entries|_each|_reverse|reverse|clear|first|last|compact|flatten|without|indexOf|reverse|shift|inspect|keys|values|merge|toQueryString|inspect|include|getTransport|activeRequestCount|responders|register|unregister|dispatch|onComplete|setOptions|responseIsSuccess|responseIsFailure|request|setRequestHeaders|onStateChange|header|evalJSON|evalResponse|respondToReadyState|dispatchException|updateContent|start|stop|updateComplete|toggle|hide|show|remove|update|getHeight|classNames|hasClassName|addClassName|removeClassName|cleanWhitespace|empty|scrollTo|getStyle|setStyle|getDimensions|makePositioned|undoPositioned|makeClipping|undoClipping|recursivelyCollect|ancestors|descendants|previousSiblings|nextSiblings|siblings|match|up|down|previous|next|getElementsBySelector|getElementsByClassName|contentFromAnonymousTable|initializeRange|insertContent|set|add|toString|focus|present|activate|serialize|getElements|getInputs|disable|enable|findFirstElement|focusFirstElement|reset|getValue|input|inputSelector|textarea|selectOne|selectMany|onElementEvent|registerFormCallbacks|element|isLeftClick|pointerX|pointerY|findElement|observers|unloadCache|observe|stopObserving|includeScrollOffsets|prepare|realOffset|cumulativeOffset|positionedOffset|offsetParent|within|withinIncludingScrolloffsets|overlap|clone|page|clone|absolutize|relativize)\b/
  end
  include "source.js"
  rule 'variable.other.js.prototype' do
    match %r'((?<=var\s)\b[a-zA-Z]\w*\b|\b[a-zA-Z]\w*\b(?=(\[|\s*(&|\*|\-\-|\-|\+\+|\+|~|===|==|=|!=|!==|<=|>=|<<=|>>=|>>>=|<>|<|>|!|&&|\|\||\?\:|\*=|/=|%=|\+=|\-=|&=|\^=))))'
  end
  include "#leading-space"

  fragment :"leading-space" do
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
