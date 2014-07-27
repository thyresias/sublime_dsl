# encoding: utf-8

snippets do

  default_scope 'text.html.cfm'
  file_format :textmate

  key "^F", 'form variable', <<-'TXT', uuid: '0CA09D51-8DE8-48A0-A178-02D7D8285802'
#${1:trim}(form.$2)#
TXT

  key "^I", 'isDefined', <<-'TXT', uuid: '59075941-A690-46FC-BFA6-58B81E1B18B0'
isDefined("$1")$2
TXT

  key "^U", 'url variable', <<-'TXT', uuid: '1519328F-1308-4DC8-9E71-2B7473F9080F'
#${1:trim}(url.$2)#
TXT

  tab 'abs', 'abs', <<-'TXT', uuid: '2DD711BA-8C2D-4AF4-85C2-C42733743D0A'
Abs(${1:number})$0
TXT

  tab 'acos', 'acos', <<-'TXT', uuid: '5C998560-6284-4F59-A6F9-420962E130E2'
ACos(${1:number})$0
TXT

  tab 'addsoaprequestheader', 'addsoaprequestheader', <<-'TXT', uuid: '5DBF4A9D-7C3E-4FAD-B6DE-16AB145F081B'
AddSOAPRequestHeader(${1:webservice}, ${2:namespace}, ${3:name}, ${4:value} ${5:[, mustunderstand]})$0
TXT

  tab 'addsoapresponseheader', 'addsoapresponseheader', <<-'TXT', uuid: 'C3F1BC8E-892F-4FB5-8A63-F8225B42CCFC'
AddSOAPResponseHeader(${1:namespace}, ${2:name}, ${3:value} ${4:[, mustunderstand]})$0
TXT

  tab 'arrayappend', 'arrayappend', <<-'TXT', uuid: '3B7767FB-E117-4543-B27C-C178D5F451DF'
ArrayAppend(${1:array}, ${2:value})$0
TXT

  tab 'arrayavg', 'arrayavg', <<-'TXT', uuid: '618D41F8-8A13-42B6-9000-551AA2DF9FA3'
ArrayAvg(${1:array})$0
TXT

  tab 'arrayclear', 'arraycear', <<-'TXT', uuid: 'ACB55DF1-EE3F-4B20-A3CA-3DC63018212B'
ArrayClear(${1:array})$0
TXT

  tab 'arraydeleteat', 'arraydeleteat', <<-'TXT', uuid: '466D3581-0875-4E99-952A-0650CB84D33D'
ArrayDeleteAt(${1:array}, ${2:position})$0
TXT

  tab 'arrayinsertat', 'arrayinsertat', <<-'TXT', uuid: '17CFEC94-0BF5-40CD-97DD-79A2CAECB041'
ArrayInsertAt(${1:array}, ${2:position}, ${3:value})$0
TXT

  tab 'arrayisempty', 'arrayisempty', <<-'TXT', uuid: '5C46558A-599C-427F-8A7E-0343F1BED079'
ArrayIsEmpty(${1:array})$0
TXT

  tab 'arraylen', 'arraylen', <<-'TXT', uuid: 'D2675FE6-79EF-40C6-A864-A5C6F092BA4C'
ArrayLen(${1:array})$0
TXT

  tab 'arraymax', 'arraymax', <<-'TXT', uuid: 'D61CD41D-9838-4169-A754-424345AC4601'
ArrayMax(${1:array})$0
TXT

  tab 'arraymin', 'arraymin', <<-'TXT', uuid: '4C31384B-2B27-4C39-B2BB-CC2CA57B659A'
ArrayMin(${1:array})$0
TXT

  tab 'arraynew', 'arraynew', <<-'TXT', uuid: '02261555-8147-43DF-9D49-AEE4F58E1619'
ArrayNew(${1:dimension})$0
TXT

  tab 'arrayprepend', 'arrayprepend', <<-'TXT', uuid: '3757F0B8-F3B0-4272-9F6E-8968CE670387'
ArrayPrepend(${1:array}, ${2:value})$0
TXT

  tab 'arrayresize', 'arrayresize', <<-'TXT', uuid: '3514ADDF-C60D-4A16-9346-11EB7A2AA61A'
ArrayResize(${1:array}, ${2:minimum_size})$0
TXT

  tab 'arrayset', 'arrayset', <<-'TXT', uuid: '90E0EBD1-EC9F-425B-ACC3-06EFAB5F1F69'
ArraySet(${1:array}, ${2:start_pos}, ${3:end_pos}, ${4:value})$0
TXT

  tab 'arraysort', 'arraysort', <<-'TXT', uuid: '41ED9831-365B-4D4F-AF8D-2864343E271F'
ArraySort(${1:array}, ${2:sort_type} ${3:[, sort_order ]})$0
TXT

  tab 'arraysum', 'arraysum', <<-'TXT', uuid: '696A8BD3-EF4F-4A4C-A264-93BE6781D657'
ArraySum(${1:array})$0
TXT

  tab 'arrayswap', 'arrayswap', <<-'TXT', uuid: '40051E46-ECE8-4A07-B600-934A3B482EFC'
ArraySwap(${1:array}, ${2:position1}, ${3:position2})$0
TXT

  tab 'arraytolist', 'arraytolist', <<-'TXT', uuid: '2016AF2A-1AC1-45A8-BCA0-A52F23142863'
ArrayToList(${1:array} ${2:[, delimiter ]})$0
TXT

  tab 'asc', 'asc', <<-'TXT', uuid: 'FD148128-FF2A-4CFE-99F6-FF43653FE8EA'
Asc(${1:string})$0
TXT

  tab 'asin', 'asin', <<-'TXT', uuid: '6C79157D-36F9-4F91-B012-BDD27622FF9B'
ASin(${1:number})$0
TXT

  tab 'atn', 'atn', <<-'TXT', uuid: 'E45A3C54-88D7-4E4A-8092-56854FE825BE'
Atn(${1:number})$0
TXT

  tab 'binarydecode', 'binarydecode', <<-'TXT', uuid: '49443738-7978-4865-A1AC-7358A0BEE2DE'
BinaryDecode(${1:string}, ${2:binaryencoding})$0
TXT

  tab 'binaryencode', 'binaryencode', <<-'TXT', uuid: 'C17555B3-A84A-404B-AECA-3F11CA9ABF0D'
BinaryEncode(${1:binarydata}, ${2:encoding})$0
TXT

  tab 'bitand', 'bitand', <<-'TXT', uuid: '22ECD416-BC42-4C13-8BAF-F435A144A56E'
BitAnd(${1:number1}, ${2:number2})$0
TXT

  tab 'bitmaskclear', 'bitmaskclear', <<-'TXT', uuid: 'E0363D86-A148-44D2-9AF9-45A2A57D1676'
BitMaskClear(${1:number}, ${2:start}, ${3:length})$0
TXT

  tab 'bitmaskread', 'bitmaskread', <<-'TXT', uuid: '9992024A-E07D-4E29-9B35-F85038E890AF'
BitMaskRead(${1:number}, ${2:start}, ${3:length})$0
TXT

  tab 'bitmaskset', 'bitmaskset', <<-'TXT', uuid: '23E6B8AA-CA8F-4CCC-BC29-76A027849595'
BitMaskSet(${1:number}, ${2:mask}, ${3:start}, ${4:length})$0
TXT

  tab 'bitnot', 'bitnot', <<-'TXT', uuid: '28FE5A03-F962-4ECE-AF92-EE3436D20664'
BitNot(${1:number})$0
TXT

  tab 'bitor', 'bitor', <<-'TXT', uuid: '0D55F7C2-16A2-4B78-B390-EF780FF0F2EC'
BitOr(${1:number1}, ${2:number2})$0
TXT

  tab 'bitshln', 'bitshln', <<-'TXT', uuid: 'D9676E4C-3E0A-4886-8F2A-03E25DB4D44C'
BitSHLN(${1:number}, ${2:count})$0
TXT

  tab 'bitshrn', 'bitshrn', <<-'TXT', uuid: '2C83D486-C0A5-4493-8562-BEA824BAD2D7'
BitSHRN(${1:number}, ${2:count})$0
TXT

  tab 'bitxor', 'bitxor', <<-'TXT', uuid: '817F3C02-47AD-4553-9DE2-BDB0EC97BC9F'
BitXor(${1:number1}, ${2:number2})$0
TXT

  tab 'ceiling', 'ceiling', <<-'TXT', uuid: 'FEF3A4E6-7B4E-47B6-A529-ED41EDA41002'
BitXor(${1:number1}, ${2:number2})$0
TXT

  tab 'cfabort', 'cfabort', <<-'TXT', uuid: '0AF4E3E4-8638-4EAD-B182-A4FE571E9974'
<cfabort showerror="$1">$0
TXT

  tab 'cfapplet', 'cfapplet', "<cfapplet appletSource = \"$1\" name = \"$2\"${3: height = \"${4:[ ]}\" width = \"${5:[ ]}\" vSpace = \"${6:[ ]}\" hSpace = \"${7:[ ]}\" align = \"${8:[ ]}\" notSupported = \"${9:[ ]}\" param_1 = \"${10:[ ]}\" param_2 = \"${11:[ ]}\" param_n = \"${12:[ ]}\"}>$0\t", uuid: '38EB1CC2-4A1A-4C37-9D69-19D81129C5DC'

  tab 'cfapplication', 'cfapplication', "<cfapplication\n\tname = \"$1\"${2: \n\tloginStorage = \"$3\"\n\tclientManagement = \"$4\"\n\tclientStorage = \"$5\" \n\tsetClientCookies = \"$6\"\n\tsessionManagement = \"$7\"\n\tsessionTimeout = #CreateTimeSpan(${8:days}, ${9:hours}, ${10:minutes}, ${11:seconds})#\n\tapplicationTimeout =  #CreateTimeSpan(${12:days}, ${13:hours}, ${14:minutes}, ${15:seconds})#\n\tsetDomainCookies = \"$16\"}>$0", uuid: '157C15A0-D535-4EAB-8173-6D6EB0906173'

  tab 'cfargument', 'cfargument', <<-'TXT', uuid: '8AE48664-E323-4DF9-BED2-CE700CAC7C15'
<cfargument name="$1"${2: type="${3:[ ]}" required="${4:[ ]}" default="${5:[ ]}" displayname="${6:[ ]}" hint="${7:[ ]}"}>$0
TXT

  tab 'cfassociate', 'cfassociate', <<-'TXT', uuid: 'E0D7DCCA-9801-4DD5-9C26-3B607BEF7135'
<cfassociate${1: baseTag = "${2:[ ]}" dataCollection = "${3:[ ]}"}>$0
TXT

  tab 'cfbreak', 'cfbreak', <<-'TXT', uuid: '241129A8-4AF3-4005-B276-6F431B5CB3F2'
<cfbreak>
TXT

  tab 'cfcache', 'cfcache', <<-'TXT', uuid: '08392E18-5D55-41CB-BE64-7B091492E7BF'
<cfcache action = "${2:[ ]}" directory = "${2:[ ]}" timespan = "${2:[ ]}" expireURL = "${2:[ ]}" username = "${2:[ ]}" password = "${2:[ ]}" port = "" protocol = "${2:[ ]}">
TXT

  tab 'cfcalendar', 'cfcalendar', <<-'TXT', uuid: '9AEFE392-91BE-4968-8FF8-8A2C9D51D4CC'
<cfcalendar name = "$1"${2: height = "${3:[ ]}" width = "${4:[ ]}" selectedDate = "${5:[ ]}" startRange = "${6:[ ]}" endRange = "${7:[ ]}" disabled = "${8:[ ]}" mask = "${9:[ ]}" dayNames = "${10:[ ]}" monthNames = "${11:[ ]}" style="${12:[ ]}" enabled = "${13:[ ]}" visible = "${14:[ ]}" tooltip = "${15:[ ]}" onChange = "${16:[ ]}" onBlur = "${17:[ ]}" onFocus = "${18:[ ]}"}>$0
TXT

  tab 'cfcase', 'cfcase', <<-'TXT', uuid: '67423190-2729-4C30-B10D-51B7DC3FAB85'
<cfcase value = "$1"${2: delimiters = "${3:[ ]}"}>$4</cfcase>$0
TXT

  tab 'cfcatch', 'cfcatch', <<-'TXT', uuid: '1B072993-0FFD-44B7-8C6D-3F9D60AF9E7B'
<cfcatch type = "$1">
	$2
</cfcatch>$0
TXT

  tab 'cfchart', 'cfchart', <<-'TXT', uuid: 'B8817D6A-B326-48F9-9E35-B28778A79412'
<cfchart
	name = "$1"${2:
	backgroundColor = "${3:[ ]}"
	chartHeight = "${4:[ ]}"
	chartWidth = "${5:[ ]}"
	dataBackgroundColor = "${6:[ ]}"
	font = "${7:[ ]}"
	fontBold = "${8:[ ]}"
	fontItalic = "${9:[ ]}"
	fontSize = "${10:[ ]}"
	foregroundColor = "${11:[ ]}"
	format = "${12:[ ]}"
	gridlines = "${13:[ ]}"
	labelFormat = "${14:[ ]}"
	markerSize = "${15:[ ]}"
	pieSliceStyle = "${16:[ ]}"
	scaleFrom = "${17:[ ]}"
	scaleTo = "${18:[ ]}"
	seriesPlacement = "${19:[ ]}"
	show3D = "${20:[ ]}"
	showBorder = "${21:[ ]}"
	showLegend = "${22:[ ]}"
	showMarkers = "${23:[ ]}"
	showXGridlines = "${24:[ ]}"
	showYGridlines = "${25:[ ]}"
	sortXAxis = "${26:[ ]}"
	tipBGColor = "${27:[ ]}"
	tipStyle = "${28:[ ]}"
	title = "${29:[ ]}"
	url = "${30:[ ]}"
	xAxisTitle = "${31:[ ]}"
	xAxisType = "${32:[ ]}"
	xOffset = "${33:[ ]}"
	yAxisTitle = "${34:[ ]}"
	yAxisType = "${35:[ ]}"
	yOffset = "${36:[ ]}"}>
</cfchart>$0
TXT

  tab 'cfchartdata', 'cfchartdata', <<-'TXT', uuid: '0E400696-4C11-4072-9DAD-7BFF6F7789BE'
<cfchartdata item = "$1" value = "$2">$0
TXT

  tab 'cfchartseries', 'cfchartseries', <<-'TXT', uuid: '5A2941B5-2D73-4348-AB92-932665EB6E1D'
<cfchartseries type="$1"${2: colorlist = "${3:[ ]}" itemColumn="${4:[ ]}" markerStyle="${5:[ ]}" paintStyle="${6:[ ]}" query="${7:[ ]}" seriesColor="${8:[ ]}" seriesLabel="${9:[ ]}" valueColumn="${10:[ ]}" dataLabelStyle="${11:[ ]}"}>
	$12
</cfchartseries>$0
TXT

  tab 'cfcol', 'cfcol', <<-'TXT', uuid: '902C51B4-E4E3-4B2C-BA03-769FC6AC0867'
<cfcol header = "$1" text = "$2"${3: width = "${4:[ ]}" align = "${5:[ ]}"}>$0


