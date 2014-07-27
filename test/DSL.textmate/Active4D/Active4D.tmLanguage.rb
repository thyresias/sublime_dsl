# encoding: utf-8

language 'Active4D' => 'source.active4d' do
  # FIXME: no file types
  key_equivalent "^~A"  # TextMate only
  uuid "8C2BF09D-AE95-479B-B516-F8DB62C86A0C"  # TextMate only

  rule do
    from %r/(^[ \t]+)?(?=`)/,
      1 => 'punctuation.whitespace.comment.leading.active4d'
    to %r/(?!\G)/
    rule 'comment.line.backtick.active4d' do
      from %r/`/,
        0 => 'punctuation.definition.comment.active4d'
      to %r/\n|(?=%>)/
    end
  end
  rule do
    from %r'(^[ \t]+)?(?=//)',
      1 => 'punctuation.whitespace.comment.leading.active4d'
    to %r/(?!\G)/
    rule 'comment.line.double-slash.active4d' do
      from %r'//',
        0 => 'punctuation.definition.comment.active4d'
      to %r/\n|(?=%>)/
    end
  end
  rule do
    from %r/(^[ \t]+)?(?=\\\\)/,
      1 => 'punctuation.whitespace.comment.leading.active4d'
    to %r/(?!\G)/
    rule 'comment.line.double-backslash.continuation.active4d' do
      from %r/\\\\/,
        0 => 'punctuation.definition.comment.active4d'
      to %r/\n/
    end
  end
  rule 'comment.block.active4d' do
    from %r'/\*'
    to %r'\*/'
    both 0 => 'punctuation.definition.comment.active4d'
    include "#fusedoc"
  end
  rule 'string.quoted.double.active4d' do
    from %r/"(?!"")/,
      0 => 'punctuation.definition.string.begin.active4d'
    to %r/"/,
      0 => 'punctuation.definition.string.end.active4d'
    include "#escaped_char"
  end
  rule 'string.quoted.triple.heredoc.active4d' do
    from %r/"""/,
      0 => 'punctuation.definition.string.begin.active4d'
    to %r/"""/,
      0 => 'punctuation.definition.string.end.active4d'
    include "#escaped_char"
  end
  rule 'string.interpolated.quoted.single.active4d' do
    from %r/'(?!'')/,
      0 => 'punctuation.definition.string.begin.active4d'
    to %r/'/,
      0 => 'punctuation.definition.string.end.active4d'
    include "#interpolated_string"
  end
  rule 'string.interpolated.quoted.triple.heredoc.active4d' do
    from %r/'''/,
      0 => 'punctuation.definition.string.begin.active4d'
    to %r/'''/,
      0 => 'punctuation.definition.string.end.active4d'
    include "#interpolated_string"
  end
  rule 'constant.numeric.active4d' do
    match %r/(?<![[:alpha:]])[\-]?(?:0x[[:xdigit:]]{1,4}|\d+(\.\d+)?)(?![[:alpha:]])/
  end
  rule 'constant.language.boolean.active4d' do
    match %r/\b(?i)(true|false)\b/
  end
  rule 'variable.other.local.active4d' do
    # FIXME: (warning) character class has duplicated range
    match %r/(\$)[\w_]+/,
      1 => 'punctuation.definition.variable.active4d'
  end
  rule 'variable.other.interprocess.active4d' do
    # FIXME: (warning) character class has duplicated range
    match %r/(\<\>)[\w_]+/,
      1 => 'punctuation.definition.variable.active4d'
  end
  rule 'variable.other.table-field.active4d' do
    # FIXME: (warning) character class has duplicated range
    match %r/(\[)[^\[].*?(\])([\w_ ]+)?/,
      1 => 'punctuation.definition.variable.active4d',
      2 => 'punctuation.definition.variable.active4d'
  end
  rule 'constant.other.date.active4d' do
    match %r'(!)\d{1,2}[/ \-]\d{1,2}[/ \-]\d{1,4}(!)',
      1 => 'punctuation.definition.constant.active4d',
      2 => 'punctuation.definition.constant.active4d'
  end
  rule 'constant.other.time.active4d' do
    match %r/(\?)\d{1,2}[: ]\d{1,2}[: ]\d{1,2}(\?)/,
      1 => 'punctuation.definition.constant.active4d',
      2 => 'punctuation.definition.constant.active4d'
  end
  rule 'support.constant.active4d' do
    match %r/(?i)\b(Write Mode|UTF8 Text without length|UTF8 Text with length|UTF8 C string|Text without length|Text array|System date short|System date long|System date abbreviated|String array|Short|Real array|Read Mode|Read and Write|position from start|position from end|position from current|Pointer array|Picture array|No current record|New record|native byte ordering|Month Day Year|MM DD YYYY Forced|MM DD YYYY|MAXTEXTLEN|MAXLONG|Mac text without length|Mac text with length|Longint array|Long|little endian byte ordering|Line feed|Is Undefined|Is Time|Is Text|Is String Var|Is Real|Is Pointer|Is Picture|Is Longint|Is Integer|Is Date|Is Boolean|Is BLOB|Is Alpha Field|is a document|is a directory|Into variable|Into set|Into named selection|Into current selection|Integer array|Hour Min Sec|Hour Min|HH MM SS|HH MM AM PM|HH MM|Get Pathname|Date array|Carriage return|Boolean array|big endian byte ordering|Array 2D|Abbreviated|Abbr Month Day|A4D Parameter Mode Separate|A4D Parameter Mode Query|A4D Parameter Mode Form|A4D License Type OEM|A4D License Type Deployment|A4D Encoding Tags|A4D Encoding Quotes|A4D Encoding None|A4D Encoding HTML|A4D Encoding Extended|A4D Encoding Ampersand|A4D Encoding All|A4D Charset Win|A4D Charset UTF8|A4D Charset Shift_JIS|A4D Charset None|A4D Charset Mac|A4D Charset ISO Latin1|A4D Charset GB2312)\b/
  end
  rule 'support.function.active4d' do
    # 4D and Active4D commands
    match %r/(?i)\b(_request|_query|_form|Year of|writep|writeln|writebr|write to console|write raw|write png|WRITE PICTURE FILE|write jpg|write jpeg|write gif|write blob|write|Win to Mac|week of year|variable name|VALIDATE TRANSACTION|utf to mac|utc to local time|utc to local datetime|USE SET|USE NAMED SELECTION|url to native path|url encode query|url encode path|url encode|url decode query|url decode path|url decode|Uppercase|unlock globals|UNLOAD RECORD|UNION|Undefined|type descriptor|Type|Trunc|True|trim|timestamp year|timestamp time|timestamp string|timestamp second|timestamp month|timestamp minute|timestamp millisecond|timestamp hour|timestamp difference|timestamp day|timestamp date|timestamp|time to longint|Time string|Time|Tickcount|throw|TEXT TO BLOB|Test semaphore|Test path name|Table name|Table|Substring|Structure file|STRING LIST TO ARRAY|String|START TRANSACTION|split string|SORT ARRAY|slice string|Size of array|set session timeout|set session array|set session|set script timeout|set response status|set response header|set response cookie path|set response cookie expires|set response cookie domain|set response cookie|set response buffer|SET QUERY LIMIT|SET QUERY DESTINATION|set platform charset|set output encoding|set output charset|set log level|set local|set global array|set global|set expires date|set expires|set error page|SET DOCUMENT POSITION|SET DEFAULT CENTURY|set current script timeout|set content type|set content charset|set collection array|set collection|set cache control|SET BLOB SIZE|SET AUTOMATIC RELATIONS|set array|session to blob|session query|session local|session internal id|session id|session has|session|Sequence number|SEND PACKET|Semaphore|SELECTION TO ARRAY|SELECTION RANGE TO ARRAY|Selected record number|SCAN INDEX|save upload to field|SAVE RECORD|save output|save collection|Round|right trim|response headers|response cookies|response buffer size|RESOLVE POINTER|resize array|require|requested url|request query|request info|request cookies|Replace string|REMOVE FROM SET|RELATE ONE SELECTION|RELATE ONE|RELATE MANY SELECTION|RELATE MANY|regex split|regex replace|regex quote pattern|regex match all|regex match|regex find in array|regex find all in array|regex callback replace|REDUCE SELECTION|redirect|Records in table|Records in set|Records in selection|Record number|RECEIVE PACKET|READ WRITE|READ PICTURE FILE|Read only state|READ ONLY|random between|Random|QUERY WITH ARRAY|QUERY SELECTION BY FORMULA|QUERY SELECTION|query params has|query params|QUERY BY FORMULA|QUERY|PREVIOUS RECORD|Position|Picture size|PICTURE PROPERTIES|parameter mode|param text|ORDER BY FORMULA|ORDER BY|Open document|ONE RECORD SELECT|Num|Not|nil pointer|Nil|NEXT RECORD|next item|new local collection|new global collection|new collection|native to url path|multisort named arrays|multisort arrays|MOVE DOCUMENT|more items|Month of|min of|Milliseconds|method exists|merge collections|md5 sum|max of|Mac to Win|mac to utf8|Mac to ISO|mac to html|Lowercase|longint to time|longint to blob|log message|Locked|lock globals|local variables|local time to utc|local datetime to utc|LOAD RECORD|load collection|LIST TO ARRAY|library list|Length|left trim|LAST RECORD|last of|last not of|join paths|join array|ISO to Mac|is table number valid|Is in set|is field number valid|is array|is an iterator|is a collection|INTERSECTION|interpolate string|Int|insert string|insert into array|INSERT ELEMENT|include into|include|in error|import|identical strings|html encode|hide session field|GOTO SELECTED RECORD|GOTO RECORD|globals has|globals|global|get version|get utc delta|get upload size|get upload remote filename|get upload extension|get upload encoding|get upload content type|get timestamp datetime|get time remaining|get session timeout|get session stats|get session names|get session item|get session array size|get session array|get session|get script timeout|get root|get response headers|get response header|get response cookies|get response cookie path|get response cookie expires|get response cookie domain|get response cookie|get response buffer|get request value|get request infos|get request info|get request cookies|get request cookie|get query params|get query param count|get query param choices|get query param|Get pointer|get platform charset|GET PICTURE FROM LIBRARY|get output encoding|get output charset|get log level|get local|get license info|get library list|get last table number|get last field number|get item value|get item type|get item key|get item array|Get indexed string|get global keys|get global item|get global array size|get global array|get global|get form variables|get form variable count|get form variable choices|get form variable|GET FIELD PROPERTIES|get field pointer|get field numbers|get expires date|get expires|get error page|Get document position|get current script timeout|get content type|get content charset|get collection keys|get collection item count|get collection item|get collection array size|get collection array|get collection|get call chain|get cache control|get auto relations|full requested url|form variables has|form variables|FOLDER LIST|FIRST RECORD|first of|first not of|Find index key|Find in array|fill array|filename of|file exists|Field name|Field|False|extension of|execute in 4d|EXECUTE|End selection|end save output|enclose|DOCUMENT TO BLOB|DOCUMENT LIST|DISTINCT VALUES|directory separator|directory of|directory exists|DIFFERENCE|Delete string|delete session item|DELETE SELECTION|delete response header|delete response cookie|DELETE RECORD|delete global|DELETE FOLDER|DELETE ELEMENT|DELETE DOCUMENT|delete collection item|DELAY PROCESS|defined|define|default directory|deep copy collection|deep clear collection|Dec|day of year|Day of|Day number|Date|C_TIME|C_TEXT|C_STRING|C_REAL|C_POINTER|C_PICTURE|C_LONGINT|C_DATE|C_BOOLEAN|C_BLOB|CUT NAMED SELECTION|Current time|current realm|Current process|current platform|current path|Current method name|current line number|current library name|current file|Current date|CREATE SET FROM ARRAY|CREATE SET|CREATE SELECTION FROM ARRAY|CREATE RECORD|CREATE FOLDER|CREATE EMPTY SET|Create document|count uploads|Count tables|count session items|count response headers|count response cookies|count request infos|count request cookies|count query params|Count in array|count globals|count form variables|Count fields|count collection items|copy upload|COPY SET|COPY NAMED SELECTION|COPY DOCUMENT|copy collection|COPY ARRAY|concat|compare strings|collection to blob|collection has|collection|CLOSE DOCUMENT|CLEAR VARIABLE|CLEAR SET|CLEAR SEMAPHORE|clear response buffer|CLEAR NAMED SELECTION|clear collection|clear buffer (deprecated)|clear array|choose|Character code|Char|cell|capitalize|CANCEL TRANSACTION|call method|call 4d method|build query string|blowfish encrypt|blowfish decrypt|BLOB to text|blob to session|blob to longint|BLOB TO DOCUMENT|blob to collection|BLOB size|Before selection|base64 encode|base64 decode|AUTOMATIC RELATIONS|auto relate|authenticate|auth user|auth type|auth password|Ascii|ARRAY TEXT|ARRAY STRING|ARRAY REAL|ARRAY POINTER|ARRAY PICTURE|ARRAY LONGINT|ARRAY INTEGER|ARRAY DATE|ARRAY BOOLEAN|append to array|Append document|ALL RECORDS|add to timestamp|ADD TO SET|Add to date|add element|Abs|abandon session|abandon response cookie)\b/
  end
  rule 'support.function.active4d' do
    # library methods
    match %r/(?i)\b((yearMonthDay|writeDumpStyles|writeBold|write|warnInvalidField|valueList|valueCountNoCase|valueCount|validPrice|validEmailAddress|validateTextFields|unlockAndLoad|truncateText|toJSON|timedOut|startObject|startArray|sourceRowCount|sort|setTitle|setTimeout|setSMTPHost|setSMTPAuthorization|setSeparator|setRelateOne|setMailMethod|setDivId|setDefaults|setColumnData|setColumnArray|setAt|sendMail|sendFuseaction|saveFormToSession|rowCount|reverseArray|rest|qualify|previous|prepend|postHandleError|persistent|ordinalOf|nextID|next|newFromSelection|newFromRowSet|newFromFile|newFromData|newFromCachedSelection|newFromArrays|newFromArray|new|move|maxRows|makeURL|makeSafeMailto|makeLinks|makeFuseboxLinks|listToArray|len|last|isLast|isFuseboxRequest|isFirst|isBeforeFirst|isAfterLast|insertAt|hideUniqueField|hideField|handleError|gotoRow|getVariablesIterator|getUniqueID|getTitle|getTimeout|getStarts|getStart|getSMTPHost|getSMTPAuthUser|getSMTPAuthPassword|getSMTPAuthorization|getRow|getPointerReferent|getPictureDescriptor|getPersistentList|getMonthName|getMailMethod|getEnd|getEmptyFields|getDefaults|getDayName|getData|getColumnSource|getColumn|getAt|fuseboxNew|formVariableListToQuery|formatUSPhone|first|findRow|findNoCase|findColumn|find|filterCollection|endObject|endArray|encodeString|encodeDate|encodeCollection|encodeBoolean|encodeArray|encode|embedVariables|embedQueryParams|embedFormVariables|embedFormVariableList|embedCollectionItems|embedCollection|dumpPersistent|dumpLib|dumpDefaults|dump session stats|dump session|dump selection|dump RowSet|dump request info|dump request|dump query params|dump locals|dump license info|dump form variables|dump collection|dump array|dump|deleteSelection|deleteAt|currentRow|core|containsNoCase|contains|columnCount|collectionToQuery|collectionItemsToQuery|clearPersistent|chopText|checkSession|checkboxState|changeDelims|camelCaseText|buildSelectValueMenu|buildSelectMenu|buildRecordList|buildOptionsFromSelection|buildOptionsFromRowSet|buildOptionsFromOptionList|buildOptionsFromOptionArray|buildOptionsFromLists|buildOptionsFromArrays|buildArrayValueList|buildArrayList|beforeFirst|articleFor|arrayToList|append|afterLast|addSelection|addRowSet|addMetaTag|addJS|addJavascript|addDumpStyles|addCSS|addArray|add))\b/
  end
  rule 'support.variable.active4d' do
    match %r/(?i)\b(OK|Document|fusebox\.conf\.fuseaction|Error)\b/
  end
  rule do
    match %r/(?<!\$)\b((?:a4d\.(?:console|debug|lists|utils|web|json)|Batch|Breadcrumbs|fusebox\.conf|fusebox\.head|fusebox|RowSet))\.([[:alpha:]][[[:alnum:]]_ ]+[[:alnum:]])/,
      1 => 'support.class.active4d',
      2 => 'support.function.active4d'
  end
  rule 'meta.function.active4d' do
    # method definition without parameters
    match %r/^\s*(method)\s*("[^"]+")(?!\s*\()/,
      1 => 'keyword.other.active4d',
      2 => 'entity.name.function.active4d'
  end
  rule 'meta.function.active4d' do
    # method definition with parameters
    from %r/^\s*(method)\s*((")[^"]+("))\s*(\()/,
      1 => 'keyword.other.active4d',
      2 => 'entity.name.function.active4d',
      3 => 'punctuation.definition.entity.active4d',
      4 => 'punctuation.definition.entity.active4d',
      5 => 'punctuation.definition.parameters.active4d'
    to %r'(\))\s*(?:(?:\\\\|//|`).*)?$',
      1 => 'punctuation.definition.parameters.active4d'
    rule 'variable.parameter.function.active4d' do
      # FIXME: (warning) character class has duplicated range
      match %r/(&)?(\$)[\w_]+(;)?/,
        1 => 'keyword.operator.active4d',
        2 => 'punctuation.definition.variable.active4d',
        3 => 'punctuation.separator.parameters.active4d'
    end
    rule do
      from %r/(=)/,
        1 => 'punctuation.separator.key-value.active4d'
      to %r/(;)|(?=\))/,
        1 => 'punctuation.separator.parameters.active4d'
      include "$self"
    end
  end
  rule 'keyword.operator.active4d' do
    match %r'(?x) (
        :=
      |  \+=  
      |  \-=  
      |  /=  
      |  \\=  
      |  \*=  
      |  \%=  
      |  \^=  
      |  &=  
      |  \|=  
      |  <<=  
      |  >>=  
      |  >  
      |  <  
      |  >=  
      |  <=  
      |  =  
      |  =~  
      |  \#  
      |  \#~  
      |  ~  
      |  !~  
      |  \+
      |  \+\+  
      |  \-  
      |  \-\-  
      |  /  
      |  \\  
      |  \*
      |  \*\+
      |  \*/
      |  %  
      |  &  
      |  \|  
      |  \^  
      |  \^\|  
      |  <<
      |  >>
      |  \?\+
      |  \?\-
      |  \?\?
      |  \}
      |  \{
      |  ;
      |  \:
      |  \]\]
      |  \[\[
      |  \->)'
  end
  rule 'keyword.control.active4d' do
    match %r/\b(?i)(end (if|for each|for|while|case)|if|else|while|for each|for|case of|repeat|until|break|continue)\b/
  end
  rule 'keyword.other.active4d' do
    match %r/\b(?i)(end method|method|define|return|exit|self|import|require|global|throw)\b/
  end

  fragment :escaped_char do
    rule 'constant.character.escape.active4d' do
      match %r/\\./
    end
  end

  fragment :escaped_interpolated_code do
    rule 'string.interpolated.escaped.active4d' do
      from %r/\\`/
      to %r/`/
    end
  end

  fragment :escaped_interpolated_collection_ref do
    rule 'string.interpolated.escaped.active4d' do
      # FIXME: (warning) character class has duplicated range
      match %r/\\(_form|_query|_request|globals|session)({(".+?"|\d+|\$[\w_]+)})+(\[\[\d+\]\])*/
    end
  end

  fragment :escaped_interpolated_table_field do
    rule 'string.interpolated.escaped.active4d' do
      # FIXME: (warning) character class has duplicated range
      match %r/\\\[\w[\w_ ]*\][\w_]+(\[\[\d+\]\])*/
    end
  end

  fragment :escaped_interpolated_variable do
    rule 'string.interpolated.escaped.active4d' do
      # FIXME: (warning) character class has duplicated range
      match %r/\\\$[\w_]+({(".+?"|\d+|\$[\w_]+)})*(\[\[\d+\]\])*/,
        1 => 'punctuation.definition.variable.active4d'
    end
  end

  fragment :fusedoc do
    rule 'text.xml' do
      from %r/(?=^\s*<fusedoc )/
      to %r'(?<=</fusedoc>)'
      include "text.xml"
    end
  end

  fragment :interpolated_code do
    rule 'source.interpolated.active4d' do
      from %r/`/,
        0 => 'punctuation.definition.string.begin.active4d'
      to %r/`/,
        0 => 'punctuation.definition.string.end.active4d'
      include "$self"
    end
  end

  fragment :interpolated_collection_ref do
    rule 'variable.other.interpolated.collection-ref.active4d' do
      # FIXME: (warning) character class has duplicated range
      match %r/(_form|_query|_request|globals|session)({(".+?"|\d+|\$[\w_]+)})+(\[\[\d+\]\])*/
    end
  end

  fragment :interpolated_string do
    include "#escaped_interpolated_code"
    include "#interpolated_code"
    include "#escaped_interpolated_table_field"
    include "#interpolated_table_field"
    include "#escaped_interpolated_variable"
    include "#interpolated_variable"
    include "#escaped_interpolated_collection_ref"
    include "#interpolated_collection_ref"
  end

  fragment :interpolated_table_field do
    rule 'variable.other.interpolated.table-field.active4d' do
      # FIXME: (warning) character class has duplicated range
      match %r/\[\w[\w_ ]*\][\w_]+(\[\[\d+\]\])*/
    end
  end

  fragment :interpolated_variable do
    rule 'variable.other.interpolated.local.active4d' do
      # FIXME: (warning) character class has duplicated range
      match %r/(\$)[\w_]+({(".+?"|\d+|\$[\w_]+)})*(\[\[\d+\]\])*/,
        1 => 'punctuation.definition.variable.active4d'
    end
  end
end
