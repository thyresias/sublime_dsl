# encoding: utf-8

snippets do

  default_scope 'source.asp'
  file_format :textmate

  key "@\"", '"&  &"', <<-'TXT', scope: 'source.asp string.quoted.double', uuid: '75A09C24-D28A-4B56-9DCB-5125D9E4555B', file: 'break out of string'
"& ${2:`echo $TM_SELECTED_TEXT`} &"
TXT

  key "'", '\' = "&Chr(39)&"', <<-'TXT', scope: 'text.html.asp meta.tag string.quoted.single source.asp string.quoted.double, text.html.asp meta.tag.html string.quoted.single.html meta.source.embedded.bound source.asp.embedded.html string.quoted.double.asp, text.html.asp meta.tag string.quoted.single source string.quoted.double', uuid: 'A0D228AD-2CDA-423A-A621-597238AD472A', file: 'ASP.NET single quote in SQL statement'
"& Chr(39) &"
TXT

  key "@(", 'Request.Cookies (ASP)', <<-'TXT', scope: 'source.asp, text.html.asp', uuid: '699E82AF-02FA-43C3-9B31-EAB7D65F6099'
${2:Request.Cookies}("${1:${TM_SELECTED_TEXT:VariableName}}")$0
TXT

  key "@(", 'Request.Form (ASP)', <<-'TXT', scope: 'source.asp, text.html.asp', uuid: '18158109-9DF4-4070-9533-A5C414448C99'
${2:Request.Form}("${1:${TM_SELECTED_TEXT:VariableName}}")$0
TXT

  key "@(", 'Request.QueryString (ASP)', <<-'TXT', scope: 'source.asp, text.html.asp', uuid: 'B535C3C8-D1B5-44FA-A7A4-22A53E51021F'
${2:Request.QueryString}("${1:${TM_SELECTED_TEXT:VariableName}}")$0
TXT

  # FIXME: illegal XML character "\e" replaced by 'ESC'
  key "^~ESC", 'ServerVariables', <<-'TXT', scope: 'text.html.asp.net', uuid: 'D24D1AAC-F745-4120-A9A3-85C22083A927'
<TABLE>
  <TR>
    <TD>
      <B>Server Varriable</B>
    </TD>
    <TD>
      <B>Value</B>
    </TD>
  </TR>
  <% dim name as string %>
  <% For Each name In Request.ServerVariables %>
  <TR>
    <TD>
      <%= name %>
    </TD>
    <TD>
      <%= Request.ServerVariables(name) %>
    </TD>
  </TR>
  <% Next %>
</TABLE>

TXT

  key "@(", 'Session (ASP)', <<-'TXT', scope: 'source.asp, text.html.asp', uuid: '7598D75F-6649-4BDF-9FC4-6E8782C66B66'
${2:Session}("${1:${TM_SELECTED_TEXT:VariableName}}")$0
TXT

  # FIXME: illegal XML character "\e" replaced by 'ESC'
  key "^~ESC", 'Sub (group selection)', <<-'TXT', uuid: '56A9D3BB-181D-4950-9389-664E2435DC3C', file: 'ASP.NET Sub (group selection)'
	${1:Process}($2)
${3:sub ${1:Process}($2)
${TM_SELECTED_TEXT:'Do that thing you do
}$0end sub
}
TXT

  # FIXME: illegal XML character "\u0003" replaced by 'ETX'
  key "#ETX", 'vbCrLf', <<-'TXT', scope: 'source.asp string', uuid: '971CECA8-CC9E-4E4F-A7EE-92392E6101BF'
"& vbCr${2:Lf} _
& "$1$0
TXT

  key "^~u", 'vbProperCase', <<-'TXT', scope: 'source.asp -string', uuid: '934D018D-DD49-4024-9E79-BC591EAEE5E0'
StrConv(${1:${TM_SELECTED_TEXT:"String"}}, vbProperCase)
TXT

  key "^u", 'vbUpperCase', <<-'TXT', scope: 'source.asp -string', uuid: '549205DD-8595-449C-B4E6-C088045D76AD'
