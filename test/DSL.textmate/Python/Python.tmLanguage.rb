# encoding: utf-8

language 'Python' => 'source.python' do
  #
  # todo:
  #   list comprehension / generator comprehension scope.
  #
  file_types %w(py rpy pyw cpy SConstruct Sconstruct sconstruct SConscript gyp gypi)
  first_line_match %r'^#!/.*\bpython\b'
  key_equivalent "^~P"  # TextMate only
  uuid "F23DB5B2-7D08-11D9-A709-000D93B6E43C"  # TextMate only
  bundle_uuid "E3BADC20-6B0E-11D9-9DC9-000D93589AF6"  # TextMate only

  rule do
    from %r/(^[ \t]+)?(?=#)/,
      1 => 'punctuation.whitespace.comment.leading.python'
    to %r/(?!\G)/
    rule 'comment.line.number-sign.python' do
      from %r/#/,
        0 => 'punctuation.definition.comment.python'
      to %r/\n/
    end
  end
  rule 'constant.numeric.integer.long.hexadecimal.python' do
    match %r/\b(?i:(0x\h*)L)/
  end
  rule 'constant.numeric.integer.hexadecimal.python' do
    match %r/\b(?i:(0x\h*))/
  end
  rule 'constant.numeric.integer.long.octal.python' do
    match %r/\b(?i:(0[0-7]+)L)/
  end
  rule 'constant.numeric.integer.octal.python' do
    match %r/\b(0[0-7]+)/
  end
  rule 'constant.numeric.complex.python' do
    match %r/\b(?i:(((\d+(\.(?=[^a-zA-Z_])\d*)?|(?<=[^0-9a-zA-Z_])\.\d+)(e[\-\+]?\d+)?))J)/
  end
  rule 'constant.numeric.float.python' do
    match %r/\b(?i:(\d+\.\d*(e[\-\+]?\d+)?))(?=[^a-zA-Z_])/
  end
  rule 'constant.numeric.float.python' do
    match %r/(?<=[^0-9a-zA-Z_])(?i:(\.\d+(e[\-\+]?\d+)?))/
  end
  rule 'constant.numeric.float.python' do
    match %r/\b(?i:(\d+e[\-\+]?\d+))/
  end
  rule 'constant.numeric.integer.long.decimal.python' do
    match %r/\b(?i:([1-9]+[0-9]*|0)L)/
  end
  rule 'constant.numeric.integer.decimal.python' do
    match %r/\b([1-9]+[0-9]*|0)/
  end
  rule do
    match %r/\b(global)\b/,
      1 => 'storage.modifier.global.python'
  end
  rule do
    match %r/\b(?:(import)|(from))\b/,
      1 => 'keyword.control.import.python',
      2 => 'keyword.control.import.from.python'
  end
  rule 'keyword.control.flow.python' do
    # keywords that delimit flow blocks or alter flow from within a block
    match %r/\b(elif|else|except|finally|for|if|try|while|with|break|continue|pass|raise|return|yield)\b/
  end
  rule 'keyword.operator.logical.python' do
    # keyword operators that evaluate to True or False
    match %r/\b(and|in|is|not|or)\b/
  end
  rule do
    # keywords that haven't fit into other groups (yet).
    match %r/\b(as|assert|del|exec|print)\b/,
      1 => 'keyword.other.python'
  end
  rule 'invalid.deprecated.operator.python' do
    match %r/<>/
  end
  rule 'keyword.operator.comparison.python' do
    match %r/<\=|>\=|\=\=|<|>|\!\=/
  end
  rule 'keyword.operator.assignment.augmented.python' do
    match %r'\+\=|-\=|\*\=|/\=|//\=|%\=|&\=|\|\=|\^\=|>>\=|<<\=|\*\*\='
  end
  rule 'keyword.operator.arithmetic.python' do
    match %r'\+|\-|\*|\*\*|/|//|%|<<|>>|&|\||\^|~'
  end
  rule 'keyword.operator.assignment.python' do
    match %r/\=/
  end
  rule 'meta.class.old-style.python' do
    content_scope "entity.name.type.class.python"
    from %r/^\s*(class)\s+(?=[a-zA-Z_][a-zA-Z_0-9]*\s*\:)/,
      1 => 'storage.type.class.python'
    to %r/\s*(:)/,
      1 => 'punctuation.section.class.begin.python'
    include "#entity_name_class"
  end
  rule 'meta.class.python' do
    from %r/^\s*(class)\s+(?=[a-zA-Z_][a-zA-Z_0-9]*\s*\()/,
      1 => 'storage.type.class.python'
    to %r/(\))\s*(?:(\:)|(.*$\n?))/,
      1 => 'punctuation.definition.inheritance.end.python',
      2 => 'punctuation.section.class.begin.python',
      3 => 'invalid.illegal.missing-section-begin.python'
    rule do
      content_scope "entity.name.type.class.python"
      from %r/(?=[A-Za-z_][A-Za-z0-9_]*)/
      to %r/(?![A-Za-z0-9_])/
      include "#entity_name_class"
    end
    rule do
      content_scope "meta.class.inheritance.python"
      from %r/(\()/,
        1 => 'punctuation.definition.inheritance.begin.python'
      to %r/(?=\)|:)/
      rule do
        content_scope "entity.other.inherited-class.python"
        from %r/(?<=\(|,)\s*/
        to %r/\s*(?:(,)|(?=\)))/,
          1 => 'punctuation.separator.inheritance.python'
        include "$self"
      end
    end
  end
  rule 'meta.class.python' do
    from %r/^\s*(class)\s+(?=[a-zA-Z_][a-zA-Z_0-9])/,
      1 => 'storage.type.class.python'
    to %r/(\()|(\s*$\n?|#.*$\n?)/,
      1 => 'punctuation.definition.inheritance.begin.python',
      2 => 'invalid.illegal.missing-inheritance.python'
    rule do
      content_scope "entity.name.type.class.python"
      from %r/(?=[A-Za-z_][A-Za-z0-9_]*)/
      to %r/(?![A-Za-z0-9_])/
      include "#entity_name_function"
    end
  end
  rule 'meta.function.python' do
    from %r/^\s*(def)\s+(?=[A-Za-z_][A-Za-z0-9_]*\s*\()/,
      1 => 'storage.type.function.python'
    to %r/(\))\s*(?:(\:)|(.*$\n?))/,
      1 => 'punctuation.definition.parameters.end.python',
      2 => 'punctuation.section.function.begin.python',
      3 => 'invalid.illegal.missing-section-begin.python'
    rule do
      content_scope "entity.name.function.python"
      from %r/(?=[A-Za-z_][A-Za-z0-9_]*)/
      to %r/(?![A-Za-z0-9_])/
      include "#entity_name_function"
    end
    rule do
      content_scope "meta.function.parameters.python"
      from %r/(\()/,
        1 => 'punctuation.definition.parameters.begin.python'
      to %r/(?=\)\s*\:)/
      include "#keyword_arguments"
      rule do
        match %r/\b([a-zA-Z_][a-zA-Z_0-9]*)\s*(?:(,)|(?=[\n\)]))/,
          1 => 'variable.parameter.function.python',
          2 => 'punctuation.separator.parameters.python'
      end
    end
  end
  rule 'meta.function.python' do
    from %r/^\s*(def)\s+(?=[A-Za-z_][A-Za-z0-9_]*)/,
      1 => 'storage.type.function.python'
    to %r/(\()|\s*($\n?|#.*$\n?)/,
      1 => 'punctuation.definition.parameters.begin.python',
      2 => 'invalid.illegal.missing-parameters.python'
    rule do
      content_scope "entity.name.function.python"
      from %r/(?=[A-Za-z_][A-Za-z0-9_]*)/
      to %r/(?![A-Za-z0-9_])/
      include "#entity_name_function"
    end
  end
  rule 'meta.function.inline.python' do
    from %r/(lambda)(?=\s+)/,
      1 => 'storage.type.function.inline.python'
    to %r/(\:)/,
      1 => 'punctuation.definition.parameters.end.python',
      2 => 'punctuation.section.function.begin.python',
      3 => 'invalid.illegal.missing-section-begin.python'
    rule do
      content_scope "meta.function.inline.parameters.python"
      from %r/\s+/
      to %r/(?=\:)/
      include "#keyword_arguments"
      rule do
        match %r/\b([a-zA-Z_][a-zA-Z_0-9]*)\s*(?:(,)|(?=[\n\)\:]))/,
          1 => 'variable.parameter.function.python',
          2 => 'punctuation.separator.parameters.python'
      end
    end
  end
  rule 'meta.function.decorator.python' do
    # a decorator may be a function call which returns a decorator.
    from %r/^\s*(?=@\s*[A-Za-z_][A-Za-z0-9_]*(?:\.[a-zA-Z_][a-zA-Z_0-9]*)*\s*\()/
    to %r/(\))/,
      1 => 'punctuation.definition.arguments.end.python'
    rule do
      content_scope "entity.name.function.decorator.python"
      from %r/(?=(@)\s*[A-Za-z_][A-Za-z0-9_]*(?:\.[A-Za-z_][A-Za-z0-9_]*)*\s*\()/,
        1 => 'punctuation.definition.decorator.python'
      to %r/(?=\s*\()/
      include "#dotted_name"
    end
    rule do
      content_scope "meta.function.decorator.arguments.python"
      from %r/(\()/,
        1 => 'punctuation.definition.arguments.begin.python'
      to %r/(?=\))/
      include "#keyword_arguments"
      include "$self"
    end
  end
  rule 'meta.function.decorator.python' do
    content_scope "entity.name.function.decorator.python"
    from %r/^\s*(?=@\s*[A-Za-z_][A-Za-z0-9_]*(?:\.[a-zA-Z_][a-zA-Z_0-9]*)*)/
    to %r/(?=\s|$\n?|#)/
    rule do
      from %r/(?=(@)\s*[A-Za-z_][A-Za-z0-9_]*(\.[A-Za-z_][A-Za-z0-9_]*)*)/,
        1 => 'punctuation.definition.decorator.python'
      to %r/(?=\s|$\n?|#)/
      include "#dotted_name"
    end
  end
  rule 'meta.function-call.python' do
    content_scope "meta.function-call.arguments.python"
    from %r/(?<=\)|\])\s*(\()/,
      1 => 'punctuation.definition.arguments.begin.python'
    to %r/(\))/,
      1 => 'punctuation.definition.arguments.end.python'
    include "#keyword_arguments"
    include "$self"
  end
  rule 'meta.function-call.python' do
    from %r/(?=[A-Za-z_][A-Za-z0-9_]*(?:\.[a-zA-Z_][a-zA-Z_0-9]*)*\s*\()/
    to %r/(\))/,
      1 => 'punctuation.definition.arguments.end.python'
    rule do
      from %r/(?=[A-Za-z_][A-Za-z0-9_]*(?:\.[A-Za-z_][A-Za-z0-9_]*)*\s*\()/
      to %r/(?=\s*\()/
      include "#dotted_name"
    end
    rule do
      content_scope "meta.function-call.arguments.python"
      from %r/(\()/,
        1 => 'punctuation.definition.arguments.begin.python'
      to %r/(?=\))/
      include "#keyword_arguments"
      include "$self"
    end
  end
  rule 'meta.item-access.python' do
    from %r/(?=[A-Za-z_][A-Za-z0-9_]*(?:\.[a-zA-Z_][a-zA-Z_0-9]*)*\s*\[)/
    to %r/(\])/,
      1 => 'punctuation.definition.arguments.end.python'
    rule do
      from %r/(?=[A-Za-z_][A-Za-z0-9_]*(?:\.[A-Za-z_][A-Za-z0-9_]*)*\s*\[)/
      to %r/(?=\s*\[)/
      include "#dotted_name"
    end
    rule do
      content_scope "meta.item-access.arguments.python"
      from %r/(\[)/,
        1 => 'punctuation.definition.arguments.begin.python'
      to %r/(?=\])/
      include "$self"
    end
  end
  rule 'meta.item-access.python' do
    content_scope "meta.item-access.arguments.python"
    from %r/(?<=\)|\])\s*(\[)/,
      1 => 'punctuation.definition.arguments.begin.python'
    to %r/(\])/,
      1 => 'punctuation.definition.arguments.end.python'
    include "$self"
  end
  rule do
    match %r/\b(def|lambda)\b/,
      1 => 'storage.type.function.python'
  end
  rule do
    match %r/\b(class)\b/,
      1 => 'storage.type.class.python'
  end
  include "#line_continuation"
  include "#language_variables"
  rule 'constant.language.python' do
    match %r/\b(None|True|False|Ellipsis|NotImplemented)\b/
  end
  include "#string_quoted_single"
  include "#string_quoted_double"
  include "#dotted_name"
  rule do
    from %r/(\()/
    to %r/(\))/
    include "$self"
  end
  rule do
    match %r/(\[)(\s*(\]))\b/,
      1 => 'punctuation.definition.list.begin.python',
      2 => 'meta.empty-list.python',
      3 => 'punctuation.definition.list.end.python'
  end
  rule 'meta.structure.list.python' do
    from %r/(\[)/,
      1 => 'punctuation.definition.list.begin.python'
    to %r/(\])/,
      1 => 'punctuation.definition.list.end.python'
    rule do
      content_scope "meta.structure.list.item.python"
      from %r/(?<=\[|\,)\s*(?![\],])/
      to %r/\s*(?:(,)|(?=\]))/,
        1 => 'punctuation.separator.list.python'
      include "$self"
    end
  end
  rule 'meta.structure.tuple.python' do
    match %r/(\()(\s*(\)))/,
      1 => 'punctuation.definition.tuple.begin.python',
      2 => 'meta.empty-tuple.python',
      3 => 'punctuation.definition.tuple.end.python'
  end
  rule 'meta.structure.dictionary.python' do
    match %r/(\{)(\s*(\}))/,
      1 => 'punctuation.definition.dictionary.begin.python',
      2 => 'meta.empty-dictionary.python',
      3 => 'punctuation.definition.dictionary.end.python'
  end
  rule 'meta.structure.dictionary.python' do
    from %r/(\{)/,
      1 => 'punctuation.definition.dictionary.begin.python'
    to %r/(\})/,
      1 => 'punctuation.definition.dictionary.end.python'
    rule do
      content_scope "meta.structure.dictionary.key.python"
      from %r/(?<=\{|\,|^)\s*(?![\},])/
      to %r/\s*(?:(?=\})|(\:))/,
        1 => 'punctuation.separator.valuepair.dictionary.python'
      include "$self"
    end
    rule do
      content_scope "meta.structure.dictionary.value.python"
      from %r/(?<=\:|^)\s*/
      to %r/\s*(?:(?=\})|(,))/,
        1 => 'punctuation.separator.dictionary.python'
      include "$self"
    end
  end

  fragment :builtin_exceptions do
    rule 'support.type.exception.python' do
      match %r/(?x)\b(
        (
          Arithmetic|Assertion|Attribute|BlockingIO|BrokenPipe|Buffer|ChildProcess|
          Connection(Aborted|Refused|Reset)?|EOF|Environment|FileExists|
          FileNotFound|FloatingPoint|Interrupted|IO|IsADirectoryError|
          Import|Indentation|Index|Key|Lookup|Memory|Name|NotADirectory|
          NotImplemented|OS|Overflow|Permission|ProcessLookup|Reference|
          Runtime|Standard|Syntax|System|Tab|Timeout|Type|UnboundLocal|
          Unicode(Encode|Decode|Translate)?|Value|VMS|Windows|ZeroDivision
        )Error|
        ((Pending)?Deprecation|Runtime|Syntax|User|Future|Import|Unicode|Bytes)?Warning|
        (Base)?Exception|
        SystemExit|StopIteration|NotImplemented|KeyboardInterrupt|GeneratorExit
      )\b/
    end
  end

  fragment :builtin_functions do
    rule 'support.function.builtin.python' do
      match %r/(?x)\b(
        __import__|all|abs|any|apply|ascii|bin|callable|chr|classmethod|cmp|coerce|
        compile|delattr|dir|divmod|enumerate|eval|execfile|filter|format|getattr|
        globals|hasattr|hash|help|hex|id|input|intern|isinstance|issubclass|iter|
        len|locals|map|max|min|next|oct|open|ord|pow|print|property|range|
        raw_input|reduce|reload|repr|reversed|round|setattr|sorted|staticmethod|
        sum|super|type|unichr|vars|zip
      )\b/
    end
  end

  fragment :builtin_types do
    rule 'support.type.python' do
      match %r/(?x)\b(
        basestring|bool|buffer|bytearray|bytes|complex|dict|float|frozenset|int|
        list|long|memoryview|object|range|set|slice|str|tuple|unicode|xrange
      )\b/
    end
  end

  fragment :constant_placeholder do
    rule 'constant.other.placeholder.python' do
      match %r/(?i:(%(\([a-z_]+\))?#?0?\-?[ ]?\+?([0-9]*|\*)(\.([0-9]*|\*))?[hL]?[a-z%])|(\{([!\[\].:\w ]+)?\}))/
    end
  end

  # FIXME: this fragment is never referenced
  fragment :docstrings do
    rule 'comment.block.python' do
      from %r/^\s*(?=[uU]?[rR]?""")/
      to %r/(?<=""")/
      include "#string_quoted_double"
    end
    rule 'comment.block.python' do
      from %r/^\s*(?=[uU]?[rR]?''')/
      to %r/(?<=''')/
      include "#string_quoted_single"
    end
  end

  fragment :dotted_name do
    rule do
      from %r/(?=[A-Za-z_][A-Za-z0-9_]*(?:\.[A-Za-z_][A-Za-z0-9_]*)*)/
      to %r/(?![A-Za-z0-9_\.])/
      rule do
        from %r/(\.)(?=[A-Za-z_][A-Za-z0-9_]*)/
        to %r/(?![A-Za-z0-9_])/
        include "#magic_function_names"
        include "#magic_variable_names"
        include "#illegal_names"
        include "#generic_names"
      end
      rule do
        from %r/(?<!\.)(?=[A-Za-z_][A-Za-z0-9_]*)/
        to %r/(?![A-Za-z0-9_])/
        include "#builtin_functions"
        include "#builtin_types"
        include "#builtin_exceptions"
        include "#illegal_names"
        include "#magic_function_names"
        include "#magic_variable_names"
        include "#language_variables"
        include "#generic_names"
      end
    end
  end

  fragment :entity_name_class do
    include "#illegal_names"
    include "#generic_names"
  end

  fragment :entity_name_function do
    include "#magic_function_names"
    include "#illegal_names"
    include "#generic_names"
  end

  fragment :escaped_char do
    rule do
      match %r/(\\x[0-9A-F]{2})|(\\[0-7]{3})|(\\\n)|(\\\\)|(\\\")|(\\')|(\\a)|(\\b)|(\\f)|(\\n)|(\\r)|(\\t)|(\\v)/,
        1 => 'constant.character.escape.hex.python',
        2 => 'constant.character.escape.octal.python',
        3 => 'constant.character.escape.newline.python',
        4 => 'constant.character.escape.backlash.python',
        5 => 'constant.character.escape.double-quote.python',
        6 => 'constant.character.escape.single-quote.python',
        7 => 'constant.character.escape.bell.python',
        8 => 'constant.character.escape.backspace.python',
        9 => 'constant.character.escape.formfeed.python',
        10 => 'constant.character.escape.linefeed.python',
        11 => 'constant.character.escape.return.python',
        12 => 'constant.character.escape.tab.python',
        13 => 'constant.character.escape.vertical-tab.python'
    end
  end

  fragment :escaped_unicode_char do
    rule do
      match %r/(\\U[0-9A-Fa-f]{8})|(\\u[0-9A-Fa-f]{4})|(\\N\{[a-zA-Z ]+\})/,
        1 => 'constant.character.escape.unicode.16-bit-hex.python',
        2 => 'constant.character.escape.unicode.32-bit-hex.python',
        3 => 'constant.character.escape.unicode.name.python'
    end
  end

  # FIXME: this fragment is never referenced
  fragment :function_name do
    include "#magic_function_names"
    include "#magic_variable_names"
    include "#builtin_exceptions"
    include "#builtin_functions"
    include "#builtin_types"
    include "#generic_names"
  end

  fragment :generic_names do
    rule do
      match %r/[A-Za-z_][A-Za-z0-9_]*/
    end
  end

  fragment :illegal_names do
    rule 'invalid.illegal.name.python' do
      match %r/\b(and|as|assert|break|class|continue|def|del|elif|else|except|exec|finally|for|from|global|if|import|in|is|lambda|not|or|pass|print|raise|return|try|while|with|yield)\b/
    end
  end

  fragment :keyword_arguments do
    rule do
      from %r/\b([a-zA-Z_][a-zA-Z_0-9]*)\s*(=)(?!=)/,
        1 => 'variable.parameter.function.python',
        2 => 'keyword.operator.assignment.python'
      to %r/\s*(?:(,)|(?=$\n?|[\)\:]))/,
        1 => 'punctuation.separator.parameters.python'
      include "$self"
    end
  end

  fragment :language_variables do
    rule 'variable.language.python' do
      match %r/\b(self|cls)\b/
    end
  end

  fragment :line_continuation do
    rule do
      match %r/(\\)(.*)$\n?/,
        1 => 'punctuation.separator.continuation.line.python',
        2 => 'invalid.illegal.unexpected-text.python'
    end
  end

  fragment :magic_function_names do
    rule 'support.function.magic.python' do
      # these methods have magic interpretation by python and are generally called indirectly through syntactic constructs
      match %r/(?x)\b(__(?:
            abs|add|and|call|cmp|coerce|complex|contains|del|delattr|
            delete|delitem|delslice|div|divmod|enter|eq|exit|float|
            floordiv|ge|get|getattr|getattribute|getitem|getslice|gt|
            hash|hex|iadd|iand|idiv|ifloordiv|ilshift|imod|imul|init|
            int|invert|ior|ipow|irshift|isub|iter|itruediv|ixor|le|len|
            long|lshift|lt|mod|mul|ne|neg|new|nonzero|oct|or|pos|pow|
            radd|rand|rdiv|rdivmod|repr|rfloordiv|rlshift|rmod|rmul|ror|
            rpow|rrshift|rshift|rsub|rtruediv|rxor|set|setattr|setitem|
            setslice|str|sub|truediv|unicode|xor
          )__)\b/
    end
  end

  fragment :magic_variable_names do
    rule 'support.variable.magic.python' do
      # magic variables which a class/module may have.
      match %r/\b__(all|bases|class|debug|dict|doc|file|members|metaclass|methods|name|slots|weakref)__\b/
    end
  end

  fragment :regular_expressions do
    rule do
      # Changed disabled to 1 to turn off syntax highlighting in “r” strings.
      disabled false
      include "source.regexp.python"
    end
  end

  fragment :string_quoted_double do
    rule 'string.quoted.double.block.unicode-raw-regex.python' do
      # single quoted unicode-raw string
      from %r/([uU]r)(""")/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/"""/,
        0 => 'punctuation.definition.string.end.python'
      include "#constant_placeholder"
      include "#escaped_unicode_char"
      include "#escaped_char"
      include "#regular_expressions"
    end
    rule 'string.quoted.double.block.unicode-raw.python' do
      # single quoted unicode-raw string without regular expression highlighting
      from %r/([uU]R)(""")/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/"""/,
        0 => 'punctuation.definition.string.end.python'
      include "#constant_placeholder"
      include "#escaped_unicode_char"
      include "#escaped_char"
    end
    rule 'string.quoted.double.block.raw-regex.python' do
      # double quoted raw string
      from %r/(r)(""")/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/"""/,
        0 => 'punctuation.definition.string.end.python'
      include "#constant_placeholder"
      include "#escaped_char"
      include "#regular_expressions"
    end
    rule 'string.quoted.double.block.raw.python' do
      # double quoted raw string
      from %r/(R)(""")/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/"""/,
        0 => 'punctuation.definition.string.end.python'
      include "#constant_placeholder"
      include "#escaped_char"
    end
    rule 'string.quoted.double.block.unicode.python' do
      # double quoted unicode string
      from %r/([uU])(""")/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/"""/,
        0 => 'punctuation.definition.string.end.python'
      include "#constant_placeholder"
      include "#escaped_unicode_char"
      include "#escaped_char"
    end
    rule 'string.quoted.double.single-line.unicode-raw-regex.python' do
      # double-quoted raw string
      from %r/([uU]r)(")/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/(")|(\n)/,
        1 => 'punctuation.definition.string.end.python',
        2 => 'invalid.illegal.unclosed-string.python'
      include "#constant_placeholder"
      include "#escaped_unicode_char"
      include "#escaped_char"
      include "#regular_expressions"
    end
    rule 'string.quoted.double.single-line.unicode-raw.python' do
      # double-quoted raw string
      from %r/([uU]R)(")/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/(")|(\n)/,
        1 => 'punctuation.definition.string.end.python',
        2 => 'invalid.illegal.unclosed-string.python'
      include "#constant_placeholder"
      include "#escaped_unicode_char"
      include "#escaped_char"
    end
    rule 'string.quoted.double.single-line.raw-regex.python' do
      # double-quoted raw string
      from %r/(r)(")/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/(")|(\n)/,
        1 => 'punctuation.definition.string.end.python',
        2 => 'invalid.illegal.unclosed-string.python'
      include "#constant_placeholder"
      include "#escaped_char"
      include "#regular_expressions"
    end
    rule 'string.quoted.double.single-line.raw.python' do
      # double-quoted raw string
      from %r/(R)(")/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/(")|(\n)/,
        1 => 'punctuation.definition.string.end.python',
        2 => 'invalid.illegal.unclosed-string.python'
      include "#constant_placeholder"
      include "#escaped_char"
    end
    rule 'string.quoted.double.single-line.unicode.python' do
      # double quoted unicode string
      from %r/([uU])(")/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/(")|(\n)/,
        1 => 'punctuation.definition.string.end.python',
        2 => 'invalid.illegal.unclosed-string.python'
      include "#constant_placeholder"
      include "#escaped_unicode_char"
      include "#escaped_char"
    end
    rule 'string.quoted.double.block.sql.python' do
      # double quoted string
      from %r/(""")(?=\s*(SELECT|INSERT|UPDATE|DELETE|CREATE|REPLACE|ALTER))/,
        1 => 'punctuation.definition.string.begin.python'
      to %r/"""/,
        0 => 'punctuation.definition.string.end.python'
      include "#constant_placeholder"
      include "#escaped_char"
      include "source.sql"
    end
    rule 'string.quoted.double.single-line.sql.python' do
      # double quoted string
      from %r/(")(?=\s*(SELECT|INSERT|UPDATE|DELETE|CREATE|REPLACE|ALTER))/,
        1 => 'punctuation.definition.string.begin.python'
      to %r/(")|(\n)/,
        1 => 'punctuation.definition.string.end.python',
        2 => 'invalid.illegal.unclosed-string.python'
      include "#constant_placeholder"
      include "#escaped_char"
      include "source.sql"
    end
    rule 'string.quoted.double.block.python' do
      # double quoted string
      from %r/(""")/,
        1 => 'punctuation.definition.string.begin.python'
      to %r/"""/,
        0 => 'punctuation.definition.string.end.python'
      include "#constant_placeholder"
      include "#escaped_char"
    end
    rule 'string.quoted.double.single-line.python' do
      # double quoted string
      from %r/(")/,
        1 => 'punctuation.definition.string.begin.python'
      to %r/(")|(\n)/,
        1 => 'punctuation.definition.string.end.python',
        2 => 'invalid.illegal.unclosed-string.python'
      include "#constant_placeholder"
      include "#escaped_char"
    end
  end

  fragment :string_quoted_single do
    rule 'string.quoted.single.block.unicode-raw-regex.python' do
      # single quoted unicode-raw string
      from %r/([uU]r)(''')/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/'''/,
        0 => 'punctuation.definition.string.end.python'
      include "#constant_placeholder"
      include "#escaped_unicode_char"
      include "#escaped_char"
      include "#regular_expressions"
    end
    rule 'string.quoted.single.block.unicode-raw.python' do
      # single quoted unicode-raw string
      from %r/([uU]R)(''')/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/'''/,
        0 => 'punctuation.definition.string.end.python'
      include "#constant_placeholder"
      include "#escaped_unicode_char"
      include "#escaped_char"
    end
    rule 'string.quoted.single.block.raw-regex.python' do
      # single quoted raw string
      from %r/(r)(''')/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/'''/,
        0 => 'punctuation.definition.string.end.python'
      include "#constant_placeholder"
      include "#escaped_char"
      include "#regular_expressions"
    end
    rule 'string.quoted.single.block.raw.python' do
      # single quoted raw string
      from %r/(R)(''')/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/'''/,
        0 => 'punctuation.definition.string.end.python'
      include "#constant_placeholder"
      include "#escaped_char"
    end
    rule 'string.quoted.single.block.unicode.python' do
      # single quoted unicode string
      from %r/([uU])(''')/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/'''/,
        0 => 'punctuation.definition.string.end.python'
      include "#constant_placeholder"
      include "#escaped_unicode_char"
      include "#escaped_char"
    end
    rule 'string.quoted.single.single-line.unicode-raw-regex.python' do
      # single quoted raw string
      from %r/([uU]r)(')/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/(')|(\n)/,
        1 => 'punctuation.definition.string.end.python',
        2 => 'invalid.illegal.unclosed-string.python'
      include "#constant_placeholder"
      include "#escaped_unicode_char"
      include "#escaped_char"
      include "#regular_expressions"
    end
    rule 'string.quoted.single.single-line.unicode-raw.python' do
      # single quoted raw string
      from %r/([uU]R)(')/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/(')|(\n)/,
        1 => 'punctuation.definition.string.end.python',
        2 => 'invalid.illegal.unclosed-string.python'
      include "#constant_placeholder"
      include "#escaped_unicode_char"
      include "#escaped_char"
    end
    rule 'string.quoted.single.single-line.raw-regex.python' do
      # single quoted raw string
      from %r/(r)(')/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/(')|(\n)/,
        1 => 'punctuation.definition.string.end.python',
        2 => 'invalid.illegal.unclosed-string.python'
      include "#constant_placeholder"
      include "#escaped_char"
      include "#regular_expressions"
    end
    rule 'string.quoted.single.single-line.raw.python' do
      # single quoted raw string
      from %r/(R)(')/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/(')|(\n)/,
        1 => 'punctuation.definition.string.end.python',
        2 => 'invalid.illegal.unclosed-string.python'
      include "#constant_placeholder"
      include "#escaped_char"
    end
    rule 'string.quoted.single.single-line.unicode.python' do
      # single quoted unicode string
      from %r/([uU])(')/,
        1 => 'storage.type.string.python',
        2 => 'punctuation.definition.string.begin.python'
      to %r/(')|(\n)/,
        1 => 'punctuation.definition.string.end.python',
        2 => 'invalid.illegal.unclosed-string.python'
      include "#constant_placeholder"
      include "#escaped_unicode_char"
      include "#escaped_char"
    end
    rule 'string.quoted.single.block.python' do
      # single quoted string
      from %r/(''')(?=\s*(SELECT|INSERT|UPDATE|DELETE|CREATE|REPLACE|ALTER))/,
        1 => 'punctuation.definition.string.begin.python'
      to %r/'''/,
        0 => 'punctuation.definition.string.end.python'
      include "#constant_placeholder"
      include "#escaped_char"
      include "source.sql"
    end
    rule 'string.quoted.single.single-line.python' do
      # single quoted string
      from %r/(')(?=\s*(SELECT|INSERT|UPDATE|DELETE|CREATE|REPLACE|ALTER))/,
        1 => 'punctuation.definition.string.begin.python'
      to %r/(')|(\n)/,
        1 => 'punctuation.definition.string.end.python',
        2 => 'invalid.illegal.unclosed-string.python'
      include "#constant_placeholder"
      include "#escaped_char"
      include "source.sql"
    end
    rule 'string.quoted.single.block.python' do
      # single quoted string
      from %r/(''')/,
        1 => 'punctuation.definition.string.begin.python'
      to %r/'''/,
        0 => 'punctuation.definition.string.end.python'
      include "#constant_placeholder"
      include "#escaped_char"
    end
    rule 'string.quoted.single.single-line.python' do
      # single quoted string
      from %r/(')/,
        1 => 'punctuation.definition.string.begin.python'
      to %r/(')|(\n)/,
        1 => 'punctuation.definition.string.end.python',
        2 => 'invalid.illegal.unclosed-string.python'
      include "#constant_placeholder"
      include "#escaped_char"
    end
  end

  # FIXME: this fragment is never referenced
  fragment :strings do
    include "#string_quoted_double"
    include "#string_quoted_single"
  end
end
