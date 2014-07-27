# encoding: utf-8

language 'YAML' => 'source.yaml' do
  file_types %w(yaml yml)
  folding_start_marker %r/^[^#]\s*.*:(\s*\[?| &.+)?$/
  folding_stop_marker %r/^\s*$|^\s*\}|^\s*\]|^\s*\)/
  key_equivalent "^~Y"  # TextMate only
  uuid "B0C44228-4F1F-11DA-AFF2-000A95AF0064"  # TextMate only

  include "#erb"
  rule 'string.unquoted.block.yaml' do
    from %r/^(\s*)(?:(-)|(?:(-\s*)?(\w+\s*(:))))\s*(\||>)/,
      2 => 'punctuation.definition.entry.yaml',
      3 => 'punctuation.definition.entry.yaml',
      4 => 'entity.name.tag.yaml',
      5 => 'punctuation.separator.key-value.yaml'
    to %r/^(?!^\1)|^(?=\1(-|\w+\s*:)|#)/
    include "#erb"
  end
  rule 'constant.numeric.yaml' do
    match %r/(?:(?:(-\s*)?(\w+\s*(:)))|(-))\s*((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)(L|l|UL|ul|u|U|F|f)?\s*$/,
      1 => 'punctuation.definition.entry.yaml',
      2 => 'entity.name.tag.yaml',
      3 => 'punctuation.separator.key-value.yaml',
      4 => 'punctuation.definition.entry.yaml'
  end
  rule 'string.unquoted.yaml' do
    match %r/(?:(?:(-\s*)?(\w+\s*(:)))|(-))\s*(?:((")[^"]*("))|((')[^']*('))|([^,{}&#\[\]]+))\s*/,
      1 => 'punctuation.definition.entry.yaml',
      2 => 'entity.name.tag.yaml',
      3 => 'punctuation.separator.key-value.yaml',
      4 => 'punctuation.definition.entry.yaml',
      5 => 'string.quoted.double.yaml',
      6 => 'punctuation.definition.string.begin.yaml',
      7 => 'punctuation.definition.string.end.yaml',
      8 => 'string.quoted.single.yaml',
      9 => 'punctuation.definition.string.begin.yaml',
      10 => 'punctuation.definition.string.end.yaml',
      11 => 'string.unquoted.yaml'
  end
  rule 'constant.other.date.yaml' do
    match %r/(?:(?:(-\s*)?(\w+\s*(:)))|(-))\s*([0-9]{4}-[0-9]{2}-[0-9]{2})\s*$/,
      1 => 'punctuation.definition.entry.yaml',
      2 => 'entity.name.tag.yaml',
      3 => 'punctuation.separator.key-value.yaml',
      4 => 'punctuation.definition.entry.yaml'
  end
  rule 'meta.tag.yaml' do
    match %r/(\w.*?)(:)\s*((\!\!)omap)?/,
      1 => 'entity.name.tag.yaml',
      2 => 'punctuation.separator.key-value.yaml',
      3 => 'keyword.other.omap.yaml',
      4 => 'punctuation.definition.keyword.yaml'
  end
  rule 'variable.other.yaml' do
    match %r/(\&|\*)\w.*?$/,
      1 => 'punctuation.definition.variable.yaml'
  end
  rule 'string.quoted.double.yaml' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.yaml'
    to %r/"/,
      0 => 'punctuation.definition.string.end.yaml'
    include "#escaped_char"
    include "#erb"
  end
  rule 'string.quoted.single.yaml' do
    from %r/'/,
      0 => 'punctuation.definition.string.begin.yaml'
    to %r/'/,
      0 => 'punctuation.definition.string.end.yaml'
    include "#escaped_char"
    include "#erb"
  end
  rule 'string.interpolated.yaml' do
    from %r/`/,
      0 => 'punctuation.definition.string.begin.yaml'
    to %r/`/,
      0 => 'punctuation.definition.string.end.yaml'
    include "#escaped_char"
    include "#erb"
  end
  rule 'keyword.operator.merge-key.yaml' do
    match %r/(\<\<): ((\*).*)$/,
      1 => 'entity.name.tag.yaml',
      2 => 'keyword.operator.merge-key.yaml',
      3 => 'punctuation.definition.keyword.yaml'
  end
  rule 'invalid.deprecated.trailing-whitespace.yaml' do
    disabled true
    match %r/( |\t)+$/
  end
  rule 'comment.line.number-sign.yaml' do
    match %r/(?<!\$)(#)(?!\{).*$\n?/,
      1 => 'punctuation.definition.comment.yaml'
  end
  rule 'keyword.operator.symbol' do
    match %r/-/
  end
  rule 'meta.leading-tabs.yaml' do
    from %r/^(?=\t)/
    to %r/(?=[^\t])/
    rule do
      match %r/(\t)(\t)?/,
        1 => 'meta.odd-tab',
        2 => 'meta.even-tab'
    end
  end

  fragment :erb do
    rule 'source.ruby.rails.embedded.html' do
      from %r/<%+(?!>)=?/
      to %r/%>/
      both 0 => 'punctuation.section.embedded.ruby'
      rule 'comment.line.number-sign.ruby' do
        match %r/(#).*?(?=%>)/,
          1 => 'punctuation.definition.comment.ruby'
      end
      include "source.ruby.rails"
    end
  end

  fragment :escaped_char do
    rule 'constant.character.escape.yaml' do
      match %r/\\./
    end
  end
end
