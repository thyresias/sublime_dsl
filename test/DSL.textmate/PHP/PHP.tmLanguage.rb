# encoding: utf-8

language 'PHP' => 'text.html.php' do
  # TODO:
  # • Try to improve parameters list syntax – scope numbers, ‘=’, ‘,’ and possibly be intelligent about entity ordering
  # • Is meta.function-call the correct scope? I've added it to my theme but by default it's not highlighted
  file_types %w(php php3 php4 php5 phpt phtml aw ctp)
  first_line_match %r/^#!.*(?<!-)php[0-9]{0,1}\b/
  folding_start_marker %r'(/\*|\{\s*$|<<<HTML)'
  folding_stop_marker %r'(\*/|^\s*\}|^HTML;)'
  key_equivalent "^~P"  # TextMate only
  uuid "22986475-8CA5-11D9-AEDD-000D93C8BE28"  # TextMate only

  include "text.html.basic"

  fragment :"class-builtin" do
    rule 'support.class.builtin.php' do
      match %r/(?i)(\\)?\b(st(dClass|reamWrapper)|R(RD(Graph|Creator|Updater)|untimeException|e(sourceBundle|cursive(RegexIterator|Ca(chingIterator|llbackFilterIterator)|TreeIterator|Iterator(Iterator)?|DirectoryIterator|FilterIterator|ArrayIterator)|flect(ion(Method|Class|ZendExtension|Object|P(arameter|roperty)|Extension|Function(Abstract)?)?|or)|gexIterator)|angeException)|G(ender\Gender|lobIterator|magick(Draw|Pixel)?)|X(sltProcessor|ML(Reader|Writer)|SLTProcessor)|M(ysqlndUh(Connection|PreparedStatement)|ongo(Re(sultException|gex)|Grid(fsFile|FS(Cursor|File)?)|BinData|C(o(de|llection)|ursor(Exception)?|lient)|Timestamp|I(nt(32|64)|d)|D(B(Ref)?|ate)|Pool|Log)?|u(tex|ltipleIterator)|e(ssageFormatter|mcache(d)?))|Bad(MethodCallException|FunctionCallException)|tidy(Node)?|S(tackable|impleXML(Iterator|Element)|oap(Server|Header|Client|Param|Var|Fault)|NMP|CA(_(SoapProxy|LocalProxy))?|p(hinxClient|oofchecker|l(M(inHeap|axHeap)|S(tack|ubject)|Heap|T(ype|empFileObject)|Ob(server|jectStorage)|DoublyLinkedList|PriorityQueue|Enum|Queue|Fi(le(Info|Object)|xedArray)))|e(ssionHandler(Interface)?|ekableIterator|rializable)|DO_(Model_(ReflectionDataObject|Type|Property)|Sequence|D(ata(Object|Factory)|AS_(Relational|XML(_Document)?|Setting|ChangeSummary|Data(Object|Factory)))|Exception|List)|wish(Result(s)?|Search)?|VM(Model)?|QLite(Result|3(Result|Stmt)?|Database|Unbuffered)|AM(Message|Connection))|H(ttp(Re(sponse|quest(Pool)?)|Message|InflateStream|DeflateStream|QueryString)|aru(Image|Outline|D(oc|estination)|Page|Encoder|Font|Annotation))|Yaf_(R(oute(_(Re(write|gex)|Map|S(tatic|imple|upervar)|Interface)|r)|e(sponse_Abstract|quest_(Simple|Http|Abstract)|gistry))|Session|Con(troller_Abstract|fig_(Simple|Ini|Abstract))|Dispatcher|Plugin_Abstract|Exception|View_(Simple|Interface)|Loader|A(ction_Abstract|pplication))|N(o(RewindIterator|rmalizer)|umberFormatter)|C(o(nd|untable|llator)|a(chingIterator|llbackFilterIterator))|T(hread|okyoTyrant(Table|Iterator|Query)?|ra(nsliterator|versable))|I(n(tlDateFormatter|validArgumentException|finiteIterator)|terator(Iterator|Aggregate)?|magick(Draw|Pixel(Iterator)?)?)|php_user_filter|ZipArchive|O(CI-(Collection|Lob)|ut(erIterator|Of(RangeException|BoundsException))|verflowException)|D(irectory(Iterator)?|omainException|OM(XPath|N(ode(list)?|amedNodeMap)|C(haracterData|omment|dataSection)|Text|Implementation|Document(Fragment)?|ProcessingInstruction|E(ntityReference|lement)|Attr)|ate(Time(Zone)?|Interval|Period))|Un(derflowException|expectedValueException)|JsonSerializable|finfo|P(har(Data|FileInfo)?|DO(Statement)?|arentIterator)|E(v(S(tat|ignal)|Ch(ild|eck)|Timer|I(o|dle)|P(eriodic|repare)|Embed|Fork|Watcher|Loop)?|rrorException|xception|mptyIterator)|V(8Js(Exception)?|arnish(Stat|Log|Admin))|KTaglib_(MPEG_(File|AudioProperties)|Tag|ID3v2_(Tag|Frame|AttachedPictureFrame))|QuickHash(StringIntHash|Int(S(tringHash|et)|Hash))|Fil(terIterator|esystemIterator)|mysqli(_(stmt|driver|warning|result))?|W(orker|eak(Map|ref))|L(imitIterator|o(cale|gicException)|ua(Closure)?|engthException|apack)|A(MQP(C(hannel|onnection)|E(nvelope|xchange)|Queue)|ppendIterator|PCIterator|rray(Iterator|Object|Access)))\b/,
        1 => 'punctuation.separator.inheritance.php'
    end
  end

  fragment :"class-name" do
    rule do
      from %r/(?i)(?=\\?[a-z_0-9]+\\)/
      to %r/(?i)([a-z_][a-z_0-9]*)?(?=[^a-z0-9_\\])/,
        1 => 'support.class.php'
      include "#namespace"
    end
    include "#class-builtin"
    rule do
      from %r/(?=[\\a-zA-Z_])/
      to %r/(?i)([a-z_][a-z_0-9]*)?(?=[^a-z0-9_\\])/,
        1 => 'support.class.php'
      include "#namespace"
    end
  end

  fragment :comments do
    rule 'comment.block.documentation.phpdoc.php' do
      # This now only highlights a docblock if the first line contains only /**
      #                 - this is to stop highlighting everything as invalid when people do comment banners with /******** ...
      #                 - Now matches /**#@+ too - used for docblock templates: http://manual.phpdoc.org/HTMLframesConverter/default/phpDocumentor/tutorial_phpDocumentor.howto.pkg.html#basics.docblocktemplate
      # FIXME: (error) '#@' will be interpreted as interpolation: escape '#' as '\#'
      from %r'/\*\*(?:#@\+)?\s*$'
      to %r'\*/'
      both 0 => 'punctuation.definition.comment.php'
      include "#php_doc"
    end
    rule 'comment.block.php' do
      from %r'/\*'
      to %r'\*/'
      both 0 => 'punctuation.definition.comment.php'
    end
    rule do
      from %r'(^[ \t]+)?(?=//)',
        1 => 'punctuation.whitespace.comment.leading.php'
      to %r/(?!\G)/
      rule 'comment.line.double-slash.php' do
        from %r'//',
          0 => 'punctuation.definition.comment.php'
        to %r/\n|(?=\?>)/
      end
    end
    rule do
      from %r/(^[ \t]+)?(?=#)/,
        1 => 'punctuation.whitespace.comment.leading.php'
      to %r/(?!\G)/
      rule 'comment.line.number-sign.php' do
        from %r/#/,
          0 => 'punctuation.definition.comment.php'
        to %r/\n|(?=\?>)/
      end
    end
  end

  fragment :constants do
    rule do
      from %r/(?xi)(?=
                  (
                      (\\[a-z_][a-z_0-9]*\\[a-z_][a-z_0-9\\]*)|
                      ([a-z_][a-z_0-9]*\\[a-z_][a-z_0-9\\]*)
                  )
                  [^a-z_0-9\\])/
      to %r/(?i)([a-z_][a-z_0-9]*)?(?=[^a-z0-9_\\])/,
        1 => 'constant.other.php'
      include "#namespace"
    end
    rule do
      # FIXME: (error) invalid hex escape
      from %r/(?=\\?[a-zA-Z_\x{7f}-\x{ff}])/
      # FIXME: (error) invalid hex escape
      to %r/(?=[^\\a-zA-Z_\x{7f}-\x{ff}])/
      rule 'constant.language.php' do
        match %r/(?i)\b(TRUE|FALSE|NULL|__(FILE|DIR|FUNCTION|CLASS|METHOD|LINE|NAMESPACE)__|ON|OFF|YES|NO|NL|BR|TAB)\b/
      end
      rule 'support.constant.core.php' do
        match %r/(\\)?\b(STD(IN|OUT|ERR)|ZEND_(THREAD_SAFE|DEBUG_BUILD)|DEFAULT_INCLUDE_PATH|P(HP_(R(OUND_HALF_(ODD|DOWN|UP|EVEN)|ELEASE_VERSION)|M(INOR_VERSION|A(XPATHLEN|JOR_VERSION))|BINDIR|S(HLIB_SUFFIX|YSCONFDIR|API)|CONFIG_FILE_(SCAN_DIR|PATH)|INT_(MAX|SIZE)|ZTS|O(S|UTPUT_HANDLER_(START|CONT|END))|D(EBUG|ATADIR)|URL_(SCHEME|HOST|USER|P(ORT|A(SS|TH))|QUERY|FRAGMENT)|PREFIX|E(XT(RA_VERSION|ENSION_DIR)|OL)|VERSION(_ID)?|WINDOWS_(NT_(SERVER|DOMAIN_CONTROLLER|WORKSTATION)|VERSION_(M(INOR|AJOR)|BUILD|S(UITEMASK|P_M(INOR|AJOR))|P(RODUCTTYPE|LATFORM)))|L(IBDIR|OCALSTATEDIR))|EAR_(INSTALL_DIR|EXTENSION_DIR))|E_(RECOVERABLE_ERROR|STRICT|NOTICE|CO(RE_(ERROR|WARNING)|MPILE_(ERROR|WARNING))|DEPRECATED|USER_(NOTICE|DEPRECATED|ERROR|WARNING)|PARSE|ERROR|WARNING|ALL))\b/,
          1 => 'punctuation.separator.inheritance.php'
      end
      rule 'support.constant.std.php' do
        match %r/(\\)?\b(RADIXCHAR|GROUPING|M(_(1_PI|SQRT(1_2|2|3|PI)|2_(SQRTPI|PI)|PI(_(2|4))?|E(ULER)?|L(N(10|2|PI)|OG(10E|2E)))|ON_(GROUPING|1(1|2|0)?|7|2|8|THOUSANDS_SEP|3|DECIMAL_POINT|9|4|5|6))|S(TR_PAD_(RIGHT|BOTH|LEFT)|ORT_(REGULAR|STRING|NUMERIC|DESC|LOCALE_STRING|ASC)|EEK_(SET|CUR|END))|H(TML_(SPECIALCHARS|ENTITIES)|ASH_HMAC)|YES(STR|EXPR)|N(_(S(IGN_POSN|EP_BY_SPACE)|CS_PRECEDES)|O(STR|EXPR)|EGATIVE_SIGN|AN)|C(R(YPT_(MD5|BLOWFISH|S(HA(256|512)|TD_DES|ALT_LENGTH)|EXT_DES)|NCYSTR|EDITS_(G(ROUP|ENERAL)|MODULES|SAPI|DOCS|QA|FULLPAGE|ALL))|HAR_MAX|O(NNECTION_(NORMAL|TIMEOUT|ABORTED)|DESET|UNT_(RECURSIVE|NORMAL))|URRENCY_SYMBOL|ASE_(UPPER|LOWER))|__COMPILER_HALT_OFFSET__|T(HOUS(EP|ANDS_SEP)|_FMT(_AMPM)?)|IN(T_(CURR_SYMBOL|FRAC_DIGITS)|I_(S(YSTEM|CANNER_(RAW|NORMAL))|USER|PERDIR|ALL)|F(O_(GENERAL|MODULES|C(REDITS|ONFIGURATION)|ENVIRONMENT|VARIABLES|LICENSE|ALL))?)|D(_(T_FMT|FMT)|IRECTORY_SEPARATOR|ECIMAL_POINT|A(Y_(1|7|2|3|4|5|6)|TE_(R(SS|FC(1(123|036)|2822|8(22|50)|3339))|COOKIE|ISO8601|W3C|ATOM)))|UPLOAD_ERR_(NO_(TMP_DIR|FILE)|CANT_WRITE|INI_SIZE|OK|PARTIAL|EXTENSION|FORM_SIZE)|P(M_STR|_(S(IGN_POSN|EP_BY_SPACE)|CS_PRECEDES)|OSITIVE_SIGN|ATH(_SEPARATOR|INFO_(BASENAME|DIRNAME|EXTENSION|FILENAME)))|E(RA(_(YEAR|T_FMT|D_(T_FMT|FMT)))?|XTR_(REFS|SKIP|IF_EXISTS|OVERWRITE|PREFIX_(SAME|I(NVALID|F_EXISTS)|ALL))|NT_(NOQUOTES|COMPAT|IGNORE|QUOTES))|FRAC_DIGITS|L(C_(M(ONETARY|ESSAGES)|NUMERIC|C(TYPE|OLLATE)|TIME|ALL)|O(G_(MAIL|SYSLOG|N(O(TICE|WAIT)|DELAY|EWS)|C(R(IT|ON)|ONS)|INFO|ODELAY|D(EBUG|AEMON)|U(SER|UCP)|P(ID|ERROR)|E(RR|MERG)|KERN|WARNING|L(OCAL(1|7|2|3|4|5|0|6)|PR)|A(UTH(PRIV)?|LERT))|CK_(SH|NB|UN|EX)))|A(M_STR|B(MON_(1(1|2|0)?|7|2|8|3|9|4|5|6)|DAY_(1|7|2|3|4|5|6))|SSERT_(BAIL|CALLBACK|QUIET_EVAL|WARNING|ACTIVE)|LT_DIGITS))\b/,
          1 => 'punctuation.separator.inheritance.php'
      end
      rule 'support.constant.ext.php' do
        match %r/(\\)?\b(GLOB_(MARK|BRACE|NO(SORT|CHECK|ESCAPE)|ONLYDIR|ERR|AVAILABLE_FLAGS)|XML_(SAX_IMPL|HTML_DOCUMENT_NODE|N(OTATION_NODE|AMESPACE_DECL_NODE)|C(OMMENT_NODE|DATA_SECTION_NODE)|TEXT_NODE|OPTION_(SKIP_(TAGSTART|WHITE)|CASE_FOLDING|TARGET_ENCODING)|D(TD_NODE|OCUMENT_(NODE|TYPE_NODE|FRAG_NODE))|PI_NODE|E(RROR_(RECURSIVE_ENTITY_REF|MISPLACED_XML_PI|B(INARY_ENTITY_REF|AD_CHAR_REF)|SYNTAX|NO(NE|_(MEMORY|ELEMENTS))|TAG_MISMATCH|IN(CORRECT_ENCODING|VALID_TOKEN)|DUPLICATE_ATTRIBUTE|UN(CLOSED_(CDATA_SECTION|TOKEN)|DEFINED_ENTITY|KNOWN_ENCODING)|JUNK_AFTER_DOC_ELEMENT|PAR(TIAL_CHAR|AM_ENTITY_REF)|EXTERNAL_ENTITY_HANDLING|A(SYNC_ENTITY|TTRIBUTE_EXTERNAL_ENTITY_REF))|NTITY_(REF_NODE|NODE|DECL_NODE)|LEMENT_(NODE|DECL_NODE))|LOCAL_NAMESPACE|ATTRIBUTE_(N(MTOKEN(S)?|O(TATION|DE))|CDATA|ID(REF(S)?)?|DECL_NODE|EN(TITY|UMERATION)))|M(HASH_(RIPEMD(1(28|60)|256|320)|GOST|MD(2|4|5)|S(HA(1|2(24|56)|384|512)|NEFRU256)|HAVAL(1(28|92|60)|2(24|56))|CRC32(B)?|TIGER(1(28|60))?|WHIRLPOOL|ADLER32)|YSQL(_(BOTH|NUM|CLIENT_(SSL|COMPRESS|I(GNORE_SPACE|NTERACTIVE))|ASSOC)|I_(RE(PORT_(STRICT|INDEX|OFF|ERROR|ALL)|FRESH_(GRANT|MASTER|BACKUP_LOG|S(TATUS|LAVE)|HOSTS|T(HREADS|ABLES)|LOG)|AD_DEFAULT_(GROUP|FILE))|GROUP_FLAG|MULTIPLE_KEY_FLAG|B(INARY_FLAG|OTH|LOB_FLAG)|S(T(MT_ATTR_(CURSOR_TYPE|UPDATE_MAX_LENGTH|PREFETCH_ROWS)|ORE_RESULT)|E(RVER_QUERY_(NO_(GOOD_INDEX_USED|INDEX_USED)|WAS_SLOW)|T_(CHARSET_NAME|FLAG)))|N(O(_D(EFAULT_VALUE_FLAG|ATA)|T_NULL_FLAG)|UM(_FLAG)?)|C(URSOR_TYPE_(READ_ONLY|SCROLLABLE|NO_CURSOR|FOR_UPDATE)|LIENT_(SSL|NO_SCHEMA|COMPRESS|I(GNORE_SPACE|NTERACTIVE)|FOUND_ROWS))|T(YPE_(GEOMETRY|MEDIUM_BLOB|B(IT|LOB)|S(HORT|TRING|ET)|YEAR|N(ULL|EWD(ECIMAL|ATE))|CHAR|TI(ME(STAMP)?|NY(_BLOB)?)|INT(24|ERVAL)|D(OUBLE|ECIMAL|ATE(TIME)?)|ENUM|VAR_STRING|FLOAT|LONG(_BLOB|LONG)?)|IMESTAMP_FLAG)|INIT_COMMAND|ZEROFILL_FLAG|O(N_UPDATE_NOW_FLAG|PT_(NET_(READ_BUFFER_SIZE|CMD_BUFFER_SIZE)|CONNECT_TIMEOUT|INT_AND_FLOAT_NATIVE|LOCAL_INFILE))|D(EBUG_TRACE_ENABLED|ATA_TRUNCATED)|U(SE_RESULT|N(SIGNED_FLAG|IQUE_KEY_FLAG))|P(RI_KEY_FLAG|ART_KEY_FLAG)|ENUM_FLAG|A(S(SOC|YNC)|UTO_INCREMENT_FLAG)))|CRYPT_(R(C(2|6)|IJNDAEL_(1(28|92)|256)|AND)|GOST|XTEA|M(ODE_(STREAM|NOFB|C(BC|FB)|OFB|ECB)|ARS)|BLOWFISH(_COMPAT)?|S(ERPENT|KIPJACK|AFER(128|PLUS|64))|C(RYPT|AST_(128|256))|T(RIPLEDES|HREEWAY|WOFISH)|IDEA|3DES|DE(S|CRYPT|V_(RANDOM|URANDOM))|PANAMA|EN(CRYPT|IGNA)|WAKE|LOKI97|ARCFOUR(_IV)?))|S(TREAM_(REPORT_ERRORS|M(UST_SEEK|KDIR_RECURSIVE)|BUFFER_(NONE|FULL|LINE)|S(HUT_(RD(WR)?|WR)|OCK_(R(DM|AW)|S(TREAM|EQPACKET)|DGRAM)|ERVER_(BIND|LISTEN))|NOTIFY_(RE(SOLVE|DIRECTED)|MIME_TYPE_IS|SEVERITY_(INFO|ERR|WARN)|CO(MPLETED|NNECT)|PROGRESS|F(ILE_SIZE_IS|AILURE)|AUTH_RE(SULT|QUIRED))|C(RYPTO_METHOD_(SSLv(2(_(SERVER|CLIENT)|3_(SERVER|CLIENT))|3_(SERVER|CLIENT))|TLS_(SERVER|CLIENT))|LIENT_(CONNECT|PERSISTENT|ASYNC_CONNECT)|AST_(FOR_SELECT|AS_STREAM))|I(GNORE_URL|S_URL|PPROTO_(RAW|TCP|I(CMP|P)|UDP))|O(OB|PTION_(READ_(BUFFER|TIMEOUT)|BLOCKING|WRITE_BUFFER))|U(RL_STAT_(QUIET|LINK)|SE_PATH)|P(EEK|F_(INET(6)?|UNIX))|ENFORCE_SAFE_MODE|FILTER_(READ|WRITE|ALL))|UNFUNCS_RET_(STRING|TIMESTAMP|DOUBLE)|QLITE(_(R(OW|EADONLY)|MIS(MATCH|USE)|B(OTH|USY)|SCHEMA|N(O(MEM|T(FOUND|ADB)|LFS)|UM)|C(O(RRUPT|NSTRAINT)|ANTOPEN)|TOOBIG|I(NTER(RUPT|NAL)|OERR)|OK|DONE|P(ROTOCOL|ERM)|E(RROR|MPTY)|F(ORMAT|ULL)|LOCKED|A(BORT|SSOC|UTH))|3_(B(OTH|LOB)|NU(M|LL)|TEXT|INTEGER|OPEN_(READ(ONLY|WRITE)|CREATE)|FLOAT|ASSOC)))|CURL(M(SG_DONE|_(BAD_(HANDLE|EASY_HANDLE)|CALL_MULTI_PERFORM|INTERNAL_ERROR|O(UT_OF_MEMORY|K)))|SSH_AUTH_(HOST|NONE|DEFAULT|P(UBLICKEY|ASSWORD)|KEYBOARD)|CLOSEPOLICY_(SLOWEST|CALLBACK|OLDEST|LEAST_(RECENTLY_USED|TRAFFIC))|_(HTTP_VERSION_(1_(1|0)|NONE)|NETRC_(REQUIRED|IGNORED|OPTIONAL)|TIMECOND_(IF(MODSINCE|UNMODSINCE)|LASTMOD)|IPRESOLVE_(V(4|6)|WHATEVER)|VERSION_(SSL|IPV6|KERBEROS4|LIBZ))|INFO_(RE(DIRECT_(COUNT|TIME)|QUEST_SIZE)|S(SL_VERIFYRESULT|TARTTRANSFER_TIME|IZE_(DOWNLOAD|UPLOAD)|PEED_(DOWNLOAD|UPLOAD))|H(TTP_CODE|EADER_(SIZE|OUT))|NAMELOOKUP_TIME|C(ON(NECT_TIME|TENT_(TYPE|LENGTH_(DOWNLOAD|UPLOAD)))|ERTINFO)|TOTAL_TIME|PR(IVATE|ETRANSFER_TIME)|EFFECTIVE_URL|FILETIME)|OPT_(R(E(SUME_FROM|TURNTRANSFER|DIR_PROTOCOLS|FERER|AD(DATA|FUNCTION))|AN(GE|DOM_FILE))|MAX(REDIRS|CONNECTS)|B(INARYTRANSFER|UFFERSIZE)|S(S(H_(HOST_PUBLIC_KEY_MD5|P(RIVATE_KEYFILE|UBLIC_KEYFILE)|AUTH_TYPES)|L(CERT(TYPE|PASSWD)?|_(CIPHER_LIST|VERIFY(HOST|PEER))|ENGINE(_DEFAULT)?|VERSION|KEY(TYPE|PASSWD)?))|TDERR)|H(TTP(GET|HEADER|200ALIASES|_VERSION|PROXYTUNNEL|AUTH)|EADER(FUNCTION)?)|N(O(BODY|SIGNAL|PROGRESS)|ETRC)|C(RLF|O(NNECTTIMEOUT(_MS)?|OKIE(SESSION|JAR|FILE)?)|USTOMREQUEST|ERTINFO|LOSEPOLICY|A(INFO|PATH))|T(RANSFERTEXT|CP_NODELAY|IME(CONDITION|OUT(_MS)?|VALUE))|I(N(TERFACE|FILE(SIZE)?)|PRESOLVE)|DNS_(CACHE_TIMEOUT|USE_GLOBAL_CACHE)|U(RL|SER(PWD|AGENT)|NRESTRICTED_AUTH|PLOAD)|P(R(IVATE|O(GRESSFUNCTION|XY(TYPE|USERPWD|PORT|AUTH)?|TOCOLS))|O(RT|ST(REDIR|QUOTE|FIELDS)?)|UT)|E(GDSOCKET|NCODING)|VERBOSE|K(RB4LEVEL|EYPASSWD)|QUOTE|F(RESH_CONNECT|TP(SSLAUTH|_(S(SL|KIP_PASV_IP)|CREATE_MISSING_DIRS|USE_EP(RT|SV)|FILEMETHOD)|PORT|LISTONLY|APPEND)|ILE(TIME)?|O(RBID_REUSE|LLOWLOCATION)|AILONERROR)|WRITE(HEADER|FUNCTION)|LOW_SPEED_(TIME|LIMIT)|AUTOREFERER)|PRO(XY_(SOCKS(4|5)|HTTP)|TO_(S(CP|FTP)|HTTP(S)?|T(ELNET|FTP)|DICT|F(TP(S)?|ILE)|LDAP(S)?|ALL))|E_(RE(CV_ERROR|AD_ERROR)|GOT_NOTHING|MALFORMAT_USER|BAD_(C(ONTENT_ENCODING|ALLING_ORDER)|PASSWORD_ENTERED|FUNCTION_ARGUMENT)|S(S(H|L_(C(IPHER|ONNECT_ERROR|ERTPROBLEM|ACERT)|PEER_CERTIFICATE|ENGINE_(SETFAILED|NOTFOUND)))|HARE_IN_USE|END_ERROR)|HTTP_(RANGE_ERROR|NOT_FOUND|PO(RT_FAILED|ST_ERROR))|COULDNT_(RESOLVE_(HOST|PROXY)|CONNECT)|T(OO_MANY_REDIRECTS|ELNET_OPTION_SYNTAX)|O(BSOLETE|UT_OF_MEMORY|PERATION_TIMEOUTED|K)|U(RL_MALFORMAT(_USER)?|N(SUPPORTED_PROTOCOL|KNOWN_TELNET_OPTION))|PARTIAL_FILE|F(TP_(BAD_DOWNLOAD_RESUME|SSL_FAILED|C(OULDNT_(RETR_FILE|GET_SIZE|S(TOR_FILE|ET_(BINARY|ASCII))|USE_REST)|ANT_(RECONNECT|GET_HOST))|USER_PASSWORD_INCORRECT|PORT_FAILED|QUOTE_ERROR|W(RITE_ERROR|EIRD_(SERVER_REPLY|227_FORMAT|USER_REPLY|PAS(S_REPLY|V_REPLY)))|ACCESS_DENIED)|ILE(SIZE_EXCEEDED|_COULDNT_READ_FILE)|UNCTION_NOT_FOUND|AILED_INIT)|WRITE_ERROR|L(IBRARY_NOT_FOUND|DAP_(SEARCH_FAILED|CANNOT_BIND|INVALID_URL))|ABORTED_BY_CALLBACK)|VERSION_NOW|FTP(METHOD_(MULTICWD|SINGLECWD|NOCWD)|SSL_(NONE|CONTROL|TRY|ALL)|AUTH_(SSL|TLS|DEFAULT))|AUTH_(GSSNEGOTIATE|BASIC|NTLM|DIGEST|ANY(SAFE)?))|I(MAGETYPE_(GIF|XBM|BMP|SWF|COUNT|TIFF_(MM|II)|I(CO|FF)|UNKNOWN|J(B2|P(X|2|C|EG(2000)?))|P(SD|NG)|WBMP)|NPUT_(REQUEST|GET|SE(RVER|SSION)|COOKIE|POST|ENV)|CONV_(MIME_DECODE_(STRICT|CONTINUE_ON_ERROR)|IMPL|VERSION))|D(NS_(MX|S(RV|OA)|HINFO|N(S|APTR)|CNAME|TXT|PTR|A(NY|LL|AAA|6)?)|OM(STRING_SIZE_ERR|_(SYNTAX_ERR|HIERARCHY_REQUEST_ERR|N(O(_(MODIFICATION_ALLOWED_ERR|DATA_ALLOWED_ERR)|T_(SUPPORTED_ERR|FOUND_ERR))|AMESPACE_ERR)|IN(DEX_SIZE_ERR|USE_ATTRIBUTE_ERR|VALID_(MODIFICATION_ERR|STATE_ERR|CHARACTER_ERR|ACCESS_ERR))|PHP_ERR|VALIDATION_ERR|WRONG_DOCUMENT_ERR)))|JSON_(HEX_(TAG|QUOT|A(MP|POS))|NUMERIC_CHECK|ERROR_(S(YNTAX|TATE_MISMATCH)|NONE|CTRL_CHAR|DEPTH|UTF8)|FORCE_OBJECT)|P(REG_(RECURSION_LIMIT_ERROR|GREP_INVERT|BA(CKTRACK_LIMIT_ERROR|D_UTF8_(OFFSET_ERROR|ERROR))|S(PLIT_(NO_EMPTY|OFFSET_CAPTURE|DELIM_CAPTURE)|ET_ORDER)|NO_ERROR|INTERNAL_ERROR|OFFSET_CAPTURE|PATTERN_ORDER)|SFS_(PASS_ON|ERR_FATAL|F(EED_ME|LAG_(NORMAL|FLUSH_(CLOSE|INC))))|CRE_VERSION|OSIX_(R_OK|X_OK|S_IF(REG|BLK|SOCK|CHR|IFO)|F_OK|W_OK))|F(NM_(NOESCAPE|CASEFOLD|P(ERIOD|ATHNAME))|IL(TER_(REQUIRE_(SCALAR|ARRAY)|SANITIZE_(MAGIC_QUOTES|S(TRI(NG|PPED)|PECIAL_CHARS)|NUMBER_(INT|FLOAT)|URL|E(MAIL|NCODED)|FULL_SPECIAL_CHARS)|NULL_ON_FAILURE|CALLBACK|DEFAULT|UNSAFE_RAW|VALIDATE_(REGEXP|BOOLEAN|I(NT|P)|URL|EMAIL|FLOAT)|F(ORCE_ARRAY|LAG_(S(CHEME_REQUIRED|TRIP_(BACKTICK|HIGH|LOW))|HOST_REQUIRED|NO(NE|_(RES_RANGE|PRIV_RANGE|ENCODE_QUOTES))|IPV(4|6)|PATH_REQUIRED|E(MPTY_STRING_NULL|NCODE_(HIGH|LOW|AMP))|QUERY_REQUIRED|ALLOW_(SCIENTIFIC|HEX|THOUSAND|OCTAL|FRACTION))))|E(_(BINARY|SKIP_EMPTY_LINES|NO_DEFAULT_CONTEXT|TEXT|IGNORE_NEW_LINES|USE_INCLUDE_PATH|APPEND)|INFO_(RAW|MIME(_(TYPE|ENCODING))?|SYMLINK|NONE|CONTINUE|DEVICES|PRESERVE_ATIME)))|ORCE_(GZIP|DEFLATE))|LIBXML_(XINCLUDE|N(SCLEAN|O(XMLDECL|BLANKS|NET|CDATA|E(RROR|MPTYTAG|NT)|WARNING))|COMPACT|D(TD(VALID|LOAD|ATTR)|OTTED_VERSION)|PARSEHUGE|ERR_(NONE|ERROR|FATAL|WARNING)|VERSION|LOADED_VERSION))\b/,
          1 => 'punctuation.separator.inheritance.php'
      end
      rule 'support.constant.parser-token.php' do
        match %r/(\\)?\bT_(RE(TURN|QUIRE(_ONCE)?)|G(OTO|LOBAL)|XOR_EQUAL|M(INUS_EQUAL|OD_EQUAL|UL_EQUAL|ETHOD_C|L_COMMENT)|B(REAK|OOL(_CAST|EAN_(OR|AND))|AD_CHARACTER)|S(R(_EQUAL)?|T(RING(_(CAST|VARNAME))?|A(RT_HEREDOC|TIC))|WITCH|L(_EQUAL)?)|HALT_COMPILER|N(S_(SEPARATOR|C)|UM_STRING|EW|AMESPACE)|C(HARACTER|O(MMENT|N(ST(ANT_ENCAPSED_STRING)?|CAT_EQUAL|TINUE))|URLY_OPEN|L(O(SE_TAG|NE)|ASS(_C)?)|A(SE|TCH))|T(RY|HROW)|I(MPLEMENTS|S(SET|_(GREATER_OR_EQUAL|SMALLER_OR_EQUAL|NOT_(IDENTICAL|EQUAL)|IDENTICAL|EQUAL))|N(STANCEOF|C(LUDE(_ONCE)?)?|T(_CAST|ERFACE)|LINE_HTML)|F)|O(R_EQUAL|BJECT_(CAST|OPERATOR)|PEN_TAG(_WITH_ECHO)?|LD_FUNCTION)|D(NUMBER|I(R|V_EQUAL)|O(C_COMMENT|UBLE_(C(OLON|AST)|ARROW)|LLAR_OPEN_CURLY_BRACES)?|E(C(LARE)?|FAULT))|U(SE|NSET(_CAST)?)|P(R(I(NT|VATE)|OTECTED)|UBLIC|LUS_EQUAL|AAMAYIM_NEKUDOTAYIM)|E(X(TENDS|IT)|MPTY|N(CAPSED_AND_WHITESPACE|D(SWITCH|_HEREDOC|IF|DECLARE|FOR(EACH)?|WHILE))|CHO|VAL|LSE(IF)?)|VAR(IABLE)?|F(I(NAL|LE)|OR(EACH)?|UNC(_C|TION))|WHI(TESPACE|LE)|L(NUMBER|I(ST|NE)|OGICAL_(XOR|OR|AND))|A(RRAY(_CAST)?|BSTRACT|S|ND_EQUAL))\b/,
          1 => 'punctuation.separator.inheritance.php'
      end
      rule 'constant.other.php' do
        # In PHP, any identifier which is not a variable is taken to be a constant.
        #                 However, if there is no constant defined with the given name then a notice
        #                 is generated and the constant is assumed to have the value of its name.
        # FIXME: (error) invalid hex escape
        match %r/[a-zA-Z_\x{7f}-\x{ff}][a-zA-Z0-9_\x{7f}-\x{ff}]*/
      end
    end
  end

  fragment :"function-arguments" do
    include "#comments"
    rule 'meta.function.argument.array.php' do
      content_scope "meta.array.php"
      # FIXME: (error) invalid hex escape
      from %r/(?x)
              \s*(array) # Typehint
              \s*(&)?           # Reference
              \s*((\$+)[a-zA-Z_\x{7f}-\x{ff}][a-zA-Z0-9_\x{7f}-\x{ff}]*) # The variable name
              \s*(=)  # A default value
              \s*(array)\s*(\()
              /,
        1 => 'storage.type.php',
        2 => 'storage.modifier.reference.php',
        3 => 'variable.other.php',
        4 => 'punctuation.definition.variable.php',
        5 => 'keyword.operator.assignment.php',
        6 => 'support.function.construct.php',
        7 => 'punctuation.definition.array.begin.php'
      to %r/\)/,
        0 => 'punctuation.definition.array.end.php'
      include "#comments"
      include "#strings"
      include "#numbers"
    end
    rule 'meta.function.argument.array.php' do
      # FIXME: (error) invalid hex escape
      match %r'(?xi)
              \s*(array) # Typehint
              \s*(&)?           # Reference
              \s*((\$+)[a-z_\x{7f}-\x{ff}][a-z0-9_\x{7f}-\x{ff}]*) # The variable name
              (?:
                \s*(?:(=)\s*(?:(null)|((?:\S*?\(\))|(?:\S*?))))  # A default value
              )?
              \s*(?=,|\)|/[/*]|\#|$) # A closing parentheses (end of argument list) or a comma or a comment
              ',
        1 => 'storage.type.php',
        2 => 'storage.modifier.reference.php',
        3 => 'variable.other.php',
        4 => 'punctuation.definition.variable.php',
        5 => 'keyword.operator.assignment.php',
        6 => 'constant.language.php',
        7 => 'invalid.illegal.non-null-typehinted.php'
    end
    rule 'meta.function.argument.typehinted.php' do
      from %r/(?i)(?=[a-z_0-9\\]*[a-z_][a-z_0-9]*\s*&?\s*\$)/
      to %r'(?=,|\)|/[/*]|\#|$)'
      include "#class-name"
      rule do
        # FIXME: (error) invalid hex escape
        match %r'(?xi)
                      \s*([a-z_][a-z_0-9]*)? # Typehinted class name
                      \s*(&)?           # Reference
                      \s*((\$+)[a-z_\x{7f}-\x{ff}][a-z0-9_\x{7f}-\x{ff}]*) # The variable name
                      (?:
                        \s*(?:(=)\s*(?:(null)|((?:\S*?\(\))|(?:\S*?))))  # A default value
                      )?
                      \s*(?=,|\)|/[/*]|\#|$) # A closing parentheses (end of argument list) or a comma
                  ',
          1 => 'support.class.php',
          2 => 'storage.modifier.reference.php',
          3 => 'variable.other.php',
          4 => 'punctuation.definition.variable.php',
          5 => 'keyword.operator.assignment.php',
          6 => 'constant.language.php',
          7 => 'invalid.illegal.non-null-typehinted.php'
      end
    end
    rule 'meta.function.argument.no-default.php' do
      # FIXME: (error) invalid hex escape
      match %r'(?:\s*(&))?\s*((\$+)[a-zA-Z_\x{7f}-\x{ff}][a-zA-Z0-9_\x{7f}-\x{ff}]*)\s*(?=,|\)|/[/*]|\#)',
        1 => 'storage.modifier.reference.php',
        2 => 'variable.other.php',
        3 => 'punctuation.definition.variable.php'
    end
    rule 'meta.function.argument.default.php' do
      # FIXME: (error) invalid hex escape
      from %r/(?:\s*(&))?\s*((\$+)[a-zA-Z_\x{7f}-\x{ff}][a-zA-Z0-9_\x{7f}-\x{ff}]*)(?:\s*(=)\s*)\s*/
      to %r'(?=,|\)|/[/*]|\#)'
      both 1 => 'storage.modifier.reference.php',
           2 => 'variable.other.php',
           3 => 'punctuation.definition.variable.php',
           4 => 'keyword.operator.assignment.php'
      include "#parameter-default-types"
    end
  end

  fragment :"function-call" do
    rule do
      # Functions in a user-defined namespace (overrides any built-ins)
      from %r/(?i)(?=\\?[a-z_0-9\\]+\\[a-z_][a-z0-9_]*\s*\()/
      to %r/(?=\s*\()/
      include "#user-function-call"
    end
    rule 'support.function.construct.php' do
      match %r/(?i)\b(print|echo)\b/
    end
    rule do
      # Root namespace function calls (built-in or user)
      from %r/(?i)(\\)?(?=\b[a-z_][a-z_0-9]*\s*\()/,
        1 => 'punctuation.separator.inheritance.php'
      to %r/(?=\s*\()/
      rule 'support.function.construct.php' do
        match %r/(?i)\b(isset|unset|e(val|mpty)|list)(?=\s*\()/
      end
      include "#support"
      include "#user-function-call"
    end
  end

  fragment :heredoc do
    rule 'string.unquoted.heredoc.php' do
      from %r/(?=<<<\s*("?)([a-zA-Z_]+[a-zA-Z0-9_]*)(\1)\s*$)/
      to %r/(?!\G)/
      include "#heredoc_interior"
    end
    rule 'string.unquoted.heredoc.nowdoc.php' do
      from %r/(?=<<<\s*('?)([a-zA-Z_]+[a-zA-Z0-9_]*)(\1)\s*$)/
      to %r/(?!\G)/
      include "#heredoc_interior"
    end
  end

  fragment :heredoc_interior do
    rule 'meta.embedded.html' do
      content_scope "text.html"
      from %r/(<<<)\s*(['"]?)(HTML)(\2)\s*$\n?/,
        0 => 'punctuation.section.embedded.begin.php',
        1 => 'punctuation.definition.string.php',
        3 => 'keyword.operator.heredoc.php'
      to %r/^(§3)\b/,
        0 => 'punctuation.section.embedded.end.php',
        1 => 'keyword.operator.heredoc.php'
      include "text.html.basic"
    end
    rule 'meta.embedded.xml' do
      content_scope "text.xml"
      from %r/(<<<)\s*(['"]?)(XML)(\2)\s*$\n?/,
        0 => 'punctuation.section.embedded.begin.php',
        1 => 'punctuation.definition.string.php',
        3 => 'keyword.operator.heredoc.php'
      to %r/^(§3)\b/,
        0 => 'punctuation.section.embedded.end.php',
        1 => 'keyword.operator.heredoc.php'
      include "text.xml"
    end
    rule 'meta.embedded.sql' do
      content_scope "source.sql"
      from %r/(<<<)\s*(['"]?)(SQL)(\2)\s*$\n?/,
        0 => 'punctuation.section.embedded.begin.php',
        1 => 'punctuation.definition.string.php',
        3 => 'keyword.operator.heredoc.php'
      to %r/^(§3)\b/,
        0 => 'punctuation.section.embedded.end.php',
        1 => 'keyword.operator.heredoc.php'
      include "source.sql"
    end
    rule 'meta.embedded.js' do
      content_scope "source.js"
      from %r/(<<<)\s*(['"]?)(JAVASCRIPT)(\2)\s*$\n?/,
        0 => 'punctuation.section.embedded.begin.php',
        1 => 'punctuation.definition.string.php',
        3 => 'keyword.operator.heredoc.php'
      to %r/^(§3)\b/,
        0 => 'punctuation.section.embedded.end.php',
        1 => 'keyword.operator.heredoc.php'
      include "source.js"
    end
    rule 'meta.embedded.json' do
      content_scope "source.json"
      from %r/(<<<)\s*(['"]?)(JSON)(\2)\s*$\n?/,
        0 => 'punctuation.section.embedded.begin.php',
        1 => 'punctuation.definition.string.php',
        3 => 'keyword.operator.heredoc.php'
      to %r/^(§3)\b/,
        0 => 'punctuation.section.embedded.end.php',
        1 => 'keyword.operator.heredoc.php'
      include "source.json"
    end
    rule 'meta.embedded.css' do
      content_scope "source.css"
      from %r/(<<<)\s*(['"]?)(CSS)(\2)\s*$\n?/,
        0 => 'punctuation.section.embedded.begin.php',
        1 => 'punctuation.definition.string.php',
        3 => 'keyword.operator.heredoc.php'
      to %r/^(§3)\b/,
        0 => 'punctuation.section.embedded.end.php',
        1 => 'keyword.operator.heredoc.php'
      include "source.css"
    end
    rule do
      from %r/(<<<)\s*(['"]?)([a-zA-Z_]+[a-zA-Z0-9_]*)(\2)/,
        1 => 'punctuation.definition.string.php',
        3 => 'keyword.operator.heredoc.php'
      to %r/^(§3)\b/,
        1 => 'keyword.operator.heredoc.php'
    end
  end

  fragment :instantiation do
    rule do
      from %r/(?i)(new)\s+/,
        1 => 'keyword.other.new.php'
      to %r/(?i)(?=[^$a-z0-9_\\])/
      rule 'storage.type.php' do
        match %r/(parent|static|self)(?=[^a-z0-9_])/
      end
      include "#class-name"
      include "#variable-name"
    end
  end

  fragment :interpolation do
    # http://www.php.net/manual/en/language.types.string.php#language.types.string.parsing
    rule 'constant.numeric.octal.php' do
      match %r/\\[0-7]{1,3}/
    end
    rule 'constant.numeric.hex.php' do
      match %r/\\x[0-9A-Fa-f]{1,2}/
    end
    rule 'constant.character.escape.php' do
      match %r/\\[nrt\\\$\"]/
    end
    rule do
      from %r/(\{)(?=\$.*?\})/
      to %r/(\})/
      both 1 => 'punctuation.definition.variable.php'
      include "#language"
    end
    include "#variable-name"
  end

  fragment :"invoke-call" do
    rule 'meta.function-call.invoke.php' do
      match %r/(?i)(\$+)([a-z_][a-z_0-9]*)(?=\s*\()/,
        1 => 'punctuation.definition.variable.php',
        2 => 'variable.other.php'
    end
  end

  fragment :language do
    include "#comments"
    rule 'punctuation.section.scope.begin.php' do
      match %r/\{/
    end
    rule 'punctuation.section.scope.end.php' do
      match %r/\}/
    end
    rule 'meta.interface.php' do
      from %r/(?i)^\s*(interface)\s+([a-z0-9_]+)\s*(extends)?\s*/,
        1 => 'storage.type.interface.php',
        2 => 'entity.name.type.interface.php',
        3 => 'storage.modifier.extends.php'
      to %r/([a-zA-Z0-9_]+)?\s*(?:(?=\{)|$)/,
        1 => 'entity.other.inherited-class.php'
      include "#namespace"
    end
    rule 'meta.namespace.php' do
      content_scope "entity.name.type.namespace.php"
      from %r'(?i)^\s*(namespace)\b\s+(?=([a-z0-9_\\]+\s*($|[;{]|(\/[\/*])))|$)',
        1 => 'keyword.other.namespace.php'
      to %r/(?i)(?=\s*$|[^a-z0-9_\\])/
      rule 'punctuation.separator.inheritance.php' do
        match %r/\\/
      end
    end
    rule 'meta.use.php' do
      from %r/(?i)\s*\b(use)\s+/,
        1 => 'keyword.other.use.php'
      to %r/(?=;|(?:^\s*$))/
      include "#comments"
      rule do
        from %r/(?i)\s*(?=[a-z_0-9\\])/
        to %r/(?xi)(?:
                          (?:\s*(as)\b\s*([a-z_0-9]*)\s*(?=,|;|$))
                          |(?=,|;|$)
                      )/,
          1 => 'keyword.other.use-as.php',
          2 => 'support.other.namespace.use-as.php'
        include "#class-builtin"
        rule 'support.other.namespace.use.php' do
          from %r/(?i)\s*(?=[\\a-z_0-9])/
          to %r/$|(?=[\s,;])/
          rule 'punctuation.separator.inheritance.php' do
            match %r/\\/
          end
        end
      end
      rule do
        match %r/\s*,\s*/
      end
    end
    rule 'meta.class.php' do
      from %r/(?i)^\s*(abstract|final)?\s*(class)\s+([a-z0-9_]+)\s*/,
        1 => 'storage.modifier.abstract.php',
        2 => 'storage.type.class.php',
        3 => 'entity.name.type.class.php'
      to %r/(?=[;{])/
      include "#comments"
      rule do
        content_scope "meta.other.inherited-class.php"
        from %r/(?i)(extends)\s+/,
          1 => 'storage.modifier.extends.php'
        to %r/(?i)(?=[^a-z_0-9\\])/
        rule do
          from %r/(?i)(?=\\?[a-z_0-9]+\\)/
          to %r/(?i)([a-z_][a-z_0-9]*)?(?=[^a-z0-9_\\])/,
            1 => 'entity.other.inherited-class.php'
          include "#namespace"
        end
        include "#class-builtin"
        include "#namespace"
        rule 'entity.other.inherited-class.php' do
          match %r/(?i)[a-z_][a-z_0-9]*/
        end
      end
      rule do
        from %r/(?i)(implements)\s+/,
          1 => 'storage.modifier.implements.php'
        to %r/(?i)(?=[;{])/
        include "#comments"
        rule do
          content_scope "meta.other.inherited-class.php"
          from %r/(?i)(?=[a-z0-9_\\]+)/
          to %r/(?i)(?:\s*(?:,|(?=[^a-z0-9_\\\s]))\s*)/
          rule do
            from %r/(?i)(?=\\?[a-z_0-9]+\\)/
            to %r/(?i)([a-z_][a-z_0-9]*)?(?=[^a-z0-9_\\])/,
              1 => 'entity.other.inherited-class.php'
            include "#namespace"
          end
          include "#class-builtin"
          include "#namespace"
          rule 'entity.other.inherited-class.php' do
            match %r/(?i)[a-z_][a-z_0-9]*/
          end
        end
      end
    end
    rule do
      match %r/\s*\b((break|c(ase|ontinue)|d(e(clare|fault)|ie|o)|e(lse(if)?|nd(declare|for(each)?|if|switch|while)|xit)|for(each)?|if|return|switch|use|while))\b/,
        1 => 'keyword.control.php'
    end
    rule 'meta.include.php' do
      from %r/(?i)\b((?:require|include)(?:_once)?)\b\s*/,
        1 => 'keyword.control.import.include.php'
      to %r/(?=\s|;|$)/
      include "#language"
    end
    rule 'meta.catch.php' do
      from %r/\b(catch)\b\s*\(\s*/,
        1 => 'keyword.control.exception.catch.php'
      # FIXME: (error) invalid hex escape
      to %r/([A-Za-z_][A-Za-z_0-9]*)\s*((\$+)[a-zA-Z_\x{7f}-\x{ff}][a-zA-Z0-9_\x{7f}-\x{ff}]*)\s*\)/,
        1 => 'support.class.exception.php',
        2 => 'variable.other.php',
        3 => 'punctuation.definition.variable.php'
      include "#namespace"
    end
    rule 'keyword.control.exception.php' do
      match %r/\b(catch|try|throw|exception)\b/
    end
    rule 'meta.function.closure.php' do
      from %r/(?i)\b(function)\s*(&\s*)?(?=\()/,
        1 => 'storage.type.function.php',
        2 => 'storage.modifier.reference.php'
      to %r/\{/
      rule do
        content_scope "meta.function.arguments.php"
        from %r/(\()/,
          1 => 'punctuation.definition.parameters.begin.php'
        to %r/(\))/,
          1 => 'punctuation.definition.parameters.end.php'
        include "#function-arguments"
      end
      rule do
        from %r/(?i)(use)\s*(\()/,
          1 => 'keyword.other.function.use.php',
          2 => 'punctuation.definition.parameters.begin.php'
        to %r/(\))/,
          1 => 'punctuation.definition.parameters.end.php'
        rule 'meta.function.closure.use.php' do
          # FIXME: (error) invalid hex escape
          match %r/(?:\s*(&))?\s*((\$+)[a-zA-Z_\x{7f}-\x{ff}][a-zA-Z0-9_\x{7f}-\x{ff}]*)\s*(?=,|\))/,
            1 => 'storage.modifier.reference.php',
            2 => 'variable.other.php',
            3 => 'punctuation.definition.variable.php'
        end
      end
    end
    rule 'meta.function.php' do
      content_scope "meta.function.arguments.php"
      from %r/(?x)\s*
              ((?:(?:final|abstract|public|private|protected|static)\s+)*)
                (function)
                (?:\s+|(\s*&\s*))
                (?:
                    (__(?:call|construct|destruct|get|set|isset|unset|tostring|clone|set_state|sleep|wakeup|autoload|invoke|callStatic))
                    |([a-zA-Z0-9_]+)
                )
                \s*
                (\()/,
        1 => 'storage.modifier.php',
        2 => 'storage.type.function.php',
        3 => 'storage.modifier.reference.php',
        4 => 'support.function.magic.php',
        5 => 'entity.name.function.php',
        6 => 'punctuation.definition.parameters.begin.php'
      to %r/(\))/,
        1 => 'punctuation.definition.parameters.end.php'
      include "#function-arguments"
    end
    include "#invoke-call"
    rule do
      # FIXME: (error) invalid hex escape
      from %r/(?xi)\s*(?=
                [a-z_0-9$\\]+(::)
                        (?:
                    ([a-z_][a-z_0-9]*)\s*\(
                    |
                    ((\$+)[a-z_\x{7f}-\x{ff}][a-z0-9_\x{7f}-\x{ff}]*)
                    |
                    ([a-z_\x{7f}-\x{ff}][a-z0-9_\x{7f}-\x{ff}]*)
                )?
            )/
      # FIXME: (error) invalid hex escape
      to %r/(?x)(::)
                        (?:
                    ([A-Za-z_][A-Za-z_0-9]*)\s*\(
                    |
                    ((\$+)[a-zA-Z_\x{7f}-\x{ff}][a-zA-Z0-9_\x{7f}-\x{ff}]*)
                    |
                    ([a-zA-Z_\x{7f}-\x{ff}][a-zA-Z0-9_\x{7f}-\x{ff}]*)
                )?/,
        1 => 'keyword.operator.class.php',
        2 => 'meta.function-call.static.php',
        3 => 'variable.other.class.php',
        4 => 'punctuation.definition.variable.php',
        5 => 'constant.other.class.php'
      rule 'storage.type.php' do
        match %r/(self|static|parent)\b/
      end
      include "#class-name"
      include "#variable-name"
    end
    include "#variables"
    include "#strings"
    rule 'meta.array.empty.php' do
      match %r/(array)(\()(\))/,
        1 => 'support.function.construct.php',
        2 => 'punctuation.definition.array.begin.php',
        3 => 'punctuation.definition.array.end.php'
    end
    rule 'meta.array.php' do
      from %r/(array)(\()/,
        1 => 'support.function.construct.php',
        2 => 'punctuation.definition.array.begin.php'
      to %r/\)/,
        0 => 'punctuation.definition.array.end.php'
      include "#language"
    end
    rule do
      match %r/(?i)\s*\(\s*(array|real|double|float|int(eger)?|bool(ean)?|string|object|binary|unset)\s*\)/,
        1 => 'storage.type.php'
    end
    rule 'storage.type.php' do
      match %r/(?i)\b(array|real|double|float|int(eger)?|bool(ean)?|string|class|clone|var|function|interface|parent|self|object)\b/
    end
    rule 'storage.modifier.php' do
      match %r/(?i)\b(global|abstract|const|extends|implements|final|p(r(ivate|otected)|ublic)|static)\b/
    end
    include "#object"
    rule 'punctuation.terminator.expression.php' do
      match %r/;/
    end
    include "#heredoc"
    rule 'keyword.operator.string.php' do
      match %r/\.=?/
    end
    rule 'keyword.operator.key.php' do
      match %r/=>/
    end
    rule do
      match %r/(?:(\=)(&))|(&(?=[$A-Za-z_]))/,
        1 => 'keyword.operator.assignment.php',
        2 => 'storage.modifier.reference.php',
        3 => 'storage.modifier.reference.php'
    end
    rule 'keyword.operator.error-control.php' do
      match %r/(@)/
    end
    rule 'keyword.operator.increment-decrement.php' do
      match %r/(\-\-|\+\+)/
    end
    rule 'keyword.operator.arithmetic.php' do
      match %r'(\-|\+|\*|/|%)'
    end
    rule 'keyword.operator.logical.php' do
      match %r/(?i)(!|&&|\|\|)|\b(and|or|xor|as)\b/
    end
    include "#function-call"
    rule 'keyword.operator.bitwise.php' do
      match %r/<<|>>|~|\^|&|\|/
    end
    rule 'keyword.operator.comparison.php' do
      match %r/(===|==|!==|!=|<=|>=|<>|<|>)/
    end
    rule 'keyword.operator.assignment.php' do
      match %r/=/
    end
    rule do
      from %r/(?i)\b(instanceof)\b\s+(?=[\\$a-z_])/,
        1 => 'keyword.operator.type.php'
      to %r/(?=[^\\$A-Za-z_0-9])/
      include "#class-name"
      include "#variable-name"
    end
    include "#numbers"
    include "#instantiation"
    rule do
      match %r/(?i)(goto)\s+([a-z_][a-z_0-9]*)/,
        1 => 'keyword.control.goto.php',
        2 => 'support.other.php'
    end
    rule do
      match %r/(?i)^\s*([a-z_][a-z_0-9]*)\s*:/,
        1 => 'entity.name.goto-label.php'
    end
    include "#string-backtick"
    rule do
      from %r/\[/,
        0 => 'punctuation.section.array.begin.php'
      to %r/\]/,
        0 => 'punctuation.section.array.end.php'
      include "#language"
    end
    include "#constants"
  end

  fragment :namespace do
    rule 'support.other.namespace.php' do
      from %r/(?i)(?:(namespace)|[a-z0-9_]+)?(\\)(?=.*?[^a-z_0-9\\])/,
        1 => 'variable.language.namespace.php',
        2 => 'punctuation.separator.inheritance.php'
      to %r/(?i)(?=[a-z0-9_]*[^a-z0-9_\\])/
      rule do
        match %r/(?i)(\\)/,
          1 => 'punctuation.separator.inheritance.php'
      end
    end
  end

  fragment :numbers do
    rule 'constant.numeric.php' do
      match %r/\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)\b/
    end
  end

  fragment :object do
    rule do
      from %r/(->)(\$?\{)/,
        1 => 'keyword.operator.class.php',
        2 => 'punctuation.definition.variable.php'
      to %r/(\})/,
        1 => 'punctuation.definition.variable.php'
      include "#language"
    end
    rule do
      # FIXME: (error) invalid hex escape
      match %r/(?x)(->)
                    (?:
                        ([A-Za-z_][A-Za-z_0-9]*)\s*\(
                        |
                        ((\$+)?[a-zA-Z_\x{7f}-\x{ff}][a-zA-Z0-9_\x{7f}-\x{ff}]*)
                    )?/,
        1 => 'keyword.operator.class.php',
        2 => 'meta.function-call.object.php',
        3 => 'variable.other.property.php',
        4 => 'punctuation.definition.variable.php'
    end
  end

  fragment :"parameter-default-types" do
    include "#strings"
    include "#numbers"
    include "#string-backtick"
    include "#variables"
    rule 'keyword.operator.key.php' do
      match %r/=>/
    end
    rule 'keyword.operator.assignment.php' do
      match %r/=/
    end
    rule 'storage.modifier.reference.php' do
      match %r/&(?=\s*\$)/
    end
    rule 'meta.array.php' do
      from %r/(array)\s*(\()/,
        1 => 'support.function.construct.php',
        2 => 'punctuation.definition.array.begin.php'
      to %r/\)/,
        0 => 'punctuation.definition.array.end.php'
      include "#parameter-default-types"
    end
    include "#instantiation"
    rule do
      # FIXME: (error) invalid hex escape
      from %r/(?xi)\s*(?=
                [a-z_0-9\\]+(::)
                ([a-z_\x{7f}-\x{ff}][a-z0-9_\x{7f}-\x{ff}]*)?
            )/
      # FIXME: (error) invalid hex escape
      to %r/(?i)(::)([a-z_\x{7f}-\x{ff}][a-z0-9_\x{7f}-\x{ff}]*)?/,
        1 => 'keyword.operator.class.php',
        2 => 'constant.other.class.php'
      include "#class-name"
    end
    include "#constants"
  end

  fragment :php_doc do
    rule 'invalid.illegal.missing-asterisk.phpdoc.php' do
      # PHPDocumentor only recognises lines with an asterisk as the first non-whitespaces character
      match %r/^(?!\s*\*).*$\n?/
    end
    rule do
      match %r/^\s*\*\s*(@access)\s+((public|private|protected)|(.+))\s*$/,
        1 => 'keyword.other.phpdoc.php',
        3 => 'storage.modifier.php',
        4 => 'invalid.illegal.wrong-access-type.phpdoc.php'
    end
    rule do
      match %r/(@xlink)\s+(.+)\s*$/,
        1 => 'keyword.other.phpdoc.php',
        2 => 'markup.underline.link.php'
    end
    rule 'keyword.other.phpdoc.php' do
      match %r/\@(a(bstract|uthor)|c(ategory|opyright)|example|global|internal|li(cense|nk)|pa(ckage|ram)|return|s(ee|ince|tatic|ubpackage)|t(hrows|odo)|v(ar|ersion)|uses|deprecated|final|ignore)\b/
    end
    rule 'meta.tag.inline.phpdoc.php' do
      match %r/\{(@(link)).+?\}/,
        1 => 'keyword.other.phpdoc.php'
    end
  end

  fragment :"regex-double-quoted" do
    rule 'string.regexp.double-quoted.php' do
      from %r'(?x)"/ (?= (\\.|[^"/])++/[imsxeADSUXu]*" )',
        0 => 'punctuation.definition.string.begin.php'
      to %r'(/)([imsxeADSUXu]*)(")',
        0 => 'punctuation.definition.string.end.php'
      rule 'constant.character.escape.regex.php' do
        # Escaped from the regexp – there can also be 2 backslashes (since 1 will escape the first)
        match %r/(\\){1,2}[.$^\[\]{}]/
      end
      include "#interpolation"
      rule 'string.regexp.arbitrary-repitition.php' do
        match %r/(\{)\d+(,\d+)?(\})/,
          1 => 'punctuation.definition.arbitrary-repitition.php',
          3 => 'punctuation.definition.arbitrary-repitition.php'
      end
      rule 'string.regexp.character-class.php' do
        from %r/\[(?:\^?\])?/
        to %r/\]/
        both 0 => 'punctuation.definition.character-class.php'
        include "#interpolation"
      end
      rule 'keyword.operator.regexp.php' do
        match %r/[$^+*]/
      end
    end
  end

  fragment :"regex-single-quoted" do
    rule 'string.regexp.single-quoted.php' do
      from %r:(?x)'/ (?= (\\.|[^'/])++/[imsxeADSUXu]*' ):,
        0 => 'punctuation.definition.string.begin.php'
      to %r:(/)([imsxeADSUXu]*)('):,
        0 => 'punctuation.definition.string.end.php'
      rule 'string.regexp.arbitrary-repitition.php' do
        match %r/(\{)\d+(,\d+)?(\})/,
          1 => 'punctuation.definition.arbitrary-repitition.php',
          3 => 'punctuation.definition.arbitrary-repitition.php'
      end
      rule 'constant.character.escape.regex.php' do
        # Escaped from the regexp – there can also be 2 backslashes (since 1 will escape the first)
        match %r/(\\){1,2}[.$^\[\]{}]/
      end
      rule 'constant.character.escape.php' do
        # Escaped from the PHP string – there can also be 2 backslashes (since 1 will escape the first)
        match %r/\\{1,2}[\\']/
      end
      rule 'string.regexp.character-class.php' do
        from %r/\[(?:\^?\])?/
        to %r/\]/
        both 0 => 'punctuation.definition.character-class.php'
        rule 'constant.character.escape.php' do
          match %r/\\[\\'\[\]]/
        end
      end
      rule 'keyword.operator.regexp.php' do
        match %r/[$^+*]/
      end
    end
  end

  fragment :"sql-string-double-quoted" do
    rule 'string.quoted.double.sql.php' do
      content_scope "source.sql.embedded.php"
      from %r/"\s*(?=(SELECT|INSERT|UPDATE|DELETE|CREATE|REPLACE|ALTER)\b)/,
        0 => 'punctuation.definition.string.begin.php'
      to %r/"/,
        0 => 'punctuation.definition.string.end.php'
      rule 'comment.line.number-sign.sql' do
        match %r/#(\\"|[^"])*(?="|$\n?)/
      end
      rule 'comment.line.double-dash.sql' do
        match %r/--(\\"|[^"])*(?="|$\n?)/
      end
      rule 'constant.character.escape.php' do
        match %r/\\[\\"`']/
      end
      rule 'string.quoted.single.unclosed.sql' do
        # Unclosed strings must be captured to avoid them eating the remainder of the PHP script
        #           Sample case: $sql = "SELECT * FROM bar WHERE foo = '" . $variable . "'"
        match %r/'(?=((\\')|[^'"])*("|$))/
      end
      rule 'string.quoted.other.backtick.unclosed.sql' do
        # Unclosed strings must be captured to avoid them eating the remainder of the PHP script
        #           Sample case: $sql = "SELECT * FROM bar WHERE foo = '" . $variable . "'"
        match %r/`(?=((\\`)|[^`"])*("|$))/
      end
      rule 'string.quoted.single.sql' do
        from %r/'/
        to %r/'/
        include "#interpolation"
      end
      rule 'string.quoted.other.backtick.sql' do
        from %r/`/
        to %r/`/
        include "#interpolation"
      end
      include "#interpolation"
      include "source.sql"
    end
  end

  fragment :"sql-string-single-quoted" do
    rule 'string.quoted.single.sql.php' do
      content_scope "source.sql.embedded.php"
      from %r/'\s*(?=(SELECT|INSERT|UPDATE|DELETE|CREATE|REPLACE|ALTER)\b)/,
        0 => 'punctuation.definition.string.begin.php'
      to %r/'/,
        0 => 'punctuation.definition.string.end.php'
      rule 'comment.line.number-sign.sql' do
        match %r/#(\\'|[^'])*(?='|$\n?)/
      end
      rule 'comment.line.double-dash.sql' do
        match %r/--(\\'|[^'])*(?='|$\n?)/
      end
      rule 'constant.character.escape.php' do
        match %r/\\[\\'`"]/
      end
      rule 'string.quoted.other.backtick.unclosed.sql' do
        # Unclosed strings must be captured to avoid them eating the remainder of the PHP script
        #           Sample case: $sql = "SELECT * FROM bar WHERE foo = '" . $variable . "'"
        match %r/`(?=((\\`)|[^`'])*('|$))/
      end
      rule 'string.quoted.double.unclosed.sql' do
        # Unclosed strings must be captured to avoid them eating the remainder of the PHP script
        #           Sample case: $sql = "SELECT * FROM bar WHERE foo = '" . $variable . "'"
        match %r/"(?=((\\")|[^"'])*('|$))/
      end
      include "source.sql"
    end
  end

  fragment :"string-backtick" do
    rule 'string.interpolated.php' do
      from %r/`/,
        0 => 'punctuation.definition.string.begin.php'
      to %r/`/,
        0 => 'punctuation.definition.string.end.php'
      rule 'constant.character.escape.php' do
        match %r/\\./
      end
      include "#interpolation"
    end
  end

  fragment :"string-double-quoted" do
    rule 'string.quoted.double.php' do
      # This contentName is just to allow the usage of “select scope” to select the string contents first, then the string with quotes
      content_scope "meta.string-contents.quoted.double.php"
      from %r/"/,
        0 => 'punctuation.definition.string.begin.php'
      to %r/"/,
        0 => 'punctuation.definition.string.end.php'
      include "#interpolation"
    end
  end

  fragment :"string-single-quoted" do
    rule 'string.quoted.single.php' do
      content_scope "meta.string-contents.quoted.single.php"
      from %r/'/,
        0 => 'punctuation.definition.string.begin.php'
      to %r/'/,
        0 => 'punctuation.definition.string.end.php'
      rule 'constant.character.escape.php' do
        match %r/\\[\\']/
      end
    end
  end

  fragment :strings do
    include "#regex-double-quoted"
    include "#sql-string-double-quoted"
    include "#string-double-quoted"
    include "#regex-single-quoted"
    include "#sql-string-single-quoted"
    include "#string-single-quoted"
  end

  fragment :support do
    rule 'support.function.apc.php' do
      match %r/(?i)\bapc_(s(tore|ma_info)|c(ompile_file|lear_cache|a(s|che_info))|inc|de(c|fine_constants|lete(_file)?)|exists|fetch|load_constants|add|bin_(dump(file)?|load(file)?))\b/
    end
    rule 'support.function.array.php' do
      match %r/(?i)\b(s(huffle|izeof|ort)|n(ext|at(sort|casesort))|c(o(unt|mpact)|urrent)|in_array|u(sort|ksort|asort)|p(os|rev)|e(nd|ach|xtract)|k(sort|ey|rsort)|list|a(sort|r(sort|ray(_(s(hift|um|plice|earch|lice)|c(h(unk|ange_key_case)|o(unt_values|mbine))|intersect(_(u(key|assoc)|key|assoc))?|diff(_(u(key|assoc)|key|assoc))?|u(n(shift|ique)|intersect(_(uassoc|assoc))?|diff(_(uassoc|assoc))?)|p(op|ush|ad|roduct)|values|key(s|_exists)|f(il(ter|l(_keys)?)|lip)|walk(_recursive)?|r(e(duce|place(_recursive)?|verse)|and)|m(ultisort|erge(_recursive)?|ap)))?))|r(sort|eset|ange))\b/
    end
    rule 'support.function.basic_functions.php' do
      match %r/(?i)\b(s(how_source|ys_getloadavg|leep)|highlight_(string|file)|con(stant|nection_(status|timeout|aborted))|time_(sleep_until|nanosleep)|ignore_user_abort|d(ie|efine(d)?)|u(sleep|n(iqid|pack))|__halt_compiler|p(hp_(strip_whitespace|check_syntax)|ack)|e(val|xit)|get_browser)\b/
    end
    rule 'support.function.bcmath.php' do
      match %r/(?i)\bbc(s(cale|ub|qrt)|comp|div|pow(mod)?|add|m(od|ul))\b/
    end
    rule 'support.function.bz2.php' do
      match %r/(?i)\bbz(c(ompress|lose)|open|decompress|err(str|no|or)|flush|write|read)\b/
    end
    rule 'support.function.calendar.php' do
      match %r/(?i)\b(GregorianToJD|cal_(to_jd|info|days_in_month|from_jd)|unixtojd|jdto(unix|jewish)|easter_da(ys|te)|J(ulianToJD|ewishToJD|D(MonthName|To(Gregorian|Julian|French)|DayOfWeek))|FrenchToJD)\b/
    end
    rule 'support.function.classobj.php' do
      match %r/(?i)\b(c(lass_(exists|alias)|all_user_method(_array)?)|trait_exists|i(s_(subclass_of|a)|nterface_exists)|__autoload|property_exists|get_(c(lass(_(vars|methods))?|alled_class)|object_vars|declared_(classes|traits|interfaces)|parent_class)|method_exists)\b/
    end
    rule 'support.function.com.php' do
      match %r/(?i)\b(com_(set|create_guid|i(senum|nvoke)|pr(int_typeinfo|op(set|put|get))|event_sink|load(_typelib)?|addref|release|get(_active_object)?|message_pump)|variant_(s(ub|et(_type)?)|n(ot|eg)|c(a(st|t)|mp)|i(nt|div|mp)|or|d(iv|ate_(to_timestamp|from_timestamp))|pow|eqv|fix|a(nd|dd|bs)|round|get_type|xor|m(od|ul)))\b/
    end
    rule 'support.function.ctype.php' do
      match %r/(?i)\bctype_(space|cntrl|digit|upper|p(unct|rint)|lower|al(num|pha)|graph|xdigit)\b/
    end
    rule 'support.function.curl.php' do
      match %r/(?i)\bcurl_(setopt(_array)?|c(opy_handle|lose)|init|e(rr(no|or)|xec)|version|getinfo|multi_(select|close|in(it|fo_read)|exec|add_handle|remove_handle|getcontent))\b/
    end
    rule 'support.function.datetime.php' do
      match %r/(?i)\b(str(totime|ptime|ftime)|checkdate|time(zone_(name_(from_abbr|get)|transitions_get|identifiers_list|o(pen|ffset_get)|version_get|location_get|abbreviations_list))?|idate|date(_(su(n(set|_info|rise)|b)|create(_from_format)?|time(stamp_(set|get)|zone_(set|get)|_set)|i(sodate_set|nterval_(create_from_date_string|format))|offset_get|d(iff|efault_timezone_(set|get)|ate_set)|parse(_from_format)?|format|add|get_last_errors|modify))?|localtime|g(et(timeofday|date)|m(strftime|date|mktime))|m(icrotime|ktime))\b/
    end
    rule 'support.function.dba.php' do
      match %r/(?i)\bdba_(sync|handlers|nextkey|close|insert|op(timize|en)|delete|popen|exists|key_split|f(irstkey|etch)|list|replace)\b/
    end
    rule 'support.function.dbx.php' do
      match %r/(?i)\bdbx_(sort|c(o(nnect|mpare)|lose)|e(scape_string|rror)|query|fetch_row)\b/
    end
    rule 'support.function.dir.php' do
      match %r/(?i)\b(scandir|c(h(dir|root)|losedir)|opendir|dir|re(winddir|addir)|getcwd)\b/
    end
    rule 'support.function.dotnet.php' do
      match %r/(?i)\bdotnet_load\b/
    end
    rule 'support.function.eio.php' do
      match %r/(?i)\beio_(s(y(nc(_file_range|fs)?|mlink)|tat(vfs)?|e(ndfile|t_m(in_parallel|ax_(idle|p(oll_(time|reqs)|arallel)))|ek))|n(threads|op|pending|re(qs|ady))|c(h(own|mod)|ustom|lose|ancel)|truncate|init|open|dup2|u(nlink|time)|poll|event_loop|f(s(ync|tat(vfs)?)|ch(own|mod)|truncate|datasync|utime|allocate)|write|l(stat|ink)|r(e(name|a(d(dir|link|ahead)?|lpath))|mdir)|g(et_(event_stream|last_error)|rp(_(cancel|limit|add))?)|mk(nod|dir)|busy)\b/
    end
    rule 'support.function.enchant.php' do
      match %r/(?i)\benchant_(dict_(s(tore_replacement|uggest)|check|is_in_session|describe|quick_check|add_to_(session|personal)|get_error)|broker_(set_ordering|init|d(ict_exists|escribe)|free(_dict)?|list_dicts|request_(dict|pwl_dict)|get_error))\b/
    end
    rule 'support.function.ereg.php' do
      match %r/(?i)\b(s(plit(i)?|ql_regcase)|ereg(i(_replace)?|_replace)?)\b/
    end
    rule 'support.function.errorfunc.php' do
      match %r/(?i)\b(set_e(rror_handler|xception_handler)|trigger_error|debug_(print_backtrace|backtrace)|user_error|error_(log|reporting|get_last)|restore_e(rror_handler|xception_handler))\b/
    end
    rule 'support.function.exec.php' do
      match %r/(?i)\b(s(hell_exec|ystem)|p(assthru|roc_(nice|close|terminate|open|get_status))|e(scapeshell(cmd|arg)|xec))\b/
    end
    rule 'support.function.exif.php' do
      match %r/(?i)\b(exif_(t(humbnail|agname)|imagetype|read_data)|read_exif_data)\b/
    end
    rule 'support.function.file.php' do
      match %r/(?i)\b(s(ymlink|tat|et_file_buffer)|c(h(own|grp|mod)|opy|learstatcache)|t(ouch|empnam|mpfile)|is_(dir|uploaded_file|executable|file|writ(eable|able)|link|readable)|d(i(sk(_(total_space|free_space)|freespace)|rname)|elete)|u(nlink|mask)|p(close|open|a(thinfo|rse_ini_(string|file)))|f(s(canf|tat|eek)|nmatch|close|t(ell|runcate)|ile(size|ctime|type|inode|owner|_(put_contents|exists|get_contents)|perms|atime|group|mtime)?|open|p(ut(s|csv)|assthru)|eof|flush|write|lock|read|get(s(s)?|c(sv)?))|l(stat|ch(own|grp)|ink(info)?)|r(e(name|wind|a(d(file|link)|lpath(_cache_(size|get))?))|mdir)|glob|m(ove_uploaded_file|kdir)|basename)\b/
    end
    rule 'support.function.fileinfo.php' do
      match %r/(?i)\b(finfo_(set_flags|close|open|file|buffer)|mime_content_type)\b/
    end
    rule 'support.function.filter.php' do
      match %r/(?i)\bfilter_(has_var|i(nput(_array)?|d)|var(_array)?|list)\b/
    end
    rule 'support.function.funchand.php' do
      match %r/(?i)\b(c(all_user_func(_array)?|reate_function)|unregister_tick_function|f(orward_static_call(_array)?|unc(tion_exists|_(num_args|get_arg(s)?)))|register_(shutdown_function|tick_function)|get_defined_functions)\b/
    end
    rule 'support.function.gettext.php' do
      match %r/(?i)\b(ngettext|textdomain|d(ngettext|c(ngettext|gettext)|gettext)|gettext|bind(textdomain|_textdomain_codeset))\b/
    end
    rule 'support.function.gmp.php' do
      match %r/(?i)\bgmp_(s(can(1|0)|trval|ign|ub|etbit|qrt(rem)?)|hamdist|ne(g|xtprime)|c(om|lrbit|mp)|testbit|in(tval|it|vert)|or|div(_(q(r)?|r)|exact)?|jacobi|p(o(pcount|w(m)?)|erfect_square|rob_prime)|fact|legendre|a(nd|dd|bs)|random|gcd(ext)?|xor|m(od|ul))\b/
    end
    rule 'support.function.hash.php' do
      match %r/(?i)\bhash(_(hmac(_file)?|copy|init|update(_(stream|file))?|pbkdf2|fi(nal|le)|algos))?\b/
    end
    rule 'support.function.http.php' do
      match %r/(?i)\b(http_(s(upport|end_(st(atus|ream)|content_(type|disposition)|data|file|last_modified))|head|negotiate_(c(harset|ontent_type)|language)|c(hunked_decode|ache_(etag|last_modified))|throttle|inflate|d(eflate|ate)|p(ost_(data|fields)|ut_(stream|data|file)|ersistent_handles_(c(ount|lean)|ident)|arse_(headers|cookie|params|message))|re(direct|quest(_(method_(name|unregister|exists|register)|body_encode))?)|get(_request_(headers|body(_stream)?))?|match_(etag|request_header|modified)|build_(str|cookie|url))|ob_(inflatehandler|deflatehandler|etaghandler))\b/
    end
    rule 'support.function.iconv.php' do
      match %r/(?i)\b(iconv(_(s(tr(pos|len|rpos)|ubstr|et_encoding)|get_encoding|mime_(decode(_headers)?|encode)))?|ob_iconv_handler)\b/
    end
    rule 'support.function.iisfunc.php' do
      match %r/(?i)\biis_(s(t(op_serv(ice|er)|art_serv(ice|er))|et_(s(cript_map|erver_rights)|dir_security|app_settings))|add_server|remove_server|get_(s(cript_map|erv(ice_state|er_(rights|by_(comment|path))))|dir_security))\b/
    end
    rule 'support.function.image.php' do
      match %r/(?i)\b(i(ptc(parse|embed)|mage(s(y|tring(up)?|et(style|t(hickness|ile)|pixel|brush)|avealpha|x)|c(har(up)?|o(nvolution|py(res(ized|ampled)|merge(gray)?)?|lor(s(total|et|forindex)|closest(hwb|alpha)?|transparent|deallocate|exact(alpha)?|a(t|llocate(alpha)?)|resolve(alpha)?|match))|reate(truecolor|from(string|jpeg|png|wbmp|g(if|d(2(part)?)?)|x(pm|bm)))?)|t(ypes|tf(text|bbox)|ruecolortopalette)|i(struecolor|nterlace)|2wbmp|d(estroy|ashedline)|jpeg|_type_to_(extension|mime_type)|p(s(slantfont|text|e(ncodefont|xtendfont)|freefont|loadfont|bbox)|ng|olygon|alettecopy)|ellipse|f(t(text|bbox)|il(ter|l(toborder|ed(polygon|ellipse|arc|rectangle))?)|ont(height|width))|wbmp|l(ine|oadfont|ayereffect)|a(ntialias|lphablending|rc)|r(otate|ectangle)|g(if|d(2)?|ammacorrect|rab(screen|window))|xbm))|jpeg2wbmp|png2wbmp|g(d_info|etimagesize(fromstring)?))\b/
    end
    rule 'support.function.info.php' do
      match %r/(?i)\b(s(ys_get_temp_dir|et_(time_limit|include_path|magic_quotes_runtime))|ini_(set|alter|restore|get(_all)?)|zend_(thread_id|version|logo_guid)|dl|p(hp(credits|info|_(sapi_name|ini_(scanned_files|loaded_file)|uname|logo_guid)|version)|utenv)|extension_loaded|version_compare|assert(_options)?|restore_include_path|g(c_(collect_cycles|disable|enable(d)?)|et(opt|_(c(urrent_user|fg_var)|include(d_files|_path)|defined_constants|extension_funcs|loaded_extensions|required_files|magic_quotes_(runtime|gpc))|env|lastmod|rusage|my(inode|uid|pid|gid)))|m(emory_get_(usage|peak_usage)|a(in|gic_quotes_runtime)))\b/
    end
    rule 'support.function.interbase.php' do
      match %r/(?i)\bibase_(se(t_event_handler|rv(ice_(detach|attach)|er_info))|n(um_(params|fields)|ame_result)|c(o(nnect|mmit(_ret)?)|lose)|trans|d(elete_user|rop_db|b_info)|p(connect|aram_info|repare)|e(rr(code|msg)|xecute)|query|f(ield_info|etch_(object|assoc|row)|ree_(event_handler|query|result))|wait_event|a(dd_user|ffected_rows)|r(ollback(_ret)?|estore)|gen_id|m(odify_user|aintain_db)|b(lob_(c(lose|ancel|reate)|i(nfo|mport)|open|echo|add|get)|ackup))\b/
    end
    rule 'support.function.intl.php' do
      match %r/(?i)\b(n(ormalizer_(normalize|is_normalized)|umfmt_(set_(symbol|text_attribute|pattern|attribute)|create|parse(_currency)?|format(_currency)?|get_(symbol|text_attribute|pattern|error_(code|message)|locale|attribute)))|collator_(s(ort(_with_sort_keys)?|et_(strength|attribute))|c(ompare|reate)|asort|get_(s(trength|ort_key)|error_(code|message)|locale|attribute))|transliterator_(create(_(inverse|from_rules))?|transliterate|list_ids|get_error_(code|message))|i(ntl_(is_failure|error_name|get_error_(code|message))|dn_to_(u(nicode|tf8)|ascii))|datefmt_(set_(calendar|timezone(_id)?|pattern|lenient)|create|is_lenient|parse|format(_object)?|localtime|get_(calendar(_object)?|time(type|zone(_id)?)|datetype|pattern|error_(code|message)|locale))|locale_(set_default|compose|parse|filter_matches|lookup|accept_from_http|get_(script|d(isplay_(script|name|variant|language|region)|efault)|primary_language|keywords|all_variants|region))|resourcebundle_(c(ount|reate)|locales|get(_error_(code|message))?)|grapheme_(s(tr(str|i(str|pos)|pos|len|r(ipos|pos))|ubstr)|extract)|msgfmt_(set_pattern|create|parse(_message)?|format(_message)?|get_(pattern|error_(code|message)|locale)))\b/
    end
    rule 'support.function.json.php' do
      match %r/(?i)\bjson_(decode|encode|last_error)\b/
    end
    rule 'support.function.ldap.php' do
      match %r/(?i)\bldap_(s(tart_tls|ort|e(t_(option|rebind_proc)|arch)|asl_bind)|next_(entry|attribute|reference)|c(o(n(nect|trol_paged_result(_response)?)|unt_entries|mpare)|lose)|t61_to_8859|d(n2ufn|elete)|8859_to_t61|unbind|parse_re(sult|ference)|e(rr(no|2str|or)|xplode_dn)|f(irst_(entry|attribute|reference)|ree_result)|list|add|re(name|ad)|get_(option|dn|entries|values(_len)?|attributes)|mod(ify|_(del|add|replace))|bind)\b/
    end
    rule 'support.function.libxml.php' do
      match %r/(?i)\blibxml_(set_(streams_context|external_entity_loader)|clear_errors|disable_entity_loader|use_internal_errors|get_(errors|last_error))\b/
    end
    rule 'support.function.mail.php' do
      match %r/(?i)\b(ezmlm_hash|mail)\b/
    end
    rule 'support.function.math.php' do
      match %r/(?i)\b(s(in(h)?|qrt|rand)|h(ypot|exdec)|c(os(h)?|eil)|tan(h)?|is_(nan|infinite|finite)|octdec|de(c(hex|oct|bin)|g2rad)|p(i|ow)|exp(m1)?|f(loor|mod)|l(cg_value|og(1(p|0))?)|a(sin(h)?|cos(h)?|tan(h|2)?|bs)|r(ound|a(nd|d2deg))|getrandmax|m(t_(srand|rand|getrandmax)|in|ax)|b(indec|ase_convert))\b/
    end
    rule 'support.function.mbstring.php' do
      match %r/(?i)\bmb_(s(tr(str|cut|to(upper|lower)|i(str|pos|mwidth)|pos|width|len|r(chr|i(chr|pos)|pos))|ubst(itute_character|r(_count)?)|plit|end_mail)|http_(input|output)|c(heck_encoding|onvert_(case|encoding|variables|kana))|internal_encoding|output_handler|de(code_(numericentity|mimeheader)|tect_(order|encoding))|p(arse_str|referred_mime_name)|e(ncod(ing_aliases|e_(numericentity|mimeheader))|reg(i(_replace)?|_(search(_(setpos|init|pos|regs|get(pos|regs)))?|replace(_callback)?|match))?)|l(ist_encodings|anguage)|regex_(set_options|encoding)|get_info)\b/
    end
    rule 'support.function.mcrypt.php' do
      match %r/(?i)\bm(crypt_(c(fb|reate_iv|bc)|ofb|decrypt|e(nc(_(self_test|is_block_(algorithm(_mode)?|mode)|get_(supported_key_sizes|iv_size|key_size|algorithms_name|modes_name|block_size))|rypt)|cb)|list_(algorithms|modes)|ge(neric(_(init|deinit|end))?|t_(cipher_name|iv_size|key_size|block_size))|module_(self_test|close|is_block_(algorithm(_mode)?|mode)|open|get_(supported_key_sizes|algo_(key_size|block_size))))|decrypt_generic)\b/
    end
    rule 'support.function.memcache.php' do
      match %r/(?i)\bmemcache_debug\b/
    end
    rule 'support.function.mhash.php' do
      match %r/(?i)\bmhash(_(count|keygen_s2k|get_(hash_name|block_size)))?\b/
    end
    rule 'support.function.mongo.php' do
      match %r/(?i)\bbson_(decode|encode)\b/
    end
    rule 'support.function.mysql.php' do
      match %r/(?i)\bmysql_(s(tat|e(t_charset|lect_db))|num_(fields|rows)|c(onnect|l(ient_encoding|ose)|reate_db)|t(hread_id|ablename)|in(sert_id|fo)|d(ata_seek|rop_db|b_(name|query))|unbuffered_query|p(connect|ing)|e(scape_string|rr(no|or))|query|f(ield_(seek|name|t(ype|able)|flags|len)|etch_(object|field|lengths|a(ssoc|rray)|row)|ree_result)|list_(tables|dbs|processes|fields)|affected_rows|re(sult|al_escape_string)|get_(server_info|host_info|client_info|proto_info))\b/
    end
    rule 'support.function.mysqli.php' do
      match %r/(?i)\bmysqli_(s(sl_set|t(ore_result|at|mt_(s(tore_result|end_long_data)|next_result|close|init|data_seek|prepare|execute|f(etch|ree_result)|attr_(set|get)|res(ult_metadata|et)|get_(warnings|result)|more_results|bind_(param|result)))|e(nd_(query|long_data)|t_(charset|opt|local_infile_(handler|default))|lect_db)|lave_query)|next_result|c(ha(nge_user|racter_set_name)|o(nnect|mmit)|l(ient_encoding|ose))|thread_safe|init|options|d(isable_r(pl_parse|eads_from_master)|ump_debug_info|ebug|ata_seek)|use_result|p(ing|oll|aram_count|repare)|e(scape_string|nable_r(pl_parse|eads_from_master)|xecute|mbedded_server_(start|end))|kill|query|f(ield_seek|etch(_(object|field(s|_direct)?|a(ssoc|ll|rray)|row))?|ree_result)|autocommit|r(ollback|pl_(p(arse_enabled|robe)|query_type)|e(port|fresh|a(p_async_query|l_(connect|escape_string|query))))|get_(c(harset|onnection_stats|lient_(stats|info|version)|ache_stats)|warnings|metadata)|m(ore_results|ulti_query|aster_query)|bind_(param|result))\b/
    end
    rule 'support.function.mysqlnd-memcache.php' do
      match %r/(?i)\bmysqlnd_memcache_(set|get_config)\b/
    end
    rule 'support.function.mysqlnd-ms.php' do
      match %r/(?i)\bmysqlnd_ms_(set_(user_pick_server|qos)|query_is_select|get_(stats|last_(used_connection|gtid))|match_wild)\b/
    end
    rule 'support.function.mysqlnd-qc.php' do
      match %r/(?i)\bmysqlnd_qc_(set_(storage_handler|cache_condition|is_select|user_handlers)|clear_cache|get_(normalized_query_trace_log|c(ore_stats|ache_info)|query_trace_log|available_handlers))\b/
    end
    rule 'support.function.mysqlnd-uh.php' do
      match %r/(?i)\bmysqlnd_uh_(set_(statement_proxy|connection_proxy)|convert_to_mysqlnd)\b/
    end
    rule 'support.function.network.php' do
      match %r/(?i)\b(s(yslog|ocket_(set_(timeout|blocking)|get_status)|et(cookie|rawcookie))|h(ttp_response_code|eader(s_(sent|list)|_re(gister_callback|move))?)|c(heckdnsrr|loselog)|i(net_(ntop|pton)|p2long)|openlog|d(ns_(check_record|get_(record|mx))|efine_syslog_variables)|pfsockopen|fsockopen|long2ip|get(servby(name|port)|host(name|by(name(l)?|addr))|protobyn(umber|ame)|mxrr))\b/
    end
    rule 'support.function.nsapi.php' do
      match %r/(?i)\bnsapi_(virtual|re(sponse_headers|quest_headers))\b/
    end
    rule 'support.function.objaggregation.php' do
      match %r/(?i)\b(deaggregate|aggregat(ion_info|e(_(info|properties(_by_(list|regexp))?|methods(_by_(list|regexp))?))?))\b/
    end
    rule 'support.function.oci8.php' do
      match %r/(?i)\boci(s(tatementtype|e(tprefetch|rverversion)|avelob(file)?)|n(umcols|ew(c(ollection|ursor)|descriptor)|logon)|c(o(l(umn(s(cale|ize)|name|type(raw)?|isnull|precision)|l(size|trim|a(ssign(elem)?|ppend)|getelem|max))|mmit)|loselob|ancel)|internaldebug|definebyname|_(s(tatement_type|e(t_(client_i(nfo|dentifier)|prefetch|edition|action|module_name)|rver_version))|n(um_(fields|rows)|ew_(c(o(nnect|llection)|ursor)|descriptor))|c(o(nnect|mmit)|l(ient_version|ose)|ancel)|internal_debug|define_by_name|p(connect|a(ssword_change|rse))|e(rror|xecute)|f(ield_(s(cale|ize)|name|type(_raw)?|is_null|precision)|etch(_(object|a(ssoc|ll|rray)|row))?|ree_(statement|descriptor))|lob_(copy|is_equal)|r(ollback|esult)|bind_(array_by_name|by_name))|p(logon|arse)|e(rror|xecute)|f(etch(statement|into)?|ree(statement|c(ollection|ursor)|desc))|write(temporarylob|lobtofile)|lo(adlob|go(n|ff))|r(o(wcount|llback)|esult)|bindbyname)\b/
    end
    rule 'support.function.openssl.php' do
      match %r/(?i)\bopenssl_(s(ign|eal)|c(sr_(sign|new|export(_to_file)?|get_(subject|public_key))|ipher_iv_length)|open|d(h_compute_key|igest|ecrypt)|p(ublic_(decrypt|encrypt)|k(cs(12_(export(_to_file)?|read)|7_(sign|decrypt|encrypt|verify))|ey_(new|export(_to_file)?|free|get_(details|p(ublic|rivate))))|rivate_(decrypt|encrypt))|e(ncrypt|rror_string)|verify|free_key|random_pseudo_bytes|get_(cipher_methods|p(ublickey|rivatekey)|md_methods)|x509_(check(_private_key|purpose)|parse|export(_to_file)?|free|read))\b/
    end
    rule 'support.function.output.php' do
      match %r/(?i)\b(o(utput_(add_rewrite_var|reset_rewrite_vars)|b_(start|clean|implicit_flush|end_(clean|flush)|flush|list_handlers|g(zhandler|et_(status|c(ontents|lean)|flush|le(ngth|vel)))))|flush)\b/
    end
    rule 'support.function.password.php' do
      match %r/(?i)\bpassword_(hash|needs_rehash|verify|get_info)\b/
    end
    rule 'support.function.pcntl.php' do
      match %r/(?i)\bpcntl_(s(ig(nal(_dispatch)?|timedwait|procmask|waitinfo)|etpriority)|exec|fork|w(stopsig|termsig|if(s(topped|ignaled)|exited)|exitstatus|ait(pid)?)|alarm|getpriority)\b/
    end
    rule 'support.function.pgsql.php' do
      match %r/(?i)\bpg_(se(nd_(prepare|execute|query(_params)?)|t_(client_encoding|error_verbosity)|lect)|host|num_(fields|rows)|c(o(n(nect(ion_(status|reset|busy))?|vert)|py_(to|from))|l(ient_encoding|ose)|ancel_query)|t(ty|ra(nsaction_status|ce))|insert|options|d(elete|bname)|u(n(trace|escape_bytea)|pdate)|p(connect|ing|ort|ut_line|arameter_status|repare)|e(scape_(string|identifier|literal|bytea)|nd_copy|xecute)|version|query(_params)?|f(ield_(size|n(um|ame)|t(ype(_oid)?|able)|is_null|prtlen)|etch_(object|a(ssoc|ll(_columns)?|rray)|r(ow|esult))|ree_result)|l(o_(seek|c(lose|reate)|tell|import|open|unlink|export|write|read(_all)?)|ast_(notice|oid|error))|affected_rows|result_(s(tatus|eek)|error(_field)?)|get_(notify|pid|result)|meta_data)\b/
    end
    rule 'support.function.php_apache.php' do
      match %r/(?i)\b(virtual|apache_(setenv|note|child_terminate|lookup_uri|re(s(ponse_headers|et_timeout)|quest_headers)|get(_(version|modules)|env))|getallheaders)\b/
    end
    rule 'support.function.php_dom.php' do
      match %r/(?i)\bdom_import_simplexml\b/
    end
    rule 'support.function.php_ftp.php' do
      match %r/(?i)\bftp_(s(sl_connect|ystype|i(te|ze)|et_option)|n(list|b_(continue|put|f(put|get)|get))|c(h(dir|mod)|onnect|dup|lose)|delete|p(ut|wd|asv)|exec|quit|f(put|get)|login|alloc|r(ename|aw(list)?|mdir)|get(_option)?|m(dtm|kdir))\b/
    end
    rule 'support.function.php_imap.php' do
      match %r/(?i)\bimap_(s(can(mailbox)?|tatus|ort|ubscribe|e(t(_quota|flag_full|acl)|arch)|avebody)|header(s|info)?|num_(recent|msg)|c(heck|l(ose|earflag_full)|reate(mailbox)?)|t(hread|imeout)|open|delete(mailbox)?|8bit|u(n(subscribe|delete)|tf(7_(decode|encode)|8)|id)|ping|e(rrors|xpunge)|qprint|fetch(structure|header|text|_overview|mime|body)|l(sub|ist(s(can|ubscribed)|mailbox)?|ast_error)|a(ppend|lerts)|r(e(name(mailbox)?|open)|fc822_(parse_(headers|adrlist)|write_address))|g(c|et(subscribed|_quota(root)?|acl|mailboxes))|m(sgno|ime_header_decode|ail(_(co(py|mpose)|move)|boxmsginfo)?)|b(inary|ody(struct)?|ase64))\b/
    end
    rule 'support.function.php_mssql.php' do
      match %r/(?i)\bmssql_(select_db|n(um_(fields|rows)|ext_result)|c(onnect|lose)|init|data_seek|pconnect|execute|query|f(ield_(seek|name|type|length)|etch_(object|field|a(ssoc|rray)|row|batch)|ree_(statement|result))|r(ows_affected|esult)|g(uid_string|et_last_message)|min_(error_severity|message_severity)|bind)\b/
    end
    rule 'support.function.php_odbc.php' do
      match %r/(?i)\bodbc_(s(tatistics|pecialcolumns|etoption)|n(um_(fields|rows)|ext_result)|c(o(nnect|lumn(s|privileges)|mmit)|ursor|lose(_all)?)|table(s|privileges)|d(o|ata_source)|p(connect|r(imarykeys|ocedure(s|columns)|epare))|e(rror(msg)?|xec(ute)?)|f(ield_(scale|n(um|ame)|type|precision|len)|oreignkeys|etch_(into|object|array|row)|ree_result)|longreadlen|autocommit|r(ollback|esult(_all)?)|gettypeinfo|binmode)\b/
    end
    rule 'support.function.php_pcre.php' do
      match %r/(?i)\bpreg_(split|quote|filter|last_error|replace(_callback)?|grep|match(_all)?)\b/
    end
    rule 'support.function.php_spl.php' do
      match %r/(?i)\b(spl_(classes|object_hash|autoload(_(call|unregister|extensions|functions|register))?)|class_(implements|uses|parents)|iterator_(count|to_array|apply))\b/
    end
    rule 'support.function.php_zip.php' do
      match %r/(?i)\bzip_(close|open|entry_(name|c(ompress(ionmethod|edsize)|lose)|open|filesize|read)|read)\b/
    end
    rule 'support.function.posix.php' do
      match %r/(?i)\bposix_(s(trerror|et(sid|uid|pgid|e(uid|gid)|gid))|ctermid|t(tyname|imes)|i(satty|nitgroups)|uname|errno|kill|access|get(sid|cwd|uid|_last_error|p(id|pid|w(nam|uid)|g(id|rp))|e(uid|gid)|login|rlimit|g(id|r(nam|oups|gid)))|mk(nod|fifo))\b/
    end
    rule 'support.function.proctitle.php' do
      match %r/(?i)\bset(threadtitle|proctitle)\b/
    end
    rule 'support.function.pspell.php' do
      match %r/(?i)\bpspell_(s(tore_replacement|uggest|ave_wordlist)|new(_(config|personal))?|c(heck|onfig_(save_repl|create|ignore|d(ict_dir|ata_dir)|personal|r(untogether|epl)|mode)|lear_session)|add_to_(session|personal))\b/
    end
    rule 'support.function.readline.php' do
      match %r/(?i)\breadline(_(c(ompletion_function|lear_history|allback_(handler_(install|remove)|read_char))|info|on_new_line|write_history|list_history|add_history|re(display|ad_history)))?\b/
    end
    rule 'support.function.recode.php' do
      match %r/(?i)\brecode(_(string|file))?\b/
    end
    rule 'support.function.rrd.php' do
      match %r/(?i)\brrd_(create|tune|info|update|error|version|f(irst|etch)|last(update)?|restore|graph|xport)\b/
    end
    rule 'support.function.sem.php' do
      match %r/(?i)\b(s(hm_(has_var|detach|put_var|attach|remove(_var)?|get_var)|em_(acquire|re(lease|move)|get))|ftok|msg_(s(tat_queue|e(nd|t_queue))|queue_exists|re(ceive|move_queue)|get_queue))\b/
    end
    rule 'support.function.session.php' do
      match %r/(?i)\bsession_(s(ta(tus|rt)|et_(save_handler|cookie_params)|ave_path)|name|c(ommit|ache_(expire|limiter))|i(s_registered|d)|de(stroy|code)|un(set|register)|encode|write_close|reg(ister(_shutdown)?|enerate_id)|get_cookie_params|module_name)\b/
    end
    rule 'support.function.shmop.php' do
      match %r/(?i)\bshmop_(size|close|open|delete|write|read)\b/
    end
    rule 'support.function.simplexml.php' do
      match %r/(?i)\bsimplexml_(import_dom|load_(string|file))\b/
    end
    rule 'support.function.snmp.php' do
      match %r/(?i)\bsnmp(set|2_(set|walk|real_walk|get(next)?)|_(set_(oid_(numeric_print|output_format)|enum_print|valueretrieval|quick_print)|read_mib|get_(valueretrieval|quick_print))|3_(set|walk|real_walk|get(next)?)|walk(oid)?|realwalk|get(next)?)\b/
    end
    rule 'support.function.soap.php' do
      match %r/(?i)\b(is_soap_fault|use_soap_error_handler)\b/
    end
    rule 'support.function.sockets.php' do
      match %r/(?i)\bsocket_(s(hutdown|trerror|e(nd(to)?|t_(nonblock|option|block)|lect))|c(onnect|l(ose|ear_error)|reate(_(pair|listen))?)|import_stream|write|l(isten|ast_error)|accept|re(cv(from)?|ad)|get(sockname|_option|peername)|bind)\b/
    end
    rule 'support.function.sqlite.php' do
      match %r/(?i)\bsqlite_(s(ingle_query|eek)|has_(prev|more)|n(um_(fields|rows)|ext)|c(hanges|olumn|urrent|lose|reate_(function|aggregate))|open|u(nbuffered_query|df_(decode_binary|encode_binary))|p(open|rev)|e(scape_string|rror_string|xec)|valid|key|query|f(ield_name|etch_(s(tring|ingle)|column_types|object|a(ll|rray))|actory)|l(ib(encoding|version)|ast_(insert_rowid|error))|array_query|rewind|busy_timeout)\b/
    end
    rule 'support.function.sqlsrv.php' do
      match %r/(?i)\bsqlsrv_(se(nd_stream_data|rver_info)|has_rows|n(um_(fields|rows)|ext_result)|c(o(n(nect|figure)|mmit)|l(ient_info|ose)|ancel)|prepare|e(rrors|xecute)|query|f(ield_metadata|etch(_(object|array))?|ree_stmt)|ro(ws_affected|llback)|get_(config|field)|begin_transaction)\b/
    end
    rule 'support.function.stats.php' do
      match %r/(?i)\bstats_(s(ta(ndard_deviation|t_(noncentral_t|correlation|in(nerproduct|dependent_t)|p(owersum|ercentile|aired_t)|gennch|binomial_coef))|kew)|harmonic_mean|c(ovariance|df_(n(oncentral_(chisquare|f)|egative_binomial)|c(hisquare|auchy)|t|uniform|poisson|exponential|f|weibull|l(ogistic|aplace)|gamma|b(inomial|eta)))|den(s_(n(ormal|egative_binomial)|c(hisquare|auchy)|t|pmf_(hypergeometric|poisson|binomial)|exponential|f|weibull|l(ogistic|aplace)|gamma|beta)|_uniform)|variance|kurtosis|absolute_deviation|rand_(setall|phrase_to_seeds|ranf|ge(n_(no(ncen(tral_(t|f)|ral_chisquare)|rmal)|chisquare|t|i(nt|uniform|poisson|binomial(_negative)?)|exponential|f(uniform)?|gamma|beta)|t_seeds)))\b/
    end
    rule 'support.function.streamsfuncs.php' do
      match %r/(?i)\bs(tream_(s(ocket_(s(hutdown|e(ndto|rver))|client|pair|enable_crypto|accept|recvfrom|get_name)|upports_lock|e(t_(chunk_size|timeout|write_buffer|read_buffer|blocking)|lect))|notification_callback|co(ntext_(set_(option|default|params)|create|get_(options|default|params))|py_to_stream)|is_local|encoding|filter_(prepend|append|re(gister|move))|wrapper_(unregister|re(store|gister))|re(solve_include_path|gister_wrapper)|get_(contents|transports|filters|wrappers|line|meta_data)|bucket_(new|prepend|append|make_writeable))|et_socket_blocking)\b/
    end
    rule 'support.function.string.php' do
      match %r/(?i)\b(s(scanf|ha1(_file)?|tr(s(tr|pn)|n(c(asecmp|mp)|atc(asecmp|mp))|c(spn|hr|oll|asecmp|mp)|t(o(upper|k|lower)|r)|i(str|p(slashes|cslashes|os|_tags))|_(s(huffle|plit)|ireplace|pad|word_count|r(ot13|ep(eat|lace))|getcsv)|p(os|brk)|len|r(chr|ipos|pos|ev))|imilar_text|oundex|ubstr(_(co(unt|mpare)|replace))?|printf|etlocale)|h(tml(specialchars(_decode)?|_entity_decode|entities)|e(x2bin|brev(c)?))|n(umber_format|l(2br|_langinfo))|c(h(op|unk_split|r)|o(nvert_(cyr_string|uu(decode|encode))|unt_chars)|r(ypt|c32))|trim|implode|ord|uc(first|words)|join|p(arse_str|rint(f)?)|e(cho|xplode)|v(sprintf|printf|fprintf)|quote(d_printable_(decode|encode)|meta)|fprintf|wordwrap|l(cfirst|trim|ocaleconv|evenshtein)|add(slashes|cslashes)|rtrim|get_html_translation_table|m(oney_format|d5(_file)?|etaphone)|bin2hex)\b/
    end
    rule 'support.function.sybase.php' do
      match %r/(?i)\bsybase_(se(t_message_handler|lect_db)|num_(fields|rows)|c(onnect|lose)|d(eadlock_retry_count|ata_seek)|unbuffered_query|pconnect|query|f(ield_seek|etch_(object|field|a(ssoc|rray)|row)|ree_result)|affected_rows|result|get_last_message|min_(server_severity|client_severity|error_severity|message_severity))\b/
    end
    rule 'support.function.taint.php' do
      match %r/(?i)\b(taint|is_tainted|untaint)\b/
    end
    rule 'support.function.tidy.php' do
      match %r/(?i)\b(tidy_(s(et(opt|_encoding)|ave_config)|c(onfig_count|lean_repair)|is_x(html|ml)|diagnose|parse_(string|file)|error_count|warning_count|load_config|access_count|re(set_config|pair_(string|file))|get(opt|_(status|h(tml(_ver)?|ead)|config|o(utput|pt_doc)|r(oot|elease)|body)))|ob_tidyhandler)\b/
    end
    rule 'support.function.tokenizer.php' do
      match %r/(?i)\btoken_(name|get_all)\b/
    end
    rule 'support.function.trader.php' do
      match %r/(?i)\btrader_(s(t(och(f|rsi)?|ddev)|in(h)?|u(m|b)|et_(compat|unstable_period)|qrt|ar(ext)?|ma)|ht_(sine|trend(line|mode)|dcp(hase|eriod)|phasor)|natr|c(ci|o(s(h)?|rrel)|dl(s(ho(otingstar|rtline)|t(icksandwich|alledpattern)|pinningtop|eparatinglines)|h(i(kkake(mod)?|ghwave)|omingpigeon|a(ngingman|rami(cross)?|mmer))|c(o(ncealbabyswall|unterattack)|losingmarubozu)|t(hrusting|a(sukigap|kuri)|ristar)|i(n(neck|vertedhammer)|dentical3crows)|2crows|onneck|d(oji(star)?|arkcloudcover|ragonflydoji)|u(nique3river|psidegap2crows)|3(starsinsouth|inside|outside|whitesoldiers|linestrike|blackcrows)|piercing|e(ngulfing|vening(star|dojistar))|kicking(bylength)?|l(ongl(ine|eggeddoji)|adderbottom)|a(dvanceblock|bandonedbaby)|ri(sefall3methods|ckshawman)|g(apsidesidewhite|ravestonedoji)|xsidegap3methods|m(orning(star|dojistar)|a(t(hold|chinglow)|rubozu))|b(elthold|reakaway))|eil|mo)|t(sf|ypprice|3|ema|an(h)?|r(i(x|ma)|ange))|obv|d(iv|ema|x)|ultosc|p(po|lus_d(i|m))|e(rrno|xp|ma)|var|kama|floor|w(clprice|illr|ma)|l(n|inearreg(_(slope|intercept|angle))?|og10)|a(sin|cos|t(an|r)|d(osc|d|x(r)?)?|po|vgprice|roon(osc)?)|r(si|oc(p|r(100)?)?)|get_(compat|unstable_period)|m(i(n(index|us_d(i|m)|max(index)?)?|dp(oint|rice))|om|ult|edprice|fi|a(cd(ext|fix)?|vp|x(index)?|ma)?)|b(op|eta|bands))\b/
    end
    rule 'support.function.url.php' do
      match %r/(?i)\b(http_build_query|url(decode|encode)|parse_url|rawurl(decode|encode)|get_(headers|meta_tags)|base64_(decode|encode))\b/
    end
    rule 'support.function.var.php' do
      match %r/(?i)\b(s(trval|e(ttype|rialize))|i(s(set|_(s(calar|tring)|nu(ll|meric)|callable|int(eger)?|object|double|float|long|array|re(source|al)|bool))|ntval|mport_request_variables)|d(oubleval|ebug_zval_dump)|unse(t|rialize)|print_r|empty|var_(dump|export)|floatval|get(type|_(defined_vars|resource_type))|boolval)\b/
    end
    rule 'support.function.wddx.php' do
      match %r/(?i)\bwddx_(serialize_va(lue|rs)|deserialize|packet_(start|end)|add_vars)\b/
    end
    rule 'support.function.xhprof.php' do
      match %r/(?i)\bxhprof_(sample_(disable|enable)|disable|enable)\b/
    end
    rule 'support.function.xml.php' do
      match %r/(?i)\b(utf8_(decode|encode)|xml_(set_(start_namespace_decl_handler|notation_decl_handler|character_data_handler|object|default_handler|unparsed_entity_decl_handler|processing_instruction_handler|e(nd_namespace_decl_handler|lement_handler|xternal_entity_ref_handler))|parse(_into_struct|r_(set_option|create(_ns)?|free|get_option))?|error_string|get_(current_(column_number|line_number|byte_index)|error_code)))\b/
    end
    rule 'support.function.xmlrpc.php' do
      match %r/(?i)\bxmlrpc_(se(t_type|rver_(c(all_method|reate)|destroy|add_introspection_data|register_(introspection_callback|method)))|is_fault|decode(_request)?|parse_method_descriptions|encode(_request)?|get_type)\b/
    end
    rule 'support.function.xmlwriter.php' do
      match %r/(?i)\bxmlwriter_(s(tart_(c(omment|data)|d(td(_(e(ntity|lement)|attlist))?|ocument)|pi|element(_ns)?|attribute(_ns)?)|et_indent(_string)?)|text|o(utput_memory|pen_(uri|memory))|end_(c(omment|data)|d(td(_(e(ntity|lement)|attlist))?|ocument)|pi|element|attribute)|f(ull_end_element|lush)|write_(c(omment|data)|dtd(_(e(ntity|lement)|attlist))?|pi|element(_ns)?|attribute(_ns)?|raw))\b/
    end
    rule 'support.function.xslt.php' do
      match %r/(?i)\bxslt_(set(opt|_(s(cheme_handler(s)?|ax_handler(s)?)|object|e(ncoding|rror_handler)|log|base))|create|process|err(no|or)|free|getopt|backend_(name|info|version))\b/
    end
    rule 'support.function.zlib.php' do
      match %r/(?i)\b(zlib_(decode|encode|get_coding_type)|readgzfile|gz(seek|c(ompress|lose)|tell|inflate|open|de(code|flate)|uncompress|p(uts|assthru)|e(ncode|of)|file|write|re(wind|ad)|get(s(s)?|c)))\b/
    end
    rule 'support.function.alias.php' do
      match %r/(?i)\bis_int(eger)?\b/
    end
  end

  fragment :"user-function-call" do
    rule 'meta.function-call.php' do
      from %r/(?i)(?=[a-z_0-9\\]*[a-z_][a-z0-9_]*\s*\()/
      to %r/(?i)[a-z_][a-z_0-9]*(?=\s*\()/
      include "#namespace"
    end
  end

  fragment :var_basic do
    rule 'variable.other.php' do
      # FIXME: (error) invalid hex escape
      match %r/(?x)
                          (\$+)[a-zA-Z_\x{7f}-\x{ff}]
                          [a-zA-Z0-9_\x{7f}-\x{ff}]*?\b/,
        1 => 'punctuation.definition.variable.php'
    end
  end

  fragment :var_global do
    rule 'variable.other.global.php' do
      match %r/(\$)((_(COOKIE|FILES|GET|POST|REQUEST))|arg(v|c))\b/,
        1 => 'punctuation.definition.variable.php'
    end
  end

  fragment :var_global_safer do
    rule 'variable.other.global.safer.php' do
      match %r/(\$)((GLOBALS|_(ENV|SERVER|SESSION)))/,
        1 => 'punctuation.definition.variable.php'
    end
  end

  fragment :"variable-name" do
    include "#var_global"
    include "#var_global_safer"
    rule do
      # Simple syntax: $foo, $foo[0], $foo[$bar], $foo->bar
      # FIXME: (error) invalid hex escape
      match %r/(?x)
            ((\$)(?<name>[a-zA-Z_\x{7f}-\x{ff}][a-zA-Z0-9_\x{7f}-\x{ff}]*))
            (?:
              (->)(\g<name>)
              |
              (\[)
                (?:(\d+)|((\$)\g<name>)|(\w+))
              (\])
            )?
            /,
        1 => 'variable.other.php',
        2 => 'punctuation.definition.variable.php',
        4 => 'keyword.operator.class.php',
        5 => 'variable.other.property.php',
        6 => 'punctuation.section.array.begin.php',
        7 => 'constant.numeric.index.php',
        8 => 'variable.other.index.php',
        9 => 'punctuation.definition.variable.php',
        10 => 'string.unquoted.index.php',
        11 => 'punctuation.section.array.end.php'
    end
    rule do
      # Simple syntax with braces: "foo${bar}baz"
      # FIXME: (error) invalid hex escape
      match %r/(?x)
            ((\$\{)(?<name>[a-zA-Z_\x{7f}-\x{ff}][a-zA-Z0-9_\x{7f}-\x{ff}]*)(\}))
            /,
        1 => 'variable.other.php',
        2 => 'punctuation.definition.variable.php',
        4 => 'punctuation.definition.variable.php'
    end
  end

  fragment :variables do
    include "#var_global"
    include "#var_global_safer"
    include "#var_basic"
    rule do
      from %r/(\$\{)(?=.*?\})/
      to %r/(\})/
      both 1 => 'punctuation.definition.variable.php'
      include "#language"
    end
  end
end
