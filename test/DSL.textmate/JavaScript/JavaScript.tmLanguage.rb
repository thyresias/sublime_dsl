# encoding: utf-8

language 'JavaScript' => 'source.js' do
  # JavaScript Syntax: version 2.0
  file_types %w(js htc jsx)
  key_equivalent "^~J"  # TextMate only
  uuid "93E017CC-6F27-11D9-90EB-000D93589AF6"  # TextMate only

  rule 'meta.function.js' do
    # match function, optional function name and optional function arguments
    from %r/(?:\b([a-zA-Z_$][\w$]*)(\s*=\s*))?\b(function)(?:\s+([a-zA-Z_$][\w$]*))?\s*(\()/,
      1 => 'meta.function.variable.js',
      2 => 'keyword.operator.js',
      3 => 'storage.type.function.js',
      4 => 'entity.name.function.js',
      5 => 'punctuation.definition.parameters.begin.js'
    to %r/(\))/,
      1 => 'punctuation.definition.parameters.end.js'
    include "#function-params"
  end
  rule 'constant.numeric.js' do
    match %r/\b((0(x|X)[0-9a-fA-F]+)|([0-9]+(\.[0-9]+)?))\b/
  end
  rule 'string.quoted.single.js' do
    from %r/'/,
      0 => 'punctuation.definition.string.begin.js'
    to %r/'/,
      0 => 'punctuation.definition.string.end.js'
    rule 'constant.character.escape.js' do
      match %r/\\(x\h{2}|[0-2][0-7]{,2}|3[0-6][0-7]?|37[0-7]?|[4-7][0-7]?|.)/
    end
  end
  rule 'string.quoted.double.js' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.js'
    to %r/"/,
      0 => 'punctuation.definition.string.end.js'
    rule 'constant.character.escape.js' do
      match %r/\\(x\h{2}|[0-2][0-7]{,2}|3[0-6][0-7]|37[0-7]?|[4-7][0-7]?|.)/
    end
  end
  rule 'comment.block.documentation.js' do
    from %r'/\*\*(?!/)'
    to %r'\*/'
    both 0 => 'punctuation.definition.comment.js'
  end
  rule 'comment.block.js' do
    from %r'/\*'
    to %r'\*/'
    both 0 => 'punctuation.definition.comment.js'
  end
  rule do
    from %r'(^[ \t]+)?(?=//)',
      1 => 'punctuation.whitespace.comment.leading.js'
    to %r/(?!\G)/
    rule 'comment.line.double-slash.js' do
      from %r'//',
        0 => 'punctuation.definition.comment.js'
      to %r/\n/
    end
  end
  rule 'comment.block.html.js' do
    match %r/(<!--|-->)/,
      0 => 'punctuation.definition.comment.html.js',
      2 => 'punctuation.definition.comment.html.js'
  end
  rule 'storage.type.js' do
    match %r/(?<!\.)\b(boolean|byte|char|class|double|enum|float|function|int|interface|long|short|void)\b/
  end
  rule 'storage.modifier.js' do
    match %r/(?<!\.)\b(const|export|extends|final|implements|native|private|protected|public|static|synchronized|throws|transient|var|volatile)\b/
  end
  rule 'keyword.control.js' do
    match %r/(?<!\.)\b(break|case|catch|continue|default|do|else|finally|for|goto|if|import|package|return|switch|throw|try|while)\b/
  end
  rule 'keyword.operator.js' do
    match %r/(?<!\.)\b(delete|in|instanceof|new|typeof|with)\b/
  end
  rule 'constant.language.boolean.true.js' do
    match %r/(?<!\.)\btrue\b/
  end
  rule 'constant.language.boolean.false.js' do
    match %r/(?<!\.)\bfalse\b/
  end
  rule 'constant.language.null.js' do
    match %r/(?<!\.)\bnull\b/
  end
  rule 'variable.language.js' do
    match %r/(?<!\.)\b(super|this)\b/
  end
  rule 'keyword.other.js' do
    match %r/(?<!\.)\b(debugger)\b/
  end
  rule 'support.class.js' do
    match %r/\b(Anchor|Applet|Area|Array|Boolean|Button|Checkbox|Date|document|event|FileUpload|Form|Frame|Function|Hidden|History|Image|JavaArray|JavaClass|JavaObject|JavaPackage|java|Layer|Link|Location|Math|MimeType|Number|navigator|netscape|Object|Option|Packages|Password|Plugin|Radio|RegExp|Reset|Select|String|Style|Submit|screen|sun|Text|Textarea|window|XMLHttpRequest)\b/
  end
  rule 'support.function.js' do
    match %r/\b(s(h(ift|ow(Mod(elessDialog|alDialog)|Help))|croll(X|By(Pages|Lines)?|Y|To)?|t(op|rike)|i(n|zeToContent|debar|gnText)|ort|u(p|b(str(ing)?)?)|pli(ce|t)|e(nd|t(Re(sizable|questHeader)|M(i(nutes|lliseconds)|onth)|Seconds|Ho(tKeys|urs)|Year|Cursor|Time(out)?|Interval|ZOptions|Date|UTC(M(i(nutes|lliseconds)|onth)|Seconds|Hours|Date|FullYear)|FullYear|Active)|arch)|qrt|lice|avePreferences|mall)|h(ome|andleEvent)|navigate|c(har(CodeAt|At)|o(s|n(cat|textual|firm)|mpile)|eil|lear(Timeout|Interval)?|a(ptureEvents|ll)|reate(StyleSheet|Popup|EventObject))|t(o(GMTString|S(tring|ource)|U(TCString|pperCase)|Lo(caleString|werCase))|est|a(n|int(Enabled)?))|i(s(NaN|Finite)|ndexOf|talics)|d(isableExternalCapture|ump|etachEvent)|u(n(shift|taint|escape|watch)|pdateCommands)|j(oin|avaEnabled)|p(o(p|w)|ush|lugins.refresh|a(ddings|rse(Int|Float)?)|r(int|ompt|eference))|e(scape|nableExternalCapture|val|lementFromPoint|x(p|ec(Script|Command)?))|valueOf|UTC|queryCommand(State|Indeterm|Enabled|Value)|f(i(nd|le(ModifiedDate|Size|CreatedDate|UpdatedDate)|xed)|o(nt(size|color)|rward)|loor|romCharCode)|watch|l(ink|o(ad|g)|astIndexOf)|a(sin|nchor|cos|t(tachEvent|ob|an(2)?)|pply|lert|b(s|ort))|r(ou(nd|teEvents)|e(size(By|To)|calc|turnValue|place|verse|l(oad|ease(Capture|Events)))|andom)|g(o|et(ResponseHeader|M(i(nutes|lliseconds)|onth)|Se(conds|lection)|Hours|Year|Time(zoneOffset)?|Da(y|te)|UTC(M(i(nutes|lliseconds)|onth)|Seconds|Hours|Da(y|te)|FullYear)|FullYear|A(ttention|llResponseHeaders)))|m(in|ove(B(y|elow)|To(Absolute)?|Above)|ergeAttributes|a(tch|rgins|x))|b(toa|ig|o(ld|rderWidths)|link|ack))\b(?=\()/
  end
  rule 'support.function.dom.js' do
    match %r/\b(s(ub(stringData|mit)|plitText|e(t(NamedItem|Attribute(Node)?)|lect))|has(ChildNodes|Feature)|namedItem|c(l(ick|o(se|neNode))|reate(C(omment|DATASection|aption)|T(Head|extNode|Foot)|DocumentFragment|ProcessingInstruction|E(ntityReference|lement)|Attribute))|tabIndex|i(nsert(Row|Before|Cell|Data)|tem)|open|delete(Row|C(ell|aption)|T(Head|Foot)|Data)|focus|write(ln)?|a(dd|ppend(Child|Data))|re(set|place(Child|Data)|move(NamedItem|Child|Attribute(Node)?)?)|get(NamedItem|Element(sBy(Name|TagName)|ById)|Attribute(Node)?)|blur)\b(?=\()/
  end
  rule 'support.constant.js' do
    match %r/(?<=\.)(s(ystemLanguage|cr(ipts|ollbars|een(X|Y|Top|Left))|t(yle(Sheets)?|atus(Text|bar)?)|ibling(Below|Above)|ource|uffixes|e(curity(Policy)?|l(ection|f)))|h(istory|ost(name)?|as(h|Focus))|y|X(MLDocument|SLDocument)|n(ext|ame(space(s|URI)|Prop))|M(IN_VALUE|AX_VALUE)|c(haracterSet|o(n(structor|trollers)|okieEnabled|lorDepth|mp(onents|lete))|urrent|puClass|l(i(p(boardData)?|entInformation)|osed|asses)|alle(e|r)|rypto)|t(o(olbar|p)|ext(Transform|Indent|Decoration|Align)|ags)|SQRT(1_2|2)|i(n(ner(Height|Width)|put)|ds|gnoreCase)|zIndex|o(scpu|n(readystatechange|Line)|uter(Height|Width)|p(sProfile|ener)|ffscreenBuffering)|NEGATIVE_INFINITY|d(i(splay|alog(Height|Top|Width|Left|Arguments)|rectories)|e(scription|fault(Status|Ch(ecked|arset)|View)))|u(ser(Profile|Language|Agent)|n(iqueID|defined)|pdateInterval)|_content|p(ixelDepth|ort|ersonalbar|kcs11|l(ugins|atform)|a(thname|dding(Right|Bottom|Top|Left)|rent(Window|Layer)?|ge(X(Offset)?|Y(Offset)?))|r(o(to(col|type)|duct(Sub)?|mpter)|e(vious|fix)))|e(n(coding|abledPlugin)|x(ternal|pando)|mbeds)|v(isibility|endor(Sub)?|Linkcolor)|URLUnencoded|P(I|OSITIVE_INFINITY)|f(ilename|o(nt(Size|Family|Weight)|rmName)|rame(s|Element)|gColor)|E|whiteSpace|l(i(stStyleType|n(eHeight|kColor))|o(ca(tion(bar)?|lName)|wsrc)|e(ngth|ft(Context)?)|a(st(M(odified|atch)|Index|Paren)|yer(s|X)|nguage))|a(pp(MinorVersion|Name|Co(deName|re)|Version)|vail(Height|Top|Width|Left)|ll|r(ity|guments)|Linkcolor|bove)|r(ight(Context)?|e(sponse(XML|Text)|adyState))|global|x|m(imeTypes|ultiline|enubar|argin(Right|Bottom|Top|Left))|L(N(10|2)|OG(10E|2E))|b(o(ttom|rder(Width|RightWidth|BottomWidth|Style|Color|TopWidth|LeftWidth))|ufferDepth|elow|ackground(Color|Image)))\b/
  end
  rule 'support.constant.dom.js' do
    match %r/(?<=\.)(s(hape|ystemId|c(heme|ope|rolling)|ta(ndby|rt)|ize|ummary|pecified|e(ctionRowIndex|lected(Index)?)|rc)|h(space|t(tpEquiv|mlFor)|e(ight|aders)|ref(lang)?)|n(o(Resize|tation(s|Name)|Shade|Href|de(Name|Type|Value)|Wrap)|extSibling|ame)|c(h(ildNodes|Off|ecked|arset)?|ite|o(ntent|o(kie|rds)|de(Base|Type)?|l(s|Span|or)|mpact)|ell(s|Spacing|Padding)|l(ear|assName)|aption)|t(ype|Bodies|itle|Head|ext|a(rget|gName)|Foot)|i(sMap|ndex|d|m(plementation|ages))|o(ptions|wnerDocument|bject)|d(i(sabled|r)|o(c(type|umentElement)|main)|e(clare|f(er|ault(Selected|Checked|Value)))|at(eTime|a))|useMap|p(ublicId|arentNode|r(o(file|mpt)|eviousSibling))|e(n(ctype|tities)|vent|lements)|v(space|ersion|alue(Type)?|Link|Align)|URL|f(irstChild|orm(s)?|ace|rame(Border)?)|width|l(ink(s)?|o(ngDesc|wSrc)|a(stChild|ng|bel))|a(nchors|c(ce(ssKey|pt(Charset)?)|tion)|ttributes|pplets|l(t|ign)|r(chive|eas)|xis|Link|bbr)|r(ow(s|Span|Index)|ules|e(v|ferrer|l|adOnly))|m(ultiple|e(thod|dia)|a(rgin(Height|Width)|xLength))|b(o(dy|rder)|ackground|gColor))\b/
  end
  rule 'support.constant.dom.js' do
    match %r/\b(ELEMENT_NODE|ATTRIBUTE_NODE|TEXT_NODE|CDATA_SECTION_NODE|ENTITY_REFERENCE_NODE|ENTITY_NODE|PROCESSING_INSTRUCTION_NODE|COMMENT_NODE|DOCUMENT_NODE|DOCUMENT_TYPE_NODE|DOCUMENT_FRAGMENT_NODE|NOTATION_NODE|INDEX_SIZE_ERR|DOMSTRING_SIZE_ERR|HIERARCHY_REQUEST_ERR|WRONG_DOCUMENT_ERR|INVALID_CHARACTER_ERR|NO_DATA_ALLOWED_ERR|NO_MODIFICATION_ALLOWED_ERR|NOT_FOUND_ERR|NOT_SUPPORTED_ERR|INUSE_ATTRIBUTE_ERR)\b/
  end
  rule 'support.function.event-handler.js' do
    match %r/\bon(R(ow(s(inserted|delete)|e(nter|xit))|e(s(ize(start|end)?|et)|adystatechange))|Mouse(o(ut|ver)|down|up|move)|B(efore(cut|deactivate|u(nload|pdate)|p(aste|rint)|editfocus|activate)|lur)|S(croll|top|ubmit|elect(start|ionchange)?)|H(over|elp)|C(hange|ont(extmenu|rolselect)|ut|ellchange|l(ick|ose))|D(eactivate|ata(setc(hanged|omplete)|available)|r(op|ag(start|over|drop|en(ter|d)|leave)?)|blclick)|Unload|P(aste|ropertychange)|Error(update)?|Key(down|up|press)|Focus|Load|A(ctivate|fter(update|print)|bort))\b/
  end
  rule 'keyword.operator.js' do
    match %r'!|%|&|\*|\-\-|\-|\+\+|\+|~|===|==|=|!=|!==|<=|>=|<<=|>>=|>>>=|<>|<|>|!|&&|\|\||\?\:|\*=|(?<!\()/=|%=|\+=|\-=|&=|\^='
  end
  rule 'constant.language.js' do
    match %r/\b(Infinity|NaN|undefined)\b/
  end
  rule 'string.regexp.js' do
    from %r'(?<=[=(:]|^|return|&&|\|\||!)\s*(/)(?![/*+{}?])',
      1 => 'punctuation.definition.string.begin.js'
    to %r'(/)[igm]*',
      1 => 'punctuation.definition.string.end.js'
    include "source.js.regexp"
  end
  rule 'punctuation.terminator.statement.js' do
    match %r/\;/
  end
  rule 'meta.delimiter.object.comma.js' do
    match %r/,[ |\t]*/
  end
  rule 'meta.delimiter.method.period.js' do
    match %r/\./
  end
  rule do
    # Allows the special return snippet to fire.
    match %r/(\{)(\})/,
      1 => 'punctuation.section.scope.begin.js',
      2 => 'punctuation.section.scope.end.js'
  end
  rule 'meta.brace.curly.js' do
    match %r/\{|\}/
  end
  rule 'meta.brace.round.js' do
    match %r/\(|\)/
  end
  rule 'meta.brace.square.js' do
    match %r/\[|\]/
  end
  rule 'meta.ternary-if.js' do
    from %r/\?/
    to %r/:/
    include "$self"
  end

  fragment :"function-params" do
    rule do
      from %r/(?=[$_a-zA-Z])/
      to %r/(?=[,)])/
      rule 'variable.parameter.function.js' do
        match %r/\G[$_a-zA-Z][$_a-zA-Z0-9]*/
      end
    end
  end
end
