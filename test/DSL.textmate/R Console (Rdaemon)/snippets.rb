# encoding: utf-8

snippets do

  default_scope 'text.tex.latex'
  file_format :textmate

  tab 'rd', '\begin{Rdaemon}…\end{Rdaemon}', <<-'TXT', uuid: 'A62D57CE-BEB3-4C22-94BA-5E63F8473791'
\\begin{Rdaemon}
> $0
\\end{Rdaemon}
TXT

  tab 'rdenv', '\newenvironment{Rdaemon}', "\\usepackage{moreverb}\n\\newenvironment{Rdaemon}% \n{\\endgraf\\noindent % \n \\endgraf\\verbatimtab}% \n{\\endverbatimtab}\n", uuid: 'B4777ECF-31B2-4B50-912A-028F3F620186'

end