# encoding: utf-8

snippets do

  default_scope 'text.xml.plist'
  file_format :textmate

  tab 'array', 'array', <<-'TXT', uuid: '8980A4DF-5255-4F70-8D4A-ED3BE0DAED0E'
<array>
	$0
</array>
TXT

  tab 'data', 'data', <<-'TXT', uuid: '9D710F5B-7E88-4CA1-B866-E00C3E52AAFC'
<data>
	$1
</data>
TXT

  tab 'date', 'date', <<-'TXT', uuid: '87529322-785A-4446-840F-6E669BE03063'
<date>${1:YYYY}${2/.+/-/}${2:MM}${3/.+/-/}${3:DD}${4/.+/T/}${4:hh}${5/.+/:/}${5:mm}${6/.+/:/}${6:ss}${4/.+/Z/}</date>
TXT

  tab 'dict', 'dict', <<-'TXT', uuid: '6F380BCA-86F8-411A-9570-8479727A40C6'
<dict>
	$0
</dict>
TXT

  tab 'f', 'false', <<-'TXT', uuid: '46E6D569-E146-4116-AB4C-D74D6463F160'
<false/>
TXT

  tab 'int', 'integer', <<-'TXT', uuid: '9A9CF12C-A358-48E2-A79D-4BA484164B21'
<integer>$1</integer>
TXT

  tab 'key', 'key', <<-'TXT', uuid: 'CB054597-2636-45F7-B620-93E3E1CBE917'
<key>$1</key>
TXT

  tab 'plist', 'plist', <<-'TXT', uuid: '38A33B03-FD95-47C9-9525-423BCD737932'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
$0
</plist>
TXT

  tab 'real', 'real', <<-'TXT', uuid: 'E8DC4BC2-C315-4159-B0F7-24902F2C01BE'
<real>$1</real>
TXT

  tab 'str', 'string', <<-'TXT', uuid: 'B454B512-8514-4293-AF58-60CE3FFDB05A'
<string>$1</string>
TXT

  tab 't', 'true', <<-'TXT', uuid: '651313F5-EC36-48F2-A815-838D47B67BEF'
<true/>
TXT

end