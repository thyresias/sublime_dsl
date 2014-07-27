# encoding: utf-8

snippets do

  default_scope 'text.xml.pom'
  file_format :textmate

  tab 'dep', 'dependency', <<-'TXT', uuid: '8A46FDB2-94F2-4811-B979-8BF697D1FF84'
<dependency>
	<groupId>$1</groupId>
	<artifactId>$2</artifactId>
	<version>$3</version>${4/(.+)/(?1:
	)/}${4:<scope>$5</scope>}${6/(.+)/(?1:
	)/}${6:<classifier>$7</classifier>}
</dependency>$0
TXT

end