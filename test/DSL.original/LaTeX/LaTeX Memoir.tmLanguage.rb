# encoding: utf-8

language 'LaTeX Memoir' => 'text.tex.latex.memoir' do
  # FIXME: no file types
  first_line_match %r/^\\documentclass(\[.*\])?\{memoir\}/
  folding_start_marker %r/\\begin\{.*\}|%.*\(fold\)\s*$/
  folding_stop_marker %r/\\end\{.*\}|%.*\(end\)\s*$/
  key_equivalent "^~M"  # TextMate only
  uuid "D0853B20-ABFF-48AB-8AB9-3D8BA0755C05"  # TextMate only

  rule 'meta.function.memoir-fbox.latex' do
    from %r/(?:\s*)((\\)begin)(\{)(framed|shaded|leftbar)(\})/
    to %r/((\\)end)(\{)(\4)(\})/
    both 1 => 'support.function.be.latex',
         2 => 'punctuation.definition.function.latex',
         3 => 'punctuation.definition.arguments.begin.latex',
         4 => 'variable.parameter.function.latex',
         5 => 'punctuation.definition.arguments.end.latex'
    include "$self"
  end
  rule 'meta.function.memoir-verbatim.latex' do
    content_scope "markup.raw.verbatim.latex"
    from %r/(?:\s*)((\\)begin)(\{)((?:fboxv|boxedv|V)erbatim)(\})/
    to %r/((\\)end)(\{)(\4)(\})/
    both 1 => 'support.function.be.latex',
         2 => 'punctuation.definition.function.latex',
         3 => 'punctuation.definition.arguments.begin.latex',
         4 => 'variable.parameter.function.latex',
         5 => 'punctuation.definition.arguments.end.latex'
  end
  rule 'meta.function.memoir-alltt.latex' do
    content_scope "markup.raw.verbatim.latex"
    from %r/(?:\s*)((\\)begin)(\{)(alltt)(\})/
    to %r/((\\)end)(\{)(alltt)(\})/
    both 1 => 'support.function.be.latex',
         2 => 'punctuation.definition.function.latex',
         3 => 'punctuation.definition.arguments.begin.latex',
         4 => 'variable.parameter.function.latex',
         5 => 'punctuation.definition.arguments.end.latex'
    rule 'support.function.general.tex' do
      match %r/(\\)[A-Za-z]+/,
        1 => 'punctuation.definition.function.tex'
    end
  end
  include "text.tex.latex"
end
