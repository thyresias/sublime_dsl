# encoding: utf-8

language 'OCamllex' => 'source.ocamllex' do
  file_types %w(mll)
  folding_start_marker %r/{/
  folding_stop_marker %r/}/
  key_equivalent "^~O"  # TextMate only
  uuid "007E5263-8E0D-4BEF-B0E1-F01AE32590E8"  # TextMate only

  rule 'meta.embedded.ocaml' do
    from %r/^\s*({)/,
      1 => 'punctuation.section.embedded.ocaml.begin.ocamllex'
    to %r/^\s*(})/,
      1 => 'punctuation.section.embedded.ocaml.end.ocamllex'
    include "source.ocaml"
  end
  rule 'meta.pattern-definition.ocaml' do
    from %r/\b(let)\s+([a-z][a-zA-Z0-9'_]*)\s+=/,
      1 => 'keyword.other.pattern-definition.ocamllex',
      2 => 'entity.name.type.pattern.stupid-goddamn-hack.ocamllex'
    to %r/^(?:\s*let)|(?:\s*(rule|$))/
    include "#match-patterns"
  end
  rule 'meta.pattern-match.ocaml' do
    from %r/(rule|and)\s+([a-z][a-zA-Z0-9_]*)\s+(=)\s+(parse)(?=\s*$)|((?<!\|)(\|)(?!\|))/,
      1 => 'keyword.other.ocamllex',
      2 => 'entity.name.function.entrypoint.ocamllex',
      3 => 'keyword.operator.ocamllex',
      4 => 'keyword.other.ocamllex',
      5 => 'punctuation.separator.match-pattern.ocamllex'
    to %r/(?:^\s*((and)\b|(?=\|)|$))/,
      3 => 'keyword.other.entry-definition.ocamllex'
    include "#match-patterns"
    include "#actions"
  end
  include "#strings"
  include "#comments"
  rule 'keyword.operator.symbol.ocamllex' do
    match %r/=/
  end
  rule 'meta.paren-group.ocamllex' do
    from %r/\(/
    to %r/\)/
    include "$self"
  end
  rule 'invalid.illegal.unrecognized-character.ocamllex' do
    match %r/(’|‘|“|”)/
  end

  fragment :actions do
    rule 'meta.action.ocamllex' do
      from %r/[^\']({)/,
        1 => 'punctuation.definition.action.begin.ocamllex'
      to %r/(})/,
        1 => 'punctuation.definition.action.end.ocamllex'
      include "source.ocaml"
    end
  end

  fragment :chars do
    rule 'constant.character.ocamllex' do
      match %r/(')([^\\]|\\(x[a-fA-F0-9][a-fA-F0-9]|[0-2]\d\d|[bnrt'"\\]))(')/,
        1 => 'punctuation.definition.char.begin.ocamllex',
        4 => 'punctuation.definition.char.end.ocamllex'
    end
  end

  fragment :comments do
    rule 'comment.block.ocaml' do
      match %r/\(\*(?:(\*)| ( )\*)\)/,
        1 => 'comment.block.empty.ocaml',
        2 => 'comment.block.empty.ocaml'
    end
    rule 'comment.block.ocaml' do
      from %r/\(\*/
      to %r/\*\)/
      include "#comments"
    end
    rule 'comment.block.string.quoted.double.ocaml' do
      from %r/(?=[^\\])(")/
      to %r/"/
      rule 'comment.block.string.constant.character.escape.ocaml' do
        match %r/\\(x[a-fA-F0-9][a-fA-F0-9]|[0-2]\d\d|[bnrt'"\\])/
      end
    end
  end

  fragment :"match-patterns" do
    rule 'meta.pattern.sub-pattern.ocamllex' do
      from %r/(\()/,
        1 => 'punctuation.definition.sub-pattern.begin.ocamllex'
      to %r/(\))/,
        1 => 'punctuation.definition.sub-pattern.end.ocamllex'
      include "#match-patterns"
    end
    rule 'entity.name.type.pattern.reference.stupid-goddamn-hack.ocamllex' do
      match %r/[a-z][a-zA-Z0-9'_]/
    end
    rule 'keyword.other.pattern.ocamllex' do
      match %r/\bas\b/
    end
    rule 'constant.language.eof.ocamllex' do
      match %r/eof/
    end
    rule 'constant.language.universal-match.ocamllex' do
      match %r/_/
    end
    rule 'meta.pattern.character-class.ocamllex' do
      from %r/(\[)(\^?)/,
        1 => 'punctuation.definition.character-class.begin.ocamllex',
        2 => 'punctuation.definition.character-class.negation.ocamllex'
      # FIXME: (warning) regular expression has ']' without escape
      to %r/(])(?!\')/,
        1 => 'punctuation.definition.character-class.end.ocamllex'
      rule 'punctuation.separator.character-class.range.ocamllex' do
        match %r/-/
      end
      include "#chars"
    end
    rule 'keyword.operator.pattern.modifier.ocamllex' do
      match %r/\*|\+|\?/
    end
    rule 'keyword.operator.pattern.alternation.ocamllex' do
      match %r/\|/
    end
    include "#chars"
    include "#strings"
  end

  fragment :strings do
    rule 'string.quoted.double.ocamllex' do
      from %r/(?=[^\\])(")/,
        1 => 'punctuation.definition.string.begin.ocaml'
      to %r/(")/,
        1 => 'punctuation.definition.string.end.ocaml'
      rule 'punctuation.separator.string.ignore-eol.ocaml' do
        match %r/\\$[ \t]*/
      end
      rule 'constant.character.string.escape.ocaml' do
        match %r/\\(x[a-fA-F0-9][a-fA-F0-9]|[0-2]\d\d|[bnrt'"\\])/
      end
      rule 'constant.character.regexp.escape.ocaml' do
        match %r/\\[\|\(\)1-9$^.*+?\[\]]/
      end
      rule 'invalid.illegal.character.string.escape' do
        match %r/\\(?!(x[a-fA-F0-9][a-fA-F0-9]|[0-2]\d\d|[bnrt'"\\]|[\|\(\)1-9$^.*+?\[\]]|$[ \t]*))(?:.)/
      end
    end
  end
end
