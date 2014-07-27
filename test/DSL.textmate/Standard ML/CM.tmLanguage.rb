# encoding: utf-8

language 'Standard ML - CM' => 'source.cm', file: 'CM' do
  # CM is the SML Compilation Manager, a sophisticated make that determines dependencies for you.
  file_types %w(cm)
  uuid "AEF91285-0D21-4BB0-B702-F5D0CEDBA4B8"  # TextMate only

  rule 'comment.block.cm' do
    from %r/\(\*/,
      0 => 'punctuation.definition.comment.begin.ml'
    to %r/\*\)/,
      0 => 'punctuation.definition.comment.end.ml'
  end
  rule 'keyword.other.cm' do
    match %r/\b(Library|is|Group|structure|signature|functor)\b/
  end
  rule 'meta.directive.cm' do
    from %r/^\s*(#(if).*)/
    to %r/^\s*(#(endif))/
    both 1 => 'meta.preprocessor.cm',
         2 => 'keyword.control.import.if.cm'
  end
  rule 'string.quoted.double.cm' do
    from %r/"/
    to %r/"/
    rule 'constant.character.escape.cm' do
      match %r/\\./
    end
  end
end
