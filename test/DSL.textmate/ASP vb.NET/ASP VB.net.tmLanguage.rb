# encoding: utf-8

language 'ASP vb.NET' => 'source.asp.vb.net', file: 'ASP VB.net' do
  # Modified from the original ASP bundle. Originally modified by Thomas Aylott subtleGradient.com
  file_types %w(vb)
  key_equivalent "^~A"  # TextMate only
  uuid "7F9C9343-D48E-4E7D-BFE8-F680714DCD3E"  # TextMate only

  rule 'meta.ending-space' do
    match %r/\n/
  end
  include "#round-brackets"
  rule 'meta.leading-space' do
    from %r/^(?=\t)/
    to %r/(?=[^\t])/
    rule do
      match %r/(\t)(\t)?/,
        1 => 'meta.odd-tab.tabs',
        2 => 'meta.even-tab.tabs'
    end
  end
  rule 'meta.leading-space' do
    from %r/^(?= )/
    to %r/(?=[^ ])/
    rule do
      match %r/(  )(  )?/,
        1 => 'meta.odd-tab.spaces',
        2 => 'meta.even-tab.spaces'
    end
  end
  rule 'meta.function.asp' do
    match %r/^\s*((?i:function|sub))\s*([a-zA-Z_]\w*)\s*(\()([^)]*)(\)).*\n?/,
      1 => 'storage.type.function.asp',
      2 => 'entity.name.function.asp',
      3 => 'punctuation.definition.parameters.asp',
      4 => 'variable.parameter.function.asp',
      5 => 'punctuation.definition.parameters.asp'
  end
  rule do
    from %r/(^[ \t]+)?(?=')/,
      1 => 'punctuation.whitespace.comment.leading.asp'
    to %r/(?!\G)/
    rule 'comment.line.apostrophe.asp' do
      from %r/'/,
        0 => 'punctuation.definition.comment.asp'
      to %r/\n/
    end
  end
  rule 'keyword.control.asp' do
    match %r/(?i:\b(If|Then|Else|ElseIf|Else If|End If|While|Wend|For|To|Each|Case|Select|End Select|Return|Continue|Do|Until|Loop|Next|With|Exit Do|Exit For|Exit Function|Exit Property|Exit Sub|IIf)\b)/
  end
  rule 'keyword.operator.asp' do
    match %r/(?i:\b(Mod|And|Not|Or|Xor|as)\b)/
  end
  rule 'variable.other.dim.asp' do
    # FIXME: (warning) character class has duplicated range
    match %r/(?i:(dim)\s*(?:(\b[a-zA-Z_x7f-xff][a-zA-Z0-9_x7f-xff]*?\b)\s*(,?)))/,
      1 => 'storage.type.asp',
      2 => 'variable.other.bfeac.asp',
      3 => 'meta.separator.comma.asp'
  end
  rule 'storage.type.asp' do
    match %r/(?i:\s*\b(Call|Class|Const|Dim|Redim|Function|Sub|Private Sub|Public Sub|End sub|End Function|Set|Let|Get|New|Randomize|Option Explicit|On Error Resume Next|On Error GoTo)\b\s*)/
  end
  rule 'storage.modifier.asp' do
    match %r/(?i:\b(Private|Public|Default)\b)/
  end
  rule 'constant.language.asp' do
    match %r/(?i:\s*\b(Empty|False|Nothing|Null|True)\b)/
  end
  rule 'string.quoted.double.asp' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.asp'
    to %r/"/,
      0 => 'punctuation.definition.string.end.asp'
    rule 'constant.character.escape.apostrophe.asp' do
      match %r/""/
    end
  end
  rule 'variable.other.asp' do
    # FIXME: (warning) character class has duplicated range
    match %r/(\$)[a-zA-Z_x7f-xff][a-zA-Z0-9_x7f-xff]*?\b\s*/,
      1 => 'punctuation.definition.variable.asp'
  end
  rule 'support.class.asp' do
    match %r/(?i:\b(Application|ObjectContext|Request|Response|Server|Session)\b)/
  end
  rule 'support.class.collection.asp' do
    match %r/(?i:\b(Contents|StaticObjects|ClientCertificate|Cookies|Form|QueryString|ServerVariables)\b)/
  end
  rule 'support.constant.asp' do
    match %r/(?i:\b(TotalBytes|Buffer|CacheControl|Charset|ContentType|Expires|ExpiresAbsolute|IsClientConnected|PICS|Status|ScriptTimeout|CodePage|LCID|SessionID|Timeout)\b)/
  end
  rule 'support.function.asp' do
    match %r/(?i:\b(Lock|Unlock|SetAbort|SetComplete|BianryRead|AddHeader|AppendToLog|BinaryWrite|Clear|End|Flush|Redirect|Write|CreateObject|HTMLEncode|MapPath|URLEncode|Abandon|Convert|Regex)\b)/
  end
  rule 'support.function.event.asp' do
    match %r/(?i:\b(Application_OnEnd|Application_OnStart|OnTransactionAbort|OnTransactionCommit|Session_OnEnd|Session_OnStart)\b)/
  end
  rule 'support.type.vb.asp' do
    # FIXME: (warning) character class has duplicated range
    match %r/(?i:(?<=as )(\b[a-zA-Z_x7f-xff][a-zA-Z0-9_x7f-xff]*?\b))/
  end
  rule 'support.function.vb.asp' do
    match %r/(?i:\b(Array|Add|Asc|Atn|CBool|CByte|CCur|CDate|CDbl|Chr|CInt|CLng|Conversions|Cos|CreateObject|CSng|CStr|Date|DateAdd|DateDiff|DatePart|DateSerial|DateValue|Day|Derived|Math|Escape|Eval|Exists|Exp|Filter|FormatCurrency|FormatDateTime|FormatNumber|FormatPercent|GetLocale|GetObject|GetRef|Hex|Hour|InputBox|InStr|InStrRev|Int|Fix|IsArray|IsDate|IsEmpty|IsNull|IsNumeric|IsObject|Item|Items|Join|Keys|LBound|LCase|Left|Len|LoadPicture|Log|LTrim|RTrim|Trim|Maths|Mid|Minute|Month|MonthName|MsgBox|Now|Oct|Remove|RemoveAll|Replace|RGB|Right|Rnd|Round|ScriptEngine|ScriptEngineBuildVersion|ScriptEngineMajorVersion|ScriptEngineMinorVersion|Second|SetLocale|Sgn|Sin|Space|Split|Sqr|StrComp|String|StrReverse|Tan|Time|Timer|TimeSerial|TimeValue|TypeName|UBound|UCase|Unescape|VarType|Weekday|WeekdayName|Year)\b)/
  end
  rule 'constant.numeric.asp' do
    match %r/-?\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)(L|l|UL|ul|u|U|F|f)?\b/
  end
  rule 'support.type.vb.asp' do
    match %r/(?i:\b(vbtrue|vbfalse|vbcr|vbcrlf|vbformfeed|vblf|vbnewline|vbnullchar|vbnullstring|int32|vbtab|vbverticaltab|vbbinarycompare|vbtextcomparevbsunday|vbmonday|vbtuesday|vbwednesday|vbthursday|vbfriday|vbsaturday|vbusesystemdayofweek|vbfirstjan1|vbfirstfourdays|vbfirstfullweek|vbgeneraldate|vblongdate|vbshortdate|vblongtime|vbshorttime|vbobjecterror|vbEmpty|vbNull|vbInteger|vbLong|vbSingle|vbDouble|vbCurrency|vbDate|vbString|vbObject|vbError|vbBoolean|vbVariant|vbDataObject|vbDecimal|vbByte|vbArray)\b)/
  end
  rule 'support.function.asp' do
    # FIXME: (warning) character class has duplicated range
    match %r/(?i:(\b[a-zA-Z_x7f-xff][a-zA-Z0-9_x7f-xff]*?\b)(?=\(\)?))/,
      1 => 'entity.name.function.asp'
  end
  rule 'variable.other.asp' do
    # FIXME: (warning) character class has duplicated range
    match %r'(?i:((?<=(\+|=|-|\&|\\|/|<|>|\(|,))\s*\b([a-zA-Z_x7f-xff][a-zA-Z0-9_x7f-xff]*?)\b(?!(\(|\.))|\b([a-zA-Z_x7f-xff][a-zA-Z0-9_x7f-xff]*?)\b(?=\s*(\+|=|-|\&|\\|/|<|>|\(|\)))))'
  end
  rule 'keyword.operator.js' do
    match %r'!|\$|%|&|\*|\-\-|\-|\+\+|\+|~|===|==|=|!=|!==|<=|>=|<<=|>>=|>>>=|<>|<|>|!|&&|\|\||\?\:|\*=|/=|%=|\+=|\-=|&=|\^=|\b(in|instanceof|new|delete|typeof|void)\b'
  end

  fragment :"round-brackets" do
    rule 'meta.round-brackets' do
      from %r/\(/,
        0 => 'punctuation.section.round-brackets.begin.asp'
      to %r/\)/,
        0 => 'punctuation.section.round-brackets.end.asp'
      include "source.asp.vb.net"
    end
  end
end
