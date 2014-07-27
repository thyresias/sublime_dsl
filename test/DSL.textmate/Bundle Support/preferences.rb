# encoding: utf-8

# FIXME: no scope
preferences 'Shared Support Path' => nil do
  shell_variable 'TM_SUPPORT_PATH', '$TM_BUNDLE_SUPPORT/shared'
  shell_variable 'PATH', '$PATH:$TM_SUPPORT_PATH/bin'
  uuid "65F25174-08DA-48A1-BD41-98C494972B97"
end
