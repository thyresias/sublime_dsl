# encoding: utf-8

language 'OCamlyacc' => 'source.ocamlyacc' do
  file_types %w(mly)
  folding_start_marker %r/%{|%%/
  folding_stop_marker %r/%}|%%/
  key_equivalent "^~O"  # TextMate only
  uuid "1B59327E-9B82-4B78-9411-BC02067DBDF9"  # TextMate only

  rule 'meta.header.ocamlyacc' do
    from %r/(%{)\s*$/,
      1 => 'punctuation.section.header.begin.ocamlyacc'
    to %r/^\s*(%})/,
      1 => 'punctuation.section.header.end.ocamlyacc'
    include "source.ocaml"
  end
  rule 'meta.declarations.ocamlyacc' do
    from %r/(?<=%})\s*$/
    to %r/(?:^)(?=%%)/
    include "#comments"
    include "#declaration-matches"
  end
  rule 'meta.rules.ocamlyacc' do
    from %r/(%%)\s*$/,
      1 => 'punctuation.section.rules.begin.ocamlyacc'
    to %r/^\s*(%%)/,
      1 => 'punctuation.section.rules.end.ocamlyacc'
    include "#comments"
    include "#rules"
  end
  include "source.ocaml"
  include "#comments"
  rule 'invalid.illegal.unrecognized-character.ocaml' do
    match %r/(’|‘|“|”)/
  end

  fragment :comments do
    rule 'comment.block.ocamlyacc' do
      from %r'/\*'
      to %r'\*/'
      include "#comments"
    end
    rule 'comment.block.string.quoted.double.ocamlyacc' do
      from %r/(?=[^\\])(")/
      to %r/"/
      rule 'comment.block.string.constant.character.escape.ocamlyacc' do
        match %r/\\(x[a-fA-F0-9][a-fA-F0-9]|[0-2]\d\d|[bnrt'"\\])/
      end
    end
  end

  fragment :"declaration-matches" do
    rule 'meta.token.declaration.ocamlyacc' do
      from %r/(%)(token)/,
        1 => 'keyword.other.decorator.token.ocamlyacc',
        2 => 'keyword.other.token.ocamlyacc'
      to %r/^\s*($|(^\s*(?=%)))/
      include "#symbol-types"
      rule 'entity.name.type.token.ocamlyacc' do
        match %r/[A-Z][A-Za-z0-9_]*/
      end
      include "#comments"
    end
    rule 'meta.token.associativity.ocamlyacc' do
      from %r/(%)(left|right|nonassoc)/,
        1 => 'keyword.other.decorator.token.associativity.ocamlyacc',
        2 => 'keyword.other.token.associativity.ocamlyacc'
      to %r/(^\s*$)|(^\s*(?=%))/
      rule 'entity.name.type.token.ocamlyacc' do
        match %r/[A-Z][A-Za-z0-9_]*/
      end
      rule 'entity.name.function.non-terminal.reference.ocamlyacc' do
        match %r/[a-z][A-Za-z0-9_]*/
      end
      include "#comments"
    end
    rule 'meta.start-symbol.ocamlyacc' do
      from %r/(%)(start)/,
        1 => 'keyword.other.decorator.start-symbol.ocamlyacc',
        2 => 'keyword.other.start-symbol.ocamlyacc'
      to %r/(^\s*$)|(^\s*(?=%))/
      rule 'entity.name.function.non-terminal.reference.ocamlyacc' do
        match %r/[a-z][A-Za-z0-9_]*/
      end
      include "#comments"
    end
    rule 'meta.symbol-type.ocamlyacc' do
      from %r/(%)(type)/,
        1 => 'keyword.other.decorator.symbol-type.ocamlyacc',
        2 => 'keyword.other.symbol-type.ocamlyacc'
      to %r/$\s*(?!%)/
      include "#symbol-types"
      rule 'entity.name.type.token.reference.ocamlyacc' do
        match %r/[A-Z][A-Za-z0-9_]*/
      end
      rule 'entity.name.function.non-terminal.reference.ocamlyacc' do
        match %r/[a-z][A-Za-z0-9_]*/
      end
      include "#comments"
    end
  end

  fragment :precs do
    rule 'meta.precidence.declaration' do
      match %r/(%)(prec)\s+(([a-z][a-zA-Z0-9_]*)|(([A-Z][a-zA-Z0-9_]*)))/,
        1 => 'keyword.other.decorator.precedence.ocamlyacc',
        2 => 'keyword.other.precedence.ocamlyacc',
        4 => 'entity.name.function.non-terminal.reference.ocamlyacc',
        5 => 'entity.name.type.token.reference.ocamlyacc'
    end
  end

  fragment :references do
    rule 'entity.name.function.non-terminal.reference.ocamlyacc' do
      match %r/[a-z][a-zA-Z0-9_]*/
    end
    rule 'entity.name.type.token.reference.ocamlyacc' do
      match %r/[A-Z][a-zA-Z0-9_]*/
    end
  end

  fragment :"rule-patterns" do
    rule 'meta.rule-match.ocaml' do
      from %r/((?<!\||:)(\||:)(?!\||:))/,
        0 => 'punctuation.separator.rule.ocamlyacc'
      to %r/\s*(?=\||;)/
      include "#precs"
      include "#semantic-actions"
      include "#references"
      include "#comments"
    end
  end

  fragment :rules do
    rule 'meta.non-terminal.ocamlyacc' do
      from %r/[a-z][a-zA-Z_]*/,
        0 => 'entity.name.function.non-terminal.ocamlyacc'
      to %r/;/,
        0 => 'punctuation.separator.rule.ocamlyacc'
      include "#rule-patterns"
    end
  end

  fragment :"semantic-actions" do
    rule 'meta.action.semantic.ocamlyacc' do
      from %r/[^\']({)/
      to %r/(})/
      both 1 => 'punctuation.definition.action.semantic.ocamlyacc'
      include "source.ocaml"
    end
  end

  fragment :"symbol-types" do
    rule 'meta.token.type-declaration.ocamlyacc' do
      from %r/</,
        0 => 'punctuation.definition.type-declaration.begin.ocamlyacc'
      to %r/>/,
        0 => 'punctuation.definition.type-declaration.end.ocamlyacc'
      include "source.ocaml"
    end
  end
end