TXT

  tab 'cfcollection', 'cfcollection', <<-'TXT', uuid: '5CF87863-EBA1-49BE-AB51-016A2D0FDA80'
<cfcollection action = "$1"${2: collection = "${3:[ ]}" path = "${4:[ ]}" language = "${5:[ ]}" name = "${6:[ ]}" categories = "${7:[ ]}" or "${8:[ ]}"}>$0
TXT

  tab 'cfcomponent', 'cfcomponent', <<-'TXT', uuid: 'A72AC858-A593-4758-894F-266F9925990D'
<cfcomponent${1: extends ="${2:[ ]}" output = "${3:[ ]}" style = "${4:[ ]}" namespace = "${5:[ ]}" serviceportname = "${6:[ ]}" porttypename = "${7:[ ]}" bindingname = "${8:[ ]}" wsdlfile = "${9:[ ]}" displayname = "${10:[ ]}" hint = "${11:[ ]}"}>
	$12
</cfcomponent>$0
TXT

  tab 'cfcontent', 'cfcontent', <<-'TXT', uuid: '6E59F119-65E3-4D1F-B393-121208A9A83F'
<cfcontent type = "${1:[ ]}" deleteFile = "${2:[ ]}" file = "${3:[ ]}" variable = "${4:[ ]}" reset = "${5:[ ]}">$0
TXT

  tab 'cfcookie', 'cfcookie', <<-'TXT', uuid: '90B1EE50-DAC5-4748-8415-5C3ABB38CFD5'
<cfcookie name = "$1"${2: value = "${3:[ ]}" expires = "${4:[ ]}" secure = "${5:[ ]}" path = "${6:[ ]}" domain = "${7:[ ]}"}>$0
TXT

  tab 'cfdirectory', 'cfdirectory', <<-'TXT', uuid: '784AAEB3-2367-4275-95E0-DFDBE61E9423'
<cfdirectory directory = "$1" action = "${2:[ ]}" name = "${3:[ ]}" filter = "${4:[ ]}" mode = "${5:[ ]}" sort = "${6:[ ]}" newDirectory = "${7:[ ]}" recurse = "${8:[ ]}">$0
TXT

  tab 'cfdocument', 'cfdocument', <<-'TXT', uuid: 'D5310F63-357F-4E8A-9583-26F569D309EB'
<cfdocument format = "$1"${2: backgroundvisible = "${3:[ ]}" encryption = "${4:[ ]}" filename = "${5:[ ]}" fontembed = "${6:[ ]}" marginbottom = "${7:[ ]}" marginleft = "${8:[ ]}" marginright = "${9:[ ]}" margintop = "${10:[ ]}" mimetype = "${11:[ ]}" name = "${12:[ ]}" orientation = "${13:[ ]}" overwrite = "${14:[ ]}" ownerpassword = "${15:[ ]}" pageheight = "${16:[ ]}" pagetype = "${17:[ ]}" pagewidth = "${18:[ ]}" permissions = "${19:[ ]}" scale = "${20:[ ]}" src = "${21:[ ]}" srcfile = "${22:[ ]}" unit = "${23:[ ]}" userpassword = "${24:[ ]}"}>
	$25
</cfdocument>$0


TXT

  tab 'cfdocumentitem', 'cfdocumentitem', <<-'TXT', uuid: '1ADF5606-9DC3-413F-8BC2-5E54E7BAC4FF'
<cfdocumentitem type = "$1">
	$2
</cfdocumentitem>$0
TXT

  tab 'cfdocumentsection', 'cfdocumentsection', <<-'TXT', uuid: '28364618-9329-4501-98EC-852D28D2F59A'
<cfdocumentsection${1: margintop = "${2:[ ]}" marginbottom = "${3:[ ]}" marginleft = "${4:[ ]}" marginright = "${5:[ ]}" mimetype = "${6:[ ]}" src = "${7:[ ]}" srcfile = "${8:[ ]}"}>
	$9
</cfdocumentsection>$0


TXT

  tab 'cfdump', 'cfdump', <<-'TXT', uuid: 'EA2AA961-32E7-4B4B-85C8-0F458AC6E671'
<cfdump${1: var = "${2:#variable#}" expand = "${3:[ ]}" label = "${4:[ ]}" top = "${5:[ ]}"}>$0
TXT

  tab 'cferror', 'cferror', <<-'TXT', uuid: '5736162D-BDF6-4C94-8F3C-8F4CEB38E349'
<cferror type = "$1" template = "$2"${3: mailTo = "${4:[ ]}" exception = "${5:[ ]}"}>$0
TXT

  tab 'cfexecute', 'cfexecute', <<-'TXT', uuid: 'C6C27604-1D24-4EC3-B40D-BD1FF6196DF8'
<cfexecute name = "$1"${2: arguments = "${3:[ ]}" outputFile = "${4:[ ]}" variable = "${5:[ ]}" timeout = "${6:[ ]}"}>
	$7
</cfexecute>$0
TXT

  tab 'cfexit', 'cfexit', <<-'TXT', uuid: '96D4FDBD-4A7D-42E4-BF7A-AB366E22758B'
<cfexit${1: method = "${2:[ ]}"}>$0
TXT

  tab 'cffile', 'cffile append', <<-'TXT', uuid: 'C8C2C389-AEE0-4CE2-8944-A7EEEFB9B680'
<cffile action = "append" file = "$2"${3: output = "${4:[ ]}" addNewLine = "${5:[ ]}" attributes = "${6:[ ]}" mode = "${7:[ ]}" charset = "${8:[ ]}" fixnewline = "${9:[ ]}"}>$0
TXT

  tab 'cffile', 'cffile copy', <<-'TXT', uuid: '36F4B163-2ACD-48F1-8E72-365E54EB7811'
<cffile action = "copy" source = "$1" destination = "$2"${3:  mode = "${4:[ ]}" attributes = "${5:[ ]}"}>$0
TXT

  tab 'cffile', 'cffile delete', <<-'TXT', uuid: '5D0E9DF4-6631-419C-AEEE-7710EE30502F'
<cffile action = "delete" file = "$1">$0
TXT

  tab 'cffile', 'cffile move', <<-'TXT', uuid: '0A3097F1-36A8-4009-8501-CC5B9349072E'
<cffile action = "move" source = "$1" destination = "$2"${3:  mode = "${4:[ ]}" attributes = "${5:[ ]}" charset = "${6:[ ]}"}>$0
TXT

  tab 'cffile', 'cffile read', <<-'TXT', uuid: 'C28091B5-3245-4E3C-BC49-38AAB093D00F'
<cffile action = "read" file = "$1" variable = "$2"${3: charset = "${4:[ ]}"}>$0
TXT

  tab 'cffile', 'cffile readbinary', <<-'TXT', uuid: '1D9BEE6E-907F-430A-BD62-2DF38A454B3E'
<cffile action = "readbinary" file = "$1" variable = "$2">$0
TXT

  tab 'cffile', 'cffile rename', <<-'TXT', uuid: 'B8DC9CF1-AFF5-44E4-B9A8-42093D829889'
<cffile action = "rename" source = "$1" destination = "$2"${3:  mode = "${4:[ ]}" attributes = "${5:[ ]}"}>$0
TXT

  tab 'cffile', 'cffile upload', <<-'TXT', uuid: 'BEDB5CCC-7FF1-4C78-8169-2B58BFB2C449'
<cffile action = "upload" fileField = "$1" destination = "$2"${3: nameConflict = "${4:[ ]}" accept = "${5:[ ]}" mode = "${6:[ ]}" attributes = "${7:[ ]}" result = "${8:[ ]}"}>$0
TXT

  tab 'cffile', 'cffile write', <<-'TXT', uuid: 'E6EE6F14-372D-469B-B31F-827A54CFC5E3'
<cffile action = "$1" file = "$2" output = "$3"${4: mode = "${5:[ ]}" addNewLine = "${6:[ ]}" attributes = "${7:[ ]}" charset = "${8:[ ]}"  fixnewline = "${9:[ ]}"}>$0
TXT

  tab 'cfflush', 'cfflush', <<-'TXT', uuid: 'DB5DE93A-DA9A-40E9-B469-EF8337A11CBE'
<cfflush${1: interval = "${2:[ ]}"}>$0
TXT

  tab 'cfform', 'cfform', <<-'TXT', uuid: '63B626CD-2818-42F2-BD90-DE112A8DEF7A'
<cfform${1: name = "${2:[ ]}" action = "${3:[ ]}" method = "${4:post}" format = "${5:html}" skin = "${6:[ ]}" style = "${7:[ ]}" preserveData = "${8:[ ]}" onSubmit = "${9:[ ]}" scriptSrc = "${10:[ ]}" codeBase = "${11:[ ]}" archive = "${12:[ ]}" onLoad = "${13:[ ]}" width = "${14:[ ]}" height = "${15:[ ]}" onError = "${16:[ ]}" wMode = "${17:[ ]}" accessible = "${18:[ ]}" preloader = "${19:[ ]}" timeout = "${20:[ ]}" class = "${21:[ ]}" enctype = "${22:[ ]}" id = "${23:[ ]}" onReset = "${24:[ ]}" target = "${25:[ ]}"}>
	$26
</cfform>$0
TXT

  tab 'cfformgroup', 'cfformgroup', <<-'TXT', uuid: '5C3D7157-DFC0-4762-B059-C10F1A098089'
<cfformgroup type = "$1" label = "${2:[ ]}" style = "${3:[ ]}" selectedIndex = "${4:[ ]}" width = "${5:[ ]}" height = "${6:[ ]}" enabled = "${7:[ ]}" visible = "${8:[ ]}" OnChange = "${9:[ ]}" toolTip = "${10:[ ]}" id = "${11:[ ]}">
	$12
</cfformgroup>$0
TXT

  tab 'cfformitem', 'cfformitem', <<-'TXT', uuid: 'BD84E1FB-DCA2-493E-887E-1A1330DD6EA9'
<cfformitem type = "$1"${2: style = "${3:[ ]}" width = "${4:[ ]}" height = "${5:[ ]}" visible = "${6:[ ]}" enabled = "${7:[ ]}" tooltip = "${8:[ ]}" bind = "${9:[ ]}"}>
	$10
</cfformitem>$0
TXT

  tab 'cfftp', 'cfftp', <<-'TXT', uuid: 'CED5A340-3643-4F34-A8ED-A9FB99008300'
<cfftp action = "$1" username = "$2" password = "$3" server = "$4"${5: timeout = "${6:[ ]}" port = "${7:[ ]}" connection = "${8:[ ]}" proxyServer = "${9:[ ]}" retryCount = "${10:[ ]}" stopOnError = "${11:[ ]}" passive = "yes"}>$0
TXT

  tab 'cffunction', 'cffunction', <<-'TXT', uuid: 'AB4A8782-7466-4B5D-A180-96E0BD19C050'
<cffunction name = "$1"${2: returnType = "${3:[ ]}" roles = "${4:[ ]}" access = "${5:[ ]}" description = "${6:[ ]}" = "${7:[ ]}" displayName = "${8:[ ]}" hint = "${9:[ ]}"}>
	$10
</cffunction>$0
TXT

  tab 'cfgrid', 'cfgrid', <<-'TXT', uuid: 'D01E4126-187A-4275-8583-DFA44FE3BB3C'
<cfgrid name = "$1"${2: format = "${3:[ ]}" height = "${4:[ ]}" width = "${5:[ ]}" query = "${6:[ ]}" selectMode = "${7:[ ]}" insert = "${8:[ ]}" delete = "${9:[ ]}" font = "${10:[ ]}" fontSize = "${11:[ ]}" italic = "${12:[ ]}" bold = "${13:[ ]}" textColor = "${14:[ ]}" gridLines = "${15:[ ]}" rowHeight = "${16:[ ]}" colHeaders = "${17:[ ]}" colHeaderFont = "${18:[ ]}" colHeaderFontSize = "${19:[ ]}" colHeaderItalic = "${20:[ ]}" colHeaderBold = "${21:[ ]}" colHeaderTextColor = "${22:[ ]}" bgColor = "${23:[ ]}" maxRows = "${24:[ ]}" style= "${25:[ ]}" enabled = "${26:[ ]}" visible = "${27:[ ]}" toolTip = "${28:[ ]}" onChange = "${29:[ ]}" autoWidth = "${30:[ ]}" vSpace = "${31:[ ]}" hSpace = "${32:[ ]}" align = "${33:[ ]}" sort = "${34:[ ]}" href = "${35:[ ]}" hrefKey = "${36:[ ]}" target = "${37:[ ]}" appendKey = "${38:[ ]}" highlightHref = "${39:[ ]}" onValidate = "${40:[ ]}" onError = "${41:[ ]}" gridDataAlign = "${42:[ ]}" rowHeaders = "${43:[ ]}" rowHeaderAlign = "${44:[ ]}" rowHeaderFont = "${45:[ ]}" rowHeaderFontSize = "${46:[ ]}" rowHeaderItalic = "${47:[ ]}" rowHeaderBold = "${48:[ ]}" rowHeaderTextColor = "${49:[ ]}" colHeaderAlign = "${50:[ ]}" selectColor = "${51:[ ]}" notSupported = "${52:[ ]}" pictureBar = "${53:[ ]}" insertButton = "${54:[ ]}" deleteButton = "${55:[ ]}" sortAscendingButton = "${56:[ ]}" sortDescendingButton = "${57:[ ]}" onBlur = "${58:[ ]}" onFocus = "${59:[ ]}"}>
	$60
</cfgrid>$0
TXT

  tab 'cfgridcolumn', 'cfgridcolumn', <<-'TXT', uuid: 'F9725187-DAE2-43BB-9209-BAF4F709AD72'
<cfgridcolumn name = "$1"${2: header = "${3:[ ]}" width = "${4:[ ]}" type = "${5:[ ]}" display = "${6:[ ]}" select = "${7:[ ]}" font = "${8:[ ]}" fontSize = "${9:[ ]}" italic = "${10:[ ]}" bold = "${11:[ ]}" textColor = "${12:[ ]}" bgColor = "${13:[ ]}" dataAlign = "${14:[ ]}" mask= "${15:[ ]}" href = "${16:[ ]}" hrefKey = "${17:[ ]}" target = "${18:[ ]}" headerFont = "${19:[ ]}" headerFontSize = "${20:[ ]}" headerItalic = "${21:[ ]}" headerBold = "${22:[ ]}" headerTextColor = "${23:[ ]}" headerAlign = "${24:[ ]}" numberFormat = "${25:[ ]}" values = "${26:[ ]}" valuesDisplay = "${27:[ ]}" valuesDelimiter = "${28:[ ]}"}>$0


TXT

  tab 'cfgridrow', 'cfgridrow', <<-'TXT', uuid: 'C83F3775-A62D-425B-B05E-C6A58C929399'
<cfgridrow data = "$1">$0
TXT

  tab 'cfgridupdate', 'cfgridupdate', <<-'TXT', uuid: '6674FAC2-9201-4D0D-BAA5-E35D64BDADDC'
