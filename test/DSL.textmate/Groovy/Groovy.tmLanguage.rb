# encoding: utf-8

language 'Groovy' => 'source.groovy' do
  file_types %w(groovy gvy)
  folding_start_marker %r'(\{\s*$|^\s*// \{\{\{)'
  folding_stop_marker %r'^\s*(\}|// \}\}\}$)'
  key_equivalent "^~G"  # TextMate only
  uuid "B3A64888-EBBB-4436-8D9E-F1169C5D7613"  # TextMate only

  rule 'comment.line.hashbang.groovy' do
    match %r/^(#!).+$\n/,
      1 => 'punctuation.definition.comment.groovy'
  end
  rule 'meta.package.groovy' do
    match %r/^\s*(package)\b(?:\s*([^ ;$]+)\s*(;)?)?/,
      1 => 'keyword.other.package.groovy',
      2 => 'storage.modifier.package.groovy',
      3 => 'punctuation.terminator.groovy'
  end
  rule 'meta.import.groovy' do
    content_scope "storage.modifier.import.groovy"
    from %r/(import static)\b\s*/,
      1 => 'keyword.other.import.static.groovy'
    to %r/\s*(?:$|(?=%>)(;))/,
      1 => 'punctuation.terminator.groovy'
    both 2 => 'storage.modifier.import.groovy',
         3 => 'punctuation.terminator.groovy'
    rule 'punctuation.separator.groovy' do
      match %r/\./
    end
    rule 'invalid.illegal.character_not_allowed_here.groovy' do
      match %r/\s/
    end
  end
  rule 'meta.import.groovy' do
    content_scope "storage.modifier.import.groovy"
    from %r/(import)\b\s*/,
      1 => 'keyword.other.import.groovy'
    to %r/\s*(?:$|(?=%>)|(;))/,
      1 => 'punctuation.terminator.groovy'
    both 2 => 'storage.modifier.import.groovy',
         3 => 'punctuation.terminator.groovy'
    rule 'punctuation.separator.groovy' do
      match %r/\./
    end
    rule 'invalid.illegal.character_not_allowed_here.groovy' do
      match %r/\s/
    end
  end
  rule 'meta.import.groovy' do
    match %r/^\s*(import)(?:\s+(static)\s+)\b(?:\s*([^ ;$]+)\s*(;)?)?/,
      1 => 'keyword.other.import.groovy',
      2 => 'keyword.other.import.static.groovy',
      3 => 'storage.modifier.import.groovy',
      4 => 'punctuation.terminator.groovy'
  end
  include "#groovy"

  fragment :annotations do
    rule 'meta.declaration.annotation.groovy' do
      from %r/(?<!\.)(@[^ (]+)(\()/,
        1 => 'storage.type.annotation.groovy',
        2 => 'punctuation.definition.annotation-arguments.begin.groovy'
      to %r/(\))/,
        1 => 'punctuation.definition.annotation-arguments.end.groovy'
      rule do
        match %r/(\w*)\s*(=)/,
          1 => 'constant.other.key.groovy',
          2 => 'keyword.operator.assignment.groovy'
      end
      include "#values"
      rule 'punctuation.definition.seperator.groovy' do
        match %r/,/
      end
    end
    rule 'storage.type.annotation.groovy' do
      match %r/(?<!\.)@\S+/
    end
  end

  fragment :"anonymous-classes-and-new" do
    rule do
      from %r/\bnew\b/,
        0 => 'keyword.control.new.groovy'
      to %r/(?<=\)|\])(?!\s*{)|(?<=})|(?=[;])|$/
      rule do
        from %r/(\w+)\s*(?=\[)/,
          1 => 'storage.type.groovy'
        to %r/}|(?=\s*(?:,|;|\)))|$/
        rule do
          from %r/\[/
          to %r/\]/
          include "#groovy"
        end
        rule do
          from %r/{/
          to %r/(?=})/
          include "#groovy"
        end
      end
      rule do
        from %r/(?=\w.*\(?)/
        to %r/(?<=\))|$/
        include "#object-types"
        rule do
          from %r/\(/,
            1 => 'storage.type.groovy'
          to %r/\)/
          include "#groovy"
        end
      end
      rule 'meta.inner-class.groovy' do
        from %r/{/
        to %r/}/
        include "#class-body"
      end
    end
  end

  fragment :braces do
    rule do
      from %r/\{/
      to %r/\}/
      include "#groovy-code"
    end
  end

  fragment :class do
    rule 'meta.definition.class.groovy' do
      from %r/(?=\w?[\w\s]*(?:class|(?:@)?interface|enum)\s+\w+)/
      to %r/}/,
        0 => 'punctuation.section.class.end.groovy'
      include "#storage-modifiers"
      include "#comments"
      rule 'meta.class.identifier.groovy' do
        match %r/(class|(?:@)?interface|enum)\s+(\w+)/,
          1 => 'storage.modifier.groovy',
          2 => 'entity.name.type.class.groovy'
      end
      rule 'meta.definition.class.inherited.classes.groovy' do
        from %r/extends/,
          0 => 'storage.modifier.extends.groovy'
        to %r/(?={|implements)/
        include "#object-types-inherited"
        include "#comments"
      end
      rule 'meta.definition.class.implemented.interfaces.groovy' do
        from %r/(implements)\s/,
          1 => 'storage.modifier.implements.groovy'
        to %r/(?=\s*extends|\{)/
        include "#object-types-inherited"
        include "#comments"
      end
      rule 'meta.class.body.groovy' do
        from %r/{/
        to %r/(?=})/
        include "#class-body"
      end
    end
  end

  fragment :"class-body" do
    include "#enum-values"
    include "#constructors"
    include "#groovy"
  end

  fragment :closures do
    rule do
      from %r/\{(?=.*?->)/
      to %r/\}/
      rule do
        from %r/(?<=\{)(?=[^\}]*?->)/
        to %r/->/,
          0 => 'keyword.operator.groovy'
        rule 'meta.closure.parameters.groovy' do
          from %r/(?!->)/
          to %r/(?=->)/
          rule 'meta.closure.parameter.groovy' do
            from %r/(?!,|->)/
            to %r/(?=,|->)/
            rule 'meta.parameter.default.groovy' do
              from %r/=/,
                0 => 'keyword.operator.assignment.groovy'
              to %r/(?=,|->)/
              include "#groovy-code"
            end
            include "#parameters"
          end
        end
      end
      rule do
        from %r/(?=[^}])/
        to %r/(?=\})/
        include "#groovy-code"
      end
    end
  end

  fragment :"comment-block" do
    rule 'comment.block.groovy' do
      from %r'/\*'
      to %r'\*/'
      both 0 => 'punctuation.definition.comment.groovy'
    end
  end

  fragment :comments do
    rule 'comment.block.empty.groovy' do
      match %r'/\*\*/',
        0 => 'punctuation.definition.comment.groovy'
    end
    include "text.html.javadoc"
    include "#comment-block"
    rule 'comment.line.double-slash.groovy' do
      match %r'(//).*$\n?',
        1 => 'punctuation.definition.comment.groovy'
    end
  end

  fragment :constants do
    rule 'constant.other.groovy' do
      match %r/\b([A-Z][A-Z0-9_]+)\b/
    end
    rule 'constant.language.groovy' do
      match %r/\b(true|false|null)\b/
    end
  end

  fragment :constructors do
    rule do
      from %r/(?<=;|^)(?=\s*(?:(?:private|protected|public|native|synchronized|abstract|threadsafe|transient|static|final)\s+)*[A-Z]\w*\()/
      to %r/}/
      to_last true
      include "#method-content"
    end
  end

  fragment :"enum-values" do
    rule do
      from %r/(?<=;|^)\s*\b([A-Z0-9_]+)(?=\s*(?:,|;|}|\(|$))/,
        1 => 'constant.enum.name.groovy'
      to %r/,|;|(?=})|^(?!\s*\w+\s*(?:,|$))/
      rule 'meta.enum.value.groovy' do
        from %r/\(/
        to %r/\)/
        rule 'punctuation.definition.seperator.parameter.groovy' do
          match %r/,/
        end
        include "#groovy-code"
      end
    end
  end

  fragment :groovy do
    include "#comments"
    include "#class"
    include "#variables"
    include "#methods"
    include "#annotations"
    include "#groovy-code"
  end

  fragment :"groovy-code" do
    include "#groovy-code-minus-map-keys"
    include "#map-keys"
  end

  fragment :"groovy-code-minus-map-keys" do
    # In some situations, maps can't be declared without enclosing []'s,
    #         therefore we create a collection of everything but that
    include "#comments"
    include "#annotations"
    include "#support-functions"
    include "#keyword-language"
    include "#values"
    include "#anonymous-classes-and-new"
    include "#keyword-operator"
    include "#types"
    include "#storage-modifiers"
    include "#parens"
    include "#closures"
    include "#braces"
  end

  # FIXME: this fragment is never referenced
  fragment :keyword do
    include "#keyword-operator"
    include "#keyword-language"
  end

  fragment :"keyword-language" do
    rule 'keyword.control.exception.groovy' do
      match %r/\b(try|catch|finally|throw)\b/
    end
    rule 'keyword.control.groovy' do
      match %r/\b((?<!\.)(?:return|break|continue|default|do|while|for|switch|if|else))\b/
    end
    rule 'meta.case.groovy' do
      from %r/\bcase\b/,
        0 => 'keyword.control.groovy'
      to %r/:/,
        0 => 'punctuation.definition.case-terminator.groovy'
      include "#groovy-code-minus-map-keys"
    end
    rule 'meta.declaration.assertion.groovy' do
      from %r/\b(assert)\s/,
        1 => 'keyword.control.assert.groovy'
      to %r/$|;|}/
      rule 'keyword.operator.assert.expression-seperator.groovy' do
        match %r/:/
      end
      include "#groovy-code-minus-map-keys"
    end
    rule 'keyword.other.throws.groovy' do
      match %r/\b(throws)\b/
    end
  end

  fragment :"keyword-operator" do
    rule 'keyword.operator.as.groovy' do
      match %r/\b(as)\b/
    end
    rule 'keyword.operator.in.groovy' do
      match %r/\b(in)\b/
    end
    rule 'keyword.operator.elvis.groovy' do
      match %r/\?\:/
    end
    rule 'keyword.operator.spreadmap.groovy' do
      match %r/\*\:/
    end
    rule 'keyword.operator.range.groovy' do
      match %r/\.\./
    end
    rule 'keyword.operator.arrow.groovy' do
      match %r/\->/
    end
    rule 'keyword.operator.leftshift.groovy' do
      match %r/<</
    end
    rule 'keyword.operator.navigation.groovy' do
      match %r/(?<=\S)\.(?=\S)/
    end
    rule 'keyword.operator.safe-navigation.groovy' do
      match %r/(?<=\S)\?\.(?=\S)/
    end
    rule 'meta.evaluation.ternary.groovy' do
      from %r/\?/,
        0 => 'keyword.operator.ternary.groovy'
      # FIXME: (warning) regular expression has ']' without escape
      to %r/(?=$|\)|}|])/
      rule 'keyword.operator.ternary.expression-seperator.groovy' do
        match %r/:/
      end
      include "#groovy-code-minus-map-keys"
    end
    rule 'keyword.operator.match.groovy' do
      match %r/==~/
    end
    rule 'keyword.operator.find.groovy' do
      match %r/=~/
    end
    rule 'keyword.operator.instanceof.groovy' do
      match %r/\b(instanceof)\b/
    end
    rule 'keyword.operator.comparison.groovy' do
      match %r/(===|==|!=|<=|>=|<=>|<>|<|>|<<)/
    end
    rule 'keyword.operator.assignment.groovy' do
      match %r/=/
    end
    rule 'keyword.operator.increment-decrement.groovy' do
      match %r/(\-\-|\+\+)/
    end
    rule 'keyword.operator.arithmetic.groovy' do
      match %r'(\-|\+|\*|\/|%)'
    end
    rule 'keyword.operator.logical.groovy' do
      match %r/(!|&&|\|\|)/
    end
  end

  fragment :"language-variables" do
    rule 'variable.language.groovy' do
      match %r/\b(this|super)\b/
    end
  end

  fragment :"map-keys" do
    rule do
      match %r/(\w+)\s*(:)/,
        1 => 'constant.other.key.groovy',
        2 => 'punctuation.definition.seperator.key-value.groovy'
    end
  end

  fragment :"method-call" do
    rule 'meta.method-call.groovy' do
      from %r/([\w$]+)(\()/,
        1 => 'meta.method.groovy',
        2 => 'punctuation.definition.method-parameters.begin.groovy'
      to %r/\)/,
        0 => 'punctuation.definition.method-parameters.end.groovy'
      rule 'punctuation.definition.seperator.parameter.groovy' do
        match %r/,/
      end
      include "#groovy-code"
    end
  end

  fragment :"method-content" do
    rule do
      match %r/\s/
    end
    include "#annotations"
    rule 'meta.method.return-type.java' do
      from %r/(?=(?:\w|<)[^\(]*\s+(?:[\w$]|<)+\s*\()/
      to %r/(?=[\w$]+\s*\()/
      include "#storage-modifiers"
      include "#types"
    end
    rule 'meta.definition.method.signature.java' do
      from %r/([\w$]+)\s*\(/,
        1 => 'entity.name.function.java'
      to %r/\)/
      rule 'meta.method.parameters.groovy' do
        from %r/(?=[^)])/
        to %r/(?=\))/
        rule 'meta.method.parameter.groovy' do
          from %r/(?=[^,)])/
          to %r/(?=,|\))/
          rule 'punctuation.definition.separator.groovy' do
            match %r/,/
          end
          rule 'meta.parameter.default.groovy' do
            from %r/=/,
              0 => 'keyword.operator.assignment.groovy'
            to %r/(?=,|\))/
            include "#groovy-code"
          end
          include "#parameters"
        end
      end
    end
    rule 'meta.method.paramerised-type.groovy' do
      from %r/(?=<)/
      to %r/(?=\s)/
      rule 'storage.type.parameters.groovy' do
        from %r/</
        to %r/>/
        include "#types"
        rule 'punctuation.definition.seperator.groovy' do
          match %r/,/
        end
      end
    end
    rule 'meta.throwables.groovy' do
      from %r/throws/,
        0 => 'storage.modifier.groovy'
      to %r/(?={|;)|^(?=\s*(?:[^{\s]|$))/
      include "#object-types"
    end
    rule 'meta.method.body.java' do
      from %r/{/
      to %r/(?=})/
      include "#groovy-code"
    end
  end

  fragment :methods do
    rule 'meta.definition.method.groovy' do
      from %r'(?x:(?<=;|^|{)(?=\s*
                (?:
                    (?:private|protected|public|native|synchronized|abstract|threadsafe|transient|static|final) # visibility/modifier
                        |
                    (?:def)
                        |
                    (?:
                        (?:
                            (?:void|boolean|byte|char|short|int|float|long|double)
                                |
                            (?:@?(?:[a-zA-Z]\w*\.)*[A-Z]+\w*) # object type
                        )
                        [\[\]]*
                        (?:<.*>)?
                    ) 
                    
                )
                \s+
                ([^=]+\s+)?\w+\s*\(
      ))'
      to %r/}|(?=[^{])/
      to_last true
      include "#method-content"
    end
  end

  fragment :nest_curly do
    rule do
      from %r/\{/
      to %r/\}/
      both 0 => 'punctuation.section.scope.groovy'
      include "#nest_curly"
    end
  end

  fragment :numbers do
    rule 'constant.numeric.groovy' do
      match %r/((0(x|X)[0-9a-fA-F]*)|(\+|-)?\b(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)([LlFfUuDdg]|UL|ul)?\b/
    end
  end

  fragment :"object-types" do
    rule 'storage.type.generic.groovy' do
      from %r/\b((?:[a-z]\w*\.)*(?:[A-Z]+\w*[a-z]+\w*|UR[LI]))</
      to %r/>|[^\w\s,\?<\[\]]/
      include "#object-types"
      rule 'storage.type.generic.groovy' do
        # This is just to support <>'s with no actual type prefix
        from %r/</
        to %r/>|[^\w\s,\[\]<]/
      end
    end
    rule 'storage.type.object.array.groovy' do
      from %r/\b((?:[a-z]\w*\.)*[A-Z]+\w*[a-z]+\w*)(?=\[)/
      to %r/(?=[^\]\s])/
      rule do
        from %r/\[/
        to %r/\]/
        include "#groovy"
      end
    end
    rule 'storage.type.groovy' do
      match %r/\b(?:[a-zA-Z]\w*\.)*(?:[A-Z]+\w*[a-z]+\w*|UR[LI])\b/
    end
  end

  fragment :"object-types-inherited" do
    rule 'entity.other.inherited-class.groovy' do
      from %r/\b((?:[a-zA-Z]\w*\.)*[A-Z]+\w*[a-z]+\w*)</
      to %r/>|[^\w\s,\?<\[\]]/
      include "#object-types-inherited"
      rule 'storage.type.generic.groovy' do
        # This is just to support <>'s with no actual type prefix
        from %r/</
        to %r/>|[^\w\s,\[\]<]/
      end
    end
    rule 'entity.other.inherited-class.groovy' do
      match %r/\b(?:[a-zA-Z]\w*(\.))*[A-Z]+\w*[a-z]+\w*\b/,
        1 => 'keyword.operator.dereference.groovy'
    end
  end

  fragment :parameters do
    include "#annotations"
    include "#storage-modifiers"
    include "#types"
    rule 'variable.parameter.method.groovy' do
      match %r/\w+/
    end
  end

  fragment :parens do
    rule do
      from %r/\(/
      to %r/\)/
      include "#groovy-code"
    end
  end

  fragment :"primitive-arrays" do
    rule 'storage.type.primitive.array.groovy' do
      match %r/\b(?:void|boolean|byte|char|short|int|float|long|double)(\[\])*\b/
    end
  end

  fragment :"primitive-types" do
    rule 'storage.type.primitive.groovy' do
      match %r/\b(?:void|boolean|byte|char|short|int|float|long|double)\b/
    end
  end

  fragment :regexp do
    rule 'string.regexp.groovy' do
      from %r'/(?=[^/]+/([^>]|$))',
        0 => 'punctuation.definition.string.regexp.begin.groovy'
      to %r'/',
        0 => 'punctuation.definition.string.regexp.end.groovy'
      rule 'constant.character.escape.groovy' do
        match %r/\\./
      end
    end
    rule 'string.regexp.compiled.groovy' do
      from %r/~"/,
        0 => 'punctuation.definition.string.regexp.begin.groovy'
      to %r/"/,
        0 => 'punctuation.definition.string.regexp.end.groovy'
      rule 'constant.character.escape.groovy' do
        match %r/\\./
      end
    end
  end

  fragment :"storage-modifiers" do
    rule 'storage.modifier.access-control.groovy' do
      match %r/\b(private|protected|public)\b/
    end
    rule 'storage.modifier.static.groovy' do
      match %r/\b(static)\b/
    end
    rule 'storage.modifier.final.groovy' do
      match %r/\b(final)\b/
    end
    rule 'storage.modifier.other.groovy' do
      match %r/\b(native|synchronized|abstract|threadsafe|transient)\b/
    end
  end

  fragment :"string-quoted-double" do
    rule 'string.quoted.double.groovy' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.groovy'
      to %r/"/,
        0 => 'punctuation.definition.string.end.groovy'
      include "#string-quoted-double-contents"
    end
  end

  fragment :"string-quoted-double-contents" do
    rule 'constant.character.escape.groovy' do
      match %r/\\./
    end
    rule 'variable.other.interpolated.groovy' do
      from %r/\$\w/
      to %r/(?=\W)/
      to_last true
      rule 'variable.other.interpolated.groovy' do
        match %r/\w/
      end
      rule 'keyword.other.dereference.groovy' do
        match %r/\./
      end
    end
    rule 'source.groovy.embedded.source' do
      from %r/\$\{/
      to %r/\}/
      both 0 => 'punctuation.section.embedded.groovy'
      include "#nest_curly"
    end
  end

  fragment :"string-quoted-double-multiline" do
    rule 'string.quoted.double.multiline.groovy' do
      from %r/"""/,
        0 => 'punctuation.definition.string.begin.groovy'
      to %r/"""/,
        0 => 'punctuation.definition.string.end.groovy'
      include "#string-quoted-double-contents"
    end
  end

  fragment :"string-quoted-single" do
    rule 'string.quoted.single.groovy' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.groovy'
      to %r/'/,
        0 => 'punctuation.definition.string.end.groovy'
      include "#string-quoted-single-contents"
    end
  end

  fragment :"string-quoted-single-contents" do
    rule 'constant.character.escape.groovy' do
      match %r/\\./
    end
  end

  fragment :"string-quoted-single-multiline" do
    rule 'string.quoted.single.multiline.groovy' do
      from %r/'''/,
        0 => 'punctuation.definition.string.begin.groovy'
      to %r/'''/,
        0 => 'punctuation.definition.string.end.groovy'
      include "#string-quoted-single-contents"
    end
  end

  fragment :strings do
    include "#string-quoted-double-multiline"
    include "#string-quoted-single-multiline"
    include "#string-quoted-double"
    include "#string-quoted-single"
    include "#regexp"
  end

  fragment :structures do
    rule 'meta.structure.groovy' do
      from %r/\[/,
        0 => 'punctuation.definition.structure.begin.groovy'
      to %r/\]/,
        0 => 'punctuation.definition.structure.end.groovy'
      include "#groovy-code"
      rule 'punctuation.definition.separator.groovy' do
        match %r/,/
      end
    end
  end

  fragment :"support-functions" do
    rule 'support.function.print.groovy' do
      match %r/(?x)\b(?:sprintf|print(?:f|ln)?)\b/
    end
    rule 'support.function.testing.groovy' do
      match %r/(?x)\b(?:shouldFail|fail(?:NotEquals)?|ass(?:ume|ert(?:S(?:cript|ame)|N(?:ot(?:Same|
          Null)|ull)|Contains|T(?:hat|oString|rue)|Inspect|Equals|False|Length|
          ArrayEquals)))\b/
    end
  end

  fragment :types do
    rule 'storage.type.def.groovy' do
      match %r/\b(def)\b/
    end
    include "#primitive-types"
    include "#primitive-arrays"
    include "#object-types"
  end

  fragment :values do
    include "#language-variables"
    include "#strings"
    include "#numbers"
    include "#constants"
    include "#types"
    include "#structures"
    include "#method-call"
  end

  fragment :variables do
    # FIXME: no "match" nor "begin/end"
    rule do
      rule 'meta.definition.variable.groovy' do
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
                        [\w\d_<>\[\],\s]+
                        (?:=|$)
                        
              ))'
        to %r/;|$/
        rule do
          match %r/\s/
        end
        rule do
          match %r/([A-Z_0-9]+)\s+(?=\=)/,
            1 => 'constant.variable.groovy'
        end
        rule do
          match %r/(\w[^\s,]*)\s+(?=\=)/,
            1 => 'meta.definition.variable.name.groovy'
        end
        rule do
          from %r/=/,
            0 => 'keyword.operator.assignment.groovy'
          to %r/$/
          include "#groovy-code"
        end
        rule do
          match %r/(\w[^\s=]*)(?=\s*($|;))/,
            1 => 'meta.definition.variable.name.groovy'
        end
        include "#groovy-code"
      end
    end
  end
end
