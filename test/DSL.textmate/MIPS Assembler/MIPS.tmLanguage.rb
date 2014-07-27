# encoding: utf-8

language 'MIPS Assembler' => 'source.mips', file: 'MIPS' do
  file_types %w(s mips spim asm)
  key_equivalent "^~M"  # TextMate only
  uuid "7FD88C2E-6BE3-11D9-9A40-0011242E4184"  # TextMate only

  rule 'support.function.pseudo.mips' do
    # ok actually this are instructions, but one also could call them funtions…
    match %r/\b(mul|abs|div|divu|mulo|mulou|neg|negu|not|rem|remu|rol|ror|li|seq|sge|sgeu|sgt|sgtu|sle|sleu|sne|b|beqz|bge|bgeu|bgt|bgtu|ble|bleu|blt|bltu|bnez|la|ld|ulh|ulhu|ulw|sd|ush|usw|move|mfc1\.d|l\.d|l\.s|s\.d|s\.s)\b/
  end
  rule 'support.function.mips' do
    match %r/\b(abs\.d|abs\.s|add|add\.d|add\.s|addi|addiu|addu|and|andi|bc1f|bc1t|beq|bgez|bgezal|bgtz|blez|bltz|bltzal|bne|break|c\.eq\.d|c\.eq\.s|c\.le\.d|c\.le\.s|c\.lt\.d|c\.lt\.s|ceil\.w\.d|ceil\.w\.s|clo|clz|cvt\.d\.s|cvt\.d\.w|cvt\.s\.d|cvt\.s\.w|cvt\.w\.d|cvt\.w\.s|div|div\.d|div\.s|divu|eret|floor\.w\.d|floor\.w\.s|j|jal|jalr|jr|lb|lbu|lh|lhu|ll|lui|lw|lwc1|lwl|lwr|madd|maddu|mfc0|mfc1|mfhi|mflo|mov\.d|mov\.s|movf|movf\.d|movf\.s|movn|movn\.d|movn\.s|movt|movt\.d|movt\.s|movz|movz\.d|movz\.s|msub|mtc0|mtc1|mthi|mtlo|mul|mul\.d|mul\.s|mult|multu|neg\.d|neg\.s|nop|nor|or|ori|round\.w\.d|round\.w\.s|sb|sc|sdc1|sh|sll|sllv|slt|slti|sltiu|sltu|sqrt\.d|sqrt\.s|sra|srav|srl|srlv|sub|sub\.d|sub\.s|subu|sw|swc1|swl|swr|syscall|teq|teqi|tge|tgei|tgeiu|tgeu|tlt|tlti|tltiu|tltu|trunc\.w\.d|trunc\.w\.s|xor|xori)\b/
  end
  rule 'storage.type.mips' do
    match %r/\.(ascii|asciiz|byte|data|double|float|half|kdata|ktext|space|text|word|set\s*(noat|at))\b/
  end
  rule 'storage.modifier.mips' do
    match %r/\.(align|extern||globl)\b/
  end
  rule 'meta.function.label.mips' do
    match %r/\b([A-Za-z0-9_]+):/,
      1 => 'entity.name.function.label.mips'
  end
  rule 'variable.other.register.usable.by-number.mips' do
    match %r/(\$)(0|[2-9]|1[0-9]|2[0-5]|2[89]|3[0-1])\b/,
      1 => 'punctuation.definition.variable.mips'
  end
  rule 'variable.other.register.usable.by-name.mips' do
    match %r/(\$)(zero|v[01]|a[0-3]|t[0-9]|s[0-7]|gp|sp|fp|ra)\b/,
      1 => 'punctuation.definition.variable.mips'
  end
  rule 'variable.other.register.reserved.mips' do
    match %r/(\$)(at|k[01]|1|2[67])\b/,
      1 => 'punctuation.definition.variable.mips'
  end
  rule 'variable.other.register.usable.floating-point.mips' do
    match %r/(\$)f([0-9]|1[0-9]|2[0-9]|3[0-1])\b/,
      1 => 'punctuation.definition.variable.mips'
  end
  rule 'constant.numeric.float.mips' do
    match %r/\b\d+\.\d+\b/
  end
  rule 'constant.numeric.integer.mips' do
    match %r/\b(\d+|0(x|X)[a-fA-F0-9]+)\b/
  end
  rule 'string.quoted.double.mips' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.mips'
    to %r/"/,
      0 => 'punctuation.definition.string.end.mips'
    rule 'constant.character.escape.mips' do
      match %r/\\[rnt\\"]/
    end
  end
  rule do
    from %r/(^[ \t]+)?(?=#)/,
      1 => 'punctuation.whitespace.comment.leading.mips'
    to %r/(?!\G)/
    rule 'comment.line.number-sign.mips' do
      from %r/#/,
        0 => 'punctuation.definition.comment.mips'
      to %r/\n/
    end
  end
end
