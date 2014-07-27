# encoding: utf-8

commands 'Default' do

  item 'Package Control: Add Repository', add_repository
  item 'Package Control: Add Channel', add_channel
  item 'Package Control: Create Binary Package File', create_binary_package
  item 'Package Control: Create Package File', create_package
  item 'Package Control: Disable Package', disable_package
  item 'Package Control: Discover Packages', discover_packages
  item 'Package Control: Enable Package', enable_package
  item 'Package Control: Grab CA Certs', grab_certs
  item 'Package Control: Install Package', install_package
  item 'Package Control: List Packages', list_packages
  item 'Package Control: Remove Package', remove_package
  item 'Package Control: Upgrade Package', upgrade_package
  item 'Package Control: Upgrade/Overwrite All Packages', upgrade_all_packages
  item 'Preferences: Package Control Settings – Default', open_file("${packages}/Package Control/Package Control.sublime-settings")
  item 'Preferences: Package Control Settings – User', open_file("${packages}/User/Package Control.sublime-settings")

end
