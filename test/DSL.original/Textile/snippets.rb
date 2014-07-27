# encoding: utf-8

snippets do

  default_scope 'text.html.textile'

  tab 'acr', 'Acronym', <<-'TXT'
${1:ABC}(${2:Always Be Closing})
TXT

  tab 'bq', 'Block Quote', <<-'TXT', file: 'Block-Quotes'
bq. ${1:A quote...}

$0
TXT

  tab 'h1', 'Heading 1', <<-'TXT', file: 'Heading-1'
h1. ${1:Text...}

$0
TXT

  tab 'h2', 'Heading 2', <<-'TXT', file: 'Heading-2'
h2. ${1:Text...}

$0
TXT

  tab 'h3', 'Heading 3', <<-'TXT', file: 'Heading-3'
h3. ${1:Text...}

$0
TXT

  tab 'h4', 'Heading 4', <<-'TXT', file: 'Heading-4'
h4. ${1:Text...}

$0
TXT

  tab 'h5', 'Heading 5', <<-'TXT', file: 'Heading-5'
h5. ${1:Text...}

$0
TXT

  tab 'h6', 'Heading 6', <<-'TXT', file: 'Heading-6'
h6. ${1:Text...}

$0
TXT

  tab 'img', 'Image', <<-'TXT'
!${1:http://site.com/image}(${2:Title})!
TXT

  tab 'linkimg', 'Linked Image', <<-'TXT', file: 'Linked-Image'
!${1:http://site.com/image}(${2:Title})!:${3:http://linkedsite.com}
TXT

end