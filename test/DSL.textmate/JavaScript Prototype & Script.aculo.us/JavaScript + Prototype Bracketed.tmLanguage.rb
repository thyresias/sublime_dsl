# encoding: utf-8

language 'Prototype & Script.aculo.us (JavaScript) Bracketed' => 'source.js.prototype.bracketed', file: 'JavaScript + Prototype Bracketed' do
  # This is a wrapper for and adds nested bracket scopes to Prototype & Script.aculo.us (JavaScript). It also allow for embedded ruby source. By Thomas Aylott
  # FIXME: no file types
  key_equivalent "^~J"  # TextMate only
  uuid "1FD22341-8BAA-4F89-8257-92CBDD7DE29D"  # TextMate only

  rule 'meta.source.embedded.return-value' do
    from %r/<%=/,
      0 => 'punctuation.section.embedded.begin.js'
    to %r/%>/,
      0 => 'punctuation.section.embedded.end.js'
    rule 'source.ruby.rails.embedded.html' do
      from %r/(?<=<%=)/
      to %r/(?=%>)/
      include "source.ruby.rails"
    end
  end
  rule 'meta.source.embedded' do
    from %r/<%(?![=#])/,
      0 => 'punctuation.section.embedded.begin.js'
    to %r/%>/,
      0 => 'punctuation.section.embedded.end.js'
    rule 'source.ruby.rails.embedded.html' do
      from %r/(?<=<%)/
      to %r/(?=%>)/
      include "source.ruby.rails"
    end
  end
  include "#conditional-compilation"
  include "#round-brackets"
  include "source.js.prototype"

  fragment :"conditional-compilation" do
    rule 'comment.block.conditional.js' do
      from %r'/\*(?=@)'
      to %r'(?<=@)\*/'
      both 0 => 'punctuation.definition.comment.js'
      include "$base"
    end
    rule 'keyword.control.conditional.js' do
      match %r/(@)(if|elif|else|end)/,
        1 => 'punctuation.definition.keyword.js'
    end
    rule 'keyword.operator.conditional.js' do
      match %r/(@)(cc_on|set)/,
        1 => 'punctuation.definition.keyword.js'
    end
    rule 'variable.other.conditional.js' do
      match %r/(@)(_win32|_win16|_mac|_alpha|_x86|_mc680x0|_PowerPC|_jscript_build|_jscript_version|_jscript|_debug|_fast|[a-zA-Z]\w+)/,
        1 => 'punctuation.definition.variable.js'
    end
  end

  fragment :"round-brackets" do
    rule 'meta.group.braces.curly.function.js.prototype' do
      from %r/(?<=\))\s*+(\{)/
      to %r/(\})(,)?\s*/
      both 1 => 'punctuation.section.function.js.prototype',
           2 => 'punctuation.separator.objects.js.prototype'
      include "$base"
    end
    rule 'meta.group.braces.curly' do
      from %r/(\{)/,
        1 => 'punctuation.section.scope.begin.js'
      to %r/(\})(,)?\s*/,
        1 => 'punctuation.section.scope.end.js',
        2 => 'punctuation.separator.objects.js.prototype'
      rule do
        match %r/(,)\s*+(?=\})/,
          1 => 'invalid.illegal.delimiter.object.comma.js'
      end
      rule do
        match %r/((")([^"]*)(")\s*)(:)\s*+(?!function)/,
          1 => 'string.quoted.double.js.prototype',
          2 => 'punctuation.definition.string.js.prototype',
          3 => 'constant.other.object.key.js.prototype',
          4 => 'punctuation.definition.string.js.prototype',
          5 => 'punctuation.separator.objects.js.prototype'
      end
      rule do
        match %r/((')([^']*)(')\s*)(:)\s*+(?!function)/,
          1 => 'string.quoted.single.js.prototype',
          2 => 'punctuation.definition.string.js.prototype',
          3 => 'constant.other.object.key.js.prototype',
          4 => 'punctuation.definition.string.js.prototype',
          5 => 'punctuation.separator.objects.js.prototype'
      end
      rule do
        match %r/\b(\w+\b\s*)(:)\s*+(?!function)/,
          1 => 'constant.other.object.key.js.prototype',
          2 => 'punctuation.separator.objects.js.prototype'
      end
      include "$base"
    end
    rule 'meta.group.braces.round' do
      from %r/(\()(?!\))/
      to %r/(\))/
      both 1 => 'punctuation.section.scope.js'
      include "$base"
    end
    rule 'meta.group.braces.square' do
      from %r/(\[)(?!\])/
      to %r/(\])/
      both 1 => 'punctuation.section.scope.js'
      include "$base"
    end
  end
end
