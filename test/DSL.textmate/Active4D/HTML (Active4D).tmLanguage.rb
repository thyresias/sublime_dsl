# encoding: utf-8

language 'HTML (Active4D)' => 'text.html.strict.active4d' do
  file_types %w(a4d a4p)
  key_equivalent "^~A"  # TextMate only
  uuid "E666209C-4477-4D83-8B49-9463DFBACD9F"  # TextMate only

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
  rule 'meta.tag.preprocessor.xml.html' do
    from %r/(<\?)(xml)/
    to %r/(\?>)/
    both 1 => 'punctuation.definition.tag.xml.html',
         2 => 'entity.name.tag.xml.html'
    include "#tag-generic-attribute"
    include "#string-double-quoted"
    include "#string-single-quoted"
  end
  rule 'comment.block.html' do
    from %r/<!--/
    to %r/-->/
    both 0 => 'punctuation.definition.comment.html'
    rule 'invalid.illegal.bad-comments-or-CDATA.html' do
      match %r/--/
    end
  end
  rule 'meta.tag.sgml.html' do
    from %r/<!/
    to %r/>/
    both 0 => 'punctuation.definition.tag.html'
    rule 'meta.tag.sgml.doctype.html' do
      from %r/(DOCTYPE)/
      to %r/(?=>)/
      both 1 => 'entity.name.tag.doctype.html'
      rule 'string.quoted.double.doctype.identifiers-and-DTDs.html' do
        match %r/"[^">]*"/
      end
    end
    rule 'constant.other.inline-data.html' do
      from %r/\[CDATA\[/
      # FIXME: (warning) regular expression has ']' without escape
      to %r/]](?=>)/
    end
    rule 'invalid.illegal.bad-comments-or-CDATA.html' do
      match %r/(\s*)(?!--|>)\S(\s*)/
    end
  end
  rule 'meta.tag.processor.html' do
    from %r/<%(?=%>)/,
      0 => 'punctuation.section.embedded.active4d'
    to %r/(%)>/,
      0 => 'punctuation.section.embedded.active4d',
      1 => 'meta.scope.between-tag-pair.html'
    include "#embedded-code"
  end
  include "#embedded-code"
  rule 'source.css.embedded.html' do
    from %r'(?:^\s+)?(<)((?i:style))\b(?![^>]*/>)'
    to %r'(</)((?i:style))(>)(?:\s*\n)?'
    both 1 => 'punctuation.definition.tag.html',
         2 => 'entity.name.tag.style.html',
         3 => 'punctuation.definition.tag.html'
    include "#tag-stuff"
    rule do
      from %r/(>)/,
        1 => 'punctuation.definition.tag.html'
      to %r'(?=</(?i:style))'
      include "#embedded-code"
      include "source.css"
    end
  end
  rule 'source.js.embedded.html' do
    from %r'(?:^\s+)?(<)((?i:script))\b(?![^>]*/>)',
      1 => 'punctuation.definition.tag.html',
      2 => 'entity.name.tag.script.html'
    to %r'(?<=</(script|SCRIPT))(>)(?:\s*\n)?',
      1 => 'entity.name.tag.script.html',
      2 => 'punctuation.definition.tag.html'
    include "#tag-stuff"
    rule do
      from %r'(?<!</(?:script|SCRIPT))(>)'
      to %r'(</)((?i:script))'
      both 1 => 'punctuation.definition.tag.html'
      include "#embedded-js"
      include "source.js"
    end
  end
  rule 'meta.tag.structure.any.html' do
    from %r'(</?)((?i:body|head|html)\b)'
    to %r/(>)/
    both 1 => 'punctuation.definition.tag.html',
         2 => 'entity.name.tag.structure.any.html'
    include "#tag-stuff"
  end
  rule 'meta.tag.block.any.html' do
    from %r'(</?)((?i:address|blockquote|dd|div|dl|dt|fieldset|form|frame|frameset|h1|h2|h3|h4|h5|h6|iframe|noframes|object|ol|p|ul|applet|center|dir|hr|menu|pre)\b)'
    to %r/(>)/
    both 1 => 'punctuation.definition.tag.html',
         2 => 'entity.name.tag.block.any.html'
    include "#tag-stuff"
  end
  rule 'meta.tag.inline.any.html' do
    from %r'(</?)((?i:a|abbr|acronym|area|b|base|basefont|bdo|big|br|button|caption|cite|code|col|colgroup|del|dfn|em|font|head|html|i|img|input|ins|isindex|kbd|label|legend|li|link|map|meta|noscript|optgroup|option|param|q|s|samp|script|select|small|span|strike|strong|style|sub|sup|table|tbody|td|textarea|tfoot|th|thead|title|tr|tt|u|var)\b)'
    to %r/(>)/
    both 1 => 'punctuation.definition.tag.html',
         2 => 'entity.name.tag.inline.any.html'
    include "#tag-stuff"
  end
  rule 'meta.tag.other.html' do
    from %r'(</?)([a-zA-Z0-9:]+)'
    to %r/(>)/
    both 1 => 'punctuation.definition.tag.html',
         2 => 'entity.name.tag.other.html'
    include "#tag-stuff"
  end
  include "#entities"
  rule 'invalid.illegal.incomplete.html' do
    match %r/<>/
  end
  rule 'invalid.illegal.bad-angle-bracket.html' do
    match %r/<(?=\W)|>/
  end

  fragment :"embedded-code" do
    rule 'source.active4d.embedded.html' do
      from %r/<%/
      to %r/%>/
      both 0 => 'punctuation.section.embedded.active4d'
      include "source.active4d"
    end
  end

  fragment :"embedded-js" do
    include "#string-double-quoted-js"
    include "#string-single-quoted-js"
    include "#embedded-code"
  end

  fragment :entities do
    rule 'constant.character.entity.html' do
      match %r/(&)([a-zA-Z0-9]+|#[0-9]+|#x[0-9a-fA-F]+)(;)/,
        1 => 'punctuation.definition.entity.html',
        3 => 'punctuation.terminator.entity.html'
    end
    rule 'invalid.illegal.bad-ampersand.html' do
      match %r/&/
    end
  end

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

  fragment :"string-double-quoted-js" do
    rule 'string.quoted.double.js' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.js'
      to %r/"/,
        0 => 'punctuation.definition.string.end.js'
      include "#embedded-code"
    end
  end

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

  fragment :"string-single-quoted-js" do
    rule 'string.quoted.single.js' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.js'
      to %r/'/,
        0 => 'punctuation.definition.string.end.js'
      include "#embedded-code"
    end
  end

  fragment :"tag-generic-attribute" do
    rule 'entity.other.attribute-name.html' do
      # FIXME: (warning) character class has '-' without escape
      match %r/\b([a-zA-Z-:]+)/
    end
  end

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
    include "#tag-id-attribute"
    include "#tag-generic-attribute"
    include "#string-double-quoted"
    include "#string-single-quoted"
    include "#embedded-code"
  end
end
