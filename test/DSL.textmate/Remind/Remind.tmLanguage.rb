# encoding: utf-8

language 'Remind' => 'source.remind' do
  file_types %w(defs.rem REM*.txt .reminders)
  first_line_match %r/^REM*/
  uuid "8D255A1E-9CBC-4B22-8AAD-F8536C276727"  # TextMate only

  rule do
    from %r/(^[ \t]+)?(?=#)/,
      1 => 'punctuation.whitespace.comment.leading.remind'
    to %r/(?!\G)/
    rule 'comment.line.number-sign.remind' do
      from %r/#/,
        0 => 'punctuation.definition.comment.remind'
      to %r/\n/
    end
  end
  rule do
    from %r/(^[ \t]+)?(?=;)/,
      1 => 'punctuation.whitespace.comment.leading.remind'
    to %r/(?!\G)/
    rule 'comment.line.semicolon.remind' do
      from %r/;/,
        0 => 'punctuation.definition.comment.remind'
      to %r/\n/
    end
  end
  rule 'meta.single.command.remind' do
    match %r/\b(?i:(?:RUN\s+(ON|OFF))|(PUSH|CLEAR|POP)-OMIT-CONTEXT)\b/,
      0 => 'keyword.control.single.command.remind'
  end
  rule 'meta.setline.remind' do
    from %r/\b(?i:(SET))\s+(\$?\w+)\s+/,
      1 => 'keyword.control.set.setline.remind',
      2 => 'variable.other.setline.remind'
    to %r/(?=#|\n|\z)/
    include "#expression"
  end
  rule 'meta.fsetline.remind' do
    from %r/\b(?i:(FSET))\s+(\w+(\())(\w+)?(?:,(\w+))*(\))/,
      1 => 'keyword.control.fset.fsetline.remind',
      2 => 'entity.name.function.fsetline.remind',
      3 => 'punctuation.definition.arguments.remind',
      4 => 'variable.parameter.fsetline.remind',
      5 => 'variable.parameter.fsetline.remind',
      6 => 'punctuation.definition.arguments.remind'
    to %r/(?=#|\n|\z)/
    include "#expression"
  end
  rule 'meta.unsetline.remind' do
    from %r/\b(?i:(UNSET))\b/,
      1 => 'keyword.control.set.unsetline.remind'
    to %r/(?=#|\n|\z)/
    rule 'variable.other.unsetline.remind' do
      match %r/\b\w+\b/
    end
  end
  rule 'meta.if.remind' do
    from %r/\b(?i:(IF))\b/
    to %r/(?=#|\n|\z)/
    both 1 => 'keyword.control.if.remind'
    include "#expression"
  end
  rule 'meta.iftrig.remind' do
    from %r/\b(?i:(IFTRIG))\b/
    to %r/(?=#|\n|\z)/
    both 1 => 'keyword.control.iftrig.remind'
    include "#trigger"
  end
  rule 'keyword.control.else-or-endif.remind' do
    match %r/\b(?i:(ELSE|ENDIF))\s*(?=#|\n|\z)/
  end
  rule 'meta.includeline.remind' do
    from %r/\b(?i:INCLUDE)\b/,
      0 => 'keyword.control.include.commandline.remind'
    to %r/(?=#|\n|\z)/
  end
  rule 'meta.commandline.remind' do
    from %r/\b(?i:REM|OMIT|BANNER)\b/,
      0 => 'keyword.control.command.commandline.remind'
    to %r/(%?[ \t]*)(?=(#|\n|\z))/,
      0 => 'keyword.control.endline.commandline.remind'
    rule 'keyword.control.expiry.commandline.remind' do
      match %r/\b(?i:SCHED|WARN|SCANFROM|SCAN|UNTIL)\b/
    end
    rule 'meta.satisfy.remind' do
      from %r/\b(?i:SATISFY)\b/,
        0 => 'keyword.control.satisfy.commandline.remind'
      to %r/(?=(#|\n|\z))/
      include "#expression"
    end
    include "#trigger"
    include "#message-body"
    include "#bracketed-expression"
    include "#message"
  end
  include "#bracketed-expression"
  include "#message"

  fragment :"bracketed-expression" do
    rule do
      from %r/\[/,
        0 => 'punctuation.section.scope.begin.remind'
      to %r/\]/,
        0 => 'punctuation.section.scope.end.remind'
      include "#expression"
    end
  end

  fragment :"date-item" do
    rule 'support.constant.month.dateitem.remind' do
      match %r/\b(?i:January|Jan|February|Feb|March|Mar|April|Apr|May|June|Jun|July|Jul|August|Aug|September|Sep|October|Oct|November|Nov|December|Dec)\b/
    end
    rule 'support.constant.weekday.dateitem.remind' do
      match %r/\b(?i:Monday|Mon|Tuesday|Tue|Wednesday|Wed|Thursday|Thu|Friday|Fri|Saturday|Sat|Sunday|Sun)\b/
    end
    rule 'support.constant.day.dateitem.remind' do
      match %r/\b(?:\d{1,2})\b/
    end
    rule 'support.constant.year.dateitem.remind' do
      match %r/\b(?:\d{4})\b/
    end
  end

  fragment :expression do
    rule do
      from %r/\(/,
        0 => 'punctuation.section.scope.begin.remind'
      to %r/\)/,
        0 => 'punctuation.section.scope.end.remind'
      include "#expression"
    end
    rule 'keyword.operator.remind' do
      match %r'-|\*|/|%|\+|-|[!<>=]=?|&&|\|\|'
    end
    rule 'string.quoted.double.remind' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.remind'
      to %r/"/,
        0 => 'punctuation.definition.string.end.remind'
      rule 'constant.character.escape.remind' do
        match %r/\\./
      end
    end
    rule 'constant.other.date.remind' do
      match %r:'\d{4}([\-/])\d{1,2}\1\d{1,2}':
    end
    rule 'constant.other.time.remind' do
      match %r/\d{1,2}[:.]\d{2}/
    end
    rule 'constant.numeric.integer.remind' do
      match %r/\d+/
    end
    rule 'variable.language.system.remind' do
      match %r/\$(?:CalcUTC|CalMode|Daemon|DefaultPrio|DontFork|DontTrigAts|DontQueue|EndSent|EndSentIg|FirstIndent|FoldYear|FormWidth|HushMode|IgnoreOnce|InfDelta|LatDeg|LatMin|LatSec|Location|LongDeg|LongMin|LongSec|MaxSatIter|MinsFromUTC|NextMode|NumQueued|NumTrig|PrefixLineNo|PSCal|RunOff|SimpleCal|SortByDate|SortByPrio|SortByTime|SubsIndent)\b/
    end
    rule 'meta.function.builtin.remind' do
      from %r/\b(?:abs|access|args|asc|baseyr|char|choose|coerce|date|dawn|day|daysinmon|defined|dosubst|dusk|easterdate|filedate|filedir|filename|getenv|hour|iif|index|isdst|isleap|isomitted|hebdate|hebday|hebmon|hebyear|language|lower|max|min|minsfromutc|minute|min|monnum|moondate|moontime|moonphase|now|ord|ostype|plural|psmoon|psshade|realnow|realtoday|sgn|shell|strlen|substr|sunrise|sunset|time|today|trigdate|trigger|trigtime|trigvalid|typeof|upper|value|version|wkday|wkdaynum|year)\(/
      to %r/\)/
      both 0 => 'support.function.builtin.remind'
      include "#expression"
    end
    rule 'meta.function.user.remind' do
      from %r/\b(\w+)(\()/,
        1 => 'entity.name.function.remind',
        2 => 'punctuation.definition.arguments.remind'
      to %r/(\))/,
        1 => 'punctuation.definition.arguments.remind'
      include "#expression"
    end
    rule 'variable.parameter.user.remind' do
      match %r/\b\w+\b/
    end
  end

  fragment :message do
    rule do
      from %r/\b(?i:MSG|MSF|RUN|CAL|SPECIAL|PS|PSFILE)\b\s*/,
        0 => 'keyword.control.message.commandline.remind'
      to %r/(%?[ \t]*)(?=\n|\z)/,
        0 => 'keyword.control.endline.commandline.remind'
      include "#message-body"
    end
  end

  fragment :"message-body" do
    rule 'constant.other.placeholder.remind' do
      match %r/(%)[a-zA-Z0-9_!@#]/,
        1 => 'punctuation.definition.constant.remind'
    end
    rule 'string.quoted.double.remind' do
      from %r/%"/,
        0 => 'punctuation.definition.string.begin.remind'
      to %r/%"/,
        0 => 'punctuation.definition.string.end.remind'
    end
    include "#bracketed-expression"
  end

  fragment :trigger do
    rule 'meta.attime.trigger.remind' do
      match %r/\b(?i:(AT))\s+(\d{1,2}[:.]\d{2})(?:\s+(\+{1,2}\d+))?(?:\s+(\*\d+))?(?=\s)/,
        1 => 'keyword.other.attime.trigger.remind',
        2 => 'constant.other.time.trigger.remind',
        3 => 'variable.other.component.trigger.remind',
        4 => 'variable.other.comp.trigger.remind'
    end
    rule 'meta.duration.trigger.remind' do
      match %r/\b(?i:(DURATION))\s+(\d{1,2}[:.]\d{2})(?=\s)/,
        1 => 'keyword.other.duration.trigger.remind',
        2 => 'constant.other.time.trigger.remind'
    end
    rule 'keyword.control.command.trigger.remind' do
      match %r/\b(?i:OMIT)\b/
    end
    rule 'keyword.control.move-reminder.trigger.remind' do
      match %r/\b(?i:ONCE|SKIP|BEFORE|AFTER)\b/
    end
    rule 'variable.other.component.delta.trigger.remind' do
      match %r/(\+{1,2})\d+/,
        1 => 'punctuation.definition.variable.remind'
    end
    rule 'variable.other.component.back.trigger.remind' do
      match %r/(\-{1,2})\d+/,
        1 => 'punctuation.definition.variable.remind'
    end
    rule 'variable.other.component.repeat.trigger.remind' do
      match %r/(\*)\d+/,
        1 => 'punctuation.definition.variable.remind'
    end
    include "#date-item"
  end
end
