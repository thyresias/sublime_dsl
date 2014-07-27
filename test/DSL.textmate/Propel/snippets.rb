# encoding: utf-8

snippets do

  default_scope 'text.xml'
  file_format :textmate

  tab '<c', 'xml - column', <<-'TXT', uuid: '8A4ECDB9-F980-4CDE-B098-1ADA7B3C1928'
<column name="${1:name}" type="${2:type}"${3: required="${4:true}"}${5: default="${6:}"} />
TXT

  tab '<f', 'xml - foreign key', <<-'TXT', uuid: '961E053E-5A74-4959-A303-D3B6A4FC247C'
<foreign-key foreignTable="${1:table}">
	<reference local="${1:table}_id" foreign="${2:id}"/>
</foreign-key>
TXT

  tab '<i', 'xml - index', <<-'TXT', uuid: '09EF9AD8-F6B8-4C66-BBD0-F8E1CC6AC97F'
<index name="${1:key}_index">
	<index-column name="${1:key}" />
</index>
TXT

  tab '<p', 'xml - primary key', <<-'TXT', uuid: '251F74BF-A606-4F1E-847F-EAB5CFF99954'
<column name="${1:id}" type="${2:integer}" required="true" primaryKey="true" autoincrement="true" />
TXT

  tab '<t', 'xml - table', <<-'TXT', uuid: 'BCE8C7F8-DFE0-4AEC-916C-E7541F2AC677'
<table name="${1:name}"${2: phpName="${3:php_name}"}>
	$0
</table>
TXT

  tab '<u', 'xml - unique', <<-'TXT', uuid: '2340D768-1E9F-455C-AC2E-1F1570A1424F'
<unique name="unique_${1:key}">
	<unique-column name="${1:key}" />
</unique>
TXT

end