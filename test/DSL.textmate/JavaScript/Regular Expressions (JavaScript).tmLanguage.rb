# encoding: utf-8

language 'Regular Expressions (JavaScript)' => 'source.js.regexp' do
  # FIXME: no file types
  uuid "AC8679DE-3AC7-4056-84F9-69A7ADC29DDD"  # TextMate only

  include "#regexp"

  fragment :"regex-character-class" do
    rule 'constant.character.character-class.regexp' do
      match %r/\\[wWsSdD]|\./
    end
    rule 'constant.character.numeric.regexp' do
      match %r/\\([0-7]{3}|x\h\h|u\h\h\h\h)/
    end
    rule 'constant.character.control.regexp' do
      match %r/\\c[A-Z]/
    end
    rule 'constant.character.escape.backslash.regexp' do
      match %r/\\./
    end
  end

  fragment :regexp do
    rule 'keyword.control.anchor.regexp' do
      match %r/\\[bB]|\^|\$/
    end
    rule 'keyword.other.back-reference.regexp' do
      match %r/\\[1-9]\d*/
    end
    rule 'keyword.operator.quantifier.regexp' do
      match %r/[?+*]|\{(\d+,\d+|\d+,|,\d+|\d+)\}\??/
    end
    rule 'keyword.operator.or.regexp' do
      match %r/\|/
    end
    rule 'meta.group.assertion.regexp' do
      from %r/(\()((\?=)|(\?!))/,
        1 => 'punctuation.definition.group.regexp',
        3 => 'meta.assertion.look-ahead.regexp',
        4 => 'meta.assertion.negative-look-ahead.regexp'
      to %r/(\))/,
        1 => 'punctuation.definition.group.regexp'
      include "#regexp"
    end
    rule 'meta.group.regexp' do
      from %r/\((\?:)?/
      to %r/\)/
      both 0 => 'punctuation.definition.group.regexp'
      include "#regexp"
    end
    rule 'constant.other.character-class.set.regexp' do
      from %r/(\[)(\^)?/,
        1 => 'punctuation.definition.character-class.regexp',
        2 => 'keyword.operator.negation.regexp'
      to %r/(\])/,
        1 => 'punctuation.definition.character-class.regexp'
      rule 'constant.other.character-class.range.regexp' do
        match %r/(?:.|(\\(?:[0-7]{3}|x\h\h|u\h\h\h\h))|(\\c[A-Z])|(\\.))\-(?:[^\]\\]|(\\(?:[0-7]{3}|x\h\h|u\h\h\h\h))|(\\c[A-Z])|(\\.))/,
          1 => 'constant.character.numeric.regexp',
          2 => 'constant.character.control.regexp',
          3 => 'constant.character.escape.backslash.regexp',
          4 => 'constant.character.numeric.regexp',
          5 => 'constant.character.control.regexp',
          6 => 'constant.character.escape.backslash.regexp'
      end
      include "#regex-character-class"
    end
    include "#regex-character-class"
  end
end