StrConv(${1:${TM_SELECTED_TEXT:"String"}}, vbUpperCase)
TXT

  tab '#', '# Container.DataItem', <<-'TXT', scope: 'text.html.asp.net', uuid: 'DFF5EEC2-48AA-41AE-A0F5-AD0CCC49F285', file: 'Bound Column', key_equivalent: "^#"
<%# DataBinder.Eval(Container.DataItem, "${1:${TM_SELECTED_TEXT:ColumnName}}"${2:, "{0:C\}"}) %>$0
TXT

  tab '=', '<%= %>', <<-'TXT', scope: 'text.html.asp', uuid: '893BC5DA-1633-48B3-9401-8184F5ABE662', file: 'embedded source return value'
<%= $0 %>
TXT

  # FIXME: illegal XML character "\e" replaced by 'ESC'
  tab 'asp:', 'asp:BoundColumn', <<-'TXT', scope: 'text.html.asp.net', uuid: '9ACAEFB8-C366-41F5-9DD9-61C646C00548', file: 'asp_BoundColumn', key_equivalent: "^~ESC"
<asp:BoundColumn HeaderText="${1:${TM_SELECTED_TEXT:ColumnName}}" DataField="${1:${TM_SELECTED_TEXT:ColumnName}}" SortExpression="${1:${TM_SELECTED_TEXT:ColumnName}}" ${2:ReadOnly="True" ${3:DataFormatString="{0:C\}" FooterText="${1:${TM_SELECTED_TEXT:ColumnName}}" }}/>
TXT

  # FIXME: illegal XML character "\e" replaced by 'ESC'
  tab 'asp:', 'asp:TemplateColumn', <<-'TXT', scope: 'text.html.asp.net', uuid: 'D49E16DC-34E3-480F-903C-6AB0E2408B93', file: 'asp_TemplateColumn', key_equivalent: "^~ESC"
<asp:TemplateColumn HeaderText="${1:${TM_SELECTED_TEXT:ColumnName}}" ${2:ReadOnly="True" ${3:FooterText="${1:${TM_SELECTED_TEXT:ColumnName}}" }}>
	<ItemTemplate>${9:
		<%# DataBinder.Eval(Container.DataItem, "${1:${TM_SELECTED_TEXT:ColumnName}}"${8:, "{0:C\}"}) %>$0
	}</ItemTemplate>${10:
	<EditItemTemplate>${11:
		<input name="${1:${TM_SELECTED_TEXT:ColumnName}}" type="text" value="<%# DataBinder.Eval(Container.DataItem, "${1:${TM_SELECTED_TEXT:ColumnName}}"${8:, "{0:C\}"}) %>" size="" maxlength="" />
	}</EditItemTemplate>}
</asp:TemplateColumn>
TXT

  # FIXME: illegal XML character "\e" replaced by 'ESC'
  tab 'asp:', 'asp:TemplateColumn Checkbox', <<-'TXT', scope: 'text.html.asp.net', uuid: 'E740C23F-7520-4685-9165-045CD52DDF21', file: 'ASP TamplateColumn Checkbox', key_equivalent: "^~ESC"
<asp:TemplateColumn HeaderText="${1:`echo $TM_SELECTED_TEXT`}" Visible="True">
	<itemtemplate><asp:CheckBox ID="${1:`echo $TM_SELECTED_TEXT`}" runat="server" Checked='<%# Users.FieldValue("${1:`echo $TM_SELECTED_TEXT`}", Container) %>' enabled="false" /></itemtemplate>
	<edititemtemplate>
		<asp:CheckBox ID="${1:`echo $TM_SELECTED_TEXT`}" runat="server" Checked='<%# Users.FieldValue("${1:`echo $TM_SELECTED_TEXT`}", Container) %>' />
	</edititemtemplate>
</asp:TemplateColumn>

TXT

  # FIXME: illegal XML character "\e" replaced by 'ESC'
  tab 'datagrid', 'MM:DataGrid Sort Page Edit', <<-'TXT', scope: 'text.html.asp', uuid: '68A09D9A-8324-4CCC-AC4A-6D175536EF38', file: 'MM_DataGrid Sort Page Edit', key_equivalent: "^~ESC"
