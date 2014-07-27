# encoding: utf-8

menu 'Main' do

  item 'Prefere&nces', id: 'preferences' do
    item '&Package Settings', id: 'package-settings' do
      item 'Package Control' do
        item 'Settings – Default', open_file("${packages}/Package Control/Package Control.sublime-settings")
        item 'Settings – User', open_file("${packages}/User/Package Control.sublime-settings")
        item '-'
      end
    end
    item 'Pa&ckage Control', show_overlay("command_palette", text: "Package Control: ")
  end

end
