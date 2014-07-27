# encoding: utf-8

snippets do

  default_scope 'text.html.mt'
  file_format :textmate

  tab 'archive', 'ArchiveCategory', <<-'TXT', uuid: '99420F80-A774-4608-A2F4-588C48FDBF1A'
<\$mt:ArchiveCategory\$>
TXT

  tab 'archive', 'ArchiveCount', <<-'TXT', uuid: '3FC0BDD4-40E1-47B6-B18E-6817E7FDBBDB'
<\$mt:ArchiveCount\$>
TXT

  tab 'archive', 'ArchiveDate', <<-'TXT', uuid: 'DA89D452-E2AD-4527-A871-D09FBE3927DE'
<\$mt:ArchiveDate\$>
TXT

  tab 'archive', 'ArchiveDateEnd', <<-'TXT', uuid: '2C2A0A7E-BAE2-42AA-A3EF-235A295E9693'
<\$mt:ArchiveDateEnd\$>
TXT

  tab 'archive', 'ArchiveFile', <<-'TXT', uuid: '6A4F6529-84E4-40F3-94E5-1AEF82E338BE'
<\$mt:ArchiveFile\$>
TXT

  tab 'archive', 'ArchiveLink', <<-'TXT', uuid: 'C67F35B9-2D09-4ECD-BE9D-85DE5949E901'
<\$mt:ArchiveLink\$>
TXT

  tab 'archive', 'ArchiveList', <<-'TXT', uuid: '5D5610F2-3796-4583-A380-3129ABA76886'
<mt:ArchiveList archive_type="${1:Individual;Monthly;Weekly;Daily;Category}">
<mt:ArchiveListHeader><ul></mt:ArchiveListHeader>
	<li><a href="<\$mt:ArchiveLink\$>"><\$mt:ArchiveTitle\$></li>
<mt:ArchiveListFooter></ul></mt:ArchiveListFooter>
</mt:ArchiveList>
TXT

  tab 'blog', 'BlogArchiveURL', <<-'TXT', uuid: '1661D3A7-5F9B-48BB-89BF-CCDF4260DCCB'
<\$mt:BlogArchiveURL\$>
TXT

  tab 'blog', 'BlogCCLicenseURL', <<-'TXT', uuid: '9A55F1E5-9973-4B88-9DAA-FCA14F229355'
<\$mt:BlogCCLicenseURL\$>
TXT

  tab 'blog', 'BlogCommentCount', <<-'TXT', uuid: '72AEB70B-DD0F-4292-97DA-C484E3689DB3'
<\$mt:BlogCommentCount\$>
TXT

  tab 'blog', 'BlogDescription', <<-'TXT', uuid: 'D8A53BA0-2046-4878-8415-0DBBD15CCF38'
<\$mt:BlogDescription\$>
TXT

  tab 'blog', 'BlogEntryCount', <<-'TXT', uuid: 'B1BE1C42-4946-48F5-AC34-166E027A3AC0'
<\$mt:BlogEntryCount\$>
TXT

  tab 'blog', 'BlogFileExtension', <<-'TXT', uuid: 'ED3CC350-3625-479D-8B13-DE0661173C08'
<\$mt:BlogFileExtension\$>
TXT

  tab 'blog', 'BlogHost', <<-'TXT', uuid: '4D221F24-F583-4320-9146-8B8CADA906F3'
<\$mt:BlogHost\$>
TXT

  tab 'blog', 'BlogID', <<-'TXT', uuid: '3EA05957-603E-4CA4-9212-C27DC64E4323'
<\$mt:BlogID\$>
TXT

  tab 'blog', 'BlogIfCCLicense', <<-'TXT', uuid: '551E18BC-65E5-475F-8AF0-362AC6EA4627'
<mt:BlogIfCCLicense>
	$1
</mt:BlogIfCCLicense>
TXT

  tab 'blog', 'BlogIfCommentsOpen', <<-'TXT', uuid: '66F8F6A4-44C1-434A-93FB-DEF59105B5B6'
<mt:BlogIfCommentsOpen>
	$1
</mt:BlogIfCommentsOpen>
TXT

  tab 'blog', 'BlogLanguage', <<-'TXT', uuid: 'A0BF408F-AE91-4DB4-B17C-3C33A2EC877C'
<\$mt:BlogLanguage\$>
TXT

  tab 'blog', 'BlogName', <<-'TXT', uuid: 'E20477D7-4025-46AE-8666-C3BA1F09FB49'
<\$mt:BlogName\$>
TXT

  tab 'blog', 'BlogRelativeURL', <<-'TXT', uuid: '119CEB25-9257-4ADD-A769-0834A551CD5B'
