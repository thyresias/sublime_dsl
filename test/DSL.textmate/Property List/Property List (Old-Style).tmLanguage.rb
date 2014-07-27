# encoding: utf-8

language 'Property List (Old-Style)' => 'source.plist' do
  file_types %w(plist dict scriptSuite scriptTerminology savedSearch)
  first_line_match %r'\A// .*?\b(?i:property list)\b'
  key_equivalent "^~P"  # TextMate only
  uuid "4AF93608-4D0E-4766-802B-44795305E468"  # TextMate only

  rule do
    from %r/(?=\(|\{)/
    to %r/(?=not)possible/
    include "#dictionary"
    include "#array"
    include "#comment"
    include "#stray"
  end
  include "#comment"
  include "#stray"

  fragment :array do
    rule 'meta.scope.array.plist' do
      from %r/\G\(/,
        0 => 'punctuation.definition.array.begin.plist'
      to %r/\)/,
        0 => 'punctuation.definition.array.end.plist'
      include "#array_item"
      include "#comment"
      include "#stray"
    end
  end

  fragment :array_item do
    rule 'meta.scope.array-item.plist' do
      from %r/(?=<|\(|\{|"|'|[-a-zA-Z0-9_.])/
      to %r/,|(?=\))/,
        0 => 'punctuation.separator.array.plist'
      include "#dictionary"
      include "#array"
      include "#string"
      include "#binary"
      include "#comment"
      include "#stray"
    end
  end

  fragment :binary do
    rule 'meta.binary-data.plist' do
      content_scope "constant.numeric.base64.plist"
      from %r/\G</,
        1 => 'punctuation.definition.data.plist'
      to %r/(=?)\s*(>)/,
        1 => 'punctuation.terminator.data.plist',
        2 => 'punctuation.definition.data.plist'
      rule 'invalid.illegal.invalid-character.plist' do
        match %r'[^A-Za-z0-9+/ \n]'
      end
    end
  end

  fragment :comment do
    rule 'comment.block.plist' do
      from %r'/\*'
      to %r'\*/'
      both 0 => 'punctuation.definition.comment.begin.plist'
    end
    rule do
      from %r'(^[ \t]+)?(?=//)',
        1 => 'punctuation.whitespace.comment.leading.plist'
      to %r/(?!\G)/
      rule 'comment.line.double-slash.plist' do
        from %r'//',
          0 => 'punctuation.definition.comment.plist'
        to %r/\n/
      end
    end
  end

  fragment :dictionary do
    rule 'meta.scope.dictionary.plist' do
      from %r/\G\{/,
        0 => 'punctuation.definition.dictionary.begin.plist'
      to %r/\}/,
        0 => 'punctuation.definition.dictionary.end.plist'
      include "#dictionary_item"
      include "#comment"
      include "#stray"
    end
  end

  fragment :dictionary_item do
    rule 'meta.scope.dictionary-item.${3/[[\s\x20-\x7F]&&[:^alnum:]]//g}${7/[[\s\x20-\x7F]&&[:^alnum:]]//g}${9/[[\s\x20-\x7F]&&[:^alnum:]]//g}.plist' do
      from %r/(?>((")((?:[^"\\]|\\.)*)("))|((')((?:[^'\\]|\\.)*)('))|([-a-zA-Z0-9_.]+))/,
        1 => 'string.quoted.double.plist',
        2 => 'punctuation.definition.string.begin.plist',
        3 => 'constant.other.key.plist',
        4 => 'punctuation.definition.string.end.plist',
        5 => 'string.quoted.single.plist',
        6 => 'punctuation.definition.string.begin.plist',
        7 => 'constant.other.key.plist',
        8 => 'punctuation.definition.string.end.plist',
        9 => 'constant.other.key.plist'
      to %r/;|(?=\})/,
        0 => 'punctuation.separator.dictionary.plist'
      include "#dictionary_item_contents"
    end
  end

  fragment :dictionary_item_contents do
    rule do
      from %r/=/
      to %r/(?=;|\})/
      rule do
        from %r/(?=<|\(|\{|"|'|[-a-zA-Z0-9_.])/
        to %r/(?=;|\})/
        include "#dictionary"
        include "#array"
        include "#string"
        include "#binary"
        include "#stray"
      end
      include "#stray_alpha"
    end
    include "#stray"
  end

  fragment :stray do
    rule 'invalid.illegal.character-not-allowed-here.plist' do
      from %r/\S/
      to %r:(?=\{|\(|/\*|//|"|'|<|,|;|\)|\}|=):
    end
  end

  fragment :stray_alpha do
    rule 'invalid.illegal.character-not-allowed-here.plist' do
      from %r/\S/
      to %r:(?=\{|\(|/\*|//|"|'|<|,|;|\)|\}|=|\b[a-zA-Z0-9]|[-_.]):
    end
  end

  fragment :string do
    rule 'string.quoted.single.plist' do
      from %r/\G'/,
        0 => 'punctuation.definition.string.begin.plist'
      to %r/'(?!')/,
        0 => 'punctuation.definition.string.end.plist'
      include "#string-contents"
    end
    rule 'string.quoted.double.plist' do
      from %r/\G"/,
        0 => 'punctuation.definition.string.begin.plist'
      to %r/"/,
        0 => 'punctuation.definition.string.end.plist'
      include "#string-contents"
    end
    rule 'constant.numeric.plist' do
      match %r/\G[-+]?\d+(\.\d*)?(E[-+]\d+)?(?!\w)/
    end
    rule 'string.unquoted.plist' do
      match %r/\G[-a-zA-Z0-9_.]+/
    end
  end

  fragment :"string-contents" do
    rule 'constant.character.escape.plist' do
      match %r/\\([uU](\h{4}|\h{2})|\d{1,3}|.)/
    end
  end
end
