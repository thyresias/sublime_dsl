# encoding: utf-8

settings 'Package Control' do

  channels %w(https://sublime.wbond.net/channel.json)
  repositories []
  certs "api.bitbucket.org"=>["7d0986b90061d60c8c02aa3b1cf23850", "https://sublime.wbond.net/certs/7d0986b90061d60c8c02aa3b1cf23850"], "api.github.com"=>["7d0986b90061d60c8c02aa3b1cf23850", "https://sublime.wbond.net/certs/7d0986b90061d60c8c02aa3b1cf23850"], "bitbucket.org"=>["7d0986b90061d60c8c02aa3b1cf23850", "https://sublime.wbond.net/certs/7d0986b90061d60c8c02aa3b1cf23850"], "codeload.github.com"=>["7d0986b90061d60c8c02aa3b1cf23850", "https://sublime.wbond.net/certs/7d0986b90061d60c8c02aa3b1cf23850"], "downloads.sourceforge.net"=>["221e907bdfff70d71cea42361ae209d5", "https://sublime.wbond.net/certs/221e907bdfff70d71cea42361ae209d5"], "github.com"=>["7d0986b90061d60c8c02aa3b1cf23850", "https://sublime.wbond.net/certs/7d0986b90061d60c8c02aa3b1cf23850"], "nodeload.github.com"=>["7d0986b90061d60c8c02aa3b1cf23850", "https://sublime.wbond.net/certs/7d0986b90061d60c8c02aa3b1cf23850"], "raw.github.com"=>["7d0986b90061d60c8c02aa3b1cf23850", "https://sublime.wbond.net/certs/7d0986b90061d60c8c02aa3b1cf23850"], "sublime.wbond.net"=>["221e907bdfff70d71cea42361ae209d5", "https://sublime.wbond.net/certs/221e907bdfff70d71cea42361ae209d5"]
  install_prereleases false
  debug false
  package_name_map Hash.new
  submit_usage true
  submit_url 'https://sublime.wbond.net/submit'
  auto_upgrade true
  install_missing true
  auto_upgrade_frequency 1
  auto_upgrade_ignore []
  timeout 30
  cache_length 300
  http_proxy ''
  https_proxy ''
  proxy_username ''
  proxy_password ''
  http_cache true
  http_cache_length 604800
  user_agent 'Sublime Package Control v%s'
  ignore_vcs_packages false
  git_binary ''
  git_update_command %w(pull --ff --commit)
  hg_binary ''
  hg_update_command %w(pull --update)
  openssl_binary ''
  dirs_to_ignore %w(.hg .git .svn _darcs CVS)
  files_to_ignore %w(.hgignore .gitignore .bzrignore *.pyc *.sublime-project *.sublime-workspace *.tmTheme.cache)
  files_to_include []
  files_to_ignore_binary %w(.hgignore .gitignore .bzrignore *.py *.sublime-project *.sublime-workspace *.tmTheme.cache)
  files_to_include_binary %w(__init__.py)
  package_destination ''

end