<cfgridupdate grid = "$1" dataSource = "$2" tableName = "$3"${4: username = "${5:[ ]}" password = "${6:[ ]}" tableOwner = "${7:[ ]}" tableQualifier = "${8:[ ]}" keyOnly = "${9:[ ]}"}>$0
TXT

  tab 'cfheader', 'cfheader', <<-'TXT', uuid: 'B2FCBECB-D1E0-4BF4-B046-5A9C4A6475F9'
<cfheader name = "$1"${2: value = "${3:[ ]}" charset="${4:[ ]}"}>$0
TXT

  tab 'cfhtmlhead', 'cfhtmlhead', <<-'TXT', uuid: '29745C05-70EC-418A-A7E1-E60EE6042A95'
<cfhtmlhead text = "$1">$0
TXT

  tab 'cfhttp', 'cfhttp', <<-'TXT', uuid: '53E1E9D3-8F53-4CFE-8ADD-83AC13969D24'
<cfhttp url = "$1"${2: port = "${3:[ ]}" method = "${4:[ ]}" proxyServer = "${5:[ ]}" proxyPort = "${6:[ ]}" proxyUser = "${7:[ ]}" proxyPassword = "${8:[ ]}" username = "${9:[ ]}" password = "${10:[ ]}" userAgent = "${11:[ ]}" charset = "${12:[ ]}" resolveURL = "${13:[ ]}" throwOnError = "${14:[ ]}" redirect = "${15:[ ]}" timeout = "${16:[ ]}" getAsBinary = "${17:[ ]}" multipart = "${18:[ ]}" path = "${19:[ ]}" file = "${20:[ ]}" name = "${21:[ ]}" columns = "${22:[ ]}" firstrowasheaders = "${23:[ ]}" delimiter = "${24:[ ]}" textQualifier = "${25:[ ]}" result = "${26:[ ]}"}>
	$27
</cfhttp>$0
TXT

  tab 'cfhttpparam', 'cfhttpparam', <<-'TXT', uuid: '415DDDAF-1163-49E7-8D5B-3B6CD1A27A06'
<cfhttpparam type = "$1"${2: name = "${3:[ ]}" value = "${4:[ ]}" file = "${5:[ ]}" encoded = "${6:[ ]}" mimeType = "${7:[ ]}"}>$0
TXT

  tab 'cfif', 'cfif', <<-'TXT', uuid: 'E336E487-B1EA-449C-9B32-4C5994136CEA'
<cfif $1>$2</cfif>$0

TXT

  tab 'cfif', 'cfif else', <<-'TXT', uuid: 'A14677C7-FB24-4A35-B9F5-F764C2EFE00E'
<cfif $1>
	$2
<cfelse>
	$3
</cfif>$0
TXT

  tab 'cfif', 'cfif elseif else', <<-'TXT', uuid: 'E1BBA1F0-05C7-4EA0-87BA-FB0FC5D1CAED'
<cfif $1>
	$2
<cfelseif $3>
	$4
<cfelse>
	$5
</cfif>$0
TXT

  tab 'cfimport', 'cfimport', <<-'TXT', uuid: '601BA2FE-EA4D-4B9C-A8EF-646A9E9626DD'
<cfimport taglib = "$1" prefix = "$2">$0
TXT

  tab 'cfinclude', 'cfinclude', <<-'TXT', uuid: 'B14D6A84-2B4D-4FF8-99CB-E2B41B0E00BF'
<cfinclude template = "$1">$0
TXT

  tab 'cfindex', 'cfindex', <<-'TXT', uuid: '2FB6FDE3-F8F0-47A1-AE6D-AA3895A489CD'
<cfindex collection = "$1" action = "$2"${3: type = "${4:[ ]}" title = "${5:[ ]}" key = "${6:[ ]}" body = "${7:[ ]}" custom1 = "${8:[ ]}" custom2 = "${9:[ ]}" custom3 = "${10:[ ]}" custom4 = "${11:[ ]}" category = "${12:[ ]}" categoryTree = "${13:[ ]}" URLpath = "${14:[ ]}" extensions = "${15:[ ]}" query = "${16:[ ]}" recurse = "${17:[ ]}" language = "${18:[ ]}" status = "${19:[ ]}" prefix = "${20:[ ]}"}>$0
TXT

  tab 'cfinput', 'cfinput', <<-'TXT', uuid: '9AA75F85-02C0-4006-9D95-F7EC2728A050'
<cfinput name = "$1"${2: type = "${3:[ ]}" label = "${4:[ ]}" style = "${5:[ ]}" required = "${6:[ ]}" mask = "${7:[ ]}" validate = "${8:[ ]}" validateAt= "${9:[ ]}" message = "${10:[ ]}" range = "${11:[ ]}" maxlength = "${12:[ ]}" pattern = "${13:[ ]}" onValidate = "${14:[ ]}" onError = "${15:[ ]}" size = "${16:[ ]}" value = "${17:[ ]}" bind = "${18:[ ]}" checked = "${19:[ ]}" disabled = "${20:[ ]}" src = "${21:[ ]}" onKeyUp = "${22:[ ]}" onKeyDown = "${23:[ ]}" onMouseUp = "${24:[ ]}" onMouseDown = "${25:[ ]}" onChange = "${26:[ ]}" onClick = "${27:[ ]}" firstDayOfWeek = "${28:[ ]}" dayNames = "${29:[ ]}" monthNames = "${30:[ ]}" enabled = "${31:[ ]}" visible = "${32:[ ]}" toolTip = "${33:[ ]}" height = "${34:[ ]}" width = "${35:[ ]}"}>$0
TXT

  tab 'cfinsert', 'cfinsert', <<-'TXT', uuid: '192D1402-A2E5-43F1-B0C5-990853DB5D98'
<cfinsert dataSource = "$1" tableName = "$2"${3: tableOwner = "${4:[ ]}" tableQualifier = "${5:[ ]}" username = "${6:[ ]}" password = "${7:[ ]}" formFields = "${8:[ ]}"}>$0
TXT

  tab 'cfinvoke', 'cfinvoke', <<-'TXT', uuid: '8BBB6187-A1D9-43AF-AF72-CDF3BB8B0A76'
<cfinvoke component = "$1" method = "$2"${3: returnVariable = "${4:[ ]}" argumentCollection = "${5:[ ]}"}>$0
TXT

  tab 'cfinvokeargument', 'cfinvokeargument', <<-'TXT', uuid: 'DE1C603E-D791-469F-99D3-69E17B9B41EB'
<cfinvokeargument name="$1" value="$2"${3: omit = "${4:[ ]}"}>$0
TXT

  tab 'cfldap', 'cfldap', "<cfldap \n\tserver = \"$1\"${2: \n\tport = \"${3:[ ]}\"\n\tusername = \"${4:[ ]}\"\n\tpassword = \"${5:[ ]}\"\n\taction = \"${6:[ ]}\"\n\tname = \"${7:[ ]}\"\n\ttimeout = \"${8:[ ]}\"\n\tmaxRows = \"${9:[ ]}\"\n\tstart = \"${10:[ ]}\"\n\tscope = \"${11:[ ]}\"\n\tattributes = \"${12:[ ]}\"\n\treturnAsBinary = \"${13:[ ]}\"\n\tfilter = \"${14:[ ]}\"\n\tsort = \"${15:[ ]}\"\n\tsortControl = \"${16:[ ]}\"\n\tdn = \"${17:[ ]}\"\n\tstartRow = \"${18:[ ]}\"\n\tmodifyType = \"${19:[ ]}\"\n\trebind = \"${20:[ ]}\"\n\treferral = \"${21:[ ]}\"\n\tsecure = \"${22:[ ]}\"\n\tseparator = \"${23:[ ]}\"\n\tdelimiter = \"${24:[ ]}\"}>$0\n\n", uuid: 'AA6262C5-CA32-415E-B666-D2FBF93E0905'

  tab 'cflocation', 'cflocation', <<-'TXT', uuid: '80B9754E-47ED-46D6-8BA5-80744B0FBE4B'
<cflocation url = "$1">$0
TXT

  tab 'cflock', 'cflock', <<-'TXT', uuid: '4DD466D2-0B15-4E06-8446-5AFBFC8B4128'
<cflock${1: timeout = "${2:30}" scope = "${3:session}" name = "${4:[ ]}"  throwOnTimeout = "${5:no}" type = "${6:exclusive}"}>
	$7
</cflock>$0
TXT

  tab 'cflog', 'cflog', <<-'TXT', uuid: '183709C1-9414-4A25-89FB-A0D9A7E59D27'
<cflog text = "$1"${2: log = "${3:[ ]}" file = "${4:[ ]}" type = "${5:[ ]}" application = "${6:[ ]}"}>$0
TXT

  tab 'cflogin', 'cflogin', <<-'TXT', uuid: '35060F61-EF40-4046-BF12-1AB2748884A1'
<cflogin${1: idletimeout = "${2:1800}" applicationToken = "${3:[ ]}" cookieDomain = "${4:[ ]}"}>
	<cfloginuser name = "$5" password = "$6" roles = "${7:[ ]}">$8
</cflogin>$0
TXT

  tab 'cfloop', 'cfloop (COM collection or structure)', <<-'TXT', uuid: 'F0AFF0A1-90FA-424F-A6AF-6EA6EC1BB225'
<cfloop collection = "$1" item = "$2">
	$3
</cfloop>$0
TXT

  tab 'cfloop', 'cfloop (conditional loop)', <<-'TXT', uuid: '29486C8D-7A9A-4EE0-B6A3-34C77A7D253E'
<cfloop condition = "$1">
	$2
</cfloop>$0
TXT

  tab 'cfloop', 'cfloop (date or time loop)', <<-'TXT', uuid: '7F70512F-517F-4361-89ED-13E8C3BD98F0'
<cfloop from = "${1:#createdate($2)#}" to = "${3:#createdate($4)#}" index = "${5:i}"${6: step = "${7:[ ]}"}>
	$8
</cfloop>$0


TXT

  tab 'cfloop', 'cfloop (index loop)', <<-'TXT', uuid: '44EA1298-2450-498B-82F6-1BF1BC1FFE59'
<cfloop index = "${1:i}" from = "$2" to = "$3"${4: step = "${5:[ ]}"}>
	$6
</cfloop>$0
TXT

  tab 'cfloop', 'cfloop (list or file loop)', <<-'TXT', uuid: '9187A792-54F4-4773-A2D7-EB5D207D1A54'
<cfloop index = "${1:i}" list = "$2"${3: delimiters = "${4:[ ]}"}>
	$5
</cfloop>$0
TXT

  tab 'cfloop', 'cfloop (query loop)', <<-'TXT', uuid: '2A8760F9-6ED1-4066-B996-5E490B5A17EF'
<cfloop query = "$1"${2: startRow = "${3:[ ]}" endRow = "${4:[ ]}"}>
	$5
</cfloop>$0
TXT

  tab 'cfmail', 'cfmail', <<-'TXT', uuid: '0B69D306-8DF0-4494-87AC-B8E92091E0E6'
<cfmail to="$1" from="$2" subject="$3" server="$4" type="${5:html}">
	$6
</cfmail>$0
TXT

  tab 'cfmail', 'cfmail (all attributes)', "<cfmail \n\tto = \"$1\"\n\tfrom = \"$2\"\n\tsubject = \"$3\"${4:\n\tcc = \"${5:[ ]}\"\n\tbcc = \"${6:[ ]}\"\n\treplyto = \"${7:[ ]}\"\n\tfailto = \"${8:[ ]}\"\n\tusername = \"${9:[ ]}\"\n\tpassword = \"${10:[ ]}\"\n\twraptext = \"${11:[ ]}\"\n\tcharset = \"${12:[ ]}\"\n\ttype = \"${13:[ ]}\"\n\tmimeattach = \"${14:[ ]}\"\n\tquery = \"${15:[ ]}\"\n\tgroup = \"${16:[ ]}\"\n\tgroupcasesensitive = \"${17:[ ]}\"\n\tstartrow = \"${18:[ ]}\"\n\tmaxrows = \"${19:[ ]}\"\n\tserver = \"${20:[ ]}\"\n\tport = \"${21:[ ]}\"\n\tmailerid = \"${22:[ ]}\"\n\ttimeout = \"${23:[ ]}\"\n\tspoolenable = \"${24:[ ]}\"\n\tdebug = \"${25:[ ]}\"}>\n\t$26\n</cfmail>$0", uuid: '026FDCF1-E739-42E4-925D-59D80EE7FF05'

  tab 'cfmailparam', 'cfmailparam', <<-'TXT', uuid: '50182FB9-0179-4CF6-9AD7-4E7BC725C594'
<cfmailparam file = "${1:[ ]}" type ="${2:[ ]}" contentID = "${3:[ ]}" disposition = "${4:[ ]}">$5
TXT

  tab 'cfmailpart', 'cfmailpart', <<-'TXT', uuid: '3B19D8BC-5389-4263-A539-160170F7DFB1'
<cfmailpart type="$1"${2: charset="${3:[ ]}" wraptext="${4:[ ]}"}>
	$5
</cfmailpart>$0
TXT

  tab 'cfmodule', 'cfmodule', <<-'TXT', uuid: 'B096E910-EE96-4E63-BB46-EB12616C80F6'
<cfmodule${1: template = "${2:required unless name attribute is used}" name = "${3:required unless template attribute is used}" attributeCollection = "${4:[ ]}" attribute_name1 = "${5:[ ]}" attribute_name2 = "${6:[ ]}"}>$0
TXT

  tab 'cfntauthenticate', 'cfntauthenticate', <<-'TXT', uuid: '08743309-6431-44D2-8A38-926516B04BEF'
<cfntauthenticate username="$1" password="$2" domain="$3"${4: result="${5:[ ]}" listGroups = "${6:[ ]}" throwOnError = "${7:[ ]}"}>$0
TXT

  tab 'cfobject', 'cfobject (COM)', <<-'TXT', uuid: 'A4876D40-55A7-44A0-9CDD-BCF62A621FC3'
<cfobject type = "com" action = "$1" class = "$2" name = "$3"${4: context = "${5:[ ]}" server = "${6:[ ]}"}>$0
TXT

  tab 'cfobject', 'cfobject (component)', <<-'TXT', uuid: '5C441A88-2F12-4C54-83F8-81A62F735F88'
<cfobject name = "$1" component = "$2">$0
TXT

  tab 'cfobject', 'cfobject (CORBA)', <<-'TXT', uuid: 'FDDBDC40-D1D9-4981-92DE-30CA475BC8FA'
<cfobject type = "corba" context = "$1" class = "$2" name = "$3"${4: locale = "${5:[ ]}"}>$0


TXT

  tab 'cfobject', 'cfobject (java)', <<-'TXT', uuid: '3C93CAC9-0DC3-4371-8E5F-2727B0A282BD'
<cfobject type = "Java" action = "$1" class = "$2" name = "$3">$0
TXT

  tab 'cfobject', 'cfobject (web service)', <<-'TXT', uuid: '6F5A4D8F-DE7C-4663-9D39-7BF23D84769E'
<cfobject webservice= "$1" name = "$2">$0
TXT

  tab 'cfobjectcache', 'cfobjectcache', <<-'TXT', uuid: '75FFC09D-CB71-49CF-AB01-3DA8C44F29F3'
