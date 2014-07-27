# encoding: utf-8

language 'OCaml' => 'source.ocaml' do
  file_types %w(ml mli)
  folding_start_marker %r/(\b(module|class|)\s.*?=\s*$|\bbegin|sig|struct|(object(\s*\(_?[a-z]+\))?)\s*$|\bwhile\s.*?\bdo\s*$|^let(?:\s+rec)?\s+[a-z_][a-zA-Z0-9_]*\s+(?!=)\S)/
  folding_stop_marker %r/(\bend(\s+in)?[ \t]*(;{1,2}|=)?|\bdone;?|^\s*;;|^\s*in)[ \t]*$/
  key_equivalent "^~O"  # TextMate only
  uuid "F816FA69-6EE8-11D9-BF2D-000D93589AF6"  # TextMate only

  rule 'meta.module.binding' do
    match %r/\b(let)\s+(module)\s+([A-Z][a-zA-Z0-9'_]*)\s*(=)/,
      1 => 'keyword.other.module-binding.ocaml',
      2 => 'keyword.other.module-definition.ocaml',
      3 => 'support.other.module.ocaml',
      4 => 'punctuation.separator.module-binding.ocmal'
  end
  rule 'meta.function.ocaml' do
    from %r/\b(let|and)\s+(?!\(\*)((rec\s+)([a-z_][a-zA-Z0-9_']*)\b|([a-z_][a-zA-Z0-9_']*|\([^)]+\))(?=\s)((?=\s*=\s*(?=fun(?:ction)\b))|(?!\s*=)))/,
      1 => 'keyword.other.function-definition.ocaml',
      3 => 'keyword.other.funtion-definition.ocaml',
      4 => 'entity.name.function.ocaml',
      5 => 'entity.name.function.ocaml'
    to %r/(?:(:)\s*([^=]+))?(?:(=)|(=)\s*(?=fun(?:ction)\b))/,
      1 => 'punctuation.separator.function.type-constraint.ocaml',
      2 => 'storage.type.ocaml',
      3 => 'keyword.operator.ocaml',
      4 => 'keyword.operator.ocaml'
    include "#variables"
  end
  rule 'meta.function.anonymous.ocaml' do
    from %r/(\(|\s)(?=fun\s)/
    to %r/(\))/
    both 1 => 'punctuation.definition.function.anonymous.ocaml'
    rule 'meta.function.anonymous.definition.ocaml' do
      from %r/(?<=(\(|\s))(fun)\s/,
        2 => 'keyword.other.function-definition.ocaml'
      to %r/(->)/,
        1 => 'punctuation.separator.function-definition.ocaml'
      include "#variables"
    end
    include "$self"
  end
  rule 'meta.type-definition-group.ocaml' do
    from %r/^\s*(?=type\s)/
    to %r/\b(?=let|end|val)|^\s*$/
    rule 'meta.type-definition.ocaml' do
      from %r/\b(type|and)\s+([^=]*)(=)?/,
        1 => 'keyword.other.type-definition.ocaml',
        2 => 'storage.type.ocaml',
        3 => 'punctuation.separator.type-definition.ocaml'
      to %r/(?=\b(type|and|let|end|val)\b)|(?=^\s*$)/
      include "#typedefs"
    end
  end
  rule 'meta.pattern-match.ocaml' do
    from %r/\b(with|function)(?=(\s*$|.*->))\b|((?<!\S)(\|)(?=(\w|\s).*->))/,
      1 => 'keyword.control.match-definition.ocaml',
      2 => 'keyword.other.function-definition.ocaml',
      3 => 'keyword.control.match-definition.ocaml'
    to %r/(?:(->)|\b(when)\b|\s(?=\|))/,
      1 => 'punctuation.separator.match-definition.ocaml',
      2 => 'keyword.control.match-condition.ocaml'
    include "#matchpatterns"
  end
  rule 'meta.class.type-definition.ocaml' do
    match %r/^[ \t]*(class\s+type\s+)((\[\s*('[A-Za-z][a-zA-Z0-9_']*(?:\s*,\s*'[A-Za-z][a-zA-Z0-9_']*)*)\s*\]\s+)?[a-z_][a-zA-Z0-9'_]*)/,
      1 => 'keyword.other.class-type-definition.ocaml',
      2 => 'entity.name.type.class-type.ocaml',
      4 => 'storage.type.ocaml'
  end
  rule 'meta.class.ocaml' do
    from %r/^[ \t]*(class)(?:\s+(?!(?:virtual)\s+))((\[\s*('[A-Za-z][a-zA-Z0-9_']*(?:\s*,\s*'[A-Za-z][a-zA-Z0-9_']*)*)\s*\]\s+)?[a-z_][a-zA-Z0-9'_]*)/,
      1 => 'keyword.other.class-definition.ocaml',
      2 => 'entity.name.type.class.ocaml',
      4 => 'storage.type.ocaml'
    to %r/(=)/,
      1 => 'keyword.operator.ocaml'
    include "#variables"
  end
  rule 'meta.class.virtual.ocaml' do
    from %r/^[ \t]*(class\s+virtual\s+)((\[\s*('[A-Za-z][a-zA-Z0-9_']*(?:\s*,\s*'[A-Za-z][a-zA-Z0-9_']*)*)\s*\]\s+)?[a-z_][a-zA-Z0-9'_]*)/,
      1 => 'keyword.other.class-definition.ocaml',
      2 => 'entity.name.type.class.ocaml',
      4 => 'storage.type.ocaml'
    to %r/(=)/,
      1 => 'keyword.operator.ocaml'
    include "#variables"
  end
  rule 'meta.class.virtual.type-definition.ocaml' do
    match %r/^[ \t]*(class\s+type\s+virtual)((\[\s*('[A-Za-z][a-zA-Z0-9_']*(?:\s*,\s*'[A-Za-z][a-zA-Z0-9_']*)*)\s*\]\s+)?[a-z_][a-zA-Z0-9'_]*)/,
      1 => 'keyword.other.class-type-definition.ocaml',
      2 => 'entity.name.type.class-type.ocaml',
      4 => 'storage.type.ocaml'
  end
  rule 'meta.record.ocaml' do
    from %r/(\{)/
    to %r/(\})/
    both 1 => 'punctuation.definition.record.ocaml'
    rule 'keyword.other.language.ocaml' do
      match %r/\bwith\b/
    end
    rule 'meta.record.definition.ocaml' do
      from %r/(\bmutable\s+)?\b([a-z_][a-zA-Z0-9_']*)\s*(:)/,
        1 => 'keyword.other.storage.modifier.ocaml',
        2 => 'source.ocaml',
        3 => 'punctuation.definition.record.ocaml'
      to %r/(;|(?=}))/,
        1 => 'keyword.operator.ocaml'
      include "#typedefs"
    end
    include "$self"
  end
  rule 'meta.object.ocaml' do
    from %r/\b(object)\s*(?:(\()(_?[a-z]+)(\)))?\s*$/,
      1 => 'keyword.other.object-definition.ocaml',
      2 => 'punctuation.definition.self-binding.ocaml',
      3 => 'entity.name.type.self-binding.ocaml',
      4 => 'punctuation.definition.self-binding.ocaml'
    to %r/\b(end)\b/,
      1 => 'keyword.control.object.ocaml',
      2 => 'punctuation.terminator.expression.ocaml'
    rule 'meta.method.ocaml' do
      from %r/\b(method)\s+(virtual\s+)?(private\s+)?([a-z_][a-zA-Z0-9'_]*)/,
        1 => 'keyword.other.method-definition.ocaml',
        2 => 'keyword.other.method-definition.ocaml',
        3 => 'keyword.other.method-restriction.ocaml',
        4 => 'entity.name.function.method.ocaml'
      to %r/(=|:)/,
        1 => 'keyword.operator.ocaml'
      include "#variables"
    end
    rule 'meta.object.type-constraint.ocaml' do
      from %r/(constraint)\s+([a-z_'][a-zA-Z0-9'_]*)\s+(=)/,
        1 => 'keyword.other.language.ocaml',
        2 => 'storage.type.ocaml',
        3 => 'keyword.operator.ocaml'
      to %r/(#[a-z_][a-zA-Z0-9'_]*)|(int|char|float|string|list|array|bool|unit|exn|option|int32|int64|nativeint|format4|lazy_t)|([a-z_][a-zA-Z0-9'_]*)\s*$/,
        1 => 'storage.type.polymorphic-variant.ocaml',
        2 => 'storage.type.ocaml',
        3 => 'storage.type.ocaml'
    end
    include "$self"
  end
  rule 'meta.method-call.ocaml' do
    match %r/(?<=\w|\)|')(#)[a-z_][a-zA-Z0-9'_]*/,
      1 => 'punctuation.separator.method-call.ocaml'
  end
  rule 'meta.module.ocaml' do
    match %r/^[ \t]*(module)\s+([A-Z_][a-zA-Z0-9'_]*)(?:\s*(:)\s*([A-Z][a-zA-Z0-9'_]*)?)?/,
      1 => 'keyword.other.module-definition.ocaml',
      2 => 'entity.name.type.module.ocaml',
      3 => 'punctuation.separator.module-definition.ocaml',
      4 => 'entity.name.type.module-type.ocaml'
  end
  rule 'meta.module.type.ocaml' do
    match %r/^[ \t]*(module\s+type\s+)([A-Z][a-zA-Z0-9'_]*)/,
      1 => 'keyword.other.module-type-definition.ocaml',
      2 => 'entity.name.type.module-type.ocaml'
  end
  rule 'meta.module.signature.ocaml' do
    from %r/\b(sig)\b/,
      1 => 'keyword.other.module.signature.ocaml'
    to %r/\b(end)\b/,
      1 => 'keyword.other.module.signature.ocaml',
      2 => 'punctuation.terminator.expression.ocaml',
      3 => 'keyword.operator.ocaml'
    include "#module-signature"
    include "$self"
  end
  rule 'meta.module.structure.ocaml' do
    from %r/\b(struct)\b/
    to %r/\b(end)\b/
    both 1 => 'keyword.other.module.structure.ocaml'
    include "$self"
  end
  include "#moduleref"
  rule 'meta.module.open.ocaml' do
    from %r/\b(open)\s+([A-Z][a-zA-Z0-9'_]*)(?=(\.[A-Z][a-zA-Z0-9_]*)*)/,
      1 => 'keyword.other.ocaml',
      2 => 'support.other.module.ocaml'
    to %r/(\s|$)/
    rule 'support.other.module.ocaml' do
      match %r/(\.)([A-Z][a-zA-Z0-9'_]*)/,
        1 => 'punctuation.separator.module-reference.ocaml'
    end
  end
  rule 'meta.exception.ocaml' do
    match %r/\b(exception)\s+([A-Z][a-zA-Z0-9'_]*)\b/,
      1 => 'keyword.other.ocaml',
      2 => 'entity.name.type.exception.ocaml'
  end
  rule 'source.camlp4.embedded.ocaml' do
    from %r/(?=(\[<)(?![^\[]+?[^>]\]))/
    to %r/(>\])/,
      1 => 'punctuation.definition.camlp4-stream.ocaml'
    include "source.camlp4.ocaml"
  end
  include "#strings"
  include "#constants"
  include "#comments"
  include "#lists"
  include "#arrays"
  rule 'meta.type-constraint.ocaml' do
    from %r/(\()(?=(~[a-z][a-zA-Z0-9_]*:|("(\\"|[^"])*")|[^\(\)~"])+(?<!:)(:>|:(?![:=])))/,
      1 => 'punctuation.section.type-constraint.ocaml'
    to %r/(?<!:)(:>|:(?![:=]))(.*?)(\))/,
      1 => 'punctuation.separator.type-constraint.ocaml',
      2 => 'storage.type.ocaml',
      3 => 'punctuation.section.type-constraint.ocaml'
    include "$self"
  end
  rule 'keyword.other.directive.ocaml' do
    match %r/^[ \t]*#[a-zA-Z]+/
  end
  rule 'keyword.other.directive.line-number.ocaml' do
    match %r/^[ \t]*#[0-9]*/
  end
  include "#storagetypes"
  rule 'keyword.other.storage.modifier.ocaml' do
    match %r/\b(mutable|ref)\b/
  end
  rule 'entity.name.type.variant.polymorphic.ocaml' do
    match %r/`[A-Za-z][a-zA-Z0-9'_]*\b/
  end
  rule 'entity.name.type.variant.ocaml' do
    match %r/\b[A-Z][a-zA-Z0-9'_]*\b/
  end
  rule 'keyword.operator.symbol.ocaml' do
    match %r/!=|:=|>|</
  end
  rule 'keyword.operator.infix.floating-point.ocaml' do
    match %r'[*+/-]\.'
  end
  rule 'keyword.operator.prefix.floating-point.ocaml' do
    match %r/~-\./
  end
  rule 'punctuation.definition.list.constructor.ocaml' do
    match %r/::/
  end
  rule 'punctuation.terminator.expression.ocaml' do
    match %r/;;/
  end
  rule 'punctuation.separator.ocaml' do
    match %r/;/
  end
  rule 'punctuation.separator.function-return.ocaml' do
    match %r/->/
  end
  rule 'keyword.operator.infix.ocaml' do
    match %r'[=<>@^&+\-*/$%|][|!$%&*+./:<=>?@^~-]*'
  end
  rule 'keyword.operator.prefix.ocaml' do
    match %r'\bnot\b|!|[!\?~][!$%&*+./:<=>?@^~-]+'
  end
  rule 'entity.name.tag.label.ocaml' do
    match %r/~[a-z][a-z0-9'_]*(:)?/,
      1 => 'punctuation.separator.argument-label.ocaml'
  end
  rule 'meta.begin-end-group.ocaml' do
    from %r/\b(begin)\b/
    to %r/\b(end)\b/
    both 1 => 'keyword.control.begin-end.ocaml'
    include "$self"
  end
  rule 'meta.for-loop.ocaml' do
    from %r/\b(for)\b/
    to %r/\b(done)\b/
    both 1 => 'keyword.control.for-loop.ocaml'
    rule 'keyword.control.loop.ocaml' do
      match %r/\bdo\b/
    end
    include "$self"
  end
  rule 'meta.while-loop.ocaml' do
    from %r/\b(while)\b/
    to %r/\b(done)\b/
    both 1 => 'keyword.control.while-loop.ocaml'
    rule 'keyword.control.loop.ocaml' do
      match %r/\bdo\b/
    end
    include "$self"
  end
  rule 'meta.paren-group.ocaml' do
    from %r/\(/
    to %r/\)/
    include "$self"
  end
  rule 'keyword.operator.ocaml' do
    match %r/\b(and|land|lor|lsl|lsr|lxor|mod|or)\b/
  end
  rule 'keyword.control.ocaml' do
    match %r/\b(downto|if|else|match|then|to|when|with|try)\b/
  end
  rule 'keyword.other.ocaml' do
    match %r/\b(as|assert|class|constraint|exception|functor|in|include|inherit|initializer|lazy|let|mod|module|mutable|new|object|open|private|rec|sig|struct|type|virtual)\b/
  end
  include "#module-signature"
  rule 'invalid.illegal.unrecognized-character.ocaml' do
    match %r/(’|‘|“|”)/
  end

  fragment :arrays do
    rule 'meta.array.ocaml' do
      from %r/(\[\|)/,
        1 => 'punctuation.definition.array.begin.ocaml'
      to %r/(\|\])/,
        1 => 'punctuation.definition.array.end.ocaml'
      include "#arrays"
      include "$self"
    end
  end

  fragment :comments do
    rule 'comment.block.ocaml' do
      match %r/\(\*+(\*)\)/,
        1 => 'comment.block.empty.ocaml'
    end
    rule 'comment.block.ocaml' do
      from %r/\(\*/
      to %r/\*\)/
      include "#comments"
    end
    rule 'comment.block.string.quoted.double.ocaml' do
      from %r/(?=[^\\])(")/
      to %r/"/
      rule 'comment.block.string.constant.character.escape.ocaml' do
        match %r/\\(x[a-fA-F0-9][a-fA-F0-9]|[0-2]\d\d|[bnrt'"\\])/
      end
    end
  end

  fragment :constants do
    rule 'constant.language.pseudo-variable.ocaml' do
      match %r/(?:\[\s*(\])|\((\))|\(\s*(\)))/,
        1 => 'meta.empty-typing-pair.ocaml',
        2 => 'meta.empty-typing-pair.parens.ocaml',
        3 => 'meta.empty-typing-pair.ocaml'
    end
    rule 'constant.language.boolean.ocaml' do
      match %r/\b(true|false)\b/
    end
    rule 'constant.numeric.floating-point.ocaml' do
      match %r/\b-?[0-9][0-9_]*((\.([0-9][0-9_]*([eE][+-]??[0-9][0-9_]*)?)?)|([eE][+-]??[0-9][0-9_]*))/
    end
    rule 'constant.numeric.integer.nativeint.ocaml' do
      match %r/\b(-?((0(x|X)[0-9a-fA-F][0-9a-fA-F_]*)|(0(o|O)[0-7][0-7_]*)|(0(b|B)[01][01_]*)|([0-9][0-9_]*)))n/
    end
    rule 'constant.numeric.integer.int64.ocaml' do
      match %r/\b(-?((0(x|X)[0-9a-fA-F][0-9a-fA-F_]*)|(0(o|O)[0-7][0-7_]*)|(0(b|B)[01][01_]*)|([0-9][0-9_]*)))L/
    end
    rule 'constant.numeric.integer.int32.ocaml' do
      match %r/\b(-?((0(x|X)[0-9a-fA-F][0-9a-fA-F_]*)|(0(o|O)[0-7][0-7_]*)|(0(b|B)[01][01_]*)|([0-9][0-9_]*)))l/
    end
    rule 'constant.numeric.integer.ocaml' do
      match %r/\b(-?((0(x|X)[0-9a-fA-F][0-9a-fA-F_]*)|(0(o|O)[0-7][0-7_]*)|(0(b|B)[01][01_]*)|([0-9][0-9_]*)))/
    end
    rule 'constant.character.ocaml' do
      match %r/'(.|\\(x[a-fA-F0-9][a-fA-F0-9]|[0-2]\d\d|[bnrt'"\\]))'/
    end
  end

  fragment :definite_storagetypes do
    include "#storagetypes"
    rule 'storage.type.ocaml' do
      match %r/\b[a-zA-Z0-9'_]+\b/
    end
  end

  fragment :lists do
    rule 'meta.list.ocaml' do
      from %r/(\[)(?!\||<|>)/,
        1 => 'punctuation.definition.list.begin.ocaml'
      to %r/(?<!\||>)(\])/,
        1 => 'punctuation.definition.list.end.ocaml'
      include "#lists"
      include "$self"
    end
  end

  fragment :matchpatterns do
    rule 'constant.language.universal-match.ocaml' do
      match %r/\b_\b/
    end
    rule 'punctuation.separator.match-pattern.ocaml' do
      match %r/\|(?=\s*\S)/
    end
    rule 'meta.match-option.ocaml' do
      from %r/(\()(?=(?!=.*?->).*?\|)/
      to %r/(\))/
      both 1 => 'punctuation.definition.match-option.ocaml'
      rule 'punctuation.separator.match-option.ocaml' do
        match %r/\|/
      end
      include "#matchpatterns"
    end
    include "#moduleref"
    include "#constants"
    include "#variables"
    include "$self"
  end

  fragment :"module-signature" do
    rule 'meta.module.signature.val.ocaml' do
      from %r/(val)\s+([a-z_][a-zA-Z0-9_']*)\s*(:)/,
        1 => 'keyword.other.ocaml',
        2 => 'entity.name.type.value-signature.ocaml',
        3 => 'punctuation.separator.type-constraint.ocaml'
      to %r/(?=\b(type|val|external|class|module|end)\b)|^\s*$/
      rule 'variable.parameter.ameter.optional.ocaml' do
        match %r/(\?)([a-z][a-zA-Z0-9_]*)\s*(:)/,
          1 => 'punctuation.definition.optional-parameter.ocaml',
          2 => 'entity.name.tag.label.optional.ocaml',
          3 => 'punctuation.separator.optional-parameter.ocaml'
      end
      rule 'variable.parameter.labeled.ocaml' do
        from %r/([a-z][a-zA-Z0-9'_]*)\s*(:)\s*/,
          1 => 'entity.name.tag.label.ocaml',
          2 => 'punctuation.separator.label.ocaml',
          3 => 'storage.type.ocaml'
        to %r/\s/
        include "#definite_storagetypes"
      end
      include "#typedefs"
    end
    rule 'meta.module.signature.external.ocaml' do
      from %r/(external)\s+([a-z_][a-zA-Z0-9_']*)\s*(:)/,
        1 => 'keyword.other.ocaml',
        2 => 'entity.name.type.external-signature.ocaml',
        3 => 'punctuation.separator.type-constraint.ocaml'
      to %r/(?=\b(type|val|external|class|module|let|end)\b)|^\s*$/
      rule 'variable.parameter.optional.ocaml' do
        match %r/(\?)([a-z][a-zA-Z0-9_]*)\s*(:)/,
          1 => 'punctuation.definition.optional-parameter.ocaml',
          2 => 'entity.name.tag.label.optional.ocaml',
          3 => 'punctuation.separator.optional-parameter.ocaml'
      end
      rule 'variable.parameter.labeled.ocaml' do
        from %r/(~)([a-z][a-zA-Z0-9'_]*)\s*(:)\s*/,
          1 => 'punctuation.definition.labeled-parameter.ocaml',
          2 => 'entity.name.tag.label.ocaml',
          3 => 'punctuation.separator.label.ocaml'
        to %r/\s/
        include "#variables"
      end
      include "#strings"
      include "#typedefs"
    end
  end

  fragment :moduleref do
    rule 'meta.module-reference.ocaml' do
      match %r/\b([A-Z][a-zA-Z0-9'_]*)(\.)/,
        1 => 'support.other.module.ocaml',
        2 => 'punctuation.separator.module-reference.ocaml'
    end
  end

  fragment :storagetypes do
    rule 'storage.type.ocaml' do
      match %r/\b(int|char|float|string|list|array|bool|unit|exn|option|int32|int64|nativeint|format4|lazy_t)\b/
    end
    rule 'storage.type.variant.polymorphic.ocaml' do
      match %r/#[a-z_][a-zA-Z0-9_]*/
    end
  end

  fragment :strings do
    rule 'string.quoted.double.ocaml' do
      from %r/(?=[^\\])(")/,
        1 => 'punctuation.definition.string.begin.ocaml'
      to %r/(")/,
        1 => 'punctuation.definition.string.end.ocaml'
      rule 'punctuation.separator.string.ignore-eol.ocaml' do
        match %r/\\$[ \t]*/
      end
      rule 'constant.character.string.escape.ocaml' do
        match %r/\\(x[a-fA-F0-9][a-fA-F0-9]|[0-2]\d\d|[bnrt'"\\])/
      end
      rule 'constant.character.regexp.escape.ocaml' do
        match %r/\\[\|\(\)1-9$^.*+?\[\]]/
      end
      rule 'invalid.illegal.character.string.escape' do
        match %r/\\(?!(x[a-fA-F0-9][a-fA-F0-9]|[0-2]\d\d|[bnrt'"\\]|[\|\(\)1-9$^.*+?\[\]]|$[ \t]*))(?:.)/
      end
    end
  end

  fragment :typedefs do
    rule 'punctuation.separator.variant-definition.ocaml' do
      match %r/\|/
    end
    include "#comments"
    rule 'meta.paren-group.ocaml' do
      from %r/\(/
      to %r/\)/
      include "#typedefs"
    end
    rule 'keyword.other.ocaml' do
      match %r/\bof\b/
    end
    include "#storagetypes"
    rule 'storage.type.ocaml' do
      match %r/(?<=\s|\()['a-z_][a-zA-Z0-9_]*\b/
    end
    rule 'meta.module.type.ocaml' do
      match %r/\b((?:[A-Z][a-zA-Z0-9'_]*)(?:\.[A-Z][a-zA-Z0-9'_]+)*)(\.[a-zA-Z0-9'_]+)/,
        1 => 'support.other.module.ocaml',
        2 => 'storage.type.module.ocaml'
    end
    rule 'meta.polymorphic-variant.definition.ocaml' do
      from %r/(\[(>|<)?)/
      to %r/(\])/
      both 1 => 'punctuation.definition.polymorphic-variant.ocaml'
      include "#typedefs"
    end
    include "$self"
    rule 'punctuation.separator.algebraic-type.ocaml' do
      match %r/\|/
    end
  end

  fragment :variables do
    rule 'variable.parameter.unit.ocaml' do
      match %r/\(\)/
    end
    include "#constants"
    include "#moduleref"
    rule 'variable.parameter.labeled.ocaml' do
      from %r/(~)([a-z][a-zA-Z0-9'_]*)(\s*:\s*)?/,
        1 => 'punctuation.definition.labeled-parameter.ocaml',
        2 => 'entity.name.tag.label.ocaml',
        3 => 'punctuation.separator.label.ocaml'
      to %r/(?=(->|\s))/
      include "#variables"
    end
    rule 'variable.parameter.optional.ocaml' do
      match %r/(\?)([a-z][a-zA-Z0-9_]*)/,
        1 => 'punctuation.definition.optional-parameter.ocaml',
        2 => 'entity.name.tag.label.optional.ocaml'
    end
    rule 'variable.parameter.optional.ocaml' do
      from %r/(\?)(\()([a-z_][a-zA-Z0-9'_]*)\s*(=)/,
        1 => 'punctuation.definition.optional-parameter.ocaml',
        2 => 'punctuation.definition.optional-parameter.ocaml',
        3 => 'entity.name.tag.label.optional.ocaml',
        4 => 'punctuation.separator.optional-parameter-assignment.ocaml'
      to %r/(\))/,
        1 => 'punctuation.definition.optional-parameter.ocaml'
      include "$self"
    end
    rule 'meta.parameter.type-constrained.ocaml' do
      from %r/(\()(?=(~[a-z][a-zA-Z0-9_]*:|("(\\"|[^"])*")|[^\(\)~"])+(?<!:)(:>|:(?![:=])))/
      to %r/(\))/
      both 1 => 'punctuation.section.type-constraint.ocaml'
      rule 'storage.type.ocaml' do
        from %r/(?<!:)(:>|:(?![:=]))/,
          1 => 'punctuation.separator.type-constraint.ocaml'
        to %r/(?=\))/
        rule 'meta.paren.group' do
          from %r/\(/
          to %r/\)/
        end
      end
      include "#variables"
    end
    include "#comments"
    rule 'meta.paren-group.ocaml' do
      from %r/\(/
      to %r/\)/
      include "#variables"
    end
    rule 'variable.parameter.tuple.ocaml' do
      from %r/(\()/
      to %r/(\))/
      both 1 => 'punctuation.definition.tuple.ocaml'
      include "#matchpatterns"
      include "#variables"
      rule 'punctuation.separator.tuple.ocaml' do
        match %r/,/
      end
    end
    rule 'variable.parameter.record.ocaml' do
      from %r/(\{)/
      to %r/(\})/
      both 1 => 'punctuation.definition.record.ocaml'
      include "#moduleref"
      rule 'meta.recordfield.match.ocaml' do
        from %r/\b([a-z][a-zA-Z0-9'_]*)\s*(=)/,
          1 => 'entity.name.tag.record.ocaml',
          2 => 'punctuation.separator.record.field-assignment.ocaml'
        to %r/(;)|(?=\})/,
          1 => 'punctuation.separator.record.ocaml'
        include "#matchpatterns"
      end
    end
    include "#storagetypes"
    rule 'variable.parameter.ocaml' do
      match %r/\b[a-z_][a-zA-Z0-9'_]*/
    end
  end
end
