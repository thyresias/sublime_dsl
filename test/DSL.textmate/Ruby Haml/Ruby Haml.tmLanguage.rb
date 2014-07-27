# encoding: utf-8

language 'Ruby Haml' => 'text.haml' do
  file_types %w(haml sass)
  key_equivalent "^~H"  # TextMate only
  uuid "3D727049-DD05-45DF-92A5-D50EA36FD035"  # TextMate only

  rule do
    content_scope "string.quoted.double.ruby"
    from %r/^\s*==/
    to %r/$\n?/
    include "#interpolated_ruby"
  end
  rule 'meta.prolog.haml' do
    match %r/^(!!!)($|\s.*)/,
      1 => 'punctuation.definition.prolog.haml'
  end
  rule 'comment.line.slash.haml' do
    match %r'^ *(/)\s*\S.*$\n?',
      1 => 'punctuation.section.comment.haml'
  end
  rule 'comment.block.haml' do
    from %r'^( *)(/)\s*$',
      2 => 'punctuation.section.comment.haml'
    to %r/^(?!§1  )/
    include "text.haml"
  end
  rule do
    from %r/^\s*(?:((%)([\w:]+))|(?=\.|#))/
    to %r'$|(?!\.|#|\{|\[|=|-|~|/)'
    both 1 => 'meta.tag.haml',
         2 => 'punctuation.definition.tag.haml',
         3 => 'entity.name.tag.haml'
    rule do
      content_scope "string.quoted.double.ruby"
      from %r/==/
      to %r/$\n?/
      include "#interpolated_ruby"
    end
    rule 'entity.name.tag.class.haml' do
      match %r/\.[\w-]+/
    end
    rule 'entity.name.tag.id.haml' do
      match %r/#[\w-]+/
    end
    rule 'meta.section.attributes.haml' do
      from %r/\{(?=.*\}|.*\|\s*$)/
      to %r/\}|$|^(?!.*\|\s*$)/
      include "source.ruby.rails"
      include "#continuation"
    end
    rule 'meta.section.object.haml' do
      from %r/\[(?=.*\]|.*\|\s*$)/
      to %r/\]|$|^(?!.*\|\s*$)/
      include "source.ruby.rails"
      include "#continuation"
    end
    include "#rubyline"
    rule 'punctuation.terminator.tag.haml' do
      match %r'/'
    end
  end
  rule do
    match %r/^\s*(\\.)/,
      1 => 'meta.escape.haml'
  end
  rule do
    from %r/^\s*(?==|-|~)/
    to %r/$/
    include "#rubyline"
  end

  fragment :continuation do
    rule do
      match %r/(\|)\s*\n/,
        1 => 'punctuation.separator.continuation.haml'
    end
  end

  fragment :interpolated_ruby do
    rule 'source.ruby.embedded.source' do
      match %r/#\{(\})/,
        0 => 'punctuation.section.embedded.ruby',
        1 => 'source.ruby.embedded.source.empty'
    end
    rule 'source.ruby.embedded.source' do
      from %r/#\{/
      to %r/(\})/
      both 0 => 'punctuation.section.embedded.ruby'
      include "#nest_curly_and_self"
      include "source.ruby"
    end
    rule 'variable.other.readwrite.instance.ruby' do
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      match %r/(#@)[a-zA-Z_]\w*/,
        1 => 'punctuation.definition.variable.ruby'
    end
    rule 'variable.other.readwrite.class.ruby' do
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      match %r/(#@@)[a-zA-Z_]\w*/,
        1 => 'punctuation.definition.variable.ruby'
    end
    rule 'variable.other.readwrite.global.ruby' do
      match %r/(#\$)[a-zA-Z_]\w*/,
        1 => 'punctuation.definition.variable.ruby'
    end
  end

  fragment :nest_curly_and_self do
    rule do
      from %r/\{/
      to %r/\}/
      both 0 => 'punctuation.section.scope.ruby'
      include "#nest_curly_and_self"
    end
    include "source.ruby"
  end

  fragment :rubyline do
    rule 'meta.line.ruby.haml' do
      content_scope "source.ruby.embedded.haml"
      from %r/=|-|~/
      to %r/((do|\{)( \|[^|]+\|)?)$|$|^(?!.*\|\s*$)/,
        1 => 'source.ruby.embedded.html',
        2 => 'keyword.control.ruby.start-block'
      rule 'comment.line.number-sign.ruby' do
        # Hack to let ruby comments work in this context properly
        match %r/#.*$/
      end
      include "source.ruby.rails"
      include "#continuation"
    end
  end
end
