# encoding: utf-8

language 'Thrift' => 'source.thrift' do
  file_types %w(thrift)
  key_equivalent "^~T"  # TextMate only
  uuid "9E5704AC-54ED-4D7C-946C-6DC3727BDC4C"  # TextMate only

  include "#comments"
  rule 'meta.include.thrift' do
    match %r/(?<!\S)(include)(?!\S)(?:\s+((['"])(?>.*?(\3))))?/,
      1 => 'keyword.other.include.thrift',
      2 => 'string.quoted.thrift',
      3 => 'punctuation.definition.string.begin.thrift',
      4 => 'punctuation.definition.string.end.thrift'
  end
  rule 'meta.cpp-include.thrift' do
    match %r/(?<!\S)(cpp_include)(?!\S)(?:\s+((['"])(?>.*?(\3))))?/,
      1 => 'keyword.other.cpp-include.thrift',
      2 => 'string.quoted.thrift',
      3 => 'punctuation.definition.string.begin.thrift',
      4 => 'punctuation.definition.string.end.thrift'
  end
  rule 'meta.namespace.thrift' do
    match %r/(?<!\S)(namespace)(?!\S)(?:\s+([a-zA-Z_][\w.]*)(?:\s+([a-zA-Z_][\w.]*))?)?/,
      1 => 'keyword.other.namespace.thrift',
      2 => 'support.other.namespace-language.thrift',
      3 => 'variable.other.namespace.thrift'
  end
  rule 'meta.namespace.thrift' do
    match %r/(?<!\S)((?:php|xsd)_namespace)(?!\S)(?:\s+([a-zA-Z_][\w.]*))?/,
      1 => 'keyword.other.namespace.thrift',
      2 => 'variable.other.namespace.thrift'
  end
  rule do
    match %r/(?<!\S)((?:cpp|ruby|csharp)_namespace|py_module|(?:java|perl)_package|smalltalk_(?:category|prefix)|cocoa_prefix)(?!\S)(?:\s+([a-zA-Z_][\w.]*))?/,
      1 => 'invalid.deprecated.namespace.thrift',
      2 => 'variable.other.namespace.thrift'
  end
  rule do
    # begin the definition list
    from %r/(?=(struct|s?enum|union|service|const|typedef|exception)\b)/
    to %r/(?x)$.^ # this regex should never end/
    include "#comments"
    rule 'meta.const.thrift' do
      from %r/(?<!\S)(const)(?!\S)(?:\s+(?<ft>map\s*<\s*\g<ft>\s*,\s*\g<ft>\s*>|set\s*<\s*\g<ft>\s*>|list\s*<\s*\g<ft>\s*>\s*cpp_type|[a-zA-Z_][\w.]*)(?:\s+([a-zA-Z_][\w.]*)(?:\s*=)?)?)?/,
        1 => 'keyword.other.const.thrift',
        2 => 'storage.type.const.thrift',
        3 => 'variable.other.const.thrift'
      to %r/$|^/
      include "#comments"
      include "#value"
    end
    rule 'meta.typedef.thrift' do
      from %r/(?<!\S)(typedef)(?!\S)(?:\s+(?<ft>map\s*<\s*\g<ft>\s*,\s*\g<ft>\s*>|set\s*<\s*\g<ft>\s*>|list\s*<\s*\g<ft>\s*>\s*cpp_type|[a-zA-Z_][\w.]*)(?:\s+([a-zA-Z_][\w.]*))?)?/,
        1 => 'keyword.other.typedef.thrift',
        2 => 'storage.type.typedef.thrift',
        3 => 'variable.other.typedef.thrift'
      to %r/$|^/
      include "#comments"
    end
    rule 'meta.union.thrift' do
      from %r/(?<!\S)(union)(?!\S)(?:\s+([a-zA-Z_][\w.]*)\s*(?![^\s{]))?/,
        1 => 'keyword.other.union.thrift',
        2 => 'entity.name.type.union.thrift'
      to %r/(?<=\})|$/
      rule 'keyword.other.xsd-all.thrift' do
        match %r/(?<!\S)xsd_all(?!\S)/
      end
      rule do
        from %r/\{/,
          0 => 'punctuation.section.union.begin.thrift'
        to %r/\}/,
          0 => 'punctuation.section.union.end.thrift'
        include "#comments"
        include "#field"
      end
    end
    rule 'meta.enum.thrift' do
      from %r/(?<!\S)(enum)(?!\S)(?:\s+([a-zA-Z_][\w.]*)\s*(?![^\s{]))?/,
        1 => 'keyword.other.enum.thrift',
        2 => 'entity.name.type.enum.thrift'
      to %r/(?<=\})|$/
      rule do
        from %r/\{/,
          0 => 'punctuation.section.enum.begin.thrift'
        to %r/\}/,
          0 => 'punctuation.section.enum.end.thrift'
        rule do
          match %r/(?<!\S)([a-zA-Z_][\w.]*)(?:\s*=\s*(\d*)(?:\s*[,;])?)?/,
            1 => 'variable.other.enum.thrift',
            2 => 'constant.numeric.integer.thrift'
        end
        include "#comments"
        rule 'invalid.illegal.thrift' do
          match %r/\S/
        end
      end
    end
    rule 'meta.senum.thrift' do
      from %r/(?<!\S)(senum)(?!\S)(?:\s+([a-zA-Z_][\w.]*)\s*(?![^\s{]))?/,
        1 => 'keyword.other.senum.thrift',
        2 => 'entity.name.type.senum.thrift'
      to %r/(?<=\})|$/
      rule do
        from %r/\{/,
          0 => 'punctuation.section.senum.begin.thrift'
        to %r/\}/,
          0 => 'punctuation.section.senum.end.thrift'
        rule do
          match %r/(?<!\S)([a-zA-Z_][\w.]*)(?:\s*[,;])?/,
            1 => 'variable.other.senum.thrift'
        end
        include "#comments"
        rule 'invalid.illegal.thrift' do
          match %r/\S/
        end
      end
    end
    rule 'meta.struct.thrift' do
      from %r/(?<!\S)(struct)(?!\S)(?:\s+([a-zA-Z_][\w.]*)\s*(?![^\s{]))?/,
        1 => 'keyword.other.struct.thrift',
        2 => 'entity.name.type.struct.thrift'
      to %r/(?<=\})|$/
      rule 'keyword.other.xsd-all.thrift' do
        match %r/(?<!\S)xsd_all(?!\S)/
      end
      rule do
        from %r/\{/,
          0 => 'punctuation.section.struct.begin.thrift'
        to %r/\}/,
          0 => 'punctuation.section.struct.end.thrift'
        include "#comments"
        include "#field"
      end
    end
    rule 'meta.exception.thrift' do
      from %r/(?<!\S)(exception)(?!\S)(?:\s+([a-zA-Z_][\w.]*)\s*(?![^\s{]))?/,
        1 => 'keyword.other.exception.thrift',
        2 => 'entity.name.type.exception.thrift'
      to %r/(?<=\})|$/
      rule do
        from %r/\{/,
          0 => 'punctuation.section.exception.begin.thrift'
        to %r/\}/,
          0 => 'punctuation.section.exception.end.thrift'
        include "#comments"
        include "#field"
      end
    end
    rule 'meta.service.thrift' do
      # FIXME: (warning) character class has duplicated range
      from %r/(?<!\S)(service)(?!\S)(?:\s+([a-zA-z_][\w.]*)(?:\s+(extends)(?:\s+([a-zA-Z_][\w.]*))?)?\s*(?![^\s{]))?/,
        1 => 'keyword.other.service.thrift',
        2 => 'entity.name.type.service.thrift',
        3 => 'keyword.other.service.extends.thrift',
        4 => 'entity.other.inherited-class.thrift'
      to %r/(?<=\})|$/
      rule do
        from %r/\{/,
          0 => 'punctuation.section.service.begin.thrift'
        to %r/\}/,
          0 => 'punctuation.section.service.end.thrift'
        include "#comments"
        rule 'meta.service.function.thrift' do
          from %r/(?x)(?<!\S)
                      (async(?!\S))?\s*
                      (?<ft>
                        map\s*<\s*\g<ft>\s*,\s*\g<ft>\s*> |
                        set\s*<\s*\g<ft>\s*> |
                        list\s*<\s*\g<ft>\s*>\s*(cpp_type(?!\S))? |
                        (?!async\b)[a-zA-Z_][\w.]*
                      )\s*
                      (?:
                        (?<!\S)([a-zA-Z_][\w.]*)\s*(?![^\s(])
                      )?/,
            1 => 'keyword.other.async.thrift',
            2 => 'storage.type.function.thrift',
            3 => 'keyword.other.cpp_type.thrift',
            4 => 'entity.name.function.thrift'
          to %r/$|^/
          rule do
            from %r/\(/,
              0 => 'punctuation.definition.arguments.begin.thrift'
            to %r/\)/,
              0 => 'punctuation.definition.arguments.end.thrift'
            include "#comments"
            include "#field"
          end
          rule do
            from %r/(?<![^\s)])(throws)(?![^\s(])/,
              1 => 'keyword.other.service.function.throws.thrift'
            to %r/$/
            rule do
              from %r/\(/,
                0 => 'punctuation.definition.arguments.begin.thrift'
              to %r/\)/,
                0 => 'punctuation.definition.arguments.end.thrift'
              include "#comments"
              include "#field"
            end
          end
          include "#comments"
        end
      end
    end
  end

  fragment :comments do
    rule do
      from %r/(^[ \t]+)?(?=#)/,
        1 => 'punctuation.whitespace.comment.leading.thrift'
      to %r/(?!\G)/
      rule 'comment.line.number-sign.thrift' do
        from %r/#/,
          0 => 'punctuation.definition.comment.thrift'
        to %r/\n/
      end
    end
    rule do
      from %r'(^[ \t]+)?(?=//)',
        1 => 'punctuation.whitespace.comment.leading.thrift'
      to %r/(?!\G)/
      rule 'comment.line.double-slash.thrift' do
        from %r'//',
          0 => 'punctuation.definition.comment.thrift'
        to %r/\n/
      end
    end
    rule 'comment.block.documentation.thrift' do
      from %r'/\*\*',
        0 => 'punctuation.definition.comment.begin.thrift'
      to %r'\*/',
        0 => 'punctuation.definition.comment.end.thrift'
    end
    rule 'comment.block.thrift' do
      from %r'/\*',
        0 => 'punctuation.definition.comment.begin.thrift'
      to %r'\*/',
        0 => 'punctuation.definition.comment.end.thrift'
    end
  end

  fragment :field do
    rule 'meta.field.thrift' do
      from %r/(?x)
            (?<![^\s{(])(?=\S)
            (\d+\s*:)?[ \t]*
            (?:  (required|optional)(?!\S)[ \t]*
            |  (?=\S)(?!=required|optional|\d)
            )/,
        1 => 'entity.other.field-id.thrift',
        2 => 'keyword.other.requiredness.thrift'
      to %r/[,;]|(?=[)#])|$/,
        0 => 'punctuation.separator.fields.thrift'
      rule do
        from %r/(?x)
              (?<ft>
                map\s*<\s*\g<ft>\s*,\s*\g<ft>\s*> |
                set\s*<\s*\g<ft>\s*> |
                list\s*<\s*\g<ft>\s*>\s*(cpp_type(?!\S))? |
                [a-zA-Z_][\w.]*
              )[ \t]*
              (?:([a-zA-Z_][\w.]*)[ \t]*)? # identifier
              /,
          1 => 'storage.type.field.thrift',
          2 => 'keyword.other.cpp-type.thrift',
          3 => 'variable.other.field-name.thrift'
        to %r/(?=[,;]|[)#])|$/
        rule do
          from %r/=/
          to %r/(?=[,;]|[)#])|$/
          rule 'keyword.other.xsd_optional.thrift' do
            match %r/(?<!\S)(xsd_optional)\b/
          end
          rule 'keyword.other.xsd_nillable.thrift' do
            match %r/(?<!\S)(xsd_nillable)\b/
          end
          include "#value"
        end
      end
    end
  end

  fragment :value do
    rule 'constant.numeric.float.thrift' do
      match %r/[+-]?\d*\.\d+([eE][+-]?\d+)?/
    end
    rule 'constant.numeric.integer.thrift' do
      match %r/[+-]?\d+/
    end
    rule 'constant.other.const-data.thrift' do
      match %r/[a-zA-Z_][\w.]*/
    end
    rule 'string.quoted.single.thrift' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.thrift'
      to %r/'/,
        0 => 'punctuation.definition.string.end.thrift'
    end
    rule 'string.quoted.double.thrift' do
      from %r/"/
      to %r/"/
      both 0 => 'punctuation.definition.string.begin.thrift'
    end
    rule 'meta.array.thrift' do
      from %r/\[/,
        0 => 'punctuation.definition.array.begin.thrift'
      to %r/\]/,
        0 => 'punctuation.definition.array.end.thrift'
      rule do
        match %r/[,;]/
      end
      include "#value"
    end
    rule 'meta.map.thrift' do
      from %r/\{/,
        0 => 'punctuation.definition.map.begin.thrift'
      to %r/\}/,
        0 => 'punctuation.definition.map.end.thrift'
      rule do
        match %r/[:,;]/
      end
      include "#value"
    end
    rule 'invalid.illegal.thrift' do
      match %r/\S/
    end
  end
end
