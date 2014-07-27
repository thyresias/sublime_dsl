# encoding: utf-8

language 'Standard ML' => 'source.ml' do
  file_types %w(sml sig)
  key_equivalent "^~S"  # TextMate only
  uuid "9B148AEA-F723-4EDE-8B7F-2F4FD730BC3A"  # TextMate only

  include "#comments"
  rule 'keyword.other.ml' do
    match %r/\b(val|datatype|struct|as|let|in|abstype|local|where|case|of|fn|raise|exception|handle|ref|infix|infixr|before|end|structure|withtype)\b/
  end
  rule 'meta.exp.let.ml' do
    from %r/\b(let)\b/
    to %r/\b(end)\b/
    both 1 => 'keyword.other.ml',
         2 => 'keyword.other.ml'
    include "$self"
  end
  rule 'meta.module.sigdec.ml' do
    from %r/\b(sig)\b/
    to %r/\b(end)\b/
    both 1 => 'keyword.other.delimiter.ml',
         2 => 'keyword.other.delimiter.ml'
    include "#spec"
  end
  rule 'keyword.control.ml' do
    match %r/\b(if|then|else)\b/
  end
  rule 'meta.definition.fun.ml' do
    from %r/\b(fun|and)\s+([\w]+)\b/
    to %r/(?=val|type|eqtype|datatype|structure|local)/
    both 1 => 'keyword.control.fun.ml',
         2 => 'entity.name.function.ml'
    include "source.ml"
  end
  rule 'string.quoted.double.ml' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.ml'
    to %r/"/,
      0 => 'punctuation.definition.string.end.ml'
    rule 'constant.character.escape.ml' do
      match %r/\\./
    end
  end
  rule 'constant.character.ml' do
    match %r/(#")(\\)?.(")/,
      1 => 'punctuation.definition.constant.ml',
      3 => 'punctuation.definition.constant.ml'
  end
  rule 'constant.numeric.ml' do
    match %r/\b\d*\.?\d+\b/
  end
  rule 'keyword.operator.logical.ml' do
    match %r/\b(andalso|orelse|not)\b/
  end
  rule 'meta.module.dec.ml' do
    from %r/(?x)\b
          (functor|structure|signature|funsig)\s+
          (\w+)\s* # identifier/
    to %r/(?==|:|\()/
    both 1 => 'storage.type.module.binder.ml',
         2 => 'entity.name.type.module.ml'
  end
  rule 'keyword.other.module.ml' do
    match %r/\b(open)\b/
  end
  rule 'constant.language.ml' do
    match %r/\b(nil|true|false|NONE|SOME)\b/
  end
  rule 'meta.typeabbrev.ml' do
    from %r/\s*(type|eqtype) .* =/
    to %r/$/
    both 1 => 'keyword.other.typeabbrev.ml',
         2 => 'variable.other.typename.ml'
    rule 'meta.typeexp.ml' do
      match %r/(([a-zA-Z0-9\.\* ]|(\->))*)/
    end
  end

  fragment :comments do
    rule 'comment.block.ml' do
      from %r/\(\*/,
        0 => 'punctuation.definition.comment.begin.ml'
      to %r/\*\)/,
        0 => 'punctuation.definition.comment.end.ml'
      include "#comments"
    end
  end

  fragment :spec do
    rule 'meta.spec.ml.type' do
      match %r/\b(exception|type)\s+([a-zA-Z][a-zA-Z0-9'_]*)/,
        1 => 'keyword.other.ml',
        2 => 'entity.name.type.abbrev.ml'
    end
    rule 'meta.spec.ml.datatype' do
      from %r/\b(datatype)\s+([a-zA-Z][a-zA-Z0-9'_]*)\s*(?==)/
      to %r/(?=val|type|eqtype|datatype|structure|include|exception)/
      both 1 => 'keyword.other.ml',
           2 => 'entity.name.type.datatype.ml'
      rule 'meta.spec.ml.datatype' do
        match %r/\b(and)\s+([a-zA-Z][a-zA-Z0-9'_]*)\s*(?==)/,
          1 => 'keyword.other.ml',
          2 => 'entity.name.type.datatype.ml'
      end
      rule 'meta.datatype.rule.main.ml' do
        match %r/(?x)
              =\s*([a-zA-Z][a-zA-Z0-9'_]*)(\s+of)?/,
          1 => 'variable.other.dcon.ml',
          2 => 'keyword.other.ml'
      end
      rule 'meta.datatype.rule.other.ml' do
        match %r/\|\s*([a-zA-Z][a-zA-Z0-9'_]*)(\s+of)?/,
          1 => 'variable.other.dcon.ml',
          2 => 'keyword.other.ml'
      end
    end
    rule 'meta.spec.ml.val' do
      match %r/\b(val)\s*([^:]+)\s*:/,
        1 => 'keyword.other.ml'
    end
    rule 'meta.spec.ml.structure' do
      from %r/\b(structure)\s*(\w+)\s*:/
      to %r/(?=val|type|eqtype|datatype|structure|include)/
      both 1 => 'keyword.other.ml',
           2 => 'entity.name.type.module.ml'
      rule 'keyword.other.ml' do
        match %r/\b(sharing)\b/
      end
    end
    rule 'meta.spec.ml.include' do
      match %r/\b(include)\b/,
        1 => 'keyword.other.ml'
    end
    include "#comments"
  end
end
