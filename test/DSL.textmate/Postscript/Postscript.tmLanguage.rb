# encoding: utf-8

language 'Postscript' => 'source.postscript' do
  file_types %w(ps eps)
  first_line_match %r/^%!PS/
  key_equivalent "^~P"  # TextMate only
  uuid "B89483CD-6AE0-4517-BE2C-82F8083B7359"  # TextMate only

  rule 'string.other.postscript' do
    from %r/\(/,
      0 => 'punctuation.definition.string.begin.postscript'
    to %r/\)/,
      0 => 'punctuation.definition.string.end.postscript'
    include "#string_content"
  end
  rule 'meta.Document-Structuring-Comment.postscript' do
    match %r/^(%%(BeginBinary:|BeginCustomColor:|BeginData:|BeginDefaults|BeginDocument:|BeginEmulation:|BeginExitServer:|BeginFeature:|BeginFile:|BeginFont:|BeginObject:|BeginPageSetup:|BeginPaperSize:|BeginPreview:|BeginProcSet|BeginProcessColor:|BeginProlog|BeginResource:|BeginSetup|BoundingBox:|CMYKCustomColor:|ChangeFont:|Copyright:|CreationDate:|Creator:|DocumentCustomColors:|DocumentData:|DocumentFonts:|DocumentMedia:|DocumentNeededFiles:|DocumentNeededFonts:|DocumentNeededProcSets:|DocumentNeededResources:|DocumentPaperColors:|DocumentPaperForms:|DocumentPaperSizes:|DocumentPaperWeights:|DocumentPrinterRequired:|DocumentProcSets:|DocumentProcessColors:|DocumentSuppliedFiles:|DocumentSuppliedFonts:|DocumentSuppliedProcSets:|DocumentSuppliedResources:|EOF|Emulation:|EndBinary:|EndComments|EndCustomColor:|EndData:|EndDefaults|EndDocument:|EndEmulation:|EndExitServer:|EndFeature:|EndFile:|EndFont:|EndObject:|EndPageSetup:|EndPaperSize:|EndPreview:|EndProcSet|EndProcessColor:|EndProlog|EndResource:|EndSetup|ExecuteFile:|Extensions:|Feature:|For:|IncludeDocument:|IncludeFeature:|IncludeFile:|IncludeFont:|IncludeProcSet:|IncludeResource:|LanguageLevel:|OperatorIntervention:|OperatorMessage:|Orientation:|Page:|PageBoundingBox:|PageCustomColors|PageCustomColors:|PageFiles:|PageFonts:|PageMedia:|PageOrder:|PageOrientation:|PageProcessColors|PageProcessColors:|PageRequirements:|PageResources:|PageTrailer|Pages:|PaperColor:|PaperForm:|PaperSize:|PaperWeight:|ProofMode:|RGBCustomColor:|Requirements:|Routing:|Title:|Trailer|VMlocation:|VMusage:|Version|Version:|\+|\?BeginFeatureQuery:|\?BeginFileQuery:|\?BeginFontListQuery:|\?BeginFontQuery:|\?BeginPrinterQuery:|\?BeginProcSetQuery:|\?BeginQuery:|\?BeginResourceListQuery:|\?BeginResourceQuery:|\?BeginVMStatus:|\?EndFeatureQuery:|\?EndFileQuery:|\?EndFontListQuery:|\?EndFontQuery:|\?EndPrinterQuery:|\?EndProcSetQuery:|\?EndQuery:|\?EndResourceListQuery:|\?EndResourceQuery:|\?EndVMStatus:))\s*(.*)$\n?/,
      1 => 'keyword.other.DSC.postscript',
      3 => 'string.unquoted.DSC.postscript'
  end
  rule do
    from %r/(^[ \t]+)?(?=%)/,
      1 => 'punctuation.whitespace.comment.leading.postscript'
    to %r/(?!\G)/
    rule 'comment.line.percentage.postscript' do
      from %r/%/,
        0 => 'punctuation.definition.comment.postscript'
      to %r/\n/
    end
  end
  rule 'meta.dictionary.postscript' do
    from %r/\<\</,
      0 => 'punctuation.definition.dictionary.begin.postscript'
    to %r/\>\>/,
      0 => 'punctuation.definition.dictionary.end.postscript'
    include "$self"
  end
  rule 'meta.array.postscript' do
    from %r/\[/,
      0 => 'punctuation.definition.array.begin.postscript'
    to %r/\]/,
      0 => 'punctuation.definition.array.end.postscript'
    include "$self"
  end
  rule 'meta.procedure.postscript' do
    from %r/{/,
      0 => 'punctuation.definition.procedure.begin.postscript'
    to %r/}/,
      0 => 'punctuation.definition.procedure.end.postscript'
    include "$self"
  end
  rule 'string.other.base85.postscript' do
    from %r/\<\~/,
      0 => 'punctuation.definition.string.begin.postscript'
    to %r/\~\>/,
      0 => 'punctuation.definition.string.end.postscript'
    rule do
      match %r/[!-z\s]+/
    end
    rule 'invalid.illegal.base85.char.postscript' do
      match %r/./
    end
  end
  rule 'string.other.hexadecimal.postscript' do
    from %r/\</,
      0 => 'punctuation.definition.string.begin.postscript'
    to %r/\>/,
      0 => 'punctuation.definition.string.end.postscript'
    rule do
      match %r/[0-9A-Fa-f\s]+/
    end
    rule 'invalid.illegal.hexadecimal.char.postscript' do
      match %r/./
    end
  end
  rule 'constant.numeric.radix.postscript' do
    # well, not really, but short of listing rules for all bases from 2-36 best we can do
    match %r/[0-3]?[0-9]#[0-9a-zA-Z]+/
  end
  rule 'constant.numeric.postscript' do
    match %r/(\-|\+)?\d+(\.\d*)?([eE](\-|\+)?\d+)?/
  end
  rule 'constant.numeric.postscript' do
    match %r/(\-|\+)?\.\d+([eE](\-|\+)?\d+)?/
  end
  rule 'keyword.operator.postscript' do
    match %r/\b(abs|add|aload|anchorsearch|and|arc|arcn|arct|arcto|array|ashow|astore|atan|awidthshow|begin|bind|bitshift|bytesavailable|cachestatus|ceiling|charpath|clear|cleartomark|cleardictstack|clip|clippath|closefile|closepath|colorimage|concat|concatmatrix|condition|configurationerror|copy|copypage|cos|count|countdictstack|countexecstack|counttomark|cshow|currentblackgeneration|currentcacheparams|currentcmykcolor|currentcolor|currentcolorrendering|currentcolorscreen|currentcolorspace|currentcolortransfer|currentcontext|currentdash|currentdevparams|currentdict|currentfile|currentflat|currentfont|currentglobal|currentgray|currentgstate|currenthalftone|currenthalftonephase|currenthsbcolor|currentlinecap|currentlinejoin|currentlinewidth|currentmatrix|currentmiterlimit|currentobjectformat|currentpacking|currentpagedevice|currentpoint|currentrgbcolor|currentscreen|currentshared|currentstrokeadjust|currentsystemparams|currenttransfer|currentundercolorremoval|currentuserparams|curveto|cvi|cvlit|cvn|cvr|cvrs|cvs|cvx|def|defaultmatrix|definefont|defineresource|defineusername|defineuserobject|deletefile|detach|deviceinfo|dict|dictfull|dictstack|dictstackoverflow|dictstackunderflow|div|dtransform|dup|echo|eexec|end|eoclip|eofill|eoviewclip|eq|erasepage|errordict|exch|exec|execform|execstack|execstackoverflow|execuserobject|executeonly|executive|exit|exp|false|file|filenameforall|fileposition|fill|filter|findencoding|findfont|findresource|flattenpath|floor|flush|flushfile|FontDirectory|for|forall|fork|ge|get|getinterval|globaldict|GlobalFontDirectory|glyphshow|grestore|grestoreall|gsave|gstate|gt|handleerror|identmatrix|idiv|idtransform|if|ifelse|image|imagemask|index|ineofill|infill|initclip|initgraphics|initmatrix|initviewclip|instroke|internaldict|interrupt|inueofill|inufill|inustroke|invalidaccess|invalidcontext|invalidexit|invalidfileaccess|invalidfont|invalidid|invalidrestore|invertmatrix|ioerror|ISOLatin1Encoding|itransform|join|kshow|known|languagelevel|le|length|limitcheck|lineto|ln|load|lock|log|loop|lt|makefont|makepattern|mark|matrix|maxlength|mod|monitor|moveto|mul|ne|neg|newpath|noaccess|nocurrentpoint|not|notify|null|nulldevice|or|packedarray|pathbbox|pathforall|pop|print|printobject|product|prompt|pstack|put|putinterval|quit|rand|rangecheck|rcurveto|read|readhexstring|readline|readonly|readstring|realtime|rectclip|rectfill|rectstroke|rectviewclip|renamefile|repeat|resetfile|resourceforall|resourcestatus|restore|reversepath|revision|rlineto|rmoveto|roll|rootfont|rotate|round|rrand|run|save|scale|scalefont|scheck|search|selectfont|serialnumber|setbbox|setblackgeneration|setcachedevice|setcachedevice2|setcachelimit|setcacheparams|setcharwidth|setcmykcolor|setcolor|setcolorrendering|setcolorscreen|setcolorspace|setcolortransfer|setdash|setdevparams|setfileposition|setflat|setfont|setglobal|setgray|setgstate|sethalftone|sethalftonephase|sethsbcolor|setlinecap|setlinejoin|setlinewidth|setmatrix|setmiterlimit|setobjectformat|setoverprint|setpacking|setpagedevice|setpattern|setrgbcolor|setscreen|setshared|setstrokeadjust|setsystemparams|settransfer|setucacheparams|setundercolorremoval|setuserparams|setvmthreshold|shareddict|show|showpage|sin|sqrt|srand|stack|stackoverflow|stackunderflow|StandardEncoding|start|startjob|status|statusdict|stop|stopped|store|string|stringwidth|stroke|strokepath|sub|syntaxerror|systemdict|timeout|transform|translate|true|truncate|type|typecheck|token|uappend|ucache|ucachestatus|ueofill|ufill|undef|undefined|undefinedfilename|undefineresource|undefinedresult|undefinefont|undefineresource|undefinedresource|undefineuserobject|unmatchedmark|unregistered|upath|userdict|UserObjects|usertime|ustroke|ustrokepath|version|viewclip|viewclippath|VMerror|vmreclaim|vmstatus|wait|wcheck|where|widthshow|write|writehexstring|writeobject|writestring|wtranslation|xcheck|xor|xshow|xyshow|yield|yshow)\b/
  end
  rule 'variable.other.immediately-evaluated.postscript' do
    match %r'//[^\(\)\<\>\[\]\{\}\/\%\s]+'
  end
  rule 'variable.other.literal.postscript' do
    match %r'/[^\(\)\<\>\[\]\{\}\/\%\s]+'
  end
  rule 'variable.other.name.postscript' do
    # stuff like 22@ff will show as number 22 followed by name @ff, but should be name 22@ff!
    match %r'[^\(\)\<\>\[\]\{\}\/\%\s]+'
  end

  fragment :string_content do
    rule 'constant.numeric.octal.postscript' do
      match %r/\\[0-7]{1,3}/
    end
    rule 'constant.character.escape.postscript' do
      match %r/\\(\\|[nrtbf\(\)]|[0-7]{1,3}|\r?\n)/
    end
    rule 'invalid.illegal.unknown-escape.postscript.ignored' do
      match %r/\\/
    end
    rule do
      from %r/\(/
      to %r/\)/
      include "#string_content"
    end
  end
end