${9:<div id="search_${1:Orders}">
  <form action="" method="get">
    Search <input name="s" value="<%= Request.Querystring("s") %>" />
    <input type="submit" value="Search ${1:Orders}" />
  </form>
</div>
}<div id="${1:Orders}">
${7:	<%@ Register TagPrefix="MM" Namespace="DreamweaverCtrls" Assembly="DreamweaverCtrls,version=1.0.0.0,publicKeyToken=836f606ede05d46a,culture=neutral" %>
	<mm:pagebind runat="server" PostBackBind="true" />
}	<mm:dataset ID="${1:Orders}"
	 runat="Server"
	 IsStoredProcedure="false"
	 ConnectionString='<%# System.Configuration.ConfigurationSettings.AppSettings("MM_CONNECTION_STRING_${3:Common_LIVE}") %>'
	 DatabaseType='<%# System.Configuration.ConfigurationSettings.AppSettings("MM_CONNECTION_DATABASETYPE_${3:Common_LIVE}") %>'
	 CommandText='<%# "${2:select * from users where clue is not null}    ORDER BY "+ IIf((Not Request.Querystring("sortOn") Is Nothing), Request.Querystring("sortOn"), "${4:username}") +" "+ Request.Querystring("sortDir") %>'
	 Debug="true" PageSize="25"
	 >
		<parameters>${5:
			<parameter  name="@s"  value='<%# "%" + IIf((Not Request.Querystring("s") Is Nothing), Request.Querystring("s"), "") + "%" %>'  type="VarChar"   />
		}</parameters>${6:
		<editops>
			<editopstable name="dbo.tblFedExSecurity" />
			<parameter name="password"          type="NVarChar" />
			<parameter name="customerid"        type="NVarChar" />
			<parameter name="locationid"        type="Int"      />
			<parameter name="style"             type="NVarChar" />
			<parameter name="sub_style"         type="SmallInt" />
			<parameter name="make_style"        type="SmallInt" />
			<parameter name="shipping_method"   type="SmallInt" />
			<parameter name="type"              type="NVarChar" />
			<parameter name="role"              type="NVarChar" />
			<parameter name="phone"             type="NVarChar" />
			<parameter name="email"             type="VarChar"  />
			<parameter name="viewreport"        type="Bit"      />
			<parameter name="viewreportnumbers" type="Bit"      />
			<parameter name="viewreportmoney"   type="Bit"      />
			<parameter name="viewtracking"      type="Bit"      />
			<parameter name="addlocations"      type="Bit"      />
			<parameter name="viewlocations"     type="Bit"      />
			<parameter name="sendemail"         type="Bit"      />
			<parameter name="fundsallocation"   type="Bit"      />
			<parameter name="supplyordering"    type="Bit"      />
			<parameter name="generatecalltag"   type="Bit"      />
			<parameter name="generateprp"       type="Bit"      />
			<parameter name="viewlogins"        type="Bit"      />
			<parameter name="createlogins"      type="Bit"      />
			<parameter name="${4:username}" type="NVarChar" isprimary="true" />
		</editops>}
	</mm:dataset>
	<script runat="server">
	Sub ${1:Orders}_sortCommand(sender as Object, e as DataGridSortCommandEventArgs)
		dim sortDir as string = ""
		if Request.QueryString("sortOn") = e.SortExpression then
			if (Request.QueryString("sortDir") = "")
				sortDir = "ASC"
			else if (Request.QueryString("sortDir") = "ASC")
				sortDir = "DESC"
			else if (Request.QueryString("sortDir") = "DESC")
				sortDir = "ASC"
			end if
		else
			sortDir = "ASC"
		end if
		Response.Redirect(Request.ServerVariables("SCRIPT_NAME") + "?sortOn=" + e.SortExpression + "&sortDir=" + sortDir + "&s=" + Request.Querystring("s"))
	end sub
	</script>
	<asp:DataGrid ID="${1:Orders}_DG"
				DataKeyField="${4:username}"
				AutoGenerateColumns="true"

				runat="server"
				AllowSorting="true"
				OnSortCommand="${1:Orders}_sortCommand"

				DataSource="<%# ${1:Orders}.DefaultView %>"
				OnItemDataBound="${1:Orders}.OnDataGridItemDataBound"
				OnEditCommand="${1:Orders}.OnDataGridEdit"
				OnUpdateCommand="${1:Orders}.OnDataGridUpdate"
				OnDeleteCommand="${1:Orders}.OnDataGridDelete"
				OnCancelCommand="${1:Orders}.OnDataGridCancel"

				AllowPaging="true"
				AllowCustomPaging="true"
				PageSize="<%# ${1:Orders}.PageSize %>"
				OnPageIndexChanged="${1:Orders}.OnDataGridPageIndexChanged"
				virtualitemcount="<%# ${1:Orders}.RecordCount %>"
				PagerStyle-Mode="NumericPages"

				ShowHeader="true"
				ShowFooter="false"
		>
		<headerstyle           CssClass="headerstyle"          />
		<itemstyle             CssClass="itemstyle"            />
		<alternatingitemstyle  CssClass="alternatingitemstyle" />
		<footerstyle           CssClass="footerstyle"          />
		<pagerstyle            CssClass="pagerstyle"           />
		<columns>
			<asp:EditCommandColumn  ButtonType="LinkButton"  CancelText="Cancel"  EditText="Edit"  HeaderText="Edit"  UpdateText="Update"  visible="True"/>
			$0
		</columns>
	</asp:DataGrid>
