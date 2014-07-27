# encoding: utf-8

language 'ASP' => 'source.asp' do
  # ASP SCRIPTING DICTIONARY – By Rich Barton: Version 1.0 (based on PHP Scripting Dictionary by Justin French, Sune Foldager and Allan Odgaard) Note: .asp is handled by asp/html
  file_types %w(asa)
  folding_start_marker %r/(?i)^\s*(Public|Private)?\s*(Class|Function|Sub|Property)\s*([a-zA-Z_]\w*)\s*(\(.*\)\s*)?$/
  folding_stop_marker %r/(?i)^\s*End (Class|Function|Sub|Property)\s*$/
  key_equivalent "^~A"  # TextMate only
  uuid "291022B4-6B1D-11D9-90EB-000D93589AF6"  # TextMate only

  rule 'meta.function.asp' do
    match %r/^\s*((?i:function|sub))\s*([a-zA-Z_]\w*)\s*(\()([^)]*)(\)).*\n?/,
      1 => 'storage.type.function.asp',
      2 => 'entity.name.function.asp',
      3 => 'punctuation.definition.parameters.asp',
      4 => 'variable.parameter.function.asp',
      5 => 'punctuation.definition.parameters.asp'
  end
  rule 'comment.line.apostrophe.asp' do
    match %r/(').*$\n?/,
      1 => 'punctuation.definition.comment.asp'
  end
  rule 'comment.line.rem.asp' do
    match %r/(REM ).*$\n?/,
      1 => 'punctuation.definition.comment.asp'
  end
  rule 'keyword.control.asp' do
    match %r/(?i:\b(If|Then|Else|ElseIf|End If|While|Wend|For|To|Each|In|Step|Case|Select|End Select|Return|Continue|Do|Until|Loop|Next|With|Exit Do|Exit For|Exit Function|Exit Property|Exit Sub)\b)/
  end
  rule 'keyword.operator.asp' do
    match %r/=|>=|<|>|<|<>|\+|-|\*|\^|&|\b(?i:(Mod|And|Not|Or|Xor|Is))\b/
  end
  rule 'storage.type.asp' do
    match %r/(?i:\b(Call|Class|Const|Dim|Redim|Function|Sub|Property|End Property|End sub|End Function|Set|Let|Get|New|Randomize|Option Explicit|On Error Resume Next|On Error GoTo)\b)/
  end
  rule 'storage.modifier.asp' do
    match %r/(?i:\b(Private|Public|Default)\b)/
  end
  rule 'constant.language.asp' do
    match %r/(?i:\b(Empty|False|Nothing|Null|True)\b)/
  end
  rule 'string.quoted.double.asp' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.asp'
    to %r/"(?!")/,
      0 => 'punctuation.definition.string.end.asp'
    rule 'constant.character.escape.apostrophe.asp' do
      match %r/""/
    end
  end
  rule 'variable.other.asp' do
    # FIXME: (warning) character class has duplicated range
    match %r/(\$)[a-zA-Z_x7f-xff][a-zA-Z0-9_x7f-xff]*?\b/,
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
    match %r/(?i:\b(Lock|Unlock|SetAbort|SetComplete|BianryRead|AddHeader|AppendToLog|BinaryWrite|Clear|End|Flush|Redirect|Write|CreateObject|HTMLEncode|MapPath|URLEncode|Abandon)\b)/
  end
  rule 'support.function.event.asp' do
    match %r/(?i:\b(Application_OnEnd|Application_OnStart|OnTransactionAbort|OnTransactionCommit|Session_OnEnd|Session_OnStart|Class_Initialize|Class_Terminate)\b)/
  end
  rule 'support.function.vb.asp' do
    match %r/(?i:\b(Array|Add|Asc|Atn|CBool|CByte|CCur|CDate|CDbl|Chr|CInt|CLng|Conversions|Cos|CreateObject|CSng|CStr|Date|DateAdd|DateDiff|DatePart|DateSerial|DateValue|Day|Derived|Math|Escape|Eval|Exists|Exp|Filter|FormatCurrency|FormatDateTime|FormatNumber|FormatPercent|GetLocale|GetObject|GetRef|Hex|Hour|InputBox|InStr|InStrRev|Int|Fix|IsArray|IsDate|IsEmpty|IsNull|IsNumeric|IsObject|Item|Items|Join|Keys|LBound|LCase|Left|Len|LoadPicture|Log|LTrim|RTrim|Trim|Maths|Mid|Minute|Month|MonthName|MsgBox|Now|Oct|Remove|RemoveAll|Replace|RGB|Right|Rnd|Round|ScriptEngine|ScriptEngineBuildVersion|ScriptEngineMajorVersion|ScriptEngineMinorVersion|Second|SetLocale|Sgn|Sin|Space|Split|Sqr|StrComp|String|StrReverse|Tan|Time|Timer|TimeSerial|TimeValue|TypeName|UBound|UCase|Unescape|VarType|Weekday|WeekdayName|Year)\b)/
  end
  rule 'constant.numeric.asp' do
    match %r/\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)(L|l|UL|ul|u|U|F|f)?\b/
  end
  rule 'support.type.vb.asp' do
    match %r/(?i:\b(vbtrue|fvbalse|vbcr|vbcrlf|vbformfeed|vblf|vbnewline|vbnullchar|vbnullstring|vbtab|vbverticaltab|vbbinarycompare|vbtextcomparevbsunday|vbmonday|vbtuesday|vbwednesday|vbthursday|vbfriday|vbsaturday|vbusesystemdayofweek|vbfirstjan1|vbfirstfourdays|vbfirstfullweek|vbgeneraldate|vblongdate|vbshortdate|vblongtime|vbshorttime|vbobjecterror|vbEmpty|vbNull|vbInteger|vbLong|vbSingle|vbDouble|vbCurrency|vbDate|vbString|vbObject|vbError|vbBoolean|vbVariant|vbDataObject|vbDecimal|vbByte|vbArray)\b)/
  end
end
