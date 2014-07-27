# encoding: utf-8

language 'Go' => 'source.go' do
  # Go allows any Unicode character to be used in identifiers, so our identifier regex is: \b([[:alpha:]_]+[[:alnum:]_]*)\b
  file_types %w(go)
  first_line_match %r/-[*]-( Mode:)? Go -[*]-/
  folding_start_marker %r'(?x)
          /\*\*(?!\*)                           # opening C-style comment with 2 asterisks but no third later on
         |                                      # OR
          ^                                     # start of line...
           (?!                                  # ...which does NOT contain...
              [^{(]*?//                         #    ...a possible bunch of non-opening-braces, followed by a C++ comment
             |                                  #    OR
              [^{(]*?/\*(?!.*?\*/.*?[{(])       #    ...a possible bunch of non-opening-braces, followed by a C comment with no ending
           )
           .*?                                  # ...any characters (or none)...
           [{(]\s*                              # ...followed by an open brace and zero or more whitespace...
           (                                    # ...followed by...
            $                                   #    ...a dollar...
             |                                  #    OR
            //                                  #    ...a C++ comment...
             |                                  #    OR
            /\*(?!.*?\*/.*\S)                   #    ...a C comment, so long as no non-whitespace chars follow it..
           )
    '
  folding_stop_marker %r'(?<!\*)\*\*/|^\s*[})]'
  key_equivalent "^~G"  # TextMate only
  uuid "33100200-8916-4F78-8522-4362628C6889"  # TextMate only

  include "#receiver_function_declaration"
  include "#plain_function_declaration"
  include "#basic_things"
  include "#exported_variables"
  rule 'meta.preprocessor.go.import' do
    from %r/^[[:blank:]]*(import)\b\s+/,
      1 => 'keyword.control.import.go'
    to %r'(?=(?://|/\*))|$'
    rule 'string.quoted.double.import.go' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.go'
      to %r/"/,
        0 => 'punctuation.definition.string.end.go'
    end
  end
  include "#block"
  include "#root_parens"
  include "#function_calls"

  fragment :access do
    rule 'variable.other.dot-access.go' do
      match %r/(?<=\.)[[:alpha:]_][[:alnum:]_]*\b(?!\s*\()/
    end
  end

  fragment :basic_things do
    include "#comments"
    include "#initializers"
    include "#access"
    include "#strings"
    include "#keywords"
  end

  fragment :block do
    rule 'meta.block.go' do
      from %r/\{/
      to %r/\}/
      include "#block_innards"
    end
  end

  fragment :block_innards do
    include "#function_block_innards"
    include "#exported_variables"
  end

  fragment :comments do
    rule 'comment.block.go' do
      match %r'^/\* =(\s*.*?)\s*= \*/$\n?',
        1 => 'meta.toc-list.banner.block.go'
    end
    rule 'comment.block.go' do
      from %r'/\*'
      to %r'\*/'
      both 0 => 'punctuation.definition.comment.go'
    end
    rule 'invalid.illegal.stray-commend-end.go' do
      match %r'\*/.*\n'
    end
    rule 'comment.line.double-slash.banner.go' do
      match %r'^// =(\s*.*?)\s*=\s*$\n?',
        1 => 'meta.toc-list.banner.line.go'
    end
    rule 'comment.line.double-slash.go' do
      from %r'//',
        0 => 'punctuation.definition.comment.go'
      to %r/$\n?/
      rule 'punctuation.separator.continuation.go' do
        match %r/(?>\\\s*\n)/
      end
    end
  end

  fragment :exported_variables do
    rule 'variable.exported.go' do
      # This is kinda hacky, in order to get the 'var' scoped the right way again.
      match %r/(?<=\s|\[\])([[:upper:]][[:alnum:]_]*)(?=\W+)/
    end
  end

  fragment :fn_parens do
    rule 'meta.parens.go' do
      from %r/\(/
      to %r/\)/
      include "#basic_things"
      include "#function_calls"
    end
  end

  fragment :function_block do
    rule 'meta.block.go' do
      from %r/\{/
      to %r/\}/
      include "#function_block_innards"
    end
  end

  fragment :function_block_innards do
    include "#basic_things"
    rule do
      match %r/(\s*)\b(new|c(lose(d)?|ap)|p(anic(ln)?|rint(ln)?)|len|make)(?:\b|\()/,
        1 => 'punctuation.whitespace.support.function.leading.go',
        2 => 'support.function.builtin.go'
    end
    include "#function_block"
    include "#function_calls"
    include "#fn_parens"
  end

  fragment :function_calls do
    rule 'meta.function-call.go' do
      match %r/(?x)
                (?: (?= \s ) (?:(?<=else|new|return) | (?<!\w)) (\s+) )?
                (\b
                    (?!(for|if|else|switch|return)\s*\()
                    (?:[[:alpha:]_][[:alnum:]_]*+\b)            # method name
                )
                \s*(\()
            /,
        1 => 'punctuation.whitespace.function-call.leading.go',
        2 => 'support.function.any-method.go',
        3 => 'punctuation.definition.parameters.go'
    end
  end

  fragment :initializers do
    rule 'meta.initialization.explicit.go' do
      # This matches the 'var x int = 0' style of variable declaration.
      match %r/^[[:blank:]]*(var)\s+(?:[[:alpha:]_][[:alnum:]_]*)(?:,\s+[[:alpha:]_][[:alnum:]_]*)*/,
        0 => 'variable.other.go',
        1 => 'keyword.control.go'
    end
    rule 'meta.initialization.short.go' do
      # This matches the 'x := 0' style of variable declaration.
      match %r/(?:[[:alpha:]_][[:alnum:]_]*)(?:,\s+[[:alpha:]_][[:alnum:]_]*)*\s*(:=)/,
        0 => 'variable.other.go',
        1 => 'keyword.operator.initialize.go'
    end
  end

  fragment :keywords do
    rule 'keyword.control.go' do
      match %r/\b(s(truct|elect|witch)|c(ontinue|ase)|type|i(nterface|f|mport)|def(er|ault)|package|else|var|f(or|unc|allthrough)|r(eturn|ange)|go(to)?|map|break)\b/
    end
    rule 'storage.type.go' do
      match %r/(\b|(?<=\]))(int(16|8|32|64)?|uint(16|8|32|ptr|64)?|float(32|64)?|b(yte|ool)|string)\b/
    end
    rule 'storage.modifier.go' do
      match %r/\b(const|chan)\b/
    end
    rule 'constant.language.go' do
      match %r/\b(nil|true|false|iota)\b/
    end
    rule 'constant.numeric.go' do
      match %r/\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)\b/
    end
    rule 'support.channel-operator.go' do
      match %r/(\<\-)|(\-\>)/
    end
  end

  fragment :plain_function_declaration do
    rule 'meta.function.plain.go' do
      # FIXME: (warning) character class has duplicated range
      from %r'(?x)
                  ^[[:blank:]]*(func)\s*
                  (?: ([[:alpha:]_][[:alnum:]_]*)? )          # name of function is optional
                  (?: \( ((?:[\[\]\w\d\s\/,._*&<>-]|(?:interface\{\}))*)? \) )             # required braces for parameters (even if empty)
                  \s*
                  (?: \(? ((?:[\[\]\w\d\s,._*&<>-]|(?:interface\{\}))*) \)? )?             # optional return types, optionally within braces
          ',
        1 => 'keyword.control.go',
        2 => 'entity.name.function.go',
        3 => 'variable.parameters.go',
        4 => 'variable.return-types.go'
      to %r/(?<=\})/
      include "#comments"
      include "#function_block"
    end
  end

  fragment :receiver_function_declaration do
    rule 'meta.function.receiver.go' do
      # Version of above with support for declaring a receiver variable.
      # FIXME: (warning) character class has duplicated range
      from %r/(?x)
                  (func)\s*
                  (?: \( ((?:[\[\]\w\d\s,._*&<>-]|(?:interface\{\}))*) \)\s+ )                # receiver variable declarations, in brackets
                  (?: ([[:alpha:]_][[:alnum:]_]*)? )          # name of function is optional
                  (?: \( ((?:[\[\]\w\d\s,._*&<>-]|(?:interface\{\}))*)? \) )               # required braces for parameters (even if empty)
                  \s*
                  (?: \(? ((?:[\[\]\w\d\s,._*&<>-]|(?:interface\{\}))*) \)? )?             # optional return types, optionally within braces
          /,
        1 => 'keyword.control.go',
        2 => 'variable.receiver.go',
        3 => 'entity.name.function.go',
        4 => 'variable.parameters.go',
        5 => 'variable.return-types.go'
      to %r/(?<=\})/
      include "#comments"
      include "#function_block"
    end
  end

  fragment :root_parens do
    rule 'meta.parens.go' do
      from %r/\(/
      to %r/(?<=\()(\))?|(?:\))/,
        1 => 'meta.parens.empty.go'
      include "#basic_things"
      include "#exported_variables"
      include "#function_calls"
    end
  end

  fragment :string_escaped_char do
    rule 'constant.character.escape.go' do
      match %r/\\(\\|[abfnrutv'"]|x[0-9a-fA-F]{2}|u[0-9a-fA-F]{4}|U[0-9a-fA-F]{8}|[0-7]{3})/
    end
    rule 'invalid.illegal.unknown-escape.go' do
      match %r/\\./
    end
  end

  fragment :string_placeholder do
    rule 'constant.other.placeholder.go' do
      match %r/(?x)%
                        (\d+\$)?                                    # field (argument #)
                        [#0\- +']*                                  # flags
                        [,;:_]?                                     # separator character (AltiVec)
                        ((-?\d+)|\*(-?\d+\$)?)?                     # minimum field width
                        (\.((-?\d+)|\*(-?\d+\$)?)?)?                # precision
                        [diouxXDOUeEfFgGaAcCsSpnvtTbyYhHmMzZ%]      # conversion type
                    /
    end
    rule 'invalid.illegal.placeholder.go' do
      match %r/%/
    end
  end

  fragment :strings do
    rule 'string.quoted.double.go' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.go'
      to %r/"/,
        0 => 'punctuation.definition.string.end.go'
      include "#string_placeholder"
      include "#string_escaped_char"
    end
    rule 'string.quoted.single.go' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.go'
      to %r/'/,
        0 => 'punctuation.definition.string.end.go'
      include "#string_escaped_char"
    end
    rule 'string.quoted.raw.go' do
      from %r/`/,
        0 => 'punctuation.definition.string.begin.go'
      to %r/`/,
        0 => 'punctuation.definition.string.end.go'
    end
  end
end
