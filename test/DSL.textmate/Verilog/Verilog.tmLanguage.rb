# encoding: utf-8

language 'Verilog' => 'source.verilog' do
  file_types %w(v vh)
  key_equivalent "^~V"  # TextMate only
  uuid "7F4396B3-A33E-44F0-8502-98CA6C25971F"  # TextMate only

  include "#comments"
  include "#module_pattern"
  include "#keywords"
  include "#constants"
  include "#strings"
  include "#operators"

  fragment :comments do
    rule do
      from %r'(^[ \t]+)?(?=//)',
        1 => 'punctuation.whitespace.comment.leading.verilog'
      to %r/(?!\G)/
      rule 'comment.line.double-slash.verilog' do
        from %r'//',
          0 => 'punctuation.definition.comment.verilog'
        to %r/\n/
      end
    end
    rule 'comment.block.c-style.verilog' do
      from %r'/\*'
      to %r'\*/'
    end
  end

  fragment :constants do
    rule 'constant.numeric.sized_integer.verilog' do
      match %r/\b[0-9]+'[bBoOdDhH][a-fA-F0-9_xXzZ]+\b/
    end
    rule 'meta.block.numeric.range.verilog' do
      match %r/\b(\d+)(:)(\d+)\b/,
        1 => 'constant.numeric.integer.verilog',
        2 => 'punctuation.separator.range.verilog',
        3 => 'constant.numeric.integer.verilog'
    end
    rule 'constant.numeric.integer.verilog' do
      match %r/\b\d+(?i:e\d+)?\b/
    end
    rule 'constant.numeric.real.verilog' do
      match %r/\b\d+\.\d+(?i:e\d+)?\b/
    end
    rule 'constant.numeric.delay.verilog' do
      match %r/#\d+/
    end
    rule 'constant.numeric.logic.verilog' do
      match %r/\b[01xXzZ]+\b/
    end
  end

  fragment :instantiation_patterns do
    include "#keywords"
    rule 'meta.block.instantiation.parameterless.verilog' do
      from %r/^\s*([a-zA-Z][a-zA-Z0-9_]*)\s+([a-zA-Z][a-zA-Z0-9_]*)(?<!begin|if)\s*(?=\(|$)/,
        1 => 'entity.name.tag.module.reference.verilog',
        2 => 'entity.name.tag.module.identifier.verilog'
      to %r/;/,
        0 => 'punctuation.terminator.expression.verilog'
      include "#comments"
      include "#constants"
      include "#strings"
    end
    rule 'meta.block.instantiation.with.parameters.verilog' do
      from %r/^\s*([a-zA-Z][a-zA-Z0-9_]*)\s*(#)(?=\s*\()/,
        1 => 'entity.name.tag.module.reference.verilog'
      to %r/;/,
        0 => 'punctuation.terminator.expression.verilog'
      include "#parenthetical_list"
      rule 'entity.name.tag.module.identifier.verilog' do
        match %r/[a-zA-Z][a-zA-Z0-9_]*/
      end
    end
  end

  fragment :keywords do
    rule 'keyword.other.verilog' do
      match %r/\b(always|and|assign|attribute|begin|buf|bufif0|bufif1|case(xz)?|cmos|deassign|default|defparam|disable|edge|else|end(attribute|case|function|module|primitive|specify|table|task)?|event|for|force|forever|fork|function|highz(01)|if(none)?|initial|inout|input|integer|join|medium|module|large|macromodule|nand|negedge|nmos|nor|not|notif(01)|or|output|parameter|pmos|posedge|primitive|pull0|pull1|pulldown|pullup|rcmos|real|realtime|reg|release|repeat|rnmos|rpmos|rtran|rtranif(01)|scalared|signed|small|specify|specparam|strength|strong0|strong1|supply0|supply1|table|task|time|tran|tranif(01)|tri(01)?|tri(and|or|reg)|unsigned|vectored|wait|wand|weak(01)|while|wire|wor|xnor|xor)\b/
    end
    rule 'keyword.other.compiler.directive.verilog' do
      match %r/^\s*`((cell)?define|default_(decay_time|nettype|trireg_strength)|delay_mode_(path|unit|zero)|ifdef|include|end(if|celldefine)|else|(no)?unconnected_drive|resetall|timescale|undef)\b/
    end
    rule 'support.function.system.console.tasks.verilog' do
      match %r/\$(f(open|close)|readmem(b|h)|timeformat|printtimescale|stop|finish|(s|real)?time|realtobits|bitstoreal|rtoi|itor|(f)?(display|write(h|b)))\b/
    end
    rule 'support.function.system.random_number.tasks.verilog' do
      match %r/\$(random|dist_(chi_square|erlang|exponential|normal|poisson|t|uniform))\b/
    end
    rule 'support.function.system.pld_modeling.tasks.verilog' do
      match %r/\$((a)?sync\$((n)?and|(n)or)\$(array|plane))\b/
    end
    rule 'support.function.system.stochastic.tasks.verilog' do
      match %r/\$(q_(initialize|add|remove|full|exam))\b/
    end
    rule 'support.function.system.timing.tasks.verilog' do
      match %r/\$(hold|nochange|period|recovery|setup(hold)?|skew|width)\b/
    end
    rule 'support.function.system.vcd.tasks.verilog' do
      match %r/\$(dump(file|vars|off|on|all|limit|flush))\b/
    end
    rule 'support.function.non-standard.tasks.verilog' do
      match %r/\$(countdrivers|list|input|scope|showscopes|(no)?(key|log)|reset(_count|_value)?|(inc)?save|restart|showvars|getpattern|sreadmem(b|h)|scale)/
    end
  end

  fragment :module_pattern do
    rule 'meta.block.module.verilog' do
      from %r/\b(module)\s+([a-zA-Z][a-zA-Z0-9_]*)/,
        1 => 'storage.type.module.verilog',
        2 => 'entity.name.type.module.verilog'
      to %r/\bendmodule\b/,
        0 => 'storage.type.module.verilog'
      include "#comments"
      include "#keywords"
      include "#constants"
      include "#strings"
      include "#instantiation_patterns"
      include "#operators"
    end
  end

  fragment :operators do
    rule 'keyword.operator.verilog' do
      match %r'\+|-|\*|/|%|(<|>)=?|(!|=)?==?|!|&&?|\|\|?|\^?~|~\^?'
    end
  end

  fragment :parenthetical_list do
    rule 'meta.block.parenthetical_list.verilog' do
      from %r/\(/
      to %r/\)/
      both 0 => 'punctuation.section.list.verilog'
      include "#parenthetical_list"
      include "#comments"
      include "#keywords"
      include "#constants"
      include "#strings"
    end
  end

  fragment :strings do
    rule 'string.quoted.double.verilog' do
      from %r/"/
      to %r/"/
      rule 'constant.character.escape.verilog' do
        match %r/\\./
      end
    end
  end
end