<cfobjectcache action = "clear">$0
TXT

  tab 'cfoutput', 'cfoutput (long)', <<-'TXT', uuid: '3ED1297F-4C77-4187-9356-4262D3F28625'
<cfoutput${1: query = "${2:[ ]}" group = "${3:[ ]}" groupCaseSensitive = "${4:[ ]}" startRow = "${5:[ ]}" maxRows = "${6:[ ]}"}>
	$7
</cfoutput>$0
TXT

  tab 'cfoutput', 'cfoutput (short)', <<-'TXT', uuid: '97DD90F8-5334-46A0-B973-C59F357D6C31'
<cfoutput>
	$1
</cfoutput>$0
TXT

  tab 'cfparam', 'cfparam', <<-'TXT', uuid: 'FA01E47F-EB01-4FE1-9EB6-96FDEB923E70'
<cfparam name="$1"${2: type="${3:[string]}" default="${4:[ ]}"}>$0
TXT

  tab 'cfpop', 'cfpop', "<cfpop \n\tserver = \"$1\"${2:\n\tport = \"${3:[ ]}\"\n\tusername = \"${4:[ ]}\"\n\tpassword = \"${5:[ ]}\"\n\taction = \"${6:[ ]}\"\n\tname = \"${7:required if action is getall or getheaderonly}\"\n\tmessageNumber = \"${8:[ ]}\"\n\tuid = \"${9:[ ]}\" \n\tattachmentPath = \"${10:[ ]}\"\n\ttimeout = \"${11:[ ]}\"\n\tmaxRows = \"${12:[ ]}\"\n\tstartRow = \"${13:[ ]}\"\n\tgenerateUniqueFilenames = \"${14:[ ]}\"\n\tdebug = \"${15:[ ]}\"}>$0", uuid: 'F36E8F58-CDBD-4E42-A64F-9D05BE2D49B9'

  tab 'cfprocessingdirective', 'cfprocessingdirective', <<-'TXT', uuid: '1B6D6622-49BD-4EAB-B521-B3D1ACF2E4B1'
<cfprocessingdirective suppressWhiteSpace = "${1:yes or no}"${2: pageEncoding = "${3:[ ]}"}>
	$4
</cfprocessingdirective>$0
TXT

  tab 'cfprocparam', 'cfprocparam', <<-'TXT', uuid: 'E09B46CF-DDE0-4B40-B7AF-93C005F23BAB'
<cfprocparam${1: type = "${2:[ ]}" variable = "${3:required if type is out or inout}" value = "${4:required if type is in}" CFSQLType = "$5" maxLength = "${6:[ ]}" scale = "${7:[ ]}" null = "${8:[ ]}"}>$0
TXT

  tab 'cfprocresult', 'cfprocresult', <<-'TXT', uuid: 'A607B362-68CB-4AE3-BE72-575EB7CBA55A'
<cfprocresult name = "$1"${2: resultSet = "${3:[ ]}" maxRows = "${4:[ ]}"}>$0
TXT

  tab 'cfproperty', 'cfproperty', <<-'TXT', uuid: 'A57CC7BE-F39A-4B64-908D-44EA058C294F'
<cfproperty name="$1"${2: type="${3:[ ]}" required="${4:[ ]}" default="${5:[ ]}" displayname="${6:[ ]}" hint="${7:[ ]}"}>$0
TXT

  tab 'cfquery', 'cfquery (delete sql)', <<-'TXT', uuid: '4417C4C8-F581-41FC-96FF-76A28A1F0640'
<cfquery name = "$1" datasource = "$2"${3: username = "${4:[ ]}" password = "${5:[ ]}"}>
	delete from $6
     where $7
</cfquery>$0
TXT

  tab 'cfquery', 'cfquery (insert sql)', <<-'TXT', uuid: 'D6CFEC97-357A-4EBD-9D95-F89FECD4ED66'
<cfquery name = "$1" datasource = "$2"${3: username = "${4:[ ]}" password = "${5:[ ]}"}>
	insert into $6($7)
	values($8)
</cfquery>$0

TXT

  tab 'cfquery', 'cfquery (long, all attributes)', <<-'TXT', uuid: '0C5234DB-A0F6-4BE2-AF28-5276ED3F81BB'
<cfquery name = "$1"${2: dataSource = "${3:[ ]}" dbtype = "${4:[ ]}" username = "${5:[ ]}" password = "${6:[ ]}" maxRows = "${7:[ ]}" blockFactor = "${8:[ ]}" timeout = "${9:[ ]}" cachedAfter = "${10:[ ]}" cachedWithin = "${11:[ ]}" result = "${12:[ ]}"}>
	$13
</cfquery>$0
TXT

  tab 'cfquery', 'cfquery (select sql)', <<-'TXT', uuid: '293B3EF2-892E-4FF9-BB3B-82AE01FFA38D'
<cfquery name = "$1" datasource = "$2"${3: username = "${4:[ ]}" password = "${5:[ ]}"}>
    select $6
      from $7
     where $8
</cfquery>$0
TXT

  tab 'cfquery', 'cfquery (short)', <<-'TXT', uuid: 'BC74CDF9-65E1-4FD0-A939-110CF53F3F67'
<cfquery name="$1" datasource="$2">
	$3
</cfquery>$0
TXT

  tab 'cfquery', 'cfquery (update sql)', <<-'TXT', uuid: '24AEB6C9-9CDE-478C-9C08-5CB1825321AE'
<cfquery name = "$1" datasource = "$2"${3: username = "${4:[ ]}" password = "${5:[ ]}"}>
    update $6
       set $7
     where $8
</cfquery>$0
TXT

  tab 'cfqueryparam', 'cfqueryparam', <<-'TXT', uuid: 'BC022681-5DE4-4E5C-8638-93EF655F7B0D'
<cfqueryparam value = "$1"${2: CFSQLType = "${3:[ ]}" maxLength = "${4:[ ]}" scale = "${5:[ ]}" null = "${6:[ ]}" list = "${7:[ ]}" separator = "${8:[ ]}"}>$0
TXT

  tab 'cfregistry', 'cfregistry (delete)', <<-'TXT', uuid: 'F29A9DA7-B58E-4839-8664-2C99C5679384'
<cfregistry action = "$1" branch = "$2" entry = "$3">$0
TXT

  tab 'cfregistry', 'cfregistry (get all)', <<-'TXT', uuid: '47BD7B3C-4316-4C5B-AD7D-596D90D64A7C'
<cfregistry action = "getAll" branch = "$1"${2: type = "${3:[ ]}" name = "${4:[ ]}"  sort = "${5:[ ]}"}>$0


TXT

  tab 'cfregistry', 'cfregistry (get)', <<-'TXT', uuid: 'ED205418-D60B-41CE-9942-6855C78C65F6'
<cfregistry action = "get" branch = "$1" entry = "$2" variable = "$3"${4: type = "${5:[ ]}"}>$0
TXT

  tab 'cfregistry', 'cfregistry (set)', <<-'TXT', uuid: 'AEA7BB76-4231-41DC-829C-D093F7BF28E5'
<cfregistry action = "$1" branch = "$2" entry = "$3"${4: type = "${5:[ ]}" value = "${6:[ ]}"}>$0
TXT

  tab 'cfreport', 'cfreport', <<-'TXT', uuid: '7423A717-6340-4CEC-9151-2B882D052CB9'
<cfreport template = "$1" format = "$2"${3: name = "${4:[ ]}" filename = "${5:[ ]}" query = "${6:[ ]}" overwrite = "${7:[ ]}" encryption = "${8:[ ]}" ownerpassword = "${9:[ ]}" userpassword = "${10:[ ]}" permissions = "${11:[ ]}"}>
	$12
</cfreport>$0
TXT

  tab 'cfreportparam', 'cfreportparam', <<-'TXT', uuid: '6E621AA5-5304-4DCE-82B9-820FDB78C5FE'
<cfreportparam name = "$1" value = "$2">$0


TXT

  tab 'cfrethrow', 'cfrethrow', <<-'TXT', uuid: '21B96169-6556-4436-B3B2-4556A6372567'
<cfrethrow>
TXT

  tab 'cfreturn', 'cfreturn', <<-'TXT', uuid: '7A62D445-BDCF-4C67-8B71-35255FACC231'
<cfreturn $1>$0
TXT

  tab 'cfsavecontent', 'cfsavecontent', <<-'TXT', uuid: '9B25BE9A-A2E8-4BA6-A1CD-A545C6A3AEDE'
<cfsavecontent variable = "$1">
	$2
</cfsavecontent>$0
TXT

  tab 'cfschedule', 'cfschedule', <<-'TXT', uuid: 'AD74D8BA-A774-4748-BF7E-22A6E94194ED'
<cfschedule
	action = "$1"
	task = "$2"${3:
	operation = "${4:[required if action equals update]}"
	file = "${5:[required if publish equals yes]}"
	path = "${6:[required if publish equals yes]}"
	startDate = "${7:[required if action equals update]}"
	startTime = "${8:[required if action equals update]}"
	url = "${9:[required if action equals update]}"
	port = "${10:[ ]}"
	publish = "${11:[ ]}"
	endDate = "${12:[ ]}"
	endTime = "${13:[ ]}"
	interval = "${14:[required if action equals update]}"
	requestTimeOut = "${15:[ ]}"
	username = "${16:[ ]}"
	password = "${17:[ ]}"
	proxyServer = "${18:[ ]}"
	proxyPort = "${19:[ ]}"
	proxyUser = "${20:[ ]}"
	proxyPassword = "${21:[ ]}"
	resolveURL = "${22:[ ]}"}>$0
TXT

  tab 'cfscript', 'cfscript', <<-'TXT', uuid: '8743E910-AD98-42C7-AC9D-4EBD26B54456'
<cfscript>
	$1
</cfscript>$0
TXT

  tab 'cfsearch', 'cfsearch', "<cfsearch \n\tname = \"$1\"\n\tcollection = \"$2\"${3:\n\tcategory = \"${4:[ ]}\"\n\tcategoryTree = \"${5:[ ]}\"\n\tstatus = \"${6:[ ]}\"\n\ttype = \"${7:[ ]}\"\n\tcriteria = \"${8:[ ]}\"\n\tmaxRows = \"${9:[ ]}\"\n\tstartRow = \"${10:[ ]}\"\n\tsuggestions = \"${11:[ ]}\"\n\tcontextPassages = \"${12:[ ]}\"\n\tcontextBytes = \"${13:[ ]}\"\n\tcontextHighlightBegin = \"${14:[ ]}\"\n\tcontextHighlightEnd = \"${15:[ ]}\"\n\tpreviousCriteria = \"${16:[ ]}\"\n\tlanguage = \"${17:[ ]}\"}>$0\n\n", uuid: '5EB9976E-F76E-40FE-828F-22B393BA59AE'

  tab 'cfselect', 'cfselect', <<-'TXT', uuid: '8A82A0E0-7396-436B-A3FD-46680599A33A'
<cfselect name = "$1"${2: label = "${3:[ ]}" style = "${4:[ ]}" size = "${5:[ ]}" required = "${6:[ ]}" message = "${7:[ ]}" onError = "${8:[ ]}" multiple = "${9:[ ]}" query = "${10:[ ]}" value = "${11:[ ]}" display = "${12:[ ]}" group = "${13:[ ]}" queryPosition = "${14:[ ]}" selected = "${15:[ ]}" onKeyUp = "${16:[ ]}" onKeyDown = "${17:[ ]}" onMouseUp = "${18:[ ]}" onMouseDown = "${19:[ ]}" onChange = "${20:[ ]}" onClick = "${21:[ ]}" enabled = "${22:[ ]}" visible = "${23:[ ]}" tooltip = "${24:[ ]}" height = "${25:[ ]}" width = "${26:[ ]}" editable="${27:[ ]}"}>
	$28
</cfselect>$0

TXT

  tab 'cfset', 'cfset', <<-'TXT', uuid: '9A1343CB-5E9E-45A2-8D21-B4959C412B6E'
<cfset $1 = $0${TM_XHTML}>
TXT

  tab 'cfsetting', 'cfsetting', <<-'TXT', uuid: 'B36FA4B0-F6AE-4489-97D1-54BFE773A560'
<cfsetting${1: enableCFoutputOnly = "${2:[ ]}" showDebugOutput = "${3:no}" requestTimeOut = "${4:30}"}>$0
TXT

  tab 'cfsilent', 'cfsilent', <<-'TXT', uuid: '281422A7-AF82-45BF-8707-4242A22FA908'
<cfsilent>
	$1
</cfsilent>$0
TXT

  tab 'cfslider', 'cfslider', "<cfslider \n\tname = \"$1\"${2: \n\tlabel = \"${3:[ ]}\"\n\trange = \"${4:[ ]}\"\n\tscale = \"${5:[ ]}\"\n\tvalue = \"${6:[ ]}\"\n\tonValidate = \"${7:[ ]}\"\n\tmessage = \"${8:[ ]}\"\n\tonError = \"${9:[ ]}\"\n\theight = \"${10:[ ]}\"\n\twidth = \"${11:[ ]}\"\n\tvSpace = \"${12:[ ]}\"\n\thSpace = \"${13:[ ]}\"\n\talign = \"${14:[ ]}\"\n\tlookAndFeel = \"${15:[ ]}\"\n\tvertical = \"${16:[ ]}\"\n\tbgColor = \"${17:[ ]}\"\n\ttextColor = \"${18:[ ]}\"\n\tfont = \"${19:[ ]}\"\n\tfontSize = \"${20:[ ]}\"\n\titalic = \"${21:[ ]}\"\n\tbold = \"${22:[ ]}\"\n\tnotSupported = \"${23:[ ]}\"}>$0\n\n", uuid: 'CD089D33-F3B3-4BC8-9650-B7CF29B877BF'

  tab 'cfstoredproc', 'cfstoredproc', <<-'TXT', uuid: '18A3925F-BF0F-4FAF-B45C-C02B2D4C4CB1'
<cfstoredproc procedure = "$1" dataSource = "$2"${3: username = "${4:[ ]}" password = "${5:[ ]}" blockFactor = "${6:[ ]}" debug = "${7:[ ]}" returnCode = "${8:[ ]}" result = "${9:[ ]}"}>$0
TXT

  tab 'cfswitch', 'cfswitch', <<-'TXT', uuid: '622A22FB-207B-4322-BC6C-C2B3D605AF00'
<cfswitch expression="$1">
	<cfcase value="$2">$3</cfcase>
	<cfdefaultcase>$4</cfdefaultcase>
</cfswitch>$0
TXT

  tab 'cftable', 'cftable', <<-'TXT', uuid: '7188A872-4A9F-4A05-ADCA-46D83E911D2D'
<cftable query = "$1"${2: maxRows = "${3:[ ]}" colSpacing = "${4:[ ]}" headerLines = "${5:[ ]}" startRow = "${6:[ ]}"}>
	$7
</cftable>$0
TXT

  tab 'cftextarea', 'cftextarea', <<-'TXT', uuid: '6322FE39-5B27-49EF-A632-A6073EDCE0C4'
