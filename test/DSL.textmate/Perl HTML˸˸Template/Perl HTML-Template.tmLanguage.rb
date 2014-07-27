# encoding: utf-8

language 'Perl HTML-Template' => 'text.html.html-template' do
  file_types %w(tmpl)
  first_line_match %r/<(?i:TMPL)_.+?>/
  key_equivalent "^~H"  # TextMate only
  uuid "79287EAC-597A-480D-974C-837440298571"  # TextMate only

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

  fragment :"html-template-stuff" do
    rule 'keyword.control.html-template' do
      match %r/\b(?i:NAME|ESCAPE|DEFAULT|)\b/
    end
    rule 'punctuation.separator.key-value.html-template' do
      match %r/=/
    end
    include "#string-double-quoted"
    include "#string-single-quoted"
    include "#keyword"
  end

  fragment :keyword do
    rule 'string.unquoted.html-template' do
      match %r/\b([A-Za-z0-9_]+)/
    end
  end

  fragment :"string-double-quoted" do
    rule 'string.quoted.double.html-template' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.html-template'
      to %r/"/,
        0 => 'punctuation.definition.string.end.html-template'
      include "#embedded-code"
      include "#entities"
    end
  end

  fragment :"string-single-quoted" do
    rule 'string.quoted.single.html-template' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.html-template'
      to %r/'/,
        0 => 'punctuation.definition.string.end.html-template'
      include "#embedded-code"
      include "#entities"
    end
  end

  fragment :"tmpl-container-tag" do
    rule 'meta.tag.template.html-template' do
      from %r'</?(?i:TMPL_(?:IF|UNLESS|ELSE|VAR|INCLUDE|LOOP))'
      to %r/>/
      both 0 => 'punctuation.definition.tag.html-template'
      include "#html-template-stuff"
    end
    rule 'invalid.illegal.tag.template.html-template' do
      from %r'</?(?i:TMPL_(?!IF|UNLESS|ELSE|VAR|INCLUDE|LOOP))'
      to %r/>/
    end
  end
end
