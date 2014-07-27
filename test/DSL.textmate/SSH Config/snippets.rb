# encoding: utf-8

snippets do

  default_scope 'source.ssh-config'
  file_format :textmate

  tab 'df', 'DynamicForward', <<-'TXT', uuid: 'C1383DD1-64AA-46E1-B9E9-5A243790B81B', file: 'DynamicForward (df)'
DynamicForward ${1:0000}
TXT

  tab 'host', 'Host', <<-'TXT', uuid: '215B06B5-5201-481E-87EC-6B912C3A33E9', file: 'Host (host)'
Host ${1:AliasName}
	User ${2:UserName}
	Port ${3:22}
	HostName ${4:hostname.com}

TXT

  tab 'idf', 'IdentityFile', <<-'TXT', uuid: '4E6A957C-0BFD-4265-A701-43088ED0A365', file: 'IdentityFile (idf)'
IdentityFile ${1:~/.ssh/filename}
TXT

  tab 'lf', 'LocalForward', <<-'TXT', uuid: 'C9DE9563-3446-49D3-B87C-8F12B0A2CC8B', file: 'LocalForward (lf)'
LocalForward ${1:LocalPort} ${2:DestHost}:${3:DestPort}
TXT

end