<cftextarea name = "$1"${2: label = "${3:[ ]}" style = "${4:[ ]}" required = "${5:[ ]}" validate = "${6:[ ]}" validateAt= "${7:[ ]}" message = "${8:[ ]}" range = "${9:[ ]}" maxlength = "${10:[ ]}" pattern = "${11:[ ]}" onValidate = "${12:[ ]}" onError = "${13:[ ]}" disabled = "${14:[ ]}" value = "${15:[ ]}" bind = "${16:[ ]}" onKeyUp = "${17:[ ]}" onKeyDown = "${18:[ ]}" onMouseUp = "${19:[ ]}" onMouseDown = "${20:[ ]}" onChange = "${21:[ ]}" onClick = "${22:[ ]}" enabled = "${23:[ ]}" visible = "${24:[ ]}" tooltip = "${25:[ ]}" height = "${26:[ ]}" width = "${27:[ ]}" html = "${28:[ ]}"}>
	$29
</cftextarea>$0
TXT

  tab 'cfthrow', 'cfthrow', <<-'TXT', uuid: 'BEC86CCF-C220-4B07-9ACD-320238D1FE48'
<cfthrow${1: type = "${2:[ ]}" message = "${3:[ ]}" detail = "${4:[ ]} " errorCode = "${5:[ ]} " extendedInfo = "${6:[ ]}" object = "${7:[ ]}"}>$0
TXT

  tab 'cftimer', 'cftimer', <<-'TXT', uuid: '1F61F24F-166C-4D2E-98B0-7BA454B21619'
<cftimer${1: label= "${2:[ ]}" type = "${3:[ ]}"}>
	$4
</cftimer>$0
TXT

  tab 'cftrace', 'cftrace', <<-'TXT', uuid: '5BAF7E27-FEAB-43E0-899F-ABE9DA500FD0'
<cftrace${1: abort = "${2:[ ]}" category = "${3:[ ]}" inline = "${4:[ ]}" text = "${5:[ ]}" type = "${6:[ ]}" var = "${7:[ ]}"}>
	$8
</cftrace>$0
TXT

  tab 'cftransaction', 'cftransaction', <<-'TXT', uuid: 'EE49E017-4812-4CAA-8CCC-29DAB3BE7B64'
<cftransaction${1: action = "${2:[ ]}" isolation = "${3:[ ]}"}>
	$4
</cftransaction>$0
TXT

  tab 'cftree', 'cftree', "<cftree \n\tname = \"$1\"${2:  \n\tformat=\"${3:[ ]}\"\n\trequired = \"${4:[ ]}\"\n\tdelimiter = \"${5:[ ]}\"\n\tcompletePath = \"${6:[ ]}\"\n\tappendKey = \"${7:[ ]}\"\n\thighlightHref = \"${8:[ ]}\"\n\tonValidate = \"${9:[ ]}\"\n\tmessage = \"${10:[ ]}\"\n\tonError = \"${11:[ ]}\"\n\tlookAndFeel = \"${12:[ ]}\"\n\tfont = \"${13:[ ]}\"\n\tfontSize = \"${14:[ ]}\"\n\titalic = \"${16:[ ]}\"\n\tbold = \"${17:[ ]}\"\n\theight = \"${18:[ ]}\"\n\twidth = \"${19:[ ]}\"\n\tvSpace = \"${20:[ ]}\"\n\thSpace = \"${21:[ ]}\"\n\talign = \"${22:[ ]}\"\n\tborder = \"${23:[ ]}\"\n\thScroll = \"${22:[ ]}\"\n\tvScroll = \"${24:[ ]}\"\n\tstyle= \"${25:[ ]}\"\n\tenabled = \"${26:[ ]}\"\n\tvisible = \"${27:[ ]}\"\n\ttooltip = \"${28:[ ]}\"\n\tonChange = \"${29:[ ]}\"\n\tnotSupported = \"${30:[ ]}\"\n\tonBlur = \"${31:[ ]}\"\n\tonFocus = \"${32:[ ]}\"}>\n\t$33\n</cftree>$0", uuid: '97F31F3F-B885-4DE8-B784-5582990C21CD'

  tab 'cftreeitem', 'cftreeitem', <<-'TXT', uuid: '5D2DC339-C6E8-4919-9500-DD24DC9D2F73'
<cftreeitem  value = "$1"${2: display = "${3:[ ]}" parent = "${4:[ ]}" img = "${5:[ ]}" imgopen = "${6:[ ]}" href = "${7:[ ]}" target = "${8:[ ]}" query = "${9:[ ]}" queryAsRoot = "${10:[ ]}" expand = "${11:[ ]}"}>$0
TXT

  tab 'cftry', 'cftry', <<-'TXT', uuid: '9E6E0847-D0DB-435D-A129-CA90BE6B9210'
<cftry>
	$1
</cftry>$0
TXT

  tab 'cfupdate', 'cfupdate', <<-'TXT', uuid: '82B42D60-DC77-47AA-B433-14969E2A2CEB'
<cfupdate dataSource = "$1" tableName = "$2"${3: tableOwner = "${4:[ ]}" tableQualifier = "${5:[ ]}" username = "${6:[ ]}" password = "${7:[ ]}" formFields = "${8:[ ]}"}>$0
TXT

  tab 'cfwddx', 'cfwddx', <<-'TXT', uuid: 'DE1DB107-EC48-4128-B400-203B72AFD40F'
<cfwddx action = "$1"  input = "$2"${3: output = "${4:required if action equals wddx2cfml}"  topLevelVariable = "${5:required if action = wddx2js or cfml2js}" useTimeZoneInfo = "${6:[ ]}" validate = "${7:[ ]}"}>$0
TXT

  tab 'cfxml', 'cfxml', <<-'TXT', uuid: '2051A0AE-51E2-413F-9CCB-92826FCD5C99'
<cfxml variable="$1"${2: caseSensitive="${3:[ ]}"}>$0
TXT

  tab 'charsetdecode', 'charsetdecode', <<-'TXT', uuid: '917BA410-EC71-492D-8472-A3C2CED279FA'
CharsetDecode(${1:string}, ${2:encoding})$0
TXT

  tab 'charsetencode', 'charsetencode', <<-'TXT', uuid: '6C78FA7D-0B84-4E9A-A063-77490073E99F'
CharsetEncode(${1:binaryobject}, ${2:encoding})$0
TXT

  tab 'chr', 'chr', <<-'TXT', uuid: '0F018E42-BB09-4631-B11E-EDDD267C8DFF'
Chr(${1:number})$0
TXT

  tab 'cjustify', 'cjustify', <<-'TXT', uuid: '068FD2EE-B721-4DE3-A4E2-F98476C0530A'
Cjustify(${1:string}, ${2:length})$0
TXT

  tab 'compare', 'compare', <<-'TXT', uuid: '9A231D17-D36C-4081-B1EE-E3F5016040C1'
Compare(${1:string1}, ${2:string2})$0
TXT

  tab 'comparenocase', 'comparenocase', <<-'TXT', uuid: 'E648C975-48FA-4818-89B6-34913675E41D'
CompareNoCase(${1:string1}, ${2:string2})$0
TXT

  tab 'cos', 'cos', <<-'TXT', uuid: 'E7FD5C33-5516-4DB0-A553-B832515D17D4'
Cos(${1:number})$0
TXT

  tab 'createdate', 'createdate', <<-'TXT', uuid: 'F3102771-3AA4-492D-AD42-2FDB4F686662'
CreateDate(${1:year}, ${2:month}, ${3:day})$0
TXT

  tab 'createdatetime', 'createdatetime', <<-'TXT', uuid: 'C3AE011B-75E2-45AF-B427-864997717FE2'
CreateDateTime(${1:year}, ${2:month}, ${3:day}, ${4:hour}, ${5:minute}, ${6:second})$0
TXT

  tab 'createodbcdate', 'createodbcdate', <<-'TXT', uuid: '519D474D-FE82-4419-9D5F-AA88D817EDE6'
CreateODBCDate(${1:date})$0
TXT

  tab 'createodbcdatetime', 'createodbcdatetime', <<-'TXT', uuid: '6816281D-E43D-4DEC-AC2B-0E0756A00EEB'
CreateODBCDateTime(${1:date})$0
TXT

  tab 'createodbctime', 'createodbctime', <<-'TXT', uuid: '25ACCCC1-401C-4084-80DE-6CFFF6FDEA20'
CreateODBCTime(${1:date})$0
TXT

  tab 'createtime', 'createtime', <<-'TXT', uuid: '41E4F63F-C59D-4712-B29A-9CC83D717469'
CreateTime(${1:hour}, ${2:minute}, ${3:second})$0
TXT

  tab 'createtimespan', 'createtimespan', <<-'TXT', uuid: '63CA1E9E-34AB-4EDD-B6CC-16C22EA5B777'
CreateTimeSpan(${1:days}, ${2:hours}, ${3:minutes}, ${4:seconds})$0
TXT

  tab 'createuuid', 'createuuid', <<-'TXT', uuid: '2B8BC0E7-93C3-4DE2-957E-8212F6E373C3'
CreateUUID($1)$0
TXT

  tab 'dateadd', 'dateadd', <<-'TXT', uuid: '19400E23-B260-4E85-AFFD-109708545A80'
DateAdd(${1:"datepart"}, ${2:number}, ${3:"date"})$0
TXT

  tab 'datecompare', 'datecompare', <<-'TXT', uuid: '312DD333-8664-4C27-9C67-ED8B285579D4'
DateCompare(${1:"date1"}, ${2:"date2"} ${3:[, "datePart"]})$0
TXT

  tab 'dateconvert', 'dateconvert', <<-'TXT', uuid: '9BDE4AC0-BEC2-4585-AEC7-AD60767AFBEE'
DateConvert(${1:"conversion-type"}, ${2:"date"})$0
TXT

  tab 'datediff', 'datediff', <<-'TXT', uuid: '9D47F8B3-B009-418B-8AB9-0E72D33F137D'
DateDiff(${1:"datepart"}, ${2:"date1"}, ${3:"date2"})$0
TXT

  tab 'dateformat', 'dateformat', <<-'TXT', uuid: '79EDA618-F9E9-4A72-8A7F-DDC0D6826C19'
DateFormat(${1:"date"} ${2:[, "mask"]})$0
TXT

  tab 'datepart', 'datepart', <<-'TXT', uuid: '0BA580D0-B978-48C0-8CEB-F78042E9F58F'
DatePart(${1:"datepart"}, ${2:"date"})$0
TXT

  tab 'day', 'day', <<-'TXT', uuid: 'AE303AF0-FAE2-4C2F-A5BF-0745D3161289'
Day(${1:"date"})$0
TXT

  tab 'dayofweek', 'dayofweek', <<-'TXT', uuid: '228F7B63-E8C8-48EF-9613-A32CAB3FF100'
DayOfWeek(${1:"date"})$0
TXT

  tab 'dayofweekasstring', 'dayofweekasstring', <<-'TXT', uuid: 'CB454D76-239A-40D2-B194-43CA6DDD9B8D'
DayOfWeekAsString(${1:day_of_week})$0
TXT

  tab 'dayofyear', 'dayofyear', <<-'TXT', uuid: 'CBEAE712-0FC9-4210-B157-DC5C264BFCBF'
DayOfYear(${1:"date"})$0
TXT

  tab 'daysinmonth', 'daysinmonth', <<-'TXT', uuid: '8F41DFB0-285F-4FA7-A21D-210832BEBD60'
DaysInMonth(${1:"date"})$0
TXT

  tab 'daysinyear', 'daysinyear', <<-'TXT', uuid: '81541C90-0980-47A1-9B9B-9F3E750016C7'
DaysInYear(${1:"date"})$0
TXT

  tab 'de', 'de', <<-'TXT', uuid: 'E651A0E3-0EC3-45AC-B7D0-92E2DAD1F733'
DE(${1:string})$0
TXT

  tab 'decimalformat', 'decimalformat', <<-'TXT', uuid: '8D4E0C06-8D06-4871-9D92-5C72B18A5562'
DecimalFormat(${1:number})$0
TXT

  tab 'decrementvalue', 'decrementvalue', <<-'TXT', uuid: 'D455BE22-95B8-477F-BA2B-22C8C33D2C85'
DecrementValue(${1:number})$0
TXT

  tab 'decrypt', 'decrypt', <<-'TXT', uuid: '1262430C-CE62-4585-9EFC-7D5D001C5F24'
Decrypt(${1:encrypted_string}, ${2:key}${3: [, algorithm]}${4: [, encoding]}${5: [, IVorSalt]}${6: [, iterations]})$0
TXT

  tab 'decryptbinary', 'decryptbinary', <<-'TXT', uuid: '5A00FE89-14AB-4DCA-B601-5FEA6C36F8F4'
DecryptBinary(${1:bytes}, ${2:key}, ${3:[, algorithm]} ${4:[, IVorSalt]} ${5:[, iterations]})$0
TXT

  tab 'deleteclientvariable', 'deleteclientvariable', <<-'TXT', uuid: 'F82AABEA-89D3-4DE6-8B6C-3B7BDC194667'
DeleteClientVariable(${1:"name"})$0
TXT

  tab 'directoryexists', 'directoryexists', <<-'TXT', uuid: 'DEB3845A-FE19-4B41-84AD-EAA44A4BD1DB'
DirectoryExists(${1:absolute_path})$0
TXT

  tab 'dollarformat', 'dollarformat', <<-'TXT', uuid: '3B74EAA8-B431-423C-971B-09349375FE3E'
DollarFormat(${1:number})$0
TXT

  tab 'duplicate', 'duplicate', <<-'TXT', uuid: 'FA705D08-0DFD-4C3B-AB79-FF7719E9258D'
Duplicate(${1:variable_name})$0
TXT

  tab 'encrypt', 'encrypt', <<-'TXT', uuid: 'C02F0BE6-CDE7-489F-8B1D-C63CD15AEEC6'
Encrypt(${1:string}, ${2:key}${3: [, algorithm]}${4: [, encoding]}${5: [, IVorSalt]}${6: [, iterations]})$0
TXT

  tab 'encryptbinary', 'encryptbinary', <<-'TXT', uuid: '2559432A-5071-4C85-B71B-A546326C4DE6'
EncryptBinary(${1:bytes}, ${2:key}${3: [, algorithm]}${4: [, IVorSalt]}${5: [, iterations]})$0
TXT

  tab 'evaluate', 'evaluate', <<-'TXT', uuid: '2358C3ED-39E9-4CB1-BBE0-C2C0419F4E9C'
Evaluate(${1:string_expression1}${2: [, string_expression2]}${3: [, ]})$0
TXT

  tab 'exp', 'exp', <<-'TXT', uuid: 'C91A69A3-2ECA-4F98-8777-E142F6777683'
Exp(${1:number})$0
TXT

  tab 'expandpath', 'expandpath', <<-'TXT', uuid: 'F78D0262-1B71-4AD6-8BB5-C2E9DC9BB083'
Expandpath(${1:relative_path})$0
TXT

  tab 'fileexists', 'fileexists', <<-'TXT', uuid: '8FC4AFD0-98E2-414D-8F80-ED36E5BD977A'
FileExists(${1:absolute_path})$0
TXT

  tab 'find', 'find', <<-'TXT', uuid: '80ECE03A-C2E3-4334-8F7B-2A2ED7BC80A7'
