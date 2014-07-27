# encoding: utf-8

language 'Java' => 'source.java' do
  file_types %w(java bsh)
  key_equivalent "^~J"  # TextMate only
  uuid "2B449DF6-6B1D-11D9-94EC-000D93589AF6"  # TextMate only

  rule 'meta.package.java' do
    match %r/^\s*(package)\b(?:\s*([^ ;$]+)\s*(;)?)?/,
      1 => 'keyword.other.package.java',
      2 => 'storage.modifier.package.java',
      3 => 'punctuation.terminator.java'
  end
  rule 'meta.import.java' do
    content_scope "storage.modifier.import.java"
    from %r/(import static)\b\s*/,
      1 => 'keyword.other.import.static.java'
    to %r/\s*(?:$|(;))/,
      1 => 'punctuation.terminator.java'
    both 2 => 'storage.modifier.import.java',
         3 => 'punctuation.terminator.java'
    rule 'punctuation.separator.java' do
      match %r/\./
    end
    rule 'invalid.illegal.character_not_allowed_here.java' do
      match %r/\s/
    end
  end
  rule 'meta.import.java' do
    content_scope "storage.modifier.import.java"
    from %r/(import)\b\s*/,
      1 => 'keyword.other.import.java'
    to %r/\s*(?:$|(;))/,
      1 => 'punctuation.terminator.java'
    both 2 => 'storage.modifier.import.java',
         3 => 'punctuation.terminator.java'
    rule 'punctuation.separator.java' do
      match %r/\./
    end
    rule 'invalid.illegal.character_not_allowed_here.java' do
      match %r/\s/
    end
  end
  include "#code"

  fragment :"all-types" do
    include "#primitive-arrays"
    include "#primitive-types"
    include "#object-types"
  end

  fragment :annotations do
    rule 'meta.declaration.annotation.java' do
      from %r/(@[^ (]+)(\()/,
        1 => 'storage.type.annotation.java',
        2 => 'punctuation.definition.annotation-arguments.begin.java'
      to %r/(\))/,
        1 => 'punctuation.definition.annotation-arguments.end.java'
      rule do
        match %r/(\w*)\s*(=)/,
          1 => 'constant.other.key.java',
          2 => 'keyword.operator.assignment.java'
      end
      include "#code"
      rule 'punctuation.seperator.property.java' do
        match %r/,/
      end
    end
    rule 'storage.type.annotation.java' do
      match %r/@\w*/
    end
  end

  fragment :"anonymous-classes-and-new" do
    rule do
      from %r/\bnew\b/,
        0 => 'keyword.control.new.java'
      to %r/(?<=\)|\])(?!\s*{)|(?<=})|(?=;)/
      rule do
        from %r/(\w+)\s*(?=\[)/,
          1 => 'storage.type.java'
        to %r/(})|(?=\s*(?:,|;|\)))/,
          1 => 'punctuation.section.block.end.java'
        rule do
          from %r/\[/
          to %r/\]/
          include "#code"
        end
        rule do
          from %r/{/,
            0 => 'punctuation.section.block.begin.java'
          to %r/(?=})/
          include "#code"
        end
      end
      rule do
        from %r/(?=\w.*\()/
        to %r/(?<=\))/
        include "#object-types"
        rule do
          from %r/\(/,
            1 => 'storage.type.java'
          to %r/\)/
          include "#code"
        end
      end
      rule 'meta.inner-class.java' do
        from %r/{/,
          0 => 'punctuation.section.inner-class.begin.java'
        to %r/}/,
          0 => 'punctuation.section.inner-class.end.java'
        include "#class-body"
      end
    end
  end

  fragment :assertions do
    rule 'meta.declaration.assertion.java' do
      from %r/\b(assert)\s/,
        1 => 'keyword.control.assert.java'
      to %r/$/
      rule 'keyword.operator.assert.expression-seperator.java' do
        match %r/:/
      end
      include "#code"
    end
  end

  fragment :class do
    rule 'meta.class.java' do
      from %r/(?=\w?[\w\s]*(?:class|(?:@)?interface|enum)\s+\w+)/
      to %r/}/,
        0 => 'punctuation.section.class.end.java'
      include "#storage-modifiers"
      include "#comments"
      rule 'meta.class.identifier.java' do
        match %r/(class|(?:@)?interface|enum)\s+(\w+)/,
          1 => 'storage.modifier.java',
          2 => 'entity.name.type.class.java'
      end
      rule 'meta.definition.class.inherited.classes.java' do
        from %r/extends/,
          0 => 'storage.modifier.extends.java'
        to %r/(?={|implements)/
        include "#object-types-inherited"
        include "#comments"
      end
      rule 'meta.definition.class.implemented.interfaces.java' do
        from %r/(implements)\s/,
          1 => 'storage.modifier.implements.java'
        to %r/(?=\s*extends|\{)/
        include "#object-types-inherited"
        include "#comments"
      end
      rule 'meta.class.body.java' do
        from %r/{/,
          0 => 'punctuation.section.class.begin.java'
        to %r/(?=})/
        include "#class-body"
      end
    end
  end

  fragment :"class-body" do
    include "#comments"
    include "#class"
    include "#enums"
    include "#variables"
    include "#methods"
    include "#annotations"
    include "#storage-modifiers"
    include "#code"
  end

  fragment :code do
    include "#comments"
    include "#class"
    rule do
      from %r/{/,
        0 => 'punctuation.section.block.begin.java'
      to %r/}/,
        0 => 'punctuation.section.block.end.java'
      include "#code"
    end
    include "#assertions"
    include "#parens"
    include "#constants-and-special-vars"
    include "#anonymous-classes-and-new"
    include "#keywords"
    include "#storage-modifiers"
    include "#method-call"
    include "#strings"
    include "#all-types"
  end

  fragment :comments do
    rule 'comment.block.empty.java' do
      match %r'/\*\*/',
        0 => 'punctuation.definition.comment.java'
    end
    include "text.html.javadoc"
    include "#comments-inline"
  end

  fragment :"comments-inline" do
    rule 'comment.block.java' do
      from %r'/\*'
      to %r'\*/'
      both 0 => 'punctuation.definition.comment.java'
    end
    rule do
      from %r'(^[ \t]+)?(?=//)',
        1 => 'punctuation.whitespace.comment.leading.java'
      to %r/(?!\G)/
      rule 'comment.line.double-slash.java' do
        from %r'//',
          0 => 'punctuation.definition.comment.java'
        to %r/\n/
      end
    end
  end

  fragment :"constants-and-special-vars" do
    rule 'constant.language.java' do
      match %r/\b(true|false|null)\b/
    end
    rule 'variable.language.java' do
      match %r/\b(this|super)\b/
    end
    rule 'constant.numeric.java' do
      match %r/\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)([LlFfUuDd]|UL|ul)?\b/
    end
    rule 'constant.other.java' do
      match %r/(\.)?\b([A-Z][A-Z0-9_]+)(?!<|\.class|\s*\w+\s*=)\b/,
        1 => 'keyword.operator.dereference.java'
    end
  end

  fragment :enums do
    rule do
      from %r/^(?=\s*[A-Z0-9_]+\s*({|\(|,))/
      to %r/(?=;|})/
      rule 'meta.enum.java' do
        from %r/\w+/,
          0 => 'constant.other.enum.java'
        to %r/(?=,|;|})/
        include "#parens"
        rule do
          from %r/{/,
            0 => 'punctuation.section.enum.begin.java'
          to %r/}/,
            0 => 'punctuation.section.enum.end.java'
          include "#class-body"
        end
      end
    end
  end

  fragment :keywords do
    rule 'keyword.control.catch-exception.java' do
      match %r/\b(try|catch|finally|throw)\b/
    end
    rule 'keyword.control.ternary.java' do
      match %r/\?|:/
    end
    rule 'keyword.control.java' do
      match %r/\b(return|break|case|continue|default|do|while|for|switch|if|else)\b/
    end
    rule 'keyword.operator.java' do
      match %r/\b(instanceof)\b/
    end
    rule 'keyword.operator.bitwise.java' do
      match %r/(<<|>>>?|~|\^)/
    end
    rule 'keyword.operator.assignment.bitwise.java' do
      match %r/((&|\^|\||<<|>>>?)=)/
    end
    rule 'keyword.operator.comparison.java' do
      match %r/(===?|!=|<=|>=|<>|<|>)/
    end
    rule 'keyword.operator.assignment.arithmetic.java' do
      match %r'([+*/%-]=)'
    end
    rule 'keyword.operator.assignment.java' do
      match %r/(=)/
    end
    rule 'keyword.operator.increment-decrement.java' do
      match %r/(\-\-|\+\+)/
    end
    rule 'keyword.operator.arithmetic.java' do
      match %r'(\-|\+|\*|\/|%)'
    end
    rule 'keyword.operator.logical.java' do
      match %r/(!|&&|\|\|)/
    end
    rule 'keyword.operator.bitwise.java' do
      match %r/(\||&)/
    end
    rule 'keyword.operator.dereference.java' do
      match %r/(?<=\S)\.(?=\S)/
    end
    rule 'punctuation.terminator.java' do
      match %r/;/
    end
  end

  fragment :"method-call" do
    rule 'meta.method-call.java' do
      from %r/([\w$]+)(\()/,
        1 => 'meta.method.java',
        2 => 'punctuation.definition.method-parameters.begin.java'
      to %r/\)/,
        0 => 'punctuation.definition.method-parameters.end.java'
      rule 'punctuation.definition.seperator.parameter.java' do
        match %r/,/
      end
      include "#code"
    end
  end

  fragment :methods do
    rule 'meta.method.java' do
      from %r'(?!new)(?=[\w<].*\s+)(?=([^=/]|/(?!/))+\()'
      to %r/(})|(?=;)/,
        1 => 'punctuation.section.method.end.java'
      include "#storage-modifiers"
      rule 'meta.method.identifier.java' do
        from %r/(\w+)\s*\(/,
          1 => 'entity.name.function.java'
        to %r/\)/
        include "#parameters"
      end
      rule 'storage.type.token.java' do
        from %r/</
        to %r/>/
        include "#object-types"
        rule 'storage.type.generic.java' do
          # This is just to support <>'s with no actual type prefix
          from %r/</
          to %r/>|[^\w\s,\[\]<]/
        end
      end
      rule 'meta.method.return-type.java' do
        from %r/(?=\w.*\s+\w+\s*\()/
        to %r/(?=\w+\s*\()/
        include "#all-types"
      end
      include "#throws"
      rule 'meta.method.body.java' do
        from %r/{/,
          0 => 'punctuation.section.method.begin.java'
        to %r/(?=})/
        include "#code"
      end
      include "#comments"
    end
  end

  fragment :"object-types" do
    rule 'storage.type.generic.java' do
      from %r/\b((?:[a-z]\w*\.)*[A-Z]+\w*)</
      to %r/>|[^\w\s,\?<\[\]]/
      include "#object-types"
      rule 'storage.type.generic.java' do
        # This is just to support <>'s with no actual type prefix
        from %r/</
        to %r/>|[^\w\s,\[\]<]/
      end
    end
    rule 'storage.type.object.array.java' do
      from %r/\b((?:[a-z]\w*\.)*[A-Z]+\w*)(?=\[)/
      to %r/(?=[^\]\s])/
      rule do
        from %r/\[/
        to %r/\]/
        include "#code"
      end
    end
    rule 'storage.type.java' do
      match %r/\b(?:[a-z]\w*(\.))*[A-Z]+\w*\b/,
        1 => 'keyword.operator.dereference.java'
    end
  end

  fragment :"object-types-inherited" do
    rule 'entity.other.inherited-class.java' do
      from %r/\b((?:[a-z]\w*\.)*[A-Z]+\w*)</
      to %r/>|[^\w\s,<]/
      include "#object-types"
      rule 'storage.type.generic.java' do
        # This is just to support <>'s with no actual type prefix
        from %r/</
        to %r/>|[^\w\s,<]/
      end
    end
    rule 'entity.other.inherited-class.java' do
      match %r/\b(?:[a-z]\w*(\.))*[A-Z]+\w*/,
        1 => 'keyword.operator.dereference.java'
    end
  end

  fragment :parameters do
    rule 'storage.modifier.java' do
      match %r/final/
    end
    include "#annotations"
    include "#primitive-arrays"
    include "#primitive-types"
    include "#object-types"
    rule 'variable.parameter.java' do
      match %r/\w+/
    end
  end

  fragment :parens do
    rule do
      from %r/\(/
      to %r/\)/
      include "#code"
    end
  end

  fragment :"primitive-arrays" do
    rule 'storage.type.primitive.array.java' do
      match %r/\b(?:void|boolean|byte|char|short|int|float|long|double)(\[\])*\b/
    end
  end

  fragment :"primitive-types" do
    rule 'storage.type.primitive.java' do
      match %r/\b(?:void|boolean|byte|char|short|int|float|long|double)\b/
    end
  end

  fragment :"storage-modifiers" do
    rule do
      match %r/\b(public|private|protected|static|final|native|synchronized|abstract|threadsafe|transient)\b/,
        1 => 'storage.modifier.java'
    end
  end

  fragment :strings do
    rule 'string.quoted.double.java' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.java'
      to %r/"/,
        0 => 'punctuation.definition.string.end.java'
      rule 'constant.character.escape.java' do
        match %r/\\./
      end
    end
    rule 'string.quoted.single.java' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.java'
      to %r/'/,
        0 => 'punctuation.definition.string.end.java'
      rule 'constant.character.escape.java' do
        match %r/\\./
      end
    end
  end

  fragment :throws do
    rule 'meta.throwables.java' do
      from %r/throws/,
        0 => 'storage.modifier.java'
      to %r/(?={|;)/
      include "#object-types"
    end
  end

  # FIXME: this fragment is never referenced
  fragment :values do
    include "#strings"
    include "#object-types"
    include "#constants-and-special-vars"
  end

  fragment :variables do
    # FIXME: no "match" nor "begin/end"
    rule do
      rule 'meta.definition.variable.java' do
        # FIXME: (warning) character class has duplicated range
        from %r'(?x:(?=
                        (?:
                            (?:private|protected|public|native|synchronized|abstract|threadsafe|transient|static|final) # visibility/modifier
                                |
                            (?:def)
                                |
                            (?:void|boolean|byte|char|short|int|float|long|double)
                                |
                            (?:(?:[a-z]\w*\.)*[A-Z]+\w*) # object type
                        )
                        \s+
                        (?!private|protected|public|native|synchronized|abstract|threadsafe|transient|static|final|def|void|boolean|byte|char|short|int|float|long|double)
                        [\w\d_<>\[\],\?][\w\d_<>\[\],\? \t]*
                        (?:=|$)
                        
          ))'
        to %r/(?=;)/
        rule do
          match %r/\s/
        end
        rule do
          match %r/([A-Z_0-9]+)\s+(?=\=)/,
            1 => 'constant.variable.java'
        end
        rule do
          match %r/(\w[^\s,]*)\s+(?=\=)/,
            1 => 'meta.definition.variable.name.java'
        end
        rule do
          from %r/=/,
            0 => 'keyword.operator.assignment.java'
          to %r/(?=;)/
          include "#code"
        end
        rule do
          match %r/(\w[^\s=]*)(?=\s*;)/,
            1 => 'meta.definition.variable.name.java'
        end
        include "#code"
      end
    end
  end
end
