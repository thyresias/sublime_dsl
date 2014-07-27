# encoding: utf-8

language 'LaTeX Beamer' => 'text.tex.latex.beamer' do
  # FIXME: no file types
  first_line_match %r/^\\documentclass(\[.*\])?\{beamer\}/
  folding_start_marker %r/\\begin\{.*\}|%.*\(fold\)\s*$/
  folding_stop_marker %r/\\end\{.*\}|%.*\(end\)\s*$/
  key_equivalent "^~B"  # TextMate only
  uuid "2ACA20AA-B008-469B-A04A-6DE232973ED8"  # TextMate only

  rule 'meta.function.environment.frame.latex' do
    from %r/(?:\s*)((\\)begin)(\{)(frame)(\})/
    to %r/((\\)end)(\{)(frame)(\})/
    both 1 => 'support.function.be.latex',
         2 => 'punctuation.definition.function.latex',
         3 => 'punctuation.definition.arguments.begin.latex',
         4 => 'variable.parameter.function.latex',
         5 => 'punctuation.definition.arguments.end.latex'
    include "$self"
  end
  rule 'meta.function.frametitle.latex' do
    match %r/((\\)frametitle)(\{)(.*)(\})/,
      1 => 'support.function.frametitle.latex',
      2 => 'punctuation.definition.function.latex',
      3 => 'punctuation.definition.arguments.begin.latex',
      4 => 'entity.name.function.frame.latex',
      5 => 'punctuation.definition.arguments.end.latex'
  end
  include "text.tex.latex"
end
