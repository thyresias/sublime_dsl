# encoding: utf-8

language 'Lisp' => 'source.lisp' do
  file_types %w(lisp cl l mud el)
  folding_start_marker %r/\(/
  folding_stop_marker %r/\)/
  key_equivalent "^~L"  # TextMate only
  uuid "00D451C9-6B1D-11D9-8DFA-000D93589AF6"  # TextMate only

  rule 'comment.line.semicolon.lisp' do
    match %r/(;).*$\n?/,
      1 => 'punctuation.definition.comment.lisp'
  end
  rule 'meta.function.lisp' do
    match %r/(\b(?i:(defun|defmethod|defmacro))\b)(\s+)((\w|\-|\!|\?)*)/,
      2 => 'storage.type.function-type.lisp',
      4 => 'entity.name.function.lisp'
  end
  rule 'constant.character.lisp' do
    match %r/(#)(\w|[\\+\-=<>'"&#])+/,
      1 => 'punctuation.definition.constant.lisp'
  end
  rule 'variable.other.global.lisp' do
    match %r/(\*)(\S*)(\*)/,
      1 => 'punctuation.definition.variable.lisp',
      3 => 'punctuation.definition.variable.lisp'
  end
  rule 'keyword.control.lisp' do
    match %r/\b(?i:case|do|let|loop|if|else|when)\b/
  end
  rule 'keyword.operator.lisp' do
    match %r/\b(?i:eq|neq|and|or)\b/
  end
  rule 'constant.language.lisp' do
    match %r/\b(?i:null|nil)\b/
  end
  rule 'support.function.lisp' do
    match %r/\b(?i:cons|car|cdr|cond|lambda|format|setq|setf|quote|eval|append|list|listp|memberp|t|load|progn)\b/
  end
  rule 'constant.numeric.lisp' do
    match %r/\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)(L|l|UL|ul|u|U|F|f|ll|LL|ull|ULL)?\b/
  end
  rule 'string.quoted.double.lisp' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.lisp'
    to %r/"/,
      0 => 'punctuation.definition.string.end.lisp'
    rule 'constant.character.escape.lisp' do
      match %r/\\./
    end
  end
end
