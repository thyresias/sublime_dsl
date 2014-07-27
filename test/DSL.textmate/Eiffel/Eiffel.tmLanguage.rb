# encoding: utf-8

language 'Eiffel' => 'source.eiffel' do
  file_types %w(e)
  key_equivalent "^~E"  # TextMate only
  uuid "34672373-DED9-45B8-AF7E-2E4B6C3D6B76"  # TextMate only

  rule do
    from %r/(^[ \t]+)?(?=--)/,
      1 => 'punctuation.whitespace.comment.leading.eiffel'
    to %r/(?!\G)/
    rule 'comment.line.double-dash.eiffel' do
      from %r/--/,
        0 => 'punctuation.definition.comment.eiffel'
      to %r/\n/
    end
  end
  rule 'keyword.control.eiffel' do
    match %r/\b(Indexing|indexing|deferred|expanded|class|inherit|rename|as|export|undefine|redefine|select|all|create|creation|feature|prefix|infix|separate|frozen|obsolete|local|is|unique|do|once|external|alias|require|ensure|invariant|variant|rescue|retry|like|check|if|else|elseif|then|inspect|when|from|loop|until|debug|not|or|and|xor|implies|old|end)\b/
  end
  rule 'variable.other.eiffel' do
    match %r/[a-zA-Z_]+/
  end
  rule 'constant.language.eiffel' do
    match %r/\b(True|true|False|false|Void|void|Result|result)\b/
  end
  rule 'meta.features.eiffel' do
    from %r/feature/
    to %r/end/
  end
  rule 'meta.effective_routine_body.eiffel' do
    from %r/(do|once)/
    to %r/(ensure|end)/
  end
  rule 'meta.rescue.eiffel' do
    from %r/rescue/
    to %r/end/
  end
  rule 'string.quoted.double.eiffel' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.eiffel'
    to %r/"/,
      0 => 'punctuation.definition.string.end.eiffel'
    rule 'constant.character.escape.eiffel' do
      match %r/\\./
    end
  end
  rule 'constant.numeric.eiffel' do
    match %r/[0-9]+/
  end
  rule 'storage.modifier.eiffel' do
    match %r/\b(deferred|expanded)\b/
  end
  rule 'meta.definition.class.eiffel' do
    from %r/^\s*\n\t\t\t\t\t((?:\b(deferred|expanded)\b\s*)*) # modifier\n\t\t\t\t\t(class)\s+\n\t\t\t\t\t(\w+)\s* # identifier/
    to %r/(?=end)/
    both 1 => 'storage.modifier.eiffel'
    rule 'meta.definition.class.extends.java' do
      from %r/\b(extends)\b\s+/
      to %r/(?={|implements)/
      both 1 => 'storage.modifier.java'
      include "#all-types"
    end
    rule 'meta.definition.class.implements.java' do
      from %r/\b(implements)\b\s+/
      to %r/(?={|extends)/
      both 1 => 'storage.modifier.java'
      include "#all-types"
    end
  end

  # FIXME: this fragment is never referenced
  fragment :number do
    rule do
      match %r/[0-9]+/
    end
  end

  # FIXME: this fragment is never referenced
  fragment :variable do
    rule do
      match %r/[a-zA-Z0-9_]+/
    end
  end
end
