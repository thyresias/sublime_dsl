# encoding: utf-8

language 'Movable Type' => 'text.html.mt' do
  file_types %w(mtml)
  first_line_match %r/<\$?[Mm][Tt]/
  key_equivalent "^~M"  # TextMate only
  uuid "7071B5CA-849A-4D88-A96E-DD725ED622BF"  # TextMate only

  include "#trans-tag"
  include "#mt-container-tag"
  include "#mt-variable-tag"
  # This is set to use XHTML standards, but you can change that by changing .strict to .basic for HTML standards
  include "text.html.basic"
  rule 'source.smarty.embedded.html' do
    from %r/{{/
    to %r/}}/
    both 0 => 'punctuation.section.embedded.smarty'
    include "source.smarty"
  end

  fragment :"embedded-code" do
    include "#php"
    include "#ruby"
    include "#smarty"
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

  fragment :"mt-container-tag" do
    rule 'meta.tag.mt.container.html' do
      from %r'(</?)([Mm][Tt]:?(\w+:)?\w+)',
        1 => 'punctuation.definition.tag.mt',
        2 => 'entity.name.tag.mt'
      to %r/>/,
        0 => 'punctuation.definition.tag.mt'
      include "#tag-stuff"
    end
  end

  fragment :"mt-variable-tag" do
    rule 'meta.tag.mt.variable.html' do
      from %r/(<)(\$[Mm][Tt]:?(\w+:)?\w+)/,
        1 => 'punctuation.definition.tag.mt',
        2 => 'variable.other.mt'
      to %r/(\$)?(>)/,
        1 => 'variable.other.mt',
        2 => 'punctuation.definition.tag.mt'
      include "#tag-stuff"
    end
  end

  fragment :php do
    rule 'source.php.embedded.html' do
      # match only multi-line PHP with leading whitespace
      from %r/(?:^\s*)(<\?(php|=)?)(?!.*\?>)/
      to %r/(\?>)(?:\s*$\n)?/
      both 1 => 'punctuation.section.embedded.php'
      include "#php-source"
    end
    rule 'source.php.embedded.html' do
      from %r/<\?(php|=)?/
      to %r/\?>/
      both 0 => 'punctuation.section.embedded.php'
      include "#php-source"
    end
  end

  fragment :"php-source" do
    rule 'comment.line.number-sign.ruby' do
      match %r/(#).*?(?=\?>)/,
        1 => 'punctuation.definition.comment.php'
    end
    rule 'comment.line.double-slash.ruby' do
      match %r'(//).*?(?=\?>)',
        1 => 'punctuation.definition.comment.php'
    end
    include "source.php"
  end

  fragment :ruby do
    rule 'source.ruby.embedded.html' do
      from %r/<%+(?!>)=?/
      to %r/-?%>/
      both 0 => 'punctuation.section.embedded.ruby'
      rule 'comment.line.number-sign.ruby' do
        match %r/(#).*?(?=-?%>)/,
          1 => 'punctuation.definition.comment.ruby'
      end
      include "source.ruby"
    end
  end

  fragment :smarty do
    rule 'source.smarty.embedded.xhtml' do
      disabled true
      from %r/{{|{/
      to %r/}}|}/
      both 0 => 'punctuation.section.embedded.smarty'
      include "source.smarty"
    end
  end

  fragment :"string-double-quoted" do
    rule 'string.quoted.double.html' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.html'
      to %r/"/,
        0 => 'punctuation.definition.string.end.html'
      include "#trans-tag"
      include "#mt-variable-tag"
      include "#mt-container-tag"
      include "#embedded-code"
      include "#entities"
    end
  end

  fragment :"string-single-quoted" do
    rule 'string.quoted.single.html' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.html'
      to %r/'/,
        0 => 'punctuation.definition.string.end.html'
      include "#trans-tag"
      include "#mt-variable-tag"
      include "#mt-container-tag"
      include "#embedded-code"
      include "#entities"
    end
  end

  fragment :"tag-generic-attribute" do
    rule 'entity.other.attribute-name.html' do
      # FIXME: (warning) character class has '-' without escape
      match %r/\b([a-zA-Z-_:]+)/
    end
  end

  fragment :"tag-stuff" do
    include "#trans-tag"
    include "#tag-generic-attribute"
    include "#string-double-quoted"
    include "#string-single-quoted"
  end

  fragment :"trans-tag" do
    rule 'meta.tag.mt.trans.html' do
      from %r/(<)(__trans)/,
        1 => 'punctuation.definition.tag.mt',
        2 => 'variable.other.mt'
      to %r/(>)/,
        1 => 'variable.other.mt',
        2 => 'punctuation.definition.tag.mt'
      include "#tag-stuff"
    end
  end
end
