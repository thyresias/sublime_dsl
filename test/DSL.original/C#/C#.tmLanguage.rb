# encoding: utf-8

language 'C#' => 'source.cs' do
  file_types %w(cs)
  folding_start_marker %r'^\s*/\*|^(?![^{]*?//|[^{]*?/\*(?!.*?\*/.*?\{)).*?\{\s*($|//|/\*(?!.*?\*/.*\S))'
  folding_stop_marker %r'^\s*\*/|^\s*\}'
  key_equivalent "^~C"  # TextMate only
  uuid "1BA75B32-707C-11D9-A928-000D93589AF6"  # TextMate only

  rule 'comment.block.documentation.source.cs' do
    from %r'///'
    to %r/$\n?/
    both 0 => 'punctuation.definition.comment.source.cs'
    rule 'keyword.other.documentation.source.cs' do
      from %r'(</?)(?:([-_a-zA-Z0-9]+)((:)))?([-_a-zA-Z0-9:]+)'
      to %r'(/?>)'
      both 1 => 'punctuation.definition.tag.source.cs',
           2 => 'entity.name.tag.namespace.source.cs',
           3 => 'entity.name.tag.source.cs',
           4 => 'punctuation.separator.namespace.source.cs',
           5 => 'entity.name.tag.localname.source.cs'
      rule do
        match %r/ (?:([-_a-zA-Z0-9]+)((:)))?([_a-zA-Z-]+)=/,
          1 => 'entity.other.attribute-name.namespace.source.cs',
          2 => 'entity.other.attribute-name.source.cs',
          3 => 'punctuation.separator.namespace.source.cs',
          4 => 'entity.other.attribute-name.localname.source.cs'
      end
      include "#doubleQuotedString"
      include "#singleQuotedString"
    end
  end
  include "#comments"
  rule 'meta.definition.class.source.cs' do
    from %r/(?x)^\s*
((?:\b(?:new|public|protected|internal|private|abstract|sealed|static)\b\s)*)
(class)\s+
([A-Za-z_]\w+)\b/
    to %r/{/
    both 1 => 'storage.modifier.source.cs',
         2 => 'storage.type.source.cs',
         3 => 'entity.name.type.class.source.cs'
    include "#classInheritance"
  end
  rule 'constant.language.source.cs' do
    match %r/\b(true|false|null|this|base)\b/
  end
  rule 'constant.numeric.source.cs' do
    match %r/\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)(L|l|UL|ul|u|U|F|f|ll|LL|ull|ULL)?\b/
  end
  rule 'keyword.control.source.cs' do
    match %r/\b(if|else|while|for|foreach|do|return|continue|break|switch|case|default|goto|throw|try|catch|finally|lock|yield)\b/
  end
  rule 'keyword.operator.source.cs' do
    match %r/\b(new|is|checked|unchecked|typeof|sizeof|override|in|out|ref|readonly|params|stackalloc|as)\b/
  end
  rule 'keyword.other.source.cs' do
    match %r/\b(event|delegate|explicit|implicit|in|set|get)\b/
  end
  rule 'storage.modifier.source.cs' do
    match %r/\b(internal|public|protected|private|static|const|new|sealed|abstract|override|extern|unsafe|readonly|volatile|operator)\b/
  end
  include "#doubleQuotedStringLiteral"
  include "#doubleQuotedString"
  include "#singleQuotedString"
  rule 'meta.keyword.using.source.cs' do
    match %r/^\s*(using)\s+([^ ;]*);/,
      1 => 'keyword.other.using.source.cs',
      2 => 'entity.name.type.package.source.cs'
  end
  include "#builtinTypes"
  rule 'meta.keyword.namespace.source.cs' do
    match %r/^\s*(namespace)\s+([^ ]+)(?:\s*{)?$/,
      1 => 'keyword.other.namespace.source.cs',
      2 => 'entity.name.type.namespace.source.cs'
  end
  rule 'meta.preprocessor.source.cs' do
    match %r/^(#)\s*(if|else|elif|endif|define|undef|warning|error|line|region|endregion)\b/,
      2 => 'keyword.control.import.source.cs'
  end

  fragment :builtinTypes do
    rule 'storage.type.source.cs' do
      match %r/\b(bool|byte|sbyte|char|decimal|double|float|int|uint|long|ulong|object|short|ushort|string|void|class|struct|enum|interface)\b/
    end
  end

  fragment :classInheritance do
    rule do
      from %r/:/
      to %r/(?={)/
      rule do
        match %r/\s*,?([A-Za-z_]\w*)\b/,
          1 => 'storage.type.source.cs'
      end
    end
  end

  fragment :comments do
    rule 'comment.block.source.cs' do
      from %r'/\*'
      to %r'\*/\n?'
      both 0 => 'punctuation.definition.comment.source.cs'
    end
    rule 'comment.line.double-slash.source.cs' do
      match %r'(//).*$\n?',
        1 => 'punctuation.definition.comment.source.cs'
    end
  end

  fragment :doubleQuotedString do
    rule 'string.quoted.double.source.cs' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.source.cs'
      to %r/"/,
        0 => 'punctuation.definition.string.end.source.cs'
      rule 'constant.character.escape.source.cs' do
        match %r/\\./
      end
    end
  end

  fragment :doubleQuotedStringLiteral do
    rule 'string.quoted.double.literal.source.cs' do
      match %r/@"([^"]|"")*"/,
        0 => 'punctuation.definition.string.begin.source.cs'
    end
  end

  fragment :singleQuotedString do
    rule 'string.quoted.single.xml' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.source.cs'
      to %r/'/,
        0 => 'punctuation.definition.string.end.source.cs'
      rule 'constant.character.escape.source.cs' do
        match %r/\\./
      end
    end
  end

  # FIXME: this fragment is never referenced
  fragment :statementRemainder do
    rule 'meta.definition.param-list.source.cs' do
      from %r/\(/
      to %r/(?=\))/
      include "#builtinTypes"
    end
  end
end
