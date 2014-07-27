# encoding: utf-8

snippets do

  default_scope 'source.asp'
  file_format :textmate

  tab '=', '<%= %>', <<-'TXT', uuid: '6D6BE737-63AB-11D9-B316-000A95CA2CD0', file: '020 ASP Output delimiters'
<%= $0 %>
TXT

  tab 'app', 'Application("…")', <<-'TXT', uuid: '6D6BF1DF-63AB-11D9-B316-000A95CA2CD0', file: '100 Application(ʺʺ)'
Application("$1")
TXT

  tab 'forin', 'For … in … Next', <<-'TXT', uuid: '6D6BE8AC-63AB-11D9-B316-000A95CA2CD0', file: '030 ASP for...in'
For ${1:var} in ${2:array}
	${3:' body}
Next
TXT

  tab 'ifelse', 'If … End if', <<-'TXT', uuid: '6D6BE9FA-63AB-11D9-B316-000A95CA2CD0', file: '040 ASP if-else'
If ${1:condition} Then
	${2:' true}
Else
	${3:' false}
End if
TXT

  tab 'r.f', 'Request.Form("…")', <<-'TXT', uuid: '6D6BECA3-63AB-11D9-B316-000A95CA2CD0', file: '060 Request.Form(ʺʺ)'
Request.Form("${1:field}")
TXT

  tab 'r.q', 'Request.QueryString', <<-'TXT', uuid: '6D6BEDE9-63AB-11D9-B316-000A95CA2CD0', file: '070 Request.QueryString'
Request.QueryString("${1:name}")
TXT

  tab 'r.r', 'Response.Redirect', <<-'TXT', uuid: '6D6BF08E-63AB-11D9-B316-000A95CA2CD0', file: '090 Response.Redirect'
Response.Redirect(${1:to})
TXT

  tab 'r.w', 'Response.Write', "Response.Write ", uuid: '6D6BEF38-63AB-11D9-B316-000A95CA2CD0', file: '080 Response.Write'

  tab 'sess', 'Session("…")', <<-'TXT', uuid: '6D6BF39D-63AB-11D9-B316-000A95CA2CD0', file: '110 Session(ʺʺ)'
Session("${1:whatever}")
TXT

  tab 'while', 'While … Wend', <<-'TXT', uuid: '6D6BEB4F-63AB-11D9-B316-000A95CA2CD0', file: '050 ASP While'
While ${1:NOT ${2:condition}}
	${3:' body}
Wend
TXT

end