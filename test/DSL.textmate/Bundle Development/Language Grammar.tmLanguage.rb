# encoding: utf-8

language 'Language Grammar' => 'source.plist.textmate.grammar' do
  file_types %w(textmate)
  first_line_match %r/^\{\s*scopeName = .*$/
  key_equivalent "^~L"  # TextMate only
  uuid "101D6FC2-6CBD-11D9-B329-000D93347A42"  # TextMate only

  rule do
    from %r/(\{)/
    to %r/(\})/
    both 1 => 'punctuation.section.dictionary.plist'
    include "#comment"
    rule 'meta.value-pair.scopename.plist' do
      # scopeName
      from %r/\b(scopeName)\s*(=)/,
        1 => 'support.constant.plist',
        2 => 'punctuation.section.dictionary.plist'
      to %r/(;)/,
        1 => 'punctuation.section.dictionary.plist'
      include "#comment"
      include "#scope-root"
      include "#catch-all"
    end
    rule do
      # fileTypes
      from %r/\b(fileTypes)\s*(=)/,
        1 => 'support.constant.plist',
        2 => 'punctuation.separator.key-value.plist'
      to %r/(;)/,
        1 => 'punctuation.terminator.dictionary.plist'
      rule do
        from %r/(\()/
        to %r/(\))/
        both 1 => 'punctuation.section.array.plist'
        include "#comment"
        rule do
          from %r/(?=[^\s,])/
          to %r/(,)|(?=\))/,
            1 => 'punctuation.separator.array.plist'
          include "#comment"
          rule do
            match %r'\s+(?=//|/\*)'
          end
          rule 'invalid.illegal.missing-comma.plist' do
            from %r/[[^\n]&&\s](?!\s*(,|\)|$)).*/
            to %r/^$not possible$^/
          end
          include "#string"
        end
        include "#catch-all"
      end
    end
    rule do
      # firstLineMatch, foldingStartMarker, foldingStopMarker
      from %r/\b(firstLineMatch|folding(Start|Stop)Marker)\s*(=)/,
        1 => 'support.constant.plist',
        3 => 'punctuation.separator.key-value.plist'
      to %r/(;)/,
        1 => 'punctuation.terminator.dictionary.plist'
      include "#comment"
      include "#regexp"
      include "#catch-all"
    end
    include "#patterns"
    include "#repository"
    include "#injections"
    include "#comment-keyword"
    include "#invalid-keyword"
    include "#string"
    rule do
      from %r/(=)/,
        1 => 'punctuation.separator.key-value.plist'
      to %r/(;)/,
        1 => 'punctuation.terminator.dictionary.plist'
      include "#any"
    end
    rule 'punctuation.terminator.dictionary.plist' do
      match %r/;/
    end
    include "#catch-all"
  end

  fragment :any do
    include "#comment"
    include "#string"
    include "#array"
    include "#dictionary"
    include "#catch-all"
  end

  fragment :array do
    rule do
      from %r/(\()/
      to %r/(\))/
      both 1 => 'punctuation.section.array.plist'
      include "#comment"
      rule do
        from %r/(?=[^\s,])/
        to %r/(,)|(?=\))/,
          1 => 'punctuation.separator.array.plist'
        include "#comment"
        rule do
          match %r'\s+(?=//|/\*)'
        end
        rule 'invalid.illegal.missing-comma.plist' do
          from %r/[[^\n]&&\s](?!\s*(,|\)|$)).*/
          to %r/^$not possible$^/
        end
        include "#any"
      end
      include "#catch-all"
    end
  end

  fragment :"catch-all" do
    rule do
      match %r/\s+/
    end
    rule 'invalid.illegal.unrecognized-character.plist' do
      match %r/./
    end
  end

  fragment :comment do
    rule 'comment.block.plist' do
      from %r'/\*'
      to %r'\*/'
    end
    rule 'comment.line.double-slash.plist' do
      match %r'//.*$\n?'
    end
  end

  fragment :"comment-keyword" do
    rule do
      from %r/\b(comment)\s*(=)/,
        1 => 'support.constant.plist',
        2 => 'punctuation.separator.key-value.plist'
      to %r/(;)/,
        1 => 'punctuation.terminator.dictionary.plist'
      include "#comment"
      rule 'string.quoted.single.plist' do
        content_scope "comment.block.string.plist"
        from %r/(')/,
          1 => 'punctuation.definition.string.begin.plist'
        to %r/(')(?!')/,
          1 => 'punctuation.definition.string.end.plist'
        to_last true
        rule 'constant.character.escape.apostrophe.plist' do
          match %r/''/
        end
      end
      rule 'string.quoted.double.plist' do
        content_scope "comment.block.string.plist"
        from %r/(")/,
          1 => 'punctuation.definition.string.begin.plist'
        to %r/(")/,
          1 => 'punctuation.definition.string.end.plist'
        rule 'constant.character.escape.plist' do
          match %r/\\[\\"]/
        end
      end
      include "#catch-all"
    end
  end

  fragment :dictionary do
    rule do
      from %r/(\{)/
      to %r/(\})/
      both 1 => 'punctuation.section.dictionary.plist'
      include "#comment"
      include "#string"
      rule do
        from %r/(=)/,
          1 => 'punctuation.separator.key-value.plist'
        to %r/(;)/,
          1 => 'punctuation.terminator.dictionary.plist'
        include "#any"
      end
      rule 'punctuation.terminator.dictionary.plist' do
        match %r/;/
      end
      include "#catch-all"
    end
  end

  fragment :injections do
    rule 'meta.dictionary.injections.plist' do
      # injections
      from %r/\b(injections)\s*(=)/,
        1 => 'support.constant.injections.plist',
        2 => 'punctuation.separator.key-value.plist'
      to %r/(;)/,
        1 => 'punctuation.terminator.dictionary.plist'
      rule do
        from %r/(\{)/
        to %r/(\})/
        both 1 => 'punctuation.section.dictionary.plist'
        include "#comment"
        rule 'meta.value-pair.repository-item.plist' do
          from %r/(["']?)([^=]*)\1\s*(=)/,
            3 => 'punctuation.separator.key-value.plist'
          to %r/(;)/,
            1 => 'punctuation.terminator.dictionary.plist'
          include "#comment"
          include "#rule"
          include "#catch-all"
        end
        include "#catch-all"
      end
    end
  end

  fragment :"invalid-keyword" do
    rule 'invalid.illegal.constant.misplaced-keyword.plist' do
      match %r/\b(fileTypes|foldingStartMarker|foldingStopMarker|patterns|match|begin|end|include|scopeName|captures|beginCaptures|endCaptures|firstLineMatch|comment|repository|disabled|contentName|applyEndPatternLast)\b(?=\s*=)/
    end
    rule 'invalid.deprecated.constant.plist' do
      match %r/\b(swallow|mode)\b(?=\s*=)/
    end
    rule 'invalid.illegal.constant.outdated.plist' do
      match %r/\b(foregroundColor|backgroundColor|fontStyle|elementForegroundColor|elementBackgroundColor|elementFontStyle|highlightPairs|smartTypingPairs|increaseIndentPattern)\b(?=\s*=)/
    end
    rule 'invalid.illegal.constant.unknown-keyword.plist' do
      match %r/[-a-zA-Z_.]+(?=\s*=)/
    end
  end

  fragment :patterns do
    rule 'meta.array.patterns.plist' do
      from %r/\b(patterns)\s*(=)/,
        1 => 'support.constant.plist',
        2 => 'punctuation.separator.key-value.plist'
      to %r/(;)/,
        1 => 'punctuation.terminator.dictionary.plist'
      include "#comment"
      rule do
        from %r/(\()/
        to %r/(\))/
        both 1 => 'punctuation.section.array.plist'
        include "#comment"
        rule do
          from %r/(?=[^\s,])/
          to %r/(,)|(?=\))/,
            1 => 'punctuation.separator.array.plist'
          include "#comment"
          rule do
            match %r'\s+(?=//|/\*)'
          end
          rule 'invalid.illegal.missing-comma.plist' do
            from %r/[[^\n]&&\s](?!\s*(,|\)|$)).*/
            to %r/^$not possible$^/
          end
          include "#rule"
          include "#catch-all"
        end
        include "#catch-all"
      end
      include "#catch-all"
    end
  end

  fragment :regexp do
    rule 'string.regexp.oniguruma.single.plist' do
      from %r/(')/,
        1 => 'punctuation.definition.string.begin.plist'
      to %r/(')(?!')/,
        1 => 'punctuation.definition.string.end.plist'
      rule 'constant.character.escape.apostrophe.plist' do
        match %r/''/
      end
      include "source.regexp.oniguruma"
    end
    rule 'string.regexp.oniguruma.double.plist' do
      from %r/(")/,
        1 => 'punctuation.definition.string.begin.plist'
      to %r/(")/,
        1 => 'punctuation.definition.string.end.plist'
      rule 'constant.character.escape.plist' do
        match %r/\\\\|\\"/
      end
      include "source.regexp.oniguruma"
    end
  end

  fragment :repository do
    rule 'meta.dictionary.repository.plist' do
      # repository
      from %r/\b(repository)\s*(=)/,
        1 => 'support.constant.repository.plist',
        2 => 'punctuation.separator.key-value.plist'
      to %r/(;)/,
        1 => 'punctuation.terminator.dictionary.plist'
      rule do
        from %r/(\{)/
        to %r/(\})/
        both 1 => 'punctuation.section.dictionary.plist'
        include "#comment"
        rule 'meta.value-pair.repository-item.plist' do
          from %r/(["']?)([-a-zA-Z0-9._]+)\1\s*(=)/,
            2 => 'entity.name.section.repository.plist',
            3 => 'punctuation.separator.key-value.plist'
          to %r/(;)/,
            1 => 'punctuation.terminator.dictionary.plist'
          include "#comment"
          include "#rule"
          include "#catch-all"
        end
        include "#string"
        rule do
          from %r/(=)/,
            1 => 'punctuation.separator.key-value.plist'
          to %r/(;)/,
            1 => 'punctuation.terminator.dictionary.plist'
          include "#any"
        end
        rule 'punctuation.terminator.dictionary.plist' do
          match %r/;/
        end
        include "#catch-all"
      end
    end
  end

  fragment :rule do
    rule 'meta.dictionary.rule.plist' do
      from %r/(\{)/
      to %r/(\})/
      both 1 => 'punctuation.section.dictionary.plist'
      include "#comment"
      include "#repository"
      include "#injections"
      rule 'meta.value-pair.plist' do
        # name, contentName
        from %r/\b((contentN|n)ame)\s*(=)/,
          1 => 'support.constant.plist',
          3 => 'punctuation.separator.key-value.plist'
        to %r/(;)/,
          1 => 'punctuation.terminator.dictionary.plist'
        include "#comment"
        include "#scope"
        include "#catch-all"
      end
      rule do
        # begin, end, while, match
        from %r/\b(begin|end|while|match)\s*(=)/,
          1 => 'support.constant.plist',
          2 => 'punctuation.separator.key-value.plist'
        to %r/(;)/,
          1 => 'punctuation.terminator.dictionary.plist'
        include "#comment"
        include "#regexp"
        include "#catch-all"
      end
      rule do
        # include
        from %r/\b(include)\s*(=)/,
          1 => 'support.constant.plist',
          2 => 'punctuation.separator.key-value.plist'
        to %r/(;)/,
          1 => 'punctuation.terminator.dictionary.plist'
        include "#comment"
        rule 'string.quoted.single.include.plist' do
          match %r/(')(?:((#)[-a-zA-Z0-9._]+)|((\$)(?:base|self)))?(')/,
            1 => 'punctuation.definition.string.begin.plist',
            2 => 'constant.other.reference.repository-item.plist',
            3 => 'punctuation.definition.constant.plist',
            4 => 'constant.other.reference.grammar.plist',
            5 => 'punctuation.definition.constant.plist',
            6 => 'punctuation.definition.string.end.plist'
        end
        rule 'string.quoted.double.include.plist' do
          match %r/(')(?:((#)[-a-zA-Z0-9._]+)|((\$)(?:base|self)))?(')/,
            1 => 'punctuation.definition.string.begin.plist',
            2 => 'constant.other.reference.repository-item.plist',
            3 => 'punctuation.definition.constant.plist',
            4 => 'constant.other.reference.grammar.plist',
            5 => 'punctuation.definition.constant.plist',
            6 => 'punctuation.definition.string.end.plist'
        end
        include "#scope-root"
        include "#catch-all"
      end
      rule 'meta.dictionary.captures.plist' do
        # captures
        from %r/\b((beginC|endC|whileC|c)aptures)\s*(=)/,
          1 => 'support.constant.plist',
          3 => 'punctuation.separator.key-value.plist'
        to %r/(;)/,
          1 => 'punctuation.terminator.dictionary.plist'
        rule do
          from %r/(\{)/
          to %r/(\})/
          both 1 => 'punctuation.section.dictionary.plist'
          include "#comment"
          include "#string"
          rule do
            from %r/(=)/,
              1 => 'punctuation.separator.key-value.plist'
            to %r/(;)/,
              1 => 'punctuation.terminator.dictionary.plist'
            include "#comment"
            rule do
              from %r/(\{)/
              to %r/(\})/
              both 1 => 'punctuation.section.dictionary.plist'
              include "#comment"
              include "#comment-keyword"
              rule 'meta.value-pair.plist' do
                # name
                from %r/\b(name)\s*(=)/,
                  1 => 'support.constant.plist',
                  2 => 'punctuation.separator.key-value.plist'
                to %r/(;)/,
                  1 => 'punctuation.terminator.dictionary.plist'
                include "#comment"
                include "#scope"
                include "#catch-all"
              end
              include "#patterns"
            end
            include "#catch-all"
          end
          rule 'punctuation.terminator.dictionary.plist' do
            match %r/;/
          end
          include "#catch-all"
        end
      end
      rule do
        # disabled, applyEndPatternLast
        match %r/\b(disabled|applyEndPatternLast)\s*(=)\s*(?:(0|1)|((")(0|1)("))|((')(0|1)(')))\s*(;)/,
          1 => 'support.constant.plist',
          2 => 'punctuation.separator.key-value.plist',
          3 => 'constant.numeric.plist',
          4 => 'string.quoted.double.plist',
          5 => 'punctuation.definition.string.begin.plist',
          6 => 'constant.numeric.plist',
          7 => 'punctuation.definition.string.end.plist',
          8 => 'string.quoted.single.plist',
          9 => 'punctuation.definition.string.begin.plist',
          10 => 'constant.numeric.plist',
          11 => 'punctuation.definition.string.end.plist',
          12 => 'punctuation.terminator.dictionary.plist'
      end
      include "#patterns"
      include "#comment-keyword"
      include "#invalid-keyword"
      include "#string"
      rule do
        from %r/(=)/,
          1 => 'punctuation.separator.key-value.plist'
        to %r/(;)/,
          1 => 'punctuation.terminator.dictionary.plist'
        include "#any"
      end
      rule 'punctuation.terminator.dictionary.plist' do
        match %r/;/
      end
      include "#catch-all"
    end
  end

  fragment :scope do
    rule 'string.quoted.single.scope.plist' do
      match %r/(?x)
            (')                # Open String
              (              # Optionally match the valid
                            # scopes, and the following
                            # part of the scope, meaning
                            # anything else is invalid
                comment(?:
                  \.(?:line|block)
                )?
                | constant(?:
                  \.(?:numeric|character|language|other)
                )?
                | entity(?:
                  \.name(?:
                    \.(?:function|type|tag|section)
                  )?
                  | \.other(?:
                    \.(?:inherited-class|attribute-name)
                  )?
                )?
                | invalid(?:
                  \.(?:illegal|deprecated)
                )?
                | keyword(?:
                  \.(?:control|operator|other)
                )?
                | markup(?:
                  \.(?:underline|bold|heading|italic|list|quote|raw|other)
                )?
                | meta
                | punctuation(?:
                  \.(?:definition|section|separator|terminator|whitespace)
                )?
                | source
                | storage(?:
                  \.(?:type|modifier)
                )?
                | string(?:
                  \.(?:
                    quoted(?:
                      \.(?:single|double|triple|other)
                    )?
                    | (?:unquoted|interpolated|regexp|other)
                  )
                )?
                | support(?:
                  \.(?:function|class|type|constant|variable|other)
                )?
                | text
                | variable(?:
                  \.(?:parameter|language|other)
                )?
              )?
              ((?<!')[^\s,()&|\[\]:"'{}<>*?=^;#]*(?<!\.))?
              ([^']*)?
            (')                # Close String
          /,
        1 => 'punctuation.definition.string.begin.plist',
        2 => 'constant.other.scope.plist',
        3 => 'constant.other.scope.plist',
        4 => 'invalid.deprecated.scope_not_allowed.plist',
        5 => 'punctuation.definition.string.end.plist'
    end
    rule 'string.quoted.double.scope.plist' do
      match %r/(?x)
            (")                # Open String
              (              # Optionally match the valid
                            # scopes, and the following
                            # part of the scope, meaning
                            # anything else is invalid
                comment(?:
                  \.(?:line|block)
                )?
                | constant(?:
                  \.(?:numeric|character|language|other)
                )?
                | entity(?:
                  \.name(?:
                    \.(?:function|type|tag|section)
                  )?
                  | \.other(?:
                    \.(?:inherited-class|attribute-name)
                  )?
                )?
                | invalid(?:
                  \.(?:illegal|deprecated)
                )?
                | keyword(?:
                  \.(?:control|operator|other)
                )?
                | markup(?:
                  \.(?:underline|bold|heading|italic|list|quote|raw|other)
                )?
                | meta
                | punctuation(?:
                  \.(?:definition|section|separator|terminator|whitespace)
                )?
                | source
                | storage(?:
                  \.(?:type|modifier)
                )?
                | string(?:
                  \.(?:
                    quoted(?:
                      \.(?:single|double|triple|other)
                    )?
                    | (?:unquoted|interpolated|regexp|other)
                  )
                )?
                | support(?:
                  \.(?:function|class|type|constant|variable|other)
                )?
                | text
                | variable(?:
                  \.(?:parameter|language|other)
                )?
              )?
              ((?<!")[^\s,()&|\[\]:"'{}<>*?=^;#]*(?<!\.))?
              ([^"]*)?
            (")                # Close String
          /,
        1 => 'punctuation.definition.string.begin.plist',
        2 => 'constant.other.scope.plist',
        3 => 'constant.other.scope.plist',
        4 => 'invalid.deprecated.scope_not_allowed.plist',
        5 => 'punctuation.definition.string.end.plist'
    end
  end

  fragment :"scope-root" do
    rule 'string.quoted.single.scope.root.plist' do
      match %r/(')(?:((?:source|text)\.[^\s,()&|\[\]:"'{}<>*?=^;#]*)([^']*)|([^']*))(')/,
        1 => 'punctuation.definition.string.begin.plist',
        2 => 'constant.other.scope.plist',
        3 => 'invalid.deprecated.scope_not_allowed.plist',
        4 => 'invalid.deprecated.scope_not_allowed.plist',
        5 => 'punctuation.definition.string.end.plist'
    end
    rule 'string.quoted.double.scope.root.plist' do
      match %r/(")(?:((?:source|text)\.[^\s,()&|\[\]:"'{}<>*?=^;#]*)([^"]*)|([^"]*))(")/,
        1 => 'punctuation.definition.string.begin.plist',
        2 => 'constant.other.scope.plist',
        3 => 'invalid.deprecated.scope_not_allowed.plist',
        4 => 'invalid.deprecated.scope_not_allowed.plist',
        5 => 'punctuation.definition.string.end.plist'
    end
  end

  fragment :string do
    rule 'constant.numeric.plist' do
      match %r/\b[0-9]+\b/
    end
    rule 'string.unquoted.plist' do
      match %r/[-a-zA-Z0-9_.]+/
    end
    rule 'string.quoted.single.plist' do
      from %r/(')/,
        1 => 'punctuation.definition.string.begin.plist'
      to %r/('(?!'))/,
        1 => 'punctuation.definition.string.end.plist'
      to_last true
      rule 'constant.character.escape.apostrophe.plist' do
        match %r/''/
      end
    end
    rule 'string.quoted.double.plist' do
      from %r/(")/,
        1 => 'punctuation.definition.string.begin.plist'
      to %r/(")/,
        1 => 'punctuation.definition.string.end.plist'
      rule 'constant.character.escape.plist' do
        match %r/\\[\\"]/
      end
    end
  end
end
