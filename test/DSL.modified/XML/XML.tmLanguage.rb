# encoding: utf-8

language 'XML' => 'text.xml' do
  file_types %w(xml tld jsp pt cpt dtml rss opml)
  folding_start_marker %r'^\s*(<[^!?%/](?!.+?(/>|</.+?>))|<[!%]--(?!.+?--%?>)|<%[!]?(?!.+?%>))'
  folding_stop_marker %r'^\s*(</[^>]+>|[/%]>|-->)\s*$'
  key_equivalent "^~X"  # TextMate only
  uuid "D3C4E6DA-6B1C-11D9-8CC2-000D93589AF6"  # TextMate only

  rule 'meta.tag.preprocessor.xml' do
    from %r/(<\?)\s*([-_a-zA-Z0-9]+)/
    to %r/(\?>)/
    both 1 => 'punctuation.definition.tag.begin.xml',
         2 => 'entity.name.tag.xml'
    rule 'entity.other.attribute-name.xml' do
      match %r/ ([a-zA-Z-]+)/
    end
    include "#doublequotedString"
    include "#singlequotedString"
  end
  rule 'meta.tag.sgml.doctype.xml' do
    from %r/(<!)(DOCTYPE)\s+([:a-zA-Z_][:a-zA-Z0-9_.-]*)/
    to %r/\s*(>)/
    both 1 => 'punctuation.definition.tag.begin.xml',
         2 => 'keyword.doctype.xml',
         3 => 'variable.documentroot.xml'
    include "#internalSubset"
  end
  rule 'comment.block.xml' do
    from %r/<[!%]--/
    to %r/--%?>/
    both 0 => 'punctuation.definition.comment.xml'
  end
  rule 'meta.tag.no-content.xml' do
    from %r'(<)((?:([-_a-zA-Z0-9]+)((:)))?([-_a-zA-Z0-9:]+))(?=(\s[^>]*)?></\2>)',
      1 => 'punctuation.definition.tag.begin.xml',
      3 => 'entity.name.tag.namespace.xml',
      4 => 'entity.name.tag.xml',
      5 => 'punctuation.separator.namespace.xml',
      6 => 'entity.name.tag.localname.xml'
    to %r'(>)(<)(/)(?:([-_a-zA-Z0-9]+)((:)))?([-_a-zA-Z0-9:]+)(>)',
      1 => 'punctuation.definition.tag.end.xml',
      2 => 'punctuation.definition.tag.begin.xml meta.scope.between-tag-pair.xml',
      3 => 'punctuation.definition.tag.begin.xml',
      4 => 'entity.name.tag.namespace.xml',
      5 => 'entity.name.tag.xml',
      6 => 'punctuation.separator.namespace.xml',
      7 => 'entity.name.tag.localname.xml',
      8 => 'punctuation.definition.tag.end.xml'
    include "#tagStuff"
  end
  rule 'meta.tag.xml' do
    from %r'(</?)(?:([-_a-zA-Z0-9]+)((:)))?([-_a-zA-Z0-9:]+)',
      1 => 'punctuation.definition.tag.begin.xml'
    to %r'(/?>)',
      1 => 'punctuation.definition.tag.end.xml'
    both 2 => 'entity.name.tag.namespace.xml',
         3 => 'entity.name.tag.xml',
         4 => 'punctuation.separator.namespace.xml',
         5 => 'entity.name.tag.localname.xml'
    include "#tagStuff"
  end
  include "#entity"
  include "#bare-ampersand"
  rule 'source.java-props.embedded.xml' do
    from %r/<%@/,
      0 => 'punctuation.section.embedded.begin.xml'
    to %r/%>/,
      0 => 'punctuation.section.embedded.end.xml'
    rule 'keyword.other.page-props.xml' do
      match %r/page|include|taglib/
    end
  end
  rule 'source.java.embedded.xml' do
    from %r/<%[!=]?(?!--)/,
      0 => 'punctuation.section.embedded.begin.xml'
    to %r/(?!--)%>/,
      0 => 'punctuation.section.embedded.end.xml'
    include "source.java"
  end
  rule 'string.unquoted.cdata.xml' do
    from %r/<!\[CDATA\[/,
      0 => 'punctuation.definition.string.begin.xml'
    to %r/\]\]>/,
      0 => 'punctuation.definition.string.end.xml'
  end

  fragment :EntityDecl do
    rule do
      from %r/(<!)(ENTITY)\s+(%\s+)?([:a-zA-Z_][:a-zA-Z0-9_.-]*)(\s+(?:SYSTEM|PUBLIC)\s+)?/
      to %r/(>)/
      both 1 => 'punctuation.definition.tag.begin.xml',
           2 => 'keyword.entity.xml',
           3 => 'punctuation.definition.entity.xml',
           4 => 'variable.entity.xml',
           5 => 'keyword.entitytype.xml'
      include "#doublequotedString"
      include "#singlequotedString"
    end
  end

  fragment :"bare-ampersand" do
    rule 'invalid.illegal.bad-ampersand.xml' do
      match %r/&/
    end
  end

  fragment :doublequotedString do
    rule 'string.quoted.double.xml' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.xml'
      to %r/"/,
        0 => 'punctuation.definition.string.end.xml'
      include "#entity"
      include "#bare-ampersand"
    end
  end

  fragment :entity do
    rule 'constant.character.entity.xml' do
      match %r/(&)([:a-zA-Z_][:a-zA-Z0-9_.-]*|#[0-9]+|#x[0-9a-fA-F]+)(;)/,
        1 => 'punctuation.definition.constant.xml',
        3 => 'punctuation.definition.constant.xml'
    end
  end

  fragment :internalSubset do
    rule 'meta.internalsubset.xml' do
      from %r/(\[)/
      to %r/(\])/
      both 1 => 'punctuation.definition.constant.xml'
      include "#EntityDecl"
      include "#parameterEntity"
    end
  end

  fragment :parameterEntity do
    rule 'constant.character.parameter-entity.xml' do
      match %r/(%)([:a-zA-Z_][:a-zA-Z0-9_.-]*)(;)/,
        1 => 'punctuation.definition.constant.xml',
        3 => 'punctuation.definition.constant.xml'
    end
  end

  fragment :singlequotedString do
    rule 'string.quoted.single.xml' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.xml'
      to %r/'/,
        0 => 'punctuation.definition.string.end.xml'
      include "#entity"
      include "#bare-ampersand"
    end
  end

  fragment :tagStuff do
    rule do
      match %r/ (?:([-_a-zA-Z0-9]+)((:)))?([-_a-zA-Z0-9]+)=/,
        1 => 'entity.other.attribute-name.namespace.xml',
        2 => 'entity.other.attribute-name.xml',
        3 => 'punctuation.separator.namespace.xml',
        4 => 'entity.other.attribute-name.localname.xml'
    end
    include "#doublequotedString"
    include "#singlequotedString"
  end
end
