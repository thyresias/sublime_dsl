# encoding: utf-8

language 'Bulletin Board' => 'text.bbcode' do
  file_types %w(bbcode)
  key_equivalent "^~B"  # TextMate only
  uuid "AC4E0E7E-CC15-4394-A858-6C7E3C09C414"  # TextMate only

  rule do
    from %r/(\[)(?i:list)(\])/
    to %r'(\[/)(?i:list)(\])'
    both 0 => 'meta.tag.template.bbcode',
         1 => 'punctuation.definition.tag.bbcode',
         2 => 'punctuation.definition.tag.bbcode'
    rule do
      content_scope "markup.list.unnumbered.bbcode"
      from %r/(\[\*\])/
      to %r'(?=\[\*\]|\[/(?i:list)\])'
      both 0 => 'meta.tag.template.bbcode',
           1 => 'punctuation.definition.tag.bbcode'
      include "$self"
    end
  end
  rule do
    from %r/(\[)(?i:list)=(1|a)(\])/,
      0 => 'meta.tag.template.bbcode',
      1 => 'punctuation.definition.tag.bbcode',
      2 => 'constant.other.list-type.bbcode',
      3 => 'punctuation.definition.tag.bbcode'
    to %r'(\[/)(?i:list)(\])',
      0 => 'meta.tag.template.bbcode',
      1 => 'punctuation.definition.tag.bbcode',
      2 => 'punctuation.definition.tag.bbcode'
    rule do
      content_scope "markup.list.numbered.bbcode"
      from %r/(\[\*\])/
      to %r'(?=\[\*\]|\[/(?i:list)\])'
      both 0 => 'meta.tag.template.bbcode',
           1 => 'punctuation.definition.tag.bbcode'
      include "$self"
    end
  end
  rule do
    content_scope "markup.quote.bbcode"
    from %r/(\[)(?i:quote)(?:=[^\]]+)?(\])/
    to %r'(\[/)(?i:quote)(\])'
    both 0 => 'meta.tag.template.bbcode',
         1 => 'punctuation.definition.tag.bbcode',
         2 => 'punctuation.definition.tag.bbcode'
    include "$self"
  end
  rule do
    content_scope "markup.raw.block.bbcode"
    from %r/(\[)(?i:code)(\])/
    to %r'(\[/)(?i:code)(\])'
    both 0 => 'meta.tag.template.bbcode',
         1 => 'punctuation.definition.tag.bbcode',
         2 => 'punctuation.definition.tag.bbcode'
  end
  rule do
    content_scope "markup.italic.bbcode"
    from %r/(\[)(?i:i)(\])/
    to %r'(\[/)(?i:i)(\])'
    both 0 => 'meta.tag.template.bbcode',
         1 => 'punctuation.definition.tag.bbcode',
         2 => 'punctuation.definition.tag.bbcode'
    include "$self"
  end
  rule do
    content_scope "markup.bold.bbcode"
    from %r/(\[)(?i:b)(\])/
    to %r'(\[/)(?i:b)(\])'
    both 0 => 'meta.tag.template.bbcode',
         1 => 'punctuation.definition.tag.bbcode',
         2 => 'punctuation.definition.tag.bbcode'
    include "$self"
  end
  rule do
    content_scope "markup.underline.bbcode"
    from %r/(\[)(?i:u)(\])/
    to %r'(\[/)(?i:u)(\])'
    both 0 => 'meta.tag.template.bbcode',
         1 => 'punctuation.definition.tag.bbcode',
         2 => 'punctuation.definition.tag.bbcode'
    include "$self"
  end
  rule do
    content_scope "markup.other.strikethrough.bbcode"
    from %r/(\[)(?i:strike)(\])/
    to %r'(\[/)(?i:strike)(\])'
    both 0 => 'meta.tag.template.bbcode',
         1 => 'punctuation.definition.tag.bbcode',
         2 => 'punctuation.definition.tag.bbcode'
    include "$self"
  end
  rule do
    content_scope "markup.other.colored.bbcode"
    from %r/(?x)(\[)(?i:color)=(
                (?i:(red|green|blue|yellow
                    |white|black|pink
                    |purple|brown|grey))
                    |(\#([0-9a-fA-F]{6}))
                    |([^\]]+))
                (\])/,
      0 => 'meta.tag.template.bbcode',
      1 => 'punctuation.definition.tag.bbcode',
      2 => 'constant.other.named-color.bbcode',
      3 => 'constant.other.rgb-value.bbcode',
      6 => 'invalid.illegal.expected-a-color.bbcode',
      7 => 'punctuation.definition.tag.bbcode'
    to %r'(\[/)(?i:color)(\])',
      0 => 'meta.tag.template.bbcode',
      1 => 'punctuation.definition.tag.bbcode',
      2 => 'punctuation.definition.tag.bbcode'
    include "$self"
  end
  rule do
    content_scope "markup.other.resized.bbcode"
    from %r/(?x)(\[)(?i:size)=
                 (?i:([0-9]{1,3})\b
                     |([^\]]+))
                 (\])/,
      0 => 'meta.tag.template.bbcode',
      1 => 'punctuation.definition.tag.bbcode',
      2 => 'constant.numeric.size.bbcode',
      3 => 'invalid.illegal.expected-a-size.bbcode',
      4 => 'punctuation.definition.tag.bbcode'
    to %r'(\[/)(?i:size)(\])',
      0 => 'meta.tag.template.bbcode',
      1 => 'punctuation.definition.tag.bbcode',
      2 => 'punctuation.definition.tag.bbcode'
    include "$self"
  end
  rule 'meta.link.inline.bbcode' do
    content_scope "string.other.link.title.bbcode"
    from %r/(\[)(?i:url)=([^\]]+)(\])/,
      0 => 'meta.tag.template.bbcode',
      1 => 'punctuation.definition.tag.bbcode',
      2 => 'markup.underline.link.bbcode',
      3 => 'punctuation.definition.tag.bbcode'
    to %r'(\[/)(?i:url)(\])',
      0 => 'meta.tag.template.bbcode',
      1 => 'punctuation.definition.tag.bbcode',
      2 => 'punctuation.definition.tag.bbcode'
    include "$self"
  end
  rule 'meta.link.inline.bbcode' do
    content_scope "markup.underline.link.bbcode"
    from %r/(\[)(?i:url)(\])/
    to %r'(\[/)(?i:url)(\])'
    both 0 => 'meta.tag.template.bbcode',
         1 => 'punctuation.definition.tag.bbcode',
         2 => 'punctuation.definition.tag.bbcode'
    rule do
      # FIXME: (warning) regular expression has ']' without escape
      match %r/[\[]]+/
    end
  end
  rule 'meta.link.inline.bbcode' do
    content_scope "markup.underline.link.email.bbcode"
    from %r/(\[)(?i:email)(\])/
    to %r'(\[/)(?i:email)(\])'
    both 0 => 'meta.tag.template.bbcode',
         1 => 'punctuation.definition.tag.bbcode',
         2 => 'punctuation.definition.tag.bbcode'
    rule do
      # FIXME: (warning) regular expression has ']' without escape
      match %r/[\[]]+/
    end
  end
  rule 'meta.link.image.bbcode' do
    content_scope "markup.underline.link.image.bbcode"
    from %r/(\[)(?i:img)(:((?i:right|left|top))|([^\]]+))?(\])/,
      0 => 'meta.tag.template.bbcode',
      1 => 'punctuation.definition.tag.bbcode',
      3 => 'constant.other.alignment.bbcode',
      4 => 'invalid.illegal.expected-an-alignment.bbcode',
      5 => 'punctuation.definition.tag.bbcode'
    to %r'(\[/)(?i:img)(\])',
      0 => 'meta.tag.template.bbcode',
      1 => 'punctuation.definition.tag.bbcode',
      2 => 'punctuation.definition.tag.bbcode'
    rule do
      # FIXME: (warning) regular expression has ']' without escape
      match %r/[\[]]+?/
    end
  end
  rule 'constant.other.smiley.bbcode' do
    match %r/(?x)
        (
          (
            (:)
            (mad|rolleyes|cool|eek|confused|devious|
            judge|scared|eyebrow|bigdumbgrin)
            (:)
          )
          | (?::\)|;\)|:D|:\(|:p|:o)
        )/,
      3 => 'punctuation.definition.constant.bbcode',
      5 => 'punctuation.definition.constant.bbcode'
  end
end
