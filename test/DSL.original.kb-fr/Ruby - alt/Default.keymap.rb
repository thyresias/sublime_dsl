
keymap 'Default' do

  keyboard 'AZERTY-fr-FR-v6 (Windows 7)'
  conditionals if: 'si', and: 'et', or: 'ou'

  bind '#', insert_snippet(contents: "\#{${1:$SELECTION}}$0")
    si all.selector == "(string.quoted.double.ruby | string.interpolated.ruby) - string source"

end
