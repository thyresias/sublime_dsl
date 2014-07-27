# encoding: utf-8

language 'Smarty' => 'source.smarty' do
  # FIXME: no file types
  folding_start_marker %r/(<(?i:(head|table|tr|div|style|script|ul|ol|form|dl))\b.*?>|\{\{?(if|foreach|capture|literal|foreach|php|section|strip)|\{\s*$)/
  folding_stop_marker %r'(</(?i:(head|table|tr|div|style|script|ul|ol|form|dl))>|\{\{?/(if|foreach|capture|literal|foreach|php|section|strip)|(^|\s)\})'
  uuid "4D6BBA54-E3FC-4296-9CA1-662B2AD537C6"  # TextMate only

  rule 'comment.block.smarty' do
    from %r/(?<=\{)\*/
    to %r/\*(?=\})/
    both 0 => 'punctuation.definition.comment.smarty'
  end
  rule 'keyword.control.smarty' do
    match %r/\b(if|else|elseif|foreach|foreachelse|section)\b/
  end
  rule 'support.function.built-in.smarty' do
    match %r/\b(capture|config_load|counter|cycle|debug|eval|fetch|include_php|include|insert|literal|math|strip|rdelim|ldelim|assign|html_[a-z_]*)\b/
  end
  rule 'keyword.operator.smarty' do
    match %r/\b(and|or)\b/
  end
  rule 'keyword.operator.other.smarty' do
    match %r/\b(eq|neq|gt|lt|gte|lte|is|not|even|odd|not|mod|div|by)\b/
  end
  rule 'support.function.variable-modifier.smarty' do
    match %r/\|(capitalize|cat|count_characters|count_paragraphs|count_sentences|count_words|date_format|default|escape|indent|lower|nl2br|regex_replace|replace|spacify|string_format|strip_tags|strip|truncate|upper|wordwrap)/
  end
  rule 'meta.attribute.smarty' do
    match %r/\b[a-zA-Z]+=/
  end
  rule 'string.quoted.single.smarty' do
    from %r/'/,
      0 => 'punctuation.definition.string.begin.smarty'
    to %r/'/,
      0 => 'punctuation.definition.string.end.smarty'
    rule 'constant.character.escape.smarty' do
      match %r/\\./
    end
  end
  rule 'string.quoted.double.smarty' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.smarty'
    to %r/"/,
      0 => 'punctuation.definition.string.end.smarty'
    rule 'constant.character.escape.smarty' do
      match %r/\\./
    end
  end
  rule 'variable.other.global.smarty' do
    match %r/\b(\$)Smarty\./,
      1 => 'punctuation.definition.variable.smarty'
  end
  rule 'variable.other.smarty' do
    # FIXME: (error) invalid hex escape
    match %r/(\$)[a-zA-Z_\x{7f}-\x{ff}][a-zA-Z0-9_\x{7f}-\x{ff}]*?\b/,
      1 => 'punctuation.definition.variable.smarty'
  end
  rule 'constant.language.smarty' do
    match %r/\b(TRUE|FALSE|true|false)\b/
  end
end
