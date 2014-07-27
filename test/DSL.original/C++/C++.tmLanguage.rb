# encoding: utf-8

language 'C++' => 'source.c++' do
  # I don't think anyone uses .hp. .cp tends to be paired with .h. (I could be wrong. :) -- chris
  file_types %w(cpp cc cp cxx c++ C h hh hpp hxx h++ inl ipp)
  first_line_match %r/-\*- C\+\+ -\*-/
  folding_start_marker %r'(?x)
     /\*\*(?!\*)
    |^(?![^{]*?//|[^{]*?/\*(?!.*?\*/.*?\{)).*?\{\s*($|//|/\*(?!.*?\*/.*\S))
  '
  folding_stop_marker %r'(?<!\*)\*\*/|^\s*\}'
  key_equivalent "^~C"  # TextMate only
  uuid "26251B18-6B1D-11D9-AFDB-000D93589AF6"  # TextMate only

  include "#special_block"
  include "source.c"
  rule 'storage.modifier.c++' do
    match %r/\b(friend|explicit|virtual)\b/
  end
  rule 'storage.modifier.c++' do
    match %r/\b(private:|protected:|public:)/
  end
  rule 'keyword.control.c++' do
    match %r/\b(catch|operator|try|throw|using)\b/
  end
  rule 'keyword.control.c++' do
    # FIXME: (warning) regular expression has ']' without escape
    match %r/\bdelete\b(\s*\[\])?|\bnew\b(?!])/
  end
  rule 'variable.other.readwrite.member.c++' do
    # common C++ instance var naming idiom -- fMemberName
    match %r/\b(f|m)[A-Z]\w*\b/
  end
  rule 'variable.language.c++' do
    match %r/\b(this)\b/
  end
  rule 'storage.type.template.c++' do
    match %r/\btemplate\b\s*/
  end
  rule 'keyword.operator.cast.c++' do
    match %r/\b(const_cast|dynamic_cast|reinterpret_cast|static_cast)\b\s*/
  end
  rule 'keyword.operator.c++' do
    match %r/\b(and|and_eq|bitand|bitor|compl|not|not_eq|or|or_eq|typeid|xor|xor_eq)\b/
  end
  rule 'storage.type.c++' do
    match %r/\b(class|wchar_t)\b/
  end
  rule 'storage.modifier.c++' do
    match %r/\b(export|mutable|typename)\b/
  end
  rule 'meta.function.destructor.c++' do
    from %r/(?x)
            (?:  ^                                 # begin-of-line
              |  (?: (?<!else|new|=) )             #  or word + space before name
            )
            ((?:[A-Za-z_][A-Za-z0-9_]*::)*+~[A-Za-z_][A-Za-z0-9_]*) # actual name
             \s*(\()                           # start bracket or end-of-line
          /,
      1 => 'entity.name.function.c++',
      2 => 'punctuation.definition.parameters.c'
    to %r/\)/,
      0 => 'punctuation.definition.parameters.c'
    include "$base"
  end
  rule 'meta.function.destructor.prototype.c++' do
    from %r/(?x)
            (?:  ^                                 # begin-of-line
              |  (?: (?<!else|new|=) )             #  or word + space before name
            )
            ((?:[A-Za-z_][A-Za-z0-9_]*::)*+~[A-Za-z_][A-Za-z0-9_]*) # actual name
             \s*(\()                           # terminating semi-colon
          /,
      1 => 'entity.name.function.c++',
      2 => 'punctuation.definition.parameters.c'
    to %r/\)/,
      0 => 'punctuation.definition.parameters.c'
    include "$base"
  end

  fragment :angle_brackets do
    rule 'meta.angle-brackets.c++' do
      from %r/</
      to %r/>/
      include "#angle_brackets"
      include "$base"
    end
  end

  # FIXME: this fragment is never referenced
  fragment :block do
    rule 'meta.block.c++' do
      from %r/\{/
      to %r/\}/
      rule 'meta.function-call.c' do
        match %r/(?x)
            (
              (?!while|for|do|if|else|switch|catch|enumerate|return|r?iterate)(?: \b[A-Za-z_][A-Za-z0-9_]*+\b | :: )*+                  # actual name
            )
             \s*(\()/,
          1 => 'support.function.any-method.c',
          2 => 'punctuation.definition.parameters.c'
      end
      include "$base"
    end
  end

  fragment :constructor do
    rule 'meta.function.constructor.c++' do
      from %r/(?x)
            (?:  ^\s*)                             # begin-of-line
            ((?!while|for|do|if|else|switch|catch|enumerate|r?iterate)[A-Za-z_][A-Za-z0-9_:]*) # actual name
             \s*(\()                            # start bracket or end-of-line
          /,
        1 => 'entity.name.function.c++',
        2 => 'punctuation.definition.parameters.c'
      to %r/\)/,
        0 => 'punctuation.definition.parameters.c'
      include "$base"
    end
    rule 'meta.function.constructor.initializer-list.c++' do
      from %r/(?x)
            (:)                            # begin-of-line
            ((?=\s*[A-Za-z_][A-Za-z0-9_:]* # actual name
             \s*(\()))                      # start bracket or end-of-line
          /,
        1 => 'punctuation.definition.parameters.c'
      to %r/(?=\{)/
      include "$base"
    end
  end

  fragment :special_block do
    rule 'meta.namespace-block.c++' do
      from %r/\b(namespace)\s+([A-Za-z_][_A-Za-z0-9:]*\b)?+(?!\s*?(;|=|,))/
      to %r/(?<=\})/
      rule do
        from %r/\{/
        to %r/\}/
        include "#special_block"
        include "#constructor"
        include "$base"
      end
    end
    rule 'meta.class-struct-block.c++' do
      from %r/\b(class|struct)\s+([_A-Za-z][_A-Za-z0-9]*\b)/,
        1 => 'storage.type.c++',
        2 => 'entity.name.type.c++'
      to %r/(?<=\})|(?=(;|,|\(|\)|>|\[|\]))/
      include "#angle_brackets"
      rule do
        from %r/(\{)/,
          1 => 'punctuation.definition.scope.c++'
        to %r/(\})(\s*\n)?/,
          1 => 'punctuation.definition.invalid.c++',
          2 => 'invalid.illegal.you-forgot-semicolon.c++'
        include "#special_block"
        include "#constructor"
        include "$base"
      end
      include "$base"
    end
    rule 'meta.extern-block.c++' do
      from %r/\b(extern)(?=\s*")/,
        1 => 'storage.modifier.c++'
      to %r/(?<=\})|(?=\w)/
      rule do
        from %r/\{/
        to %r/\}/
        include "#special_block"
        include "$base"
      end
      include "$base"
    end
  end
end