<\$mt:BlogRelativeURL\$>
TXT

  tab 'blog', 'Blogs', <<-'TXT', uuid: 'D6717E7F-B458-41C2-B300-E11A5615C486'
<mt:Blogs>
	$1
</mt:Blogs>
TXT

  tab 'blog', 'BlogSitePath', <<-'TXT', uuid: 'C53D95AA-F8E0-44C8-B36A-C83707B2B3E0'
<\$mt:BlogSitePath\$>
TXT

  tab 'blog', 'BlogTimezone', <<-'TXT', uuid: '3AE50CA9-5014-4501-9058-1B884AEFC2B6'
<\$mt:BlogTimezone\$>
TXT

  tab 'blog', 'BlogURL', <<-'TXT', uuid: 'B0799505-8CA6-4BC2-A45E-B24AA00E0DB5'
<\$mt:BlogURL\$>
TXT

  tab 'cal', 'Calendar', <<-'TXT', uuid: '9AB4FB94-6163-4014-9EED-F06BD40CD4DC'
<div class="module-calendar module">
<h2 class="module-header"><\$mt:Date format="%B %Y"\$></h2>
<div class="module-content">
<table summary="Monthly calendar with links to each day's posts">

<tr>
<th abbr="Sunday">Sun</th>
<th abbr="Monday">Mon</th>
<th abbr="Tuesday">Tue</th>
<th abbr="Wednesday">Wed</th>
<th abbr="Thursday">Thu</th>
<th abbr="Friday">Fri</th>
<th abbr="Saturday">Sat</th>
</tr>
<mt:Calendar>
<mt:CalendarWeekHeader><tr></mt:CalendarWeekHeader>
<td>
<mt:CalendarIfEntries>
<mt:Entries lastn="1">
<a href="<\$mt:EntryPermalink\$>"><\$mt:CalendarDay\$></a>
</mt:Entries>
</mt:CalendarIfEntries>
<mt:CalendarIfNoEntries>
<\$mt:CalendarDay\$>
</mt:CalendarIfNoEntries>
<mt:CalendarIfBlank>&nbsp;</mt:CalendarIfBlank></td>
<mt:CalendarWeekFooter></tr></mt:CalendarWeekFooter>
</mt:Calendar>
</table>
</div>
</div>
TXT

  tab 'cal', 'CalendarCellNumber', <<-'TXT', uuid: 'B0016BAF-812A-497A-9282-D78F11CEF3A4'
<\$mt:CalendarCellNumber\$>
TXT

  tab 'cal', 'CalendarDate', <<-'TXT', uuid: '10747A91-D73A-4233-8B59-BBAFAA609634'
<\$mt:CalendarDate\$>
TXT

  tab 'cal', 'CalendarDay', <<-'TXT', uuid: '7F5E1CB2-439B-41BF-BBD6-1936762C6251'
<\$mt:CalendarDay\$>
TXT

  tab 'cal', 'CalendarIfBlank', <<-'TXT', uuid: 'CB28BE06-3CC0-438B-9857-F963E282609F'
<mt:CalendarIfBlank>
	$1
</mt:CalendarIfBlank>
TXT

  tab 'cal', 'CalendarIfEntries', <<-'TXT', uuid: '2D582D75-05DF-4932-9DE1-6EEA7349A98F'
<mt:CalendarIfEntries>
	$1
</mt:CalendarIfEntries>
TXT

  tab 'cal', 'CalendarIfNoEntries', <<-'TXT', uuid: '2CCCB811-AB71-4495-AD79-F84BA4E26D49'
<mt:CalendarIfNoEntries>
	$1
</mt:CalendarIfNoEntries>
TXT

  tab 'cal', 'CalendarIfToday', <<-'TXT', uuid: '755A7008-884C-4DC1-A9ED-2DB6C7AF8C51'
<mt:CalendarIfToday>
	$1
</mt:CalendarIfToday>
TXT

  tab 'cal', 'CalendarIfWeekFooter', <<-'TXT', uuid: '1CF71B13-23CD-4622-854E-D7088FD50014'
<mt:CalendarWeekFooter>
	$1
</mt:CalendarWeekFooter>
TXT

  tab 'cal', 'CalendarIfWeekHeader', <<-'TXT', uuid: '9D4E6903-09FC-429C-BE9C-5A942470C25F'
<mt:CalendarWeekHeader>
	$1
</mt:CalendarWeekHeader>
TXT

  tab 'cat', 'Categories', <<-'TXT', uuid: '84D0FFBF-5FFF-4E04-AF4C-7AEFB714930C'
