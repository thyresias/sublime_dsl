# encoding: utf-8

language 'Gettext' => 'source.po' do
  #
  # TODO:  Command for copy original to untranslated, label as fuzzy, remove fuzzy, next fuzzy etc
  # Create meta scope for each entry
  file_types %w(po potx)
  key_equivalent "^~G"  # TextMate only
  uuid "F07730BD-59BC-41D0-AC3F-4AB2DCB6C54A"  # TextMate only

  rule do
    # Start of body of document, after header
    from %r/^(?=(msgid(_plural)?|msgctxt)\s*"[^"])|^\s*$/
    to %r/\z/
    include "#body"
  end
  include "#comments"
  rule 'comment.line.number-sign.po' do
    match %r/^msg(id|str)\s+""\s*$\n?/
  end
  rule 'meta.header.po' do
    match %r/^"(?:([^\s:]+)(:)\s+)?([^"]*)"\s*$\n?/,
      1 => 'constant.language.po',
      2 => 'punctuation.separator.key-value.po',
      3 => 'string.other.po'
  end

  fragment :body do
    rule 'meta.scope.msgid.po' do
      from %r/^(msgid(_plural)?)\s+/,
        1 => 'keyword.control.msgid.po'
      to %r/^(?!")/
      rule 'string.quoted.double.po' do
        from %r/(\G|^)"/
        to %r/"/
        rule 'constant.character.escape.po' do
          match %r/\\[\\"]/
        end
      end
    end
    rule 'meta.scope.msgstr.po' do
      from %r/^(msgstr)(?:(\[)(\d+)(\]))?\s+/,
        1 => 'keyword.control.msgstr.po',
        2 => 'keyword.control.msgstr.po',
        3 => 'constant.numeric.po',
        4 => 'keyword.control.msgstr.po'
      to %r/^(?!")/
      rule 'string.quoted.double.po' do
        from %r/(\G|^)"/
        to %r/"/
        rule 'constant.character.escape.po' do
          match %r/\\[\\"]/
        end
      end
    end
    rule 'meta.scope.msgctxt.po' do
      from %r/^(msgctxt)(?:(\[)(\d+)(\]))?\s+/,
        1 => 'keyword.control.msgctxt.po',
        2 => 'keyword.control.msgctxt.po',
        3 => 'constant.numeric.po',
        4 => 'keyword.control.msgctxt.po'
      to %r/^(?!")/
      rule 'string.quoted.double.po' do
        from %r/(\G|^)"/
        to %r/"/
        rule 'constant.character.escape.po' do
          match %r/\\[\\"]/
        end
      end
    end
    rule 'comment.line.number-sign.obsolete.po' do
      match %r/^(#~).*$\n?/,
        1 => 'punctuation.definition.comment.po'
    end
    include "#comments"
    rule 'invalid.illegal.po' do
      # a line that does not begin with # or ". Could improve this regexp
      match %r/^(?!\s*$)[^#"].*$\n?/
    end
  end

  fragment :comments do
    rule do
      from %r/^(?=#)/
      to %r/(?!\G)/
      rule 'comment.line.number-sign.flag.po' do
        from %r/(#,)\s+/,
          1 => 'punctuation.definition.comment.po'
        to %r/\n/
        rule do
          match %r/(?:\G|,\s*)((?:fuzzy)|(?:no-)?(?:c|objc|sh|lisp|elisp|librep|scheme|smalltalk|java|csharp|awk|object-pascal|ycp|tcl|perl|perl-brace|php|gcc-internal|qt|boost)-format)/,
            1 => 'entity.name.type.flag.po'
        end
      end
      rule 'comment.line.number-sign.extracted.po' do
        from %r/#\./,
          0 => 'punctuation.definition.comment.po'
        to %r/\n/
      end
      rule 'comment.line.number-sign.reference.po' do
        from %r/(#:)[ \t]*/,
          1 => 'punctuation.definition.comment.po'
        to %r/\n/
        rule 'storage.type.class.po' do
          match %r/(\S+:)([\d;]*)/
        end
      end
      rule 'comment.line.number-sign.previous.po' do
        from %r/#\|/,
          0 => 'punctuation.definition.comment.po'
        to %r/\n/
      end
      rule 'comment.line.number-sign.po' do
        from %r/#/,
          0 => 'punctuation.definition.comment.po'
        to %r/\n/
      end
    end
  end
end
