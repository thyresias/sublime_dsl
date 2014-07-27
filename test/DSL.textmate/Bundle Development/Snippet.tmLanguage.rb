# encoding: utf-8

language 'Snippet' => 'text.tm-snippet' do
  # FIXME: no file types
  uuid "95BE73A9-82E2-493A-B467-013B4B2ECAD2"  # TextMate only

  rule 'constant.character.escape.tm-snippet' do
    match %r/\\\$|\\`|\\\\/
  end
  include "#interpolation"
  include "#variables"
  include "#transformations"
  include "#tab_stops"

  fragment :interpolation do
    rule 'string.interpolated.bash.tm-snippet' do
      from %r/`/
      to %r/`/
      both 0 => 'punctuation.definition.string.begin.tm-snippet'
      rule 'constant.character.escape.tm-snippet' do
        match %r/\\`|\\\\/
      end
    end
  end

  fragment :tab_stops do
    # FINISHED
    rule 'variable.other.predefined.placeholder.endpoint.tm-snippet' do
      # $0 | ${0}
      match %r/(\$)(0(?!=\d)|(\{)0(?!=\d)(\}))/,
        1 => 'punctuation.definition.variable.begin.tm-snippet',
        3 => 'punctuation.definition.variable.begin.tm-snippet',
        4 => 'punctuation.definition.variable.end.tm-snippet'
    end
    rule 'variable.other.predefined.placeholder.tm-snippet' do
      match %r/(\$)\d+/,
        1 => 'punctuation.definition.variable.begin.tm-snippet'
    end
    rule 'variable.other.predefined.placeholder.tm-snippet' do
      match %r/(\$\{)\d+(\})/,
        1 => 'punctuation.definition.variable.begin.tm-snippet',
        2 => 'punctuation.definition.variable.end.tm-snippet'
    end
    rule 'variable.other.predefined.placeholder.w-default.tm-snippet' do
      from %r/(\$\{)\d+(:)/,
        1 => 'punctuation.definition.variable.begin.tm-snippet',
        2 => 'punctuation.separator.default-value.tm-snippet'
      to %r/(\})/,
        2 => 'punctuation.definition.variable.end.tm-snippet'
    end
  end

  fragment :transformations do
    rule 'variable.other.predefined.placeholder.transform.tm-snippet' do
      from %r'(\$\{)\d+(?=/)',
        1 => 'punctuation.definition.variable.tm-snippet'
      to %r/\}/,
        0 => 'punctuation.definition.variable.tm-snippet'
      rule do
        from %r'(?<=/)'
        to %r/(?=\})/
        rule 'string.other.CHANGETHIS.tm-snippet' do
          from %r'(?!/)'
          to %r'(?=/)'
          rule 'variable.other.predefined.register.tm-snippet' do
            match %r/(\$)\d+/
          end
          rule 'constant.other.reference.tm-snippet' do
            match %r/\\[ulULE]/
          end
          rule 'constant.character.escape.tm-snippet' do
            # ASK ABOUT \( HERE AND IN VARIABLES
            match %r/\\[nt$\\]/
          end
          rule 'meta.conditional-insertion.tm-snippet' do
            from %r/\(\?\d+:/
            to %r/\)/
          end
        end
        rule do
          from %r'(/)',
            0 => 'string.regexp.tm-snippet',
            1 => 'punctuation.definition.string.end.tm-snippet'
          to %r/(?=\})/
          rule do
            # ASK ALLAN ABOUT THIS, IS INCOMPLETE.
            match %r'(?<=/)([imx]+-?[imx]+|-?[imx]+)'
          end
          rule 'invalid.illegal.character-not-allowed-here.tm-snippet' do
            match %r/\S/
          end
        end
      end
      rule 'string.regexp.tm-snippet' do
        from %r'(/)',
          0 => 'string.regexp.tm-snippet',
          1 => 'punctuation.definition.string.begin.tm-snippet'
        to %r'(/)',
          0 => 'string.regexp.tm-snippet',
          1 => 'punctuation.definition.string.end.tm-snippet'
        include "source.regexp.oniguruma"
      end
    end
  end

  fragment :variables do
    rule 'variable.other.predefined.tm-snippet' do
      # Take care of the built-in dynamic environment variables.
      match %r/(\$)TM_(BUNDLE_SUPPORT|S(COPE|OFT_TABS|UPPORT_PATH|ELECTED_(TEXT|FILE(S)?))|CURRENT_(WORD|LINE)|TAB_SIZE|DIRECTORY|PROJECT_DIRECTORY|FILEPATH|LINE_(NUMBER|INDEX))/,
        1 => 'punctuation.definition.variable.begin.tm-snippet'
    end
    rule 'variable.other.readwrite.tm-snippet' do
      # User defined variables.
      match %r/(\$)[A-Za-z_][A-Za-z0-9_]*/,
        1 => 'punctuation.definition.variable.begin.tm-snippet'
    end
    rule 'variable.other.readwrite.tm-snippet' do
      # User defined variables.
      match %r/(\$\{)[A-Za-z_][A-Za-z0-9_]*(\})/,
        1 => 'punctuation.definition.variable.begin.tm-snippet',
        2 => 'punctuation.definition.variable.end.tm-snippet'
    end
    rule 'variable.other.readwrite.tm-snippet' do
      # User defined variables.
      from %r/(\$\{)[A-Za-z_][A-Za-z0-9_]*(:)/,
        1 => 'punctuation.definition.variable.begin.tm-snippet',
        2 => 'punctuation.separator.options.tm-snippet'
      to %r/\}/,
        1 => 'punctuation.definition.variable.end.tm-snippet'
    end
    rule 'variable.other.readwrite.tm-snippet' do
      from %r'(\$\{)[A-Za-z_][A-Za-z0-9_]*(?=/)',
        1 => 'punctuation.definition.variable.begin.tm-snippet'
      to %r/}/,
        1 => 'punctuation.definition.variable.end.tm-snippet'
      rule do
        from %r'(?<=/)'
        to %r/(?=\})/
        rule 'string.other.CHANGETHIS.tm-snippet' do
          from %r'(?!/)'
          to %r'(?=/)'
          rule 'variable.other.predefined.register.tm-snippet' do
            match %r/(\$)\d+/
          end
          rule 'constant.other.reference.tm-snippet' do
            match %r/\\[ulULE]/
          end
          rule 'constant.character.escape.tm-snippet' do
            # ASK ABOUT \( HERE AND IN VARIABLES
            match %r/\\[nt$\\]/
          end
          rule 'meta.conditional-insertion.tm-snippet' do
            from %r/\(\?\d+:/
            to %r/\)/
          end
        end
        rule do
          from %r'(/)',
            0 => 'string.regexp.tm-snippet',
            1 => 'punctuation.definition.string.end.tm-snippet'
          to %r/(?=\})/
          rule do
            # ASK ALLAN ABOUT THIS, IS INCOMPLETE.
            match %r'(?<=/)([imx]+)?(-[imx]+)?'
          end
          rule 'invalid.illegal.character-not-allowed-here.tm-snippet' do
            match %r/\S/
          end
        end
      end
      rule 'string.regexp.tm-snippet' do
        from %r'(/)',
          0 => 'string.regexp.tm-snippet',
          1 => 'punctuation.definition.string.begin.tm-snippet'
        to %r'(/)',
          0 => 'string.regexp.tm-snippet',
          1 => 'punctuation.definition.string.end.tm-snippet'
        include "source.regexp.oniguruma"
      end
    end
  end
end
