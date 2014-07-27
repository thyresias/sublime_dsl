# encoding: utf-8

language 'Java Server Page (JSP)' => 'text.html.jsp', file: 'Java Server Pages (JSP)' do
  file_types %w(jsp)
  folding_start_marker %r'/\*\*|\{\s*$'
  folding_stop_marker %r'\*\*/|^\s*\}'
  key_equivalent "^~J"  # TextMate only
  uuid "ACB58B55-9437-4AE6-AF42-854995CF51DF"  # TextMate only

  rule 'comment.block.jsp' do
    from %r/<%--/
    to %r/--%>/
    both 0 => 'punctuation.definition.comment.jsp'
  end
  rule 'meta.directive.jsp' do
    from %r/<%@/
    to %r/%>/
    both 0 => 'punctuation.section.directive.jsp'
    rule do
      from %r/\w+/,
        0 => 'keyword.other.directive.jsp'
      to %r/(?=%>)/
      rule 'constant.other.directive.attribute.jsp' do
        match %r/\w+/
      end
      rule 'keyword.operator.assignment.jsp' do
        match %r/=/
      end
      rule 'string.quoted.double.jsp' do
        from %r/"/,
          0 => 'punctuation.definition.string.begin.jsp'
        to %r/"/,
          0 => 'punctuation.definition.string.end.jsp'
        rule 'constant.character.escape.jsp' do
          match %r/\\./
        end
      end
      rule 'string.quoted.single.jsp' do
        from %r/'/,
          0 => 'punctuation.definition.string.begin.jsp'
        to %r/'/,
          0 => 'punctuation.definition.string.end.jsp'
        rule 'constant.character.escape.jsp' do
          match %r/\\./
        end
      end
    end
  end
  rule do
    from %r/(<%[!=]?)|(<jsp:scriptlet>|<jsp:expression>|<jsp:declaration>)/,
      1 => 'punctuation.section.embedded.jsp',
      2 => 'meta.tag.block.jsp'
    to %r'(?<=</jsp:scriptlet>|</jsp:expression>|</jsp:declaration>|%>)'
    rule do
      match %r'(</jsp:scriptlet>|</jsp:expression>|</jsp:declaration>)|(%>)',
        1 => 'meta.tag.block.jsp',
        2 => 'punctuation.section.embedded.jsp'
    end
    rule 'source.java.embedded.html' do
      from %r'(?<!\n)(?!</jsp:scriptlet>|</jsp:expression>|</jsp:declaration>|%>|\{|\})'
      to %r'(?=</jsp:scriptlet>|</jsp:expression>|</jsp:declaration>|%>|\{|\})|\n'
      include "source.java"
    end
    rule do
      from %r/{/
      to %r/}/
      rule do
        from %r'(</jsp:scriptlet>|</jsp:expression>|</jsp:declaration>)|(%>)'
        to %r/(<jsp:scriptlet>|<jsp:expression>|<jsp:declaration>)|(<%[!=]?)/
        both 1 => 'meta.tag.block.jsp',
             2 => 'punctuation.section.embedded.jsp'
        include "text.html.jsp"
      end
      include "source.java"
    end
    include "source.java"
  end
  include "text.html.basic"
end
