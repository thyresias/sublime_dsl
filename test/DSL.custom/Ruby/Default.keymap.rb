# encoding: utf-8

keymap 'Default' do

  conditionals if: 'si', and: 'et', or: 'ou'

  bind '#', insert_snippet(contents: "\#{${1:$SELECTION}}$0")
    # si setting.auto_match_enabled == true
    # et all.selector == "(string.quoted.double.ruby | string.interpolated.ruby) - string source"
    si all.selector == <<-SCOPE.gsub(/\s+/, ' ').strip
      ( string.quoted.double.ruby
      | string.interpolated.ruby
      | string.unquoted.interpolated.ruby
      ) - string source
    SCOPE
end
