# encoding: utf-8

language 'AppleScript' => 'source.applescript' do
  file_types ['applescript', 'script editor']
  first_line_match %r/^#!.*(osascript)/
  folding_start_marker %r/(?x)
    ^\s*
    (
     tell \s+ (?! .* \b(to)\b) .*
    |tell\b.*?\bto\ tell \s+ (?! .* \b(to)\b) .*
    |using \s+ terms \s+ from \s+ .*
    |if\b .* \bthen\b
    |repeat\b .*
    |( on | to )\b (?!\s+ error) .*
    |try\b
    |with \s+ timeout\b .*
    |script\b .*
    |( considering | ignoring )\b .*
    )\s*(--.*?)?$
  /
  folding_stop_marker %r/^\s*end\b.*$/
  key_equivalent "^~A"  # TextMate only
  uuid "777CF925-14B9-428E-B07B-17FAAB8FA27E"  # TextMate only

  include "#blocks"
  include "#inline"

  fragment :"attributes.considering-ignoring" do
    rule 'punctuation.separator.array.attributes.applescript' do
      match %r/,/
    end
    rule 'keyword.control.attributes.and.applescript' do
      match %r/\b(and)\b/
    end
    rule 'constant.other.attributes.text.applescript' do
      match %r/\b(?i:case|diacriticals|hyphens|numeric\s+strings|punctuation|white\s+space)\b/
    end
    rule 'constant.other.attributes.application.applescript' do
      match %r/\b(?i:application\s+responses)\b/
    end
  end

  fragment :blocks do
    rule 'meta.block.script.applescript' do
      from %r/^\s*(script)\s+(\w+)/,
        1 => 'keyword.control.script.applescript',
        2 => 'entity.name.type.script-object.applescript'
      to %r/^\s*(end(?:\s+script)?)(?=\s*(--.*?)?$)/,
        1 => 'keyword.control.script.applescript'
      include "$self"
    end
    rule 'meta.function.positional.applescript' do
      #
      # This is not a very well-designed rule.  For now,
      # we can leave it like this though, as it sorta works.
      #
      # FIXME: (warning) nested repeat operator '+' and '?' was replaced with '*' in regular expression
      from %r/^(?x)
            \s*(to|on)\s+           # "on" or "to"
            (\w+)              # function name
            (\()              # opening paren
              ((?:[\s,:\{\}]*(?:\w+)?)*)  # parameters
            (\))              # closing paren
          /,
        1 => 'keyword.control.function.applescript',
        2 => 'entity.name.function.handler.applescript',
        3 => 'punctuation.definition.parameters.applescript',
        4 => 'variable.parameter.handler.applescript',
        5 => 'punctuation.definition.parameters.applescript'
      to %r/^\s*(end)(?:\s+(\2))?(?=\s*(--.*?)?$)/,
        1 => 'keyword.control.function.applescript'
      include "$self"
    end
    rule 'meta.function.prepositional.applescript' do
      # TODO: match `given` parameters
      from %r/^(?x)
            \s*(to|on)\s+           # "on" or "to"
            (\w+)              # function name
            (?:\s+
              (of|in)\s+          # "of" or "in"
              (\w+)            # direct parameter
            )?
            (?=\s+(above|against|apart\s+from|around|aside\s+from|at|below|beneath|beside|between|by|for|from|instead\s+of|into|on|onto|out\s+of|over|thru|under)\b)
          /,
        1 => 'keyword.control.function.applescript',
        2 => 'entity.name.function.handler.applescript',
        3 => 'keyword.control.function.applescript',
        4 => 'variable.parameter.handler.direct.applescript'
      to %r/^\s*(end)(?:\s+(\2))?(?=\s*(--.*?)?$)/,
        1 => 'keyword.control.function.applescript'
      rule do
        match %r/\b(?i:above|against|apart\s+from|around|aside\s+from|at|below|beneath|beside|between|by|for|from|instead\s+of|into|on|onto|out\s+of|over|thru|under)\s+(\w+)\b/,
          1 => 'keyword.control.preposition.applescript',
          2 => 'variable.parameter.handler.applescript'
      end
      include "$self"
    end
    rule 'meta.function.parameterless.applescript' do
      from %r/^(?x)
            \s*(to|on)\s+           # "on" or "to"
            (\w+)              # function name
            (?=\s*(--.*?)?$)        # nothing else
          /,
        1 => 'keyword.control.function.applescript',
        2 => 'entity.name.function.handler.applescript'
      to %r/^\s*(end)(?:\s+(\2))?(?=\s*(--.*?)?$)/,
        1 => 'keyword.control.function.applescript'
      include "$self"
    end
    include "#blocks.tell"
    include "#blocks.repeat"
    include "#blocks.statement"
    include "#blocks.other"
  end

  fragment :"blocks.other" do
    rule 'meta.block.considering.applescript' do
      from %r/^\s*(considering)\b/
      to %r/^\s*(end(?:\s+considering)?)(?=\s*(--.*?)?$)/
      rule 'meta.array.attributes.considering.applescript' do
        from %r/(?<=considering)/
        to %r/(?<!¬)$/
        include "#attributes.considering-ignoring"
      end
      rule 'meta.array.attributes.ignoring.applescript' do
        from %r/(?<=ignoring)/
        to %r/(?<!¬)$/
        include "#attributes.considering-ignoring"
      end
      rule 'keyword.control.but.applescript' do
        match %r/\b(but)\b/
      end
      include "$self"
    end
    rule 'meta.block.ignoring.applescript' do
      from %r/^\s*(ignoring)\b/
      to %r/^\s*(end(?:\s+ignoring)?)(?=\s*(--.*?)?$)/
      rule 'meta.array.attributes.considering.applescript' do
        from %r/(?<=considering)/
        to %r/(?<!¬)$/
        include "#attributes.considering-ignoring"
      end
      rule 'meta.array.attributes.ignoring.applescript' do
        from %r/(?<=ignoring)/
        to %r/(?<!¬)$/
        include "#attributes.considering-ignoring"
      end
      rule 'keyword.control.but.applescript' do
        match %r/\b(but)\b/
      end
      include "$self"
    end
    rule 'meta.block.if.applescript' do
      from %r/^\s*(if)\b/,
        1 => 'keyword.control.if.applescript'
      to %r/^\s*(end(?:\s+if)?)(?=\s*(--.*?)?$)/,
        1 => 'keyword.control.end.applescript'
      rule 'keyword.control.then.applescript' do
        match %r/\b(then)\b/
      end
      rule 'keyword.control.else-if.applescript' do
        match %r/\b(else\s+if)\b/
      end
      rule 'keyword.control.else.applescript' do
        match %r/\b(else)\b/
      end
      include "$self"
    end
    rule 'meta.block.try.applescript' do
      from %r/^\s*(try)\b/,
        1 => 'keyword.control.try.applescript'
      to %r/^\s*(end(?:\s+(try|error))?)(?=\s*(--.*?)?$)/,
        1 => 'keyword.control.end.applescript'
      rule 'meta.property.error.applescript' do
        from %r/^\s*(on\s+error)\b/,
          1 => 'keyword.control.exception.on-error.applescript'
        to %r/(?<!¬)$/
        rule 'keyword.control.exception.modifier.applescript' do
          match %r/\b(?i:number|partial|from|to)\b/
        end
        include "#inline"
      end
      include "$self"
    end
    rule 'meta.block.terms.applescript' do
      from %r/^\s*(using\s+terms\s+from)\b/,
        1 => 'keyword.control.terms.applescript'
      to %r/^\s*(end(?:\s+using\s+terms\s+from)?)(?=\s*(--.*?)?$)/,
        1 => 'keyword.control.end.applescript'
      include "$self"
    end
    rule 'meta.block.timeout.applescript' do
      from %r/^\s*(with\s+timeout(\s+of)?)\b/,
        1 => 'keyword.control.timeout.applescript'
      to %r/^\s*(end(?:\s+timeout)?)(?=\s*(--.*?)?$)/,
        1 => 'keyword.control.end.applescript'
      include "$self"
    end
    rule 'meta.block.transaction.applescript' do
      from %r/^\s*(with\s+transaction(\s+of)?)\b/,
        1 => 'keyword.control.transaction.applescript'
      to %r/^\s*(end(?:\s+transaction)?)(?=\s*(--.*?)?$)/,
        1 => 'keyword.control.end.applescript'
      include "$self"
    end
  end

  fragment :"blocks.repeat" do
    rule 'meta.block.repeat.until.applescript' do
      from %r/^\s*(repeat)\s+(until)\b/,
        1 => 'keyword.control.repeat.applescript',
        2 => 'keyword.control.until.applescript'
      to %r/^\s*(end(?:\s+repeat)?)(?=\s*(--.*?)?$)/,
        1 => 'keyword.control.end.applescript'
      include "$self"
    end
    rule 'meta.block.repeat.while.applescript' do
      from %r/^\s*(repeat)\s+(while)\b/,
        1 => 'keyword.control.repeat.applescript',
        2 => 'keyword.control.while.applescript'
      to %r/^\s*(end(?:\s+repeat)?)(?=\s*(--.*?)?$)/,
        1 => 'keyword.control.end.applescript'
      include "$self"
    end
    rule 'meta.block.repeat.with.applescript' do
      from %r/^\s*(repeat)\s+(with)\s+(\w+)\b/,
        1 => 'keyword.control.repeat.applescript',
        2 => 'keyword.control.until.applescript',
        3 => 'variable.parameter.loop.applescript'
      to %r/^\s*(end(?:\s+repeat)?)(?=\s*(--.*?)?$)/,
        1 => 'keyword.control.end.applescript'
      rule 'keyword.control.modifier.range.applescript' do
        match %r/\b(from|to|by)\b/
      end
      rule 'keyword.control.modifier.list.applescript' do
        match %r/\b(in)\b/
      end
      include "$self"
    end
    rule 'meta.block.repeat.forever.applescript' do
      from %r/^\s*(repeat)\b(?=\s*(--.*?)?$)/,
        1 => 'keyword.control.repeat.applescript'
      to %r/^\s*(end(?:\s+repeat)?)(?=\s*(--.*?)?$)/,
        1 => 'keyword.control.end.applescript'
      include "$self"
    end
    rule 'meta.block.repeat.times.applescript' do
      from %r/^\s*(repeat)\b/,
        1 => 'keyword.control.repeat.applescript'
      to %r/^\s*(end(?:\s+repeat)?)(?=\s*(--.*?)?$)/,
        1 => 'keyword.control.end.applescript'
      rule 'keyword.control.times.applescript' do
        match %r/\b(times)\b/
      end
      include "$self"
    end
  end

  fragment :"blocks.statement" do
    rule 'meta.statement.property.applescript' do
      from %r/\b(prop(?:erty)?)\s+(\w+)\b/,
        1 => 'keyword.control.def.property.applescript',
        2 => 'variable.other.property.applescript'
      to %r/(?<!¬)$/
      rule 'punctuation.separator.key-value.property.applescript' do
        match %r/:/
      end
      include "#inline"
    end
    rule 'meta.statement.set.applescript' do
      from %r/\b(set)\s+(\w+)\s+(to)\b/,
        1 => 'keyword.control.def.set.applescript',
        2 => 'variable.other.readwrite.set.applescript',
        3 => 'keyword.control.def.set.applescript'
      to %r/(?<!¬)$/
      include "#inline"
    end
    rule 'meta.statement.local.applescript' do
      from %r/\b(local)\b/,
        1 => 'keyword.control.def.local.applescript'
      to %r/(?<!¬)$/
      rule 'punctuation.separator.variables.local.applescript' do
        match %r/,/
      end
      rule 'variable.other.readwrite.local.applescript' do
        match %r/\b\w+/
      end
      include "#inline"
    end
    rule 'meta.statement.global.applescript' do
      from %r/\b(global)\b/,
        1 => 'keyword.control.def.global.applescript'
      to %r/(?<!¬)$/
      rule 'punctuation.separator.variables.global.applescript' do
        match %r/,/
      end
      rule 'variable.other.readwrite.global.applescript' do
        match %r/\b\w+/
      end
      include "#inline"
    end
    rule 'meta.statement.error.applescript' do
      from %r/\b(error)\b/,
        1 => 'keyword.control.exception.error.applescript'
      to %r/(?<!¬)$/
      rule 'keyword.control.exception.modifier.applescript' do
        match %r/\b(number|partial|from|to)\b/
      end
      include "#inline"
    end
    rule 'meta.statement.if-then.applescript' do
      from %r/\b(if)\b(?=.*\bthen\b(?!\s*(--.*?)?$))/,
        1 => 'keyword.control.if.applescript'
      to %r/(?<!¬)$/
      include "#inline"
    end
  end

  fragment :"blocks.tell" do
    rule 'meta.block.tell.application.textmate.applescript' do
      # tell Textmate
      from %r/^\s*(tell)\s+(?=app(lication)?\s+"(?i:textmate)")(?!.*\bto(?!\s+tell)\b)/
      to %r/^\s*(end(?:\s+tell)?)(?=\s*(--.*?)?$)/
      both 1 => 'keyword.control.tell.applescript'
      include "#textmate"
      include "#standard-suite"
      include "$self"
    end
    rule 'meta.block.tell.application.finder.applescript' do
      # tell Finder
      from %r/^\s*(tell)\s+(?=app(lication)?\s+"(?i:finder)")(?!.*\bto(?!\s+tell)\b)/
      to %r/^\s*(end(?:\s+tell)?)(?=\s*(--.*?)?$)/
      both 1 => 'keyword.control.tell.applescript'
      include "#finder"
      include "#standard-suite"
      include "$self"
    end
    rule 'meta.block.tell.application.system-events.applescript' do
      # tell System Events
      from %r/^\s*(tell)\s+(?=app(lication)?\s+"(?i:system events)")(?!.*\bto(?!\s+tell)\b)/
      to %r/^\s*(end(?:\s+tell)?)(?=\s*(--.*?)?$)/
      both 1 => 'keyword.control.tell.applescript'
      include "#system-events"
      include "#standard-suite"
      include "$self"
    end
    rule 'meta.block.tell.application.itunes.applescript' do
      # tell iTunes
      from %r/^\s*(tell)\s+(?=app(lication)?\s+"(?i:itunes)")(?!.*\bto(?!\s+tell)\b)/
      to %r/^\s*(end(?:\s+tell)?)(?=\s*(--.*?)?$)/
      both 1 => 'keyword.control.tell.applescript'
      include "#itunes"
      include "#standard-suite"
      include "$self"
    end
    rule 'meta.block.tell.application-process.generic.applescript' do
      # tell generic application process
      from %r/^\s*(tell)\s+(?=app(lication)?\s+process\b)(?!.*\bto(?!\s+tell)\b)/
      to %r/^\s*(end(?:\s+tell)?)(?=\s*(--.*?)?$)/
      both 1 => 'keyword.control.tell.applescript'
      include "#standard-suite"
      include "$self"
    end
    rule 'meta.block.tell.application.generic.applescript' do
      # tell generic application
      from %r/^\s*(tell)\s+(?=app(lication)?\b)(?!.*\bto(?!\s+tell)\b)/
      to %r/^\s*(end(?:\s+tell)?)(?=\s*(--.*?)?$)/
      both 1 => 'keyword.control.tell.applescript'
      include "#standard-suite"
      include "$self"
    end
    rule 'meta.block.tell.generic.applescript' do
      # generic tell block
      from %r/^\s*(tell)\s+(?!.*\bto(?!\s+tell)\b)/
      to %r/^\s*(end(?:\s+tell)?)(?=\s*(--.*?)?$)/
      both 1 => 'keyword.control.tell.applescript'
      include "$self"
    end
    rule 'meta.block.tell.generic.applescript' do
      # tell … to statement
      from %r/^\s*(tell)\s+(?=.*\bto\b)/
      to %r/(?<!¬)$/
      both 1 => 'keyword.control.tell.applescript'
      include "$self"
    end
  end

  fragment :"built-in" do
    include "#built-in.constant"
    include "#built-in.keyword"
    include "#built-in.support"
    include "#built-in.punctuation"
  end

  fragment :"built-in.constant" do
    rule 'constant.language.boolean.applescript' do
      # yes/no can’t always be used as booleans, e.g. in an if() expression. But they work e.g. for boolean arguments.
      match %r/\b(?i:true|false|yes|no)\b/
    end
    rule 'constant.language.null.applescript' do
      match %r/\b(?i:null|missing\s+value)\b/
    end
    rule 'constant.numeric.applescript' do
      match %r/-?\b\d+((\.(\d+\b)?)?(?i:e\+?\d*\b)?|\b)/
    end
    rule 'constant.other.text.applescript' do
      match %r/\b(?i:space|tab|return|linefeed|quote)\b/
    end
    rule 'constant.other.styles.applescript' do
      match %r/\b(?i:all\s+(caps|lowercase)|bold|condensed|expanded|hidden|italic|outline|plain|shadow|small\s+caps|strikethrough|(sub|super)script|underline)\b/
    end
    rule 'constant.other.time.month.applescript' do
      match %r/\b(?i:Jan(uary)?|Feb(ruary)?|Mar(ch)?|Apr(il)?|May|Jun(e)?|Jul(y)?|Aug(ust)?|Sep(tember)?|Oct(ober)?|Nov(ember)?|Dec(ember)?)\b/
    end
    rule 'constant.other.time.weekday.applescript' do
      match %r/\b(?i:Mon(day)?|Tue(sday)?|Wed(nesday)?|Thu(rsday)?|Fri(day)?|Sat(urday)?|Sun(day)?)\b/
    end
    rule 'constant.other.miscellaneous.applescript' do
      match %r/\b(?i:AppleScript|pi|result|version|current\s+application|its?|m[ey])\b/
    end
    rule 'variable.language.applescript' do
      match %r/\b(?i:text\s+item\s+delimiters|print\s+(length|depth))\b/
    end
  end

  fragment :"built-in.keyword" do
    rule 'keyword.operator.arithmetic.applescript' do
      match %r'(&|\*|\+|-|/|÷|\^)'
    end
    rule 'keyword.operator.comparison.applescript' do
      match %r/(=|≠|>|<|≥|>=|≤|<=)/
    end
    rule 'keyword.operator.word.applescript' do
      match %r/(?ix)\b
            (and|or|div|mod|as|not
            |(a\s+)?(ref(\s+to)?|reference\s+to)
            |equal(s|\s+to)|contains?|comes\s+(after|before)|(start|begin|end)s?\s+with
            )
          \b/
    end
    rule 'keyword.operator.word.applescript' do
      # In double quotes so we can use a single quote in the keywords.
      match %r/(?ix)\b
            (is(n't|\s+not)?(\s+(equal(\s+to)?|(less|greater)\s+than(\s+or\s+equal(\s+to)?)?|in|contained\s+by))?
            |does(n't|\s+not)\s+(equal|come\s+(before|after)|contain)
            )
          \b/
    end
    rule 'keyword.operator.reference.applescript' do
      match %r/\b(?i:some|every|whose|where|that|id|index|\d+(st|nd|rd|th)|first|second|third|fourth|fifth|sixth|seventh|eighth|ninth|tenth|last|front|back|middle|named|beginning|end|from|to|thr(u|ough)|before|(front|back|beginning|end)\s+of|after|behind|in\s+(front|back|beginning|end)\s+of)\b/
    end
    rule 'keyword.control.loop.applescript' do
      match %r/\b(?i:continue|return|exit(\s+repeat)?)\b/
    end
    rule 'keyword.other.applescript' do
      match %r/\b(?i:about|above|after|against|and|apart\s+from|around|as|aside\s+from|at|back|before|beginning|behind|below|beneath|beside|between|but|by|considering|contain|contains|contains|copy|div|does|eighth|else|end|equal|equals|error|every|false|fifth|first|for|fourth|from|front|get|given|global|if|ignoring|in|instead\s+of|into|is|it|its|last|local|me|middle|mod|my|ninth|not|of|on|onto|or|out\s+of|over|prop|property|put|ref|reference|repeat|returning|script|second|set|seventh|since|sixth|some|tell|tenth|that|the|then|third|through|thru|timeout|times|to|transaction|true|try|until|where|while|whose|with|without)\b/
    end
  end

  fragment :"built-in.punctuation" do
    rule 'punctuation.separator.continuation.line.applescript' do
      match %r/¬/
    end
    rule 'punctuation.separator.key-value.property.applescript' do
      # the : in property assignments
      match %r/:/
    end
    rule 'punctuation.section.group.applescript' do
      # the parentheses in groups
      match %r/[()]/
    end
  end

  fragment :"built-in.support" do
    rule 'support.function.built-in.property.applescript' do
      match %r/\b(?i:POSIX\s+path|frontmost|id|name|running|version|days?|weekdays?|months?|years?|time|date\s+string|time\s+string|length|rest|reverse|items?|contents|quoted\s+form|characters?|paragraphs?|words?)\b/
    end
    rule 'support.function.built-in.command.applescript' do
      match %r/\b(?i:activate|log|clipboard\s+info|set\s+the\s+clipboard\s+to|the\s+clipboard|info\s+for|list\s+(disks|folder)|mount\s+volume|path\s+to(\s+resource)?|close\s+access|get\s+eof|open\s+for\s+access|read|set\s+eof|write|open\s+location|current\s+date|do\s+shell\s+script|get\s+volume\s+settings|random\s+number|round|set\s+volume|system\s+(attribute|info)|time\s+to\s+GMT|load\s+script|run\s+script|scripting\s+components|store\s+script|copy|count|get|launch|run|set|ASCII\s+(character|number)|localized\s+string|offset|summarize|beep|choose\s+(application|color|file(\s+name)?|folder|from\s+list|remote\s+application|URL)|delay|display\s+(alert|dialog)|say)\b/
    end
    rule 'support.function.built-in.applescript' do
      match %r/\b(?i:get|run)\b/
    end
    rule 'support.class.built-in.applescript' do
      match %r/\b(?i:anything|data|text|upper\s+case|propert(y|ies))\b/
    end
    rule 'support.class.built-in.applescript' do
      match %r/\b(?i:alias|class)(es)?\b/
    end
    rule 'support.class.built-in.applescript' do
      match %r/\b(?i:app(lication)?|boolean|character|constant|date|event|file(\s+specification)?|handler|integer|item|keystroke|linked\s+list|list|machine|number|picture|preposition|POSIX\s+file|real|record|reference(\s+form)?|RGB\s+color|script|sound|text\s+item|type\s+class|vector|writing\s+code(\s+info)?|zone|((international|styled(\s+(Clipboard|Unicode))?|Unicode)\s+)?text|((C|encoded|Pascal)\s+)?string)s?\b/
    end
    rule 'support.class.built-in.unit.applescript' do
      match %r/(?ix)\b
            (  (cubic\s+(centi)?|square\s+(kilo)?|centi|kilo)met(er|re)s
            |  square\s+(yards|feet|miles)|cubic\s+(yards|feet|inches)|miles|inches
            |  lit(re|er)s|gallons|quarts
            |  (kilo)?grams|ounces|pounds
            |  degrees\s+(Celsius|Fahrenheit|Kelvin)
            )
          \b/
    end
    rule 'support.class.built-in.time.applescript' do
      match %r/\b(?i:seconds|minutes|hours|days)\b/
    end
  end

  fragment :comments do
    rule 'comment.line.number-sign.applescript' do
      match %r/^\s*(#!).*$\n?/,
        1 => 'punctuation.definition.comment.applescript'
    end
    rule 'comment.line.double-dash.applescript' do
      match %r/(--).*$\n?/,
        1 => 'punctuation.definition.comment.applescript'
    end
    rule 'comment.block.applescript' do
      from %r/\(\*/
      to %r/\*\)/
      both 0 => 'punctuation.definition.comment.applescript'
      include "#comments.nested"
    end
  end

  fragment :"comments.nested" do
    rule 'comment.block.applescript' do
      from %r/\(\*/
      to %r/\*\)/
      both 0 => 'punctuation.definition.comment.applescript'
      include "#comments.nested"
    end
  end

  fragment :"data-structures" do
    rule 'meta.array.applescript' do
      # We cannot necessarily distinguish "records" from "arrays", and so this could be either.
      from %r/(\{)/
      to %r/(\})/
      both 1 => 'punctuation.section.array.applescript'
      rule do
        match %r/(\w+|((\|)[^|\n]*(\|)))\s*(:)/,
          1 => 'constant.other.key.applescript',
          2 => 'meta.identifier.applescript',
          3 => 'punctuation.definition.identifier.applescript',
          4 => 'punctuation.definition.identifier.applescript',
          5 => 'punctuation.separator.key-value.applescript'
      end
      rule 'punctuation.separator.key-value.applescript' do
        match %r/:/
      end
      rule 'punctuation.separator.array.applescript' do
        match %r/,/
      end
      include "#inline"
    end
    rule 'string.quoted.double.application-name.applescript' do
      from %r/(?:(?<=application )|(?<=app ))(")/
      to %r/(")/
      both 1 => 'punctuation.definition.string.applescript'
      rule 'constant.character.escape.applescript' do
        match %r/\\./
      end
    end
    rule 'string.quoted.double.applescript' do
      from %r/(")/
      to %r/(")/
      both 1 => 'punctuation.definition.string.applescript'
      rule 'constant.character.escape.applescript' do
        match %r/\\./
      end
    end
    rule 'meta.identifier.applescript' do
      match %r/(\|)[^|\n]*(\|)/,
        1 => 'punctuation.definition.identifier.applescript',
        2 => 'punctuation.definition.identifier.applescript'
    end
    rule 'constant.other.data.utxt.applescript' do
      match %r/(«)(data) (utxt|utf8)([[:xdigit:]]*)(»)(?:\s+(as)\s+(?i:Unicode\s+text))?/,
        1 => 'punctuation.definition.data.applescript',
        2 => 'support.class.built-in.applescript',
        3 => 'storage.type.utxt.applescript',
        4 => 'string.unquoted.data.applescript',
        5 => 'punctuation.definition.data.applescript',
        6 => 'keyword.operator.applescript',
        7 => 'support.class.built-in.applescript'
    end
    rule 'constant.other.data.raw.applescript' do
      from %r/(«)(\w+)\b(?=\s)/,
        1 => 'punctuation.definition.data.applescript',
        2 => 'support.class.built-in.applescript'
      to %r/(»)/,
        1 => 'punctuation.definition.data.applescript'
    end
    rule 'invalid.illegal.data.applescript' do
      match %r/(«)[^»]*(»)/,
        1 => 'punctuation.definition.data.applescript',
        2 => 'punctuation.definition.data.applescript'
    end
  end

  fragment :finder do
    rule 'support.class.finder.items.applescript' do
      match %r/\b(item|container|(computer|disk|trash)-object|disk|folder|((alias|application|document|internet location) )?file|clipping|package)s?\b/
    end
    rule 'support.class.finder.window-classes.applescript' do
      match %r/\b((Finder|desktop|information|preferences|clipping) )windows?\b/
    end
    rule 'support.class.finder.type-definitions.applescript' do
      match %r/\b(preferences|(icon|column|list) view options|(label|column|alias list)s?)\b/
    end
    rule 'support.function.finder.items.applescript' do
      match %r/\b(copy|find|sort|clean up|eject|empty( trash)|erase|reveal|update)\b/
    end
    rule 'support.constant.finder.applescript' do
      match %r/\b(insertion location|product version|startup disk|desktop|trash|home|computer container|finder preferences)\b/
    end
    rule 'support.variable.finder.applescript' do
      match %r/\b(visible)\b/
    end
  end

  fragment :inline do
    include "#comments"
    include "#data-structures"
    include "#built-in"
    include "#standardadditions"
  end

  fragment :itunes do
    rule 'support.class.itunes.applescript' do
      match %r/\b(artwork|application|encoder|EQ preset|item|source|visual|(EQ |browser )?window|((audio CD|device|shared|URL|file) )?track|playlist window|((audio CD|device|radio tuner|library|folder|user) )?playlist)s?\b/
    end
    rule 'support.function.itunes.applescript' do
      match %r/\b(add|back track|convert|fast forward|(next|previous) track|pause|play(pause)?|refresh|resume|rewind|search|stop|update|eject|subscribe|update(Podcast|AllPodcasts)|download)\b/
    end
    rule 'support.constant.itunes.applescript' do
      match %r/\b(current (playlist|stream (title|URL)|track)|player state)\b/
    end
    rule 'support.variable.itunes.applescript' do
      match %r/\b(current (encoder|EQ preset|visual)|EQ enabled|fixed indexing|full screen|mute|player position|sound volume|visuals enabled|visual size)\b/
    end
  end

  fragment :"standard-suite" do
    rule 'support.class.standard-suite.applescript' do
      match %r/\b(colors?|documents?|items?|windows?)\b/
    end
    rule 'support.function.standard-suite.applescript' do
      match %r/\b(close|count|delete|duplicate|exists|make|move|open|print|quit|save|activate|select|data size)\b/
    end
    rule 'support.constant.standard-suite.applescript' do
      match %r/\b(name|frontmost|version)\b/
    end
    rule 'support.variable.standard-suite.applescript' do
      match %r/\b(selection)\b/
    end
    rule 'support.class.text-suite.applescript' do
      match %r/\b(attachments?|attribute runs?|characters?|paragraphs?|texts?|words?)\b/
    end
  end

  fragment :standardadditions do
    rule 'support.class.standardadditions.user-interaction.applescript' do
      match %r/\b((alert|dialog) reply)\b/
    end
    rule 'support.class.standardadditions.file.applescript' do
      match %r/\b(file information)\b/
    end
    rule 'support.class.standardadditions.miscellaneous.applescript' do
      match %r/\b(POSIX files?|system information|volume settings)\b/
    end
    rule 'support.class.standardadditions.internet.applescript' do
      match %r/\b(URLs?|internet address(es)?|web pages?|FTP items?)\b/
    end
    rule 'support.function.standardadditions.file.applescript' do
      match %r/\b(info for|list (disks|folder)|mount volume|path to( resource)?)\b/
    end
    rule 'support.function.standardadditions.user-interaction.applescript' do
      match %r/\b(beep|choose (application|color|file( name)?|folder|from list|remote application|URL)|delay|display (alert|dialog)|say)\b/
    end
    rule 'support.function.standardadditions.string.applescript' do
      match %r/\b(ASCII (character|number)|localized string|offset|summarize)\b/
    end
    rule 'support.function.standardadditions.clipboard.applescript' do
      match %r/\b(set the clipboard to|the clipboard|clipboard info)\b/
    end
    rule 'support.function.standardadditions.file-i-o.applescript' do
      match %r/\b(open for access|close access|read|write|get eof|set eof)\b/
    end
    rule 'support.function.standardadditions.scripting.applescript' do
      match %r/\b((load|store|run) script|scripting components)\b/
    end
    rule 'support.function.standardadditions.miscellaneous.applescript' do
      match %r/\b(current date|do shell script|get volume settings|random number|round|set volume|system attribute|system info|time to GMT)\b/
    end
    rule 'support.function.standardadditions.folder-actions.applescript' do
      match %r/\b(opening folder|(closing|moving) folder window for|adding folder items to|removing folder items from)\b/
    end
    rule 'support.function.standardadditions.internet.applescript' do
      match %r/\b(open location|handle CGI request)\b/
    end
  end

  fragment :"system-events" do
    rule 'support.class.system-events.audio-file.applescript' do
      match %r/\b(audio (data|file))\b/
    end
    rule 'support.class.system-events.disk-folder-file.applescript' do
      match %r/\b(alias(es)?|(Classic|local|network|system|user) domain objects?|disk( item)?s?|domains?|file( package)?s?|folders?|items?)\b/
    end
    rule 'support.function.system-events.disk-folder-file.applescript' do
      match %r/\b(delete|open|move)\b/
    end
    rule 'support.class.system-events.folder-actions.applescript' do
      match %r/\b(folder actions?|scripts?)\b/
    end
    rule 'support.function.system-events.folder-actions.applescript' do
      match %r/\b(attach action to|attached scripts|edit action of|remove action from)\b/
    end
    rule 'support.class.system-events.movie-file.applescript' do
      match %r/\b(movie data|movie file)\b/
    end
    rule 'support.function.system-events.power.applescript' do
      match %r/\b(log out|restart|shut down|sleep)\b/
    end
    rule 'support.class.system-events.processes.applescript' do
      match %r/\b(((application |desk accessory )?process|(check|combo )?box)(es)?|(action|attribute|browser|(busy|progress|relevance) indicator|color well|column|drawer|group|grow area|image|incrementor|list|menu( bar)?( item)?|(menu |pop up |radio )?button|outline|(radio|tab|splitter) group|row|scroll (area|bar)|sheet|slider|splitter|static text|table|text (area|field)|tool bar|UI element|window)s?)\b/
    end
    rule 'support.function.system-events.processes.applescript' do
      match %r/\b(click|key code|keystroke|perform|select)\b/
    end
    rule 'support.class.system-events.property-list.applescript' do
      match %r/\b(property list (file|item))\b/
    end
    rule 'support.class.system-events.quicktime-file.applescript' do
      match %r/\b(annotation|QuickTime (data|file)|track)s?\b/
    end
    rule 'support.function.system-events.system-events.applescript' do
      match %r/\b((abort|begin|end) transaction)\b/
    end
    rule 'support.class.system-events.xml.applescript' do
      match %r/\b(XML (attribute|data|element|file)s?)\b/
    end
    rule 'support.class.sytem-events.other.applescript' do
      match %r/\b(print settings|users?|login items?)\b/
    end
  end

  fragment :textmate do
    rule 'support.class.textmate.applescript' do
      match %r/\b(print settings)\b/
    end
    rule 'support.function.textmate.applescript' do
      match %r/\b(get url|insert|reload bundles)\b/
    end
  end
end