Find(${1:substring}, ${2:string} ${3:[, start ]})$0
TXT

  tab 'findnocase', 'findnocase', <<-'TXT', uuid: '0A20DB84-AAEF-4B95-A19F-18D6F3694798'
FindNoCase(${1:substring}, ${2:string} ${3:[, start ]})$0
TXT

  tab 'findoneof', 'findoneof', <<-'TXT', uuid: '31B2DCFD-1049-49CF-BCA8-FAE5D0D4917D'
FindOneOf(${1:set}, ${2:string} ${3:[, start ]})$0
TXT

  tab 'firstdayofmonth', 'firstdayofmonth', <<-'TXT', uuid: 'DDE93618-33D9-494A-93F0-1E0CAC672042'
FirstDayOfMonth(${1:date})$0
TXT

  tab 'fix', 'fix', <<-'TXT', uuid: 'DD2F9E4A-E204-4CEF-ADCD-18B523A65966'
Fix(${1:number})$0
TXT

  tab 'formatbasen', 'formatbasen', <<-'TXT', uuid: '44379253-BF02-4341-8BB2-B40CD39ED593'
FormatBaseN(${1:number}, ${2:radix})$0
TXT

  tab 'generatesecretkey', 'generatesecretkey', <<-'TXT', uuid: 'DF3F5402-8B88-40D3-81F4-B960A6174610'
GenerateSecretKey(${1:algorithm})$0
TXT

  tab 'getauthuser', 'getauthuser', <<-'TXT', uuid: 'C22A5FC3-65EA-4234-85F2-2B43DFF811FF'
GetAuthUser(${1:})$0
TXT

  tab 'getbasetagdata', 'getbasetagdata', <<-'TXT', uuid: '041E3434-05CD-49B2-BFC3-4E3BE5643A65'
GetBaseTagData(${1:tagname} ${2:[, instancenumber ]})$0
TXT

  tab 'getbasetaglist', 'getbasetaglist', <<-'TXT', uuid: '829C9A8E-323D-44DA-BD6F-72AC150755A1'
GetBaseTagList(${1:})$0
TXT

  tab 'getbasetemplatepath', 'getbasetemplatepath', <<-'TXT', uuid: 'E55FC014-0F85-4A3E-884D-F7C4F3179659'
GetBaseTemplatePath(${1:})$0
TXT

  tab 'getclientvariableslist', 'getclientvariableslist', <<-'TXT', uuid: 'C4D060C7-FF47-4799-AD06-108B3A757EB6'
GetClientVariablesList(${1:})$0
TXT

  tab 'getcontextroot', 'getcontextroot', <<-'TXT', uuid: 'FB98EFB0-2C9C-4037-96CF-5C0644041281'
GetContextRoot(${1:})$0
TXT

  tab 'getcurrenttemplatepath', 'getcurrenttemplatepath', <<-'TXT', uuid: '8330E508-BE78-4713-BF73-2C8B08C02883'
GetCurrentTemplatePath(${1:})$0
TXT

  tab 'getdirectoryfrompath', 'getdirectoryfrompath', <<-'TXT', uuid: '2452CEE2-65EC-4FF1-8E1E-C77876F1D14E'
GetDirectoryFromPath(${1:path})$0
TXT

  tab 'getencoding', 'getencoding', <<-'TXT', uuid: '1B854256-5B23-4FCC-8367-2330D94D200E'
GetEncoding(${1:scope_name})$0
TXT

  tab 'getexception', 'getexception', <<-'TXT', uuid: 'BCF434DF-79AB-4F95-83E0-8D9B0163956B'
GetException(${1:object})$0
TXT

  tab 'getfilefrompath', 'getfilefrompath', <<-'TXT', uuid: 'F93D53FB-7669-4780-B53A-16276844A5BD'
GetFileFromPath(${1:path})$0
TXT

  tab 'getfunctionlist', 'getfunctionlist', <<-'TXT', uuid: '89150D95-04F4-4A3B-B885-20A9C95E3FBA'
GetFunctionList(${1:})$0
TXT

  tab 'getgatewayhelper', 'getgatewayhelper', <<-'TXT', uuid: '4F0429B6-0FB1-4CF6-BCB8-6350EBD89C35'
GetGatewayHelper(${1:gatewayID})$0
TXT

  tab 'gethttprequestdata', 'gethttprequestdata', <<-'TXT', uuid: '998B082A-A679-4494-B66C-69AA8256E4D2'
GetHttpRequestData(${1:})$0
TXT

  tab 'gethttptimestring', 'gethttptimestring', <<-'TXT', uuid: 'E03C0C8A-5CBA-4654-A4BD-EB6500901709'
GetHttpTimeString(${1:date_time_object})$0
TXT

  tab 'getk2serverdoccount', 'getk2serverdoccount', <<-'TXT', uuid: '62B6DE6D-751C-4599-8094-6F3EA39F2517'
GetK2ServerDocCount(${1:})$0
TXT

  tab 'getk2serverdoccountlimit', 'getk2serverdoccountlimit', <<-'TXT', uuid: 'ED3D3507-B8D9-4A83-88B7-CAD0F46A664A'
GetK2ServerDocCountLimit(${1:})$0
TXT

  tab 'getlocale', 'getlocale', <<-'TXT', uuid: '958C7148-B01A-4FE8-AA42-88CADB026CBA'
GetLocale(${1:})$0
TXT

  tab 'getlocaledisplayname', 'getlocaledisplayname', <<-'TXT', uuid: 'DEF118D7-4325-45E5-9AFC-77C80839A76F'
GetLocaleDisplayName(${1:[locale]}${2: [, inLocale]})$0
TXT

  tab 'getlocalhostip', 'getlocalhostip', <<-'TXT', uuid: 'AB98AFE4-E946-4CC6-B453-B6E478590152'
GetLocalHostIP(${1:})$0
TXT

  tab 'getmetadata', 'getmetadata', <<-'TXT', uuid: '3B4924D7-1FCB-4D61-85C8-63E69BFC808F'
GetMetaData(${1:object})$0
TXT

  tab 'getmetricdata', 'getmetricdata', <<-'TXT', uuid: '4640A976-0C9E-45AA-912F-AD2EEF351E60'
GetMetricData(${1:mode})$0
TXT

  tab 'getpagecontext', 'getpagecontext', <<-'TXT', uuid: '5A3FFFCD-C7A2-457E-8D6E-151680293EBD'
GetPageContext(${1:})$0
TXT

  tab 'getprofilesections', 'getprofilesections', <<-'TXT', uuid: 'CA44FB3A-353F-418C-AC80-1DC89F4D65BF'
GetProfileSections(${1:iniFile})$0
TXT

  tab 'getprofilestring', 'getprofilestring', <<-'TXT', uuid: '0CC8642F-3BE7-45DA-86CB-179A4AE9C264'
GetProfileString(${1:iniPath}, ${2:section}, ${3:entry})$0
TXT

  tab 'getsoaprequest', 'getsoaprequest', <<-'TXT', uuid: 'FD813CA3-8050-4E6A-815A-9F083D80A2F8'
GetSOAPRequest(${1:})$0
TXT

  tab 'getsoaprequestheader', 'getsoaprequestheader', <<-'TXT', uuid: '28CCC198-2A33-4677-8B8E-4774BF542C54'
GetSOAPRequestHeader(${1:namespace}, ${2:name} ${3:[, asXML]})$0
TXT

  tab 'getsoapresponse', 'getsoapresponse', <<-'TXT', uuid: '9038D5E1-01AC-41B8-BEB2-681702E589FF'
GetSOAPResponse(${1:webservice})$0
TXT

  tab 'getsoapresponseheader', 'getsoapresponseheader', <<-'TXT', uuid: '8B3912D3-1C28-4DF2-8883-6C4B05377278'
GetSOAPResponseHeader(${1:webservice}, ${2:namespace}, ${3:name} ${4:[, asXML]})$0
TXT

  tab 'gettempdirectory', 'gettempdirectory', <<-'TXT', uuid: '4C10EFDF-A3CE-48E3-8B9B-5174B0163EC2'
GetTempDirectory(${1:})$0
TXT

  tab 'gettempfile', 'gettempfile', <<-'TXT', uuid: '24F07D3F-9B21-4035-A519-CF84DA5DB543'
GetTempFile(${1:dir}, ${2:prefix})$0
TXT

  tab 'gettickcount', 'gettickcount', <<-'TXT', uuid: 'A0B83920-09E1-4361-8597-5B05BA1A23F9'
GetTickCount(${1:})$0
TXT

  tab 'gettimezoneinfo', 'gettimezoneinfo', <<-'TXT', uuid: '5C8F03CB-AAD6-42F4-B20B-705D101354C7'
GetTimeZoneInfo(${1:})$0
TXT

  tab 'gettoken', 'gettoken', <<-'TXT', uuid: 'C25BD8B9-99B8-429E-9499-BEA2C3C2F8C0'
GetToken(${1:string}, ${2:index} ${3:[, delimiters ]})$0
TXT

  tab 'hash', 'hash', <<-'TXT', uuid: '849C7A84-7E2B-4420-AE9D-FEFB11CA4A3F'
Hash(${1:string$}${2: [, algorithm]}${3: [, encoding]})$0
TXT

  tab 'hour', 'hour', <<-'TXT', uuid: '67A5B7BD-0E56-477D-A38C-B101A2719988'
hour(${1:date})$0
TXT

  tab 'htmlcodeformat', 'htmlcodeformat', <<-'TXT', uuid: '56525EF4-4A5C-4415-B2D9-9D135CA32157'
HTMLCodeFormat(${1:string} ${2:[, version ]})$0
TXT

  tab 'htmleditformat', 'htmleditformat', <<-'TXT', uuid: '9C179D97-C855-420C-8689-642EB11AC767'
HTMLEditFormat(${1:string} ${2:[, version ]})$0
TXT

  tab 'iif', 'iif', <<-'TXT', uuid: 'F0FB9A33-FFB9-43D3-847D-AEF559D86B68'
IIf(${1:condition}, ${2:string_expression1}, ${3:string_expression2})$0
TXT

  tab 'incrementvalue', 'incrementvalue', <<-'TXT', uuid: '7B0D2A4C-CF10-4985-AEE3-212D3C479C38'
IncrementValue(${1:number})$0
TXT

  tab 'inputbasen', 'inputbasen', <<-'TXT', uuid: 'ADA257DD-BB15-4CFD-BB53-55C7E1A30365'
InputBaseN(${1:string}, ${2:radix})$0
TXT

  tab 'insert', 'insert', <<-'TXT', uuid: '7F5D11B3-45DE-41E6-B5D1-71F370315500'
Insert(${1:substring}, ${2:string}, ${3:position})$0
TXT

  tab 'int', 'int', <<-'TXT', uuid: '92F58CD9-AE3E-4553-BA7B-B10FD1376B2F'
Int(${1:number})$0
TXT

  tab 'isarray', 'isarray', <<-'TXT', uuid: '259B5FFC-6CB8-4141-8270-CCEF88550A04'
IsArray(${1:value} ${2:[, number ]})$0
TXT

  tab 'isbinary', 'isbinary', <<-'TXT', uuid: 'C953538A-5B40-4D20-B920-EE242B415A21'
IsBinary(${1:value})$0
TXT

  tab 'isboolean', 'isboolean', <<-'TXT', uuid: 'C6B47D42-9614-4C5A-A862-81A4E59EFC55'
IsBoolean(${1:value})$0
TXT

  tab 'iscustomfunction', 'iscustomfunction', <<-'TXT', uuid: 'AAC6EB2B-2BE9-4CF5-995A-09C4632E5809'
IsCustomFunction(${1:name})$0
TXT

  tab 'isdate', 'isdate', <<-'TXT', uuid: 'F8CE823F-8C57-4DAF-957A-C2370F49EB8D'
IsDate(${1:string})$0
TXT

  tab 'isdebugmode', 'isdebugmode', <<-'TXT', uuid: 'DA3FB6A9-6C8A-47F1-932B-76E9AC9FF4A8'
IsDebugMode($1)$0
TXT

  tab 'isdefined', 'isdefined', <<-'TXT', uuid: '30468398-BDF8-4221-B8C1-108D660B5462', file: 'isdefined 2'
IsDefined(${1:"variable_name"})$0
TXT

  tab 'isk2serverabroker', 'isk2serverabroker', "IsK2ServerABroker(${1:})$0\t\t\t", uuid: '317DCAFC-B419-43D1-9516-CB020D48FE08'

  tab 'isk2serverdoccountexceeded', 'isk2serverdoccountexceeded', "IsK2ServerDocCountExceeded(${1:})$0\t\t\t\t", uuid: '7FFE3035-50A2-43BC-9A6A-D3392DD711DA'

  tab 'isk2serveronline', 'isk2serveronline', <<-'TXT', uuid: '67FC60DD-74BC-40D8-96F5-77E90D45E820'
IsK2ServerOnline(${1:})$0
TXT

  tab 'isleapyear', 'isleapyear', <<-'TXT', uuid: 'BE836A4A-003B-43B6-845D-E19A813D7E57'
IsLeapYear(${1:year})$0
TXT

  tab 'islocalhost', 'islocalhost', <<-'TXT', uuid: '523CD084-3B13-46DB-AB6F-8961EC5914CB'
IsLocalHost(${1:ipaddress})$0
TXT

  tab 'isnumeric', 'isnumeric', <<-'TXT', uuid: '5FA14C8D-B9CA-4635-B0ED-A9F6E8133716'
IsNumeric(${1:string})$0
TXT

  tab 'isnumericdate', 'isnumericdate', <<-'TXT', uuid: 'DF07EEE5-5D1C-4226-921C-862390ED60D9'
IsNumericDate(${1:number})$0
TXT

  tab 'isobject', 'isobject', <<-'TXT', uuid: '02288997-F2FE-4F78-86B5-7EB341820E31'
IsObject(${1:value})$0
TXT

  tab 'isquery', 'isquery', <<-'TXT', uuid: '09B68D0D-9DF3-4183-A57C-12352C1F992A'
IsQuery(${1:value})$0
TXT

  tab 'issimplevalue', 'issimplevalue', <<-'TXT', uuid: 'B040F5CB-43F8-442C-88D7-0C8B8FDB8989'
IsSimpleValue(${1:value})$0
TXT

  tab 'issoaprequest', 'issoaprequest', <<-'TXT', uuid: 'BA93AEF3-2AF9-4987-820C-71788DE2DEF3'
IsSOAPRequest(${1:})$0
TXT

  tab 'isstruct', 'isstruct', <<-'TXT', uuid: 'A28980B1-0C97-4C38-AC73-788170AE1D32'
IsStruct(${1:variable})$0
TXT

  tab 'isuserinrole', 'isuserinrole', <<-'TXT', uuid: '4A1ADF4A-5EDD-4D82-8141-B91E66BFD80D'
IsUserInRole(${1:"role_name"})$0
TXT

  tab 'isvalid', 'isvalid', <<-'TXT', uuid: '6D88583E-821E-4921-AABD-997C5738F059'
IsValid(${1:type}, ${2:value})$0
TXT

  tab 'iswddx', 'iswddx', <<-'TXT', uuid: 'EC3B9C82-CD02-4EDE-B292-457CC8774E41'
