# encoding: utf-8

language 'Fortran - Punchcard' => 'source.fortran' do
  # ?i: has to be added everywhere because fortran is case insensitive; NB: order of matching matters
  file_types %w(f F f77 F77 for FOR fpp FPP)
  uuid "45253F88-F7CC-49C5-9C32-F3FADD2AB579"  # TextMate only

  include "#preprocessor-rule-enabled"
  include "#preprocessor-rule-disabled"
  include "#preprocessor-rule-other"
  rule 'constant.language.fortran' do
    # built-in constants
    match %r/(?i:(r8|r4|\.TRUE\.|\.FALSE\.))/
  end
  rule 'constant.numeric.fortran' do
    # numbers
    match %r/\b[\+\-]?[0-9]+\.?[0-9a-zA-Z_]*\b/
  end
  rule 'meta.function.fortran' do
    # First line of function/subroutine definition
    from %r/(?x:                # extended mode
          ^
          \s*                  # start of line and possibly some space
          ([a-zA-Z\(\)]*)(?<!end)        # 1: possibly some type specification but not the word end
          \s*                  # possibly some space
          (?i:(function|subroutine))\b    # 2: function or subroutine
          \s+                  # some space
          ([A-Za-z_][A-Za-z0-9_]*)      # 3: name
          )/,
      1 => 'storage.type.fortran',
      2 => 'storage.type.function.fortran',
      3 => 'entity.name.function.fortran'
    to %r/(?x:                  # extended mode
          ((?i:end))              # 1: the word end
          (                  # followed by
            $                # end of line
          |                  # or
            \s*                # possibly some space
            (?i:(function|subroutine))    # 2: function or subroutine
            ((\s+[A-Za-z_][A-Za-z0-9_]*)?)  # 3: possibly the name
          )
          )/,
      1 => 'keyword.other.fortran',
      3 => 'storage.type.function.fortran',
      4 => 'entity.name.function.end.fortran'
    rule do
      from %r/\G\s*(\()/,
        1 => 'punctuation.definition.parameters.begin.fortran'
      to %r/\)/,
        0 => 'punctuation.definition.parameters.end.fortran'
      rule do
        match %r/([^\s),]*)\s*(,)?/,
          1 => 'variable.parameter.fortran',
          2 => 'punctuation.separator.arguments.fortan'
      end
    end
    include "$self"
    include "source.fortran.modern"
  end
  rule 'meta.specification.fortran' do
    # Line of type specification
    from %r/\b(?i:(integer|real|double\s+precision|complex|logical|character))\b(?=.*::)/,
      1 => 'storage.type.fortran'
    to %r/(?=!)|$/
    include "$self"
  end
  rule 'keyword.control.fortran' do
    # statements controling the flow of the program
    match %r/\b(?i:(go\s*to|assign|to|if|then|else|elseif|end\s*if|continue|stop|pause|do|end\s*do|while|cycle))\b/
  end
  rule 'keyword.control.programming-units.fortran' do
    # programming units
    match %r/\b(?i:(program|end\s+program|entry|block\s+data|call|return|contains|include))\b/
  end
  rule 'keyword.control.io.fortran' do
    # i/o statements
    match %r/\b(?i:(open|close|read|write|print|inquire|backspace|endfile|format))\b/
  end
  rule 'keyword.operator.fortran' do
    # operators
    match %r'((?<!\=)\=(?!\=)|\-|\+|\/\/|\/|(?!^)\*|::)'
  end
  rule 'keyword.operator.logical.fortran' do
    # logical operators
    match %r/(?i:(\.and\.|\.or\.|\.eq\.|\.lt\.|\.le\.|\.gt\.|\.ge\.|\.ne\.|\.not\.|\.eqv\.|\.neqv\.))/
  end
  rule 'keyword.other.instrisic.argument.fortran' do
    # argument related intrisics
    match %r/\b(?i:(present)(?=\())/
  end
  rule 'keyword.other.instrisic.numeric.fortran' do
    # numeric intrisics
    match %r/\b(?i:(abs|aimag|aint|anint|cmplx|conjg|dble|dim|dprod|int|max|min|mod|nint|real|sign|digits|epsilon|huge|maxexponent|minexponent|precision|radix|range|tiny)(?=\())/
  end
  rule 'keyword.other.instrisic.string.fortran' do
    # character string intrinsics
    match %r/\b(?i:(achar|adjustl|adjustr|char|iachar|ichar|index|len_trim|repeat|scan|string|trim|verify|len)(?=\())/
  end
  rule 'keyword.other.instrisic.math.fortran' do
    # mathematical intrisics
    match %r/\b(?i:(((acos|asin|atan|atan2|cos|cosh|exp|log|log10|sin|sinh|sqrt|tan|tanh)(?=\())|(random_number|random_seed)))\b/
  end
  rule 'keyword.other.instrisic.data.fortran' do
    # data kind intrinsics
    match %r/\b(?i:(kind|selected_int_kind|selected_real_kind|transfer)(?=\())/
  end
  rule 'keyword.other.instrisic.logical.fortran' do
    # logical intrinsics
    match %r/\b(?i:(logical)(?=\())/
  end
  rule 'keyword.other.instrisic.bit.fortran' do
    # bit operations intrinsics
    match %r/\b(?i:(((bit_size|btest|iand|ibclr|ibits|ibset|ieor|ior|ishift|ishiftc|not)(?=\())|mvbits))\b/
  end
  rule 'keyword.other.instrisic.floating-point.fortran' do
    # floating point intrinsics
    match %r/\b(?i:(exponent|fraction|nearest|rrspacing|scale|set_exponent|spacing)(?=\())/
  end
  rule 'keyword.other.instrisic.array.fortran' do
    # matrix/vector/array intrisics
    match %r/\b(?i:(((dot_product|sum|matmul|transpose|all|any|count|maxval|minval|maxloc|minloc|product|sum|lbound|ubound|shape|size|merge|pack|unpack|reshape|spread|cshift|eoshift)(?=\())|(where|elsewhere|end\s*where)))\b/
  end
  rule 'keyword.other.instrisic.fortran' do
    # other intrisics
    match %r/\b(?i:(((dtime)(?=\())|(date_and_time|system_clock)))\b/
  end
  rule 'storage.type.fortran' do
    # data specification
    match %r/\b(?i:(integer|real|double\s+precision|complex|logical|character|block\sdata|operator|assignment))\b/
  end
  rule 'storage.modifier.fortran' do
    # data type attributes
    match %r/\b(?i:(dimension|common|equivalence|parameter|external|intrinsic|save|data|implicit\s*none|implicit|intent|in|out|inout))\b/
  end
  rule 'string.quoted.single.fortran' do
    # String
    from %r/'/,
      0 => 'punctuation.definition.string.begin.fortran'
    to %r/'/,
      0 => 'punctuation.definition.string.end.fortran'
    to_last true
    rule 'constant.character.escape.apostrophe.fortran' do
      match %r/''/
    end
  end
  rule 'string.quoted.double.fortran' do
    # String
    from %r/"/,
      0 => 'punctuation.definition.string.begin.fortran'
    to %r/"/,
      0 => 'punctuation.definition.string.end.fortran'
    to_last true
    rule 'constant.character.escape.quote.fortran' do
      match %r/""/
    end
  end
  rule 'comment.line.c.fortran' do
    from %r/^[Cc](?=\b|[Cc])/,
      0 => 'punctuation.definition.comment.fortran'
    to %r/$\n?/
    rule do
      match %r/\\\s*\n/
    end
  end
  rule 'comment.line.asterisk.fortran' do
    from %r/^\*/,
      0 => 'punctuation.definition.comment.fortran'
    to %r/$\n?/
    rule do
      match %r/\\\s*\n/
    end
  end
  rule 'meta.preprocessor.diagnostic.fortran' do
    from %r/^\s*#\s*(error|warning)\b/
    to %r/$\n?/
    both 1 => 'keyword.control.import.error.fortran'
    rule 'punctuation.separator.continuation.fortran' do
      match %r/(?>\\\s*\n)/
    end
  end
  rule 'meta.preprocessor.fortran.include' do
    from %r/^\s*#\s*(include|import)\b\s+/
    to %r'(?=(?://|/\*))|$\n?'
    both 1 => 'keyword.control.import.include.fortran'
    rule 'punctuation.separator.continuation.fortran' do
      match %r/(?>\\\s*\n)/
    end
    rule 'string.quoted.double.include.fortran' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.fortran'
      to %r/"/,
        0 => 'punctuation.definition.string.end.fortran'
    end
    rule 'string.quoted.other.lt-gt.include.fortran' do
      from %r/</,
        0 => 'punctuation.definition.string.begin.fortran'
      to %r/>/,
        0 => 'punctuation.definition.string.end.fortran'
    end
  end
  include "#pragma-mark"
  rule 'meta.preprocessor.fortran' do
    from %r/^\s*#\s*(define|defined|elif|else|if|ifdef|ifndef|line|pragma|undef)\b/
    to %r'(?=(?://|/\*))|$\n?'
    both 1 => 'keyword.control.import.fortran'
    rule 'punctuation.separator.continuation.fortran' do
      match %r/(?>\\\s*\n)/
    end
  end

  fragment :disabled do
    rule do
      # eat nested preprocessor if(def)s
      from %r/^\s*#\s*if(n?def)?\b.*$/
      to %r/^\s*#\s*endif\b.*$/
      include "#disabled"
      include "#pragma-mark"
    end
  end

  fragment :"pragma-mark" do
    rule 'meta.section' do
      match %r/^\s*(#\s*(pragma\s+mark)\s+(.*))/,
        1 => 'meta.preprocessor.fortran',
        2 => 'keyword.control.import.pragma.fortran',
        3 => 'meta.toc-list.pragma-mark.fortran'
    end
  end

  fragment :"preprocessor-rule-disabled" do
    rule do
      from %r/^\s*(#(if)\s+(0)\b).*/
      to %r/^\s*(#\s*(endif)\b)/
      both 1 => 'meta.preprocessor.fortran',
           2 => 'keyword.control.import.if.fortran',
           3 => 'constant.numeric.preprocessor.fortran'
      rule do
        from %r/^\s*(#\s*(else)\b)/
        to %r/(?=^\s*#\s*endif\b.*$)/
        both 1 => 'meta.preprocessor.fortran',
             2 => 'keyword.control.import.else.fortran'
        include "$base"
      end
      rule 'comment.block.preprocessor.if-branch' do
        from %r//
        to %r/(?=^\s*#\s*(else|endif)\b.*$)/
        include "#disabled"
        include "#pragma-mark"
      end
    end
  end

  fragment :"preprocessor-rule-enabled" do
    rule do
      from %r/^\s*(#(if)\s+(0*1)\b)/
      to %r/^\s*(#\s*(endif)\b)/
      both 1 => 'meta.preprocessor.fortran',
           2 => 'keyword.control.import.if.fortran',
           3 => 'constant.numeric.preprocessor.fortran'
      rule do
        content_scope "comment.block.preprocessor.else-branch"
        from %r/^\s*(#\s*(else)\b).*/
        to %r/(?=^\s*#\s*endif\b.*$)/
        both 1 => 'meta.preprocessor.fortran',
             2 => 'keyword.control.import.else.fortran'
        include "#disabled"
        include "#pragma-mark"
      end
      rule do
        from %r//
        to %r/(?=^\s*#\s*(else|endif)\b.*$)/
        include "$base"
      end
    end
  end

  fragment :"preprocessor-rule-other" do
    rule do
      from %r'^\s*(#\s*(if(n?def)?)\b.*?(?:(?=(?://|/\*))|$))'
      to %r/^\s*(#\s*(endif)\b).*$/
      both 1 => 'meta.preprocessor.fortran',
           2 => 'keyword.control.import.fortran'
      include "$base"
    end
  end
end
