# encoding: utf-8

language 'Clojure' => 'source.clojure' do
  # Symbol pattern : [a-zA-Z+!\-_?0-9*~#@'`/.$=]
  file_types %w(clj)
  folding_start_marker %r/(?x)^ [ \t]* \(
    (?<par>
      ( [^()\n]++ | \( \g<par> \)? )*+
    )
  $/
  folding_stop_marker %r/^\s*$/
  key_equivalent "^~C"  # TextMate only
  uuid "6A87759F-F746-4E84-B788-965B46363202"  # TextMate only

  include "#comment"
  include "#function"
  include "#function_multi_method"
  include "#macro"
  include "#namespace"
  include "#sexpr"

  fragment :all do
    include "#function"
    include "#function_multi_method"
    include "#lambda"
    include "#macro"
    include "#comment"
    include "#expr"
    include "#sexpr"
  end

  fragment :binding do
    # consume bindings to the end, dual recursive with binding_exp
    include "#comment"
    include "#metadata"
    rule 'meta.structure.binding.vector.clojure' do
      from %r/\[/,
        0 => 'punctuation.definition.vector.begin.clojure'
      to %r/(?=\])/
      rule 'meta.parameters.vector.clojure' do
        # TODO: merge with parameters ??
        from %r/(?<=\[)/
        to %r/\]/,
          0 => 'punctuation.definition.vector.end.clojure'
        include "#comment"
        include "#metadata"
        include "#parameters_variable"
        rule 'keyword.operator.varargs.clojure' do
          match %r/\&/
        end
        rule 'keyword.operator.symbolargs.clojure' do
          # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
          match %r/(:as)(?![a-zA-Z+!\-_?0-9*~#@'`\/.$=])/
        end
        include "#parameters"
        include "#parameters_map"
        include "#all"
      end
      include "#binding_exp"
    end
    rule 'meta.structure.binding.map.clojure' do
      from %r/\{/,
        0 => 'punctuation.definition.map.begin.clojure'
      to %r/(?=\])/
      rule 'meta.function.parameters.map.clojure' do
        # TODO: merge with map ??
        from %r/(?<=\{)/
        to %r/\}/,
          0 => 'punctuation.definition.map.end.clojure'
        include "#comment"
        include "#metadata"
        include "#parameters_variable"
        rule 'keyword.operator.symbolargs.clojure' do
          # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
          match %r/(:as|:or|:keys|:strs|:syms)(?![a-zA-Z+!\-_?0-9*~#@'`\/.$=])/
        end
        include "#parameters"
        include "#parameters_map"
        include "#all"
      end
      include "#binding_exp"
    end
    rule 'meta.structure.binding.symbolargs.clojure' do
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      from %r/(:let|:when|:while)(?![a-zA-Z+!\-_?0-9*~#@'`\/.$=])/,
        1 => 'keyword.operator.symbolargs.clojure'
      to %r/(?=\])/
      include "#binding_exp"
    end
    rule 'meta.structure.binding.symbole.clojure' do
      # symbol matching
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      from %r:(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]):
      to %r/(?=\])/
      rule 'variable.parameter.clojure' do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        from %r:(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        to %r:(?<=[a-zA-Z+!\-_?0-9*~#@'`/.$=])(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        include "#keyword"
        include "#operator"
        include "#number"
        include "#symbol"
      end
      rule do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        from %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        to %r/(?=\])/
        include "#binding_exp"
      end
    end
    rule 'invalid.illegal.bindings.clojure' do
      from %r/[^\s]/
      to %r/[^\]]/
    end
  end

  fragment :binding_exp do
    # consume bindings to the end, dual recursive with binding
    include "#comment"
    include "#metadata"
    include "#operator_special"
    rule 'meta.structure.binding_exp.constant.language.clojure' do
      # FIXME: (error) '#{' will be interpreted as interpolation: escape '#' as '\#'
      from %r/(\(\)|{}|\[\]|#{})/,
        1 => 'constant.language.clojure'
      to %r/(?=\])/
      include "#binding"
    end
    rule 'meta.structure.binding_exp.sexp.clojure' do
      from %r/(?=#?\()/
      to %r/(?=\])/
      rule do
        from %r/(?=#?\()/
        to %r/(?<=\))/
        include "#function"
        include "#function_multi_method"
        include "#lambda"
        include "#macro"
        include "#sexpr"
      end
      include "#binding"
    end
    rule 'meta.structure.binding_exp.vector.clojure' do
      from %r/(\[)/
      to %r/(?=\])/
      rule 'meta.expression.vector.clojure' do
        # TODO: merge with vector
        from %r/(?<=\[)/,
          0 => 'punctuation.definition.vector.begin.clojure'
        to %r/\]/,
          0 => 'punctuation.definition.vector.end.clojure'
        include "#all"
      end
      include "#binding"
    end
    rule 'meta.structure.binding_exp.map.clojure' do
      from %r/(\{)/
      to %r/(?=\])/
      rule 'meta.expression.map.clojure' do
        # TODO: merge with map
        from %r/(?<=\{)/,
          0 => 'punctuation.definition.map.begin.clojure'
        to %r/}/,
          0 => 'punctuation.definition.map.end.clojure'
        include "#all"
      end
      include "#binding"
    end
    rule 'meta.structure.binding_exp.set.clojure' do
      from %r/(?=#\{)/
      to %r/(?=\])/
      include "#set"
      include "#binding"
    end
    rule 'meta.structure.binding_exp.string.clojure' do
      from %r/(?=")|(?=\\)|(?=\:)|(?=\#")/
      to %r/(?=\])/
      include "#string"
      include "#binding"
    end
    rule 'meta.structure.binding_exp.symbole.clojure' do
      # symbol matching
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      from %r:(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]):
      to %r/(?=\])/
      rule do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        from %r:(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        to %r:(?<=[a-zA-Z+!\-_?0-9*~#@'`/.$=])(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        include "#keyword"
        include "#operator"
        include "#number"
        include "#symbol"
      end
      rule do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        from %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        to %r/(?=\])/
        include "#binding"
      end
    end
    rule 'invalid.illegal.bindings.clojure' do
      from %r/[^\s]/
      to %r/[^\]]/
    end
  end

  fragment :bindings_form do
    rule 'meta.structure.bindings.clojure' do
      # bindings followed by all
      from %r/\[/
      to %r/(?=\))/
      rule do
        from %r/(?<=\[)/
        to %r/\]/
        include "#binding"
      end
      rule do
        from %r/(?<=\])/
        to %r/(?=\))/
        include "#all"
      end
    end
  end

  fragment :comment do
    rule 'comment.line.semicolon.double.banner.clojure' do
      match %r/(;;).*(;;)$\n?/,
        1 => 'punctuation.definition.comment.clojure'
    end
    rule 'comment.line.semicolon.double.clojure' do
      match %r/(;;).*$\n?/,
        1 => 'punctuation.definition.comment.clojure'
    end
    rule 'comment.line.semicolon.start.clojure' do
      match %r/^(;).*$\n?/,
        1 => 'punctuation.definition.comment.clojure'
    end
    rule 'comment.line.semicolon.clojure' do
      match %r/(;).*$\n?/,
        1 => 'punctuation.definition.comment.clojure'
    end
  end

  fragment :expr do
    rule 'meta.expr.clojure' do
      include "#keyword"
      include "#operator"
      include "#string"
      include "#vector"
      include "#map"
      include "#set"
      include "#metadata"
      include "#number"
      include "#symbol"
    end
  end

  fragment :function do
    rule 'meta.function.clojure' do
      from %r/\(\s*(defn\-?)\s/,
        1 => 'storage.type.function.type.clojure'
      to %r/\)/,
        1 => 'punctuation.terminator.function.clojure'
      include "#comment"
      include "#metadata"
      rule do
        match %r/\s*/
      end
      include "#function_name"
      include "#function_body_comment"
    end
  end

  fragment :function_body do
    rule 'meta.function.body.code.clojure' do
      from %r/\(\s*(?=\[)/
      to %r/\)/
      include "#parameters_body"
    end
    rule 'meta.function.body.clojure' do
      from %r/(?=\[)/
      to %r/(?=\))/
      include "#parameters_body"
    end
  end

  fragment :function_body_comment do
    rule 'string.docstring.clojure' do
      from %r/"/,
        0 => 'string.quoted.double.begin.clojure'
      to %r/"/,
        0 => 'string.quoted.double.end.clojure'
      include "#string_escape"
    end
    rule 'meta.metadata.map.clojure' do
      from %r/\{/,
        0 => 'comment.punctuation.definition.metadata.begin.clojure'
      to %r/\}/,
        0 => 'comment.punctuation.definition.metadata.end.clojure'
      include "#metadata_patterns"
    end
    include "#function_body"
  end

  fragment :function_multi_method do
    rule 'meta.function.multi_method.clojure' do
      from %r/\(\s*(defmethod\-?)\s+/,
        1 => 'storage.type.function.type.clojure'
      to %r/\)/
      include "#comment"
      rule do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        from %r:(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        to %r/(?=\))/
        rule 'meta.function.multi_method.name.clojure' do
          # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
          from %r:(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]):
          # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
          to %r:(?<=[a-zA-Z+!\-_?0-9*~#@'`/.$=])(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
          include "#function_name"
        end
        rule do
          # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
          from %r:(?<=[a-zA-Z+!\-_?0-9*~#@'`/.$=])(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
          to %r/(?=\))/
          include "#comment"
          include "#metadata"
          include "#operator_special"
          rule 'meta.structure.multi_method_exp.constant.language.clojure' do
            # FIXME: (error) '#{' will be interpreted as interpolation: escape '#' as '\#'
            from %r/(\(\)|{}|\[\]|#{})/,
              1 => 'constant.language.clojure'
            to %r/(?=\))/
            include "#parameters_body"
          end
          rule 'meta.structure.multi_method_exp.sexp.clojure' do
            from %r/(?=#?\()/
            to %r/(?=\))/
            rule do
              from %r/(?=#?\()/
              to %r/(?<=\))/
              include "#function"
              include "#function_multi_method"
              include "#lambda"
              include "#macro"
              include "#sexpr"
            end
            include "#parameters_body"
          end
          rule 'meta.structure.multi_method_exp.vector.clojure' do
            from %r/(\[)/
            to %r/(?=\))/
            rule 'meta.expression.vector.clojure' do
              # TODO: merge with vector
              from %r/(?<=\[)/,
                0 => 'punctuation.definition.vector.begin.clojure'
              to %r/(\])/,
                1 => 'punctuation.definition.vector.end.clojure'
              include "#all"
            end
            rule do
              from %r/(?<=\])\s*/
              to %r/(?=\))/
              include "#parameters_body"
            end
          end
          rule 'meta.structure.multi_method_exp.map.clojure' do
            from %r/(\{)/
            to %r/(?=\))/
            rule 'meta.expression.map.clojure' do
              # TODO: merge with map
              from %r/(?<=\{)/,
                0 => 'punctuation.definition.map.begin.clojure'
              to %r/}/,
                0 => 'punctuation.definition.map.end.clojure'
              include "#all"
            end
            include "#parameters_body"
          end
          rule 'meta.structure.multi_method_exp.set.clojure' do
            from %r/(?=#\{)/
            to %r/(?=\))/
            include "#set"
            include "#parameters_body"
          end
          rule 'meta.structure.multi_method_exp.string.clojure' do
            from %r/(?=")|(?=\\)|(?=\:)|(?=\#")/
            to %r/(?=\))/
            include "#string"
            include "#parameters_body"
          end
          rule 'meta.structure.multi_method_exp.symbole.clojure' do
            # symbol matching
            # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
            from %r:(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]):
            to %r/(?=\))/
            rule do
              # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
              from %r:(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]):
              # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
              to %r:(?<=[a-zA-Z+!\-_?0-9*~#@'`/.$=])(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
              include "#symbol_java_inherited_class"
              include "#keyword"
              include "#operator"
              include "#number"
              include "#symbol"
            end
            rule do
              # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
              from %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
              to %r/(?=\))/
              include "#parameters_body"
            end
          end
        end
      end
      # FIXME: no "match" nor "begin/end"
      rule do
        # Need to match a single expression like binding-exp
      end
    end
  end

  fragment :function_name do
    rule 'entity.name.function.clojure' do
      # symbol matching
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      from %r:(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]):
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      to %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
      include "#keyword"
      include "#operator"
      rule do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        from %r:-(?=[a-zA-Z+!\-_?*~#@'`/.$=]):,
          0 => 'keyword.operator.prefix.genclass.clojure'
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        to %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        include "#symbol"
      end
      include "#symbol"
    end
  end

  fragment :genclass_parameters do
    include "#gencommon_parameters"
    rule 'meta.other.genclass.extends.clojure' do
      from %r/(:extends)\s+/,
        1 => 'support.other.keyword.genclass.clojure'
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      to %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
      include "#symbol_java_inherited_class"
    end
    rule 'meta.other.genclass.implements.clojure' do
      from %r/(:implements)\s+(\[)/,
        1 => 'support.other.keyword.genclass.clojure'
      to %r/\]/
      include "#symbol_java_inherited_class"
      include "#all"
    end
    rule 'meta.other.genclass.constructors.clojure' do
      from %r/(:constructors)\s+(\{)/,
        1 => 'support.other.keyword.genclass.clojure'
      to %r/\}/
      rule 'meta.other.genclass.constructor.signature.clojure' do
        from %r/\[/
        to %r/\]/
        rule 'storage.type.java.clojure' do
          # TODO: make a rule java Class (storage)
          # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
          from %r:(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]):
          # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
          to %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
          include "#symbol"
        end
        include "#all"
      end
      include "#all"
    end
    rule 'meta.other.genclass.exposes.clojure' do
      from %r/(:exposes)\s+(\{)/,
        1 => 'support.other.keyword.genclass.clojure'
      to %r/\}/
      rule 'meta.other.genclass.exposes.get_set.clojure' do
        from %r/\{/
        to %r/\}/
        rule 'support.other.keyword.genclass.clojure' do
          match %r/:(get|set)/
        end
        include "#all"
      end
      include "#all"
    end
    rule do
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      match %r/:(init|main|factory|state|prefix|load-impl-ns|implements|constructors|exposes|impl-ns|exposes-methods|methods)(?![a-zA-Z+!\-_?0-9*~#@'`\/.$=])/,
        0 => 'support.other.keyword.genclass.clojure'
    end
    include "#all"
  end

  fragment :gencommon_parameters do
    include "#comment"
    rule 'meta.other.genclass.name.clojure' do
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      from %r/(:name)\s+(?=[a-zA-Z+!\-_?0-9*~#@'`\/.$=])/,
        1 => 'support.other.keyword.genclass.clojure'
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      to %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
      rule 'entity.name.namespace.clojure' do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        from %r:(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        to %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        include "#symbol"
      end
    end
    rule 'meta.other.genclass.methods.clojure' do
      from %r/(:methods)\s+(\[)/,
        1 => 'support.other.keyword.genclass.clojure'
      to %r/\]/
      rule 'meta.other.genclass.method.signature.clojure' do
        from %r/\[/
        to %r/\]/
        rule 'meta.other.genclass.method.args.signature.clojure' do
          from %r/\[/
          to %r/\]/
          rule 'storage.type.java.clojure' do
            # TODO: make a rule java Class (storage)
            # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
            from %r:(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]):
            # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
            to %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
            include "#symbol"
          end
          include "#all"
        end
        rule 'storage.type.java.genclass.return_type.clojure' do
          # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
          # FIXME: (warning) regular expression has ']' without escape
          from %r:(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]+\s*]):
          to %r/.|$/
          include "#symbol"
        end
        include "#all"
      end
      include "#all"
    end
  end

  fragment :geninterface_parameters do
    include "#gencommon_parameters"
    rule 'meta.other.genclass.implements.clojure' do
      from %r/(:extends)\s+(\[)/,
        1 => 'support.other.keyword.genclass.clojure'
      to %r/\]/
      include "#symbol_java_inherited_class"
      include "#all"
    end
  end

  fragment :keyword do
    rule 'keyword.control.clojure' do
      match %r/(?<![*+!_?\-])\b((if-not|if|cond|do|let|loop|recur|throw|try|catch|finally|new|trampoline)\b|(set!|swap!|compare-and-set!))(?![*+!_?\-])/
    end
    rule 'keyword.other.clojure' do
      match %r/(?<![*+!_?\-])\b(monitor-enter|monitor-exit|assoc|touch|drop|take|concat|prn|into|cons|first|flatten|rest|frest|rrest|second|lazy-cat|lazy-cons|conj|await|range|iterate)\b(?![*+!_?\-])/
    end
    rule 'storage.clojure' do
      match %r/(?<![*+!_?\-])\b(str|print(ln)?|eval|def|defmacro|defn|quote|var|fn|defmulti|defmethod|map|list|hash-map|vector|agent|declare|intern|macroexpand|macroexpand-1)\b(?![*+!_?\-])/
    end
    rule 'support.function.match.clojure' do
      match %r/(?<![*+!_?\-])\b(->|\.\.|amap|and|areduce|assert|binding|comment|cond|definline|(def[a-z\-]*)|defmatch|defmethod|defmulti|defn|defn-|defonce|defstruct|delay|doc|doseq|dosync|dotimes|doto|fn|for|if-let|lazy-cons|let|locking|loop|memfn|ns|or|prefer-method|proxy-super|proxy|refer-clojure|remove-method|sync|time|when-first|when-let|when-not|when|while|with-in-str|with-local-vars|with-open|with-out-str|with-precision|memoize)\b(?![*+!_?\-])/
    end
    rule 'support.function.tester.clojure' do
      match %r/(?<![*+!_?\-])\b(rational|associative|branch|class|coll|contains|decimal|delay|distinct|empty|end|even|every|false|float|fn|identical|instance|integer|isa|keyword|list|map|neg|nil|not-any|not-every|number|odd|pos|ratio|reversible|seq|sequential|set|sorted|special-symbol|string|symbol|true|var|zero|vector|ifn)(\?)(?![*+!_?\-])/,
        2 => 'keyword.other.mark.clojure'
    end
    rule 'support.function.clojure' do
      match %r/(?<![*+!_?\-])\b(not(=)|list(\*)|io(!))(?![*+!_?\-])/,
        2 => 'keyword.other.mark.clojure',
        3 => 'keyword.other.mark.clojure',
        4 => 'keyword.other.mark.clojure'
    end
    rule 'support.function.clojure' do
      match %r/(?<![*+!_?\-])\b(zipper|zipmap|xml-zip|xml-seq|with-meta|vector-zip|vector|vec|var-set|var-get|vals|val|use|update-proxy|update-in|up|union|underive|unchecked-subtract|unchecked-negate|unchecked-multiply|unchecked-inc|unchecked-divide|unchecked-dec|unchecked-add|tree-seq|to-array-2d|to-array|test|take-while|take-nth|symbol|supers|subvec|subseq|subs|struct-map|struct|str|split-with|split-at|sorted-set|sorted-map-by|sorted-map|sort-by|sort|some|slurp|shutdown-agents|short|set-validator|set|seque|seq-zip|seq|send-off|send|select-keys|select|rsubseq|rseq|root|rights|right|rfirst|reverse|resultset-seq|resolve|require|replicate|replace|repeatedly|repeat|rename-keys|rename|remove-ns|remove|rem|refer|ref-set|ref|reduce|read-string|read-line|read|re-seq|re-pattern|re-matches|re-matcher|re-groups|re-find|rationalize|rand-int|rand|quot|pvec|psummary|psort|proxy-mappings|project|prn-str|println-str|println|printf|print-str|print|preduce|pr-str|pr|pop|pmin|pmax|pmap|pfilter-nils|pfilter-dupes|peek|pdistinct|path|partition|partial|parse|parents|par|pany|num|nthrest|nth|ns-unmap|ns-unalias|ns-resolve|ns-refers|ns-publics|ns-name|ns-map|ns-interns|ns-imports|ns-aliases|not=|not-empty|not|node|next|newline|namespace|name|min-key|min|meta|merge-with|merge|max-key|max|matchexpand-1|matchexpand|mapcat|map-invert|map|make-node|make-hierarchy|make-array|long-array|long|loaded-libs|load-string|load-reader|load-file|load|list*|list|line-seq|lefts|left|last|keyword|keys|key|join|iterator-seq|into-array|intersection|interpose|interleave|int-array|int|inspect-tree|inspect-table|insert-right|insert-left|insert-child|index|inc|in-ns|import|identity|hash-set|hash-map|hash|get-validator|get-proxy-class|get-in|get|gensym|gen-class|gen-interface|gen-and-save-class|gen-and-load-class|format|force|fnseq|flush|float-array|float|find-var|find-ns|find-doc|find|filter|file-seq|ffirst|eval|enumeration-seq|ensure|empty|edit|drop-while|drop-last|down|double-array|double|dorun|doall|distinct|dissoc|disj|difference|descendants|derive|deref|dec|cycle|create-struct|create-ns|count|construct-proxy|constantly|conj|complement|compare|comparator|comp|commute|clojure.set|clojure.parallel|clojure.inspector|clear-agent-errors|class|children|char|cast|cache-seq|byte|butlast|boolean|bit-xor|bit-test|bit-shift-right|bit-shift-left|bit-set|bit-or|bit-not|bit-flip|bit-clear|bit-and-not|bit-and|bigint|bigdec|bean|bases|await-for|assoc-in|aset-short|aset-long|aset-int|aset-float|aset-double|aset-char|aset-byte|aset-boolean|aset|array-map|apply|append-child|ancestors|alter-var-root|alter|all-ns|alias|alength|aget|agent-errors|agent|add-classpath|aclone|accessor|compile|longs|doubles|ints|floats|atom)\b(?![*+!_?\-])/
    end
    rule 'constant.language.clojure' do
      match %r/(?<![*+!_?\-])\b(true|false|nil)\b(?![*+!_?\-])/
    end
    rule 'constant.language.clojure' do
      # FIXME: (error) '#{' will be interpreted as interpolation: escape '#' as '\#'
      match %r/(\(\)|{}|\[\]|#{})/
    end
    rule 'storage.modifier.clojure' do
      # TODO : clean this ?
      match %r/(?<![*+!_?\-])\b:(private|doc|test|tag)\b(?![*+!_?\-])/
    end
    rule 'support.variable.clojure' do
      # TODO : clean this ?
      match %r/(?<![*+!_?\-])\b:(file|line|name|ns|match|argslist)\b(?![*+!_?\-])/
    end
    rule 'support.variable.global.clojure' do
      match %r/(?<![*+!_?\-])\*(agent|allow-unresolved-vars|command-line-args|compile-files|compile-path|err|file|flush-on-newline|in|macro-meta|math-context|ns|out|print-dup|print-length|print-level|print-meta|print-readably|proxy-classes|use-context-classloader|warn-on-reflection)\*(?![*+!_?\-])/
    end
  end

  fragment :lambda do
    rule 'meta.function.lambda.clojure' do
      from %r/\(\s*(fn)\s+/,
        1 => 'storage.type.function.type.clojure'
      to %r/\)/
      include "#comment"
      include "#function_name"
      include "#function_body"
    end
    rule 'meta.function.lambda.clojure' do
      from %r/(#)\(/,
        1 => 'storage.type.function.type.clojure'
      to %r/\)/
      include "#sexpr_special"
      include "#all"
    end
  end

  fragment :macro do
    rule 'meta.function.macro.clojure' do
      from %r/\(\s*(\b(defmacro\-?))\s+/,
        1 => 'storage.type.function.type.clojure'
      to %r/\)/
      include "#comment"
      include "#metadata"
      rule do
        match %r/\s*/
      end
      include "#function_name"
      include "#function_body_comment"
    end
  end

  fragment :map do
    rule 'meta.expression.map.clojure' do
      from %r/{(?!})/,
        0 => 'punctuation.definition.map.begin.clojure'
      to %r/(?<!{)}/,
        0 => 'punctuation.definition.map.end.clojure'
      include "#all"
    end
  end

  fragment :metadata do
    rule 'punctuation.metadata.map.clojure' do
      from %r/#?\^{/,
        0 => 'comment.punctuation.definition.metadata.begin.clojure'
      to %r/}/,
        0 => 'comment.punctuation.definition.metadata.end.clojure'
      include "#metadata_patterns"
    end
    rule 'string.metadata.clojure' do
      from %r/#?\^"/,
        0 => 'comment.punctuation.definition.metadata.begin.clojure'
      to %r/"/,
        0 => 'comment.punctuation.definition.metadata.end.clojure'
    end
    rule 'punctuation.metadata.class.clojure' do
      match %r'(#?\^)([a-zA-Z+!\-_?0-9*/.$=]+)',
        1 => 'comment.punctuation.definition.metadata.begin.clojure',
        2 => 'storage.type.java.clojure'
    end
  end

  fragment :metadata_patterns do
    rule 'support.other.keyword.namespace.clojure' do
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      match %r/(:tag|:doc|:arglists|:private|:macro|:name|:ns|:inline-arities|:inline|:line|:file)(?![a-zA-Z+!\-_?0-9*~#@'`\/.$=])/
    end
    rule 'storage.type.java.clojure' do
      match %r'(?<=:tag)\s+([a-zA-Z+!\-_?0-9*/.$=]+)'
    end
    rule 'string.docstring.clojure' do
      from %r/(?<=:doc)\s+"/,
        0 => 'string.quoted.double.begin.clojure'
      to %r/"/,
        0 => 'string.quoted.double.end.clojure'
      include "#string_escape"
    end
    include "#all"
  end

  fragment :namespace do
    rule 'meta.function.namespace.clojure' do
      from %r/\(\s*(ns)\b/,
        1 => 'support.function.namespace.clojure'
      to %r/\)/
      rule 'entity.name.namespace.clojure' do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        from %r:(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        to %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        include "#symbol"
      end
      include "#namespace_body"
    end
  end

  fragment :namespace_body do
    rule 'support.other.keyword.namespace.clojure' do
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      match %r/(:refer-clojure|:require|:use|:import|:load|:exclude|:as|:only)(?![a-zA-Z+!\-_?0-9*~#@'`\/.$=])/
    end
    rule 'meta.function.genclass_form.clojure' do
      from %r/\(\s*(:gen-class)/,
        1 => 'support.other.keyword.genclass.clojure'
      to %r/\)/
      include "#genclass_parameters"
    end
    include "#symbol"
    include "#string"
    rule do
      from %r/\(/
      to %r/\)/
      include "#namespace_body"
    end
    rule do
      from %r/\[/
      to %r/\]/
      include "#namespace_body"
    end
  end

  fragment :number do
    rule 'constant.numeric.float.ratio.clojure' do
      match %r'(-|\+)?\b[0-9]+(/)[0-9]+\b',
        2 => 'keyword.operator.arithmetic.ratio.clojure'
    end
    rule 'constant.numeric.float.clojure' do
      match %r/[-+]?\b[0-9]+((\.[0-9]+([eE][-+]?[0-9]+)?)|((\.[0-9]+)?[eE][-+]?[0-9]+))?\b/
    end
    rule 'constant.numeric.big_decimal.clojure' do
      match %r/[-+]?\b[0-9]+(((\.[0-9])?+([eE][-+]?[0-9]+)?)|((\.[0-9]+)?[eE][-+]?[0-9]+))[M]?\b/
    end
    rule 'constant.numeric.integer.octal.clojure' do
      match %r/(-|\+)?\b(0)([0-7]+|([89]))([0-9]*)\b/,
        2 => 'keyword.operator.arithmetic.octal.clojure',
        4 => 'invalid.illegal.integer.octal.clojure',
        5 => 'invalid.illegal.integer.octal.clojure'
    end
    rule 'constant.numeric.integer.clojure' do
      match %r/(-|\+)?\b[0-9]+\b/
    end
    rule 'constant.numeric.integer.hexa.clojure' do
      match %r/(-|\+)?\b(0[xX])[0-9A-Fa-f]+\b/,
        2 => 'keyword.operator.arithmetic.hexa.clojure'
    end
  end

  fragment :operator do
    rule 'keyword.operator.clojure' do
      match %r'(?<![a-zA-Z0-9*+!_?\-])(\*|/|\<|\<=|=|==|\>|\>=|-\>)(?![a-zA-Z0-9*+!_?\-])'
    end
    rule 'keyword.operator.clojure' do
      match %r/(?<![a-zA-Z0-9*+!_?\-])(-|\+)(?![a-zA-Z0-9*+!_?\-])/
    end
    rule 'keyword.operator.class.clojure' do
      match %r/(?<![a-zA-Z0-9*+!_?\-])(\.|\.\.)(?![a-zA-Z0-9*+!_?\-])/
    end
    rule 'variable.parameter.literal.clojure' do
      match %r/%(\d+|&)?/
    end
    include "#operator_special"
  end

  fragment :operator_special do
    rule 'keyword.control.operator.clojure' do
      match %r/`|~@|~/
    end
    rule 'storage.type.function.type.clojure' do
      match %r/#'|@/
    end
    rule 'constant.other.quote' do
      match %r/'/
    end
    rule 'constant.other.metadata.read.clojure' do
      match %r/\^/
    end
  end

  fragment :parameters do
    rule 'meta.parameters.vector.clojure' do
      from %r/\[/,
        0 => 'punctuation.definition.vector.begin.clojure'
      to %r/\]/,
        0 => 'punctuation.definition.vector.end.clojure'
      rule 'keyword.operator.varargs.clojure' do
        match %r/\&/
      end
      rule 'keyword.operator.symbolargs.clojure' do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        match %r/(:as)(?![a-zA-Z+!\-_?0-9*~#@'`\/.$=])/
      end
      include "#comment"
      include "#metadata"
      include "#parameters_variable"
      include "#parameters"
      include "#parameters_map"
    end
  end

  fragment :parameters_body do
    rule 'meta.function.body' do
      include "#parameters_function"
      rule 'meta.function.body.code.clojure' do
        from %r/(?<=\])/
        to %r/(?=\))/
        include "#all"
      end
    end
  end

  fragment :parameters_function do
    rule 'meta.function.parameters.vector.clojure' do
      from %r/\[/,
        0 => 'punctuation.definition.vector.begin.clojure'
      to %r/\]/,
        0 => 'punctuation.definition.vector.end.clojure'
      rule 'keyword.operator.varargs.clojure' do
        match %r/\&/
      end
      rule 'keyword.operator.symbolargs.clojure' do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        match %r/(:as)(?![a-zA-Z+!\-_?0-9*~#@'`\/.$=])/
      end
      include "#comment"
      include "#metadata"
      include "#parameters_variable"
      include "#parameters"
      include "#parameters_map"
    end
  end

  fragment :parameters_map do
    rule 'meta.function.parameters.map.clojure' do
      from %r/\{/,
        0 => 'punctuation.definition.map.begin.clojure'
      to %r/\}/,
        0 => 'punctuation.definition.map.end.clojure'
      include "#parameters_variable"
      rule 'keyword.operator.symbolargs.clojure' do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        match %r/(:as|:or|:keys|:strs|:syms)(?![a-zA-Z+!\-_?0-9*~#@'`\/.$=])/
      end
      include "#parameters"
      include "#parameters_map"
      include "#all"
    end
  end

  fragment :parameters_variable do
    rule 'variable.parameter.clojure' do
      # symbol matching TODO:operator number => error ?
      from %r:(?=[a-zA-Z+!\-_?0-9*~@'`/.$=]):
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      to %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
      include "#keyword"
      include "#operator"
      include "#number"
      include "#symbol"
    end
  end

  fragment :set do
    rule 'meta.expression.set.clojure' do
      # FIXME: (error) '#{' will be interpreted as interpolation: escape '#' as '\#'
      from %r/#{/,
        0 => 'punctuation.definition.set.begin.clojure'
      to %r/}/,
        0 => 'punctuation.definition.set.end.clojure'
      include "#all"
    end
  end

  fragment :sexpr do
    rule 'meta.sexpr.clojure' do
      from %r/\((?!\))/
      to %r/(?<!\()\)/
      include "#sexpr_special"
      include "#all"
    end
  end

  fragment :sexpr_special do
    rule 'meta.function.let_form.clojure' do
      from %r/(?<=\()\s*(let|loop|doseq|dotimes|binding|for|if-let|when-let|with-local-vars|with-open)\s+(?=\[)/,
        1 => 'keyword.control.clojure'
      to %r/(?=\))/
      include "#bindings_form"
    end
    rule 'meta.function.def_form.clojure' do
      from %r/(?<=\()\s*(def|declare|defstruct|defonce|defmulti)\s+/,
        1 => 'storage.type.variable.clojure'
      to %r/(?=\))/
      include "#metadata"
      rule do
        match %r/\s*/
      end
      include "#function_name"
      rule do
        from %r/(?<=$|.)/
        to %r/(?=\))/
        include "#all"
      end
    end
    rule 'meta.function.def_form.clojure' do
      from %r/(?<=\()\s*(prefer-method)\s+/,
        1 => 'storage.type.variable.clojure'
      to %r/(?=\))/
      include "#metadata"
      rule do
        match %r/\s*/
      end
      include "#function_name"
      rule do
        from %r/(?<=$|.)/
        to %r/(?=\))/
        include "#symbol_java_inherited_class"
        include "#all"
      end
    end
    rule 'meta.function.isInstance_form.clojure' do
      from %r/(?<=\()\s*(instance(\?))\s+/,
        1 => 'support.function.tester.clojure',
        2 => 'keyword.other.mark.clojure'
      to %r/(?=\))/
      include "#symbol_java_class_form_body"
    end
    rule 'meta.function.cast_form.clojure' do
      from %r/(?<=\()\s*(cast)\s+/,
        1 => 'support.function.clojure'
      to %r/(?=\))/
      include "#symbol_java_class_form_body"
    end
    rule 'meta.function.new_form.clojure' do
      from %r/(?<=\()\s*((new)\s+|(?=[a-zA-Z][a-zA-Z.]*\.(\s+|$|\))))/,
        2 => 'keyword.control.clojure'
      to %r/(?=\))/
      rule 'storage.type.java.clojure' do
        from %r/(?=([a-z]+\.)*[A-Z][a-zA-Z]*(\$[A-Z][a-zA-Z]*)?)/
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        to %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        include "#symbol"
      end
      rule do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        from %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        to %r/(?=\))/
        include "#all"
      end
      include "#all"
    end
    rule 'meta.function.member_access_form.clojure' do
      from %r/(?<=\()\s*((\.\.?)\s+(?=([a-z]+\.)*[A-Z][a-zA-Z]*(\$[A-Z][a-zA-Z]*)?))/,
        2 => 'keyword.control.clojure'
      to %r/(?=\))/
      rule 'storage.type.java.clojure' do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        from %r:(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        to %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        include "#symbol"
      end
      rule do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        from %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        to %r/(?=\))/
        include "#all"
      end
      include "#all"
    end
    rule 'meta.function.genclass_form.clojure' do
      from %r/(?<=\()\s*(gen-class)\s+/,
        1 => 'support.function.clojure'
      to %r/(?=\))/
      include "#genclass_parameters"
    end
    rule 'meta.function.geninterface_form.clojure' do
      from %r/(?<=\()\s*(gen-interface)\s+/,
        1 => 'support.function.clojure'
      to %r/(?=\))/
      include "#geninterface_parameters"
    end
    rule 'meta.function.catch_form.clojure' do
      from %r/(?<=\()\s*((catch)\s+)/,
        2 => 'keyword.control.clojure'
      to %r/(?=\))/
      rule do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        from %r:(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        to %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        include "#symbol_java_class_form_body"
      end
      rule 'variable.parameter.clojure' do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        from %r:\s+(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        to %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        include "#symbol"
      end
      rule do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        from %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        to %r/(?=\))/
        include "#all"
      end
      include "#all"
    end
    rule 'meta.function.setvar_form.clojure' do
      from %r/(?<=\()\s*(((set|swap|compare-and-set)(\!))\s+)/,
        2 => 'keyword.control.clojure',
        3 => 'keyword.other.mark.clojure'
      to %r/(?=\))/
      rule 'variable.parameter.clojure' do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        from %r:(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        to %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        include "#symbol"
      end
      rule do
        # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
        from %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
        to %r/(?=\))/
        include "#all"
      end
      include "#all"
    end
    rule 'meta.function.proxy_form.clojure' do
      from %r/(?<=\()\s*(proxy)\s+/,
        1 => 'keyword.control.clojure'
      to %r/(?=\))/
      include "#comment"
      rule do
        from %r/(?=\[)/
        to %r/(?=\))/
        include "#comment"
        rule do
          from %r/\[/
          to %r/\]/
          rule 'entity.other.inherited-class.java.proxy.clojure' do
            from %r/(?=([a-z]+\.)*[A-Z][a-zA-Z]*)/
            to %r/(?![a-zA-Z.])/
            include "#symbol"
          end
          include "#all"
        end
        rule do
          from %r/(?<=\])/
          to %r/(?=\))/
          include "#comment"
          rule 'meta.function.body.proxy_form.clojure' do
            from %r/(?=\[)/
            to %r/(?=\))/
            include "#comment"
            include "#parameters"
            rule do
              from %r/(?<=\])/
              to %r/(?=\))/
              include "#comment"
              rule 'meta.function.proxy.method.clojure' do
                from %r/\(\s*/
                to %r/\)/
                include "#comment"
                include "#function_name"
                include "#function_body_comment"
              end
            end
          end
        end
      end
    end
  end

  fragment :string do
    rule 'string.quoted.double.clojure' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.clojure'
      to %r/"/,
        0 => 'punctuation.definition.string.end.clojure'
      include "#string_escape"
    end
    rule 'constant.character.escape.clojure' do
      match %r/\\(u[0-9a-fA-F]{4}|newline|tab|space|backspace|formfeed|return|[^\s])/
    end
    rule 'constant.string.symbole.clojure' do
      # . is OK in symbol ?
      from %r'(\:{1,2})(?=[a-zA-Z+!\-_?0-9*/.$=])',
        1 => 'keyword.operator.symbole.clojure'
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      to %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
      include "#symbol"
    end
    rule 'string.regexp.clojure' do
      from %r/#"/,
        0 => 'punctuation.definition.string.begin.clojure'
      to %r/"/,
        0 => 'punctuation.definition.string.end.clojure'
      include "source.regexp.oniguruma"
    end
  end

  fragment :string_escape do
    rule 'constant.character.escape.clojure' do
      match %r/\\(u[0-9a-fA-F]{4}|b|t|n|f|r|"|'|\\|[0-3]?[0-7]{1,2}|(.))/,
        2 => 'invalid.illegal.escape.string.clojure'
    end
  end

  fragment :symbol do
    rule 'constant.other.java.clojure' do
      match %r/\b[A-Z_]{2,}\b/
    end
    rule 'source.symbol.global.clojure' do
      match %r/(?<![a-zA-Z+!\-_?0-9*])\*[a-z\-]{2,}\*(?![a-zA-Z+!\-_?0-9*])/
    end
    rule 'source.symbol.clojure' do
      from %r/(?=[a-zA-Z+!\-_?0-9*=])/
      to %r/(?![a-zA-Z+!\-_?0-9*=])/
      rule 'invalid.illegal.symbol.clojure' do
        from %r/[0-9]/
        to %r/(?![a-zA-Z+!\-_?0-9*=])/
      end
      rule do
        from %r/[a-zA-Z]/
        to %r/([+!\-_?*=#])?(?![a-zA-Z+!\-_?0-9*=])/,
          1 => 'keyword.other.mark.clojure'
      end
      rule do
        from %r/[+!\-_?*=]/
        to %r/(?![a-zA-Z+!\-_?0-9*=])/
      end
    end
    rule 'keyword.operator.classpath.clojure' do
      match %r/(?<=[a-zA-Z+!\-_?0-9*])\.(?=[a-zA-Z+!\-_?0-9*])/
    end
    rule 'keyword.operator.qualified.clojure' do
      match %r'(?<=[a-zA-Z+!\-_?0-9*])(/|\$)(?=[a-zA-Z+!\-_?0-9*])'
    end
  end

  # FIXME: this fragment is never referenced
  fragment :symbol_java_class do
    rule 'storage.type.java.clojure' do
      # TODO : use it
      from %r/(?=([a-z]+\.)*[A-Z][a-zA-Z]*(\$[A-Z][a-zA-Z]*)?)/
      to %r/(?![a-zA-Z.$])/
      include "#symbol"
    end
  end

  fragment :symbol_java_class_form_body do
    rule do
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      from %r:(?=[a-zA-Z+!\-_?0-9*~#@'`/.$=]):
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      to %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
      include "#symbol_java_inherited_class"
    end
    rule do
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      from %r:(?![a-zA-Z+!\-_?0-9*~#@'`/.$=]):
      to %r/(?=\))/
      include "#all"
    end
    include "#all"
  end

  fragment :symbol_java_inherited_class do
    rule 'entity.other.inherited-class.java.clojure' do
      from %r/(?=([a-z]+\.)*[A-Z][a-zA-Z]*(\$[A-Z][a-zA-Z]*)?)/
      to %r/(?![a-zA-Z.$])/
      include "#symbol"
    end
  end

  fragment :vector do
    rule 'meta.expression.vector.clojure' do
      from %r/\[(?!\])/,
        0 => 'punctuation.definition.vector.begin.clojure'
      to %r/(?<!\[)\]/,
        0 => 'punctuation.definition.vector.end.clojure'
      include "#all"
    end
  end
end
