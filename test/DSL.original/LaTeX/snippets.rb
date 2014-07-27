# encoding: utf-8

snippets do

  default_scope 'text.tex.latex'

  tab '$$', 'Display Math — \[ … \]', <<-'TXT', file: 'Displaymath-($$)'
\[
	$TM_SELECTED_TEXT$1
\]
TXT

  tab 'begin', '\begin{}…\end{}', <<-'TXT', file: 'begin{}-end{}'
\\begin{${1:env}}
	${1/(enumerate|itemize|list)|(description)|.*/(?1:\item )(?2:\item)/}$0
\\end{${1:env}}
TXT

  tab 'cas', 'Cases', <<-'TXT'
\begin{cases}
	${1:equation}, &\text{ if }${2:case}\\\\
	$0
\end{cases}
TXT

  tab 'cha', 'Chapter', <<-'TXT'
\chapter{${1:chapter name}} % (fold)
\label{cha:${2:${1/\\\w+\{(.*?)\}|\\(.)|(\w+)|([^\w\\]+)/(?4:_:\L$1$2$3)/g}}}
${0:$TM_SELECTED_TEXT}
% chapter $2 (end)
TXT

  tab 'desc', 'Description', <<-'TXT'
\\begin{description}
	\item[$1] $0
\\end{description}
TXT

  tab 'enum', 'Enumerate', <<-'TXT'
\\begin{enumerate}
	\item $0
\\end{enumerate}
TXT

  tab 'eq', 'Equation', <<-'TXT'
\begin{equation}
	$0
\end{equation}
TXT

  tab 'figure', 'Figure', <<-'TXT'
${1:Figure}~\ref{${2:fig:}}$0
TXT

  tab 'itd', '\item[description]', <<-'TXT', scope: 'text.tex.latex meta.function.environment.list', file: 'Item[description]'
\\item[${1:description}] ${0:item}
TXT

  tab 'item', 'Itemize', <<-'TXT'
\\begin{itemize}
	\item $0
\\end{itemize}
TXT

  tab 'listing', 'Listing', <<-'TXT'
${1:Listing}~\ref{${2:lst:}}$0

TXT

  tab 'mat', 'Matrix', <<-'TXT'
\begin{${1:p/b/v/V/B/small}matrix}
	$0
\end{${1:p/b/v/V/B/small}matrix}
TXT

  tab 'page', 'Page', <<-'TXT'
${1:page}~\pageref{$2}$0

TXT

  tab 'par', 'Paragraph', <<-'TXT'
\paragraph{${1:paragraph name}} % (fold)
\label{par:${2:${1/\\\w+\{(.*?)\}|\\(.)|(\w+)|([^\w\\]+)/(?4:_:\L$1$2$3)/g}}}
${0:$TM_SELECTED_TEXT}
% paragraph $2 (end)
TXT

  tab 'part', 'Part', <<-'TXT'
\part{${1:part name}} % (fold)
\label{prt:${2:${1/(\w+)|\W+/(?1:\L$0:_)/g}}}
${0:$TM_SELECTED_TEXT}
% part $2 (end)
TXT

  tab 'sec', 'Section', <<-'TXT', file: 'section-..-(section)'
\section{${1:section name}} % (fold)
\label{sec:${2:${1/\\\w+\{(.*?)\}|\\(.)|(\w+)|([^\w\\]+)/(?4:_:\L$1$2$3)/g}}}
${0:$TM_SELECTED_TEXT}
% section $2 (end)
TXT

  tab 'section', 'Section', <<-'TXT'
${1:Section}~\ref{${2:sec:}}$0

TXT

  tab 'spl', 'Split', <<-'TXT'
\begin{split}
	$0
\end{split}
TXT

  tab 'sub', 'Sub Section', <<-'TXT', file: 'subsection-..-(sub)'
\subsection{${1:subsection name}} % (fold)
\label{sub:${2:${1/\\\w+\{(.*?)\}|\\(.)|(\w+)|([^\w\\]+)/(?4:_:\L$1$2$3)/g}}}
${0:$TM_SELECTED_TEXT}
% subsection $2 (end)
TXT

  tab 'subp', 'Sub Paragraph', <<-'TXT', file: 'Sub-Paragraph'
\subparagraph{${1:subparagraph name}} % (fold)
\label{subp:${2:${1/\\\w+\{(.*?)\}|\\(.)|(\w+)|([^\w\\]+)/(?4:_:\L$1$2$3)/g}}}
${0:$TM_SELECTED_TEXT}
% subparagraph $2 (end)
TXT

  tab 'subs', 'Sub Sub Section', <<-'TXT', file: 'subsubsection-..-(ssub)'
\subsubsection{${1:subsubsection name}} % (fold)
\label{ssub:${2:${1/\\\w+\{(.*?)\}|\\(.)|(\w+)|([^\w\\]+)/(?4:_:\L$1$2$3)/g}}}
${0:$TM_SELECTED_TEXT}
% subsubsection $2 (end)
TXT

  tab 'tab', 'Tabular', <<-'TXT'
\\begin{${1:t}${1/(t)$|(a)$|(.*)/(?1:abular)(?2:rray)/}}{${2:c}}
$0${2/((?<=.)c|l|r)|./(?1: & )/g}
\\end{${1:t}${1/(t)$|(a)$|(.*)/(?1:abular)(?2:rray)/}}
TXT

  tab 'table', 'Table', <<-'TXT'
${1:Table}~\ref{${2:tab:}}$0
TXT

end