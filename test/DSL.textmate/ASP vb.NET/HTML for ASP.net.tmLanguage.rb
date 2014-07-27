# encoding: utf-8

language 'HTML (ASP.net)' => 'text.html.asp.net', file: 'HTML for ASP.net' do
  # This is a modified version of the HTML language that uses ASP VB.NET for embedded source code instead of ruby. Thomas Aylott subtleGradient.com
  file_types %w(aspx ascx master)
  key_equivalent "^~A"  # TextMate only
  uuid "426BF395-E61E-430F-8E4C-47F2E15C769B"  # TextMate only

  include "#php"
  include "#asp"
  include "#smarty"
  rule 'meta.tag.html' do
    match %r'(<)(\w+)[^>]*((>)</)(\2)(>)',
      1 => 'punctuation.definition.tag.html',
      2 => 'entity.name.tag.html',
      3 => 'punctuation.definition.tag.html',
      4 => 'meta.scope.between-tag-pair.html',
      5 => 'entity.name.tag.html',
      6 => 'punctuation.definition.tag.html'
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
    to %r/-->/
    both 0 => 'punctuation.definition.comment.asp.net'
    rule 'invalid.illegal.bad-comments-or-CDATA.html' do
      match %r/--/
    end
  end
  rule 'meta.tag.sgml.html' do
    from %r/<!/
    to %r/>/
    both 0 => 'punctuation.definition.tag.asp.net'
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
  rule 'source.js.embedded.html' do
    from %r'(?:^\s+)?(<)((?i:script))\b(?![^>]*/>)'
    to %r'(?<=</(script|SCRIPT))(>)(?:\s*\n)?'
    both 1 => 'punctuation.definition.tag.html',
         2 => 'entity.name.tag.script.html'
    include "#tag-stuff"
    rule do
      from %r'(?<!</(?:script|SCRIPT))(>)'
      to %r'(</)((?i:script))'
      both 1 => 'punctuation.definition.tag.html'
      include "source.js"
    end
  end
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
      include "source.css"
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

  fragment :asp do
    include "#source-asp-embedded-scripttag"
    include "#source-asp-embedded"
    include "#source-asp-bound"
    include "#source-asp-return"
    rule 'meta.source.embedded.asp.include' do
      match %r/(<!--)\s+#include.*(-->)/,
        1 => 'punctuation.definition.tag.asp',
        3 => 'punctuation.definition.tag.asp'
    end
  end

  fragment :"embedded-code" do
    include "#php"
    include "#asp"
    include "#smarty"
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
    rule 'source.php.embedded.html' do
      # match only multi-line PHP with leading whitespace
      from %r/(?:^\s*)(<\?(php|=)?)(?!.*\?>)/
      to %r/(\?>)(?:\s*$\n)?/
      both 1 => 'punctuation.section.embedded.php'
      include "#php-source"
    end
    rule 'source.php.embedded.html' do
      from %r/<\?(php|=)?/,
        0 => 'punctuation.section.embedded.begin.php'
      to %r/\?>/,
        0 => 'punctuation.section.embedded.end.php'
      include "#php-source"
    end
  end

  fragment :"php-source" do
    rule 'comment.line.number-sign.php' do
      match %r/(#).*?(?=\?>)/,
        1 => 'punctuation.definition.comment.php'
    end
    rule 'comment.line.double-slash.php' do
      match %r'(//).*?(?=\?>)',
        1 => 'punctuation.definition.comment.php'
    end
    include "source.php"
  end

  # FIXME: this fragment is never referenced
  fragment :ruby do
    rule 'source.ruby.embedded.html' do
      from %r/<%+(?!>)=?/,
        0 => 'punctuation.section.embedded.begin.ruby'
      to %r/-?%>/,
        0 => 'punctuation.section.embedded.end.ruby'
      rule 'comment.line.number-sign.ruby' do
        match %r/(#).*?(?=-?%>)/,
          1 => 'punctuation.definition.comment.ruby'
      end
      include "source.ruby"
    end
  end

  fragment :smarty do
    rule do
      from %r/((\{)(literal)(\}))/
      to %r'((\{/)(literal)(\}))'
      both 1 => 'source.smarty.embedded.html',
           2 => 'punctuation.section.embedded.smarty',
           3 => 'support.function.built-in.smarty',
           4 => 'punctuation.section.embedded.smarty'
    end
    rule 'source.smarty.embedded.html' do
      disabled true
      from %r/{{|{/
      to %r/}}|}/
      both 0 => 'punctuation.section.embedded.smarty'
      include "source.smarty"
    end
  end

  fragment :"source-asp-bound" do
    rule 'meta.source.embedded.bound' do
      from %r/<%#/,
        0 => 'punctuation.section.embedded.begin.asp'
      to %r/%>/,
        0 => 'punctuation.section.embedded.end.asp'
      rule 'source.asp.embedded.html' do
        from %r/(?<=<%#)/
        to %r/(?=%>)/
        include "source.asp.vb.net"
      end
    end
  end

  fragment :"source-asp-embedded" do
    rule 'meta.source.embedded' do
      from %r/<%(?![=#])/,
        0 => 'punctuation.section.embedded.begin.asp'
      to %r/%>/,
        0 => 'punctuation.section.embedded.end.asp'
      rule 'source.asp.embedded.html' do
        from %r/(?<=<%)/
        to %r/(?=%>)/
        include "source.asp.vb.net"
      end
    end
  end

  fragment :"source-asp-embedded-scripttag" do
    rule 'meta.source.embedded.script-tag' do
      from %r/(?:^\s+)?(<)(script).*runat=.server[^>]*(>)/
      to %r'(</)(script)(>)(?:\s*$\n)?'
      both 1 => 'punctuation.definition.tag.html',
           2 => 'entity.name.tag.script.html',
           3 => 'punctuation.definition.tag.html'
      rule 'source.asp.embedded.html' do
        from %r/(?<=(>))/
        to %r'(?=</script>)'
        include "source.asp.vb.net"
      end
    end
  end

  fragment :"source-asp-return" do
    rule 'meta.source.embedded.return-value' do
      from %r/<%=/,
        0 => 'punctuation.section.embedded.begin.asp'
      to %r/%>/,
        0 => 'punctuation.section.embedded.end.asp'
      rule 'source.asp.embedded.html' do
        from %r/(?<=<%=)/
        to %r/(?=%>)/
        include "source.asp.vb.net"
      end
    end
  end

  # FIXME: this fragment is never referenced
  fragment :"source-asp-single-line" do
    rule 'meta.source.embedded.single-line' do
      # DEBUG
      from %r/<%(=|#|@)/,
        0 => 'punctuation.section.embedded.begin.asp'
      to %r/%>/,
        0 => 'punctuation.section.embedded.end.asp'
      rule 'source.asp.embedded.html' do
        from %r/(?<=<%)/
        to %r/(?=%>)/
        include "source.asp.vb.net"
      end
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
  end
end
