# encoding: utf-8

language 'Ant' => 'text.xml.ant' do
  file_types %w(ant.xml build.xml)
  first_line_match %r/<\!--\s*ant\s*-->/
  key_equivalent "^~A"  # TextMate only
  uuid "E1B78601-E584-4A7F-B011-A61710BFE035"  # TextMate only

  rule 'comment.block.xml.ant' do
    from %r/<[!%]--/
    to %r/--%?>/
    both 0 => 'punctuation.definition.comment.xml.ant'
  end
  rule 'meta.tag.target.xml.ant' do
    from %r/(<target)\b/
    to %r'(/?>)'
    both 1 => 'entity.name.tag.target.xml.ant'
    include "#tagStuff"
  end
  rule 'meta.tag.macrodef.xml.ant' do
    from %r/(<macrodef)\b/
    to %r'(/?>)'
    both 1 => 'entity.name.tag.macrodef.xml.ant'
    include "#tagStuff"
  end
  rule 'meta.tag.xml.ant' do
    from %r'(</?)(?:([-_a-zA-Z0-9]+)((:)))?([-_a-zA-Z0-9:]+)'
    to %r'(/?>)'
    both 1 => 'punctuation.definition.tag.xml.ant',
         2 => 'entity.name.tag.namespace.xml.ant',
         3 => 'entity.name.tag.xml.ant',
         4 => 'punctuation.separator.namespace.xml.ant',
         5 => 'entity.name.tag.localname.xml.ant'
    include "#tagStuff"
  end
  include "text.xml"
  include "#javaProperties"
  include "#javaAttributes"

  fragment :doublequotedString do
    rule 'string.quoted.double.xml.ant' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.xml.ant'
      to %r/"/,
        0 => 'punctuation.definition.string.end.xml.ant'
      include "#javaAttributes"
      include "#javaProperties"
    end
  end

  fragment :javaAttributes do
    rule 'meta.embedded.line.java' do
      content_scope "source.java"
      from %r/@\{/,
        0 => 'punctuation.section.embedded.begin.ant'
      to %r/(\})/,
        0 => 'punctuation.section.embedded.end.ant',
        1 => 'source.java'
    end
  end

  fragment :javaProperties do
    rule 'meta.embedded.line.java-props' do
      content_scope "source.java-props"
      from %r/\$\{/,
        0 => 'punctuation.section.embedded.begin.ant'
      to %r/(\})/,
        0 => 'punctuation.section.embedded.end.ant',
        1 => 'source.java-props'
    end
  end

  fragment :singlequotedString do
    rule 'string.quoted.single.xml.ant' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.xml.ant'
      to %r/'/,
        0 => 'punctuation.definition.string.end.xml.ant'
      include "#javaAttributes"
      include "#javaProperties"
    end
  end

  fragment :tagStuff do
    rule do
      match %r/ (?:([-_a-zA-Z0-9]+)((:)))?([_a-zA-Z-]+)=/,
        1 => 'entity.other.attribute-name.namespace.xml.ant',
        2 => 'entity.other.attribute-name.xml.ant',
        3 => 'punctuation.separator.namespace.xml.ant',
        4 => 'entity.other.attribute-name.localname.xml.ant'
    end
    include "#doublequotedString"
    include "#singlequotedString"
  end
end
