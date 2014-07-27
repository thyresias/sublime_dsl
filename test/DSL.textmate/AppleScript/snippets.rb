# encoding: utf-8

snippets do

  default_scope 'source.applescript'
  file_format :textmate

  # FIXME: no tab trigger nor key equivalent
  key nil, 'Check that UI Scripting is Enabled', <<-'TXT', uuid: 'E604B44D-3483-4993-9679-566392A03203'
on UIscript_check()
	-- check to see if assistive devices is enabled
	tell application "System Events" to set UI_enabled to UI elements enabled
	if not UI_enabled then
		tell application "AppleScript Utility"
			activate
			display dialog "This script utilizes the built-in Graphical User Interface Scripting architecture of Mac OS X which is currently disabled." & return & return & "You can activate GUI Scripting by selecting the checkbox “Enable GUI Scripting” in AppleScript Utility." with icon 1 buttons {"Okay"} default button 1
		end tell
	end if
end UIscript_check

UIscript_check()
TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, 'Select Menu Item with UI Scripting', "-- \\`menu_click\\`, by Jacob Rus, September 2006\n-- \n-- Accepts a list of form: \\`{\"Finder\", \"View\", \"Arrange By\", \"Date\"}\\`\n-- Execute the specified menu item.  In this case, assuming the Finder \n-- is the active application, arranging the frontmost folder by date.\n\non menu_click(mList)\n\tlocal appName, topMenu, r\n\n\t-- Validate our input\n\tif mList's length < 3 then error \"Menu list is not long enough\"\n\n\t-- Set these variables for clarity and brevity later on\n\tset {appName, topMenu} to (items 1 through 2 of mList)\n\tset r to (items 3 through (mList's length) of mList)\n\n\t-- This overly-long line calls the menu_recurse function with\n\t-- two arguments: r, and a reference to the top-level menu\n\ttell app \"System Events\" to my menu_click_recurse(r, ((process appName)'s (menu bar 1)'s (menu bar item topMenu)'s (menu topMenu)))\nend menu_click\n\non menu_click_recurse(mList, parentObject)\n\tlocal f, r\n\n\t-- \\`f\\` = first item, \\`r\\` = rest of items\n\tset f to item 1 of mList\n\tif mList's length > 1 then set r to (items 2 through (mList's length) of mList)\n\n\t-- either actually click the menu item, or recurse again\n\ttell app \"System Events\"\n\t\tif mList's length is 1 then\n\t\t\tclick parentObject's menu item f\n\t\telse\n\t\t\tmy menu_click_recurse(r, (parentObject's (menu item f)'s (menu f)))\n\t\tend if\n\tend tell\nend menu_click_recurse", uuid: 'E56CA3CB-D2C0-451F-B695-5E39D152708A'

  # FIXME: no tab trigger nor key equivalent
  key nil, 'Split/Join Helper Functions', <<-'TXT', uuid: 'DB76600C-38FC-4B63-A1B6-CC926496B620', file: 'Split˸Join Helper Functions'
to split of aString by sep
	local aList, delims
	tell AppleScript
		set delims to text item delimiters
		set text item delimiters to sep
		set aList to text items of aString
		set  text item delimiters to delims
	end tell
	return aList
end split

to join of aList by sep
	local aString, delims
	tell AppleScript
		set delims to text item delimiters
		set text item delimiters to sep
		set aString to aList as string
		set text item delimiters to delims
	end tell
	return aString
end join
TXT

  tab 'alert', 'Alert', <<-'TXT', uuid: '36586BF4-F77B-42B6-ADEF-AD2B65298602'
display alert "${1:alert text}" ¬
	${2:message "${3:message text}" ¬
	}${4:as warning}
TXT

  tab 'choose', 'Choose Application(s)', <<-'TXT', uuid: '61FA9A41-E511-488F-AA30-4216C9154BE7'
${1/.+/set /}${1:the_application}${1/.+/ to /}choose application with prompt "${2:Choose an Application:}"${3/.+/ ¬
	/}${3:with multiple selections allowed}

TXT

  tab 'choose', 'Choose Color', <<-'TXT', uuid: 'C8B17E74-0D0F-4FC9-B53C-B2CD2BBE4EA4'
${1:set the_color to }choose color default color ${2:{65536, 65536, 65536\}}
$0
TXT

  tab 'choose', 'Choose File(s)', <<-'TXT', uuid: '5C6AB1CA-170D-42A9-8E3C-961FE1054934'
${1:set the_file to }choose file with prompt "${2:Pick a file:}"${3: ¬
	default location path to home folder}${4: ¬
	with invisibles}${5: ¬
	with multiple selections allowed}${6: ¬
	with showing package contents}
