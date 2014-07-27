# encoding: utf-8

language 'XSL' => 'text.xml.xsl' do
  file_types %w(xsl xslt)
  folding_start_marker %r'^\s*(<[^!?%/](?!.+?(/>|</.+?>))|<[!%]--(?!.+?--%?>)|<%[!]?(?!.+?%>))'
  folding_stop_marker %r'^\s*(</[^>]+>|[/%]>|-->)\s*$'
  key_equivalent "^~X"  # TextMate only
  uuid "DB8033A1-6D8E-4D80-B8A2-8768AAC6125D"  # TextMate only

  rule 'meta.tag.xml.template' do
    from %r/(<)(xsl)((:))(template)/
    to %r/(>)/
    both 1 => 'punctuation.definition.tag.xml',
         2 => 'entity.name.tag.namespace.xml',
         3 => 'entity.name.tag.xml',
         4 => 'punctuation.separator.namespace.xml',
         5 => 'entity.name.tag.localname.xml'
    rule do
      match %r/ (?:([-_a-zA-Z0-9]+)((:)))?([a-zA-Z-]+)/,
        1 => 'entity.other.attribute-name.namespace.xml',
        2 => 'entity.other.attribute-name.xml',
        3 => 'punctuation.separator.namespace.xml',
        4 => 'entity.other.attribute-name.localname.xml'
    end
    include "#doublequotedString"
    include "#singlequotedString"
  end
  include "text.xml"

  fragment :doublequotedString do
    rule 'string.quoted.double.xml' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.xml'
      to %r/"/,
        0 => 'punctuation.definition.string.end.xml'
    end
  end

  fragment :singlequotedString do
    rule 'string.quoted.single.xml' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.xml'
      to %r/'/,
        0 => 'punctuation.definition.string.end.xml'
    end
  end
end
