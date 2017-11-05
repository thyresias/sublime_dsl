# encoding: utf-8

language 'Movable Type (MT only)' => 'text.html.mt.pure' do
  file_types %w(mtml)
  first_line_match %r/<\$?[Mm][Tt]/
  key_equivalent "^~M"  # TextMate only
  uuid "AC9320E4-DE28-4D36-905D-AFBE099F7466"  # TextMate only

  include "#mt"

  fragment :"basic-html" do
    rule 'meta.tag.any.html' do
      from %r'(<)([a-zA-Z0-9:]+)(?=[^>]*></\2>)',
        1 => 'punctuation.definition.tag.html',
        2 => 'entity.name.tag.html'
      to %r'(>(<)/)(\2)(>)',
        1 => 'punctuation.definition.tag.html',
        2 => 'meta.scope.between-tag-pair.html',
        3 => 'entity.name.tag.html',
        4 => 'punctuation.definition.tag.html'
      include "#tag-stuff"
    end
  end

  fragment :"embedded-code" do
    include "#mt"
    include "#php"
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

  fragment :mt do
    include "#trans-tag"
    include "#mt-container-tag"
    include "#mt-variable-tag"
    include "#basic-html"
    # FIXME: no "match" nor "begin/end"
    rule do
      # text.html.basic
    end
  end

  fragment :"mt-container-tag" do
    rule 'meta.tag.mt.container.html' do
      # FIXME: (warning) nested repeat operator '+' and '?' was replaced with '*' in regular expression
      from %r'(</?)([mM][tT]:?(?:\w+)?:?\w+)',
        1 => 'punctuation.definition.tag.mt',
        2 => 'entity.name.tag.mt'
      to %r/>/,
        0 => 'punctuation.definition.tag.mt'
      include "#tag-stuff"
    end
  end

  fragment :"mt-variable-tag" do
    rule 'meta.tag.mt.variable.html' do
      # FIXME: (warning) nested repeat operator '+' and '?' was replaced with '*' in regular expression
      from %r/(<)(\$[mM][tT]:?(?:\w+)?:?\w+)/,
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
      from %r/<\?(php|=)?/
      to %r/\?>/
      both 0 => 'punctuation.section.embedded.php'
      include "#php-source"
    end
  end

  fragment :"php-source" do
    include "source.php"
  end

  # FIXME: this fragment is never referenced
  fragment :"string-double-quoted" do
    rule 'string.quoted.double.html' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.html'
      to %r/"/,
        0 => 'punctuation.definition.string.end.html'
      include "#embedded-code"
      include "#entities"
    end
  end

  # FIXME: this fragment is never referenced
  fragment :"string-single-quoted" do
    rule 'string.quoted.single.html' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.html'
      to %r/'/,
        0 => 'punctuation.definition.string.end.html'
      include "#embedded-code"
      include "#entities"
    end
  end

  # FIXME: this fragment is never referenced
  fragment :"tag-generic-attribute" do
    rule 'entity.other.attribute-name.html' do
      # FIXME: (warning) character class has '-' without escape
      match %r/\b([a-zA-Z-_:]+)/
    end
  end

  # FIXME: this fragment is never referenced
  fragment :"tag-id-attribute" do
    rule 'meta.attribute-with-value.id.html' do
      from %r/\b(id)\b\s*(=)/
      to %r/(?<='|")/
      both 1 => 'entity.other.attribute-name.id.html',
           2 => 'punctuation.separator.key-value.html'
      rule 'string.quoted.double.html' do
        content_scope "meta.toc-list.id.html"
        from %r/"/,
          0 => 'punctuation.definition.string.begin.html'
        to %r/"/,
          0 => 'punctuation.definition.string.end.html'
        include "#embedded-code"
        include "#entities"
      end
      rule 'string.quoted.single.html' do
        content_scope "meta.toc-list.id.html"
        from %r/'/,
          0 => 'punctuation.definition.string.begin.html'
        to %r/'/,
          0 => 'punctuation.definition.string.end.html'
        include "#embedded-code"
        include "#entities"
      end
    end
  end

  fragment :"tag-stuff" do
    include "#embedded-code"
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
