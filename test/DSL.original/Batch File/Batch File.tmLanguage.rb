# encoding: utf-8

language 'Batch File' => 'source.dosbatch' do
  file_types %w(bat)
  uuid "E07EC438-7B75-4437-8AA1-DA94C1E6EACC"  # TextMate only

  rule 'keyword.command.dosbatch' do
    match %r/\b(?i)(?:append|assoc|at|attrib|break|cacls|cd|chcp|chdir|chkdsk|chkntfs|cls|cmd|color|comp|compact|convert|copy|date|del|dir|diskcomp|diskcopy|doskey|echo|endlocal|erase|fc|find|findstr|format|ftype|graftabl|help|keyb|label|md|mkdir|mode|more|move|path|pause|popd|print|prompt|pushd|rd|recover|rem|ren|rename|replace|restore|rmdir|set|setlocal|shift|sort|start|subst|time|title|tree|type|ver|verify|vol|xcopy)\b/
  end
  rule 'keyword.control.statement.dosbatch' do
    match %r/\b(?i)(?:goto|call|exit)\b/
  end
  rule 'keyword.control.conditional.if.dosbatch' do
    match %r/\b(?i)if\s+((not)\s+)(exist|defined|errorlevel|cmdextversion)\b/
  end
  rule 'keyword.control.conditional.dosbatch' do
    match %r/\b(?i)(?:if|else)\b/
  end
  rule 'keyword.control.repeat.dosbatch' do
    match %r/\b(?i)for\b/
  end
  rule 'keyword.operator.dosbatch' do
    match %r/\b(?:EQU|NEQ|LSS|LEQ|GTR|GEQ)\b/
  end
  rule 'comment.line.rem.dosbatch' do
    match %r/(?:^|\s)((?i)rem)(?:$|\s.*$)/,
      1 => 'keyword.command.rem.dosbatch'
  end
  rule 'comment.line.colons.dosbatch' do
    match %r/\s*:\s*:.*$/
  end
  rule 'string.quoted.double.dosbatch' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.shell'
    to %r/"/,
      0 => 'punctuation.definition.string.end.shell'
  end
  rule 'keyword.operator.pipe.dosbatch' do
    match %r/[|]/
  end
  rule 'keyword.operator.redirect.shell' do
    match %r/&>|\d*>&\d*|\d*(>>|>|<)|\d*<&|\d*<>/
  end
end
