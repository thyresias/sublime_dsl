# encoding: utf-8

language 'Modula-3' => 'source.modula-3' do
  file_types %w(m3 cm3)
  key_equivalent "^~M"  # TextMate only
  uuid "479D53FA-6ED6-11D9-8471-0011242E4184"  # TextMate only

  rule 'keyword.other.modula-3' do
    match %r/\b(ANY|ARRAY|AS|BEGIN|BITS|BRANDED|BY|CASE|CONST|DIV|DO|ELSE|ELSIF|END|EVAL|EXCEPT|EXCEPTION|EXIT|EXPORTS|FINALLY|FOR|FROM|GENERIC|IF|IMPORT|INTERFACE|LOCK|LOOP|METHODS|MOD|MODULE|OBJECT|OF|OVERRIDES|PROCEDURE|RAISE|RAISES|READONLY|RECORD|REF|REPEAT|RETURN|REVEAL|ROOT|SET|THEN|TO|TRY|TYPE|TYPECASE|UNSAFE|UNTIL|UNTRACED|VALUE|VAR|WHILE|WITH|IN|NOT|AND|OR)\b/
  end
  rule 'storage.type.modula-3' do
    match %r/\b(ABS|ADDRESS|ADR|ADRSIZE|BITSIZE|BOOLEAN|BYTESIZE|CARDINAL|CEILING|CHAR|DEC|DISPOSE|EXTENDED|FIRST|FLOAT|FLOOR|INC|INTEGER|ISTYPE|LAST|LONGREAL|LOOPHOLE|MAX|MIN|MUTEX|NARROW|NEW|NUMBER|ORD|REAL|REFANY|ROUND|SUBARRAY|TEXT|TRUNC|TYPECODE|VAL)\b/
  end
  rule 'constant.language.modula-3' do
    match %r/\b(FALSE|NIL|NULL|TRUE)\b/
  end
  rule 'constant.numeric.modula-3' do
    match %r/\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)(L|l|UL|ul|u|U|F|f|ll|LL|ull|ULL)?\b/
  end
  rule 'string.quoted.single.modula-3' do
    from %r/'/,
      0 => 'punctuation.definition.string.begin.modula-3'
    to %r/'/,
      0 => 'punctuation.definition.string.end.modula-3'
    rule 'constant.character.escape.modula-3' do
      match %r/\\([ntrf\\'"]|([0-7]{3}))/
    end
  end
  rule 'string.quoted.double.modula-3' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.modula-3'
    to %r/"/,
      0 => 'punctuation.definition.string.end.modula-3'
    rule 'constant.character.escape.modula-3' do
      match %r/\\([ntrf\\'"]|([0-7]{3}))/
    end
  end
  rule 'comment.block.modula-3' do
    from %r/\(\*/
    to %r/\*\)/
    both 0 => 'punctuation.definition.comment.modula-3'
  end
end