$0
TXT

  tab 'choose', 'Choose Folder(s)', <<-'TXT', uuid: 'CDEB7EDE-7171-4801-AE12-258ED3F7A2BA'
${1:set the_folder to }choose folder with prompt "${2:Pick a folder:}"${3: ¬
	default location path to home folder}${4: ¬
	with invisibles}${5: ¬
	with multiple selections allowed}${6: ¬
	with showing package contents}
$0
TXT

  tab 'choose', 'Choose Item from List', "set the_choice to choose from list ${1:{\"${2:choices}\"\\}}\n$0 ", uuid: '1D418F08-770F-4407-AE6A-3CCF2CD9FA6E'

  tab 'choose', 'Choose New File', <<-'TXT', uuid: 'DE1A37AA-FB0F-480F-99DC-3D79B35A49C1'
${1:set the_filename to }choose file name with prompt "${2:Name this file:}" ¬
	default name "${3:untitled}" default location ${4:path to home folder}
$0
TXT

  tab 'choose', 'Choose URL', <<-'TXT', uuid: '5100F3C7-EC8E-43C3-B844-2F384FCEC6C4'
${1:set the_url to }choose URL showing ${2:Web} servers with editable URL
$0
TXT

  tab 'con', 'considering … end', <<-'TXT', uuid: 'F6401A3A-7BDB-41E0-8628-3C2F24C3D5FC'
considering ${1:case}
	${0:-- statements}
end considering
TXT

  tab 'copy', 'copy … to …', <<-'TXT', uuid: '3754B2CC-DB4C-4B2D-9DAF-08CD402BB672'
copy ${1:value} to ${0:location}
TXT

  tab 'delim', 'change text item delimiters', <<-'TXT', uuid: '016BF4B7-53D3-49E0-A8DB-033917FAD031'
set oldDelims to AppleScript's text item delimiters
set AppleScript's text item delimiters to {"${1:,}"}
${0:-- statements}
set AppleScript's text item delimiters to oldDelims
TXT

  tab 'dialog', 'OK', <<-'TXT', uuid: '244EC5B2-5821-4364-8585-A2B241A57590'
display dialog ${1:"${2:text}"}${3/.+/ ¬
	with icon /}${3:1} ¬
	buttons {"${4:OK}"} ¬
	default button 1

TXT

  tab 'dialog', 'OK/Cancel', <<-'TXT', uuid: '3495D4D5-E454-4A90-9288-8E7D34094544', file: 'OK˸Cancel'
display dialog ${1:"${2:text}"}${3/.+/ ¬
	with icon /}${3:1} ¬
	buttons {"${5:Cancel}", "${4:OK}"} ¬
	default button "$4"
set button_pressed to button returned of result
if button_pressed is "$4" then
	${6:-- statements for default button}${7/.+/
else
	/}${7:-- statements for cancel button}
end if

TXT

  tab 'dialog', 'OK/Cancel/Other', <<-'TXT', uuid: '7DD1F1C1-3E7B-4157-951E-58B22BA00AB9', file: 'OK˸Cancel˸Other'
display dialog ${1:"${2:text}"}${3/.+/ ¬
	with icon /}${3:1} ¬
	buttons {"${5:Cancel}", "${6:Other}", "${4:OK}"} ¬
	default button "$4"
set button_pressed to button returned of result
if button_pressed is "$4" then
	${7:-- statements for default button}${8/.+/
else if button_pressed is "$5" then
	/}${8:-- statements for cancel button}${9/.+/
else
	/}${9:-- statements for other button}
end if

TXT

  tab 'dialog', 'Text Field', <<-'TXT', uuid: 'E4CD6ED0-73A9-48A5-95F1-74794A93401F'
display dialog ${1:"${2:text}"} ¬
	default answer ${3:"${4:default answer}"}${5/.+/ ¬
	with icon /}${5:1} ¬
	buttons {"${7:Cancel}", "${6:OK}"} ¬
	default button "$6"
set button_pressed to button returned of result
set text_typed to text returned of result
if button_pressed is "$6" then
	${8:-- statements for default button}${9/.+/
else
	/}${9:-- statements for cancel button}
end if
TXT

  tab 'dup', 'duplicate … to …', <<-'TXT', uuid: 'D1F93513-B220-4580-835D-0D689607E25B'
duplicate ${1:value} to ${0:location}
TXT

  tab 'if', 'if … end', <<-'TXT', uuid: '301C492A-03BE-4EFF-87A9-2FD276376B9B'
if ${1:condition} then
	${0:-- statements}
