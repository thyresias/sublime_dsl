# encoding: utf-8

language 'Tcl' => 'source.tcl' do
  file_types %w(tcl)
  first_line_match %r'^#!/.*\btclsh\b'
  key_equivalent "^~T"  # TextMate only
  uuid "F01F22AC-7CBB-11D9-9B10-000A95E13C98"  # TextMate only

  rule do
    content_scope "comment.line.number-sign.tcl"
    from %r/(?<=^|;)\s*((#))/,
      1 => 'comment.line.number-sign.tcl',
      2 => 'punctuation.definition.comment.tcl'
    to %r/\n/
    rule do
      match %r/(\\\\|\\\n)/
    end
  end
  rule do
    match %r/(?<=^|[\[{;])\s*(if|while|for|catch|return|break|continue|switch|exit|foreach)\b/,
      1 => 'keyword.control.tcl'
  end
  rule do
    match %r/(?<=^|})\s*(then|elseif|else)\b/,
      1 => 'keyword.control.tcl'
  end
  rule do
    match %r/^\s*(proc)\s+([^\s]+)/,
      1 => 'keyword.other.tcl',
      2 => 'entity.name.function.tcl'
  end
  rule do
    match %r/(?<=^|[\[{;])\s*(after|append|array|auto_execok|auto_import|auto_load|auto_mkindex|auto_mkindex_old|auto_qualify|auto_reset|bgerror|binary|cd|clock|close|concat|dde|encoding|eof|error|eval|exec|expr|fblocked|fconfigure|fcopy|file|fileevent|filename|flush|format|gets|glob|global|history|http|incr|info|interp|join|lappend|library|lindex|linsert|list|llength|load|lrange|lreplace|lsearch|lset|lsort|memory|msgcat|namespace|open|package|parray|pid|pkg::create|pkg_mkIndex|proc|puts|pwd|re_syntax|read|registry|rename|resource|scan|seek|set|socket|SafeBase|source|split|string|subst|Tcl|tcl_endOfWord|tcl_findLibrary|tcl_startOfNextWord|tcl_startOfPreviousWord|tcl_wordBreakAfter|tcl_wordBreakBefore|tcltest|tclvars|tell|time|trace|unknown|unset|update|uplevel|upvar|variable|vwait)\b/,
      1 => 'keyword.other.tcl'
  end
  rule do
    # special-case regexp/regsub keyword in order to handle the expression
    from %r/(?<=^|[\[{;])\s*(regexp|regsub)\b\s*/,
      1 => 'keyword.other.tcl'
    to %r/[\n;]|(?=\])/
    rule 'constant.character.escape.tcl' do
      match %r/\\(?:.|\n)/
    end
    rule do
      # switch for regexp
      match %r/-\w+\s*/
    end
    rule do
      # end of switches
      from %r/--\s*/
      to %r//
      to_last true
      include "#regexp"
    end
    include "#regexp"
  end
  include "#escape"
  include "#variable"
  rule 'string.quoted.double.tcl' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.tcl'
    to %r/"/,
      0 => 'punctuation.definition.string.end.tcl'
    include "#escape"
    include "#variable"
    include "#embedded"
  end

  fragment :"bare-string" do
    rule do
      # matches a single quote-enclosed word without scoping
      from %r/(?:^|(?<=\s))"/
      to %r/"([^\s\]]*)/,
        1 => 'invalid.illegal.tcl'
      include "#escape"
      include "#variable"
    end
  end

  fragment :braces do
    rule do
      # matches a single brace-enclosed word
      from %r/(?:^|(?<=\s))\{/
      to %r/\}([^\s\]]*)/,
        1 => 'invalid.illegal.tcl'
      rule 'constant.character.escape.tcl' do
        match %r/\\[{}\n]/
      end
      include "#inner-braces"
    end
  end

  fragment :embedded do
    rule 'source.tcl.embedded' do
      from %r/\[/,
        0 => 'punctuation.section.embedded.begin.tcl'
      to %r/\]/,
        0 => 'punctuation.section.embedded.end.tcl'
      include "source.tcl"
    end
  end

  fragment :escape do
    rule 'constant.character.escape.tcl' do
      match %r/\\(\d{1,3}|x[a-fA-F0-9]+|u[a-fA-F0-9]{1,4}|.|\n)/
    end
  end

  fragment :"inner-braces" do
    rule do
      # matches a nested brace in a brace-enclosed word
      from %r/\{/
      to %r/\}/
      rule 'constant.character.escape.tcl' do
        match %r/\\[{}\n]/
      end
      include "#inner-braces"
    end
  end

  fragment :regexp do
    rule do
      # matches a single word, named as a regexp, then swallows the rest of the command
      from %r/(?=\S)(?![\n;\]])/
      to %r/(?=[\n;\]])/
      rule 'string.regexp.tcl' do
        from %r/(?=[^ \t\n;])/
        to %r/(?=[ \t\n;])/
        include "#braces"
        include "#bare-string"
        include "#escape"
        include "#variable"
      end
      rule do
        # swallow the rest of the command
        from %r/[ \t]/
        to %r/(?=[\n;\]])/
        include "#variable"
        include "#embedded"
        include "#escape"
        include "#braces"
        include "#string"
      end
    end
  end

  fragment :string do
    rule 'string.quoted.double.tcl' do
      # matches a single quote-enclosed word with scoping
      from %r/(?:^|(?<=\s))(?=")/
      to %r//
      to_last true
      include "#bare-string"
    end
  end

  fragment :variable do
    rule 'variable.other.tcl' do
      match %r/(\$)((?:[a-zA-Z0-9_]|::)+(\([^\)]+\))?|\{[^\}]*\})/,
        1 => 'punctuation.definition.variable.tcl'
    end
  end
end
