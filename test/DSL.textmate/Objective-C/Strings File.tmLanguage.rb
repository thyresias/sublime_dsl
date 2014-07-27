# encoding: utf-8

language 'Strings File' => 'source.strings' do
  file_types %w(strings)
  uuid "429E2DB7-EB4F-4B34-A4DF-DBFD3336C581"  # TextMate only

  rule 'comment.block.strings' do
    from %r'/\*'
    to %r'\*/'
    both 0 => 'punctuation.definition.comment.strings'
  end
  rule 'string.quoted.double.strings' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.strings'
    to %r/"/,
      0 => 'punctuation.definition.string.end.strings'
    rule 'constant.character.escape.strings' do
      match %r/\\(\\|[abefnrtv'"?]|[0-3]\d{,2}|[4-7]\d?|x[a-zA-Z0-9]+)/
    end
    rule 'invalid.illegal.unknown-escape.strings' do
      match %r/\\./
    end
    rule 'constant.other.placeholder.strings' do
      match %r/(?x)%
            (\d+\$)?                             # field (argument #)
            [#0\- +']*                           # flags
            [,;:_]?                              # separator character (AltiVec)
            ((-?\d+)|\*(-?\d+\$)?)?              # minimum field width
            (\.((-?\d+)|\*(-?\d+\$)?)?)?         # precision
            (hh|h|ll|l|j|t|z|q|L|vh|vl|v|hv|hl)? # length modifier
            [@diouxXDOUeEfFgGaACcSspn%]          # conversion type
          /
    end
    rule 'invalid.illegal.placeholder.c' do
      match %r/%/
    end
  end
end
