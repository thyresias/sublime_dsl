# encoding: utf-8

snippets do

  default_scope 'text.blog'
  file_format :textmate

  tab 'comments', 'Comments', <<-'TXT', uuid: '6CEE1440-987D-4E37-BA50-9AD23784D2E5', file: 'Comments (comments)'
Comments: On
TXT

  tab 'cut', 'Cut', <<-'TXT', uuid: '6F1CF327-E4C8-49D8-BD30-FD6F987AE23A', file: 'Cut (cut)'
✂------✂------✂------✂------✂------✂------✂------✂------✂------✂------

TXT

  tab 'date', 'Date', <<-'TXT', uuid: 'B55BA9A1-0F22-45F4-B7C8-B216BF038AF9', file: 'Date (date)'
Date: `date +"%Y-%m-%d %H:%M:%S"`
TXT

  tab 'keyw', 'Keywords', "Keywords: ", uuid: '5CCBC664-2477-4C8C-8B8B-7B57DB15DB23', file: 'Keywords (keyw)'

  tab 'ping', 'Ping', <<-'TXT', uuid: '853BB979-1DA2-4D78-B50D-092B80A1877F', file: 'Ping (ping)'
Ping: ${1:http://www.example.com/post/ping/}

TXT

  tab 'pings', 'Pings', <<-'TXT', uuid: '2238B6A6-0961-4DC6-917D-477F776CAF9D', file: 'Pings (pings)'
Pings: On
TXT

  tab 'tags', 'Tags', "Tags: ", uuid: 'D947660B-DD37-44C3-B4A5-7003B90CD0DD', file: 'Tags (tags)'

  tab 'title', 'Title', "Title: ", uuid: '5C0A6073-6592-4841-83A0-C03D742074E5', file: 'Title (title)'

end