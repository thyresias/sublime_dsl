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
    match %r/^\s*(package)\s+([^ ;]+)/,
      1 => 'keyword.other.package.groovy',
      2 => 'storage.type.package.groovy'
  end
  rule 'meta.import.groovy' do
    match %r/^\s*(import)\s+([^ ;$]+);?/,
      1 => 'keyword.other.import.groovy',
      2 => 'storage.type.import.groovy'
  end
  include "#groovy"

  fragment :"class-object" do
    rule 'storage.type.class.groovy' do
      match %r/(?x)
              \b(
                (?:[a-z]\w*\.)* # Optional package specification
                [A-Z]\w+\b # Class name
                (?:<(?:[\w, ]*)>)? # Optional Generics
                (?:\[\s*\])* # Optional brackets (array)
              )\b
          /
    end
  end

  fragment :classes do
    rule 'meta.definition.class.groovy' do
      from %r/(?x)^\s*
          (?:(?:\b(?:(public|private|protected)|(static)|(final)|(native|synchronized|abstract|threadsafe|transient))\b\s*)*) # modifier
          (class)\s+
          (\w+)\s* # identifier/
      to %r/$/
      both 1 => 'storage.modifier.access-control.groovy',
           2 => 'storage.modifier.static.groovy',
           3 => 'storage.modifier.final.groovy',
           4 => 'storage.modifier.other.groovy',
           5 => 'storage.type.class.groovy',
           6 => 'entity.name.type.class.groovy'
      rule 'meta.definition.class.inherited.classes.groovy' do
        match %r/(extends)\s+([a-zA-Z0-9_\.]+(?:<(?:[a-zA-Z0-9_, ])+>)?)\s*/,
          1 => 'storage.modifier.extends.groovy',
          2 => 'entity.other.inherited-class.groovy'
      end
      rule 'meta.definition.class.implemented.interfaces.groovy' do
        from %r/(implements)\s/,
          1 => 'storage.modifier.implements.groovy'
        to %r/(?=\s*extends|$|\{)/
        rule do
          match %r/((?:[a-z]\w*.)*[A-Z]\w*)\s*(?:(,)|$|\{)/,
            1 => 'entity.other.inherited-class.interface.groovy',
            2 => 'punctuation.definition.implemented.interfaces.separator.groovy'
        end
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

  fragment :groovy do
    include "#classes"
    include "#methods"
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
    include "#support-functions"
    include "#keyword-language"
    include "#values"
    include "#keyword-operator"
    include "#storage-types"
    include "#storage-modifiers"
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
      match %r/\b(return|break|continue|default|do|while|for|switch|if|else)\b/
    end
    rule 'meta.case.groovy' do
      from %r/\bcase\b/,
        0 => 'keyword.control.groovy'
      to %r/:/,
        0 => 'punctuation.definition.case-terminator.groovy'
      include "#groovy-code-minus-map-keys"
    end
    rule 'keyword.other.new.groovy' do
      match %r/\b(new)\b/
    end
    rule 'meta.declaration.assertion.groovy' do
      from %r/\b(assert)\s/,
        1 => 'keyword.control.assert.groovy'
      to %r/$/
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
    rule 'keyword.operator.is.groovy' do
      match %r/\b(is)\b/
    end
    rule 'keyword.operator.elvis.groovy' do
      match %r/\?\:/
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
      to %r/$/
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

  fragment :"map-keys" do
    rule do
      match %r/(\w+)\s*(:)/,
        1 => 'constant.other.key.groovy',
        2 => 'punctuation.definition.seperator.key-value.groovy'
    end
  end

  fragment :"method-call" do
    rule 'meta.method-call.groovy' do
      from %r/(\w+)(\()/,
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

  fragment :"method-declaration-remainder" do
    rule do
      content_scope "meta.definition.method.parameters.groovy"
      from %r/\(/,
        0 => 'punctuation.definition.parameters.begin.groovy'
      to %r/\)/,
        0 => 'punctuation.definition.parameters.end.groovy'
      rule 'meta.definition.method.parameter.groovy' do
        match %r/(?x)\s*
                (
                  (?:boolean|byte|char|short|int|float|long|double|(?:\w+\.)*[A-Z]\w*\b(?:<(?:[\w, ]*)>)?(?:\[\s*\])*)
                )?
                \s*
                ([a-z_][A-Za-z0-9_]*) # variable
              /,
          1 => 'storage.type.parameter.groovy',
          2 => 'variable.parameter.groovy'
      end
      rule 'meta.definition.method.parameter.groovy' do
        match %r/(boolean|byte|char|short|int|float|long|double|(?:\w+\.)*[A-Z]\w*\b(?:<(?:[\w, ]*)>)?(?:\[\s*\])*)/,
          1 => 'storage.type.parameter.groovy'
      end
      rule 'punctuation.definition.parameters.seperator.groovy' do
        match %r/,/
      end
      include "#comment-block"
    end
    rule 'meta.definition.method.throwables.groovy' do
      from %r/(?<=\))\s*(throws)\s/
      to %r/(?=$|\{)/
      both 1 => 'storage.modifier.throws.groovy'
      rule do
        match %r/((?:[a-z]\w*.)*[A-Z]\w*)\s*(?:(,)|$|\{)/,
          1 => 'storage.type.throwable.groovy',
          2 => 'punctuation.definition.throwables.seperator.groovy'
      end
    end
  end

  fragment :methods do
    rule 'meta.definition.constructor.groovy' do
      from %r'(?x)^\s*
            (?: # zero or more modifiers
              (?:
                (public|private|protected)|(final)|(native|synchronized|abstract|threadsafe|transient)
              )
              \s+
            )?
            \s*  
            ([A-Z](?:[a-zA-Z0-9_])+) # constructor/class name
            \s* 
            (?=\()
          ',
        1 => 'storage.modifier.access-control.groovy',
        2 => 'storage.modifier.final.groovy',
        3 => 'storage.modifier.other.groovy',
        4 => 'entity.name.function.constructor.groovy',
        5 => 'punctuation.definition.parameters.begin.groovy'
      to %r/{|$\n?/
      include "#method-declaration-remainder"
    end
    rule 'meta.definition.method.groovy' do
      from %r/(?x)^\s*
            (?:
              (?: # or modifier and optional type
                (?:(?:\b(public|private|protected)|(static)|(final)|(native|synchronized|abstract|threadsafe|transient))\b\s+)+\s* # modifier
                (?:\b 
                  (void)
                  |
                  (boolean|byte|char|short|int|float|long|double) # primitive
                  |
                  ( # or class type
                    (?:\w+\.)*[A-Z]\w+\b # Class name
                    (?:<(?:[\w, ]*)>)? # optional Generic type
                    (?:\[\s*\])* # zero or more square brackets (array)
                  )
                )?
              )
              |
              (?:\b # or type by itself
                (def)
                |
                (void)
                |
                (boolean|byte|char|short|int|float|long|double) # primitive
                |
                ( # or class type
                  (?:\w+\.)*[A-Z]\w+\b # Class name
                  (?:<(?:[\w, ]*)>)? # optional generics info
                  (?:\[\s*\])* # zero or more square brackets (array)
                )
              )
            )
            \s*
            (\w+) # method name
            \s* 
            (?=\() # opening parens 
          /,
        1 => 'storage.modifier.access-control.groovy',
        2 => 'storage.modifier.static.groovy',
        3 => 'storage.modifier.final.groovy',
        4 => 'storage.modifier.other.groovy',
        5 => 'storage.type.return-type.void.groovy',
        6 => 'storage.type.return-type.primitive.groovy',
        7 => 'storage.type.return-type.class.groovy',
        8 => 'storage.type.return-type.def.groovy',
        9 => 'storage.type.return-type.void.groovy',
        10 => 'storage.type.return-type.primitive.groovy',
        11 => 'storage.type.return-type.class.groovy',
        12 => 'entity.name.function.groovy'
      to %r/{|$\n?/
      include "#method-declaration-remainder"
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
      match %r/((0(x|X)[0-9a-fA-F]*)|(\+|-)?\b(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)([LlFfUuDd]|UL|ul)?\b/
    end
  end

  fragment :regexp do
    rule 'string.regexp.groovy' do
      from %r'/(?=[^/]+/)',
        0 => 'punctuation.definition.string.regexp.begin.groovy'
      to %r'/',
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

  fragment :"storage-types" do
    rule 'meta.declaration.annotation.groovy' do
      from %r/(@[^ (]+)(\()/,
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
      match %r/@\S+/
    end
    rule 'storage.type.def.groovy' do
      match %r/\b(def)\b/
    end
    rule 'storage.type.primitive.groovy' do
      match %r/\b(boolean|byte|char|short|int|float|long|double)(?:\[\s*\])*\b/
    end
  end

  fragment :"string-quoted-double" do
    rule 'string.quoted.double.groovy' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.groovy'
      to %r/"/,
        0 => 'punctuation.definition.string.end.groovy'
      rule 'constant.character.escape.groovy' do
        match %r/\\./
      end
      rule 'variable.other.interpolated.groovy' do
        match %r/\$\w+/
      end
      rule 'source.groovy.embedded.source' do
        from %r/\$\{/
        to %r/\}/
        both 0 => 'punctuation.section.embedded.groovy'
        include "#nest_curly"
      end
    end
  end

  fragment :"string-quoted-single" do
    rule 'string.quoted.single.groovy' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.groovy'
      to %r/'/,
        0 => 'punctuation.definition.string.end.groovy'
      rule 'constant.character.escape.groovy' do
        match %r/\\./
      end
    end
  end

  fragment :strings do
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
    rule 'support.function.other.groovy' do
      match %r/(?x)\b(?:sleep|inspect|dump|use|with)\b/
    end
  end

  fragment :values do
    include "#variables"
    include "#strings"
    include "#numbers"
    include "#constants"
    include "#class-object"
    include "#structures"
    include "#method-call"
  end

  fragment :variables do
    rule 'variable.language.groovy' do
      match %r/\b(this|super)\b/
    end
  end
end
