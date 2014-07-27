# encoding: utf-8

language 'LaTeX Rdaemon' => 'text.tex.latex.rdaemon' do
  # FIXME: no file types
  first_line_match %r/^\\documentclass(?!.*\{beamer\})/
  folding_start_marker %r/\\begin\{.*\}|%.*\(fold\)\s*$/
  folding_stop_marker %r/\\end\{.*\}|%.*\(end\)\s*$/
  key_equivalent "^~L"  # TextMate only
  uuid "D573458E-3BC8-4383-B350-4707C67597F0"  # TextMate only

  rule 'meta.function.verbatim.latex.rdaemon.embedded' do
    content_scope "markup.raw.verbatim.latex"
    from %r/(?:\s*)((\\)begin)(\{)(Rdaemon)(\})/
    to %r/((\\)end)(\{)(\4)(\})/
    both 1 => 'support.function.be.latex.rdaemon.embedded',
         2 => 'punctuation.definition.function.latex.rdaemon.embedded',
         3 => 'punctuation.definition.arguments.begin.latex.rdaemon.embedded',
         4 => 'variable.parameter.function.latex.rdaemon.embedded',
         5 => 'punctuation.definition.arguments.end.latex.rdaemon.embedded'
    include "source.rd.console"
  end
  include "text.tex.latex"
end