<ul>
<mt:Categories>
	<li><a href="<\$mt:CategoryArchiveLink\$>"><\$mt:CategoryLabel\$></a></li>
</mt:Categories>
</ul>
TXT

  tab 'cat', 'CategoryArchiveLink', <<-'TXT', uuid: '25914528-6346-4691-82B7-5F901119A35B'
<\$mt:CategoryArchiveLink\$>
TXT

  tab 'cat', 'CategoryCount', <<-'TXT', uuid: '29E5620B-4122-4A0F-B04A-99FF84347367'
<\$mt:CategoryCount\$>
TXT

  tab 'cat', 'CategoryDescription', <<-'TXT', uuid: 'CFFA52CF-E9E2-46DF-9CD4-48078D9D43D5'
<\$mt:CategoryDescription\$>
TXT

  tab 'cat', 'CategoryID', <<-'TXT', uuid: '70FCF0E7-0659-43BB-A00A-D8EBBEC9C952'
<\$mt:CategoryID\$>
TXT

  tab 'cat', 'CategoryIfAllowPings', <<-'TXT', uuid: '702E6BFC-E1A3-4057-9A3F-01957C97CCB0'
<MTCategoryIfAllowPings>
	$1
</MTCategoryIfAllowPings>
TXT

  tab 'cat', 'CategoryLabel', <<-'TXT', uuid: 'E1A806C6-A743-4927-82E7-3C9AFF7808E3'
<\$mt:CategoryLabel\$>
TXT

  tab 'cat', 'CategoryTrackbackCount', <<-'TXT', uuid: 'BD7295B5-99A4-4C8E-B176-1A2F5C02BFE0'
<\$mt:CategoryTrackbackCount\$>
TXT

  tab 'cat', 'CategoryTrackbackLink', <<-'TXT', uuid: '0216134A-5C7B-41E9-A69B-9F0C47A70CD5'
<\$mt:CategoryTrackbackLink\$>
TXT

  tab 'else', 'Else', <<-'TXT', uuid: 'A4E704EF-DAB1-4877-99DA-3E5E1E0CA02B'
<mt:Else>
TXT

  tab 'entries', 'Entries', <<-'TXT', uuid: '33081DC8-12A9-4C86-AA8E-030AFB67BD22'
<mt:Entries lastn="${1:10}"${2: category="$3"}${4: author="$5"}>
	$6
</mt:Entries>
TXT

  tab 'entries', 'EntriesFooter', <<-'TXT', uuid: '2F06EDB2-D9CA-4AA6-9B86-46333286EDDF'
<mt:EntriesFooter>
	$1
</mt:EntriesFooter>
TXT

  tab 'entries', 'EntriesHeader', <<-'TXT', uuid: '4F6A85ED-4FE1-4D20-BA1E-921981BF02CB'
<mt:EntriesHeader>
	$1
</mt:EntriesHeader>
TXT

  tab 'entry', 'EntryAuthor', <<-'TXT', uuid: 'F47F7B8C-856E-4E38-B7C3-81C4D43CEA5E'
<\$mt:EntryAuthor\$>
TXT

  tab 'entry', 'EntryAuthorDisplayName', <<-'TXT', uuid: 'CDBF8683-427A-4879-ABB2-53A4F2887C4A'
<\$mt:EntryAuthorDisplayName\$>
TXT

  tab 'entry', 'EntryAuthorEmail', <<-'TXT', uuid: '6AC12D4F-7C91-4B70-93C9-382EA478B75B'
<\$mt:EntryAuthorEmail\$>
TXT

  tab 'entry', 'EntryAuthorLink', <<-'TXT', uuid: 'D91125FF-D195-43A9-8886-3124D58DC20C'
<\$mt:EntryAuthorLink\$>
TXT

  tab 'entry', 'EntryBody', <<-'TXT', uuid: '86A213C5-1D15-4A5B-B072-C83E93268E7F'
<\$mt:EntryBody\$>
TXT

  tab 'entry', 'EntryCategories', <<-'TXT', uuid: '82E6EE6E-0061-4F32-B92F-F76ED64A2DEB'
<mt:EntryCategories glue=", "><a href="<\$mt:CategoryArchiveLink\$>"><\$mt:CategoryLabel\$></a></mt:EntryCategories>
TXT

  tab 'entry', 'EntryCategory', <<-'TXT', uuid: '28919722-B040-439C-AA9E-79531F0168F3'
<\$mt:EntryCategory\$>
TXT

  tab 'entry', 'EntryCommentCount', <<-'TXT', uuid: 'F18FCB42-280D-4A7C-8B82-96D2047E189C'
