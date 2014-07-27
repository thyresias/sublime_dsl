# encoding: utf-8

language 'CoffeeScript' => 'source.coffee' do
  # CoffeeScript
  file_types %w(coffee Cakefile coffee.erb)
  key_equivalent "^~C"  # TextMate only
  uuid "5B520980-A7D5-4E10-8582-1A4C889A8DE5"  # TextMate only

  rule 'meta.inline.function.coffee' do
    # match stuff like: a -> …
    match %r/(\()([^()]*?)(\))\s*([=-]>)/,
      1 => 'punctuation.definition.parameters.begin.coffee',
      3 => 'punctuation.definition.parameters.begin.coffee',
      4 => 'storage.type.function.coffee'
  end
  rule 'meta.class.instance.constructor' do
    match %r/(new)\s+(\w+(?:\.\w*)*)/,
      1 => 'keyword.operator.new.coffee',
      2 => 'entity.name.type.instance.coffee'
  end
  rule 'string.quoted.heredoc.coffee' do
    from %r/'''/,
      0 => 'punctuation.definition.string.begin.coffee'
    to %r/'''/,
      0 => 'punctuation.definition.string.end.coffee'
  end
  rule 'string.quoted.double.heredoc.coffee' do
    from %r/"""/,
      0 => 'punctuation.definition.string.begin.coffee'
    to %r/"""/,
      0 => 'punctuation.definition.string.end.coffee'
    rule 'constant.character.escape.coffee' do
      match %r/\\./
    end
    include "#interpolated_coffee"
  end
  rule 'string.quoted.script.coffee' do
    from %r/`/,
      0 => 'punctuation.definition.string.begin.coffee'
    to %r/`/,
      0 => 'punctuation.definition.string.end.coffee'
    rule 'constant.character.escape.coffee' do
      match %r/\\(x\h{2}|[0-2][0-7]{,2}|3[0-6][0-7]|37[0-7]?|[4-7][0-7]?|.)/
    end
  end
  rule 'comment.block.coffee' do
    from %r/(?<!#)###(?!#)/
    to %r/###(?:[ \t]*\n)/
    both 0 => 'punctuation.definition.comment.coffee'
    rule 'storage.type.annotation.coffeescript' do
      match %r/@\w*/
    end
  end
  rule 'comment.line.number-sign.coffee' do
    from %r/(#)(?!\{)/,
      1 => 'punctuation.definition.comment.coffee'
    to %r/\n/
  end
  rule 'string.regexp.block.coffee' do
    from %r'/{3}',
      0 => 'punctuation.definition.string.begin.coffee'
    to %r'(/{3})[imgy]{0,4}',
      1 => 'punctuation.definition.string.end.coffee'
    include "source.js.regexp"
  end
  rule 'string.regexp.coffee' do
    from %r'/(?![\s=/*+{}?])',
      0 => 'punctuation.definition.string.begin.coffee'
    to %r'(/)[igmy]{0,4}(?![a-zA-Z0-9])',
      1 => 'punctuation.definition.string.end.coffee'
    include "source.js.regexp"
  end
  rule 'keyword.control.coffee' do
    match %r/(?x)
        \b(?<![\.\$])(
          break|by|catch|continue|else|finally|for|in|of|if|return|switch|
          then|throw|try|unless|when|while|until|loop|do|(?<=for)\s+own
        )(?!\s*:)\b
      /
  end
  rule 'keyword.operator.coffee' do
    match %r'(?x)
        and=|or=|!|%|&|\^|\*|\/|(\-)?\-(?!>)|\+\+|\+|~|==|=(?!>)|!=|<=|>=|<<=|>>=|
        >>>=|<>|<|>|!|&&|\.\.(\.)?|\?|\||\|\||\:|\*=|(?<!\()/=|%=|\+=|\-=|&=|
        \^=|\b(?<![\.\$])(instanceof|new|delete|typeof|and|or|is|isnt|not|super)\b
      '
  end
  rule 'variable.assignment.coffee' do
    match %r/([a-zA-Z\$_](\w|\$|\.)*\s*(?!\::)((:)|(=)(?!>))(?!(\s*\(.*\))?\s*([=-]>)))/,
      1 => 'variable.assignment.coffee',
      4 => 'punctuation.separator.key-value',
      5 => 'keyword.operator.coffee'
  end
  rule 'meta.variable.assignment.destructured.coffee' do
    from %r/(?<=\s|^)([\[\{])(?=.*?[\]\}]\s+[:=])/
    to %r/([\]\}]\s*[:=])/
    both 0 => 'keyword.operator.coffee'
    include "#variable_name"
    include "#instance_variable"
    include "#single_quoted_string"
    include "#double_quoted_string"
    include "#numeric"
  end
  rule 'meta.function.coffee' do
    match %r/(?x)
        (?<=^|\s)
        (?=@?[a-zA-Z\$_])
        (
          @?[a-zA-Z\$_](\w|\$|:|\.)*\s*
          (?=[:=](\s*(\()(.*)(\)))?\s*([=-]>))
        )
      /,
      1 => 'entity.name.function.coffee',
      2 => 'entity.name.function.coffee',
      4 => 'punctuation.definition.parameters.begin.coffee',
      6 => 'punctuation.definition.parameters.begin.coffee',
      7 => 'storage.type.function.coffee'
  end
  rule 'storage.type.function.coffee' do
    match %r/[=-]>/
  end
  rule 'constant.language.boolean.true.coffee' do
    match %r/\b(?<!\.)(true|on|yes)(?!\s*[:=])\b/
  end
  rule 'constant.language.boolean.false.coffee' do
    match %r/\b(?<!\.)(false|off|no)(?!\s*[:=])\b/
  end
  rule 'constant.language.null.coffee' do
    match %r/\b(?<!\.)null(?!\s*[:=])\b/
  end
  rule 'variable.language.coffee' do
    match %r/\b(?<!\.)(this|extends)(?!\s*[:=])\b/
  end
  rule 'meta.class.coffee' do
    match %r/(class\b)(?:\s+(extends)\s+(@?[a-zA-Z\$\._][\w\.]*))/,
      1 => 'storage.type.class.coffee',
      2 => 'keyword.control.inheritance.coffee',
      3 => 'entity.other.inherited-class.coffee'
  end
  rule 'meta.class.coffee' do
    match %r/(class\b)\s+(@?[a-zA-Z\$_][\w\.]*)?(?:\s+(extends)\s+(@?[a-zA-Z\$\._][\w\.]*))?/,
      1 => 'storage.type.class.coffee',
      2 => 'entity.name.type.class.coffee',
      3 => 'keyword.control.inheritance.coffee',
      4 => 'entity.other.inherited-class.coffee'
  end
  rule 'keyword.other.coffee' do
    match %r/\b(debugger|\\)\b/
  end
  rule 'support.class.coffee' do
    match %r/(?x)\b(
        Array|ArrayBuffer|Blob|Boolean|Date|document|Function|
        Int(8|16|32|64)Array|Math|Map|Number|
        Object|Proxy|RegExp|Set|String|WeakMap|
        window|Uint(8|16|32|64)Array|XMLHttpRequest
      )\b/
  end
  rule 'entity.name.type.object.coffee' do
    match %r/\b(console)\b/
  end
  rule 'support.function.console.coffee' do
    match %r/((?<=console\.)(debug|warn|info|log|error|time|timeEnd|assert))\b/
  end
  rule 'support.function.coffee' do
    match %r/(?x)\b(
        decodeURI(Component)?|encodeURI(Component)?|eval|parse(Float|Int)|require
      )\b/
  end
  rule 'support.function.method.array.coffee' do
    match %r/(?x)((?<=\.)(
        apply|call|concat|every|filter|forEach|from|hasOwnProperty|indexOf|
        isPrototypeOf|join|lastIndexOf|map|of|pop|propertyIsEnumerable|push|
        reduce(Right)?|reverse|shift|slice|some|sort|splice|to(Locale)?String|
        unshift|valueOf
      ))\b/
  end
  rule 'support.function.static.array.coffee' do
    match %r/(?x)((?<=Array\.)(
        isArray
      ))\b/
  end
  rule 'support.function.static.object.coffee' do
    match %r/(?x)((?<=Object\.)(
        create|definePropert(ies|y)|freeze|getOwnProperty(Descriptors?|Names)|
        getProperty(Descriptor|Names)|getPrototypeOf|is(Extensible|Frozen|Sealed)?|
        isnt|keys|preventExtensions|seal
      ))\b/
  end
  rule 'support.function.static.math.coffee' do
    match %r/(?x)((?<=Math\.)(
        abs|acos|acosh|asin|asinh|atan|atan2|atanh|ceil|cos|cosh|exp|expm1|floor|
        hypot|log|log10|log1p|log2|max|min|pow|random|round|sign|sin|sinh|sqrt|
        tan|tanh|trunc
      ))\b/
  end
  rule 'support.function.static.number.coffee' do
    match %r/(?x)((?<=Number\.)(
        is(Finite|Integer|NaN)|toInteger
      ))\b/
  end
  rule 'constant.language.coffee' do
    match %r/\b(Infinity|NaN|undefined)\b/
  end
  rule 'punctuation.terminator.statement.coffee' do
    match %r/\;/
  end
  rule 'meta.delimiter.object.comma.coffee' do
    match %r/,[ |\t]*/
  end
  rule 'meta.delimiter.method.period.coffee' do
    match %r/\./
  end
  rule 'meta.brace.curly.coffee' do
    match %r/\{|\}/
  end
  rule 'meta.brace.round.coffee' do
    match %r/\(|\)/
  end
  rule 'meta.brace.square.coffee' do
    match %r/\[|\]\s*/
  end
  include "#instance_variable"
  include "#single_quoted_string"
  include "#double_quoted_string"
  include "#numeric"

  fragment :double_quoted_string do
    rule 'string.quoted.double.coffee' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.coffee'
      to %r/"/,
        0 => 'punctuation.definition.string.end.coffee'
      rule 'constant.character.escape.coffee' do
        match %r/\\(x\h{2}|[0-2][0-7]{,2}|3[0-6][0-7]|37[0-7]?|[4-7][0-7]?|.)/
      end
      include "#interpolated_coffee"
    end
  end

  # FIXME: this fragment is never referenced
  fragment :embedded_comment do
    rule 'comment.line.number-sign.coffee' do
      match %r/(?<!\\)(#).*$\n?/,
        1 => 'punctuation.definition.comment.coffee'
    end
  end

  fragment :instance_variable do
    rule 'variable.other.readwrite.instance.coffee' do
      match %r/(@)([a-zA-Z_\$]\w*)?/
    end
  end

  fragment :interpolated_coffee do
    rule 'meta.embedded.line.coffee' do
      content_scope "source.coffee"
      from %r/#\{/,
        0 => 'punctuation.section.embedded.begin.coffee'
      to %r/(\})/,
        0 => 'punctuation.section.embedded.end.coffee',
        1 => 'source.coffee'
      include "$self"
    end
  end

  fragment :numeric do
    rule 'constant.numeric.coffee' do
      match %r/(?<!\$)\b((0([box])[0-9a-fA-F]+)|([0-9]+(\.[0-9]+)?(e[+\-]?[0-9]+)?))\b/
    end
  end

  fragment :single_quoted_string do
    rule 'string.quoted.single.coffee' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.coffee'
      to %r/'/,
        0 => 'punctuation.definition.string.end.coffee'
      rule 'constant.character.escape.coffee' do
        match %r/\\(x\h{2}|[0-2][0-7]{,2}|3[0-6][0-7]?|37[0-7]?|[4-7][0-7]?|.)/
      end
    end
  end

  fragment :variable_name do
    rule 'variable.assignment.coffee' do
      match %r/([a-zA-Z\$_]\w*(\.\w+)*)/,
        1 => 'variable.assignment.coffee'
    end
  end
end
