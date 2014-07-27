# encoding: utf-8

language 'Grails Server Page' => 'text.html.grails', file: 'GSP' do
  file_types %w(gsp)
  folding_start_marker %r'(?x)
    (<(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl|g:javascript)\b.*?>
    |<!--(?!.*-->)
    |\{\s*($|\?>\s*$|//|/\*(.*\*/\s*$|(?!.*?\*/)))
    )'
  folding_stop_marker %r'(?x)
    (</(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl|g:javascript)>
    |^\s*-->
    |(^|\s)\}
    )'
  key_equivalent "^~G"  # TextMate only
  uuid "E4DECA1B-424C-4A75-AD67-E907F182E4FB"  # TextMate only

  rule do
    content_scope "comment.block"
    from %r/<%--+(?!>)=?/
    to %r/--%>/
  end
  rule 'source.groovy' do
    from %r/<%+(?!>)=?/,
      0 => 'punctuation.section.embedded.begin.groovy'
    to %r/(%)>/,
      0 => 'punctuation.section.embedded.end.groovy',
      1 => 'source.groovy'
    include "source.groovy"
  end
  include "#embedded-groovy"
  rule do
    content_scope "source.js"
    from %r/(^\s*)?(?=<(?i:g:javascript))/,
      0 => 'punctuation.whitespace.embedded.leading.js'
    to %r/(?<=>)(?!<(?i:g:javascript))(\s*\n)?/,
      0 => 'punctuation.whitespace.embedded.trailing.js'
    rule 'meta.tag.template.javascript.html.grails' do
      from %r/(<)((?i:g:javascript))/,
        1 => 'punctuation.definition.tag.html.grails',
        2 => 'entity.name.tag.template.html.grails'
      to %r'/>|(?=>)',
        0 => 'punctuation.definition.tag.html.grails'
      include "#tag-stuff"
    end
    rule 'meta.tag.template.javascript.html.grails' do
      match %r'((<)/)((?i:g:javascript))(>)',
        1 => 'punctuation.definition.tag.html.grails',
        2 => 'source.js',
        3 => 'entity.name.tag.template.html.grails',
        4 => 'punctuation.definition.tag.html.grails'
    end
    rule do
      content_scope "source.js"
      from %r/(>)/,
        0 => 'meta.tag.template.javascript.html.grails',
        1 => 'punctuation.definition.tag.html.grails'
      to %r'(?=</(?i:g:javascript)>)'
      rule 'comment.line.double-slash.js' do
        match %r'(//).*?((?=</(?i:g:javascript))|$\n?)',
          1 => 'punctuation.definition.comment.begin.js'
      end
      rule 'comment.block.js' do
        from %r'/\*',
          0 => 'punctuation.definition.comment.begin.js'
        to %r'\*/|(?=</(?i:g:javascript))',
          0 => 'punctuation.definition.comment.end.js'
      end
      include "source.js"
    end
  end
  rule 'meta.tag.template.html.grails' do
    from %r'(</?)(\w+:\w+)'
    to %r'(/?>)'
    both 1 => 'punctuation.definition.tag.html.grails',
         2 => 'entity.name.tag.template.html.grails'
    include "#tag-stuff"
  end
  include "text.html.basic"

  fragment :"embedded-groovy" do
    rule 'source.groovy.embedded.html.grails' do
      from %r/\$\{/
      to %r/\}/
      both 0 => 'punctuation.section.embedded.groovy'
      include "source.groovy"
    end
  end

  fragment :"string-double-quoted" do
    rule 'string.quoted.double.html.grails' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.html.grails'
      to %r/"/,
        0 => 'punctuation.definition.string.end.html.grails'
      include "#embedded-groovy"
    end
  end

  fragment :"string-single-quoted" do
    rule 'string.quoted.single.html.grails' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.html.grails'
      to %r/'/,
        0 => 'punctuation.definition.string.end.html.grails'
    end
  end

  fragment :"tag-attribute" do
    rule 'entity.other.attribute-name.html.grails' do
      match %r/\b([a-zA-Z\-:]+)/
    end
  end

  fragment :"tag-stuff" do
    include "#tag-attribute"
    include "#string-double-quoted"
    include "#string-single-quoted"
  end
end