</div>

TXT

  # FIXME: illegal XML character "\e" replaced by 'ESC'
  tab 'datagrid', 'MM:DataGrid Sort Page Search', <<-'TXT', scope: 'text.html.asp', uuid: '0DAEDF6F-7009-4CBC-B175-3146F02903ED', file: 'MM_DataGrid Sort Page Search', key_equivalent: "^~ESC"
${9:<div id="search_${1:Orders}">
  <form action="" method="get">
    Search <input name="s" value="<%= Request.Querystring("s") %>" />
    <input type="submit" value="Search ${1:Orders}" />
  </form>
</div>
}<div id="${1:Orders}">
${7:	<%@ Register TagPrefix="MM" Namespace="DreamweaverCtrls" Assembly="DreamweaverCtrls,version=1.0.0.0,publicKeyToken=836f606ede05d46a,culture=neutral" %>
	<mm:pagebind runat="server" PostBackBind="true" />
}	<mm:dataset ID="${1:Orders}"
	 runat="Server"
	 IsStoredProcedure="false"
	 ConnectionString='<%# System.Configuration.ConfigurationSettings.AppSettings("MM_CONNECTION_STRING_${3:Common_LIVE}") %>'
	 DatabaseType='<%# System.Configuration.ConfigurationSettings.AppSettings("MM_CONNECTION_DATABASETYPE_${3:Common_LIVE}") %>'
	 CommandText='<%# "${2:select * from users where clue is not null}    ORDER BY "+ IIf((Not Request.Querystring("sortOn") Is Nothing), Request.Querystring("sortOn"), "${4:username}") +" "+ Request.Querystring("sortDir") %>'
	 Debug="true" PageSize="25"
	 >
		<parameters>${5:
			<parameter  name="@s"  value='<%# "%" + IIf((Not Request.Querystring("s") Is Nothing), Request.Querystring("s"), "") + "%" %>'  type="VarChar"   />
		}</parameters>
	</mm:dataset>
	<script runat="server">
	Sub ${1:Orders}_sortCommand(sender as Object, e as DataGridSortCommandEventArgs)
		dim sortDir as string = ""
		if Request.QueryString("sortOn") = e.SortExpression then
			if (Request.QueryString("sortDir") = "")
				sortDir = "ASC"
			else if (Request.QueryString("sortDir") = "ASC")
				sortDir = "DESC"
			else if (Request.QueryString("sortDir") = "DESC")
				sortDir = "ASC"
			end if
		else
			sortDir = "ASC"
		end if
		Response.Redirect(Request.ServerVariables("SCRIPT_NAME") + "?sortOn=" + e.SortExpression + "&sortDir=" + sortDir + "&s=" + Request.Querystring("s"))
	end sub
	</script>
	<asp:DataGrid ID="${1:Orders}_DG"
				DataKeyField="${4:username}"
				AutoGenerateColumns="true"

				runat="server"
				AllowSorting="true"
				OnSortCommand="${1:Orders}_sortCommand"

				DataSource="<%# ${1:Orders}.DefaultView %>"
				OnItemDataBound="${1:Orders}.OnDataGridItemDataBound"

				AllowPaging="true"
				AllowCustomPaging="true"
				PageSize="<%# ${1:Orders}.PageSize %>"
				OnPageIndexChanged="${1:Orders}.OnDataGridPageIndexChanged"
				virtualitemcount="<%# ${1:Orders}.RecordCount %>"
				PagerStyle-Mode="NumericPages"
				PagerStyle-Position="${10:Bottom|Top|TopAndBottom}"

				ShowHeader="true"
				ShowFooter="false"
				EnableViewstate="false"
		>
		<headerstyle           CssClass="headerstyle"          />
		<itemstyle             CssClass="itemstyle"            />
		<alternatingitemstyle  CssClass="alternatingitemstyle" />
		<footerstyle           CssClass="footerstyle"          />
		<pagerstyle            CssClass="pagerstyle"           />
		<columns>
			$0
		</columns>
	</asp:DataGrid>
