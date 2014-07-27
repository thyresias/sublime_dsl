# encoding: utf-8

snippets do

  default_scope 'comment.block.documentation.javadoc'
  file_format :textmate

  # FIXME: illegal XML character "\u0003" replaced by 'ETX'
  key "ETX", 'Continue Doc Block', <<-'TXT', uuid: '02326442-41DB-4A66-902D-119B4A9B606D'

* $0
TXT

  key "^@/", 'New Doc Block', <<-'TXT', scope: 'source.java, source.groovy', uuid: 'D581B98E-E266-4059-A94E-F8FA1684917F'
/**
 * $0
 */
TXT

  tab 'a', 'author', <<-'TXT', uuid: '6CBBA65F-4DE1-4B59-B016-0D8CE3FFA2AD'
@author ${0:$TM_FULLNAME}
TXT

  tab 'd', 'deprecated', <<-'TXT', uuid: 'D89917BE-DC05-4319-8FD2-001C37CD831B'
@deprecated ${0:description}
TXT

  tab 'null', 'null', <<-'TXT', uuid: 'C361952E-F4F1-4CCF-B6E9-080EA560C9E2'
{@code null}
TXT

  tab 'p', 'param', <<-'TXT', uuid: 'A0F1CF90-D2AC-4F52-90A2-BCEC410B26B7'
@param ${1:var} ${0:description}
TXT

  tab 'r', 'return', <<-'TXT', uuid: '01870B8C-D2C7-486D-9946-41D302C4AE7B'
@return ${0:description}
TXT

  tab 's', 'see', <<-'TXT', uuid: '3F96FB16-B2CB-421D-A18E-4E9FAF0D9577'
@see ${0:reference}
TXT

  tab 'sd', 'serialData', <<-'TXT', uuid: 'EC8D16AB-CF3B-485A-9A34-AF6C4B8D3F2D'
@serialField ${0:description}
TXT

  tab 'se', 'serial', <<-'TXT', uuid: '3AEE39A5-710C-495F-AA7B-9328FF69DA60'
@serial ${0:description}
TXT

  tab 'sf', 'serialField', <<-'TXT', uuid: 'C2338573-C4C0-4A47-A6BC-0744E01DD359'
@serialField ${1:name} ${2:type} ${0:description}
TXT

  tab 'si', 'since', <<-'TXT', uuid: '8C789B6F-ACFD-4848-9D71-10BD2365698A'
@since ${0:version}
TXT

  tab 't', 'throws', <<-'TXT', uuid: '040A5386-1DE7-4A68-877D-CD4BFEF7A05B'
@throws ${1:class} ${0:description}
TXT

  tab 'v', 'version', <<-'TXT', uuid: 'A54F1BB7-9FB9-438A-8737-F3E8D858AA70'
@version ${0:version}
TXT

  tab '{', 'code', <<-'TXT', uuid: '38CD567C-0950-4CA1-90B7-DD267F55B162'
{@code $0
TXT

  tab '{', 'docRoot', <<-'TXT', uuid: '9139ACF5-11D8-431E-9578-4A8497B09FCD'
{@docRoot
TXT

  tab '{', 'inheritDoc', <<-'TXT', uuid: '8F0674CE-8433-4DA7-8F1A-06D081870573'
{@inheritDoc
TXT

  tab '{', 'link', <<-'TXT', uuid: '67E0098B-8231-4EEF-AC3B-57F7E67878A2'
{@link ${1:target} ${0:label}
TXT

  tab '{', 'linkplain', <<-'TXT', uuid: '42AE205D-3DD6-4B21-8DD9-C6D94CC8A6BC'
{@linkplain ${1:target} ${0:label}
TXT

  tab '{', 'literal', <<-'TXT', uuid: 'D260D1B4-5327-4FEC-B4EB-68B9634A14B0'
{@literal $0
TXT

  tab '{', 'value', <<-'TXT', uuid: 'AD26BB26-F3C3-40CB-938D-218851375811'
{@value $0
TXT

end