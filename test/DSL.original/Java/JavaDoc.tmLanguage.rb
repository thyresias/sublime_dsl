# encoding: utf-8

language 'JavaDoc' => 'text.html.javadoc' do
  # FIXME: no file types
  folding_start_marker %r'/\*\*'
  folding_stop_marker %r'\*\*/'
  uuid "64BB98A4-59D4-474E-9091-C1E1D04BDD03"  # TextMate only

  rule 'comment.block.documentation.javadoc' do
    from %r'(/\*\*)\s*$',
      1 => 'punctuation.definition.comment.begin.javadoc'
    to %r'\*/',
      0 => 'punctuation.definition.comment.javadoc'
    include "#invalid"
    rule 'meta.documentation.comment.javadoc' do
      content_scope "text.html"
      from %r/\*\s*(?=\w)/
      to %r'(?=\s*\*\s*@)|(?=\s*\*\s*/)'
      include "#inline"
    end
    rule 'meta.documentation.tag.param.javadoc' do
      content_scope "text.html"
      from %r/\*\s*((\@)param)/,
        1 => 'keyword.other.documentation.param.javadoc',
        2 => 'punctuation.definition.keyword.javadoc'
      to %r'(?=\s*\*\s*@)|(?=\s*\*\s*/)'
      include "#inline"
    end
    rule 'meta.documentation.tag.return.javadoc' do
      content_scope "text.html"
      from %r/\*\s*((\@)return)/,
        1 => 'keyword.other.documentation.return.javadoc',
        2 => 'punctuation.definition.keyword.javadoc'
      to %r'(?=\s*\*\s*@)|(?=\s*\*\s*/)'
      include "#inline"
    end
    rule 'meta.documentation.tag.throws.javadoc' do
      content_scope "text.html"
      from %r/\*\s*((\@)throws)/,
        1 => 'keyword.other.documentation.throws.javadoc',
        2 => 'punctuation.definition.keyword.javadoc'
      to %r'(?=\s*\*\s*@)|(?=\s*\*\s*/)'
      include "#inline"
    end
    rule 'meta.documentation.tag.exception.javadoc' do
      content_scope "text.html"
      from %r/\*\s*((\@)exception)/,
        1 => 'keyword.other.documentation.exception.javadoc',
        2 => 'punctuation.definition.keyword.javadoc'
      to %r'(?=\s*\*\s*@)|(?=\s*\*\s*/)'
      include "#inline"
    end
    rule 'meta.documentation.tag.author.javadoc' do
      content_scope "text.html"
      from %r/\*\s*((\@)author)/,
        1 => 'keyword.other.documentation.author.javadoc',
        2 => 'punctuation.definition.keyword.javadoc'
      to %r'(?=\s*\*\s*@)|(?=\s*\*\s*/)'
      include "#inline"
    end
    rule 'meta.documentation.tag.version.javadoc' do
      content_scope "text.html"
      from %r/\*\s*((\@)version)/,
        1 => 'keyword.other.documentation.version.javadoc',
        2 => 'punctuation.definition.keyword.javadoc'
      to %r'(?=\s*\*\s*@)|(?=\s*\*\s*/)'
      include "#inline"
    end
    rule 'meta.documentation.tag.see.javadoc' do
      content_scope "text.html"
      from %r/\*\s*((\@)see)/,
        1 => 'keyword.other.documentation.see.javadoc',
        2 => 'punctuation.definition.keyword.javadoc'
      to %r'(?=\s*\*\s*@)|(?=\s*\*\s*/)'
      include "#inline"
    end
    rule 'meta.documentation.tag.since.javadoc' do
      content_scope "text.html"
      from %r/\*\s*((\@)since)/,
        1 => 'keyword.other.documentation.since.javadoc',
        2 => 'punctuation.definition.keyword.javadoc'
      to %r'(?=\s*\*\s*@)|(?=\s*\*\s*/)'
      include "#inline"
    end
    rule 'meta.documentation.tag.serial.javadoc' do
      content_scope "text.html"
      from %r/\*\s*((\@)serial)/,
        1 => 'keyword.other.documentation.serial.javadoc',
        2 => 'punctuation.definition.keyword.javadoc'
      to %r'(?=\s*\*\s*@)|(?=\s*\*\s*/)'
      include "#inline"
    end
    rule 'meta.documentation.tag.serialField.javadoc' do
      content_scope "text.html"
      from %r/\*\s*((\@)serialField)/,
        1 => 'keyword.other.documentation.serialField.javadoc',
        2 => 'punctuation.definition.keyword.javadoc'
      to %r'(?=\s*\*\s*@)|(?=\s*\*\s*/)'
      include "#inline"
    end
    rule 'meta.documentation.tag.serialData.javadoc' do
      content_scope "text.html"
      from %r/\*\s*((\@)serialData)/,
        1 => 'keyword.other.documentation.serialData.javadoc',
        2 => 'punctuation.definition.keyword.javadoc'
      to %r'(?=\s*\*\s*@)|(?=\s*\*\s*/)'
      include "#inline"
    end
    rule 'meta.documentation.tag.deprecated.javadoc' do
      content_scope "text.html"
      from %r/\*\s*((\@)deprecated)/,
        1 => 'keyword.other.documentation.deprecated.javadoc',
        2 => 'punctuation.definition.keyword.javadoc'
      to %r'(?=\s*\*\s*@)|(?=\s*\*\s*/)'
      include "#inline"
    end
    rule do
      match %r/\*\s*((\@)\S+)\s/,
        1 => 'keyword.other.documentation.custom.javadoc',
        2 => 'punctuation.definition.keyword.javadoc'
    end
  end

  fragment :inline do
    include "#invalid"
    include "#inline-formatting"
    include "text.html.basic"
    rule 'markup.underline.link' do
      match %r'((https?|s?ftp|ftps|file|smb|afp|nfs|(x-)?man|gopher|txmt)://|mailto:)[-:@a-zA-Z0-9_.~%+/?=&#]+(?<![.?:])'
    end
  end

  fragment :"inline-formatting" do
    rule 'meta.directive.code.javadoc' do
      content_scope "markup.raw.code.javadoc"
      from %r/(\{)((\@)code)/,
        1 => 'punctuation.definition.directive.begin.javadoc',
        2 => 'keyword.other.documentation.directive.code.javadoc',
        3 => 'punctuation.definition.keyword.javadoc'
      to %r/\}/,
        0 => 'punctuation.definition.directive.end.javadoc'
    end
    rule 'meta.directive.literal.javadoc' do
      content_scope "markup.raw.literal.javadoc"
      from %r/(\{)((\@)literal)/,
        1 => 'punctuation.definition.directive.begin.javadoc',
        2 => 'keyword.other.documentation.directive.literal.javadoc',
        3 => 'punctuation.definition.keyword.javadoc'
      to %r/\}/,
        0 => 'punctuation.definition.directive.end.javadoc'
    end
    rule 'meta.directive.docRoot.javadoc' do
      match %r/(\{)((\@)docRoot)(\})/,
        1 => 'punctuation.definition.directive.begin.javadoc',
        2 => 'keyword.other.documentation.directive.docRoot.javadoc',
        3 => 'punctuation.definition.keyword.javadoc',
        4 => 'punctuation.definition.directive.end.javadoc'
    end
    rule 'meta.directive.inheritDoc.javadoc' do
      match %r/(\{)((\@)inheritDoc)(\})/,
        1 => 'punctuation.definition.directive.begin.javadoc',
        2 => 'keyword.other.documentation.directive.inheritDoc.javadoc',
        3 => 'punctuation.definition.keyword.javadoc',
        4 => 'punctuation.definition.directive.end.javadoc'
    end
    rule 'meta.directive.link.javadoc' do
      match %r/(\{)((\@)link)(?:\s+(\S+?))?(?:\s+(.+?))?\s*(\})/,
        1 => 'punctuation.definition.directive.begin.javadoc',
        2 => 'keyword.other.documentation.directive.link.javadoc',
        3 => 'punctuation.definition.keyword.javadoc',
        4 => 'markup.underline.link.javadoc',
        5 => 'string.other.link.title.javadoc',
        6 => 'punctuation.definition.directive.end.javadoc'
    end
    rule 'meta.directive.linkplain.javadoc' do
      match %r/(\{)((\@)linkplain)(?:\s+(\S+?))?(?:\s+(.+?))?\s*(\})/,
        1 => 'punctuation.definition.directive.begin.javadoc',
        2 => 'keyword.other.documentation.directive.linkplain.javadoc',
        3 => 'punctuation.definition.keyword.javadoc',
        4 => 'markup.underline.linkplain.javadoc',
        5 => 'string.other.link.title.javadoc',
        6 => 'punctuation.definition.directive.end.javadoc'
    end
    rule 'meta.directive.value.javadoc' do
      match %r/(\{)((\@)value)\s*(\S+?)?\s*(\})/,
        1 => 'punctuation.definition.directive.begin.javadoc',
        2 => 'keyword.other.documentation.directive.value.javadoc',
        3 => 'punctuation.definition.keyword.javadoc',
        4 => 'variable.other.javadoc',
        5 => 'punctuation.definition.directive.end.javadoc'
    end
  end

  fragment :invalid do
    rule 'invalid.illegal.missing-asterisk.javadoc' do
      match %r/^(?!\s*\*).*$\n?/
    end
  end
end
