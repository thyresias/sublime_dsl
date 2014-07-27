# encoding: utf-8

language 'XML strict' => 'text.xml.strict' do
  # FIXME: no file types
  folding_start_marker %r'^\s*(<[^!?%/](?!.+?(/>|</.+?>))|<[!%]--(?!.+?--%?>)|<%[!]?(?!.+?%>))'
  folding_stop_marker %r'^\s*(</[^>]+>|[/%]>|-->)\s*$'
  key_equivalent "^~X"  # TextMate only
  uuid "74AEC234-DD4D-4AB1-B855-253E34E34BFE"  # TextMate only

  rule 'meta.tag.processing-instruction.xml' do
    from %r/<\?/
    to %r/>/
    both 0 => 'punctuation.definition.tag.xml'
  end
  rule 'meta.tag.sgml.xml' do
    from %r/<!/
    to %r/>/
    both 0 => 'punctuation.definition.tag.xml'
  end
  rule 'meta.tag.xml' do
    from %r/(<)(?:([-_[:alnum:]]+)((:)))?([-_.:[:alnum:]]+)/,
      1 => 'punctuation.definition.tag.xml',
      2 => 'entity.name.tag.namespace.xml',
      3 => 'entity.name.tag.xml',
      4 => 'punctuation.separator.namespace.xml',
      5 => 'entity.name.tag.localname.xml',
      6 => 'invalid.illegal.unexpected-end-tag.xml'
    to %r'(/>)|(</)(\2)((\4))(\5)(>)|(</[-_.:[:alnum:]]+>)',
      1 => 'punctuation.definition.tag.xml',
      2 => 'punctuation.definition.tag.xml',
      3 => 'entity.name.tag.namespace.xml',
      4 => 'entity.name.tag.xml',
      5 => 'punctuation.separator.namespace.xml',
      6 => 'entity.name.tag.localname.xml',
      7 => 'punctuation.definition.tag.xml',
      8 => 'invalid.illegal.unexpected-end-tag.xml'
    rule do
      match %r/\s+(?:([-_a-zA-Z0-9]+)((:)))?([a-zA-Z-]+)=/,
        1 => 'entity.other.attribute-name.namespace.xml',
        2 => 'entity.other.attribute-name.xml',
        3 => 'punctuation.separator.namespace.xml',
        4 => 'entity.other.attribute-name.localname.xml'
    end
    rule 'string.quoted.double.xml' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.xml'
      to %r/"/,
        0 => 'punctuation.definition.string.end.xml'
    end
    rule 'string.quoted.single.xml' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.xml'
      to %r/'/,
        0 => 'punctuation.definition.string.end.xml'
    end
    rule 'meta.tag-content.xml' do
      from %r/>/,
        0 => 'punctuation.definition.tag.xml'
      to %r'(?=</)'
      include "$self"
    end
  end
end
