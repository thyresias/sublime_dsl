
keymap 'Default (Windows)' do

  keyboard 'AZERTY-fr-FR-v6 (Windows 7)'
  conditionals if: 'si', and: 'et', or: 'ou'

  bind ':', insert_snippet(contents: ":$0;")
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    et all.selector == "source.css - meta.selector.css"
    et all.following_text =~ /^(?:\t| |\}|$)/
  bind ';', move(by: "characters", forward: true)
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    et all.selector == "source.css - meta.selector.css"
    et all.following_text =~ /^;/
  bind 'backspace', run_macro_file("Packages/Default/Delete Left Right.sublime-macro")
    si setting.auto_match_enabled == true
    et all.selection_empty == true
    et all.selector == "source.css - meta.selector.css"
    et all.preceding_text =~ /:$/
    et all.following_text =~ /^;/

end
