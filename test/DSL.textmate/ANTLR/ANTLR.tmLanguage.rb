# encoding: utf-8

language 'ANTLR' => 'source.antlr' do
  file_types %w(g)
  key_equivalent "^~A"  # TextMate only
  uuid "ACABDECD-4F22-47D9-A5F4-DBA957A2A1CC"  # TextMate only

  include "#strings"
  include "#comments"
  rule 'meta.options.antlr' do
    from %r/\boptions\b/,
      0 => 'keyword.other.options.antlr'
    to %r/(?<=\})/
    rule 'meta.options-block.antlr' do
      from %r/\{/,
        0 => 'punctuation.section.options.begin.antlr'
      to %r/\}/,
        0 => 'punctuation.section.options.end.antlr'
      include "#strings"
      include "#comments"
      rule 'constant.numeric.antlr' do
        match %r/\b\d+\b/
      end
      rule 'variable.other.option.antlr' do
        match %r/\b(k|charVocabulary|filter|greedy|paraphrase|exportVocab|buildAST|defaultErrorHandler|language|namespace|namespaceStd|namespaceAntlr|genHashLines)\b/
      end
      rule 'constant.language.boolean.antlr' do
        match %r/\b(true|false)\b/
      end
    end
  end
  rule 'meta.definition.class.antlr' do
    from %r/^(class)\b\s+(\w+)/
    to %r/;/
    both 1 => 'storage.type.antlr',
         2 => 'entity.name.type.class.antlr'
    rule 'meta.definition.class.extends.antlr' do
      from %r/\b(extends)\b\s+/
      to %r/(?=;)/
      both 1 => 'storage.modifier.antlr'
      rule 'support.class.antlr' do
        match %r/\b(Parser|Lexer|TreeWalker)\b/
      end
    end
  end
  rule 'storage.modifier.antlr' do
    match %r/^protected\b/
  end
  rule 'entity.name.type.token.antlr' do
    match %r/^[[:upper:]_][[:upper:][:digit:]_]*\b/
  end
  rule 'meta.rule.antlr' do
    match %r/^(\w+)(?:\s+(returns\b))?/,
      1 => 'entity.name.function.rule.antlr',
      2 => 'keyword.control.antlr'
  end
  rule 'constant.other.token.antlr' do
    match %r/\b[[:upper:]_][[:upper:][:digit:]_]*\b/
  end
  include "#nested-curly"

  fragment :comments do
    rule 'comment.block.antlr' do
      from %r'/\*',
        0 => 'punctuation.definition.comment.begin.antlr'
      to %r'\*/',
        0 => 'punctuation.definition.comment.end.antlr'
    end
    rule do
      from %r'(^[ \t]+)?(?=//)',
        1 => 'punctuation.whitespace.comment.leading.antlr'
      to %r/(?!\G)/
      rule 'comment.line.double-slash.antlr' do
        from %r'//',
          0 => 'punctuation.definition.comment.antlr'
        to %r/\n/
      end
    end
  end

  fragment :"nested-curly" do
    rule 'source.embedded.java-or-c.antlr' do
      from %r/\{/,
        0 => 'punctuation.section.group.begin.antlr'
      to %r/\}/,
        0 => 'punctuation.section.group.end.antlr'
      rule 'keyword.control.java-or-c' do
        match %r/\b(break|case|continue|default|do|else|for|goto|if|_Pragma|return|switch|while)\b/
      end
      rule 'storage.type.java-or-c' do
        match %r/\b(asm|__asm__|auto|bool|_Bool|char|_Complex|double|enum|float|_Imaginary|int|long|short|signed|struct|typedef|union|unsigned|void)\b/
      end
      rule 'storage.modifier.java-or-c' do
        match %r/\b(const|extern|register|restrict|static|volatile|inline)\b/
      end
      rule 'constant.language.java-or-c' do
        match %r/\b(NULL|true|false|TRUE|FALSE)\b/
      end
      rule 'keyword.operator.sizeof.java-or-c' do
        match %r/\b(sizeof)\b/
      end
      rule 'constant.numeric.java-or-c' do
        match %r/\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)(L|l|UL|ul|u|U|F|f|ll|LL|ull|ULL)?\b/
      end
      rule 'string.quoted.double.java-or-c' do
        from %r/"/,
          0 => 'punctuation.definition.string.begin.java-or-c'
        to %r/"/,
          0 => 'punctuation.definition.string.end.java-or-c'
        rule 'constant.character.escape.antlr' do
          match %r/\\./
        end
      end
      rule 'string.quoted.single.java-or-c' do
        from %r/'/,
          0 => 'punctuation.definition.string.begin.java-or-c'
        to %r/'/,
          0 => 'punctuation.definition.string.end.java-or-c'
        rule 'constant.character.escape.antlr' do
          match %r/\\./
        end
      end
      rule 'support.constant.eof-char.antlr' do
        match %r/\bEOF_CHAR\b/
      end
      include "#comments"
    end
  end

  fragment :strings do
    rule 'string.quoted.double.antlr' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.antlr'
      to %r/"/,
        0 => 'punctuation.definition.string.end.antlr'
      rule 'constant.character.escape.antlr' do
        match %r/\\(u\h{4}|.)/
      end
    end
    rule 'string.quoted.single.antlr' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.antlr'
      to %r/'/,
        0 => 'punctuation.definition.string.end.antlr'
      rule 'constant.character.escape.antlr' do
        match %r/\\(u\h{4}|.)/
      end
    end
  end
end
