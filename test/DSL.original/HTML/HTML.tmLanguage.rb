# encoding: utf-8

language 'HTML' => 'text.html.basic' do
  file_types %w(html htm shtml xhtml phtml inc tmpl tpl ctp)
  first_line_match %r/<!(?i:DOCTYPE)|<(?i:html)|<\?(?i:php)/
  folding_start_marker %r'(?x)
    (<(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|li|form|dl)\b.*?>
    |<!--(?!.*--\s*>)
    |^<!--\ \#tminclude\ (?>.*?-->)$
    |<\?(?:php)?.*\b(if|for(each)?|while)\b.+:
    |\{\{?(if|foreach|capture|literal|foreach|php|section|strip)
    |\{\s*($|\?>\s*$|//|/\*(.*\*/\s*$|(?!.*?\*/)))
    )'
  folding_stop_marker %r'(?x)
    (</(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|li|form|dl)>
    |^(?!.*?<!--).*?--\s*>
    |^<!--\ end\ tminclude\ -->$
    |<\?(?:php)?.*\bend(if|for(each)?|while)\b
    |\{\{?/(if|foreach|capture|literal|foreach|php|section|strip)
    |^[^{]*\}
    )'
  key_equivalent "^~H"  # TextMate only
  uuid "17994EC8-6B1D-11D9-AC3A-000D93589AF6"  # TextMate only

  rule 'meta.tag.any.html' do
    from %r'(<)([a-zA-Z0-9:]++)(?=[^>]*></\2>)',
      1 => 'punctuation.definition.tag.begin.html',
      2 => 'entity.name.tag.html'
    to %r'(>)(<)(/)(\2)(>)',
      1 => 'punctuation.definition.tag.end.html',
      2 => 'punctuation.definition.tag.begin.html meta.scope.between-tag-pair.html',
      3 => 'punctuation.definition.tag.begin.html',
      4 => 'entity.name.tag.html',
      5 => 'punctuation.definition.tag.end.html'
    include "#tag-stuff"
  end
  rule 'meta.tag.preprocessor.xml.html' do
    from %r/(<\?)(xml)/
    to %r/(\?>)/
    both 1 => 'punctuation.definition.tag.html',
         2 => 'entity.name.tag.xml.html'
    include "#tag-generic-attribute"
    include "#string-double-quoted"
    include "#string-single-quoted"
  end
  rule 'comment.block.html' do
    from %r/<!--/
    to %r/--\s*>/
    both 0 => 'punctuation.definition.comment.html'
    rule 'invalid.illegal.bad-comments-or-CDATA.html' do
      match %r/--/
    end
    include "#embedded-code"
  end
  rule 'meta.tag.sgml.html' do
    from %r/<!/
    to %r/>/
    both 0 => 'punctuation.definition.tag.html'
    rule 'meta.tag.sgml.doctype.html' do
      from %r/(?i:DOCTYPE)/
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
      2 => 'punctuation.definition.tag.html'
    include "#tag-stuff"
    rule do
      from %r'(?<!</(?:script|SCRIPT))(>)'
      to %r'(</)((?i:script))'
      both 1 => 'punctuation.definition.tag.html',
           2 => 'entity.name.tag.script.html'
      rule 'comment.line.double-slash.js' do
        match %r'(//).*?((?=</script)|$\n?)',
          1 => 'punctuation.definition.comment.js'
      end
      rule 'comment.block.js' do
        from %r'/\*'
        to %r'\*/|(?=</script)'
        both 0 => 'punctuation.definition.comment.js'
      end
      include "#php"
      include "source.js"
    end
  end
  rule 'meta.tag.structure.any.html' do
    from %r'(</?)((?i:body|head|html)\b)',
      1 => 'punctuation.definition.tag.begin.html'
    to %r/(>)/,
      1 => 'punctuation.definition.tag.end.html'
    both 2 => 'entity.name.tag.structure.any.html'
    include "#tag-stuff"
  end
  rule 'meta.tag.block.any.html' do
    from %r'(</?)((?i:address|blockquote|dd|div|dl|dt|fieldset|form|frame|frameset|h1|h2|h3|h4|h5|h6|iframe|noframes|object|ol|p|ul|applet|center|dir|hr|menu|pre)\b)',
      1 => 'punctuation.definition.tag.begin.html',
      2 => 'entity.name.tag.block.any.html'
    to %r/(>)/,
      1 => 'punctuation.definition.tag.end.html'
    include "#tag-stuff"
  end
  rule 'meta.tag.inline.any.html' do
    from %r'(</?)((?i:a|abbr|acronym|area|b|base|basefont|bdo|big|br|button|caption|cite|code|col|colgroup|del|dfn|em|font|head|html|i|img|input|ins|isindex|kbd|label|legend|li|link|map|meta|noscript|optgroup|option|param|q|s|samp|script|select|small|span|strike|strong|style|sub|sup|table|tbody|td|textarea|tfoot|th|thead|title|tr|tt|u|var)\b)',
      1 => 'punctuation.definition.tag.begin.html',
      2 => 'entity.name.tag.inline.any.html'
    to %r'((?: ?/)?>)',
      1 => 'punctuation.definition.tag.end.html'
    include "#tag-stuff"
  end
  rule 'meta.tag.other.html' do
    from %r'(</?)([a-zA-Z0-9:]+)',
      1 => 'punctuation.definition.tag.begin.html',
      2 => 'entity.name.tag.other.html'
    to %r/(>)/,
      1 => 'punctuation.definition.tag.end.html'
    include "#tag-stuff"
  end
  include "#entities"
  rule 'invalid.illegal.incomplete.html' do
    match %r/<>/
  end
  rule 'invalid.illegal.bad-angle-bracket.html' do
    match %r/</
  end

  fragment :"embedded-code" do
    include "#ruby"
    include "#php"
    include "#python"
  end

  fragment :entities do
    rule 'constant.character.entity.html' do
      match %r/(&)([a-zA-Z0-9]+|#[0-9]+|#x[0-9a-fA-F]+)(;)/,
        1 => 'punctuation.definition.entity.html',
        3 => 'punctuation.definition.entity.html'
    end
    rule 'invalid.illegal.bad-ampersand.html' do
      match %r/&/
    end
  end

  fragment :php do
    rule do
      from %r/(?=(^\s*)?<\?)/
      to %r/(?!(^\s*)?<\?)/
      include "source.php"
    end
  end

  fragment :python do
    rule 'source.python.embedded.html' do
      from %r/(?:^\s*)<\?python(?!.*\?>)/
      to %r/\?>(?:\s*$\n)?/
      include "source.python"
    end
  end

  fragment :ruby do
    rule 'comment.block.erb' do
      from %r/<%+#/
      to %r/%>/
      both 0 => 'punctuation.definition.comment.erb'
    end
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
    rule 'source.ruby.nitro.embedded.html' do
      from %r/<\?r(?!>)=?/
      to %r/-?\?>/
      both 0 => 'punctuation.section.embedded.ruby.nitro'
      rule 'comment.line.number-sign.ruby.nitro' do
        match %r/(#).*?(?=-?\?>)/,
          1 => 'punctuation.definition.comment.ruby.nitro'
      end
      include "source.ruby"
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

  fragment :"tag-generic-attribute" do
    rule 'entity.other.attribute-name.html' do
      match %r/\b([a-zA-Z\-:]+)/
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