</div>

TXT

  # FIXME: illegal XML character "\e" replaced by 'ESC'
  tab 'format', 'Hilight Search Terms(TEXT)', <<-'TXT', uuid: '4BC9912E-93CF-4C5D-A264-425D0151C542', key_equivalent: "^~ESC"
${3:IIf(Request.Querystring("s")<>"",Regex.Replace(${1:${TM_SELECTED_TEXT:"Hello World!!!1!"}}, "("& Request.Querystring("s") &")", "<${2:span} class='ss'>\$1</${2:span}>"),$1)}
TXT

  # FIXME: illegal XML character "\e" replaced by 'ESC'
  tab 'format', 'String.Format()', <<-'TXT', uuid: '14B0D39F-DEF8-435E-82D3-FB992B042A81', key_equivalent: "^~ESC"
${3:String.Format("${2:{0:c\}}", ${1:${TM_SELECTED_TEXT:price}})}
TXT

  # FIXME: illegal XML character "\e" replaced by 'ESC'
  tab 'function', 'Function', <<-'TXT', uuid: '312FE06B-D9DA-4EBF-AF43-5CF67CC8A127', file: 'ASP.NET Function', key_equivalent: "^~ESC"
Function ${1:Process}(${2:This_Item} As ${3:String}) As ${4:Boolean}
	Return ${5:True}$0
End Function

TXT

  tab 'IIf', 'If then HTML', <<-'TXT', scope: 'text.html.asp', uuid: 'E2DA60E2-97F4-42AC-AF9E-5A0C7DE4B724', key_equivalent: "^@i"
<% if ${2:Is_This_True?} %>${1:${TM_SELECTED_TEXT:True}}${4:<% else %>$3}<% end if %>$0
TXT

  tab 'IIf', 'IIf()', <<-'TXT', scope: 'source.asp -(source string), text string source.asp -(source string)', uuid: '7624FE5A-4293-4081-BDA8-7CD6534D7D5A', key_equivalent: "^@i"
IIf(${1:${TM_SELECTED_TEXT:Is_This_True?}},${2:true},${3:false})$0
TXT

  tab 'IIf', 'IIf() ""', <<-'TXT', scope: 'source.asp string', uuid: '516A2F6B-E1BD-4E30-9CBA-FCB2D400C60B', file: 'IIf() quote', key_equivalent: "^@i"
"& IIf(${2:Is_This_True?},"${1:${TM_SELECTED_TEXT:True}}",${4:"$3"})$0 &"
TXT

  tab 'IIf', 'IIf() "" html', <<-'TXT', scope: 'text.html.asp string -source', uuid: 'FBDCCC35-1DB9-42BE-8C97-96183C2D0CA0', file: 'IIf() quote html', key_equivalent: "^@i"
<%= IIf(${2:Is_This_True?},"${1:${TM_SELECTED_TEXT:True}}",${4:"$3"})$0 %>
TXT

  tab 'p', '<%>', <<-'TXT', scope: 'text.html.asp', uuid: 'F3C06C1F-E04A-42B2-B611-99C48E1F6FC1', file: 'embedded source', key_equivalent: "^%"
