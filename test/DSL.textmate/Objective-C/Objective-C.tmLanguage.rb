# encoding: utf-8

language 'Objective-C' => 'source.objc' do
  file_types %w(m h)
  key_equivalent "^~O"  # TextMate only
  uuid "F85CC716-6B1C-11D9-9A20-000D93589AF6"  # TextMate only

  rule 'meta.interface-or-protocol.objc' do
    content_scope "meta.scope.interface.objc"
    from %r/((@)(interface|protocol))(?!.+;)\s+([A-Za-z_][A-Za-z0-9_]*)\s*((:)(?:\s*)([A-Za-z][A-Za-z0-9]*))?(\s|\n)?/
    to %r/((@)end)\b/
    both 1 => 'storage.type.objc',
         2 => 'punctuation.definition.storage.type.objc',
         4 => 'entity.name.type.objc',
         6 => 'punctuation.definition.entity.other.inherited-class.objc',
         7 => 'entity.other.inherited-class.objc',
         8 => 'meta.divider.objc',
         9 => 'meta.inherited-class.objc'
    include "#interface_innards"
  end
  rule 'meta.implementation.objc' do
    content_scope "meta.scope.implementation.objc"
    from %r/((@)(implementation))\s+([A-Za-z_][A-Za-z0-9_]*)\s*(?::\s*([A-Za-z][A-Za-z0-9]*))?/
    to %r/((@)end)\b/
    both 1 => 'storage.type.objc',
         2 => 'punctuation.definition.storage.type.objc',
         4 => 'entity.name.type.objc',
         5 => 'entity.other.inherited-class.objc'
    include "#implementation_innards"
  end
  rule 'string.quoted.double.objc' do
    from %r/@"/,
      0 => 'punctuation.definition.string.begin.objc'
    to %r/"/,
      0 => 'punctuation.definition.string.end.objc'
    include "source.c#string_escaped_char"
    rule 'constant.other.placeholder.objc' do
      match %r/(?x)%
            (\d+\$)?                             # field (argument #)
            [#0\- +']*                          # flags
            ((-?\d+)|\*(-?\d+\$)?)?              # minimum field width
            (\.((-?\d+)|\*(-?\d+\$)?)?)?         # precision
            [@]                                  # conversion type
          /
    end
    include "source.c#string_placeholder"
  end
  rule 'meta.id-with-protocol.objc' do
    from %r/\b(id)\s*(?=<)/,
      1 => 'storage.type.objc'
    to %r/(?<=>)/
    include "#protocol_list"
  end
  rule 'keyword.control.macro.objc' do
    match %r/\b(NS_DURING|NS_HANDLER|NS_ENDHANDLER)\b/
  end
  rule 'keyword.control.exception.objc' do
    match %r/(@)(try|catch|finally|throw)\b/,
      1 => 'punctuation.definition.keyword.objc'
  end
  rule 'keyword.control.synchronize.objc' do
    match %r/(@)(synchronized)\b/,
      1 => 'punctuation.definition.keyword.objc'
  end
  rule 'keyword.control.protocol-specification.objc' do
    match %r/(@)(required|optional)\b/,
      1 => 'punctuation.definition.keyword.objc'
  end
  rule 'keyword.other.objc' do
    match %r/(@)(defs|encode)\b/,
      1 => 'punctuation.definition.keyword.objc'
  end
  rule 'storage.type.id.objc' do
    match %r/\bid\b/
  end
  rule 'storage.type.objc' do
    match %r/\b(IBOutlet|IBAction|BOOL|SEL|id|unichar|IMP|Class|instancetype)\b/
  end
  rule 'storage.type.objc' do
    match %r/(@)(class|protocol)\b/,
      1 => 'punctuation.definition.storage.type.objc'
  end
  rule 'meta.selector.objc' do
    content_scope "meta.selector.method-name.objc"
    from %r/((@)selector)\s*(\()/,
      1 => 'storage.type.objc',
      2 => 'punctuation.definition.storage.type.objc',
      3 => 'punctuation.definition.storage.type.objc'
    to %r/(\))/,
      1 => 'punctuation.definition.storage.type.objc'
    rule 'support.function.any-method.name-of-parameter.objc' do
      match %r/\b(?:[a-zA-Z_:][\w]*)+/,
        1 => 'punctuation.separator.arguments.objc'
    end
  end
  rule 'storage.modifier.objc' do
    match %r/(@)(synchronized|public|package|private|protected)\b/,
      1 => 'punctuation.definition.storage.modifier.objc'
  end
  rule 'constant.language.objc' do
    match %r/\b(YES|NO|Nil|nil)\b/
  end
  rule 'support.variable.foundation' do
    match %r/\bNSApp\b/
  end
  rule do
    match %r/(\s*)\b(NS(Rect(ToCGRect|FromCGRect)|MakeCollectable|S(tringFromProtocol|ize(ToCGSize|FromCGSize))|Draw(NinePartImage|ThreePartImage)|P(oint(ToCGPoint|FromCGPoint)|rotocolFromString)|EventMaskFromType|Value))\b/,
      1 => 'punctuation.whitespace.support.function.cocoa.leopard',
      2 => 'support.function.cocoa.leopard'
  end
  rule do
    match %r/(\s*)\b(NS(R(ound(DownToMultipleOfPageSize|UpToMultipleOfPageSize)|un(CriticalAlertPanel(RelativeToWindow)?|InformationalAlertPanel(RelativeToWindow)?|AlertPanel(RelativeToWindow)?)|e(set(MapTable|HashTable)|c(ycleZone|t(Clip(List)?|F(ill(UsingOperation|List(UsingOperation|With(Grays|Colors(UsingOperation)?))?)?|romString))|ordAllocationEvent)|turnAddress|leaseAlertPanel|a(dPixel|l(MemoryAvailable|locateCollectable))|gisterServicesProvider)|angeFromString)|Get(SizeAndAlignment|CriticalAlertPanel|InformationalAlertPanel|UncaughtExceptionHandler|FileType(s)?|WindowServerMemory|AlertPanel)|M(i(n(X|Y)|d(X|Y))|ouseInRect|a(p(Remove|Get|Member|Insert(IfAbsent|KnownAbsent)?)|ke(R(ect|ange)|Size|Point)|x(Range|X|Y)))|B(itsPer(SampleFromDepth|PixelFromDepth)|e(stDepth|ep|gin(CriticalAlertSheet|InformationalAlertSheet|AlertSheet)))|S(ho(uldRetainWithZone|w(sServicesMenuItem|AnimationEffect))|tringFrom(R(ect|ange)|MapTable|S(ize|elector)|HashTable|Class|Point)|izeFromString|e(t(ShowsServicesMenuItem|ZoneName|UncaughtExceptionHandler|FocusRingStyle)|lectorFromString|archPathForDirectoriesInDomains)|wap(Big(ShortToHost|IntToHost|DoubleToHost|FloatToHost|Long(ToHost|LongToHost))|Short|Host(ShortTo(Big|Little)|IntTo(Big|Little)|DoubleTo(Big|Little)|FloatTo(Big|Little)|Long(To(Big|Little)|LongTo(Big|Little)))|Int|Double|Float|L(ittle(ShortToHost|IntToHost|DoubleToHost|FloatToHost|Long(ToHost|LongToHost))|ong(Long)?)))|H(ighlightRect|o(stByteOrder|meDirectory(ForUser)?)|eight|ash(Remove|Get|Insert(IfAbsent|KnownAbsent)?)|FSType(CodeFromFileType|OfFile))|N(umberOfColorComponents|ext(MapEnumeratorPair|HashEnumeratorItem))|C(o(n(tainsRect|vert(GlyphsToPackedGlyphs|Swapped(DoubleToHost|FloatToHost)|Host(DoubleToSwapped|FloatToSwapped)))|unt(MapTable|HashTable|Frames|Windows(ForContext)?)|py(M(emoryPages|apTableWithZone)|Bits|HashTableWithZone|Object)|lorSpaceFromDepth|mpare(MapTables|HashTables))|lassFromString|reate(MapTable(WithZone)?|HashTable(WithZone)?|Zone|File(namePboardType|ContentsPboardType)))|TemporaryDirectory|I(s(ControllerMarker|EmptyRect|FreedObject)|n(setRect|crementExtraRefCount|te(r(sect(sRect|ionR(ect|ange))|faceStyleForKey)|gralRect)))|Zone(Realloc|Malloc|Name|Calloc|Fr(omPointer|ee))|O(penStepRootDirectory|ffsetRect)|D(i(sableScreenUpdates|videRect)|ottedFrameRect|e(c(imal(Round|Multiply|S(tring|ubtract)|Normalize|Co(py|mpa(ct|re))|IsNotANumber|Divide|Power|Add)|rementExtraRefCountWasZero)|faultMallocZone|allocate(MemoryPages|Object))|raw(Gr(oove|ayBezel)|B(itmap|utton)|ColorTiledRects|TiledRects|DarkBezel|W(hiteBezel|indowBackground)|LightBezel))|U(serName|n(ionR(ect|ange)|registerServicesProvider)|pdateDynamicServices)|Java(Bundle(Setup|Cleanup)|Setup(VirtualMachine)?|Needs(ToLoadClasses|VirtualMachine)|ClassesF(orBundle|romPath)|ObjectNamedInPath|ProvidesClasses)|P(oint(InRect|FromString)|erformService|lanarFromDepth|ageSize)|E(n(d(MapTableEnumeration|HashTableEnumeration)|umerate(MapTable|HashTable)|ableScreenUpdates)|qual(R(ects|anges)|Sizes|Points)|raseRect|xtraRefCount)|F(ileTypeForHFSTypeCode|ullUserName|r(ee(MapTable|HashTable)|ame(Rect(WithWidth(UsingOperation)?)?|Address)))|Wi(ndowList(ForContext)?|dth)|Lo(cationInRange|g(v|PageSize)?)|A(ccessibility(R(oleDescription(ForUIElement)?|aiseBadArgumentException)|Unignored(Children(ForOnlyChild)?|Descendant|Ancestor)|PostNotification|ActionDescription)|pplication(Main|Load)|vailableWindowDepths|ll(MapTable(Values|Keys)|HashTableObjects|ocate(MemoryPages|Collectable|Object)))))\b/,
      1 => 'punctuation.whitespace.support.function.leading.cocoa',
      2 => 'support.function.cocoa'
  end
  rule 'support.class.cocoa.leopard' do
    match %r/\bNS(RuleEditor|G(arbageCollector|radient)|MapTable|HashTable|Co(ndition|llectionView(Item)?)|T(oolbarItemGroup|extInputClient|r(eeNode|ackingArea))|InvocationOperation|Operation(Queue)?|D(ictionaryController|ockTile)|P(ointer(Functions|Array)|athC(o(ntrol(Delegate)?|mponentCell)|ell(Delegate)?)|r(intPanelAccessorizing|edicateEditor(RowTemplate)?))|ViewController|FastEnumeration|Animat(ionContext|ablePropertyContainer))\b/
  end
  rule 'support.class.cocoa' do
    match %r/\bNS(R(u(nLoop|ler(Marker|View))|e(sponder|cursiveLock|lativeSpecifier)|an(domSpecifier|geSpecifier))|G(etCommand|lyph(Generator|Storage|Info)|raphicsContext)|XML(Node|D(ocument|TD(Node)?)|Parser|Element)|M(iddleSpecifier|ov(ie(View)?|eCommand)|utable(S(tring|et)|C(haracterSet|opying)|IndexSet|D(ictionary|ata)|URLRequest|ParagraphStyle|A(ttributedString|rray))|e(ssagePort(NameServer)?|nu(Item(Cell)?|View)?|t(hodSignature|adata(Item|Query(ResultGroup|AttributeValueTuple)?)))|a(ch(BootstrapServer|Port)|trix))|B(itmapImageRep|ox|u(ndle|tton(Cell)?)|ezierPath|rowser(Cell)?)|S(hadow|c(anner|r(ipt(SuiteRegistry|C(o(ercionHandler|mmand(Description)?)|lassDescription)|ObjectSpecifier|ExecutionContext|WhoseTest)|oll(er|View)|een))|t(epper(Cell)?|atus(Bar|Item)|r(ing|eam))|imple(HorizontalTypesetter|CString)|o(cketPort(NameServer)?|und|rtDescriptor)|p(e(cifierTest|ech(Recognizer|Synthesizer)|ll(Server|Checker))|litView)|e(cureTextField(Cell)?|t(Command)?|archField(Cell)?|rializer|gmentedC(ontrol|ell))|lider(Cell)?|avePanel)|H(ost|TTP(Cookie(Storage)?|URLResponse)|elpManager)|N(ib(Con(nector|trolConnector)|OutletConnector)?|otification(Center|Queue)?|u(ll|mber(Formatter)?)|etService(Browser)?|ameSpecifier)|C(ha(ngeSpelling|racterSet)|o(n(stantString|nection|trol(ler)?|ditionLock)|d(ing|er)|unt(Command|edSet)|pying|lor(Space|P(ick(ing(Custom|Default)|er)|anel)|Well|List)?|m(p(oundPredicate|arisonPredicate)|boBox(Cell)?))|u(stomImageRep|rsor)|IImageRep|ell|l(ipView|o(seCommand|neCommand)|assDescription)|a(ched(ImageRep|URLResponse)|lendar(Date)?)|reateCommand)|T(hread|ypesetter|ime(Zone|r)|o(olbar(Item(Validations)?)?|kenField(Cell)?)|ext(Block|Storage|Container|Tab(le(Block)?)?|Input|View|Field(Cell)?|List|Attachment(Cell)?)?|a(sk|b(le(Header(Cell|View)|Column|View)|View(Item)?))|reeController)|I(n(dex(S(pecifier|et)|Path)|put(Manager|S(tream|erv(iceProvider|er(MouseTracker)?)))|vocation)|gnoreMisspelledWords|mage(Rep|Cell|View)?)|O(ut(putStream|lineView)|pen(GL(Context|Pixel(Buffer|Format)|View)|Panel)|bj(CTypeSerializationCallBack|ect(Controller)?))|D(i(st(antObject(Request)?|ributed(NotificationCenter|Lock))|ctionary|rectoryEnumerator)|ocument(Controller)?|e(serializer|cimalNumber(Behaviors|Handler)?|leteCommand)|at(e(Components|Picker(Cell)?|Formatter)?|a)|ra(wer|ggingInfo))|U(ser(InterfaceValidations|Defaults(Controller)?)|RL(Re(sponse|quest)|Handle(Client)?|C(onnection|ache|redential(Storage)?)|Download(Delegate)?|Prot(ocol(Client)?|ectionSpace)|AuthenticationChallenge(Sender)?)?|n(iqueIDSpecifier|doManager|archiver))|P(ipe|o(sitionalSpecifier|pUpButton(Cell)?|rt(Message|NameServer|Coder)?)|ICTImageRep|ersistentDocument|DFImageRep|a(steboard|nel|ragraphStyle|geLayout)|r(int(Info|er|Operation|Panel)|o(cessInfo|tocolChecker|perty(Specifier|ListSerialization)|gressIndicator|xy)|edicate))|E(numerator|vent|PSImageRep|rror|x(ception|istsCommand|pression))|V(iew(Animation)?|al(idated(ToobarItem|UserInterfaceItem)|ue(Transformer)?))|Keyed(Unarchiver|Archiver)|Qui(ckDrawView|tCommand)|F(ile(Manager|Handle|Wrapper)|o(nt(Manager|Descriptor|Panel)?|rm(Cell|atter)))|W(hoseSpecifier|indow(Controller)?|orkspace)|L(o(c(k(ing)?|ale)|gicalTest)|evelIndicator(Cell)?|ayoutManager)|A(ssertionHandler|nimation|ctionCell|ttributedString|utoreleasePool|TSTypesetter|ppl(ication|e(Script|Event(Manager|Descriptor)))|ffineTransform|lert|r(chiver|ray(Controller)?)))\b/
  end
  rule 'support.type.cocoa.leopard' do
    match %r/\bNS(R(oundingMode|ule(Editor(RowType|NestingMode)|rOrientation)|e(questUserAttentionType|lativePosition))|G(lyphInscription|radientDrawingOptions)|XML(NodeKind|D(ocumentContentKind|TDNodeKind)|ParserError)|M(ultibyteGlyphPacking|apTableOptions)|B(itmapFormat|oxType|ezierPathElement|ackgroundStyle|rowserDropOperation)|S(tr(ing(CompareOptions|DrawingOptions|EncodingConversionOptions)|eam(Status|Event))|p(eechBoundary|litViewDividerStyle)|e(archPathD(irectory|omainMask)|gmentS(tyle|witchTracking))|liderType|aveOptions)|H(TTPCookieAcceptPolicy|ashTableOptions)|N(otification(SuspensionBehavior|Coalescing)|umberFormatter(RoundingMode|Behavior|Style|PadPosition)|etService(sError|Options))|C(haracterCollection|o(lor(RenderingIntent|SpaceModel|PanelMode)|mp(oundPredicateType|arisonPredicateModifier))|ellStateValue|al(culationError|endarUnit))|T(ypesetterControlCharacterAction|imeZoneNameStyle|e(stComparisonOperation|xt(Block(Dimension|V(erticalAlignment|alueType)|Layer)|TableLayoutAlgorithm|FieldBezelStyle))|ableView(SelectionHighlightStyle|ColumnAutoresizingStyle)|rackingAreaOptions)|I(n(sertionPosition|te(rfaceStyle|ger))|mage(RepLoadStatus|Scaling|CacheMode|FrameStyle|LoadStatus|Alignment))|Ope(nGLPixelFormatAttribute|rationQueuePriority)|Date(Picker(Mode|Style)|Formatter(Behavior|Style))|U(RL(RequestCachePolicy|HandleStatus|C(acheStoragePolicy|redentialPersistence))|Integer)|P(o(stingStyle|int(ingDeviceType|erFunctionsOptions)|pUpArrowPosition)|athStyle|r(int(ing(Orientation|PaginationMode)|erTableStatus|PanelOptions)|opertyList(MutabilityOptions|Format)|edicateOperatorType))|ExpressionType|KeyValue(SetMutationKind|Change)|QTMovieLoopMode|F(indPanel(SubstringMatchType|Action)|o(nt(RenderingMode|FamilyClass)|cusRingPlacement))|W(hoseSubelementIdentifier|ind(ingRule|ow(B(utton|ackingLocation)|SharingType|CollectionBehavior)))|L(ine(MovementDirection|SweepDirection|CapStyle|JoinStyle)|evelIndicatorStyle)|Animation(BlockingMode|Curve))\b/
  end
  rule 'support.class.quartz' do
    match %r/\bC(I(Sampler|Co(ntext|lor)|Image(Accumulator)?|PlugIn(Registration)?|Vector|Kernel|Filter(Generator|Shape)?)|A(Renderer|MediaTiming(Function)?|BasicAnimation|ScrollLayer|Constraint(LayoutManager)?|T(iledLayer|extLayer|rans(ition|action))|OpenGLLayer|PropertyAnimation|KeyframeAnimation|Layer|A(nimation(Group)?|ction)))\b/
  end
  rule 'support.type.quartz' do
    match %r/\bC(G(Float|Point|Size|Rect)|IFormat|AConstraintAttribute)\b/
  end
  rule 'support.type.cocoa' do
    match %r/\bNS(R(ect(Edge)?|ange)|G(lyph(Relation|LayoutMode)?|radientType)|M(odalSession|a(trixMode|p(Table|Enumerator)))|B(itmapImageFileType|orderType|uttonType|ezelStyle|ackingStoreType|rowserColumnResizingType)|S(cr(oll(er(Part|Arrow)|ArrowPosition)|eenAuxiliaryOpaque)|tringEncoding|ize|ocketNativeHandle|election(Granularity|Direction|Affinity)|wapped(Double|Float)|aveOperationType)|Ha(sh(Table|Enumerator)|ndler(2)?)|C(o(ntrol(Size|Tint)|mp(ositingOperation|arisonResult))|ell(State|Type|ImagePosition|Attribute))|T(hreadPrivate|ypesetterGlyphInfo|i(ckMarkPosition|tlePosition|meInterval)|o(ol(TipTag|bar(SizeMode|DisplayMode))|kenStyle)|IFFCompression|ext(TabType|Alignment)|ab(State|leViewDropOperation|ViewType)|rackingRectTag)|ImageInterpolation|Zone|OpenGL(ContextAuxiliary|PixelFormatAuxiliary)|D(ocumentChangeType|atePickerElementFlags|ra(werState|gOperation))|UsableScrollerParts|P(oint|r(intingPageOrder|ogressIndicator(Style|Th(ickness|readInfo))))|EventType|KeyValueObservingOptions|Fo(nt(SymbolicTraits|TraitMask|Action)|cusRingType)|W(indow(OrderingMode|Depth)|orkspace(IconCreationOptions|LaunchOptions)|ritingDirection)|L(ineBreakMode|ayout(Status|Direction))|A(nimation(Progress|Effect)|ppl(ication(TerminateReply|DelegateReply|PrintReply)|eEventManagerSuspensionID)|ffineTransformStruct|lertStyle))\b/
  end
  rule 'support.constant.cocoa' do
    match %r/\bNS(NotFound|Ordered(Ascending|Descending|Same))\b/
  end
  rule 'support.constant.notification.cocoa.leopard' do
    match %r/\bNS(MenuDidBeginTracking|ViewDidUpdateTrackingAreas)?Notification\b/
  end
  rule 'support.constant.notification.cocoa' do
    match %r/\bNS(Menu(Did(RemoveItem|SendAction|ChangeItem|EndTracking|AddItem)|WillSendAction)|S(ystemColorsDidChange|plitView(DidResizeSubviews|WillResizeSubviews))|C(o(nt(extHelpModeDid(Deactivate|Activate)|rolT(intDidChange|extDid(BeginEditing|Change|EndEditing)))|lor(PanelColorDidChange|ListDidChange)|mboBox(Selection(IsChanging|DidChange)|Will(Dismiss|PopUp)))|lassDescriptionNeededForClass)|T(oolbar(DidRemoveItem|WillAddItem)|ext(Storage(DidProcessEditing|WillProcessEditing)|Did(BeginEditing|Change|EndEditing)|View(DidChange(Selection|TypingAttributes)|WillChangeNotifyingTextView))|ableView(Selection(IsChanging|DidChange)|ColumnDid(Resize|Move)))|ImageRepRegistryDidChange|OutlineView(Selection(IsChanging|DidChange)|ColumnDid(Resize|Move)|Item(Did(Collapse|Expand)|Will(Collapse|Expand)))|Drawer(Did(Close|Open)|Will(Close|Open))|PopUpButton(CellWillPopUp|WillPopUp)|View(GlobalFrameDidChange|BoundsDidChange|F(ocusDidChange|rameDidChange))|FontSetChanged|W(indow(Did(Resi(ze|gn(Main|Key))|M(iniaturize|ove)|Become(Main|Key)|ChangeScreen(|Profile)|Deminiaturize|Update|E(ndSheet|xpose))|Will(M(iniaturize|ove)|BeginSheet|Close))|orkspace(SessionDid(ResignActive|BecomeActive)|Did(Mount|TerminateApplication|Unmount|PerformFileOperation|Wake|LaunchApplication)|Will(Sleep|Unmount|PowerOff|LaunchApplication)))|A(ntialiasThresholdChanged|ppl(ication(Did(ResignActive|BecomeActive|Hide|ChangeScreenParameters|U(nhide|pdate)|FinishLaunching)|Will(ResignActive|BecomeActive|Hide|Terminate|U(nhide|pdate)|FinishLaunching))|eEventManagerWillProcessFirstEvent)))Notification\b/
  end
  rule 'support.constant.cocoa.leopard' do
    match %r/\bNS(RuleEditor(RowType(Simple|Compound)|NestingMode(Si(ngle|mple)|Compound|List))|GradientDraws(BeforeStartingLocation|AfterEndingLocation)|M(inusSetExpressionType|a(chPortDeallocate(ReceiveRight|SendRight|None)|pTable(StrongMemory|CopyIn|ZeroingWeakMemory|ObjectPointerPersonality)))|B(oxCustom|undleExecutableArchitecture(X86|I386|PPC(64)?)|etweenPredicateOperatorType|ackgroundStyle(Raised|Dark|L(ight|owered)))|S(tring(DrawingTruncatesLastVisibleLine|EncodingConversion(ExternalRepresentation|AllowLossy))|ubqueryExpressionType|p(e(ech(SentenceBoundary|ImmediateBoundary|WordBoundary)|llingState(GrammarFlag|SpellingFlag))|litViewDividerStyleThi(n|ck))|e(rvice(RequestTimedOutError|M(iscellaneousError|alformedServiceDictionaryError)|InvalidPasteboardDataError|ErrorM(inimum|aximum)|Application(NotFoundError|LaunchFailedError))|gmentStyle(Round(Rect|ed)|SmallSquare|Capsule|Textured(Rounded|Square)|Automatic)))|H(UDWindowMask|ashTable(StrongMemory|CopyIn|ZeroingWeakMemory|ObjectPointerPersonality))|N(oModeColorPanel|etServiceNoAutoRename)|C(hangeRedone|o(ntainsPredicateOperatorType|l(orRenderingIntent(RelativeColorimetric|Saturation|Default|Perceptual|AbsoluteColorimetric)|lectorDisabledOption))|ellHit(None|ContentArea|TrackableArea|EditableTextArea))|T(imeZoneNameStyle(S(hort(Standard|DaylightSaving)|tandard)|DaylightSaving)|extFieldDatePickerStyle|ableViewSelectionHighlightStyle(Regular|SourceList)|racking(Mouse(Moved|EnteredAndExited)|CursorUpdate|InVisibleRect|EnabledDuringMouseDrag|A(ssumeInside|ctive(In(KeyWindow|ActiveApp)|WhenFirstResponder|Always))))|I(n(tersectSetExpressionType|dexedColorSpaceModel)|mageScale(None|Proportionally(Down|UpOrDown)|AxesIndependently))|Ope(nGLPFAAllowOfflineRenderers|rationQueue(DefaultMaxConcurrentOperationCount|Priority(High|Normal|Very(High|Low)|Low)))|D(iacriticInsensitiveSearch|ownloadsDirectory)|U(nionSetExpressionType|TF(16(BigEndianStringEncoding|StringEncoding|LittleEndianStringEncoding)|32(BigEndianStringEncoding|StringEncoding|LittleEndianStringEncoding)))|P(ointerFunctions(Ma(chVirtualMemory|llocMemory)|Str(ongMemory|uctPersonality)|C(StringPersonality|opyIn)|IntegerPersonality|ZeroingWeakMemory|O(paque(Memory|Personality)|bjectP(ointerPersonality|ersonality)))|at(hStyle(Standard|NavigationBar|PopUp)|ternColorSpaceModel)|rintPanelShows(Scaling|Copies|Orientation|P(a(perSize|ge(Range|SetupAccessory))|review)))|Executable(RuntimeMismatchError|NotLoadableError|ErrorM(inimum|aximum)|L(inkError|oadError)|ArchitectureMismatchError)|KeyValueObservingOption(Initial|Prior)|F(i(ndPanelSubstringMatchType(StartsWith|Contains|EndsWith|FullWord)|leRead(TooLargeError|UnknownStringEncodingError))|orcedOrderingSearch)|Wi(ndow(BackingLocation(MainMemory|Default|VideoMemory)|Sharing(Read(Only|Write)|None)|CollectionBehavior(MoveToActiveSpace|CanJoinAllSpaces|Default))|dthInsensitiveSearch)|AggregateExpressionType)\b/
  end
  rule 'support.constant.cocoa' do
    match %r/\bNS(R(GB(ModeColorPanel|ColorSpaceModel)|ight(Mouse(D(own(Mask)?|ragged(Mask)?)|Up(Mask)?)|T(ext(Movement|Alignment)|ab(sBezelBorder|StopType))|ArrowFunctionKey)|ound(RectBezelStyle|Bankers|ed(BezelStyle|TokenStyle|DisclosureBezelStyle)|Down|Up|Plain|Line(CapStyle|JoinStyle))|un(StoppedResponse|ContinuesResponse|AbortedResponse)|e(s(izableWindowMask|et(CursorRectsRunLoopOrdering|FunctionKey))|ce(ssedBezelStyle|iver(sCantHandleCommandScriptError|EvaluationScriptError))|turnTextMovement|doFunctionKey|quiredArgumentsMissingScriptError|l(evancyLevelIndicatorStyle|ative(Before|After))|gular(SquareBezelStyle|ControlSize)|moveTraitFontAction)|a(n(domSubelement|geDateMode)|tingLevelIndicatorStyle|dio(ModeMatrix|Button)))|G(IFFileType|lyph(Below|Inscribe(B(elow|ase)|Over(strike|Below)|Above)|Layout(WithPrevious|A(tAPoint|gainstAPoint))|A(ttribute(BidiLevel|Soft|Inscribe|Elastic)|bove))|r(ooveBorder|eaterThan(Comparison|OrEqualTo(Comparison|PredicateOperatorType)|PredicateOperatorType)|a(y(ModeColorPanel|ColorSpaceModel)|dient(None|Con(cave(Strong|Weak)|vex(Strong|Weak)))|phiteControlTint)))|XML(N(o(tationDeclarationKind|de(CompactEmptyElement|IsCDATA|OptionsNone|Use(SingleQuotes|DoubleQuotes)|Pre(serve(NamespaceOrder|C(haracterReferences|DATA)|DTD|Prefixes|E(ntities|mptyElements)|Quotes|Whitespace|A(ttributeOrder|ll))|ttyPrint)|ExpandEmptyElement))|amespaceKind)|CommentKind|TextKind|InvalidKind|D(ocument(X(MLKind|HTMLKind|Include)|HTMLKind|T(idy(XML|HTML)|extKind)|IncludeContentTypeDeclaration|Validate|Kind)|TDKind)|P(arser(GTRequiredError|XMLDeclNot(StartedError|FinishedError)|Mi(splaced(XMLDeclarationError|CDATAEndStringError)|xedContentDeclNot(StartedError|FinishedError))|S(t(andaloneValueError|ringNot(StartedError|ClosedError))|paceRequiredError|eparatorRequiredError)|N(MTOKENRequiredError|o(t(ationNot(StartedError|FinishedError)|WellBalancedError)|DTDError)|amespaceDeclarationError|AMERequiredError)|C(haracterRef(In(DTDError|PrologError|EpilogError)|AtEOFError)|o(nditionalSectionNot(StartedError|FinishedError)|mment(NotFinishedError|ContainsDoubleHyphenError))|DATANotFinishedError)|TagNameMismatchError|In(ternalError|valid(HexCharacterRefError|C(haracter(RefError|InEntityError|Error)|onditionalSectionError)|DecimalCharacterRefError|URIError|Encoding(NameError|Error)))|OutOfMemoryError|D(ocumentStartError|elegateAbortedParseError|OCTYPEDeclNotFinishedError)|U(RI(RequiredError|FragmentError)|n(declaredEntityError|parsedEntityError|knownEncodingError|finishedTagError))|P(CDATARequiredError|ublicIdentifierRequiredError|arsedEntityRef(MissingSemiError|NoNameError|In(Internal(SubsetError|Error)|PrologError|EpilogError)|AtEOFError)|r(ocessingInstructionNot(StartedError|FinishedError)|ematureDocumentEndError))|E(n(codingNotSupportedError|tity(Ref(In(DTDError|PrologError|EpilogError)|erence(MissingSemiError|WithoutNameError)|LoopError|AtEOFError)|BoundaryError|Not(StartedError|FinishedError)|Is(ParameterError|ExternalError)|ValueRequiredError))|qualExpectedError|lementContentDeclNot(StartedError|FinishedError)|xt(ernalS(tandaloneEntityError|ubsetNotFinishedError)|raContentError)|mptyDocumentError)|L(iteralNot(StartedError|FinishedError)|T(RequiredError|SlashRequiredError)|essThanSymbolInAttributeError)|Attribute(RedefinedError|HasNoValueError|Not(StartedError|FinishedError)|ListNot(StartedError|FinishedError)))|rocessingInstructionKind)|E(ntity(GeneralKind|DeclarationKind|UnparsedKind|P(ar(sedKind|ameterKind)|redefined))|lement(Declaration(MixedKind|UndefinedKind|E(lementKind|mptyKind)|Kind|AnyKind)|Kind))|Attribute(N(MToken(sKind|Kind)|otationKind)|CDATAKind|ID(Ref(sKind|Kind)|Kind)|DeclarationKind|En(tit(yKind|iesKind)|umerationKind)|Kind))|M(i(n(XEdge|iaturizableWindowMask|YEdge|uteCalendarUnit)|terLineJoinStyle|ddleSubelement|xedState)|o(nthCalendarUnit|deSwitchFunctionKey|use(Moved(Mask)?|E(ntered(Mask)?|ventSubtype|xited(Mask)?))|veToBezierPathElement|mentary(ChangeButton|Push(Button|InButton)|Light(Button)?))|enuFunctionKey|a(c(intoshInterfaceStyle|OSRomanStringEncoding)|tchesPredicateOperatorType|ppedRead|x(XEdge|YEdge))|ACHOperatingSystem)|B(MPFileType|o(ttomTabsBezelBorder|ldFontMask|rderlessWindowMask|x(Se(condary|parator)|OldStyle|Primary))|uttLineCapStyle|e(zelBorder|velLineJoinStyle|low(Bottom|Top)|gin(sWith(Comparison|PredicateOperatorType)|FunctionKey))|lueControlTint|ack(spaceCharacter|tabTextMovement|ingStore(Retained|Buffered|Nonretained)|TabCharacter|wardsSearch|groundTab)|r(owser(NoColumnResizing|UserColumnResizing|AutoColumnResizing)|eakFunctionKey))|S(h(ift(JISStringEncoding|KeyMask)|ow(ControlGlyphs|InvisibleGlyphs)|adowlessSquareBezelStyle)|y(s(ReqFunctionKey|tem(D(omainMask|efined(Mask)?)|FunctionKey))|mbolStringEncoding)|c(a(nnedOption|le(None|ToFit|Proportionally))|r(oll(er(NoPart|Increment(Page|Line|Arrow)|Decrement(Page|Line|Arrow)|Knob(Slot)?|Arrows(M(inEnd|axEnd)|None|DefaultSetting))|Wheel(Mask)?|LockFunctionKey)|eenChangedEventType))|t(opFunctionKey|r(ingDrawing(OneShot|DisableScreenFontSubstitution|Uses(DeviceMetrics|FontLeading|LineFragmentOrigin))|eam(Status(Reading|NotOpen|Closed|Open(ing)?|Error|Writing|AtEnd)|Event(Has(BytesAvailable|SpaceAvailable)|None|OpenCompleted|E(ndEncountered|rrorOccurred)))))|i(ngle(DateMode|UnderlineStyle)|ze(DownFontAction|UpFontAction))|olarisOperatingSystem|unOSOperatingSystem|pecialPageOrder|e(condCalendarUnit|lect(By(Character|Paragraph|Word)|i(ng(Next|Previous)|onAffinity(Downstream|Upstream))|edTab|FunctionKey)|gmentSwitchTracking(Momentary|Select(One|Any)))|quareLineCapStyle|witchButton|ave(ToOperation|Op(tions(Yes|No|Ask)|eration)|AsOperation)|mall(SquareBezelStyle|C(ontrolSize|apsFontMask)|IconButtonBezelStyle))|H(ighlightModeMatrix|SBModeColorPanel|o(ur(Minute(SecondDatePickerElementFlag|DatePickerElementFlag)|CalendarUnit)|rizontalRuler|meFunctionKey)|TTPCookieAcceptPolicy(Never|OnlyFromMainDocumentDomain|Always)|e(lp(ButtonBezelStyle|KeyMask|FunctionKey)|avierFontAction)|PUXOperatingSystem)|Year(MonthDa(yDatePickerElementFlag|tePickerElementFlag)|CalendarUnit)|N(o(n(StandardCharacterSetFontMask|ZeroWindingRule|activatingPanelMask|LossyASCIIStringEncoding)|Border|t(ification(SuspensionBehavior(Hold|Coalesce|D(eliverImmediately|rop))|NoCoalescing|CoalescingOn(Sender|Name)|DeliverImmediately|PostToAllSessions)|PredicateType|EqualToPredicateOperatorType)|S(cr(iptError|ollerParts)|ubelement|pecifierError)|CellMask|T(itle|opLevelContainersSpecifierError|abs(BezelBorder|NoBorder|LineBorder))|I(nterfaceStyle|mage)|UnderlineStyle|FontChangeAction)|u(ll(Glyph|CellType)|m(eric(Search|PadKeyMask)|berFormatter(Round(Half(Down|Up|Even)|Ceiling|Down|Up|Floor)|Behavior(10|Default)|S(cientificStyle|pellOutStyle)|NoStyle|CurrencyStyle|DecimalStyle|P(ercentStyle|ad(Before(Suffix|Prefix)|After(Suffix|Prefix))))))|e(t(Services(BadArgumentError|NotFoundError|C(ollisionError|ancelledError)|TimeoutError|InvalidError|UnknownError|ActivityInProgress)|workDomainMask)|wlineCharacter|xt(StepInterfaceStyle|FunctionKey))|EXTSTEPStringEncoding|a(t(iveShortGlyphPacking|uralTextAlignment)|rrowFontMask))|C(hange(ReadOtherContents|GrayCell(Mask)?|BackgroundCell(Mask)?|Cleared|Done|Undone|Autosaved)|MYK(ModeColorPanel|ColorSpaceModel)|ircular(BezelStyle|Slider)|o(n(stantValueExpressionType|t(inuousCapacityLevelIndicatorStyle|entsCellMask|ain(sComparison|erSpecifierError)|rol(Glyph|KeyMask))|densedFontMask)|lor(Panel(RGBModeMask|GrayModeMask|HSBModeMask|C(MYKModeMask|olorListModeMask|ustomPaletteModeMask|rayonModeMask)|WheelModeMask|AllModesMask)|ListModeColorPanel)|reServiceDirectory|m(p(osite(XOR|Source(In|O(ut|ver)|Atop)|Highlight|C(opy|lear)|Destination(In|O(ut|ver)|Atop)|Plus(Darker|Lighter))|ressedFontMask)|mandKeyMask))|u(stom(SelectorPredicateOperatorType|PaletteModeColorPanel)|r(sor(Update(Mask)?|PointingDevice)|veToBezierPathElement))|e(nterT(extAlignment|abStopType)|ll(State|H(ighlighted|as(Image(Horizontal|OnLeftOrBottom)|OverlappingImage))|ChangesContents|Is(Bordered|InsetButton)|Disabled|Editable|LightsBy(Gray|Background|Contents)|AllowsMixedState))|l(ipPagination|o(s(ePathBezierPathElement|ableWindowMask)|ckAndCalendarDatePickerStyle)|ear(ControlTint|DisplayFunctionKey|LineFunctionKey))|a(seInsensitive(Search|PredicateOption)|n(notCreateScriptCommandError|cel(Button|TextMovement))|chesDirectory|lculation(NoError|Overflow|DivideByZero|Underflow|LossOfPrecision)|rriageReturnCharacter)|r(itical(Request|AlertStyle)|ayonModeColorPanel))|T(hick(SquareBezelStyle|erSquareBezelStyle)|ypesetter(Behavior|HorizontalTabAction|ContainerBreakAction|ZeroAdvancementAction|OriginalBehavior|ParagraphBreakAction|WhitespaceAction|L(ineBreakAction|atestBehavior))|i(ckMark(Right|Below|Left|Above)|tledWindowMask|meZoneDatePickerElementFlag)|o(olbarItemVisibilityPriority(Standard|High|User|Low)|pTabsBezelBorder|ggleButton)|IFF(Compression(N(one|EXT)|CCITTFAX(3|4)|OldJPEG|JPEG|PackBits|LZW)|FileType)|e(rminate(Now|Cancel|Later)|xt(Read(InapplicableDocumentTypeError|WriteErrorM(inimum|aximum))|Block(M(i(nimum(Height|Width)|ddleAlignment)|a(rgin|ximum(Height|Width)))|B(o(ttomAlignment|rder)|aselineAlignment)|Height|TopAlignment|P(ercentageValueType|adding)|Width|AbsoluteValueType)|StorageEdited(Characters|Attributes)|CellType|ured(RoundedBezelStyle|BackgroundWindowMask|SquareBezelStyle)|Table(FixedLayoutAlgorithm|AutomaticLayoutAlgorithm)|Field(RoundedBezel|SquareBezel|AndStepperDatePickerStyle)|WriteInapplicableDocumentTypeError|ListPrependEnclosingMarker))|woByteGlyphPacking|ab(Character|TextMovement|le(tP(oint(Mask|EventSubtype)?|roximity(Mask|EventSubtype)?)|Column(NoResizing|UserResizingMask|AutoresizingMask)|View(ReverseSequentialColumnAutoresizingStyle|GridNone|S(olid(HorizontalGridLineMask|VerticalGridLineMask)|equentialColumnAutoresizingStyle)|NoColumnAutoresizing|UniformColumnAutoresizingStyle|FirstColumnOnlyAutoresizingStyle|LastColumnOnlyAutoresizingStyle)))|rackModeMatrix)|I(n(sert(CharFunctionKey|FunctionKey|LineFunctionKey)|t(Type|ernalS(criptError|pecifierError))|dexSubelement|validIndexSpecifierError|formational(Request|AlertStyle)|PredicateOperatorType)|talicFontMask|SO(2022JPStringEncoding|Latin(1StringEncoding|2StringEncoding))|dentityMappingCharacterCollection|llegalTextMovement|mage(R(ight|ep(MatchesDevice|LoadStatus(ReadingHeader|Completed|InvalidData|Un(expectedEOF|knownType)|WillNeedAllData)))|Below|C(ellType|ache(BySize|Never|Default|Always))|Interpolation(High|None|Default|Low)|O(nly|verlaps)|Frame(Gr(oove|ayBezel)|Button|None|Photo)|L(oadStatus(ReadError|C(ompleted|ancelled)|InvalidData|UnexpectedEOF)|eft)|A(lign(Right|Bottom(Right|Left)?|Center|Top(Right|Left)?|Left)|bove)))|O(n(State|eByteGlyphPacking|OffButton|lyScrollerArrows)|ther(Mouse(D(own(Mask)?|ragged(Mask)?)|Up(Mask)?)|TextMovement)|SF1OperatingSystem|pe(n(GL(GO(Re(setLibrary|tainRenderers)|ClearFormatCache|FormatCacheSize)|PFA(R(obust|endererID)|M(inimumPolicy|ulti(sample|Screen)|PSafe|aximumPolicy)|BackingStore|S(creenMask|te(ncilSize|reo)|ingleRenderer|upersample|ample(s|Buffers|Alpha))|NoRecovery|C(o(lor(Size|Float)|mpliant)|losestPolicy)|OffScreen|D(oubleBuffer|epthSize)|PixelBuffer|VirtualScreenCount|FullScreen|Window|A(cc(umSize|elerated)|ux(Buffers|DepthStencil)|l(phaSize|lRenderers))))|StepUnicodeReservedBase)|rationNotSupportedForKeyS(criptError|pecifierError))|ffState|KButton|rPredicateType|bjC(B(itfield|oolType)|S(hortType|tr(ingType|uctType)|electorType)|NoType|CharType|ObjectType|DoubleType|UnionType|PointerType|VoidType|FloatType|Long(Type|longType)|ArrayType))|D(i(s(c(losureBezelStyle|reteCapacityLevelIndicatorStyle)|playWindowRunLoopOrdering)|acriticInsensitivePredicateOption|rect(Selection|PredicateModifier))|o(c(ModalWindowMask|ument(Directory|ationDirectory))|ubleType|wn(TextMovement|ArrowFunctionKey))|e(s(cendingPageOrder|ktopDirectory)|cimalTabStopType|v(ice(NColorSpaceModel|IndependentModifierFlagsMask)|eloper(Directory|ApplicationDirectory))|fault(ControlTint|TokenStyle)|lete(Char(acter|FunctionKey)|FunctionKey|LineFunctionKey)|moApplicationDirectory)|a(yCalendarUnit|teFormatter(MediumStyle|Behavior(10|Default)|ShortStyle|NoStyle|FullStyle|LongStyle))|ra(wer(Clos(ingState|edState)|Open(ingState|State))|gOperation(Generic|Move|None|Copy|Delete|Private|Every|Link|All)))|U(ser(CancelledError|D(irectory|omainMask)|FunctionKey)|RL(Handle(NotLoaded|Load(Succeeded|InProgress|Failed))|CredentialPersistence(None|Permanent|ForSession))|n(scaledWindowMask|cachedRead|i(codeStringEncoding|talicFontMask|fiedTitleAndToolbarWindowMask)|d(o(CloseGroupingRunLoopOrdering|FunctionKey)|e(finedDateComponent|rline(Style(Single|None|Thick|Double)|Pattern(Solid|D(ot|ash(Dot(Dot)?)?)))))|known(ColorSpaceModel|P(ointingDevice|ageOrder)|KeyS(criptError|pecifierError))|boldFontMask)|tilityWindowMask|TF8StringEncoding|p(dateWindowsRunLoopOrdering|TextMovement|ArrowFunctionKey))|J(ustifiedTextAlignment|PEG(2000FileType|FileType)|apaneseEUC(GlyphPacking|StringEncoding))|P(o(s(t(Now|erFontMask|WhenIdle|ASAP)|iti(on(Replace|Be(fore|ginning)|End|After)|ve(IntType|DoubleType|FloatType)))|pUp(NoArrow|ArrowAt(Bottom|Center))|werOffEventType|rtraitOrientation)|NGFileType|ush(InCell(Mask)?|OnPushOffButton)|e(n(TipMask|UpperSideMask|PointingDevice|LowerSideMask)|riodic(Mask)?)|P(S(caleField|tatus(Title|Field)|aveButton)|N(ote(Title|Field)|ame(Title|Field))|CopiesField|TitleField|ImageButton|OptionsButton|P(a(perFeedButton|ge(Range(To|From)|ChoiceMatrix))|reviewButton)|LayoutButton)|lainTextTokenStyle|a(useFunctionKey|ragraphSeparatorCharacter|ge(DownFunctionKey|UpFunctionKey))|r(int(ing(ReplyLater|Success|Cancelled|Failure)|ScreenFunctionKey|erTable(NotFound|OK|Error)|FunctionKey)|o(p(ertyList(XMLFormat|MutableContainers(AndLeaves)?|BinaryFormat|Immutable|OpenStepFormat)|rietaryStringEncoding)|gressIndicator(BarStyle|SpinningStyle|Preferred(SmallThickness|Thickness|LargeThickness|AquaThickness)))|e(ssedTab|vFunctionKey))|L(HeightForm|CancelButton|TitleField|ImageButton|O(KButton|rientationMatrix)|UnitsButton|PaperNameButton|WidthForm))|E(n(terCharacter|d(sWith(Comparison|PredicateOperatorType)|FunctionKey))|v(e(nOddWindingRule|rySubelement)|aluatedObjectExpressionType)|qualTo(Comparison|PredicateOperatorType)|ra(serPointingDevice|CalendarUnit|DatePickerElementFlag)|x(clude(10|QuickDrawElementsIconCreationOption)|pandedFontMask|ecuteFunctionKey))|V(i(ew(M(in(XMargin|YMargin)|ax(XMargin|YMargin))|HeightSizable|NotSizable|WidthSizable)|aPanelFontAction)|erticalRuler|a(lidationErrorM(inimum|aximum)|riableExpressionType))|Key(SpecifierEvaluationScriptError|Down(Mask)?|Up(Mask)?|PathExpressionType|Value(MinusSetMutation|SetSetMutation|Change(Re(placement|moval)|Setting|Insertion)|IntersectSetMutation|ObservingOption(New|Old)|UnionSetMutation|ValidationError))|QTMovie(NormalPlayback|Looping(BackAndForthPlayback|Playback))|F(1(1FunctionKey|7FunctionKey|2FunctionKey|8FunctionKey|3FunctionKey|9FunctionKey|4FunctionKey|5FunctionKey|FunctionKey|0FunctionKey|6FunctionKey)|7FunctionKey|i(nd(PanelAction(Replace(A(ndFind|ll(InSelection)?))?|S(howFindPanel|e(tFindString|lectAll(InSelection)?))|Next|Previous)|FunctionKey)|tPagination|le(Read(No(SuchFileError|PermissionError)|CorruptFileError|In(validFileNameError|applicableStringEncodingError)|Un(supportedSchemeError|knownError))|HandlingPanel(CancelButton|OKButton)|NoSuchFileError|ErrorM(inimum|aximum)|Write(NoPermissionError|In(validFileNameError|applicableStringEncodingError)|OutOfSpaceError|Un(supportedSchemeError|knownError))|LockingError)|xedPitchFontMask)|2(1FunctionKey|7FunctionKey|2FunctionKey|8FunctionKey|3FunctionKey|9FunctionKey|4FunctionKey|5FunctionKey|FunctionKey|0FunctionKey|6FunctionKey)|o(nt(Mo(noSpaceTrait|dernSerifsClass)|BoldTrait|S(ymbolicClass|criptsClass|labSerifsClass|ansSerifClass)|C(o(ndensedTrait|llectionApplicationOnlyMask)|larendonSerifsClass)|TransitionalSerifsClass|I(ntegerAdvancementsRenderingMode|talicTrait)|O(ldStyleSerifsClass|rnamentalsClass)|DefaultRenderingMode|U(nknownClass|IOptimizedTrait)|Panel(S(hadowEffectModeMask|t(andardModesMask|rikethroughEffectModeMask)|izeModeMask)|CollectionModeMask|TextColorEffectModeMask|DocumentColorEffectModeMask|UnderlineEffectModeMask|FaceModeMask|All(ModesMask|EffectsModeMask))|ExpandedTrait|VerticalTrait|F(amilyClassMask|reeformSerifsClass)|Antialiased(RenderingMode|IntegerAdvancementsRenderingMode))|cusRing(Below|Type(None|Default|Exterior)|Only|Above)|urByteGlyphPacking|rm(attingError(M(inimum|aximum))?|FeedCharacter))|8FunctionKey|unction(ExpressionType|KeyMask)|3(1FunctionKey|2FunctionKey|3FunctionKey|4FunctionKey|5FunctionKey|FunctionKey|0FunctionKey)|9FunctionKey|4FunctionKey|P(RevertButton|S(ize(Title|Field)|etButton)|CurrentField|Preview(Button|Field))|l(oat(ingPointSamplesBitmapFormat|Type)|agsChanged(Mask)?)|axButton|5FunctionKey|6FunctionKey)|W(heelModeColorPanel|indow(s(NTOperatingSystem|CP125(1StringEncoding|2StringEncoding|3StringEncoding|4StringEncoding|0StringEncoding)|95(InterfaceStyle|OperatingSystem))|M(iniaturizeButton|ovedEventType)|Below|CloseButton|ToolbarButton|ZoomButton|Out|DocumentIconButton|ExposedEventType|Above)|orkspaceLaunch(NewInstance|InhibitingBackgroundOnly|Default|PreferringClassic|WithoutA(ctivation|ddingToRecents)|A(sync|nd(Hide(Others)?|Print)|llowingClassicStartup))|eek(day(CalendarUnit|OrdinalCalendarUnit)|CalendarUnit)|a(ntsBidiLevels|rningAlertStyle)|r(itingDirection(RightToLeft|Natural|LeftToRight)|apCalendarComponents))|L(i(stModeMatrix|ne(Moves(Right|Down|Up|Left)|B(order|reakBy(C(harWrapping|lipping)|Truncating(Middle|Head|Tail)|WordWrapping))|S(eparatorCharacter|weep(Right|Down|Up|Left))|ToBezierPathElement|DoesntMove|arSlider)|teralSearch|kePredicateOperatorType|ghterFontAction|braryDirectory)|ocalDomainMask|e(ssThan(Comparison|OrEqualTo(Comparison|PredicateOperatorType)|PredicateOperatorType)|ft(Mouse(D(own(Mask)?|ragged(Mask)?)|Up(Mask)?)|T(ext(Movement|Alignment)|ab(sBezelBorder|StopType))|ArrowFunctionKey))|a(yout(RightToLeft|NotDone|CantFit|OutOfGlyphs|Done|LeftToRight)|ndscapeOrientation)|ABColorSpaceModel)|A(sc(iiWithDoubleByteEUCGlyphPacking|endingPageOrder)|n(y(Type|PredicateModifier|EventMask)|choredSearch|imation(Blocking|Nonblocking(Threaded)?|E(ffect(DisappearingItemDefault|Poof)|ase(In(Out)?|Out))|Linear)|dPredicateType)|t(Bottom|tachmentCharacter|omicWrite|Top)|SCIIStringEncoding|d(obe(GB1CharacterCollection|CNS1CharacterCollection|Japan(1CharacterCollection|2CharacterCollection)|Korea1CharacterCollection)|dTraitFontAction|minApplicationDirectory)|uto(saveOperation|Pagination)|pp(lication(SupportDirectory|D(irectory|e(fined(Mask)?|legateReply(Success|Cancel|Failure)|activatedEventType))|ActivatedEventType)|KitDefined(Mask)?)|l(ternateKeyMask|pha(ShiftKeyMask|NonpremultipliedBitmapFormat|FirstBitmapFormat)|ert(SecondButtonReturn|ThirdButtonReturn|OtherReturn|DefaultReturn|ErrorReturn|FirstButtonReturn|AlternateReturn)|l(ScrollerParts|DomainsMask|PredicateModifier|LibrariesDirectory|ApplicationsDirectory))|rgument(sWrongScriptError|EvaluationScriptError)|bove(Bottom|Top)|WTEventType))\b/
  end
  include "source.c"
  include "#bracketed_content"

  fragment :bracketed_content do
    rule 'meta.bracketed.objc' do
      from %r/\[/,
        0 => 'punctuation.section.scope.begin.objc'
      to %r/\]/,
        0 => 'punctuation.section.scope.end.objc'
      rule 'meta.function-call.predicate.objc' do
        from %r/(?=predicateWithFormat:)(?<=NSPredicate )(predicateWithFormat:)/,
          1 => 'support.function.any-method.objc',
          2 => 'punctuation.separator.arguments.objc'
        to %r/(?=\])/
        rule 'support.function.any-method.name-of-parameter.objc' do
          match %r/\bargument(Array|s)(:)/,
            1 => 'punctuation.separator.arguments.objc'
        end
        rule 'invalid.illegal.unknown-method.objc' do
          match %r/\b\w+(:)/,
            1 => 'punctuation.separator.arguments.objc'
        end
        rule 'string.quoted.double.objc' do
          from %r/@"/,
            0 => 'punctuation.definition.string.begin.objc'
          to %r/"/,
            0 => 'punctuation.definition.string.end.objc'
          rule 'keyword.operator.logical.predicate.cocoa' do
            match %r/\b(AND|OR|NOT|IN)\b/
          end
          rule 'constant.language.predicate.cocoa' do
            match %r/\b(ALL|ANY|SOME|NONE)\b/
          end
          rule 'constant.language.predicate.cocoa' do
            match %r/\b(NULL|NIL|SELF|TRUE|YES|FALSE|NO|FIRST|LAST|SIZE)\b/
          end
          rule 'keyword.operator.comparison.predicate.cocoa' do
            match %r/\b(MATCHES|CONTAINS|BEGINSWITH|ENDSWITH|BETWEEN)\b/
          end
          rule 'keyword.other.modifier.predicate.cocoa' do
            match %r/\bC(ASEINSENSITIVE|I)\b/
          end
          rule 'keyword.other.predicate.cocoa' do
            match %r/\b(ANYKEY|SUBQUERY|CAST|TRUEPREDICATE|FALSEPREDICATE)\b/
          end
          rule 'constant.character.escape.objc' do
            match %r/\\(\\|[abefnrtv'"?]|[0-3]\d{,2}|[4-7]\d?|x[a-zA-Z0-9]+)/
          end
          rule 'invalid.illegal.unknown-escape.objc' do
            match %r/\\./
          end
        end
        include "#special_variables"
        include "#c_functions"
        include "$base"
      end
      rule 'meta.function-call.objc' do
        from %r/(?=\w)(?<=[\w\])"] )(\w+(?:(:)|(?=\])))/,
          1 => 'support.function.any-method.objc',
          2 => 'punctuation.separator.arguments.objc'
        to %r/(?=\])/
        rule 'support.function.any-method.name-of-parameter.objc' do
          match %r/\b\w+(:)/,
            1 => 'punctuation.separator.arguments.objc'
        end
        include "#special_variables"
        include "#c_functions"
        include "$base"
      end
      include "#special_variables"
      include "#c_functions"
      include "$self"
    end
  end

  fragment :c_functions do
    rule do
      match %r/(\s*)\b(hypot(f|l)?|s(scanf|ystem|nprintf|ca(nf|lb(n(f|l)?|ln(f|l)?))|i(n(h(f|l)?|f|l)?|gn(al|bit))|tr(s(tr|pn)|nc(py|at|mp)|c(spn|hr|oll|py|at|mp)|to(imax|d|u(l(l)?|max)|k|f|l(d|l)?)|error|pbrk|ftime|len|rchr|xfrm)|printf|et(jmp|vbuf|locale|buf)|qrt(f|l)?|w(scanf|printf)|rand)|n(e(arbyint(f|l)?|xt(toward(f|l)?|after(f|l)?))|an(f|l)?)|c(s(in(h(f|l)?|f|l)?|qrt(f|l)?)|cos(h(f)?|f|l)?|imag(f|l)?|t(ime|an(h(f|l)?|f|l)?)|o(s(h(f|l)?|f|l)?|nj(f|l)?|pysign(f|l)?)|p(ow(f|l)?|roj(f|l)?)|e(il(f|l)?|xp(f|l)?)|l(o(ck|g(f|l)?)|earerr)|a(sin(h(f|l)?|f|l)?|cos(h(f|l)?|f|l)?|tan(h(f|l)?|f|l)?|lloc|rg(f|l)?|bs(f|l)?)|real(f|l)?|brt(f|l)?)|t(ime|o(upper|lower)|an(h(f|l)?|f|l)?|runc(f|l)?|gamma(f|l)?|mp(nam|file))|i(s(space|n(ormal|an)|cntrl|inf|digit|u(nordered|pper)|p(unct|rint)|finite|w(space|c(ntrl|type)|digit|upper|p(unct|rint)|lower|al(num|pha)|graph|xdigit|blank)|l(ower|ess(equal|greater)?)|al(num|pha)|gr(eater(equal)?|aph)|xdigit|blank)|logb(f|l)?|max(div|abs))|di(v|fftime)|_Exit|unget(c|wc)|p(ow(f|l)?|ut(s|c(har)?|wc(har)?)|error|rintf)|e(rf(c(f|l)?|f|l)?|x(it|p(2(f|l)?|f|l|m1(f|l)?)?))|v(s(scanf|nprintf|canf|printf|w(scanf|printf))|printf|f(scanf|printf|w(scanf|printf))|w(scanf|printf)|a_(start|copy|end|arg))|qsort|f(s(canf|e(tpos|ek))|close|tell|open|dim(f|l)?|p(classify|ut(s|c|w(s|c))|rintf)|e(holdexcept|set(e(nv|xceptflag)|round)|clearexcept|testexcept|of|updateenv|r(aiseexcept|ror)|get(e(nv|xceptflag)|round))|flush|w(scanf|ide|printf|rite)|loor(f|l)?|abs(f|l)?|get(s|c|pos|w(s|c))|re(open|e|ad|xp(f|l)?)|m(in(f|l)?|od(f|l)?|a(f|l|x(f|l)?)?))|l(d(iv|exp(f|l)?)|o(ngjmp|cal(time|econv)|g(1(p(f|l)?|0(f|l)?)|2(f|l)?|f|l|b(f|l)?)?)|abs|l(div|abs|r(int(f|l)?|ound(f|l)?))|r(int(f|l)?|ound(f|l)?)|gamma(f|l)?)|w(scanf|c(s(s(tr|pn)|nc(py|at|mp)|c(spn|hr|oll|py|at|mp)|to(imax|d|u(l(l)?|max)|k|f|l(d|l)?|mbs)|pbrk|ftime|len|r(chr|tombs)|xfrm)|to(b|mb)|rtomb)|printf|mem(set|c(hr|py|mp)|move))|a(s(sert|ctime|in(h(f|l)?|f|l)?)|cos(h(f|l)?|f|l)?|t(o(i|f|l(l)?)|exit|an(h(f|l)?|2(f|l)?|f|l)?)|b(s|ort))|g(et(s|c(har)?|env|wc(har)?)|mtime)|r(int(f|l)?|ound(f|l)?|e(name|alloc|wind|m(ove|quo(f|l)?|ainder(f|l)?))|a(nd|ise))|b(search|towc)|m(odf(f|l)?|em(set|c(hr|py|mp)|move)|ktime|alloc|b(s(init|towcs|rtowcs)|towc|len|r(towc|len))))\b/,
        1 => 'punctuation.whitespace.support.function.leading.c',
        2 => 'support.function.C99.c'
    end
    rule 'meta.function-call.c' do
      match %r/(?x) (?: (?= \s )  (?:(?<=else|new|return) | (?<!\w)) (\s+))?
                  (\b 
                    (?!(while|for|do|if|else|switch|catch|enumerate|return|r?iterate)\s*\()(?:(?!NS)[A-Za-z_][A-Za-z0-9_]*+\b | :: )++                  # actual name
                  )
                   \s*(\()/,
        1 => 'punctuation.whitespace.function-call.leading.c',
        2 => 'support.function.any-method.c',
        3 => 'punctuation.definition.parameters.c'
    end
  end

  fragment :comment do
    rule 'comment.block.objc' do
      from %r'/\*'
      to %r'\*/'
      both 0 => 'punctuation.definition.comment.objc'
    end
    rule do
      from %r'(^[ \t]+)?(?=//)',
        1 => 'punctuation.whitespace.comment.leading.objc'
      to %r/(?!\G)/
      rule 'comment.line.double-slash.objc' do
        from %r'//',
          0 => 'punctuation.definition.comment.objc'
        to %r/\n/
        rule 'punctuation.separator.continuation.objc' do
          match %r/(?>\\\s*\n)/
        end
      end
    end
  end

  fragment :disabled do
    rule do
      # eat nested preprocessor if(def)s
      from %r/^\s*#\s*if(n?def)?\b.*$/
      to %r/^\s*#\s*endif\b.*$/
      include "#disabled"
      include "#pragma-mark"
    end
  end

  fragment :implementation_innards do
    include "#preprocessor-rule-enabled-implementation"
    include "#preprocessor-rule-disabled-implementation"
    include "#preprocessor-rule-other-implementation"
    include "#property_directive"
    include "#special_variables"
    include "#method_super"
    include "$base"
  end

  fragment :interface_innards do
    include "#preprocessor-rule-enabled-interface"
    include "#preprocessor-rule-disabled-interface"
    include "#preprocessor-rule-other-interface"
    include "#properties"
    include "#protocol_list"
    include "#method"
    include "$base"
  end

  fragment :method do
    rule 'meta.function.objc' do
      from %r/^(-|\+)\s*/
      to %r/(?=\{|#)|;/
      rule 'meta.return-type.objc' do
        from %r/(\()/,
          1 => 'punctuation.definition.type.begin.objc'
        to %r/(\))\s*(\w+\b)/,
          1 => 'punctuation.definition.type.end.objc',
          2 => 'entity.name.function.objc'
        include "#protocol_list"
        include "#protocol_type_qualifier"
        include "$base"
      end
      rule 'entity.name.function.name-of-parameter.objc' do
        match %r/\b\w+(?=:)/
      end
      rule 'meta.argument-type.objc' do
        from %r/((:))\s*(\()/,
          1 => 'entity.name.function.name-of-parameter.objc',
          2 => 'punctuation.separator.arguments.objc',
          3 => 'punctuation.definition.type.begin.objc'
        to %r/(\))\s*(\w+\b)?/,
          1 => 'punctuation.definition.type.end.objc',
          2 => 'variable.parameter.function.objc'
        include "#protocol_list"
        include "#protocol_type_qualifier"
        include "$base"
      end
      include "#comment"
    end
  end

  fragment :method_super do
    rule 'meta.function-with-body.objc' do
      from %r/^(?=-|\+)/
      to %r/(?<=\})|(?=#)/
      include "#method"
      include "$base"
    end
  end

  fragment :"pragma-mark" do
    rule 'meta.section' do
      match %r/^\s*(#\s*(pragma\s+mark)\s+(.*))/,
        1 => 'meta.preprocessor.c',
        2 => 'keyword.control.import.pragma.c',
        3 => 'meta.toc-list.pragma-mark.c'
    end
  end

  fragment :"preprocessor-rule-disabled-implementation" do
    rule do
      from %r/^\s*(#(if)\s+(0)\b).*/
      to %r'^\s*(#\s*(endif)\b.*?(?:(?=(?://|/\*))|$))'
      both 1 => 'meta.preprocessor.c',
           2 => 'keyword.control.import.if.c',
           3 => 'constant.numeric.preprocessor.c'
      rule do
        from %r/^\s*(#\s*(else)\b)/
        to %r'(?=^\s*#\s*endif\b.*?(?:(?=(?://|/\*))|$))'
        both 1 => 'meta.preprocessor.c',
             2 => 'keyword.control.import.else.c'
        include "#interface_innards"
      end
      rule 'comment.block.preprocessor.if-branch.c' do
        from %r//
        to %r'(?=^\s*#\s*(else|endif)\b.*?(?:(?=(?://|/\*))|$))'
        include "#disabled"
        include "#pragma-mark"
      end
    end
  end

  fragment :"preprocessor-rule-disabled-interface" do
    rule do
      from %r/^\s*(#(if)\s+(0)\b).*/
      to %r'^\s*(#\s*(endif)\b.*?(?:(?=(?://|/\*))|$))'
      both 1 => 'meta.preprocessor.c',
           2 => 'keyword.control.import.if.c',
           3 => 'constant.numeric.preprocessor.c'
      rule do
        from %r/^\s*(#\s*(else)\b)/
        to %r'(?=^\s*#\s*endif\b.*?(?:(?=(?://|/\*))|$))'
        both 1 => 'meta.preprocessor.c',
             2 => 'keyword.control.import.else.c'
        include "#interface_innards"
      end
      rule 'comment.block.preprocessor.if-branch.c' do
        from %r//
        to %r'(?=^\s*#\s*(else|endif)\b.*?(?:(?=(?://|/\*))|$))'
        include "#disabled"
        include "#pragma-mark"
      end
    end
  end

  fragment :"preprocessor-rule-enabled-implementation" do
    rule do
      from %r/^\s*(#(if)\s+(0*1)\b)/
      to %r'^\s*(#\s*(endif)\b.*?(?:(?=(?://|/\*))|$))'
      both 1 => 'meta.preprocessor.c',
           2 => 'keyword.control.import.if.c',
           3 => 'constant.numeric.preprocessor.c'
      rule do
        content_scope "comment.block.preprocessor.else-branch.c"
        from %r/^\s*(#\s*(else)\b).*/
        to %r'(?=^\s*#\s*endif\b.*?(?:(?=(?://|/\*))|$))'
        both 1 => 'meta.preprocessor.c',
             2 => 'keyword.control.import.else.c'
        include "#disabled"
        include "#pragma-mark"
      end
      rule do
        from %r//
        to %r'(?=^\s*#\s*(else|endif)\b.*?(?:(?=(?://|/\*))|$))'
        include "#implementation_innards"
      end
    end
  end

  fragment :"preprocessor-rule-enabled-interface" do
    rule do
      from %r/^\s*(#(if)\s+(0*1)\b)/
      to %r'^\s*(#\s*(endif)\b.*?(?:(?=(?://|/\*))|$))'
      both 1 => 'meta.preprocessor.c',
           2 => 'keyword.control.import.if.c',
           3 => 'constant.numeric.preprocessor.c'
      rule do
        content_scope "comment.block.preprocessor.else-branch.c"
        from %r/^\s*(#\s*(else)\b).*/
        to %r'(?=^\s*#\s*endif\b.*?(?:(?=(?://|/\*))|$))'
        both 1 => 'meta.preprocessor.c',
             2 => 'keyword.control.import.else.c'
        include "#disabled"
        include "#pragma-mark"
      end
      rule do
        from %r//
        to %r'(?=^\s*#\s*(else|endif)\b.*?(?:(?=(?://|/\*))|$))'
        include "#interface_innards"
      end
    end
  end

  fragment :"preprocessor-rule-other-implementation" do
    rule do
      from %r'^\s*(#\s*(if(n?def)?)\b.*?(?:(?=(?://|/\*))|$))'
      to %r'^\s*(#\s*(endif)\b).*?(?:(?=(?://|/\*))|$)'
      both 1 => 'meta.preprocessor.c',
           2 => 'keyword.control.import.c'
      include "#implementation_innards"
    end
  end

  fragment :"preprocessor-rule-other-interface" do
    rule do
      from %r'^\s*(#\s*(if(n?def)?)\b.*?(?:(?=(?://|/\*))|$))'
      to %r'^\s*(#\s*(endif)\b).*?(?:(?=(?://|/\*))|$)'
      both 1 => 'meta.preprocessor.c',
           2 => 'keyword.control.import.c'
      include "#interface_innards"
    end
  end

  fragment :properties do
    rule 'meta.property-with-attributes.objc' do
      from %r/((@)property)\s*(\()/,
        1 => 'keyword.other.property.objc',
        2 => 'punctuation.definition.keyword.objc',
        3 => 'punctuation.section.scope.begin.objc'
      to %r/(\))/,
        1 => 'punctuation.section.scope.end.objc'
      rule 'keyword.other.property.attribute' do
        match %r/\b(getter|setter|readonly|readwrite|assign|retain|copy|nonatomic|strong|weak)\b/
      end
    end
    rule 'meta.property.objc' do
      match %r/((@)property)\b/,
        1 => 'keyword.other.property.objc',
        2 => 'punctuation.definition.keyword.objc'
    end
  end

  fragment :property_directive do
    rule 'keyword.other.property.directive.objc' do
      match %r/(@)(dynamic|synthesize)\b/,
        1 => 'punctuation.definition.keyword.objc'
    end
  end

  fragment :protocol_list do
    rule 'meta.protocol-list.objc' do
      from %r/(<)/,
        1 => 'punctuation.section.scope.begin.objc'
      to %r/(>)/,
        1 => 'punctuation.section.scope.end.objc'
      rule 'support.other.protocol.objc' do
        match %r/\bNS(GlyphStorage|M(utableCopying|enuItem)|C(hangeSpelling|o(ding|pying|lorPicking(Custom|Default)))|T(oolbarItemValidations|ext(Input|AttachmentCell))|I(nputServ(iceProvider|erMouseTracker)|gnoreMisspelledWords)|Obj(CTypeSerializationCallBack|ect)|D(ecimalNumberBehaviors|raggingInfo)|U(serInterfaceValidations|RL(HandleClient|DownloadDelegate|ProtocolClient|AuthenticationChallengeSender))|Validated(ToobarItem|UserInterfaceItem)|Locking)\b/
      end
    end
  end

  fragment :protocol_type_qualifier do
    rule 'storage.modifier.protocol.objc' do
      match %r/\b(in|out|inout|oneway|bycopy|byref)\b/
    end
  end

  fragment :special_variables do
    rule 'variable.other.selector.objc' do
      match %r/\b_cmd\b/
    end
    rule 'variable.language.objc' do
      match %r/\b(self|super)\b/
    end
  end
end