IsWDDX(${1:value})$0
TXT

  tab 'isxml', 'isxml', <<-'TXT', uuid: 'AE66DCD8-09E8-4EED-BAA6-031BACF237A0'
IsXML(${1:value})$0
TXT

  tab 'isxmlattribute', 'isxmlattribute', <<-'TXT', uuid: 'A56B5F64-EF48-4000-B7D4-78B6C0E04CC1'
IsXmlAttribute(${1:value})$0
TXT

  tab 'isxmldoc', 'isxmldoc', <<-'TXT', uuid: '11346CB0-A4DE-4DFF-BB31-E2D4DCDD14FC'
IsXmlDoc(${1:value})$0
TXT

  tab 'isxmlelem', 'isxmlelem', <<-'TXT', uuid: '206C70C1-010B-43F9-BC75-0CA766DB2DD3'
IsXmlElem(${1:value})$0
TXT

  tab 'isxmlnode', 'isxmlnode', <<-'TXT', uuid: 'B97E295E-62AD-4DD6-9E2D-625B016CC5AA'
IsXmlNode(${1:value})$0
TXT

  tab 'isxmlroot', 'isxmlroot', <<-'TXT', uuid: '17180447-13E1-4330-A9DD-18D9DD6B8C2B'
IsXmlRoot(${1:value})$0
TXT

  tab 'javacast', 'javacast', <<-'TXT', uuid: 'DAF8DD98-B342-4746-B017-EA3AA8861EE9'
JavaCast(${1:type}, ${2:variable})$0
TXT

  tab 'jsstringformat', 'jsstringformat', <<-'TXT', uuid: '2FD9FC81-619B-4256-AFDB-4E1B4EB3B479'
JSStringFormat(${1:string})$0
TXT

  tab 'lcase', 'lcase', <<-'TXT', uuid: '65714417-FFB2-441B-8A92-E660882D3A9B'
LCase(${1:string})$0
TXT

  tab 'left', 'left', <<-'TXT', uuid: 'CA71EDF5-8BDC-4CEF-A25B-91AD55BA9C07'
Left(${1:string}, ${2:count})$0
TXT

  tab 'len', 'len', <<-'TXT', uuid: 'A0DFAD24-FBA0-4867-841C-2DDA8B863454'
Len(${1:string or binary object})$0
TXT

  tab 'listappend', 'listappend', <<-'TXT', uuid: 'E1F8DF31-6867-4D7B-96C1-842A860C3CF1'
ListAppend(${1:list}, ${2:value}${3: [, delimiters ]})$0
TXT

  tab 'listchangedelims', 'listchangedelims', <<-'TXT', uuid: 'A8EEDB00-F4F2-4EC3-AB22-14A5E331D89C'
ListChangeDelims(${1:list}, ${2:new_delimiter}${3: [, delimiters ]})$0
TXT

  tab 'listcontains', 'listcontains', <<-'TXT', uuid: 'C4BE4DC7-045B-470E-9BEE-6438C19D6D51'
ListContains(${1:list}, ${2:substring}${3: [, delimiters ]})$0
TXT

  tab 'listcontainsnocase', 'listcontainsnocase', <<-'TXT', uuid: 'E411CA38-BF07-480C-AA82-864F2AF548B6'
ListContainsNoCase(${1:list}, ${2:substring} ${3:[, delimiters ]})$0
TXT

  tab 'listdeleteat', 'listdeleteat', <<-'TXT', uuid: '300C9DE5-E673-4A8F-B678-8A86E6AC24F6'
ListDeleteAt(${1:list}, ${2:position}${3: [, delimiters ]})$0
TXT

  tab 'listfind', 'listfind', <<-'TXT', uuid: '31A1B000-84FE-4FC6-B941-B2080F6908E9'
ListFind(${1:list}, ${2:value}${3: [, delimiters ]})$0
TXT

  tab 'listfindnocase', 'listfindnocase', <<-'TXT', uuid: '4554BD19-8A33-460E-BDC8-B2E4525D508F'
ListFindNoCase(${1:list}, ${2:value}${3: [, delimiters ]})$0
TXT

  tab 'listfirst', 'listfirst', <<-'TXT', uuid: '48BF60D2-E9C1-4F1E-9FF8-BB08FC6F7A32'
ListFirst(${1:list}${2: [, delimiters]})$0
TXT

  tab 'listgetat', 'listgetat', <<-'TXT', uuid: 'B09C244B-F8E0-4069-A4FF-5029DA586F72'
ListGetAt(${1:list}, ${2:position}${3: [, delimiters]})$0
TXT

  tab 'listinsertat', 'listinsertat', <<-'TXT', uuid: '6D3C12F2-DF3C-40F8-B47E-381FDD0A981A'
ListInsertAt(${1:list}, ${2:position}, ${3:value}${4: [, delimiters]})$0
TXT

  tab 'listlast', 'listlast', <<-'TXT', uuid: '60F3E813-2319-4310-9985-B7B50C0A9A33'
ListLast(${1:list}${2: [, delimiters]})$0
TXT

  tab 'listlen', 'listlen', <<-'TXT', uuid: '32B99607-5DE8-4560-8079-2D84CD4E0001'
ListLen(${1:list}${2: [, delimiters ]})$0
TXT

  tab 'listprepend', 'listprepend', <<-'TXT', uuid: 'F34A2296-6FF0-4090-ABAB-2C9D6F7EF482'
ListPrepend(${1:list}, ${2:value}${3: [, delimiters ]})$0
TXT

  tab 'listqualify', 'listqualify', <<-'TXT', uuid: '14E4A176-FB73-41C7-BCF5-B11F90733CE9'
ListQualify(${1:list}, ${2:qualifier}${3: [, delimiters ]}${4: [, elements ]})$0
TXT

  tab 'listrest', 'listrest', <<-'TXT', uuid: 'D000FBCE-5C70-45C2-B9D2-86C42500568C'
ListRest(${1:list}${2: [, delimiters ]})$0
TXT

  tab 'listsetat', 'listsetat', <<-'TXT', uuid: '6DB8C1A2-09F5-4C4E-B4D8-A75F5E3D76FF'
ListSetAt(${1:list}, ${2:position}, ${3:value}${4: [, delimiters]})$0
TXT

  tab 'listsort', 'listsort', <<-'TXT', uuid: '07A7E990-237A-43F9-A87E-8EA14DD81333'
ListSort(${1:list}, ${2:sort_type}${3: [, sort_order]}${4:[, delimiters]})$0
TXT

  tab 'listtoarray', 'listtoarray', <<-'TXT', uuid: 'C245FB6E-95C2-4D6E-935F-A7F470328E49'
ListToArray(${1:list}${2: [, delimiters ]})$0
TXT

  tab 'listvaluecount', 'listvaluecount', <<-'TXT', uuid: '0528B454-B8BC-466B-9AF9-BE68BC77E4E1'
ListValueCount(${1:list}, ${2:value}${3: [, delimiters ]})$0
TXT

  tab 'listvaluecountnocase', 'listvaluecountnocase', <<-'TXT', uuid: '3D9D15C5-2E00-4332-9169-FC35542D1BEB'
ListValueCountNoCase(${1:list}, ${2:value}${3: [, delimiters ]})$0
TXT

  tab 'ljustify', 'ljustify', <<-'TXT', uuid: '96265680-CFE2-404F-B614-B83B78AC1A0C'
LJustify(${1:string}, ${2:length})$0
TXT

  tab 'log', 'log', <<-'TXT', uuid: '245A194E-803F-4951-BF63-19D639AA99FB'
Log(${1:number})$0
TXT

  tab 'log10', 'log10', <<-'TXT', uuid: '4B02989E-5D1A-497D-8FC1-561E4F2B67AB'
Log10(${1:number})$0
TXT

  tab 'lscurrencyformat', 'lscurrencyformat', <<-'TXT', uuid: '9CA961D9-F34C-489F-865A-EB20A896C0F6'
LSCurrencyFormat(${1:number}${2: [, type]})$0
TXT

  tab 'lsdateformat', 'lsdateformat', <<-'TXT', uuid: '0FA5ADFC-C4D7-45D8-B745-2C0BC538179B'
LSDateFormat(${1:date}${2: [, mask]})$0
TXT

  tab 'lseurocurrencyformat', 'lseurocurrencyformat', <<-'TXT', uuid: '696428FC-070E-4D23-ACFD-0469CCC70079'
LSEuroCurrencyFormat(${1:currency-number}${2: [, type]})$0
TXT

  tab 'lsiscurrency', 'lsiscurrency', <<-'TXT', uuid: '2EDD4802-B07E-4CC2-9A88-B563FF05146E'
LSIsCurrency(${1:string})$0
TXT

  tab 'lsisdate', 'lsisdate', <<-'TXT', uuid: '286B13D0-E6C9-423C-B593-CD4B59A87E8F'
LSIsDate(${1:string})$0
TXT

  tab 'lsisnumeric', 'lsisnumeric', <<-'TXT', uuid: '041AC446-491D-4416-8E14-E60C8018A0D5'
LSIsNumeric(${1:string})$0
TXT

  tab 'lsnumberformat', 'lsnumberformat', <<-'TXT', uuid: 'EB8C4DE1-8A2A-4C1B-AE5D-57D3FC8281CC'
LSNumberFormat(${1:number}${2: [, mask ]})$0
TXT

  tab 'lsparsecurrency', 'lsparsecurrency', <<-'TXT', uuid: '5BD2B7EB-5452-420D-BF49-B33C1D4E8706'
LSParseCurrency(${1:string})$0
TXT

  tab 'lsparsedatetime', 'lsparsedatetime', <<-'TXT', uuid: '268F708E-DBD4-4E38-9194-7063950783D7'
LSParseDateTime(${1:date/time-string})$0
TXT

  tab 'lsparseeurocurrency', 'lsparseeurocurrency', <<-'TXT', uuid: 'DCAD363E-492B-49FD-B84F-43A3F77118CD'
LSParseEuroCurrency(${1:currency-string})$0
TXT

  tab 'lsparsenumber', 'lsparsenumber', <<-'TXT', uuid: '9072A654-06FA-42D6-950D-90E33975B2EB'
LSParseNumber(${1:string})$0
TXT

  tab 'lstimeformat', 'lstimeformat', <<-'TXT', uuid: '3F07F52E-724D-4D8D-84E4-D4E87220B020'
LSTimeFormat(${1:time}${2: [, mask ]})$0
TXT

  tab 'ltrim', 'ltrim', <<-'TXT', uuid: '9DE5A98B-BEB2-4F3E-997C-4851CDAD76C5'
LTrim(${1:string})$0
TXT

  tab 'max', 'max', <<-'TXT', uuid: 'FFADDBFF-B24E-4C06-8C4C-B28F6BD42349'
Max(${1:number1}, ${2:number2})$0
TXT

  tab 'mid', 'mid', <<-'TXT', uuid: '538BB22C-E30C-45E4-92D1-F837360785AF'
Mid(${1:string}, ${2:start}, ${3:count})$0
TXT

  tab 'min', 'min', <<-'TXT', uuid: '40BC17A0-BC89-4D08-A1C0-A54C85E90B46'
Min(${1:number1}, ${2:number2})$0
TXT

  tab 'minute', 'minute', <<-'TXT', uuid: '509BDA8F-1AE1-4B62-9E5C-3742AE06167B'
Minute(${1:date})$0
TXT

  tab 'month', 'month', <<-'TXT', uuid: '3F56DF3C-E73E-4133-B4D0-6EA5926E61B3'
Month(${1:date})$0
TXT

  tab 'monthasstring', 'monthasstring', <<-'TXT', uuid: 'E50E3BBE-8581-4EC4-8875-717CA123463E'
MonthAsString(${1:month_number})$0
TXT

  tab 'now', 'now', <<-'TXT', uuid: '4E3ABBC1-20D2-4D0F-BC10-A128F85AD5BE'
Now(${1:})$0
TXT

  tab 'numberformat', 'numberformat', <<-'TXT', uuid: 'BF26D328-E8B2-4255-AB7E-E139FD8161CE'
NumberFormat(${1:number}${2: [, mask ]})$0
TXT

  tab 'paragraphformat', 'paragraphformat', <<-'TXT', uuid: '087457F5-B8B2-4673-8E60-92430D951D4C'
ParagraphFormat(${1:string})$0
TXT

  tab 'parsedatetime', 'parsedatetime', <<-'TXT', uuid: 'A79C2E63-7CBD-453A-AD1A-B4B15A554C6B'
ParseDateTime(${1:date/time-string}${2: [, pop-conversion ]})$0
TXT

  tab 'pi', 'pi', <<-'TXT', uuid: '8FC0283E-CE94-450F-9560-9990FB253D95'
Pi($1)$0
TXT

  tab 'preservesinglequotes', 'preservesinglequotes', <<-'TXT', uuid: '3FA1DAF0-1259-41F5-B642-872D9FD60297'
PreserveSingleQuotes(${1:variable})$0
TXT

  tab 'quarter', 'quarter', <<-'TXT', uuid: '21ADF248-F14F-469F-956B-14251B78B83A'
Quarter(${1:date})$0
TXT

  tab 'queryaddcolumn', 'queryaddcolumn', <<-'TXT', uuid: '92CA447A-F1ED-4C5A-B999-DFE13C587B8C'
QueryAddColumn(${1:query}, ${2:column-name}${3: [, datatype]}${4: [, array-name]})$0
TXT

  tab 'queryaddrow', 'queryaddrow', <<-'TXT', uuid: '4F173886-8EF8-422A-A368-8E2F1B3699C0'
QueryAddRow(${1:query}${2: [,number]})$0
TXT

  tab 'querynew', 'querynew', <<-'TXT', uuid: 'FA4CAE63-B259-4A38-943B-88F1444835DB'
QueryNew(${1:columnlist}${2: [, columntypelist]})$0
TXT

  tab 'querysetcell', 'querysetcell', <<-'TXT', uuid: '452C6FF5-FF58-4799-841F-786BB2386B5C'
QuerySetCell(${1:query}, ${2:column_name}, ${3:value}${4: [, row_number ]})$0
TXT

  tab 'quotedvaluelist', 'quotedvaluelist', <<-'TXT', uuid: '12C986E9-3511-4179-AA1A-204BF3AC0EBB'
QuotedValueList(${1:query.column}${2: [, delimiter]})$0
TXT

  tab 'rand', 'rand', <<-'TXT', uuid: '9C53FE15-1C26-41B5-8ADE-EA902A7FCD89'
Rand(${1:[algorithm]})$0
TXT

  tab 'randomize', 'randomize', <<-'TXT', uuid: '606B7B7B-236D-42DE-AF65-5C9CBE79EDF5'
Randomize(${1:number}${2: [, algorithm]})$0
TXT

  tab 'randrange', 'randrange', <<-'TXT', uuid: 'C9DDCAF9-7A94-40B8-A355-17CBFD9FB0CB'
RandRange(${1:number1}, ${2:number2}${3: [, algorithm]})$0
TXT

  tab 'refind', 'refind', <<-'TXT', uuid: '80797385-06D3-45A6-A034-8C5BE53A5419'
