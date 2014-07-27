# encoding: utf-8

snippets do

  default_scope 'source.s5'
  file_format :textmate

  tab 'controls', 'Controls', <<-'TXT', uuid: '5FE4E6AA-D9C1-43AB-9C44-82F2AE6A4916'
Controls: ${1:visible|hidden}
TXT

  tab 'cut', 'Slide Divider', <<-'TXT', uuid: '8761D7E2-80EE-4531-84E2-8B71B0FF7A77', file: 'Cut'
✂------✂------✂------✂------✂------✂------✂------✂------✂------✂------

TXT

  tab 'hand', 'Handout', <<-'TXT', uuid: '4DD5128E-939A-41FA-92C5-5CB62C584533'
__________

${1:Notes for printout}

TXT

  tab 'note', 'Notes', <<-'TXT', uuid: '24D8B922-37F5-43EB-AD4D-625969A16AEF'
##########

${1:Notes for presenting}

TXT

  tab 'slide', 'New Slide', <<-'TXT', uuid: '9338A42C-2B70-4E7B-BBD2-34369E8B0418'
✂------✂------✂------✂------✂------✂------✂------✂------✂------✂------

${1:Heading}
${1/(.)|(?m:\n.*)/(?1:=)/g}
${2:Subheading}
${2/(.)|(?m:\n.*)/(?1:-)/g}

${3:* Point One
* Point Two
  * Subpoint
* Point Three}

TXT

  tab 'view', 'View', <<-'TXT', uuid: '09734BA5-3B2D-422C-93E6-D0AEE6EA68C5', file: 'Display'
View: ${1:slideshow|outline}
TXT

end