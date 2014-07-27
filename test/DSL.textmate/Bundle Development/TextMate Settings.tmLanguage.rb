# encoding: utf-8

language 'TextMate Settings' => 'source.plist.textmate.settings' do
  # FIXME: no file types
  uuid "CF3947B5-C5CE-46A1-8E84-724C6C986861"  # TextMate only

  rule do
    from %r/(?=\{)/
    to %r/(?=not)possible/
    include "#dictionary_root"
    include "#stray"
  end
  include "#stray"

  fragment :array do
    rule 'meta.scope.array.plist' do
      from %r/\G\(/,
        0 => 'punctuation.definition.array.begin.plist'
      to %r/\)/,
        0 => 'punctuation.definition.array.end.plist'
      include "#array_item"
      include "#stray"
    end
  end

  fragment :array_item do
    rule 'meta.scope.array-item.plist' do
      from %r/(?=<|\(|\{|"|'|[-a-zA-Z0-9_.])/
      to %r/,|(?=\))/,
        0 => 'punctuation.separator.array.plist'
      include "#dictionary"
      include "#array"
      include "#string"
      include "#stray"
    end
  end

  fragment :dictionary do
    rule 'meta.scope.dictionary.plist' do
      from %r/\G\{/,
        0 => 'punctuation.definition.dictionary.begin.plist'
      to %r/\}/,
        0 => 'punctuation.definition.dictionary.end.plist'
      include "#dictionary_item"
      include "#stray"
    end
  end

  fragment :dictionary_item do
    rule 'meta.scope.dictionary-item.${3/[[\s\x20-\x7F]&&[:^alnum:]]//g}${7/[[\s\x20-\x7F]&&[:^alnum:]]//g}${9/[[\s\x20-\x7F]&&[:^alnum:]]//g}.plist' do
      from %r/(?>((")((?:[^"\\]|\\.)*)("))|((')((?:[^'\\]|\\.)*)('))|([-a-zA-Z0-9_.]+))/,
        1 => 'string.quoted.double.plist',
        2 => 'punctuation.definition.string.begin.plist',
        3 => 'constant.other.key.plist',
        4 => 'punctuation.definition.string.end.plist',
        5 => 'string.quoted.single.plist',
        6 => 'punctuation.definition.string.begin.plist',
        7 => 'constant.other.key.plist',
        8 => 'punctuation.definition.string.end.plist',
        9 => 'constant.other.key.plist'
      to %r/;|(?=\})/,
        0 => 'punctuation.separator.dictionary.plist'
      include "#dictionary_item_contents"
    end
  end

  fragment :dictionary_item_contents do
    rule do
      from %r/=/
      to %r/(?=;|\})/
      rule do
        from %r/(?=<|\(|\{|"|'|[-a-zA-Z0-9_.])/
        to %r/(?=;|\})/
        include "#dictionary"
        include "#array"
        include "#string"
        include "#stray"
      end
      include "#stray_alpha"
    end
    include "#stray"
  end

  fragment :dictionary_root do
    rule 'meta.scope.dictionary.plist' do
      from %r/\G\{/,
        0 => 'punctuation.definition.dictionary.begin.plist'
      to %r/\}/,
        0 => 'punctuation.definition.dictionary.end.plist'
      rule 'meta.scope.dictionary-item.$0.plist' do
        from %r/comment/,
          0 => 'constant.other.key.plist'
        to %r/;|(?=\})/,
          0 => 'punctuation.separator.dictionary.plist'
        rule do
          from %r/=/
          to %r/(?=;|\})/
          rule do
            from %r/(?="|')/
            to %r/(?=;|\})/
            rule 'comment.block.plist' do
              from %r/\G'/,
                0 => 'punctuation.definition.comment.begin.plist'
              to %r/'(?!')/,
                0 => 'punctuation.definition.comment.end.plist'
              rule 'constant.character.escape.plist' do
                match %r/''/
              end
            end
            rule 'comment.block.plist' do
              from %r/\G"/,
                0 => 'punctuation.definition.comment.begin.plist'
              to %r/"/,
                0 => 'punctuation.definition.comment.end.plist'
              rule 'constant.character.escape.plist' do
                match %r/\\("|\\)/
              end
            end
            include "#stray"
          end
          include "#stray"
        end
        include "#stray"
      end
      rule 'meta.scope.dictionary-item.$0.plist' do
        from %r/completionCommand|characterClass|background|foreground|caret|invisibles|selection|fontStyle|fontName|indentOnPaste|wordCharacters/,
          0 => 'constant.other.key.plist'
        to %r/;|(?=\})/,
          0 => 'punctuation.separator.dictionary.plist'
        rule do
          from %r/=/
          to %r/(?=;|\})/
          rule do
            from %r/(?="|'|[-a-zA-Z0-9_.])/
            to %r/(?=;|\})/
            include "#string"
            include "#stray_alpha"
          end
          include "#stray_alpha"
        end
        include "#stray"
      end
      rule 'meta.scope.dictionary-item.$0.plist' do
        from %r/indentedSoftWrap/,
          0 => 'constant.other.key.plist'
        to %r/;|(?=\})/,
          0 => 'punctuation.separator.dictionary.plist'
        rule do
          from %r/=/
          to %r/(?=;|\})/
          rule do
            from %r/(?=\{)/
            to %r/(?=;|\})/
            rule 'meta.scope.dictionary.plist' do
              from %r/\G\{/,
                0 => 'punctuation.definition.dictionary.begin.plist'
              to %r/\}/,
                0 => 'punctuation.definition.dictionary.end.plist'
              rule 'meta.scope.dictionary-item.$0.plist' do
                from %r/match/,
                  0 => 'constant.other.key.plist'
                to %r/;|(?=\})/,
                  0 => 'punctuation.separator.dictionary.plist'
                rule do
                  from %r/=/
                  to %r/(?=;|\})/
                  rule do
                    from %r/(?="|')/
                    to %r/(?=;|\})/
                    include "#string_regexp"
                    include "#stray"
                  end
                  include "#stray_alpha"
                end
                include "#stray"
              end
              rule 'meta.scope.dictionary-item.$0.plist' do
                from %r/format/,
                  0 => 'constant.other.key.plist'
                to %r/;|(?=\})/,
                  0 => 'punctuation.separator.dictionary.plist'
                rule do
                  from %r/=/
                  to %r/(?=;|\})/
                  rule do
                    from %r/(?="|'|[-a-zA-Z0-9_.])/
                    to %r/(?=;|\})/
                    include "#string"
                    include "#stray_alpha"
                  end
                  include "#stray_alpha"
                end
                include "#stray"
              end
              rule 'meta.scope.dictionary-item.${3/[[\s\x20-\x7F]&&[:^alnum:]]//g}${7/[[\s\x20-\x7F]&&[:^alnum:]]//g}${9/[[\s\x20-\x7F]&&[:^alnum:]]//g}.plist' do
                from %r/(?>((")((?:[^"\\]|\\.)*)("))|((')((?:[^'\\]|\\.)*)('))|([-a-zA-Z0-9_.]+))/,
                  1 => 'string.quoted.double.plist',
                  2 => 'punctuation.definition.string.begin.plist',
                  3 => 'invalid.illegal.invalid_key.plist',
                  4 => 'punctuation.definition.string.end.plist',
                  5 => 'string.quoted.single.plist',
                  6 => 'punctuation.definition.string.begin.plist',
                  7 => 'invalid.illegal.invalid_key.plist',
                  8 => 'punctuation.definition.string.end.plist',
                  9 => 'invalid.illegal.invalid_key.plist'
                to %r/;|(?=\})/,
                  0 => 'punctuation.separator.dictionary.plist'
                include "#dictionary_item_contents"
              end
              include "#stray"
            end
            include "#stray"
          end
          include "#stray"
        end
        include "#stray"
      end
      rule 'meta.scope.dictionary-item.$0.plist' do
        from %r/fontSize/,
          0 => 'constant.other.key.plist'
        to %r/;|(?=\})/,
          0 => 'punctuation.separator.dictionary.plist'
        rule do
          from %r/=/
          to %r/(?=;|\})/
          rule do
            from %r/(?="|'|[-a-zA-Z0-9_.])/
            to %r/(?=;|\})/
            rule 'string.quoted.single.plist' do
              from %r/\G'/,
                0 => 'punctuation.definition.string.begin.plist'
              to %r/'(?!')/,
                0 => 'punctuation.definition.string.end.plist'
              rule do
                match %r/\G([0-9]+(\.[0-9]+)?)([ ]?(%|pt|em))?/,
                  1 => 'constant.numeric.plist',
                  3 => 'keyword.other.unit.plist'
              end
            end
            rule 'string.quoted.double.plist' do
              from %r/\G"/,
                0 => 'punctuation.definition.string.begin.plist'
              to %r/"/,
                0 => 'punctuation.definition.string.end.plist'
              rule 'constant.numeric.plist' do
                match %r/\G[0-9]+(\.[0-9]+)?[ ]?(%|pt|em)?/
              end
            end
            include "#stray_alpha"
          end
          include "#stray"
        end
        include "#stray"
      end
      rule 'meta.scope.dictionary-item.$0.plist' do
        from %r/completions|highlightPairs|smartTypingPairs|shellVariables/,
          0 => 'constant.other.key.plist'
        to %r/;|(?=\})/,
          0 => 'punctuation.separator.dictionary.plist'
        rule do
          from %r/=/
          to %r/(?=;|\})/
          rule do
            from %r/(?=\()/
            to %r/(?=;|\})/
            include "#array"
            include "#stray"
          end
          include "#stray"
        end
        include "#stray"
      end
      rule 'meta.scope.dictionary-item.$0.plist' do
        from %r/disableDefaultCompletion|showInSymbolList|spellChecking|disableIndentCorrections|misspelled|bold|italic|underline|softWrap/,
          0 => 'constant.other.key.plist'
        to %r/;|(?=\})/,
          0 => 'punctuation.separator.dictionary.plist'
        rule do
          from %r/=/
          to %r/(?=;|\})/
          rule do
            from %r/(?=[01])/
            to %r/(?=;|\})/
            rule 'constant.numeric.plist' do
              match %r/\G[01]/
            end
            include "#stray_alpha"
          end
          rule do
            from %r/(?=['"])/
            to %r/(?=;|\})/
            rule 'string.quoted.single.plist' do
              match %r/(')([01])(')/,
                1 => 'punctuation.definition.string.begin.plist',
                2 => 'constant.numeric.plist',
                3 => 'punctuation.definition.string.end.plist'
            end
            rule 'string.quoted.double.plist' do
              match %r/(")([01])(")/,
                1 => 'punctuation.definition.string.begin.plist',
                2 => 'constant.numeric.plist',
                3 => 'punctuation.definition.string.end.plist'
            end
            include "#stray_alpha"
          end
          rule do
            from %r/(?=:)/
            to %r/(?=;|\})/
            rule 'constant.language.boolean.plist' do
              match %r/\G:(true|false)/
            end
            include "#stray_alpha"
          end
          include "#stray"
        end
        include "#stray"
      end
      rule 'meta.scope.dictionary-item.$0.plist' do
        from %r/symbolTransformation|decreaseIndentPattern|increaseIndentPattern|indentNextLinePattern|unIndentedLinePattern|zeroIndentPattern|foldingStartMarker|foldingStopMarker|foldingIndentedBlockIgnore|foldingIndentedBlockStart/,
          0 => 'constant.other.key.plist'
        to %r/;|(?=\})/,
          0 => 'punctuation.separator.dictionary.plist'
        rule do
          from %r/=/
          to %r/(?=;|\})/
          rule do
            from %r/(?="|')/
            to %r/(?=;|\})/
            include "#string_regexp"
            include "#stray"
          end
          include "#stray_alpha"
        end
        include "#stray"
      end
      rule 'meta.scope.dictionary-item.${3/[[\s\x20-\x7F]&&[:^alnum:]]//g}${7/[[\s\x20-\x7F]&&[:^alnum:]]//g}${9/[[\s\x20-\x7F]&&[:^alnum:]]//g}.plist' do
        from %r/(?>((")((?:[^"\\]|\\.)*)("))|((')((?:[^'\\]|\\.)*)('))|([-a-zA-Z0-9_.]+))/,
          1 => 'string.quoted.double.plist',
          2 => 'punctuation.definition.string.begin.plist',
          3 => 'invalid.illegal.invalid_key.plist',
          4 => 'punctuation.definition.string.end.plist',
          5 => 'string.quoted.single.plist',
          6 => 'punctuation.definition.string.begin.plist',
          7 => 'invalid.illegal.invalid_key.plist',
          8 => 'punctuation.definition.string.end.plist',
          9 => 'invalid.illegal.invalid_key.plist'
        to %r/;|(?=\})/,
          0 => 'punctuation.separator.dictionary.plist'
        include "#dictionary_item_contents"
      end
      include "#stray"
    end
  end

  fragment :stray do
    rule 'invalid.illegal.character-not-allowed-here.plist' do
      from %r/\S/
      to %r:(?=\{|\(|/\*|//|"|'|<|,|;|\)|\}|=):
    end
  end

  fragment :stray_alpha do
    rule 'invalid.illegal.character-not-allowed-here.plist' do
      from %r/\S/
      to %r:(?=\{|\(|/\*|//|"|'|<|,|;|\)|\}|=|\b[a-zA-Z0-9]|[-_.]):
    end
  end

  fragment :string do
    rule 'string.quoted.single.plist' do
      from %r/\G'/,
        0 => 'punctuation.definition.string.begin.plist'
      to %r/'(?!')/,
        0 => 'punctuation.definition.string.end.plist'
      rule 'constant.character.escape.plist' do
        match %r/''/
      end
    end
    rule 'string.quoted.double.plist' do
      from %r/\G"/,
        0 => 'punctuation.definition.string.begin.plist'
      to %r/"/,
        0 => 'punctuation.definition.string.end.plist'
      rule 'constant.character.escape.plist' do
        match %r/\\("|\\)/
      end
    end
    rule 'constant.numeric.plist' do
      match %r/\G[-+]?\d+(\.\d*)?(E[-+]\d+)?(?!\w)/
    end
    rule 'string.unquoted.plist' do
      match %r/\G[-a-zA-Z0-9_.]+/
    end
  end

  fragment :string_regexp do
    rule 'string.regexp.plist' do
      from %r/\G'/,
        0 => 'punctuation.definition.string.begin.plist'
      to %r/'(?!')/,
        0 => 'punctuation.definition.string.end.plist'
      rule 'constant.character.escape.plist' do
        match %r/''/
      end
      include "source.regexp.oniguruma"
    end
    rule 'string.regexp.plist' do
      from %r/\G"/,
        0 => 'punctuation.definition.string.begin.plist'
      to %r/"/,
        0 => 'punctuation.definition.string.end.plist'
      rule 'constant.character.escape.plist' do
        match %r/\\("|\\)/
      end
      include "source.regexp.oniguruma"
    end
  end
end
