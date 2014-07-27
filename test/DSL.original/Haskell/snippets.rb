# encoding: utf-8

snippets do

  default_scope 'source.haskell'

  tab '\\', '\t -> f t', <<-'TXT', file: 'Lambda'
\\${1:t} -> ${0:f t}
TXT

  tab 'case', 'Case', <<-'TXT'
case ${1:a} of ${2:True} -> ${3:$1}
	${1/./ /g}     ${4:otherwise} -> ${0:$1}
TXT

  tab 'instance', 'Instance', <<-'TXT'
instance ${1:Class} ${2:Data} where
	${3:func} = $0
TXT

  tab 'main', 'Main', <<-'TXT'
module Main where

main = ${1:putStrLn "Hello World"}
TXT

  tab 'mod', 'Module', <<-'TXT', file: 'module'
module ${1:Main} where

${2:main = ${3:putStrLn "Hello World"}}
TXT

end