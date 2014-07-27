# encoding: utf-8

snippets do

  default_scope 'source.js.greasemonkey'
  file_format :textmate

  tab 'clog', 'console.log', <<-'TXT', uuid: '40106F2C-D041-450F-90B5-365F083D3AAC', file: 'unsafeWindow_console_log (Firebug)'
console.log("${1:Debug: %o}", ${2:object});
TXT

  tab 'css', 'GM_addStyle', <<-'TXT', uuid: 'F7B4EFE5-921E-4D2C-B55C-04BEE8EA309F'
GM_addStyle("${1:CSS}");
TXT

  tab 'e', '@exclude', <<-'TXT', scope: 'source.js.greasemonkey meta.header', uuid: '5EB937CB-0C23-4BD6-A0C6-445633CC5748'
// @exclude       ${1:http://}$0
TXT

  tab 'get', 'GM_getValue', <<-'TXT', uuid: '3EE53DB4-8CA6-4112-9CA3-63FE2BFBAA4D'
GM_getValue("${1:key}", ${2:"${3:default value}"});
TXT

  tab 'i', '@include', <<-'TXT', scope: 'source.js.greasemonkey meta.header', uuid: '22137E1C-E20A-4FDD-BFEA-E16FB2AA9BEE'
// @include       ${1:http://}$0
TXT

  tab 'log', 'GM_log', <<-'TXT', uuid: 'DCB85498-9420-46DA-9633-089CC29B458D'
GM_log(${1:"${2:info}"});
TXT

  tab 'menu', 'GM_registerMenuCommand', <<-'TXT', uuid: 'C95995B3-D4E6-48C0-9B18-141F28C5EADD'
GM_registerMenuCommand("${1:Command Name}", ${3:function() {
	$0
\}});
TXT

  tab 'set', 'GM_setValue', <<-'TXT', uuid: '47C68051-A520-40CD-A289-87C191F36638'
GM_setValue("${1:key}", ${2:"${3:value}"});
TXT

  tab 'tab', 'GM_openInTab', <<-'TXT', uuid: '39D399A2-954D-49BE-AAA3-DE4C3336D97A'
GM_openInTab(${1:"${2:http://www.example.com}"});
$0
TXT

  tab 'xhr', 'GM_xmlhttpRequest', <<-'TXT', uuid: 'ED343BF2-B3DE-4A57-92BB-B7F361C74BE3'
GM_xmlhttpRequest({
	method: "GET",
	url: ${1:"${2:http://www.example.com}"},
	onload: ${3:function(result) {
		${0:var response = result.responseText;}
	\} }
});
TXT

end