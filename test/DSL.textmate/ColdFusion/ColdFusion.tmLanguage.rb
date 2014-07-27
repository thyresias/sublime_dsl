# encoding: utf-8

language 'ColdFusion' => 'text.html.cfm' do
  file_types %w(cfm cfml cfc)
  key_equivalent "^~C"  # TextMate only
  uuid "97CAD6F7-0807-4EB4-876E-DA9E9C1CEC14"  # TextMate only

  include "#tag-finder"
  rule 'meta.tag.preprocessor.xml.html' do
    from %r/<\?(xml)/
    to %r/\?>/
    both 1 => 'entity.name.tag.xml.html'
    include "#tag-generic-attribute"
    include "#string-double-quoted"
    include "#string-single-quoted"
  end
  include "#cfcomment"
  include "#htmlcomment"
  rule 'meta.tag.sgml.html' do
    from %r/<!/
    to %r/>/
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
  end
  include "#coldfusion-script"
  include "#cffunction"
  rule 'source.css.embedded.html' do
    from %r'(?:^\s+)?<((?i:style))\b(?![^>]*/>)'
    to %r'</((?i:style))>(?:\s*\n)?'
    both 1 => 'entity.name.tag.style.html'
    include "#tag-stuff"
    rule do
      from %r/>/
      to %r'(?=</(?i:style))'
      include "source.css"
    end
  end
  rule 'source.sql.embedded.html' do
    from %r'(?:^\s+)?<((?i:cfquery))\b(?![^>]*/>)'
    to %r'</((?i:cfquery))>(?:\s*\n)?'
    both 1 => 'entity.name.tag.script.html'
    include "#tag-stuff"
    rule do
      from %r/>/
      to %r'(?=</(?i:cfquery))'
      include "source.sql"
    end
  end
  rule 'source.js.embedded.html' do
    from %r'(?:^\s+)?<((?i:script))\b(?![^>]*/>)'
    to %r'(?<=</(script|SCRIPT))>(?:\s*\n)?'
    both 1 => 'entity.name.tag.script.html'
    include "#tag-stuff"
    rule do
      from %r'(?<!</(?:script|SCRIPT))>'
      to %r'</((?i:script))'
      rule 'comment.line.double-slash.js' do
        match %r'//.*?((?=</script)|$\n?)'
      end
      rule 'comment.block.js' do
        from %r'/\*'
        to %r'\*/|(?=</script)'
      end
      include "source.js"
    end
  end
  rule 'source.js.embedded.html' do
    from %r'(?:^\s+)?<((?i:cfscript))\b(?![^>]*/>)'
    to %r'(?<=</(cfscript|CFSCRIPT))>(?:\s*\n)?'
    both 1 => 'entity.name.tag.script.html'
    include "#tag-stuff"
    rule do
      from %r'(?<!</(?:cfscript|CFSCRIPT))>'
      to %r'</((?i:cfscript))'
      rule 'comment.line.double-slash.js' do
        match %r'//.*?((?=</cfscript)|$\n?)'
      end
      rule 'comment.block.js' do
        from %r'/\*'
        to %r'\*/|(?=</cfscript)'
      end
      include "source.js"
    end
  end
  rule 'meta.tag.structure.any.html' do
    from %r'</?((?i:body|head|html)\b)'
    to %r/>/
    both 1 => 'entity.name.tag.structure.any.html'
    include "#tag-stuff"
  end
  rule 'meta.tag.block.any.html' do
    from %r'</?((?i:address|blockquote|dd|div|dl|dt|fieldset|form|frame|frameset|h1|h2 |h3|h4|h5|h6|iframe|noframes|object|ol|p|ul|applet|center|dir|hr|menu|pre)\ b)'
    to %r/>/
    both 1 => 'entity.name.tag.block.any.html'
    include "#tag-stuff"
  end
  rule 'meta.tag.inline.any.html' do
    from %r'</?((?i:a|abbr|acronym|area|b|base|basefont|bdo|big|br|button|caption|cite |code|col|colgroup|del|dfn|em|font|head|html|i|img|input|ins|isindex|kbd|la bel|legend|li|link|map|meta|noscript|optgroup|option|param|q|s|samp|script| select|small|span|strike|strong|style|sub|sup|table|tbody|td|textarea|tfoot |th|thead|title|tr|tt|u|var)\b)'
    to %r/>/
    both 1 => 'entity.name.tag.inline.any.html'
    include "#tag-stuff"
  end
  rule 'meta.tag.other.html' do
    from %r'</?([a-zA-Z0-9:]+)'
    to %r/>/
    both 1 => 'entity.name.tag.other.html'
    include "#tag-stuff"
  end
  include "#entities"
  rule 'invalid.illegal.incomplete.html' do
    match %r/<>/
  end
  rule 'invalid.illegal.bad-angle-bracket.html' do
    match %r/<(?=\W)|>/
  end

  fragment :cfcomment do
    rule 'comment.line' do
      from %r/<!---/
      to %r/---\s*>/
      include "#cfcomment"
    end
  end

  fragment :cffunction do
    rule 'meta.tag.other.html' do
      from %r/<(cffunction)/
      to %r/>/
      both 1 => 'entity.name.tag.other.html'
      rule do
        match %r/\b([nN][aA][mM][Ee])\b\s*(=)\s*(["'])([A-Za-z$_0-9]+)(["'])/,
          0 => 'entity.other.attribute-name.html',
          3 => 'punctuation.definition.string.begin',
          4 => 'entity.name.function.cfml',
          5 => 'punctuation.definition.string.end'
      end
      include "source.cfml"
      include "#tag-stuff"
    end
  end

  fragment :"coldfusion-script" do
    rule 'source.coldfusion.embedded.html' do
      from %r/#/
      to %r/\#/
      include "#inline-function-stuff"
      include "#embedded-code"
    end
  end

  fragment :"embedded-code" do
    include "#javascript"
  end

  fragment :entities do
    rule 'constant.character.entity.html' do
      match %r/&([a-zA-Z0-9]+|#[0-9]+|#x[0-9a-fA-F]+);/
    end
    rule 'invalid.illegal.bad-ampersand.html' do
      match %r/&/
    end
  end

  fragment :htmlcomment do
    rule 'comment.block.html' do
      from %r/<!--/
      to %r/-->/
      rule 'invalid.illegal.bad-comments-or-CDATA.html' do
        match %r/--/
      end
    end
  end

  fragment :"inline-function-stuff" do
    rule 'support.function' do
      content_scope "support.function.parameters"
      from %r/[a-zA-Z0-9_\.]+\(/
      to %r/\)/
      include "#inline-function-stuff"
      include "#string-double-quoted"
      include "#string-single-quoted"
    end
  end

  fragment :"string-double-quoted" do
    rule 'string.quoted.double.html' do
      from %r/"/
      to %r/"/
      include "#embedded-code"
      include "#entities"
    end
  end

  fragment :"string-single-quoted" do
    rule 'string.quoted.single.html' do
      from %r/'/
      to %r/'/
      include "#embedded-code"
      include "#entities"
    end
  end

  fragment :"tag-finder" do
    rule 'meta.tag.any.html' do
      from %r'<([a-zA-Z0-9:]+)(?=[^>]*></\1>)',
        1 => 'entity.name.tag.html'
      to %r'>(<)/(\1)>',
        1 => 'meta.scope.between-tag-pair.html',
        2 => 'entity.name.tag.html'
      include "#tag-stuff"
    end
  end

  fragment :"tag-generic-attribute" do
    rule 'entity.other.attribute-name.html' do
      match %r/\b([a-zA-Z0-9_\-:]+)/
    end
  end

  fragment :"tag-id-attribute" do
    rule 'meta.attribute-with-value.id.html' do
      from %r/[^\.]\b(id)\b\s*=/
      to %r/(?<='|")/
      both 1 => 'entity.other.attribute-name.id.html'
      rule 'string.quoted.double.html' do
        content_scope "meta.toc-list.id.html"
        from %r/"/
        to %r/"/
        include "#embedded-code"
        include "#entities"
      end
      rule 'string.quoted.single.html' do
        content_scope "meta.toc-list.id.html"
        from %r/'/
        to %r/'/
        include "#embedded-code"
        include "#entities"
      end
    end
  end

  fragment :"tag-stuff" do
    include "#tag-id-attribute"
    include "#inline-function-stuff"
    include "#tag-generic-attribute"
    include "#string-double-quoted"
    include "#string-single-quoted"
    include "#coldfusion-script"
    include "#embedded-code"
    rule 'variable.other' do
      match %r/.var\s/
    end
    rule 'meta.tag.other' do
      content_scope "entity.name.function"
      from %r/.<cffunction\sname=('|")1/
      to %r/'|"1/
    end
  end
end
