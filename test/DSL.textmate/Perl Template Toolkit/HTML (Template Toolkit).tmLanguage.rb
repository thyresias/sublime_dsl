# encoding: utf-8

language 'HTML (Template Toolkit)' => 'text.html.tt' do
  file_types %w(tt)
  first_line_match %r/\[%.+?%\]/
  key_equivalent "^~T"  # TextMate only
  uuid "67D0DEC7-9E8C-44B3-8FA5-ADD9BBA05DE3"  # TextMate only

  rule do
    from %r/(^\s*)?(?=\[% *(?:RAW)?PERL\b.*? *%\])/,
      0 => 'punctuation.whitespace.embedded.leading.perl'
    to %r/(?!\G)(\s*\n)?/,
      0 => 'punctuation.whitespace.embedded.trailing.perl'
    rule 'meta.embedded.block.perl' do
      from %r/(?=\[% *(?:RAW)?PERL\b.*? *%\])/
      to %r/(\[%) *(END) *(%\])/,
        0 => 'meta.tag.template.tt',
        1 => 'punctuation.definition.tag.tt',
        2 => 'entity.name.tag.tt',
        3 => 'punctuation.definition.tag.tt'
      rule do
        from %r/(?=\[% *(?:RAW)?PERL\b.*? *%\])/
        to %r/(?!\G)/
        include "#tmpl-container-tag"
      end
      rule 'source.perl' do
        from %r/(?!\G)/
        to %r/(?=\[% *(END) *%\])/
        include "#tmpl-container-tag"
        include "source.perl"
      end
    end
  end
  include "#tmpl-container-tag"
  include "text.html.basic"

  fragment :"embedded-code" do
    # FIXME: no "match" nor "begin/end"
    rule do
    end
  end

  fragment :entities do
    rule 'constant.character.entity.html' do
      match %r/(&)([a-zA-Z0-9]+|#[0-9]+|#x[0-9a-fA-F]+)(;)/,
        1 => 'punctuation.definition.constant.html',
        3 => 'punctuation.definition.constant.html'
    end
    rule 'invalid.illegal.bad-ampersand.html' do
      match %r/&/
    end
  end

  fragment :keyword do
    rule 'string.unquoted.tt' do
      match %r/\b([A-Za-z0-9_]+)/
    end
  end

  fragment :"string-double-quoted" do
    rule 'string.quoted.double.tt' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.tt'
      to %r/"/,
        0 => 'punctuation.definition.string.end.tt'
      include "#embedded-code"
      include "#entities"
    end
  end

  fragment :"string-single-quoted" do
    rule 'string.quoted.single.tt' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.tt'
      to %r/'/,
        0 => 'punctuation.definition.string.end.tt'
      include "#embedded-code"
      include "#entities"
    end
  end

  fragment :"tag-generic-attribute" do
    rule 'entity.other.attribute-name.tt' do
      # FIXME: (warning) character class has '-' without escape
      match %r/\b([a-zA-Z-_:]+)\s*(=)/,
        2 => 'punctuation.separator.key-value.tt'
    end
  end

  # FIXME: this fragment is never referenced
  fragment :"tag-stuff" do
    include "#tag-generic-attribute"
    include "#string-double-quoted"
    include "#string-single-quoted"
    include "#keyword"
  end

  fragment :"tmpl-container-tag" do
    rule 'meta.tag.template.tt' do
      from %r/\[%/
      to %r/%\]/
      both 0 => 'punctuation.definition.tag.tt'
      include "#tt-stuff"
    end
  end

  fragment :"tt-stuff" do
    rule 'comment.line.number-sign.tt' do
      match %r/(#).*?(?=%\])/,
        1 => 'punctuation.definition.comment.tt'
    end
    rule do
      match %r'((")([a-z][a-z0-9_]+\/)+[a-z0-9_\.]+("))|(\b([a-z][a-z0-9_]+\/)+[a-z0-9_\.]+\b)',
        1 => 'string.quoted.double.filename.tt',
        2 => 'punctuation.definition.string.begin.tt',
        4 => 'punctuation.definition.string.begin.tt',
        5 => 'string.unquoted.other.filename.tt'
    end
    include "#string-double-quoted"
    include "#string-single-quoted"
    rule 'variable.other.tt' do
      match %r/(\$?)\b[a-z]([a-z0-9_]\.?)*\b/,
        1 => 'punctuation.definition.variable.tt'
    end
    rule 'keyword.control.tt' do
      match %r/\b(?:IF|END|BLOCK|INCLUDE|ELSE|ELSIF|SWITCH|CASE|UNLESS|WRAPPER|FOR|FOREACH|LAST|NEXT|USE|WHILE|FILTER|IN|GET|CALL|SET|INSERT|MACRO|PERL|TRY|CATCH|THROW|FINAL|STOP|META|DEBUG|RAWPERL)\b/
    end
    rule 'keyword.operator.tt' do
      match %r'\||\|\||=|_|-|\*|\/|\?|:|div|mod|;|\+'
    end
  end
end
