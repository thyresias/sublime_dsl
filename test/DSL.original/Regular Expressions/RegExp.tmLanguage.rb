# encoding: utf-8

language 'Regular Expression' => 'source.regexp', file: 'RegExp' do
  # Matches Oniguruma's Ruby regexp syntax (TextMate uses Oniguruma in Ruby mode).
  file_types %w(re)
  folding_start_marker %r'(/\*|\{|\()'
  folding_stop_marker %r'(\*/|\}|\))'
  key_equivalent "^~R"  # TextMate only
  uuid "BAFE4C4F-8D59-48CD-A3BC-52A2084531C9"  # TextMate only

  rule 'keyword.operator.regexp' do
    match %r/\|/
  end
  rule 'keyword.control.anchors.regexp' do
    match %r/\\[bBAZzG^$]/
  end
  include "#character_class"
  include "#escaped_char"
  rule 'keyword.control.set.regexp' do
    from %r/\[(?:\^?\])?/
    to %r/\]/
    include "#character_class"
    include "#escaped_char"
    rule 'constant.other.range.regexp' do
      match %r/.-./
    end
    rule 'keyword.operator.intersection.regexp' do
      match %r/.&&./
    end
  end
  rule 'string.regexp.group' do
    from %r/\(/
    to %r/\)/
    include "source.regexp"
    rule 'constant.other.assertion.regexp' do
      match %r/(?<=\()\?(<[=!]|>|=|:|!)/
    end
    rule 'comment.line.number-sign.regexp' do
      match %r/(?<=\()\?#/
    end
  end
  rule 'keyword.other.backref-and-recursion.regexp' do
    # FIXME: (warning) invalid back reference
    # FIXME: (warning) invalid subexp call
    match %r/\\(\n\d+|\k\w+|(?<!\|)\g\w+)/
  end
  rule 'constant.character.escape.regexp' do
    match %r/\\([tvnrbfae]|[0-8]{3}|x\H\H\{7\H{7}\}|x\H\H|c\d+|C-\d+|M-\d+|M-\\C-\d+)/
  end
  rule 'keyword.operator.quantifier.regexp' do
    match %r/((?<!\()[?*+][?+]?)|\{\d*,\d*\}/
  end

  fragment :character_class do
    rule 'keyword.control.character-class.regexp' do
      match %r/\\[wWsSdDhH]/
    end
  end

  fragment :escaped_char do
    rule 'constant.character.escape.regexp' do
      # escaped character
      match %r/\\./
    end
  end
end
