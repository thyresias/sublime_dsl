# encoding: utf-8

language 'Inform' => 'source.inform' do
  # Should be current for Inform 6.2 or thereabouts – chris@cjack.com
  file_types %w(inf)
  key_equivalent "^~I"  # TextMate only
  uuid "1510B8C7-6B1D-11D9-B82B-000D93589AF6"  # TextMate only

  rule do
    from %r/(^[ \t]+)?(?=!)/,
      1 => 'punctuation.whitespace.comment.leading.inform'
    to %r/(?!\G)/
    rule 'comment.line.exclamation.inform' do
      from %r/!/,
        0 => 'punctuation.definition.comment.inform'
      to %r/\n/
    end
  end
  rule 'meta.function.inform' do
    match %r/(?:\s*)\[(?:\s*)(.*)(?:\s*);/,
      1 => 'entity.name.function.inform'
  end
  rule 'constant.numeric.inform' do
    match %r/\b((\$[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)(L|l|UL|ul|u|U|F|f)?\b/
  end
  rule 'string.quoted.single.inform' do
    from %r/'/,
      0 => 'punctuation.definition.string.begin.inform'
    to %r/'/,
      0 => 'punctuation.definition.string.end.inform'
    rule 'constant.character.escape.inform' do
      match %r/\\./
    end
  end
  rule 'string.quoted.double.inform' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.inform'
    to %r/"/,
      0 => 'punctuation.definition.string.end.inform'
  end
  rule 'keyword.control.inform' do
    match %r/\b(box|break|continue|do|else|font(\s+)(on|off)|for|give|if|jump|new_line|objectloop|print|print_ret|remove|return|rfalse|rtrue|spaces|string|style(\s+)(roman|bold|underline|reverse|fixed)|switch|until|while|has|hasnt|in|notin|ofclass|provides|or)\b/
  end
  rule 'keyword.other.directive.inform' do
    match %r/\b(Abbreviate|Array|Attribute|Class|Constant|Default|End|Endif|Extend|Global|Ifdef|Ifndef|Ifnot|Iftrue|Iffalse|Import|Include|Link|Lowstring|Message|Object|Property|Release|Replace|Serial|Switches|Statusline(\s+)(score|time)|System_file|Verb|Zcharacter)\b/
  end
end