<\$mt:EntryCommentCount\$>
TXT

  tab 'entry', 'EntryDate', <<-'TXT', uuid: '4F78393A-49DE-4170-831F-B2104E09F9AC'
<\$mt:EntryDate\$>
TXT

  tab 'entry', 'EntryExcerpt', <<-'TXT', uuid: '297868B1-D6A0-4EA5-A723-C5D770EC17AB'
<\$mt:EntryExcerpt\$>
TXT

  tab 'entry', 'EntryID', <<-'TXT', uuid: '792BF392-824D-44DC-BC7F-02D5B2273B5F'
<\$mt:EntryID\$>
TXT

  tab 'entry', 'EntryKeywords', <<-'TXT', uuid: 'DD0F0396-4D7C-4E58-A3B3-997B2B2CE243'
<\$mt:EntryKeywords\$>
TXT

  tab 'entry', 'EntryMore', <<-'TXT', uuid: '0F25FAFA-BBF8-45A3-B542-3923B9DAD5B7'
<\$mt:EntryMore\$>
TXT

  tab 'entry', 'EntryPermalink', <<-'TXT', uuid: 'CE5E80FF-92E0-43D5-A176-ED6E5423FFC1'
<\$mt:EntryPermalink\$>
TXT

  tab 'entry', 'EntryTitle', <<-'TXT', uuid: '3F328F6B-299E-40E4-9297-9487529E3806'
<\$mt:EntryTitle\$>
TXT

  tab 'if', 'If', <<-'TXT', uuid: '7FF7F31D-8DBA-400F-8ED2-DFF4300AEAA7'
<mt:If ${1:name}="$2"${3: ${4:eq}="$5"}>$6</mt:If>
TXT

  tab 'ignore', 'Ignore', <<-'TXT', uuid: '039E7D30-A2D9-449E-B7C8-F59689A0A44A'
<mt:Ignore>${1:$TM_SELECTED_TEXT}</mt:Ignore>
TXT

  tab 'include', 'Include', <<-'TXT', uuid: 'F03B8C1E-3429-462F-A78A-010D203130FD'
<\$mt:Include ${1:module}="$2"\$>
TXT

  tab 'mt', 'Block', <<-'TXT', uuid: '66CFA98F-06B7-4CF7-94C4-0BF0720487F0'
<mt:$1${2: name="$3"}>
	$4
</mt:$1>
TXT

  tab 'mt', 'Function', <<-'TXT', uuid: '269E117A-3A5C-46F7-A730-074604A22513'
<\$mt:$1\$>
TXT

  tab 'mttag', 'MT Container Tag', <<-'TXT', scope: 'source.perl', uuid: 'A98026DD-3E2E-455B-8EDA-FAAF24C8B323', file: 'Plugin Container Tag (ctag)'
MT::Template::Context->add_container_tag(${1:TagName} => \&${2:_hdlr_${1/(?:([a-z])([A-Z]))|([A-Za-z0-9_]+?)|( )|(.)/(?4:_:(?3:\L$3:(?1:$1_\L$2:)))/g}});

sub $2 {
	my (\$ctx, \$args, \$cond) = @_;
	$3
}

TXT

  tab 'mttag', 'MT Variable Tag', <<-'TXT', scope: 'source.perl', uuid: 'C62B4AA0-5E93-4681-AFDF-77707DEE71AB', file: 'Plugin Custom Tag (tag)'
MT::Template::Context->add_tag(${1:TagName} => \&${2:_hdlr_${1/(?:([a-z])([A-Z]))|([A-Za-z0-9_]+?)|( )|(.)/(?4:_:(?3:\L$3:(?1:$1_\L$2:)))/g}});

sub $2 {
	my (\$ctx, \$args, \$cond) = @_;
	$3
}

TXT

  tab 'unless', 'Unless', <<-'TXT', uuid: '742A8128-986C-43AE-B558-E08EF8799088'
<mt:Unless ${1:name}="$2"${3: ${4:eq}="$5"}>$6</mt:Unless>
TXT

  tab 'var', 'SetVarBlock', <<-'TXT', uuid: '0D563506-7A7B-44E1-9F1E-19728F10705E'
<mt:SetVarBlock name="$1">$2</mt:SetVarBlock>
TXT

  tab 'var', 'Var', <<-'TXT', uuid: '113F8862-74E3-4A9D-BFE8-4BED5ABF0E1B'
<\$mt:Var name="$1"${2: value="$3"}${4: escape="${5:html/js/url}"}\$>
TXT

end