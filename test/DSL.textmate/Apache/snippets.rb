# encoding: utf-8

snippets do

  default_scope 'source.apache-config'
  file_format :textmate

  tab 'allow', 'Allow Override', <<-'TXT', uuid: 'C6256A3A-BC6E-4587-8D3C-6588AD5F89F5', file: 'AllowOverride (allow)'
AllowOverride ${1:${2:AuthConfig }${3:FileInfo }${4:Indexes }${5:Limit }${6:Options}}
TXT

  tab 'dir', 'Directory', <<-'TXT', uuid: '894AF995-B54F-43CC-8810-2A0CCD56B168'
<Directory ${1:/Library/WebServer/${2:example/}}>
	$0
</Directory>

TXT

  tab 'opt', 'Options', <<-'TXT', uuid: '230ED58C-E1B9-4BA6-A034-6F5629B6F46C', file: 'Options (opt)'
Options ${1:${2:All }${3:ExecCGI }${4:FollowSymLinks }${5:Includes }${6:IncludesNOEXEC }${7:Indexes }${8:MultiViews }${9:SymLinksIfOwnerMatch}}
TXT

  tab 'vhost', 'Virtual Host', <<-'TXT', uuid: '12F1DA22-C375-4DF5-B0C5-87BA2AA38AB0', file: 'VirtualHost (vhost)'
<VirtualHost ${1:example.org}>
	ServerAdmin webmaster@$1
	DocumentRoot /www/vhosts/$1
	ServerName $1
	ErrorLog logs/$1-error_log
	CustomLog logs/$1-access_log common
</VirtualHost>
TXT

end