end if
TXT

  tab 'iff', 'if … then …', <<-'TXT', uuid: '1751AD24-B7C6-480B-A1A9-3A3682D5325E'
if ${1:condition} then ${0:value}
TXT

  tab 'ign', 'ignoring … end', <<-'TXT', uuid: 'AFC90003-4B8B-4661-8958-81F47D5E8277'
ignoring ${1:application responses}
	${0:-- statements}
end ignoring
TXT

  tab 'osa', '#!/usr/bin/osascript', <<-'TXT', scope: 'L:dyn.caret.begin.document', uuid: '6A58371E-DED1-44A6-A873-88DEFE0CEA3B', file: '#!˸usr˸bin˸osascript'
#!/usr/bin/osascript

TXT

  tab 'parent', 'prop parent …', <<-'TXT', uuid: '26A11710-54A2-4AB1-AE52-213869C21314'
property parent : ${1:application "${2:Finder}"}
TXT

  tab 'prop', 'prop …', <<-'TXT', uuid: 'E11743D3-7286-470A-9B32-16AB6188244C'
property ${1:prop_name} : ${0:value}
TXT

  tab 'rep', 'repeat [times] … end', <<-'TXT', uuid: '4FFDA694-2B17-41AF-B92A-2172612CC82D'
repeat${1/.+/ /}${1:number}${1/.+/ times/}
	${0:-- statements}
end repeat
TXT

  tab 'rep', 'repeat until ... end', <<-'TXT', uuid: '6CAD1A94-B03B-4E78-B67B-2F3CDAADBAFA', file: 'repeat until ___ end'
repeat until ${1:condition}
	${0:-- statements}
end repeat
TXT

  tab 'rep', 'repeat while ... end', <<-'TXT', uuid: '82EE8D3B-B2EE-457C-8412-F098DD5827FA', file: 'repeat while ___ end'
repeat while ${1:condition}
	${0:-- statements}
end repeat
TXT

  tab 'rep', 'repeat with ... from ... end', <<-'TXT', uuid: 'D1707E70-B8FA-4EAA-B6B6-3BC860268829', file: 'repeat with ___ from ___ end'
repeat with ${1:counter} from ${2:start} to ${3:stop}${4/.+/ by /}${4:step}
	${0:-- statements}
end repeat
TXT

  tab 'rep', 'repeat with ... in ... end', <<-'TXT', uuid: '1E31B99C-B436-4BA6-A754-E8EE5A73680D', file: 'repeat with ___ in ___ end'
repeat with ${1:item} in ${2:list}
	${0:-- statements}
end repeat
TXT

  tab 'script', 'script … end', <<-'TXT', uuid: '27E30615-B821-4998-AC39-B503B75699DB'
script ${1:script_object}
	on run
		${0:-- statements}
	end run
end script
TXT

  tab 'set', 'set … to …', <<-'TXT', uuid: 'E9B6FF87-9B89-4F3C-811A-0A8CC78D1B26'
set ${1:var_name} to ${0:value}
TXT

  tab 'shell', 'do shell script …', <<-'TXT', uuid: 'A26CF48B-F79C-4AEC-B2DC-9063DA264DDB'
${1/.+/set /}${1:shell_output}${1/.+/ to /}do shell script${2/.+/ ¬
	/}${2:"${3:script}"}${4/.+/ ¬
	/}${4:without altering line endings}

TXT

  tab 'tell', 'tell [app] … end', <<-'TXT', uuid: '3E62DF03-32E3-40B6-978F-CD3DD86F8494'
tell ${1:application "${2:Finder}"}
	${0:-- statements}
end tell
TXT

  tab 'terms', 'using terms from [app] … end', <<-'TXT', uuid: '9E5E9C0B-471D-41FE-83CF-6BC51783B27F'
using terms from ${1:application "${2:Finder}"}
	${0:-- statements}
end using terms from
TXT

  tab 'timeout', 'with timeout … end', <<-'TXT', uuid: '9C5B660B-94B9-44DD-AA84-F212AAE0065A'
with timeout ${1:number} seconds
	${0:-- statements}
end timeout
TXT

  tab 'transaction', 'with transaction … end', <<-'TXT', uuid: 'E17ACBC4-BDC8-4ACE-B67A-9148BA4B8B18'
with transaction${1/.+/ /}${1:session}
	${0:-- statements}
end transaction
TXT

  tab 'try', 'try … on error … end', <<-'TXT', uuid: 'A7169FD9-63FB-46EB-974F-6B31FFF4C52B'
try
	${1:-- statements}
on error
	${2:-- error handling}
end try
TXT

end