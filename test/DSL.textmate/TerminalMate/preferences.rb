# encoding: utf-8

preferences 'Haskell' => 'source.haskell' do
  shell_variable 'TERMINAL_MATE_LOAD', ':load %s'
  shell_variable 'TERMINAL_MATE_NEW', 'ghci'
  shell_variable 'TERMINAL_MATE_FILE_EXTENSION', '.hs'
  uuid "893492E6-754F-440E-BA86-0A3EFC311839"
end

preferences 'Ocaml' => 'source.ocaml' do
  shell_variable 'TERMINAL_MATE_LOAD', ''
  shell_variable 'TERMINAL_MATE_NEW', 'ocaml'
  uuid "5CD9D96B-B721-4AFD-AD55-51788292619B"
end

preferences 'Python' => 'source.python' do
  shell_variable 'TERMINAL_MATE_LOAD', ''
  shell_variable 'TERMINAL_MATE_NEW', 'python'
  uuid "A464AA15-5064-4A4D-9742-6BE2A5F3999B"
end

preferences 'Rails' => 'source.ruby.rails' do
  shell_variable 'TERMINAL_MATE_LOAD', 'load "%s"'
  shell_variable 'TERMINAL_MATE_NEW', './script/console'
  uuid "FA21F17D-ACEE-4FB7-BBDD-DA5590DEAD75"
end

preferences 'Ruby' => 'source.ruby' do
  shell_variable 'TERMINAL_MATE_LOAD', 'load "%s"'
  shell_variable 'TERMINAL_MATE_NEW', 'irb'
  uuid "9A374A7A-22A2-4969-BF9B-46DE9B356A84"
end

preferences 'Shell' => 'source.shell' do
  shell_variable 'TERMINAL_MATE_LOAD', '%s'
  shell_variable 'TERMINAL_MATE_NEW', ''
  shell_variable 'TERMINAL_MATE_FILE_EXTENSION', '.sh'
  uuid "D320A79B-16FC-4C77-AB73-EF0E737AEBD7"
end
