# encoding: utf-8

language 'JavaServer Pages' => 'text.html.jsp', file: 'Java Server Pages (JSP)' do
  file_types %w(jsp jspf tag)
  key_equivalent "^~J"  # TextMate only
  uuid "ACB58B55-9437-4AE6-AF42-854995CF51DF"  # TextMate only

  include "#xml_tags"
  include "text.html.basic"

  # FIXME: this fragment is never referenced
  fragment :comment do
    rule 'comment.block.jsp' do
      from %r/<%--/
      to %r/--%>/
      both 0 => 'punctuation.definition.comment.jsp'
    end
  end

  # FIXME: this fragment is never referenced
  fragment :declaration do
    rule 'meta.embedded.line.declaration.jsp' do
      content_scope "source.java"
      from %r/<%!/,
        0 => 'punctuation.section.embedded.begin.jsp'
      to %r/(%)>/,
        0 => 'punctuation.section.embedded.end.jsp',
        1 => 'source.java'
      include "source.java"
    end
  end

  # FIXME: this fragment is never referenced
  fragment :el_expression do
    rule 'meta.embedded.line.el_expression.jsp' do
      content_scope "source.java"
      from %r/\$\{/,
        0 => 'punctuation.section.embedded.begin.jsp'
      to %r/(\})/,
        0 => 'punctuation.section.embedded.end.jsp',
        1 => 'source.java'
      include "source.java"
    end
  end

  # FIXME: this fragment is never referenced
  fragment :expression do
    rule 'meta.embedded.line.expression.jsp' do
      content_scope "source.java"
      from %r/<%=/,
        0 => 'punctuation.section.embedded.begin.jsp'
      to %r/(%)>/,
        0 => 'punctuation.section.embedded.end.jsp',
        1 => 'source.java'
      include "source.java"
    end
  end

  # FIXME: this fragment is never referenced
  fragment :scriptlet do
    rule 'meta.embedded.block.scriptlet.jsp' do
      content_scope "source.java"
      from %r/<%/,
        0 => 'punctuation.section.embedded.begin.jsp'
      to %r/(%)>/,
        0 => 'punctuation.section.embedded.end.jsp',
        1 => 'source.java'
      rule 'punctuation.section.scope.begin.java' do
        match %r/\{/
      end
      rule 'punctuation.section.scope.end.java' do
        match %r/\}/
      end
      include "source.java"
    end
  end

  # FIXME: this fragment is never referenced
  fragment :tags do
    rule 'meta.tag.template.include.jsp' do
      from %r/(<%@)\s*(?=(attribute|include|page|tag|taglib|variable)\s)/,
        1 => 'punctuation.definition.tag.begin.jsp'
      to %r/%>/,
        0 => 'punctuation.definition.tag.end.jsp'
      rule do
        from %r/\G(attribute)(?=\s)/
        to %r/(?=%>)/
        both 1 => 'keyword.control.attribute.jsp'
        rule do
          match %r/(name|required|fragment|rtexprvalue|type|description)(=)((")[^"]*("))/,
            1 => 'entity.other.attribute-name.jsp',
            2 => 'punctuation.separator.key-value.jsp',
            3 => 'string.quoted.double.jsp',
            4 => 'punctuation.definition.string.begin.jsp',
            5 => 'punctuation.definition.string.end.jsp'
        end
      end
      rule do
        from %r/\G(include)(?=\s)/
        to %r/(?=%>)/
        both 1 => 'keyword.control.include.jsp'
        rule do
          match %r/(file)(=)((")[^"]*("))/,
            1 => 'entity.other.attribute-name.jsp',
            2 => 'punctuation.separator.key-value.jsp',
            3 => 'string.quoted.double.jsp',
            4 => 'punctuation.definition.string.begin.jsp',
            5 => 'punctuation.definition.string.end.jsp'
        end
      end
      rule do
        from %r/\G(page)(?=\s)/
        to %r/(?=%>)/
        both 1 => 'keyword.control.page.jsp'
        rule do
          match %r/(language|extends|import|session|buffer|autoFlush|isThreadSafe|info|errorPage|isErrorPage|contentType|pageEncoding|isElIgnored)(=)((")[^"]*("))/,
            1 => 'entity.other.attribute-name.jsp',
            2 => 'punctuation.separator.key-value.jsp',
            3 => 'string.quoted.double.jsp',
            4 => 'punctuation.definition.string.begin.jsp',
            5 => 'punctuation.definition.string.end.jsp'
        end
      end
      rule do
        from %r/\G(tag)(?=\s)/
        to %r/(?=%>)/
        both 1 => 'keyword.control.tag.jsp'
        rule do
          match %r/(display-name|body-content|dynamic-attributes|small-icon|large-icon|description|example|language|import|pageEncoding|isELIgnored)(=)((")[^"]*("))/,
            1 => 'entity.other.attribute-name.jsp',
            2 => 'punctuation.separator.key-value.jsp',
            3 => 'string.quoted.double.jsp',
            4 => 'punctuation.definition.string.begin.jsp',
            5 => 'punctuation.definition.string.end.jsp'
        end
      end
      rule do
        from %r/\G(taglib)(?=\s)/
        to %r/(?=%>)/
        both 1 => 'keyword.control.taglib.jsp'
        rule do
          match %r/(uri|tagdir|prefix)(=)((")[^"]*("))/,
            1 => 'entity.other.attribute-name.jsp',
            2 => 'punctuation.separator.key-value.jsp',
            3 => 'string.quoted.double.jsp',
            4 => 'punctuation.definition.string.begin.jsp',
            5 => 'punctuation.definition.string.end.jsp'
        end
      end
      rule do
        from %r/\G(variable)(?=\s)/
        to %r/(?=%>)/
        both 1 => 'keyword.control.variable.jsp'
        rule do
          match %r/(name-given|alias|variable-class|declare|scope|description)(=)((")[^"]*("))/,
            1 => 'entity.other.attribute-name.jsp',
            2 => 'punctuation.separator.key-value.jsp',
            3 => 'string.quoted.double.jsp',
            4 => 'punctuation.definition.string.begin.jsp',
            5 => 'punctuation.definition.string.end.jsp'
        end
      end
    end
  end

  fragment :xml_tags do
    rule do
      from %r/(^\s*)(?=<jsp:(declaration|expression|scriptlet)>)/,
        0 => 'punctuation.whitespace.embedded.leading.erb'
      to %r/(?!\G)(\s*$\n)?/,
        0 => 'punctuation.whitespace.embedded.trailing.erb'
      include "#embedded"
    end
    include "#embedded"
    include "#directive"
    include "#actions"
  end

  fragment :actions do
    rule 'meta.tag.template.attribute.jsp' do
      from %r'(</?)(jsp:attribute)\b',
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'entity.name.tag.jsp'
      to %r/>/,
        0 => 'punctuation.definition.tag.end.jsp'
      rule do
        match %r/(name|trim)(=)((")[^"]*("))/,
          1 => 'entity.other.attribute-name.jsp',
          2 => 'punctuation.separator.key-value.jsp',
          3 => 'string.quoted.double.jsp',
          4 => 'punctuation.definition.string.begin.jsp',
          5 => 'punctuation.definition.string.end.jsp'
      end
    end
    rule 'meta.tag.template.body.jsp' do
      match %r'(</?)(jsp:body)(>)',
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'entity.name.tag.jsp',
        3 => 'punctuation.definition.tag.end.jsp'
    end
    rule 'meta.tag.template.element.jsp' do
      from %r'(</?)(jsp:element)\b',
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'entity.name.tag.jsp'
      to %r/>/,
        0 => 'punctuation.definition.tag.end.jsp'
      rule do
        match %r/(name)(=)((")[^"]*("))/,
          1 => 'entity.other.attribute-name.jsp',
          2 => 'punctuation.separator.key-value.jsp',
          3 => 'string.quoted.double.jsp',
          4 => 'punctuation.definition.string.begin.jsp',
          5 => 'punctuation.definition.string.end.jsp'
      end
    end
    rule 'meta.tag.template.dobody.jsp' do
      from %r/(<)(jsp:doBody)\b/,
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'entity.name.tag.jsp'
      to %r'/>',
        0 => 'punctuation.definition.tag.end.jsp'
      rule do
        match %r/(var|varReader|scope)(=)((")[^"]*("))/,
          1 => 'entity.other.attribute-name.jsp',
          2 => 'punctuation.separator.key-value.jsp',
          3 => 'string.quoted.double.jsp',
          4 => 'punctuation.definition.string.begin.jsp',
          5 => 'punctuation.definition.string.end.jsp'
      end
    end
    rule 'meta.tag.template.forward.jsp' do
      from %r'(</?)(jsp:forward)\b',
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'entity.name.tag.jsp'
      to %r'/?>',
        0 => 'punctuation.definition.tag.end.jsp'
      rule do
        match %r/(page)(=)((")[^"]*("))/,
          1 => 'entity.other.attribute-name.jsp',
          2 => 'punctuation.separator.key-value.jsp',
          3 => 'string.quoted.double.jsp',
          4 => 'punctuation.definition.string.begin.jsp',
          5 => 'punctuation.definition.string.end.jsp'
      end
    end
    rule 'meta.tag.template.param.jsp' do
      from %r/(<)(jsp:param)\b/,
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'entity.name.tag.jsp'
      to %r'/>',
        0 => 'punctuation.definition.tag.end.jsp'
      rule do
        match %r/(name|value)(=)((")[^"]*("))/,
          1 => 'entity.other.attribute-name.jsp',
          2 => 'punctuation.separator.key-value.jsp',
          3 => 'string.quoted.double.jsp',
          4 => 'punctuation.definition.string.begin.jsp',
          5 => 'punctuation.definition.string.end.jsp'
      end
    end
    rule 'meta.tag.template.getproperty.jsp' do
      from %r/(<)(jsp:getProperty)\b/,
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'entity.name.tag.jsp'
      to %r'/>',
        0 => 'punctuation.definition.tag.end.jsp'
      rule do
        match %r/(name|property)(=)((")[^"]*("))/,
          1 => 'entity.other.attribute-name.jsp',
          2 => 'punctuation.separator.key-value.jsp',
          3 => 'string.quoted.double.jsp',
          4 => 'punctuation.definition.string.begin.jsp',
          5 => 'punctuation.definition.string.end.jsp'
      end
    end
    rule 'meta.tag.template.include.jsp' do
      from %r'(</?)(jsp:include)\b',
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'entity.name.tag.jsp'
      to %r'/?>',
        0 => 'punctuation.definition.tag.end.jsp'
      rule do
        match %r/(page|flush)(=)((")[^"]*("))/,
          1 => 'entity.other.attribute-name.jsp',
          2 => 'punctuation.separator.key-value.jsp',
          3 => 'string.quoted.double.jsp',
          4 => 'punctuation.definition.string.begin.jsp',
          5 => 'punctuation.definition.string.end.jsp'
      end
    end
    rule 'meta.tag.template.invoke.jsp' do
      from %r/(<)(jsp:invoke)\b/,
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'entity.name.tag.jsp'
      to %r'/>',
        0 => 'punctuation.definition.tag.end.jsp'
      rule do
        match %r/(fragment|var|varReader|scope)(=)((")[^"]*("))/,
          1 => 'entity.other.attribute-name.jsp',
          2 => 'punctuation.separator.key-value.jsp',
          3 => 'string.quoted.double.jsp',
          4 => 'punctuation.definition.string.begin.jsp',
          5 => 'punctuation.definition.string.end.jsp'
      end
    end
    rule 'meta.tag.template.output.jsp' do
      from %r/(<)(jsp:output)\b/,
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'entity.name.tag.jsp'
      to %r'/>',
        0 => 'punctuation.definition.tag.end.jsp'
      rule do
        match %r/(omit-xml-declaration|doctype-root-element|doctype-system|doctype-public)(=)((")[^"]*("))/,
          1 => 'entity.other.attribute-name.jsp',
          2 => 'punctuation.separator.key-value.jsp',
          3 => 'string.quoted.double.jsp',
          4 => 'punctuation.definition.string.begin.jsp',
          5 => 'punctuation.definition.string.end.jsp'
      end
    end
    rule 'meta.tag.template.plugin.jsp' do
      from %r'(</?)(jsp:plugin)\b',
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'entity.name.tag.jsp'
      to %r/>/,
        0 => 'punctuation.definition.tag.end.jsp'
      rule do
        match %r/(type|code|codebase|name|archive|align|height|hspace|jreversion|nspluginurl|iepluginurl)(=)((")[^"]*("))/,
          1 => 'entity.other.attribute-name.jsp',
          2 => 'punctuation.separator.key-value.jsp',
          3 => 'string.quoted.double.jsp',
          4 => 'punctuation.definition.string.begin.jsp',
          5 => 'punctuation.definition.string.end.jsp'
      end
    end
    rule 'meta.tag.template.fallback.jsp' do
      match %r'(</?)(jsp:fallback)(>)',
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'entity.name.tag.jsp',
        3 => 'punctuation.definition.tag.end.jsp'
    end
    rule 'meta.tag.template.root.jsp' do
      from %r'(</?)(jsp:root)\b',
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'entity.name.tag.jsp'
      to %r/>/,
        0 => 'punctuation.definition.tag.end.jsp'
      rule do
        match %r/(xmlns|version|xmlns:taglibPrefix)(=)((")[^"]*("))/,
          1 => 'entity.other.attribute-name.jsp',
          2 => 'punctuation.separator.key-value.jsp',
          3 => 'string.quoted.double.jsp',
          4 => 'punctuation.definition.string.begin.jsp',
          5 => 'punctuation.definition.string.end.jsp'
      end
    end
    rule 'meta.tag.template.setproperty.jsp' do
      from %r/(<)(jsp:setProperty)\b/,
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'entity.name.tag.jsp'
      to %r'/>',
        0 => 'punctuation.definition.tag.end.jsp'
      rule do
        match %r/(name|property|value)(=)((")[^"]*("))/,
          1 => 'entity.other.attribute-name.jsp',
          2 => 'punctuation.separator.key-value.jsp',
          3 => 'string.quoted.double.jsp',
          4 => 'punctuation.definition.string.begin.jsp',
          5 => 'punctuation.definition.string.end.jsp'
      end
    end
    rule 'meta.tag.template.text.jsp' do
      match %r'(</?)(jsp:text)(>)',
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'entity.name.tag.jsp',
        3 => 'punctuation.definition.tag.end.jsp'
    end
    rule 'meta.tag.template.usebean.jsp' do
      from %r'(</?)(jsp:useBean)\b',
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'entity.name.tag.jsp'
      to %r'/?>',
        0 => 'punctuation.definition.tag.end.jsp'
      rule do
        match %r/(id|scope|class|type|beanName)(=)((")[^"]*("))/,
          1 => 'entity.other.attribute-name.jsp',
          2 => 'punctuation.separator.key-value.jsp',
          3 => 'string.quoted.double.jsp',
          4 => 'punctuation.definition.string.begin.jsp',
          5 => 'punctuation.definition.string.end.jsp'
      end
    end
  end

  fragment :directive do
    rule 'meta.tag.template.$3.jsp' do
      from %r/(<)(jsp:directive\.(?=(attribute|include|page|tag|variable)\s))/,
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'entity.name.tag.jsp'
      to %r'/>',
        0 => 'punctuation.definition.tag.end.jsp'
      rule do
        from %r/\G(attribute)(?=\s)/
        to %r'(?=/>)'
        both 1 => 'entity.name.tag.jsp'
        rule do
          match %r/(name|required|fragment|rtexprvalue|type|description)(=)((")[^"]*("))/,
            1 => 'entity.other.attribute-name.jsp',
            2 => 'punctuation.separator.key-value.jsp',
            3 => 'string.quoted.double.jsp',
            4 => 'punctuation.definition.string.begin.jsp',
            5 => 'punctuation.definition.string.end.jsp'
        end
      end
      rule do
        from %r/\G(include)(?=\s)/
        to %r'(?=/>)'
        both 1 => 'entity.name.tag.jsp'
        rule do
          match %r/(file)(=)((")[^"]*("))/,
            1 => 'entity.other.attribute-name.jsp',
            2 => 'punctuation.separator.key-value.jsp',
            3 => 'string.quoted.double.jsp',
            4 => 'punctuation.definition.string.begin.jsp',
            5 => 'punctuation.definition.string.end.jsp'
        end
      end
      rule do
        from %r/\G(page)(?=\s)/
        to %r'(?=/>)'
        both 1 => 'entity.name.tag.jsp'
        rule do
          match %r/(language|extends|import|session|buffer|autoFlush|isThreadSafe|info|errorPage|isErrorPage|contentType|pageEncoding|isElIgnored)(=)((")[^"]*("))/,
            1 => 'entity.other.attribute-name.jsp',
            2 => 'punctuation.separator.key-value.jsp',
            3 => 'string.quoted.double.jsp',
            4 => 'punctuation.definition.string.begin.jsp',
            5 => 'punctuation.definition.string.end.jsp'
        end
      end
      rule do
        from %r/\G(tag)(?=\s)/
        to %r'(?=/>)'
        both 1 => 'entity.name.tag.jsp'
        rule do
          match %r/(display-name|body-content|dynamic-attributes|small-icon|large-icon|description|example|language|import|pageEncoding|isELIgnored)(=)((")[^"]*("))/,
            1 => 'entity.other.attribute-name.jsp',
            2 => 'punctuation.separator.key-value.jsp',
            3 => 'string.quoted.double.jsp',
            4 => 'punctuation.definition.string.begin.jsp',
            5 => 'punctuation.definition.string.end.jsp'
        end
      end
      rule do
        from %r/\G(variable)(?=\s)/
        to %r'(?=/>)'
        both 1 => 'entity.name.tag.jsp'
        rule do
          match %r/(name-given|alias|variable-class|declare|scope|description)(=)((")[^"]*("))/,
            1 => 'entity.other.attribute-name.jsp',
            2 => 'punctuation.separator.key-value.jsp',
            3 => 'string.quoted.double.jsp',
            4 => 'punctuation.definition.string.begin.jsp',
            5 => 'punctuation.definition.string.end.jsp'
        end
      end
    end
  end

  fragment :embedded do
    rule 'meta.embedded.block.jsp' do
      content_scope "source.java"
      from %r/(<)(jsp:(declaration|expression|scriptlet))(>)/,
        0 => 'meta.tag.template.$3.jsp',
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'entity.name.tag.jsp',
        4 => 'punctuation.definition.tag.end.jsp'
      to %r'((<)/)(jsp:\3)(>)',
        0 => 'meta.tag.template.$4.jsp',
        1 => 'punctuation.definition.tag.begin.jsp',
        2 => 'source.java',
        3 => 'entity.name.tag.jsp',
        4 => 'punctuation.definition.tag.end.jsp'
      include "source.java"
    end
  end
end
