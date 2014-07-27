# encoding: utf-8

language 'Erlang' => 'source.erlang' do
  # The recognition of function definitions and compiler directives (such as module, record and macro definitions) requires that each of the aforementioned constructs must be the first string inside a line (except for whitespace).  Also, the function/module/record/macro names must be given unquoted.  -- desp
  file_types %w(erl hrl)
  key_equivalent "^~E"  # TextMate only
  uuid "58EA597D-5158-4BF7-9FB2-B05135D1E166"  # TextMate only

  include "#module-directive"
  include "#import-export-directive"
  include "#behaviour-directive"
  include "#record-directive"
  include "#define-directive"
  include "#macro-directive"
  include "#directive"
  include "#function"
  include "#everything-else"

  fragment :atom do
    rule 'constant.other.symbol.quoted.single.erlang' do
      from %r/(')/,
        1 => 'punctuation.definition.symbol.begin.erlang'
      to %r/(')/,
        1 => 'punctuation.definition.symbol.end.erlang'
      rule 'constant.other.symbol.escape.erlang' do
        match %r/(\\)([bdefnrstv\\'"]|(\^)[@-_]|[0-7]{1,3})/,
          1 => 'punctuation.definition.escape.erlang',
          3 => 'punctuation.definition.escape.erlang'
      end
      rule 'invalid.illegal.atom.erlang' do
        match %r/\\\^?.?/
      end
    end
    rule 'constant.other.symbol.unquoted.erlang' do
      match %r/[a-z][a-zA-Z\d@_]*+/
    end
  end

  fragment :"behaviour-directive" do
    rule 'meta.directive.behaviour.erlang' do
      match %r/^\s*+(-)\s*+(behaviour)\s*+(\()\s*+([a-z][a-zA-Z\d@_]*+)\s*+(\))\s*+(\.)/,
        1 => 'punctuation.section.directive.begin.erlang',
        2 => 'keyword.control.directive.behaviour.erlang',
        3 => 'punctuation.definition.parameters.begin.erlang',
        4 => 'entity.name.type.class.behaviour.definition.erlang',
        5 => 'punctuation.definition.parameters.end.erlang',
        6 => 'punctuation.section.directive.end.erlang'
    end
  end

  fragment :binary do
    rule 'meta.structure.binary.erlang' do
      from %r/(<<)/,
        1 => 'punctuation.definition.binary.begin.erlang'
      to %r/(>>)/,
        1 => 'punctuation.definition.binary.end.erlang'
      rule do
        match %r/(,)|(:)/,
          1 => 'punctuation.separator.binary.erlang',
          2 => 'punctuation.separator.value-size.erlang'
      end
      include "#internal-type-specifiers"
      include "#everything-else"
    end
  end

  fragment :character do
    rule 'constant.character.erlang' do
      match %r/(\$)((\\)([bdefnrstv\\'"]|(\^)[@-_]|[0-7]{1,3}))/,
        1 => 'punctuation.definition.character.erlang',
        2 => 'constant.character.escape.erlang',
        3 => 'punctuation.definition.escape.erlang',
        5 => 'punctuation.definition.escape.erlang'
    end
    rule 'invalid.illegal.character.erlang' do
      match %r/\$\\\^?.?/
    end
    rule 'constant.character.erlang' do
      match %r/(\$)\S/,
        1 => 'punctuation.definition.character.erlang'
    end
    rule 'invalid.illegal.character.erlang' do
      match %r/\$.?/
    end
  end

  fragment :comment do
    rule do
      from %r/(^[ \t]+)?(?=%)/,
        1 => 'punctuation.whitespace.comment.leading.erlang'
      to %r/(?!\G)/
      rule 'comment.line.percentage.erlang' do
        from %r/%/,
          0 => 'punctuation.definition.comment.erlang'
        to %r/\n/
      end
    end
  end

  fragment :"define-directive" do
    rule 'meta.directive.define.erlang' do
      from %r/^\s*+(-)\s*+(define)\s*+(\()\s*+([a-zA-Z\d@_]++)\s*+(,)/,
        1 => 'punctuation.section.directive.begin.erlang',
        2 => 'keyword.control.directive.define.erlang',
        3 => 'punctuation.definition.parameters.begin.erlang',
        4 => 'entity.name.function.macro.definition.erlang',
        5 => 'punctuation.separator.parameters.erlang'
      to %r/(\))\s*+(\.)/,
        1 => 'punctuation.definition.parameters.end.erlang',
        2 => 'punctuation.section.directive.end.erlang'
      include "#everything-else"
    end
    rule 'meta.directive.define.erlang' do
      from %r/(?=^\s*+-\s*+define\s*+\(\s*+[a-zA-Z\d@_]++\s*+\()/
      to %r/(\))\s*+(\.)/,
        1 => 'punctuation.definition.parameters.end.erlang',
        2 => 'punctuation.section.directive.end.erlang'
      rule do
        from %r/^\s*+(-)\s*+(define)\s*+(\()\s*+([a-zA-Z\d@_]++)\s*+(\()/,
          1 => 'punctuation.section.directive.begin.erlang',
          2 => 'keyword.control.directive.define.erlang',
          3 => 'punctuation.definition.parameters.begin.erlang',
          4 => 'entity.name.function.macro.definition.erlang',
          5 => 'punctuation.definition.parameters.begin.erlang'
        to %r/(\))\s*(,)/,
          1 => 'punctuation.definition.parameters.end.erlang',
          2 => 'punctuation.separator.parameters.erlang'
        rule 'punctuation.separator.parameters.erlang' do
          match %r/,/
        end
        include "#everything-else"
      end
      rule 'punctuation.separator.define.erlang' do
        match %r/\|\||\||:|;|,|\.|->/
      end
      include "#everything-else"
    end
  end

  fragment :directive do
    rule 'meta.directive.erlang' do
      from %r/^\s*+(-)\s*+([a-z][a-zA-Z\d@_]*+)\s*+(\(?)/,
        1 => 'punctuation.section.directive.begin.erlang',
        2 => 'keyword.control.directive.erlang',
        3 => 'punctuation.definition.parameters.begin.erlang'
      to %r/(\)?)\s*+(\.)/,
        1 => 'punctuation.definition.parameters.end.erlang',
        2 => 'punctuation.section.directive.end.erlang'
      include "#everything-else"
    end
    rule 'meta.directive.erlang' do
      match %r/^\s*+(-)\s*+([a-z][a-zA-Z\d@_]*+)\s*+(\.)/,
        1 => 'punctuation.section.directive.begin.erlang',
        2 => 'keyword.control.directive.erlang',
        3 => 'punctuation.section.directive.end.erlang'
    end
  end

  fragment :"everything-else" do
    include "#comment"
    include "#record-usage"
    include "#macro-usage"
    include "#expression"
    include "#keyword"
    include "#textual-operator"
    include "#function-call"
    include "#tuple"
    include "#list"
    include "#binary"
    include "#parenthesized-expression"
    include "#character"
    include "#number"
    include "#atom"
    include "#string"
    include "#symbolic-operator"
    include "#variable"
  end

  fragment :expression do
    rule 'meta.expression.if.erlang' do
      from %r/\b(if)\b/,
        1 => 'keyword.control.if.erlang'
      to %r/\b(end)\b/,
        1 => 'keyword.control.end.erlang'
      include "#internal-expression-punctuation"
      include "#everything-else"
    end
    rule 'meta.expression.case.erlang' do
      from %r/\b(case)\b/,
        1 => 'keyword.control.case.erlang'
      to %r/\b(end)\b/,
        1 => 'keyword.control.end.erlang'
      include "#internal-expression-punctuation"
      include "#everything-else"
    end
    rule 'meta.expression.receive.erlang' do
      from %r/\b(receive)\b/,
        1 => 'keyword.control.receive.erlang'
      to %r/\b(end)\b/,
        1 => 'keyword.control.end.erlang'
      include "#internal-expression-punctuation"
      include "#everything-else"
    end
    rule do
      match %r'\b(fun)\s*+(([a-z][a-zA-Z\d@_]*+)\s*+(:)\s*+)?([a-z][a-zA-Z\d@_]*+)\s*(/)',
        1 => 'keyword.control.fun.erlang',
        3 => 'entity.name.type.class.module.erlang',
        4 => 'punctuation.separator.module-function.erlang',
        5 => 'entity.name.function.erlang',
        6 => 'punctuation.separator.function-arity.erlang'
    end
    rule 'meta.expression.fun.erlang' do
      from %r/\b(fun)\b/,
        1 => 'keyword.control.fun.erlang'
      to %r/\b(end)\b/,
        1 => 'keyword.control.end.erlang'
      rule do
        from %r/(?=\()/
        to %r/(;)|(?=\bend\b)/,
          1 => 'punctuation.separator.clauses.erlang'
        include "#internal-function-parts"
      end
      include "#everything-else"
    end
    rule 'meta.expression.try.erlang' do
      from %r/\b(try)\b/,
        1 => 'keyword.control.try.erlang'
      to %r/\b(end)\b/,
        1 => 'keyword.control.end.erlang'
      include "#internal-expression-punctuation"
      include "#everything-else"
    end
    rule 'meta.expression.begin.erlang' do
      from %r/\b(begin)\b/,
        1 => 'keyword.control.begin.erlang'
      to %r/\b(end)\b/,
        1 => 'keyword.control.end.erlang'
      include "#internal-expression-punctuation"
      include "#everything-else"
    end
    rule 'meta.expression.query.erlang' do
      from %r/\b(query)\b/,
        1 => 'keyword.control.query.erlang'
      to %r/\b(end)\b/,
        1 => 'keyword.control.end.erlang'
      include "#everything-else"
    end
  end

  fragment :function do
    rule 'meta.function.erlang' do
      from %r/^\s*+([a-z][a-zA-Z\d@_]*+|'[^']*+')\s*+(?=\()/,
        1 => 'entity.name.function.definition.erlang'
      to %r/(\.)/,
        1 => 'punctuation.terminator.function.erlang'
      rule do
        match %r/^\s*+([a-z][a-zA-Z\d@_]*+|'[^']*+')\s*+(?=\()/,
          1 => 'entity.name.function.erlang'
      end
      rule do
        from %r/(?=\()/
        to %r/(;)|(?=\.)/,
          1 => 'punctuation.separator.clauses.erlang'
        include "#parenthesized-expression"
        include "#internal-function-parts"
      end
      include "#everything-else"
    end
  end

  fragment :"function-call" do
    rule 'meta.function-call.erlang' do
      from %r/(?=([a-z][a-zA-Z\d@_]*+|'[^']*+')\s*+(\(|:\s*+([a-z][a-zA-Z\d@_]*+|'[^']*+')\s*+\())/
      to %r/(\))/,
        1 => 'punctuation.definition.parameters.end.erlang'
      rule do
        from %r/((erlang)\s*+(:)\s*+)?(is_atom|is_binary|is_constant|is_float|is_function|is_integer|is_list|is_number|is_pid|is_port|is_reference|is_tuple|is_record|abs|element|hd|length|node|round|self|size|tl|trunc)\s*+(\()/,
          2 => 'entity.name.type.class.module.erlang',
          3 => 'punctuation.separator.module-function.erlang',
          4 => 'entity.name.function.guard.erlang',
          5 => 'punctuation.definition.parameters.begin.erlang'
        to %r/(?=\))/
        rule 'punctuation.separator.parameters.erlang' do
          match %r/,/
        end
        include "#everything-else"
      end
      rule do
        from %r/(([a-z][a-zA-Z\d@_]*+|'[^']*+')\s*+(:)\s*+)?([a-z][a-zA-Z\d@_]*+|'[^']*+')\s*+(\()/,
          2 => 'entity.name.type.class.module.erlang',
          3 => 'punctuation.separator.module-function.erlang',
          4 => 'entity.name.function.erlang',
          5 => 'punctuation.definition.parameters.begin.erlang'
        to %r/(?=\))/
        rule 'punctuation.separator.parameters.erlang' do
          match %r/,/
        end
        include "#everything-else"
      end
    end
  end

  fragment :"import-export-directive" do
    rule 'meta.directive.import.erlang' do
      from %r/^\s*+(-)\s*+(import)\s*+(\()\s*+([a-z][a-zA-Z\d@_]*+|'[^']*+')\s*+(,)/,
        1 => 'punctuation.section.directive.begin.erlang',
        2 => 'keyword.control.directive.import.erlang',
        3 => 'punctuation.definition.parameters.begin.erlang',
        4 => 'entity.name.type.class.module.erlang',
        5 => 'punctuation.separator.parameters.erlang'
      to %r/(\))\s*+(\.)/,
        1 => 'punctuation.definition.parameters.end.erlang',
        2 => 'punctuation.section.directive.end.erlang'
      include "#internal-function-list"
    end
    rule 'meta.directive.export.erlang' do
      from %r/^\s*+(-)\s*+(export)\s*+(\()/,
        1 => 'punctuation.section.directive.begin.erlang',
        2 => 'keyword.control.directive.export.erlang',
        3 => 'punctuation.definition.parameters.begin.erlang'
      to %r/(\))\s*+(\.)/,
        1 => 'punctuation.definition.parameters.end.erlang',
        2 => 'punctuation.section.directive.end.erlang'
      include "#internal-function-list"
    end
  end

  fragment :"internal-expression-punctuation" do
    rule do
      match %r/(->)|(;)|(,)/,
        1 => 'punctuation.separator.clause-head-body.erlang',
        2 => 'punctuation.separator.clauses.erlang',
        3 => 'punctuation.separator.expressions.erlang'
    end
  end

  fragment :"internal-function-list" do
    rule 'meta.structure.list.function.erlang' do
      from %r/(\[)/,
        1 => 'punctuation.definition.list.begin.erlang'
      to %r/(\])/,
        1 => 'punctuation.definition.list.end.erlang'
      rule do
        from %r:([a-z][a-zA-Z\d@_]*+|'[^']*+')\s*+(/):,
          1 => 'entity.name.function.erlang',
          2 => 'punctuation.separator.function-arity.erlang'
        to %r/(,)|(?=\])/,
          1 => 'punctuation.separator.list.erlang'
        include "#everything-else"
      end
      include "#everything-else"
    end
  end

  fragment :"internal-function-parts" do
    rule do
      from %r/(?=\()/
      to %r/(->)/,
        1 => 'punctuation.separator.clause-head-body.erlang'
      rule do
        from %r/(\()/,
          1 => 'punctuation.definition.parameters.begin.erlang'
        to %r/(\))/,
          1 => 'punctuation.definition.parameters.end.erlang'
        rule 'punctuation.separator.parameters.erlang' do
          match %r/,/
        end
        include "#everything-else"
      end
      rule 'punctuation.separator.guards.erlang' do
        match %r/,|;/
      end
      include "#everything-else"
    end
    rule 'punctuation.separator.expressions.erlang' do
      match %r/,/
    end
    include "#everything-else"
  end

  fragment :"internal-record-body" do
    rule 'meta.structure.record.erlang' do
      from %r/(\{)/,
        1 => 'punctuation.definition.class.record.begin.erlang'
      to %r/(?=\})/
      rule do
        from %r/(([a-z][a-zA-Z\d@_]*+|'[^']*+')|(_))\s*+(=|::)/,
          2 => 'variable.other.field.erlang',
          3 => 'variable.language.omitted.field.erlang',
          4 => 'keyword.operator.assignment.erlang'
        to %r/(,)|(?=\})/,
          1 => 'punctuation.separator.class.record.erlang'
        include "#everything-else"
      end
      rule do
        match %r/([a-z][a-zA-Z\d@_]*+|'[^']*+')\s*+(,)?/,
          1 => 'variable.other.field.erlang',
          2 => 'punctuation.separator.class.record.erlang'
      end
      include "#everything-else"
    end
  end

  fragment :"internal-type-specifiers" do
    rule do
      from %r'(/)',
        1 => 'punctuation.separator.value-type.erlang'
      to %r/(?=,|:|>>)/
      rule do
        match %r/(integer|float|binary|bytes|bitstring|bits)|(signed|unsigned)|(big|little|native)|(unit)|(-)/,
          1 => 'storage.type.erlang',
          2 => 'storage.modifier.signedness.erlang',
          3 => 'storage.modifier.endianness.erlang',
          4 => 'storage.modifier.unit.erlang',
          5 => 'punctuation.separator.type-specifiers.erlang'
      end
    end
  end

  fragment :keyword do
    rule 'keyword.control.erlang' do
      match %r/\b(after|begin|case|catch|cond|end|fun|if|let|of|query|try|receive|when)\b/
    end
  end

  fragment :list do
    rule 'meta.structure.list.erlang' do
      from %r/(\[)/,
        1 => 'punctuation.definition.list.begin.erlang'
      to %r/(\])/,
        1 => 'punctuation.definition.list.end.erlang'
      rule 'punctuation.separator.list.erlang' do
        match %r/\||\|\||,/
      end
      include "#everything-else"
    end
  end

  fragment :"macro-directive" do
    rule 'meta.directive.ifdef.erlang' do
      # FIXME: (warning) character class has duplicated range
      match %r/^\s*+(-)\s*+(ifdef)\s*+(\()\s*+([a-zA-z\d@_]++)\s*+(\))\s*+(\.)/,
        1 => 'punctuation.section.directive.begin.erlang',
        2 => 'keyword.control.directive.ifdef.erlang',
        3 => 'punctuation.definition.parameters.begin.erlang',
        4 => 'entity.name.function.macro.erlang',
        5 => 'punctuation.definition.parameters.end.erlang',
        6 => 'punctuation.section.directive.end.erlang'
    end
    rule 'meta.directive.ifndef.erlang' do
      # FIXME: (warning) character class has duplicated range
      match %r/^\s*+(-)\s*+(ifndef)\s*+(\()\s*+([a-zA-z\d@_]++)\s*+(\))\s*+(\.)/,
        1 => 'punctuation.section.directive.begin.erlang',
        2 => 'keyword.control.directive.ifndef.erlang',
        3 => 'punctuation.definition.parameters.begin.erlang',
        4 => 'entity.name.function.macro.erlang',
        5 => 'punctuation.definition.parameters.end.erlang',
        6 => 'punctuation.section.directive.end.erlang'
    end
    rule 'meta.directive.undef.erlang' do
      # FIXME: (warning) character class has duplicated range
      match %r/^\s*+(-)\s*+(undef)\s*+(\()\s*+([a-zA-z\d@_]++)\s*+(\))\s*+(\.)/,
        1 => 'punctuation.section.directive.begin.erlang',
        2 => 'keyword.control.directive.undef.erlang',
        3 => 'punctuation.definition.parameters.begin.erlang',
        4 => 'entity.name.function.macro.erlang',
        5 => 'punctuation.definition.parameters.end.erlang',
        6 => 'punctuation.section.directive.end.erlang'
    end
  end

  fragment :"macro-usage" do
    rule 'meta.macro-usage.erlang' do
      match %r/(\?\??)\s*+([a-zA-Z\d@_]++)/,
        1 => 'keyword.operator.macro.erlang',
        2 => 'entity.name.function.macro.erlang'
    end
  end

  fragment :"module-directive" do
    rule 'meta.directive.module.erlang' do
      match %r/^\s*+(-)\s*+(module)\s*+(\()\s*+([a-z][a-zA-Z\d@_]*+)\s*+(\))\s*+(\.)/,
        1 => 'punctuation.section.directive.begin.erlang',
        2 => 'keyword.control.directive.module.erlang',
        3 => 'punctuation.definition.parameters.begin.erlang',
        4 => 'entity.name.type.class.module.definition.erlang',
        5 => 'punctuation.definition.parameters.end.erlang',
        6 => 'punctuation.section.directive.end.erlang'
    end
  end

  fragment :number do
    rule do
      from %r/(?=\d)/
      to %r/(?!\d)/
      rule 'constant.numeric.float.erlang' do
        match %r/\d++(\.)\d++([eE][\+\-]?\d++)?/,
          1 => 'punctuation.separator.integer-float.erlang',
          2 => 'punctuation.separator.float-exponent.erlang'
      end
      rule 'constant.numeric.integer.binary.erlang' do
        match %r/2(#)[0-1]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-3.erlang' do
        match %r/3(#)[0-2]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-4.erlang' do
        match %r/4(#)[0-3]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-5.erlang' do
        match %r/5(#)[0-4]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-6.erlang' do
        match %r/6(#)[0-5]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-7.erlang' do
        match %r/7(#)[0-6]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.octal.erlang' do
        match %r/8(#)[0-7]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-9.erlang' do
        match %r/9(#)[0-8]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.decimal.erlang' do
        match %r/10(#)\d++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-11.erlang' do
        match %r/11(#)[\daA]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-12.erlang' do
        match %r/12(#)[\da-bA-B]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-13.erlang' do
        match %r/13(#)[\da-cA-C]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-14.erlang' do
        match %r/14(#)[\da-dA-D]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-15.erlang' do
        match %r/15(#)[\da-eA-E]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.hexadecimal.erlang' do
        match %r/16(#)\h++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-17.erlang' do
        match %r/17(#)[\da-gA-G]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-18.erlang' do
        match %r/18(#)[\da-hA-H]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-19.erlang' do
        match %r/19(#)[\da-iA-I]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-20.erlang' do
        match %r/20(#)[\da-jA-J]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-21.erlang' do
        match %r/21(#)[\da-kA-K]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-22.erlang' do
        match %r/22(#)[\da-lA-L]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-23.erlang' do
        match %r/23(#)[\da-mA-M]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-24.erlang' do
        match %r/24(#)[\da-nA-N]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-25.erlang' do
        match %r/25(#)[\da-oA-O]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-26.erlang' do
        match %r/26(#)[\da-pA-P]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-27.erlang' do
        match %r/27(#)[\da-qA-Q]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-28.erlang' do
        match %r/28(#)[\da-rA-R]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-29.erlang' do
        match %r/29(#)[\da-sA-S]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-30.erlang' do
        match %r/30(#)[\da-tA-T]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-31.erlang' do
        match %r/31(#)[\da-uA-U]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-32.erlang' do
        match %r/32(#)[\da-vA-V]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-33.erlang' do
        match %r/33(#)[\da-wA-W]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-34.erlang' do
        match %r/34(#)[\da-xA-X]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-35.erlang' do
        match %r/35(#)[\da-yA-Y]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'constant.numeric.integer.base-36.erlang' do
        match %r/36(#)[\da-zA-Z]++/,
          1 => 'punctuation.separator.base-integer.erlang'
      end
      rule 'invalid.illegal.integer.erlang' do
        match %r/\d++#[\da-zA-Z]++/
      end
      rule 'constant.numeric.integer.decimal.erlang' do
        match %r/\d++/
      end
    end
  end

  fragment :"parenthesized-expression" do
    rule 'meta.expression.parenthesized' do
      from %r/(\()/,
        1 => 'punctuation.section.expression.begin.erlang'
      to %r/(\))/,
        1 => 'punctuation.section.expression.end.erlang'
      include "#everything-else"
    end
  end

  fragment :"record-directive" do
    rule 'meta.directive.record.erlang' do
      from %r/^\s*+(-)\s*+(record)\s*+(\()\s*+([a-z][a-zA-Z\d@_]*+|'[^']*+')\s*+(,)/,
        1 => 'punctuation.section.directive.begin.erlang',
        2 => 'keyword.control.directive.import.erlang',
        3 => 'punctuation.definition.parameters.begin.erlang',
        4 => 'entity.name.type.class.record.definition.erlang',
        5 => 'punctuation.separator.parameters.erlang'
      to %r/((\}))\s*+(\))\s*+(\.)/,
        1 => 'meta.structure.record.erlang',
        2 => 'punctuation.definition.class.record.end.erlang',
        3 => 'punctuation.definition.parameters.end.erlang',
        4 => 'punctuation.section.directive.end.erlang'
      include "#internal-record-body"
    end
  end

  fragment :"record-usage" do
    rule 'meta.record-usage.erlang' do
      match %r/(#)\s*+([a-z][a-zA-Z\d@_]*+|'[^']*+')\s*+(\.)\s*+([a-z][a-zA-Z\d@_]*+|'[^']*+')/,
        1 => 'keyword.operator.record.erlang',
        2 => 'entity.name.type.class.record.erlang',
        3 => 'punctuation.separator.record-field.erlang',
        4 => 'variable.other.field.erlang'
    end
    rule 'meta.record-usage.erlang' do
      from %r/(#)\s*+([a-z][a-zA-Z\d@_]*+|'[^']*+')/,
        1 => 'keyword.operator.record.erlang',
        2 => 'entity.name.type.class.record.erlang'
      to %r/((\}))/,
        1 => 'meta.structure.record.erlang',
        2 => 'punctuation.definition.class.record.end.erlang'
      include "#internal-record-body"
    end
  end

  fragment :string do
    rule 'string.quoted.double.erlang' do
      from %r/(")/,
        1 => 'punctuation.definition.string.begin.erlang'
      to %r/(")/,
        1 => 'punctuation.definition.string.end.erlang'
      rule 'constant.character.escape.erlang' do
        match %r/(\\)([bdefnrstv\\'"]|(\^)[@-_]|[0-7]{1,3})/,
          1 => 'punctuation.definition.escape.erlang',
          3 => 'punctuation.definition.escape.erlang'
      end
      rule 'invalid.illegal.string.erlang' do
        match %r/\\\^?.?/
      end
      rule 'constant.other.placeholder.erlang' do
        match %r/(~)((\-)?\d++|(\*))?((\.)(\d++|(\*)))?((\.)((\*)|.))?[~cfegswpWPBX#bx\+ni]/,
          1 => 'punctuation.definition.placeholder.erlang',
          3 => 'punctuation.separator.placeholder-parts.erlang',
          4 => 'punctuation.separator.placeholder-parts.erlang',
          6 => 'punctuation.separator.placeholder-parts.erlang',
          8 => 'punctuation.separator.placeholder-parts.erlang',
          10 => 'punctuation.separator.placeholder-parts.erlang',
          12 => 'punctuation.separator.placeholder-parts.erlang'
      end
      rule 'constant.other.placeholder.erlang' do
        match %r/(~)(\*)?(\d++)?[~du\-#fsacl]/,
          1 => 'punctuation.definition.placeholder.erlang',
          2 => 'punctuation.separator.placeholder-parts.erlang'
      end
      rule 'invalid.illegal.string.erlang' do
        match %r/~.?/
      end
    end
  end

  fragment :"symbolic-operator" do
    rule 'keyword.operator.symbolic.erlang' do
      match %r'\+\+|\+|--|-|\*|/=|/|=/=|=:=|==|=<|=|<-|<|>=|>|!|::'
    end
  end

  fragment :"textual-operator" do
    rule 'keyword.operator.textual.erlang' do
      match %r/\b(andalso|band|and|bxor|xor|bor|orelse|or|bnot|not|bsl|bsr|div|rem)\b/
    end
  end

  fragment :tuple do
    rule 'meta.structure.tuple.erlang' do
      from %r/(\{)/,
        1 => 'punctuation.definition.tuple.begin.erlang'
      to %r/(\})/,
        1 => 'punctuation.definition.tuple.end.erlang'
      rule 'punctuation.separator.tuple.erlang' do
        match %r/,/
      end
      include "#everything-else"
    end
  end

  fragment :variable do
    rule do
      match %r/(_[a-zA-Z\d@_]++|[A-Z][a-zA-Z\d@_]*+)|(_)/,
        1 => 'variable.other.erlang',
        2 => 'variable.language.omitted.erlang'
    end
  end
end
