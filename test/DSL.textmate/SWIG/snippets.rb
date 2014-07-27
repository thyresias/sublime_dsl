# encoding: utf-8

snippets do

  default_scope 'source.swig'
  file_format :textmate

  tab 'feat', '%feature', "%feature(\"${1:name}\") $2; ", uuid: 'DFB537AE-85B6-475C-A5AF-6CBB21D09C27'

  tab 'ign', '%ignore', <<-'TXT', uuid: '39CA1A04-5674-4C76-B8B9-E82DB6BBE987'
%ignore $1;
TXT

  tab 'inc', '%include', <<-'TXT', uuid: '942B1B60-7A94-4D2B-AEBC-274D650D4886'
%include "$1"
TXT

  tab 'mod', '%module', <<-'TXT', uuid: 'E9D7BD89-D3E7-41B0-B70D-C81FF5700E85'
%module${1:($2)} "${3:name}"
TXT

  tab 're', '%rename', <<-'TXT', uuid: 'E70D80C8-C8A0-4892-9CA7-3E54EAA9B8EB'
%rename(${1:new_name}) ${2:old_name};
TXT

  tab 'temp', '%template', <<-'TXT', uuid: 'BA930F3B-6BD7-430A-A285-5911B71CAE04'
%template(${1:name}) ${2:type};
TXT

end