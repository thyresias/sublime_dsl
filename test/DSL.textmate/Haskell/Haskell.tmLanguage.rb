# encoding: utf-8

language 'Haskell' => 'source.haskell' do
  file_types %w(hs)
  key_equivalent "^~H"  # TextMate only
  uuid "5C034675-1F6D-497E-8073-369D37E2FD7D"  # TextMate only

  rule 'keyword.operator.function.infix.haskell' do
    # In case this regex seems unusual for an infix operator, note that Haskell allows any ordinary function application (elem 4 [1..10]) to be rewritten as an infix expression (4 `elem` [1..10]).
    match %r/(`)[\p{Ll}_][\p{Ll}_\p{Lu}\p{Lt}\p{Nd}']*(`)/,
      1 => 'punctuation.definition.entity.haskell',
      2 => 'punctuation.definition.entity.haskell'
  end
  rule 'constant.language.unit.haskell' do
    match %r/\(\)/
  end
  rule 'constant.language.empty-list.haskell' do
    match %r/\[\]/
  end
  rule 'meta.declaration.module.haskell' do
    from %r/(module)/
    to %r/(where)/
    both 1 => 'keyword.other.haskell'
    include "#module_name"
    include "#module_exports"
    rule 'invalid' do
      match %r/[a-z]+/
    end
  end
  rule 'meta.declaration.class.haskell' do
    from %r/\b(class)\b/
    to %r/\b(where)\b/
    both 1 => 'keyword.other.haskell'
    rule 'support.class.prelude.haskell' do
      match %r/\b(Monad|Functor|Eq|Ord|Read|Show|Num|(Frac|Ra)tional|Enum|Bounded|Real(Frac|Float)?|Integral|Floating)\b/
    end
    rule 'entity.other.inherited-class.haskell' do
      match %r/[\p{Lu}\p{Lt}][\p{Ll}_\p{Lu}\p{Lt}\p{Nd}']*/
    end
    rule 'variable.other.generic-type.haskell' do
      match %r/\b[\p{Ll}_][\p{Ll}_\p{Lu}\p{Lt}\p{Nd}']*/
    end
  end
  rule 'meta.declaration.instance.haskell' do
    from %r/\b(instance)\b/
    to %r/\b(where)\b|$/
    both 1 => 'keyword.other.haskell'
    include "#type_signature"
  end
  rule 'meta.import.haskell' do
    from %r/\b(import)\b/,
      1 => 'keyword.other.haskell'
    to %r/($|;|(?=--))/
    rule 'keyword.other.haskell' do
      match %r/(qualified|as|hiding)/
    end
    include "#module_name"
    include "#module_exports"
  end
  rule 'meta.deriving.haskell' do
    from %r/(deriving)\s*\(/,
      1 => 'keyword.other.haskell'
    to %r/\)/
    rule 'entity.other.inherited-class.haskell' do
      match %r/\b[\p{Lu}\p{Lt}][\p{Ll}_\p{Lu}\p{Lt}\p{Nd}']*/
    end
  end
  rule 'keyword.other.haskell' do
    match %r/\b(deriving|where|data|type|case|of|let|in|newtype|default)\b/
  end
  rule 'keyword.operator.haskell' do
    match %r/\binfix[lr]?\b/
  end
  rule 'keyword.control.haskell' do
    match %r/\b(do|if|then|else)\b/
  end
  rule 'constant.numeric.float.haskell' do
    # Floats are always decimal
    match %r/\b([0-9]+\.[0-9]+([eE][+-]?[0-9]+)?|[0-9]+[eE][+-]?[0-9]+)\b/
  end
  rule 'constant.numeric.haskell' do
    match %r/\b([0-9]+|0([xX][0-9a-fA-F]+|[oO][0-7]+))\b/
  end
  rule 'meta.preprocessor.c' do
    # In addition to Haskell's "native" syntax, GHC permits the C preprocessor to be run on a source file.
    match %r/^\s*(#)\s*\w+/,
      1 => 'punctuation.definition.preprocessor.c'
  end
  include "#pragma"
  rule 'string.quoted.double.haskell' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.haskell'
    to %r/"/,
      0 => 'punctuation.definition.string.end.haskell'
    rule 'constant.character.escape.haskell' do
      match %r/\\(NUL|SOH|STX|ETX|EOT|ENQ|ACK|BEL|BS|HT|LF|VT|FF|CR|SO|SI|DLE|DC1|DC2|DC3|DC4|NAK|SYN|ETB|CAN|EM|SUB|ESC|FS|GS|RS|US|SP|DEL|[abfnrtv\\\"'\&])/
    end
    rule 'constant.character.escape.octal.haskell' do
      match %r/\\o[0-7]+|\\x[0-9A-Fa-f]+|\\[0-9]+/
    end
    rule 'constant.character.escape.control.haskell' do
      match %r/\^[A-Z@\[\]\\\^_]/
    end
  end
  rule 'string.quoted.single.haskell' do
    match %r/(?x)
      (')
      (?:
        [\ -\[\]-~]                # Basic Char
        | (\\(?:NUL|SOH|STX|ETX|EOT|ENQ|ACK|BEL|BS|HT|LF|VT|FF|CR|SO|SI|DLE
          |DC1|DC2|DC3|DC4|NAK|SYN|ETB|CAN|EM|SUB|ESC|FS|GS|RS
          |US|SP|DEL|[abfnrtv\\\"'\&]))    # Escapes
        | (\\o[0-7]+)                # Octal Escapes
        | (\\x[0-9A-Fa-f]+)            # Hexadecimal Escapes
        | (\^[A-Z@\[\]\\\^_])            # Control Chars
      )
      (')
      /,
      1 => 'punctuation.definition.string.begin.haskell',
      2 => 'constant.character.escape.haskell',
      3 => 'constant.character.escape.octal.haskell',
      4 => 'constant.character.escape.hexadecimal.haskell',
      5 => 'constant.character.escape.control.haskell',
      6 => 'punctuation.definition.string.end.haskell'
  end
  rule 'meta.function.type-declaration.haskell' do
    from %r/^\s*(?<fn>(?:[\p{Ll}_][\p{Ll}_\p{Lu}\p{Lt}\p{Nd}']*|\((?!--+\))[\p{S}\p{P}&&[^(),;\[\]`{}_"']]+\))(?:\s*,\s*\g<fn>)?)\s*(::)/,
      2 => 'keyword.other.double-colon.haskell'
    to %r/$\n?/
    include "#type_signature"
  end
  rule 'support.constant.haskell' do
    match %r/\b(Just|Nothing|Left|Right|True|False|LT|EQ|GT|\(\)|\[\])\b/
  end
  rule 'constant.other.haskell' do
    match %r/\b[\p{Lu}\p{Lt}][\p{Ll}_\p{Lu}\p{Lt}\p{Nd}']*/
  end
  include "#comments"
  rule 'support.function.prelude.haskell' do
    match %r/\b(abs|acos|acosh|all|and|any|appendFile|applyM|asTypeOf|asin|asinh|atan|atan2|atanh|break|catch|ceiling|compare|concat|concatMap|const|cos|cosh|curry|cycle|decodeFloat|div|divMod|drop|dropWhile|elem|encodeFloat|enumFrom|enumFromThen|enumFromThenTo|enumFromTo|error|even|exp|exponent|fail|filter|flip|floatDigits|floatRadix|floatRange|floor|fmap|foldl|foldl1|foldr|foldr1|fromEnum|fromInteger|fromIntegral|fromRational|fst|gcd|getChar|getContents|getLine|head|id|init|interact|ioError|isDenormalized|isIEEE|isInfinite|isNaN|isNegativeZero|iterate|last|lcm|length|lex|lines|log|logBase|lookup|map|mapM|mapM_|max|maxBound|maximum|maybe|min|minBound|minimum|mod|negate|not|notElem|null|odd|or|otherwise|pi|pred|print|product|properFraction|putChar|putStr|putStrLn|quot|quotRem|read|readFile|readIO|readList|readLn|readParen|reads|readsPrec|realToFrac|recip|rem|repeat|replicate|return|reverse|round|scaleFloat|scanl|scanl1|scanr|scanr1|seq|sequence|sequence_|show|showChar|showList|showParen|showString|shows|showsPrec|significand|signum|sin|sinh|snd|span|splitAt|sqrt|subtract|succ|sum|tail|take|takeWhile|tan|tanh|toEnum|toInteger|toRational|truncate|uncurry|undefined|unlines|until|unwords|unzip|unzip3|userError|words|writeFile|zip|zip3|zipWith|zipWith3)\b/
  end
  include "#infix_op"
  rule 'keyword.operator.haskell' do
    # In case this regex seems overly general, note that Haskell permits the definition of new operators which can be nearly any string of punctuation characters, such as $%^&*.
    match %r/[\p{S}\p{P}&&[^(),;\[\]`{}_"']]+/
  end
  rule 'punctuation.separator.comma.haskell' do
    match %r/,/
  end

  fragment :block_comment do
    rule 'comment.block.haskell' do
      from %r/\{-(?!#)/
      to %r/-\}/
      both 0 => 'punctuation.definition.comment.haskell'
      to_last true
      include "#block_comment"
    end
  end

  fragment :comments do
    rule do
      # Operators may begin with '--' as long as they are not entirely composed of '-' characters. This means comments can't be immediately followed by an allowable operator character.
      from %r/(^[ \t]+)?(?=--+(?![\p{S}\p{P}&&[^(),;\[\]`{}_"']]))/,
        1 => 'punctuation.whitespace.comment.leading.haskell'
      to %r/(?!\G)/
      rule 'comment.line.double-dash.haskell' do
        from %r/--/,
          0 => 'punctuation.definition.comment.haskell'
        to %r/\n/
      end
    end
    include "#block_comment"
  end

  fragment :infix_op do
    rule 'entity.name.function.infix.haskell' do
      # An operator cannot be composed entirely of '-' characters; instead, it should be matched as a comment.
      match %r/(\((?!--+\))[\p{S}\p{P}&&[^(),;\[\]`{}_"']]+\)|\(,+\))/
    end
  end

  fragment :module_exports do
    rule 'meta.declaration.exports.haskell' do
      from %r/\(/
      to %r/\)/
      rule 'entity.name.function.haskell' do
        match %r/\b[\p{Ll}_][\p{Ll}_\p{Lu}\p{Lt}\p{Nd}']*/
      end
      rule 'storage.type.haskell' do
        match %r/\b[\p{Lu}\p{Lt}][\p{Ll}_\p{Lu}\p{Lt}\p{Nd}']*/
      end
      rule 'punctuation.separator.comma.haskell' do
        match %r/,/
      end
      include "#infix_op"
      rule 'meta.other.unknown.haskell' do
        # So named because I don't know what to call this.
        match %r/\(.*?\)/
      end
    end
  end

  fragment :module_name do
    rule 'support.other.module.haskell' do
      match %r/(?<conid>[\p{Lu}\p{Lt}][\p{Ll}_\p{Lu}\p{Lt}\p{Nd}']*(\.\g<conid>)?)/
    end
  end

  fragment :pragma do
    rule 'meta.preprocessor.haskell' do
      from %r/\{-#/
      to %r/#-\}/
      rule 'keyword.other.preprocessor.haskell' do
        match %r/\b(LANGUAGE|UNPACK|INLINE)\b/
      end
    end
  end

  fragment :type_signature do
    rule 'meta.class-constraint.haskell' do
      match %r/\(\s*([\p{Lu}\p{Lt}][\p{Ll}_\p{Lu}\p{Lt}\p{Nd}']*)\s+([\p{Ll}_][\p{Ll}_\p{Lu}\p{Lt}\p{Nd}']*)\)\s*(=>)/,
        1 => 'entity.other.inherited-class.haskell',
        2 => 'variable.other.generic-type.haskell',
        3 => 'keyword.other.big-arrow.haskell'
    end
    include "#pragma"
    rule 'keyword.other.arrow.haskell' do
      match %r/->/
    end
    rule 'keyword.other.big-arrow.haskell' do
      match %r/=>/
    end
    rule 'support.type.prelude.haskell' do
      match %r/\b(Int(eger)?|Maybe|Either|Bool|Float|Double|Char|String|Ordering|ShowS|ReadS|FilePath|IO(Error)?)\b/
    end
    rule 'variable.other.generic-type.haskell' do
      match %r/\b[\p{Ll}_][\p{Ll}_\p{Lu}\p{Lt}\p{Nd}']*/
    end
    rule 'storage.type.haskell' do
      match %r/\b[\p{Lu}\p{Lt}][\p{Ll}_\p{Lu}\p{Lt}\p{Nd}']*/
    end
    rule 'support.constant.unit.haskell' do
      match %r/\(\)/
    end
    include "#comments"
  end
end
