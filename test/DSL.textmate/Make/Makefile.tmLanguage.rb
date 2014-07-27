# encoding: utf-8

language 'Makefile' => 'source.makefile' do
  file_types %w(Makefile makefile GNUmakefile OCamlMakefile)
  uuid "FF1825E8-6B1C-11D9-B883-000D93589AF6"  # TextMate only

  include "#comment"
  include "#variable-assignment"
  include "#recipe"
  include "#directives"

  fragment :comment do
    rule do
      from %r/(^[ \t]+)?(?=#)/,
        1 => 'punctuation.whitespace.comment.leading.makefile'
      to %r/(?!\G)/
      rule 'comment.line.number-sign.makefile' do
        from %r/#/,
          0 => 'punctuation.definition.comment.makefile'
        to %r/\n/
        rule 'constant.character.escape.continuation.makefile' do
          match %r/\\\n/
        end
      end
    end
  end

  fragment :directives do
    rule do
      from %r/^[ ]*([s\-]?include)\b/,
        1 => 'keyword.control.include.makefile'
      to %r/^/
      include "#comment"
      include "#variables"
      rule 'constant.other.placeholder.makefile' do
        match %r/%/
      end
    end
    rule do
      from %r/^[ ]*(vpath)\b/,
        1 => 'keyword.control.vpath.makefile'
      to %r/^/
      include "#comment"
      include "#variables"
      rule 'constant.other.placeholder.makefile' do
        match %r/%/
      end
    end
    rule 'meta.scope.conditional.makefile' do
      from %r/^(?:(override)\s*)?(define)\s*([^\s]+)\s*(=|\?=|:=|\+=)?(?=\s)/
      to %r/^(endef)\b/
      both 1 => 'keyword.control.override.makefile',
           2 => 'keyword.control.define.makefile',
           3 => 'variable.other.makefile',
           4 => 'punctuation.separator.key-value.makefile'
      rule do
        from %r/\G(?!\n)/
        to %r/^/
        include "#comment"
      end
      include "#variables"
      include "#comment"
    end
    rule do
      from %r/^[ ]*(export)\b/,
        1 => 'keyword.control.$1.makefile'
      to %r/^/
      include "#comment"
      include "#variable-assignment"
      rule 'variable.other.makefile' do
        match %r/[^\s]+/
      end
    end
    rule do
      from %r/^[ ]*(override|private)\b/,
        1 => 'keyword.control.$1.makefile'
      to %r/^/
      include "#comment"
      include "#variable-assignment"
    end
    rule do
      from %r/^[ ]*(unexport|undefine)\b/,
        1 => 'keyword.control.$1.makefile'
      to %r/^/
      include "#comment"
      rule 'variable.other.makefile' do
        match %r/[^\s]+/
      end
    end
    rule 'meta.scope.conditional.makefile' do
      from %r/^(ifdef|ifndef)\s*([^\s]+)(?=\s)/
      to %r/^(endif)\b/
      both 1 => 'keyword.control.$1.makefile',
           2 => 'variable.other.makefile',
           3 => 'punctuation.separator.key-value.makefile'
      rule do
        from %r/\G(?!\n)/
        to %r/^/
        include "#comment"
      end
      include "$self"
    end
    rule 'meta.scope.conditional.makefile' do
      from %r/^(ifeq|ifneq)(?=\s)/
      to %r/^(endif)\b/
      both 1 => 'keyword.control.$1.makefile'
      rule 'meta.scope.condition.makefile' do
        from %r/\G/
        to %r/^/
        include "#variables"
        include "#comment"
      end
      rule do
        from %r/^else(?=\s)/,
          0 => 'keyword.control.else.makefile'
        to %r/^/
      end
      include "$self"
    end
  end

  fragment :interpolation do
    rule 'meta.embedded.line.shell' do
      from %r/(?=`)/
      to %r/(?!\G)/
      rule 'string.interpolated.backtick.makefile' do
        content_scope "source.shell"
        from %r/`/,
          0 => 'punctuation.definition.string.makefile'
        to %r/(`)/,
          0 => 'punctuation.definition.string.makefile',
          1 => 'source.shell'
        include "source.shell"
      end
    end
  end

  fragment :recipe do
    rule 'meta.scope.target.makefile' do
      from %r/^(?!\t)([^:]*)(:)(?!\=)/,
        2 => 'punctuation.separator.key-value.makefile'
      to %r/^(?!\t)/
      rule 'meta.scope.prerequisites.makefile' do
        from %r/\G/
        to %r/^/
        rule 'constant.character.escape.continuation.makefile' do
          match %r/\\\n/
        end
        rule 'constant.other.placeholder.makefile' do
          match %r/%|\*/
        end
        include "#comment"
        include "#variables"
      end
      rule 'meta.scope.recipe.makefile' do
        from %r/^\t/
        to %r//
        rule do
          match %r/.+\n?/
        end
      end
    end
  end

  fragment :"variable-assignment" do
    rule do
      from %r/(^[ ]*|\G\s*)([^\s]+)\s*(=|\?=|:=|\+=)/,
        2 => 'variable.other.makefile',
        3 => 'punctuation.separator.key-value.makefile'
      to %r/\n/
      rule 'constant.character.escape.continuation.makefile' do
        match %r/\\\n/
      end
      include "#comment"
      include "#variables"
      include "#interpolation"
    end
  end

  fragment :variables do
    rule 'variable.language.makefile' do
      match %r/(\$?\$)[@%<?^+*]/,
        1 => 'punctuation.definition.variable.makefile'
    end
    rule 'string.interpolated.makefile' do
      from %r/\$?\$\(/
      to %r/\)/
      both 0 => 'punctuation.definition.variable.makefile'
      include "#variables"
      rule 'variable.language.makefile' do
        match %r/\G(MAKEFILES|VPATH|SHELL|MAKESHELL|MAKE|MAKELEVEL|MAKEFLAGS|MAKECMDGOALS|CURDIR|SUFFIXES|\.LIBPATTERNS)(?=\s*\))/
      end
      rule 'meta.scope.function-call.makefile' do
        from %r/\G(subst|patsubst|strip|findstring|filter(-out)?|sort|word(list)?|firstword|lastword|dir|notdir|suffix|basename|addprefix|join|wildcard|realpath|abspath|info|error|warning|shell|foreach|if|or|and|call|eval|value)\s/,
          1 => 'support.function.$1.makefile'
        to %r/(?=\))/
        include "#variables"
        rule 'constant.other.placeholder.makefile' do
          match %r/%|\*/
        end
      end
      rule 'meta.scope.function-call.makefile' do
        content_scope "variable.other.makefile"
        from %r/\G(origin|flavor)\s(?=[^\s)]+\s*\))/
        to %r/\)/
        include "#variables"
      end
      rule 'variable.other.makefile' do
        from %r/\G(?!\))/
        to %r/(?=\))/
        include "#variables"
      end
    end
  end
end
