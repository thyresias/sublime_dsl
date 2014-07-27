# encoding: utf-8

language 'Ruby Haml' => 'text.haml' do
  file_types %w(haml sass)
  folding_start_marker %r/^\s*([-%#\:\.\w\=].*)\s$/
  folding_stop_marker %r/^\s*$/
  key_equivalent "^~H"  # TextMate only
  uuid "3D727049-DD05-45DF-92A5-D50EA36FD035"  # TextMate only

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
