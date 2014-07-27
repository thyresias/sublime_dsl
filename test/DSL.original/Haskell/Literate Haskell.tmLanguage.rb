# encoding: utf-8

language 'Literate Haskell' => 'text.tex.latex.haskell' do
  file_types %w(lhs)
  key_equivalent "^~H"  # TextMate only
  uuid "439807F5-7129-487D-B5DC-95D5272B43DD"  # TextMate only

  rule 'meta.function.embedded.haskell.latex' do
    content_scope "source.haskell.embedded.latex"
    from %r/^((\\)begin)({)code(})(\s*\n)?/
    to %r/^((\\)end)({)code(})/
    both 1 => 'support.function.be.latex',
         2 => 'punctuation.definition.function.latex',
         3 => 'punctuation.definition.arguments.begin.latex',
         4 => 'punctuation.definition.arguments.end.latex'
    include "source.haskell"
  end
  include "text.tex.latex"
end
