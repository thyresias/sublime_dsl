# encoding: utf-8

language 'Logtalk' => 'source.logtalk' do
  file_types %w(lgt)
  key_equivalent "^~L"  # TextMate only
  uuid "C11FA1F2-6EDB-11D9-8798-000A95DAA580"  # TextMate only

  rule 'comment.block.logtalk' do
    from %r'/\*'
    to %r'\*/'
    both 0 => 'punctuation.definition.comment.logtalk'
  end
  rule do
    from %r/(^[ \t]+)?(?=%)/,
      1 => 'punctuation.whitespace.comment.leading.ruby'
    to %r/(?!\G)/
    rule 'comment.line.percentage.logtalk' do
      from %r/%/,
        0 => 'punctuation.definition.comment.logtalk'
      to %r/\n/
    end
  end
  rule 'comment.line.percentage.logtalk' do
    match %r/(%).*$\n?/,
      1 => 'punctuation.definition.comment.logtalk'
  end
  rule do
    match %r/((:-)\s(object|protocol|category|module))(?:\()([^(,)]+)/,
      1 => 'storage.type.opening.logtalk',
      2 => 'punctuation.definition.storage.type.logtalk',
      4 => 'entity.name.type.logtalk'
  end
  rule 'storage.type.closing.logtalk' do
    match %r/(:-)\s(end_(object|protocol|category))(?=[.])/,
      1 => 'punctuation.definition.storage.type.logtalk'
  end
  rule 'storage.type.relations.logtalk' do
    match %r/\b(complements|extends|i(nstantiates|mp(orts|lements))|specializes)(?=[(])/
  end
  rule 'storage.modifier.others.logtalk' do
    match %r/(:-)\s(e(lse|ndif)|dynamic|synchronized|threaded)(?=[.])/,
      1 => 'punctuation.definition.storage.modifier.logtalk'
  end
  rule 'storage.modifier.others.logtalk' do
    match %r/(:-)\s(c(alls|oinductive)|e(lif|n(coding|sure_loaded)|xport)|i(f|n(clude|itialization|fo))|reexport|set_(logtalk|prolog)_flag|uses)(?=[(])/,
      1 => 'punctuation.definition.storage.modifier.logtalk'
  end
  rule 'storage.modifier.others.logtalk' do
    match %r/(:-)\s(alias|info|d(ynamic|iscontiguous)|m(eta_(non_terminal|predicate)|ode|ultifile)|p(ublic|r(otected|ivate))|op|use(s|_module)|synchronized)(?=[(])/,
      1 => 'punctuation.definition.storage.modifier.logtalk'
  end
  rule 'keyword.operator.message-sending.logtalk' do
    match %r/(:|::|\^\^)/
  end
  rule 'keyword.operator.external-call.logtalk' do
    match %r/([{}])/
  end
  rule 'keyword.operator.mode.logtalk' do
    match %r/(\?|@)/
  end
  rule 'keyword.operator.comparison.term.logtalk' do
    match %r/(@=<|@<|@>|@>=|==|\\==)/
  end
  rule 'keyword.operator.comparison.arithmetic.logtalk' do
    match %r/(=<|<|>|>=|=:=|=\\=)/
  end
  rule 'keyword.operator.bitwise.logtalk' do
    match %r'(<<|>>|/\\|\\/|\\)'
  end
  rule 'keyword.operator.evaluable.logtalk' do
    match %r/\b(e|pi|mod|rem)\b(?![-!(^~])/
  end
  rule 'keyword.operator.evaluable.logtalk' do
    match %r'(\*\*|\+|-|\*|/|//)'
  end
  rule 'keyword.operator.misc.logtalk' do
    match %r/(:-|!|\\+|,|;|-->|->|=|\=|\.|=\.\.|\^|\bis\b)/
  end
  rule 'support.function.evaluable.logtalk' do
    match %r/\b(a(bs|cos|sin|tan)|c(eiling|os)|exp|flo(at(_(integer|fractional)_part)?|or)|log|m(ax|in|od)|r(em|ound)|s(i(n|gn)|qrt)|truncate)(?=[(])/
  end
  rule 'support.function.control.logtalk' do
    match %r/\b(true|fail|repeat)\b(?![-!(^~])/
  end
  rule 'support.function.control.logtalk' do
    match %r/\b(ca(ll|tch)|ignore|throw|once)(?=[(])/
  end
  rule 'support.function.chars-and-bytes-io.logtalk' do
    match %r/\b((get|p(eek|ut))_(c(har|ode)|byte)|nl)(?=[(])/
  end
  rule 'support.function.chars-and-bytes-io.logtalk' do
    match %r/\bnl\b/
  end
  rule 'support.function.atom-term-processing.logtalk' do
    match %r/\b(atom_(length|c(hars|o(ncat|des)))|sub_atom|char_code|number_c(har|ode)s)(?=[(])/
  end
  rule 'support.function.term-testing.logtalk' do
    match %r/\b(var|atom(ic)?|integer|float|c(allable|ompound)|n(onvar|umber)|ground|acyclic_term)(?=[(])/
  end
  rule 'support.function.term-comparison.logtalk' do
    match %r/\b(compare)(?=[(])/
  end
  rule 'support.function.term-io.logtalk' do
    match %r/\b(read(_term)?|write(q|_(canonical|term))?|(current_)?(char_conversion|op))(?=[(])/
  end
  rule 'support.function.term-creation-and-decomposition.logtalk' do
    match %r/\b(arg|copy_term|functor|numbervars|term_variables)(?=[(])/
  end
  rule 'support.function.term-unification.logtalk' do
    match %r/\b(subsumes_term|unify_with_occurs_check)(?=[(])/
  end
  rule 'support.function.stream-selection-and-control.logtalk' do
    match %r/\b((se|curren)t_(in|out)put|open|close|flush_output|stream_property|at_end_of_stream|set_stream_position)(?=[(])/
  end
  rule 'support.function.stream-selection-and-control.logtalk' do
    match %r/\b(flush_output|at_end_of_stream)\b/
  end
  rule 'support.function.prolog-flags.logtalk' do
    match %r/\b((se|curren)t_prolog_flag)(?=[(])/
  end
  rule 'support.function.compiling-and-loading.logtalk' do
    match %r/\b(logtalk_(compile|l(ibrary_path|oad|oad_context)))(?=[(])/
  end
  rule 'support.function.event-handling.logtalk' do
    match %r/\b((abolish|define)_events|current_event)(?=[(])/
  end
  rule 'support.function.implementation-defined-hooks.logtalk' do
    match %r/\b((curren|se)t_logtalk_flag|halt)(?=[(])/
  end
  rule 'support.function.implementation-defined-hooks.logtalk' do
    match %r/\b(halt)\b/
  end
  rule 'support.function.sorting.logtalk' do
    match %r/\b((key)?(sort))(?=[(])/
  end
  rule 'support.function.entity-creation-and-abolishing.logtalk' do
    match %r/\b((c(reate|urrent)|abolish)_(object|protocol|category))(?=[(])/
  end
  rule 'support.function.reflection.logtalk' do
    match %r/\b((object|protocol|category)_property|co(mplements_object|nforms_to_protocol)|extends_(object|protocol|category)|imp(orts_category|lements_protocol)|(instantiat|specializ)es_class)(?=[(])/
  end
  rule 'support.function.logtalk' do
    match %r/\b((for|retract)all)(?=[(])/
  end
  rule 'support.function.execution-context.logtalk' do
    match %r/\b(parameter|se(lf|nder)|this)(?=[(])/
  end
  rule 'support.function.database.logtalk' do
    match %r/\b(a(bolish|ssert(a|z))|clause|retract(all)?)(?=[(])/
  end
  rule 'support.function.all-solutions.logtalk' do
    match %r/\b((bag|set)of|f(ind|or)all)(?=[(])/
  end
  rule 'support.function.multi-threading.logtalk' do
    match %r/\b(threaded(_(call|once|ignore|exit|peek|wait|notify))?)(?=[(])/
  end
  rule 'support.function.reflection.logtalk' do
    match %r/\b(current_predicate|predicate_property)(?=[(])/
  end
  rule 'support.function.event-handler.logtalk' do
    match %r/\b(before|after)(?=[(])/
  end
  rule 'support.function.grammar-rule.logtalk' do
    match %r/\b(expand_(goal|term)|(goal|term)_expansion|phrase)(?=[(])/
  end
  rule 'string.quoted.single.logtalk' do
    from %r/'/,
      0 => 'punctuation.definition.string.begin.logtalk'
    to %r/'/,
      0 => 'punctuation.definition.string.end.logtalk'
    rule 'constant.character.escape.logtalk' do
      match %r/\\([\\abfnrtv"']|(x[a-fA-F0-9]+|[0-7]+)\\)/
    end
  end
  rule 'string.quoted.double.logtalk' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.logtalk'
    to %r/"/,
      0 => 'punctuation.definition.string.end.logtalk'
    rule 'constant.character.escape.logtalk' do
      match %r/\\./
    end
  end
  rule 'constant.numeric.logtalk' do
    match %r/\b(0b[0-1]+|0o[0-7]+|0x\h+)\b/
  end
  rule 'constant.numeric.logtalk' do
    match %r/\b(0'.|0''|0'")/
  end
  rule 'constant.numeric.logtalk' do
    match %r/\b(\d+\.?\d*((e|E)(\+|-)?\d+)?)\b/
  end
  rule 'variable.other.logtalk' do
    match %r/\b([A-Z_][A-Za-z0-9_]*)\b/
  end
end
