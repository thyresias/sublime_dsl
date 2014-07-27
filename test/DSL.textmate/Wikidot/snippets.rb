# encoding: utf-8

snippets do

  default_scope 'text.html.wikidot'
  file_format :textmate

  key "^L", 'Link (external, with title look up)', <<-'TXT', uuid: 'C8BCB154-FF9D-4925-B42E-DB2DEBCCC777'
#!/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby
require "#{ENV['TM_SUPPORT_PATH']}/lib/progress.rb"
require 'open-uri'
link = "http://site.com"
title = STDIN.read
urlpattern = Regexp.new('^(http(?:s?)\:\/\/)?([a-zA-Z0-9\-\._]+(?:\.[a-zA-Z0-9\-\._]{2,3}))(\/[a-zA-Z0-9\-\.\?\,\'\/\\\+&%\$#_=]*)?$')
s = IO.popen('pbpaste', 'r+').read
if s.match(urlpattern) then
  protocol, site, file = s.match(urlpattern)[1,3]
  protocol = "http://" if protocol.nil?
  link = protocol + site
  link = link + file unless file.nil?
  TextMate.call_with_progress(:title => "Opening Link", :message => "Retrieving Title (#{site})") do
    begin
    fp = open(link)
    title = fp.read.match(/<title>([^<>]*)<\/title>/i).to_a[1].strip
    rescue
       title = "Unknown"
    end
  end
end
print %{[${1:#{link}}|${2:#{title}}]}$0
TXT

  tab '+1', 'googlePlusOne', <<-'TXT', uuid: 'F3D96614-EDCA-4B4D-A41B-452E8C8EBDAE'
[[include :snippets:plusone-button
|url=${1:http://timbates.wikidot.com/}
|size=medium
|count=true
]]

TXT

  tab 'anchor', 'Insert Anchor', <<-'TXT', uuid: '4B11EE30-6587-4D35-867F-164CA253D292', key_equivalent: "^A"
[[# ${1:$TM_SELECTED_TEXT}]]$0
TXT

  tab 'back', 'backlinks', <<-'TXT', uuid: '9EB92300-4B11-4567-A03F-26824791419E'
+ Backlinks
[[module Backlinks]]

TXT

  tab 'bib', 'Insert Bibliography (bib)', <<-'TXT', uuid: '028D4274-50F8-439F-A51C-EB2568A967B4', bundle_uuid: '64C4222F-7054-4A26-B91E-A82F53166142'
[[bibliography]]
ref$0
[[/bibliography]]
TXT

  tab 'code', 'Code', <<-'TXT', uuid: 'E9F1B423-2E24-4E8A-B732-A07AFBBB1429'
[[code${1: type="php"}]]
  ${2:$TM_SELECTED_TEXT}
[[/code]]
$0
TXT

  tab 'crumbs', 'Bread-crumb trail (crumbs)', <<-'TXT', uuid: '4187B367-2900-4810-8A99-4BABF4FB95B2', file: 'Bread-crumb trail'
++ Contents
[[module PageTree root="${1:Start}" depth="${2:3}"]]


TXT

  tab 'ffmpeg', 'ffmpeg', <<-'TXT', scope: 'text', uuid: '3567CFB0-886E-4A35-A3E1-AB47374684AA'
ffmpeg -i ${1:in}.wmv -vcodec mpeg4 $2.mpg
TXT

  tab 'fn', 'Footnote', <<-'TXT', uuid: 'D580EB0B-8AEC-4911-B632-67EF97444178'
[[${1:TM_SELECTED_TEXT}]]${2:Content of footnote.}[[/footnote]]
TXT

  tab 'grant', 'grant', "[[[grants-to-write]]]: ", uuid: '2C642166-F92A-42A0-BFA8-492ED17A2D1B'

  tab 'head', 'Head', <<-'TXT', uuid: '8C9E8F5C-9E6D-4C04-B727-613CF52A541E'
[[toc]]
++ Contents
[[module PageTree root="${1:Start}" depth="3"]]

[[${1:f>}toc]]
+ Backlinks
[[module Backlinks]]

TXT

  tab 'img', 'Image', <<-'TXT', uuid: '9F9951A8-F11E-429B-A8CD-709BBE086A12', key_equivalent: "^I"
[[image ${1:source_name}]]
TXT

  tab 'link', 'Link (internal)', <<-'TXT', uuid: '25FEE36D-AB98-42A3-946E-8E22636F1D43', key_equivalent: "^L"
[[[${1:$TM_SELECTED_TEXT}${2:|${3:$TM_SELECTED_TEXT}}]]]$0
TXT

  tab 'link', 'Link to Anchor', <<-'TXT', uuid: '5E271D1F-B04C-4A2C-A6B8-58AE0943C07F', file: 'Anchor', key_equivalent: "^L"
[[#${1:anchor_name}]]$0
TXT

  tab 'ol', 'Ordered List', "# ", uuid: '54F4ED4F-2FEF-4FA0-922D-1BFAE6DD0277'

  tab 'ref', 'Reference : label: Author (year)...', <<-'TXT', uuid: '23FF43DD-CC8C-440B-8282-DCE50E253AEB', bundle_uuid: '64C4222F-7054-4A26-B91E-A82F53166142', file: 'Reference ˂ref˃Author (year)___˂˸ref˃ copy'
: ${1:label} : ${2:${3:Authors} (${4:Year}). ${5:Title}. ${6:Source}, ${7:volume}, ${8:pages}}.
TXT

  tab 'table', 'Insert table', "||~ ${1:head0} ||~ ${2:head1} ||~ ${3:head2} ||\n|| ${4:data}   || ${5:data}   || ${6:data}   || \n|| ${7:data}   || ${8:data}   || ${9:data}   || \n|| ${10:data}  || ${11:data}  || ${12:data}  ||\n", uuid: 'D1A28F51-CCB4-4F3A-BD8C-D0276F69F936', file: 'Table'

  tab 'toc', 'ToC (toc)', <<-'TXT', uuid: '0D54055D-2785-45C0-8EFB-5E13C2B9E8A8', file: 'ToC'
[[${1:f>}toc]]
TXT

  tab 'todo', 'To-do', "[[[To-do]]]: ", uuid: 'AB53FA13-71BE-42CB-B4A4-AC49ECDB5AEC'

  tab 'ul', 'Unordered List', "* ", uuid: '0D5126FC-8F5D-43CC-AFAF-C7A8EF856340'

  # FIXME: illegal XML character "\u0003" replaced by 'ETX'
  tab 'un', 'Ordered List Item', "\n# ", scope: 'markup.list.numbered.wikidot', uuid: '12616A60-17BA-4369-93EE-8770B4D62F5D', key_equivalent: "ETX"

  # FIXME: illegal XML character "\u0003" replaced by 'ETX'
  tab 'un', 'Unordered Item', "\n* ", scope: 'markup.list.unnumbered.wikidot', uuid: 'D3A76700-289A-4687-A2BD-F5BC9488F17D', key_equivalent: "ETX"

  # FIXME: missing scope, will be default_scope
  tab 'w', 'wikipedia', <<-'TXT', uuid: '75F09BF6-A264-49B3-9C71-D6DB32849A50'
[wikipedia:${1/([^ ]*)( )(.*$)/$1(?1:_)$3/} ${1:$TM_SELECTED_TEXT}]
TXT

end