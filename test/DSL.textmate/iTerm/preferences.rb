# encoding: utf-8

preferences 'Scheme' => 'source.scheme', file: 'Chicken Scheme' do
  shell_variable 'SHELL_NAME', 'TextMate Scheme Interactive'
  shell_variable 'SHELL_INTERPRETER', 'csi'
  uuid "0C1E158A-E025-450F-8AE0-FE43AD2489C5"
end

preferences 'Haskell' => 'source.haskell' do
  shell_variable 'SHELL_NAME', 'TextMate Haskell Interactive'
  shell_variable 'SHELL_INTERPRETER', 'ghci'
  uuid "A261866E-1954-49F7-B998-9DA7F2CEFF7F"
end