REFind(${1:reg_expression}, ${2:string}${3: [, start]}${4: [, returnsubexpressions]})$0
TXT

  tab 'refindnocase', 'refindnocase', <<-'TXT', uuid: 'B8181ACC-5FBB-4813-BCBD-42326F575D16'
REFindNoCase(${1:reg_expression}, ${2:string}${3: [, start]}${4: [, returnsubexpressions]})$0
TXT

  tab 'releasecomobject', 'releasecomobject', <<-'TXT', uuid: 'C1E197A3-22AB-4EA7-8D06-E53478B70CD6'
ReleaseComObject(${1:objectName})$0
TXT

  tab 'removechars', 'removechars', <<-'TXT', uuid: '6D8B302B-3980-4B6D-AB18-0642220A1D09'
RemoveChars(${1:string}, ${2:start}, ${3:count})$0
TXT

  tab 'repeatstring', 'repeatstring', <<-'TXT', uuid: '4B4BAF15-6DDF-4AEC-A949-C09DF23D3A0E'
RepeatString(${1:string}, ${2:count})$0
TXT

  tab 'replace', 'replace', <<-'TXT', uuid: '70B7E6F1-FB81-4741-87D7-6E2CDBEBE6CA'
Replace(${1:string}, ${2:substring1}, ${3:substring2}${4: [, scope]})$0
TXT

  tab 'replacelist', 'replacelist', <<-'TXT', uuid: '2A358D34-E286-48DB-8FE4-34957124FE4B'
ReplaceList(${1:string}, ${2:list1}, ${3:list2})$0
TXT

  tab 'replacenocase', 'replacenocase', <<-'TXT', uuid: 'F99266AC-C47B-4662-8140-91FC9CD83CD1'
ReplaceNoCase(${1:string}, ${2:substring1}, ${3:substring2}${4: [, scope]})$0
TXT

  tab 'rereplace', 'rereplace', <<-'TXT', uuid: '1F895B4D-8226-4945-9AFB-7680E54A8AF6'
REReplace(${1:string}, ${2:reg_expression}, ${3:substring}${4: [, scope]})$0
TXT

  tab 'rereplacenocase', 'rereplacenocase', <<-'TXT', uuid: '0CABE9A1-3E50-4516-9EE2-2189D1D87724'
REReplaceNoCase(${1:string}, ${2:reg_expression}, ${3:substring}${4: [, scope]})$0
TXT

  tab 'reverse', 'reverse', <<-'TXT', uuid: '6DBA82BD-A1CE-40CA-B200-23E82562ACB5'
Reverse(${1:string})$0
TXT

  tab 'right', 'right', <<-'TXT', uuid: '956A0059-FFF9-4B14-9072-9B66B8D85BC7'
Right(${1:string}, ${2:count})$0
TXT

  tab 'rjustify', 'rjustify', <<-'TXT', uuid: '65E81A15-9D95-4CE8-B2D1-9952FEF5226F'
RJustify(${1:string}, ${2:length})$0
TXT

  tab 'round', 'round', <<-'TXT', uuid: '37710819-E241-495B-8EED-4FDCD9BE6A22'
Round(${1:number})$0
TXT

  tab 'rtrim', 'rtrim', <<-'TXT', uuid: '229077E7-4284-4085-A449-3C5AA8DCF41B'
RTrim(${1:string})$0
TXT

  tab 'second', 'second', <<-'TXT', uuid: '710BC149-0A06-48FE-87A7-4CABA810A519'
Second(${1:date})$0
TXT

  tab 'sendgatewaymessage', 'sendgatewaymessage', <<-'TXT', uuid: 'A8B0343F-CD2C-41E7-BFE5-133C9AE9675F'
SendGatewayMessage(${1:gatewayID}, ${2:data})$0
TXT

  tab 'setencoding', 'setencoding', <<-'TXT', uuid: 'A67CBED1-95F6-4920-A8D7-E84E650520ED'
SetEncoding(${1:scope_name,charset})$0
TXT

  tab 'setlocale', 'setlocale', <<-'TXT', uuid: '56173E05-CA6A-4773-AB05-050A3BBF0F49'
SetLocale(${1:new_locale})$0
TXT

  tab 'setprofilestring', 'setprofilestring', <<-'TXT', uuid: '40D70647-3C75-4588-9CFC-3448A881F79E'
SetProfileString(${1:iniPath}, ${2:section}, ${3:entry}, ${4:value})$0
TXT

  tab 'setvariable', 'setvariable', <<-'TXT', uuid: '67D98396-31F6-4821-BF31-F75F08A92850'
SetVariable(${1:name}, ${2:value})$0
TXT

  tab 'sgn', 'sgn', <<-'TXT', uuid: '7E41534A-A1FF-4214-A106-2B721FB1A920'
Sgn(${1:number})$0
TXT

  tab 'sin', 'sin', <<-'TXT', uuid: 'B01C3BE2-956D-4E5A-9DE0-2FA6B544DA25'
Sin(${1:number})$0
TXT

  tab 'spanexcluding', 'spanexcluding', <<-'TXT', uuid: '96F76523-E10D-4366-BFF0-918D22BA37E9'
SpanExcluding(${1:string}, ${2:set})$0
TXT

  tab 'spanincluding', 'spanincluding', <<-'TXT', uuid: 'DCBE259C-2268-4194-A4FE-03E53A232FBD'
SpanIncluding(${1:string}, ${2:set})$0
TXT

  tab 'sqr', 'sqr', <<-'TXT', uuid: 'F61A0D68-C33F-48F6-B045-B1B3C4EF9525'
Sqr(${1:number})$0
TXT

  tab 'stripcr', 'stripcr', <<-'TXT', uuid: 'B3617124-733D-47EC-9B2A-FAD4C0397831'
StripCR(${1:string})$0
TXT

  tab 'structappend', 'structappend', <<-'TXT', uuid: 'BD44D578-30A0-4ECF-A8E2-4A23C36BD8DE'
StructAppend(${1:struct1}, ${2:struct2}, ${3:overwriteFlag})$0
TXT

  tab 'structclear', 'structclear', <<-'TXT', uuid: '8AF8F6D9-32FD-4AAB-8453-7A2FDE3FD382'
StructClear(${1:structure})$0
TXT

  tab 'structcopy', 'structcopy', <<-'TXT', uuid: '4AEAA48E-D914-4EB4-B917-01D00D0C8E0B'
StructCopy(${1:structure})$0
TXT

  tab 'structcount', 'structcount', <<-'TXT', uuid: '1CF0F70D-B223-4B80-8454-4AEC0B5A10D2'
StructCount(${1:structure})$0
TXT

  tab 'structdelete', 'structdelete', <<-'TXT', uuid: '7830F906-A21D-441D-BA1D-E37635247542'
StructDelete(${1:structure}, ${2:key}${3: [, indicatenotexisting]})$0
TXT

  tab 'structfind', 'structfind', <<-'TXT', uuid: '085B8E6C-388F-456F-882C-B8D3392D61FA'
StructFind(${1:structure}, ${2:key})$0
TXT

  tab 'structfindkey', 'structfindkey', <<-'TXT', uuid: 'A75D991D-240C-43AA-B9A6-553AC44F76FA'
StructFindKey(${1:top}, ${2:value}, ${3:scope})$0
TXT

  tab 'structfindvalue', 'structfindvalue', <<-'TXT', uuid: '53B9B5E7-D897-49E4-AEEC-DE94F781AA2B'
StructFindValue(${1: top}, ${2:value}${3: [, scope]})$0
TXT

  tab 'structget', 'structget', <<-'TXT', uuid: '6B126A42-3320-4978-8ADF-F53C600B5795'
StructGet(${1:pathDesired})$0
TXT

  tab 'structinsert', 'structinsert', <<-'TXT', uuid: '00DA1390-C91E-4583-B83B-CC16F8892239'
StructInsert(${1:structure}, ${2:key}, ${3:value}${4: [, allowoverwrite]})$0
TXT

  tab 'structisempty', 'structisempty', <<-'TXT', uuid: 'EC7BC99A-B82D-43EC-AEF2-8EB54041CDE6'
StructIsEmpty(${1:structure})$0
TXT

  tab 'structkeyarray', 'structkeyarray', <<-'TXT', uuid: '3B195EF9-CCC3-4B2D-91D3-15D514E5F4BF'
StructKeyArray(${1:structure})$0
TXT

  tab 'structkeyexists', 'structkeyexists', <<-'TXT', uuid: '6521B870-750F-4109-8BBF-2910D584C525'
StructKeyExists(${1:structure}, ${2:"key"})$0
TXT

  tab 'structkeylist', 'structkeylist', <<-'TXT', uuid: '16F25A48-3166-4E7C-8F80-DC9E61C65645'
StructKeyList(${1:structure}${2: [, delimiter]})$0
TXT

  tab 'structnew', 'structnew', <<-'TXT', uuid: '018DC512-CE52-4DCC-B556-DA3A9AD96FE6'
StructNew($1)$0
TXT

  tab 'structsort', 'structsort', <<-'TXT', uuid: '94993BC1-CB55-4F02-9705-70ABCED8CFC9'
StructSort(${1:base}, ${2:sortType}, ${3:sortOrder}, ${4:pathToSubElement})$0
TXT

  tab 'structupdate', 'structupdate', <<-'TXT', uuid: '5622EC10-8A81-4C9F-87C3-E3B6A9B4D96B'
StructUpdate(${1:structure}, ${2:key}, ${3:value})$0
TXT

  tab 'tan', 'tan', <<-'TXT', uuid: '498615E3-E82E-4CD3-A526-EBAE9F68C7EF'
Tan(${1:number})$0
TXT

  tab 'timeformat', 'timeformat', <<-'TXT', uuid: '217C9FA9-BB27-403B-8CBD-659B64FA6CF4'
TimeFormat(${1:time}${2: [, mask]})$0
TXT

  tab 'tobase64', 'tobase64', <<-'TXT', uuid: '102E8B00-3629-43A3-A2D4-864C6CF0CD32'
ToBase64(${1:string or binary_object}${2: [, encoding]})$0
TXT

  tab 'tobinary', 'tobinary', <<-'TXT', uuid: '4B01C66D-8A74-4433-A07D-8FE705C7A352'
ToBinary(${1:string_in_Base64 or binary_value})$0
TXT

  tab 'toscript', 'toscript', <<-'TXT', uuid: '9924DCE9-8C1C-4CAE-B232-E9FD07E1B53E'
ToScript(${1:cfvar}, ${2:javascriptvar}, ${3:outputformat}, ${4:ASFormat})$0
TXT

  tab 'tostring', 'tostring', <<-'TXT', uuid: '9A1B4C8F-EC35-4F05-8AB0-8122EB4B9A93'
ToString(${1:value}${2: [, encoding]})$0
TXT

  tab 'trim', 'trim', <<-'TXT', uuid: '01E0876B-4D91-49AF-937A-7EC39DDDEE79'
Trim(${1:string})$0
TXT

  tab 'ucase', 'ucase', <<-'TXT', uuid: '774B14A7-EDC4-4855-9915-6AB8B15D2F68'
UCase(${1:string})$0
TXT

  tab 'urldecode', 'urldecode', <<-'TXT', uuid: 'D8D50F69-36E3-45DA-807E-29D1E5914DD8'
URLDecode(${1:urlEncodedString}${2: [, charset]})$0
TXT

  tab 'urlencodedformat', 'urlencodedformat', <<-'TXT', uuid: '1CFD7E53-FFF7-46A8-9149-49E9F5088E55'
URLEncodedFormat(${1:string}${2: [, charset]})$0
TXT

  tab 'urlsessionformat', 'urlsessionformat', <<-'TXT', uuid: '3E572472-BBF1-4DDA-AFCF-D52B95B0ADFB'
URLSessionFormat(${1:request_URL})$0
TXT

  tab 'val', 'val', <<-'TXT', uuid: 'EBCC36A0-38E4-438D-BB39-6D3AC690C8AF'
Val(${1:string})$0
TXT

  tab 'valuelist', 'valuelist', <<-'TXT', uuid: '4158361F-D366-4BAA-8CC5-DC46AD449229'
ValueList(${1:query.column}${2: [, delimiter]})$0
TXT

  tab 'week', 'week', <<-'TXT', uuid: 'EE1507E5-F01B-4D73-8EE6-CCFECE98C3F4'
Week(${1:date})$0
TXT

  tab 'wrap', 'wrap', <<-'TXT', uuid: 'C280847F-1A0C-47CC-9EE5-168B9973A8BB'
Wrap(${1:string}, ${2:limit}${3: [, strip]})$0
TXT

  tab 'writeoutput', 'writeoutput', <<-'TXT', uuid: 'F54727CC-8F88-4D17-AC6A-B5E4C8AC872F'
WriteOutput(${1:string})$0
TXT

  tab 'xmlchildpos', 'xmlchildpos', <<-'TXT', uuid: 'FA9F757A-290F-4E33-92FC-9E6214113E58'
XmlChildPos(${1:elem}, ${2:childName}, ${3:N})$0
TXT

  tab 'xmlelemnew', 'xmlelemnew', <<-'TXT', uuid: 'C772C456-6B38-4987-87CF-D10486D185A9'
XmlElemNew(${1:xmlObj}${2: [, namespace]}${3: [, childName]})$0
TXT

  tab 'xmlformat', 'xmlformat', <<-'TXT', uuid: '1A402F7D-1B17-4090-BFD6-42BD426FF0A6'
XmlFormat(${1:string})$0
TXT

  tab 'xmlgetnodetype', 'xmlgetnodetype', <<-'TXT', uuid: 'A80FF473-4E66-4DBF-89E2-3BC1AFC00A0D'
XmlGetNodeType(${1:xmlNode})$0
TXT

  tab 'xmlnew', 'xmlnew', <<-'TXT', uuid: '6A325FC2-6C57-4B2C-9326-3244EAC96A47'
XmlNew(${1:[caseSensitive]})$0
TXT

  tab 'xmlparse', 'xmlparse', <<-'TXT', uuid: '87D35E2A-FCC1-4496-9198-8BC85C16E97F'
XmlParse(${1:xmlText}${2: [, caseSensitive ]}${3: [, validator]})$0
TXT

  tab 'xmlsearch', 'xmlsearch', <<-'TXT', uuid: '63538655-54A5-465E-9E8D-9F57ABA5E40D'
XmlSearch(${1:xmlDoc}, ${2:xPathString})$0
TXT

  tab 'xmltransform', 'xmltransform', <<-'TXT', uuid: 'BA7CE17D-DDC3-4394-808D-6D58588C329C'
XmlTransform(${1:xml}, ${2:xsl}${3: [, parameters]})$0
TXT

  tab 'xmlvalidate', 'xmlvalidate', <<-'TXT', uuid: 'EF439919-653A-4250-B8B6-9337DA8DD851'
XmlValidate(${1:xmlDoc}${2: [, validator]})$0
TXT

  tab 'year', 'year', <<-'TXT', uuid: '0A58EA58-3BBC-4A07-80FF-366933CF24A7'
Year(${1:date})$0
TXT

  tab 'yesnoformat', 'yesnoformat', <<-'TXT', uuid: 'B00CB7C5-C864-493C-9C6E-DCF759CE3B6A'
YesNoFormat(${1:value})$0
TXT

end