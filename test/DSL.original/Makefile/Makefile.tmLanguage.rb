# encoding: utf-8

language 'Makefile' => 'source.makefile' do
  file_types %w(GNUmakefile makefile Makefile OCamlMakefile make)
  uuid "FF1825E8-6B1C-11D9-B883-000D93589AF6"  # TextMate only

  rule 'variable.other.makefile' do
    from %r/^(\w|[-_])+\s*\??=/
    to %r/$/
    rule do
      match %r/\\\n/
    end
  end
  rule 'string.interpolated.backtick.makefile' do
    from %r/`/
    to %r/`/
    include "source.shell"
  end
  rule 'comment.line.number-sign.makefile' do
    from %r/#/,
      0 => 'punctuation.definition.comment.makefile'
    to %r/$\n?/
    rule 'punctuation.separator.continuation.makefile' do
      match %r/(?<!\\)\\$\n/
    end
  end
  rule 'keyword.control.makefile' do
    match %r/^(\s*)\b(\-??include|ifeq|ifneq|ifdef|ifndef|else|endif|vpath|export|unexport|define|endef|override)\b/
  end
  rule 'meta.function.makefile' do
    match %r/^([^\t ]+(\s[^\t ]+)*:(?!\=))\s*.*/,
      1 => 'entity.name.function.makefile'
  end
end