<%${2:=} ${1:${TM_SELECTED_TEXT:Content}}$0 %>
TXT

  # FIXME: illegal XML character "\e" replaced by 'ESC'
  tab 'sql', 'SqlCommand', <<-'TXT', uuid: '142C4861-B95A-4DBB-A693-1996AF4A62A5', key_equivalent: "^~ESC"
Dim $4_CON As New System.Data.SQLClient.SQLConnection(System.Configuration.ConfigurationSettings.AppSettings("MM_CONNECTION_STRING_${2:CFC_LIVE}"))
Dim $4_COM As New System.Data.SQLClient.SqlCommand( "${1:${TM_SELECTED_TEXT:UPDATE Users SET Clue = 1 WHERE username = 'taylott'}}", $4_CON)
$4_COM.Connection.Open()
$4_COM.ExecuteNonQuery()
$4_COM.Connection.Close()

TXT

  # FIXME: illegal XML character "\e" replaced by 'ESC'
  tab 'sql', 'SQLDataReader Bound', "Dim conn$1 as New SqlConnection(ConfigurationSettings.AppSettings(\"${4:MM_CONNECTION_STRING_TIW_LIVE}\"))'1. Create a connection\nConst strSQL$1 as String = \"${2:SELECT * FROM Users WHERE Clue > 0}\"'2. Create the command object, passing in the SQL string\nDim comm$1 as New SqlCommand(strSQL$1, conn$1)\nconn$1.Open()\n  ${1:${TM_SELECTED_TEXT:IdOfThinggy}}.DataSource = comm$1.ExecuteReader(CommandBehavior.CloseConnection)\n  ${1:${TM_SELECTED_TEXT:IdOfThinggy}}.DataBind()'Set the datagrid's datasource to the datareader and databind \nconn$1.Close()$0", uuid: 'AF62ECDD-219A-44A8-B47F-7B1F538DC241', key_equivalent: "^~ESC"

  # FIXME: illegal XML character "\e" replaced by 'ESC'
  tab 'sql', 'SQLDataReader Loop', "Dim con$4 as new System.Data.SQLClient.SQLConnection(System.Configuration.ConfigurationSettings.AppSettings(\"${3:MM_CONNECTION_STRING_TIW_LIVE}\")) \ncon$4.Open()\n\tDim strSQL$4 as String = \"${1:${TM_SELECTED_TEXT:SELECT * FROM Users WHERE Clue > 0}}\"\n\tDim    com$4 as new System.Data.SQLClient.SQLCommand(strSQL$4, Con$4)\n\tDim      r$4 as System.Data.SQLClient.SQLDataReader = Com$4.ExecuteReader()\n\tWhile    r$4.Read()\n\t\t${5:r$4(0)}$0\n\tEnd While\n\tr$4.Close()\ncon$4.close()\n", uuid: 'A20AA1B8-4F3E-492B-B619-2EF46832CB69', file: 'ASP.NET SQLDataReader', key_equivalent: "^~ESC"

  tab 'sub', 'Sub', <<-'TXT', uuid: 'BD4C231E-8F19-4ACA-844B-B0F4D065D2AD', file: 'ASP.NET Sub'
sub ${2:Process}(${2:sender as Object, e as EventArgs})
	${1:${TM_SELECTED_TEXT:'Do that thing you do}}$0
end sub

TXT

  # FIXME: illegal XML character "\e" replaced by 'ESC'
  tab 'write', 'Regex.Replace()', <<-'TXT', uuid: '5541855F-D39A-48BB-AC67-E946C3EFB467', key_equivalent: "^~ESC"
${10:Regex.Replace(${1:${TM_SELECTED_TEXT:"Hello World!!!!1!"}}$0,"${3:[^_\w\d\s]}","$4")}
TXT

  # FIXME: illegal XML character "\e" replaced by 'ESC'
  tab 'write', 'Response.Write()', <<-'TXT', uuid: 'FBE6DBA4-ADBA-4744-971E-1E61E6FD5992', key_equivalent: "^~ESC"
${3:Response.Write(${1:${TM_SELECTED_TEXT:"Hello World!!!!1!"}})}
TXT

end