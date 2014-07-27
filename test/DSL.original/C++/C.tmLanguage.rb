# encoding: utf-8

language 'C' => 'source.c' do
  file_types %w(c h)
  first_line_match %r/-[*]-( Mode:)? C -[*]-/
  folding_start_marker %r'(?x)
     /\*\*(?!\*)
    |^(?![^{]*?//|[^{]*?/\*(?!.*?\*/.*?\{)).*?\{\s*($|//|/\*(?!.*?\*/.*\S))
  '
  folding_stop_marker %r'(?<!\*)\*\*/|^\s*\}'
  key_equivalent "^~C"  # TextMate only
  uuid "25066DC2-6B1D-11D9-9D5B-000D93589AF6"  # TextMate only

  include "#preprocessor-rule-enabled"
  include "#preprocessor-rule-disabled"
  include "#preprocessor-rule-other"
  include "#comments"
  rule 'keyword.control.c' do
    match %r/\b(break|case|continue|default|do|else|for|goto|if|_Pragma|return|switch|while)\b/
  end
  rule 'storage.type.c' do
    match %r/\b(asm|__asm__|auto|bool|_Bool|char|_Complex|double|enum|float|_Imaginary|int|long|short|signed|struct|typedef|union|unsigned|void)\b/
  end
  rule 'storage.modifier.c' do
    match %r/\b(const|extern|register|restrict|static|volatile|inline)\b/
  end
  rule 'constant.other.variable.mac-classic.c' do
    # common C constant naming idiom -- kConstantVariable
    match %r/\bk[A-Z]\w*\b/
  end
  rule 'variable.other.readwrite.global.mac-classic.c' do
    match %r/\bg[A-Z]\w*\b/
  end
  rule 'variable.other.readwrite.static.mac-classic.c' do
    match %r/\bs[A-Z]\w*\b/
  end
  rule 'constant.language.c' do
    match %r/\b(NULL|true|false|TRUE|FALSE)\b/
  end
  include "#sizeof"
  rule 'constant.numeric.c' do
    match %r/\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)(L|l|UL|ul|u|U|F|f|ll|LL|ull|ULL)?\b/
  end
  rule 'string.quoted.double.c' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.c'
    to %r/"/,
      0 => 'punctuation.definition.string.end.c'
    include "#string_escaped_char"
    include "#string_placeholder"
  end
  rule 'string.quoted.single.c' do
    from %r/'/,
      0 => 'punctuation.definition.string.begin.c'
    to %r/'/,
      0 => 'punctuation.definition.string.end.c'
    include "#string_escaped_char"
  end
  rule 'meta.preprocessor.macro.c' do
    from %r/(?x)
            ^\s*\#\s*(define)\s+             # define
            ((?<id>[a-zA-Z_][a-zA-Z0-9_]*))  # macro name
            (?:                              # and optionally:
                (\()                         # an open parenthesis
                    (
                        \s* \g<id> \s*       # first argument
                        ((,) \s* \g<id> \s*)*  # additional arguments
                        (?:\.\.\.)?          # varargs ellipsis?
                    )
                (\))                         # a close parenthesis
            )?
          /,
      1 => 'keyword.control.import.define.c',
      2 => 'entity.name.function.preprocessor.c',
      4 => 'punctuation.definition.parameters.c',
      5 => 'variable.parameter.preprocessor.c',
      7 => 'punctuation.separator.parameters.c',
      8 => 'punctuation.definition.parameters.c'
    to %r'(?=(?://|/\*))|$'
    rule 'punctuation.separator.continuation.c' do
      match %r/(?>\\\s*\n)/
    end
    include "$base"
  end
  rule 'meta.preprocessor.diagnostic.c' do
    from %r/^\s*#\s*(error|warning)\b/
    to %r/$/
    both 1 => 'keyword.control.import.error.c'
    rule 'punctuation.separator.continuation.c' do
      match %r/(?>\\\s*\n)/
    end
  end
  rule 'meta.preprocessor.c.include' do
    from %r/^\s*#\s*(include|import)\b\s+/
    to %r'(?=(?://|/\*))|$'
    both 1 => 'keyword.control.import.include.c'
    rule 'punctuation.separator.continuation.c' do
      match %r/(?>\\\s*\n)/
    end
    rule 'string.quoted.double.include.c' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.c'
      to %r/"/,
        0 => 'punctuation.definition.string.end.c'
    end
    rule 'string.quoted.other.lt-gt.include.c' do
      from %r/</,
        0 => 'punctuation.definition.string.begin.c'
      to %r/>/,
        0 => 'punctuation.definition.string.end.c'
    end
  end
  include "#pragma-mark"
  rule 'meta.preprocessor.c' do
    from %r/^\s*#\s*(define|defined|elif|else|if|ifdef|ifndef|line|pragma|undef)\b/
    to %r'(?=(?://|/\*))|$'
    both 1 => 'keyword.control.import.c'
    rule 'punctuation.separator.continuation.c' do
      match %r/(?>\\\s*\n)/
    end
  end
  rule 'support.type.sys-types.c' do
    match %r/\b(u_char|u_short|u_int|u_long|ushort|uint|u_quad_t|quad_t|qaddr_t|caddr_t|daddr_t|dev_t|fixpt_t|blkcnt_t|blksize_t|gid_t|in_addr_t|in_port_t|ino_t|key_t|mode_t|nlink_t|id_t|pid_t|off_t|segsz_t|swblk_t|uid_t|id_t|clock_t|size_t|ssize_t|time_t|useconds_t|suseconds_t)\b/
  end
  rule 'support.type.pthread.c' do
    match %r/\b(pthread_attr_t|pthread_cond_t|pthread_condattr_t|pthread_mutex_t|pthread_mutexattr_t|pthread_once_t|pthread_rwlock_t|pthread_rwlockattr_t|pthread_t|pthread_key_t)\b/
  end
  rule 'support.type.stdint.c' do
    match %r/\b(int8_t|int16_t|int32_t|int64_t|uint8_t|uint16_t|uint32_t|uint64_t|int_least8_t|int_least16_t|int_least32_t|int_least64_t|uint_least8_t|uint_least16_t|uint_least32_t|uint_least64_t|int_fast8_t|int_fast16_t|int_fast32_t|int_fast64_t|uint_fast8_t|uint_fast16_t|uint_fast32_t|uint_fast64_t|intptr_t|uintptr_t|intmax_t|intmax_t|uintmax_t|uintmax_t)\b/
  end
  rule 'support.constant.mac-classic.c' do
    match %r/\b(noErr|kNilOptions|kInvalidID|kVariableLengthArray)\b/
  end
  rule 'support.type.mac-classic.c' do
    match %r/\b(AbsoluteTime|Boolean|Byte|ByteCount|ByteOffset|BytePtr|CompTimeValue|ConstLogicalAddress|ConstStrFileNameParam|ConstStringPtr|Duration|Fixed|FixedPtr|Float32|Float32Point|Float64|Float80|Float96|FourCharCode|Fract|FractPtr|Handle|ItemCount|LogicalAddress|OptionBits|OSErr|OSStatus|OSType|OSTypePtr|PhysicalAddress|ProcessSerialNumber|ProcessSerialNumberPtr|ProcHandle|Ptr|ResType|ResTypePtr|ShortFixed|ShortFixedPtr|SignedByte|SInt16|SInt32|SInt64|SInt8|Size|StrFileName|StringHandle|StringPtr|TimeBase|TimeRecord|TimeScale|TimeValue|TimeValue64|UInt16|UInt32|UInt64|UInt8|UniChar|UniCharCount|UniCharCountPtr|UniCharPtr|UnicodeScalarValue|UniversalProcHandle|UniversalProcPtr|UnsignedFixed|UnsignedFixedPtr|UnsignedWide|UTF16Char|UTF32Char|UTF8Char)\b/
  end
  include "#block"
  rule 'meta.function.c' do
    from %r/(?x)
        (?:  ^                                 # begin-of-line
          |
             (?: (?= \s )           (?<!else|new|return) (?<=\w)      #  or word + space before name
               | (?= \s*[A-Za-z_] ) (?<!&&)       (?<=[*&>])   #  or type modifier before name
             )
        )
        (\s*) (?!(while|for|do|if|else|switch|catch|enumerate|return|r?iterate)\s*\()
        (
          (?: [A-Za-z_][A-Za-z0-9_]*+ | :: )++ |                  # actual name
          (?: (?<=operator) (?: [-*&<>=+!]+ | \(\) | \[\] ) )  # if it is a C++ operator
        )
         \s*(?=\()/,
      1 => 'punctuation.whitespace.function.leading.c',
      3 => 'entity.name.function.c',
      4 => 'punctuation.definition.parameters.c'
    to %r/(?<=\})|(?=#)|(;)/
    include "#comments"
    include "#parens"
    rule 'storage.modifier.c' do
      match %r/\bconst\b/
    end
    include "#block"
  end

  fragment :access do
    rule 'variable.other.dot-access.c' do
      match %r/\.[a-zA-Z_][a-zA-Z_0-9]*\b(?!\s*\()/
    end
  end

  fragment :block do
    rule 'meta.block.c' do
      from %r/\{/
      to %r/\}/
      include "#block_innards"
    end
  end

  fragment :block_innards do
    include "#preprocessor-rule-enabled-block"
    include "#preprocessor-rule-disabled-block"
    include "#preprocessor-rule-other-block"
    include "#sizeof"
    include "#access"
    rule do
      match %r/(\s*)\b(hypot(f|l)?|s(scanf|ystem|nprintf|ca(nf|lb(n(f|l)?|ln(f|l)?))|i(n(h(f|l)?|f|l)?|gn(al|bit))|tr(s(tr|pn)|nc(py|at|mp)|c(spn|hr|oll|py|at|mp)|to(imax|d|u(l(l)?|max)|k|f|l(d|l)?)|error|pbrk|ftime|len|rchr|xfrm)|printf|et(jmp|vbuf|locale|buf)|qrt(f|l)?|w(scanf|printf)|rand)|n(e(arbyint(f|l)?|xt(toward(f|l)?|after(f|l)?))|an(f|l)?)|c(s(in(h(f|l)?|f|l)?|qrt(f|l)?)|cos(h(f)?|f|l)?|imag(f|l)?|t(ime|an(h(f|l)?|f|l)?)|o(s(h(f|l)?|f|l)?|nj(f|l)?|pysign(f|l)?)|p(ow(f|l)?|roj(f|l)?)|e(il(f|l)?|xp(f|l)?)|l(o(ck|g(f|l)?)|earerr)|a(sin(h(f|l)?|f|l)?|cos(h(f|l)?|f|l)?|tan(h(f|l)?|f|l)?|lloc|rg(f|l)?|bs(f|l)?)|real(f|l)?|brt(f|l)?)|t(ime|o(upper|lower)|an(h(f|l)?|f|l)?|runc(f|l)?|gamma(f|l)?|mp(nam|file))|i(s(space|n(ormal|an)|cntrl|inf|digit|u(nordered|pper)|p(unct|rint)|finite|w(space|c(ntrl|type)|digit|upper|p(unct|rint)|lower|al(num|pha)|graph|xdigit|blank)|l(ower|ess(equal|greater)?)|al(num|pha)|gr(eater(equal)?|aph)|xdigit|blank)|logb(f|l)?|max(div|abs))|di(v|fftime)|_Exit|unget(c|wc)|p(ow(f|l)?|ut(s|c(har)?|wc(har)?)|error|rintf)|e(rf(c(f|l)?|f|l)?|x(it|p(2(f|l)?|f|l|m1(f|l)?)?))|v(s(scanf|nprintf|canf|printf|w(scanf|printf))|printf|f(scanf|printf|w(scanf|printf))|w(scanf|printf)|a_(start|copy|end|arg))|qsort|f(s(canf|e(tpos|ek))|close|tell|open|dim(f|l)?|p(classify|ut(s|c|w(s|c))|rintf)|e(holdexcept|set(e(nv|xceptflag)|round)|clearexcept|testexcept|of|updateenv|r(aiseexcept|ror)|get(e(nv|xceptflag)|round))|flush|w(scanf|ide|printf|rite)|loor(f|l)?|abs(f|l)?|get(s|c|pos|w(s|c))|re(open|e|ad|xp(f|l)?)|m(in(f|l)?|od(f|l)?|a(f|l|x(f|l)?)?))|l(d(iv|exp(f|l)?)|o(ngjmp|cal(time|econv)|g(1(p(f|l)?|0(f|l)?)|2(f|l)?|f|l|b(f|l)?)?)|abs|l(div|abs|r(int(f|l)?|ound(f|l)?))|r(int(f|l)?|ound(f|l)?)|gamma(f|l)?)|w(scanf|c(s(s(tr|pn)|nc(py|at|mp)|c(spn|hr|oll|py|at|mp)|to(imax|d|u(l(l)?|max)|k|f|l(d|l)?|mbs)|pbrk|ftime|len|r(chr|tombs)|xfrm)|to(b|mb)|rtomb)|printf|mem(set|c(hr|py|mp)|move))|a(s(sert|ctime|in(h(f|l)?|f|l)?)|cos(h(f|l)?|f|l)?|t(o(i|f|l(l)?)|exit|an(h(f|l)?|2(f|l)?|f|l)?)|b(s|ort))|g(et(s|c(har)?|env|wc(har)?)|mtime)|r(int(f|l)?|ound(f|l)?|e(name|alloc|wind|m(ove|quo(f|l)?|ainder(f|l)?))|a(nd|ise))|b(search|towc)|m(odf(f|l)?|em(set|c(hr|py|mp)|move)|ktime|alloc|b(s(init|towcs|rtowcs)|towc|len|r(towc|len))))\b/,
        1 => 'punctuation.whitespace.support.function.leading.c',
        2 => 'support.function.C99.c'
    end
    rule 'meta.function-call.c' do
      match %r/(?x) (?: (?= \s )  (?:(?<=else|new|return) | (?<!\w)) (\s+))?
      (\b
        (?!(while|for|do|if|else|switch|catch|enumerate|return|r?iterate)\s*\()(?:(?!NS)[A-Za-z_][A-Za-z0-9_]*+\b | :: )++                  # actual name
      )
       \s*(\()/,
        1 => 'punctuation.whitespace.function-call.leading.c',
        2 => 'support.function.any-method.c',
        3 => 'punctuation.definition.parameters.c'
    end
    rule 'meta.initialization.c' do
      match %r/(?x)
              (?x)
      (?:
           (?: (?= \s )           (?<!else|new|return) (?<=\w)\s+      #  or word + space before name
           )
      )
      (
        (?: [A-Za-z_][A-Za-z0-9_]*+ | :: )++    |              # actual name
        (?: (?<=operator) (?: [-*&<>=+!]+ | \(\) | \[\] ) )?  # if it is a C++ operator
      )
       \s*(\()/,
        1 => 'variable.other.c',
        2 => 'punctuation.definition.parameters.c'
    end
    include "#block"
    include "$base"
  end

  fragment :comments do
    rule 'comment.block.c' do
      match %r'^/\* =(\s*.*?)\s*= \*/$\n?',
        1 => 'meta.toc-list.banner.block.c'
    end
    rule 'comment.block.c' do
      from %r'/\*'
      to %r'\*/'
      both 0 => 'punctuation.definition.comment.c'
    end
    rule 'invalid.illegal.stray-comment-end.c' do
      match %r'\*/.*\n'
    end
    rule 'comment.line.banner.c++' do
      match %r'^// =(\s*.*?)\s*=\s*$\n?',
        1 => 'meta.toc-list.banner.line.c'
    end
    rule 'comment.line.double-slash.c++' do
      from %r'//',
        0 => 'punctuation.definition.comment.c'
      to %r/$\n?/
      rule 'punctuation.separator.continuation.c++' do
        match %r/(?>\\\s*\n)/
      end
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

  fragment :parens do
    rule 'meta.parens.c' do
      from %r/\(/
      to %r/\)/
      include "$base"
    end
  end

  fragment :"pragma-mark" do
    rule 'meta.section' do
      match %r/^\s*(#\s*(pragma\s+mark)\s+(.*))/,
        1 => 'meta.preprocessor.c',
        2 => 'keyword.control.import.pragma.c',
        3 => 'meta.toc-list.pragma-mark.c'
    end
  end

  fragment :"preprocessor-rule-disabled" do
    rule do
      from %r/^\s*(#(if)\s+(0)\b).*/
      to %r/^\s*(#\s*(endif)\b)/
      both 1 => 'meta.preprocessor.c',
           2 => 'keyword.control.import.if.c',
           3 => 'constant.numeric.preprocessor.c'
      rule do
        from %r/^\s*(#\s*(else)\b)/
        to %r/(?=^\s*#\s*endif\b.*$)/
        both 1 => 'meta.preprocessor.c',
             2 => 'keyword.control.import.else.c'
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

  fragment :"preprocessor-rule-disabled-block" do
    rule do
      from %r/^\s*(#(if)\s+(0)\b).*/
      to %r/^\s*(#\s*(endif)\b)/
      both 1 => 'meta.preprocessor.c',
           2 => 'keyword.control.import.if.c',
           3 => 'constant.numeric.preprocessor.c'
      rule do
        from %r/^\s*(#\s*(else)\b)/
        to %r/(?=^\s*#\s*endif\b.*$)/
        both 1 => 'meta.preprocessor.c',
             2 => 'keyword.control.import.else.c'
        include "#block_innards"
      end
      rule 'comment.block.preprocessor.if-branch.in-block' do
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
      both 1 => 'meta.preprocessor.c',
           2 => 'keyword.control.import.if.c',
           3 => 'constant.numeric.preprocessor.c'
      rule do
        content_scope "comment.block.preprocessor.else-branch"
        from %r/^\s*(#\s*(else)\b).*/
        to %r/(?=^\s*#\s*endif\b.*$)/
        both 1 => 'meta.preprocessor.c',
             2 => 'keyword.control.import.else.c'
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

  fragment :"preprocessor-rule-enabled-block" do
    rule do
      from %r/^\s*(#(if)\s+(0*1)\b)/
      to %r/^\s*(#\s*(endif)\b)/
      both 1 => 'meta.preprocessor.c',
           2 => 'keyword.control.import.if.c',
           3 => 'constant.numeric.preprocessor.c'
      rule do
        content_scope "comment.block.preprocessor.else-branch.in-block"
        from %r/^\s*(#\s*(else)\b).*/
        to %r/(?=^\s*#\s*endif\b.*$)/
        both 1 => 'meta.preprocessor.c',
             2 => 'keyword.control.import.else.c'
        include "#disabled"
        include "#pragma-mark"
      end
      rule do
        from %r//
        to %r/(?=^\s*#\s*(else|endif)\b.*$)/
        include "#block_innards"
      end
    end
  end

  fragment :"preprocessor-rule-other" do
    rule do
      from %r'^\s*(#\s*(if(n?def)?)\b.*?(?:(?=(?://|/\*))|$))'
      to %r/^\s*(#\s*(endif)\b).*$/
      both 1 => 'meta.preprocessor.c',
           2 => 'keyword.control.import.c'
      include "$base"
    end
  end

  fragment :"preprocessor-rule-other-block" do
    rule do
      from %r'^\s*(#\s*(if(n?def)?)\b.*?(?:(?=(?://|/\*))|$))'
      to %r/^\s*(#\s*(endif)\b).*$/
      both 1 => 'meta.preprocessor.c',
           2 => 'keyword.control.import.c'
      include "#block_innards"
    end
  end

  fragment :sizeof do
    rule 'keyword.operator.sizeof.c' do
      match %r/\b(sizeof)\b/
    end
  end

  fragment :string_escaped_char do
    rule 'constant.character.escape.c' do
      match %r/\\(\\|[abefnprtv'"?]|[0-3]\d{,2}|[4-7]\d?|x[a-fA-F0-9]{,2}|u[a-fA-F0-9]{,4}|U[a-fA-F0-9]{,8})/
    end
    rule 'invalid.illegal.unknown-escape.c' do
      match %r/\\./
    end
  end

  fragment :string_placeholder do
    rule 'constant.other.placeholder.c' do
      match %r/(?x)%
                (\d+\$)?                             # field (argument #)
                [#0\- +']*                           # flags
                [,;:_]?                              # separator character (AltiVec)
                ((-?\d+)|\*(-?\d+\$)?)?              # minimum field width
                (\.((-?\d+)|\*(-?\d+\$)?)?)?         # precision
                (hh|h|ll|l|j|t|z|q|L|vh|vl|v|hv|hl)? # length modifier
                [diouxXDOUeEfFgGaACcSspn%]           # conversion type
              /
    end
    rule 'invalid.illegal.placeholder.c' do
      match %r/%/
    end
  end
end
