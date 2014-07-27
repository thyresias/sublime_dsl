# encoding: utf-8

snippets do

  default_scope 'text.tex.latex'
  file_format :textmate

  # FIXME: illegal XML character "\u0003" replaced by 'ETX'
  key "ETX", 'Add Row', <<-'TXT', scope: 'text.tex.latex meta.function.environment.tabular.latex', uuid: 'F59D0C3A-B5AC-40D6-AB07-05CE8CB784A9', file: 'New Line'
\\\\
$0${TM_CURRENT_LINE/^[^&]+|[^&]+$|([^&]+)/ (?1: )/g}
TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, 'Beamer Overlay Specification', <<-'TXT', scope: 'text.tex.latex.beamer', uuid: 'BDA02D31-3097-4726-9A93-7AAA4576F676'
<${1:+-}>
TXT

  key "^E", 'Command — \command{…}', <<-'TXT', uuid: '7D3548FA-AE80-11D9-8B45-000D93B6E43C', file: 'Change Style of selected text'
\\${1:text${2:bf}}{$TM_SELECTED_TEXT}
TXT

  key "^`", 'Double Quotes', <<-'TXT', uuid: '903B133A-B073-40C2-83DD-7B1E6D435A26', file: 'Wrap selection in double quotes'
\`\`$TM_SELECTED_TEXT''
TXT

  key "^@W", 'Environment — \begin{}…\end{}', <<-'TXT', uuid: '2D7B6866-400B-4120-9EC1-0397E33169A1', file: 'Wrap Selection in Environment'
${TM_SELECTED_TEXT/(\s*).*/$1/m}\begin{${1:environment}}
${TM_SELECTED_TEXT/(.+)|\n\z/(?1:\t$0)/g}
${TM_SELECTED_TEXT/(\s*).*/$1/m}\end{${1:environment}}

TXT

  key "^L", 'Itemize Lines in Selection', <<-'TXT', uuid: 'A7B97D14-AE83-11D9-8B45-000D93B6E43C', file: 'Lines to list environment'
\begin{${1:itemize}}
${TM_SELECTED_TEXT/^(([^\\\\]*):\s*)?(.+)$/\n\t\item(?1: [ $2 ]) $3/g}
\end{${1:itemize}}

TXT

  key "^L", 'left…right — \left…\right', <<-'TXT', uuid: '2BCB6911-2FE8-4D28-9E9C-4AE5F54F6E72', file: 'Wrap in ʅleft-ʅright'
${TM_SELECTED_TEXT/(.*)(.)/\\left$1\\right$2/}
TXT

  key "^M", 'Math Mode — \( … \)', <<-'TXT', uuid: '445F9B97-7D25-4262-A715-03F9D688856A', file: 'Math mode ʅ( ʅ)'
\( $TM_SELECTED_TEXT$1 \)
TXT

  key "^[", 'Unnumbered Equation', <<-'TXT', uuid: '7F7578B0-58F3-44B3-9278-1CBEA9C58208'
\\[
	$0
\\]
TXT

  tab '$$', 'Display Math — \[ … \]', <<-'TXT', uuid: 'F38DDE93-BF77-449D-A4C9-6C525ECAC6FB', file: 'Displaymath ($$)', key_equivalent: "^M"
\[
	$TM_SELECTED_TEXT$1
\]
TXT

  tab 'ali', 'Align(ed)', <<-'TXT', uuid: 'EEAC1CE5-50DD-42B0-96D6-08EB81E58754', file: 'Align'
\begin{align`echo $TM_SCOPE|grep math|
sed -e 's/.*math.*/ed/'`}
	$0
\end{align`echo $TM_SCOPE|grep math|
sed -e 's/.*math.*/ed/'`}
TXT

  tab 'begin', '\begin{}…\end{}', <<-'TXT', uuid: '688FBE87-D5B4-445D-AD02-231F6E99F9C1'
\\begin{${1:env}}
	${1/(enumerate|itemize|list)|(description)|.*/(?1:\item )(?2:\item)/}$0
\\end{${1:env}}
TXT

  tab 'cas', 'Cases', <<-'TXT', uuid: 'EE7D14B5-9620-4A1B-866B-91E26FB481DB'
\begin{cases}
	${1:equation}, &\text{ if }${2:case}\\\\
	$0
\end{cases}
TXT

  tab 'cha', 'Chapter', <<-'TXT', uuid: '47FA7321-6BDC-413B-9F59-63ACBB0E2080'
\chapter{${1:chapter name}} % (fold)
\label{cha:${2:${1/\\\\\w+\{(.*?)\}|\\\\(.)|(\w+)|([^\w\\\\]+)/(?4:_:\L$1$2$3)/g}}}
${0:$TM_SELECTED_TEXT}
% chapter $2 (end)
TXT

  tab 'desc', 'Description', <<-'TXT', uuid: '2F926912-E5E6-4965-8E50-0603765DD0E6'
\\begin{description}
	\item[$1] $0
\\end{description}
TXT

  tab 'enum', 'Enumerate', <<-'TXT', uuid: '03F30619-2739-447F-953D-DB225185E4D2'
\\begin{enumerate}
	\item $0
\\end{enumerate}
TXT

  tab 'eq', 'Equation', <<-'TXT', uuid: '23B04BBB-ACE7-44A7-B313-09DC4874B2C0'
\begin{equation}
	$0
\end{equation}
TXT

  tab 'equation', 'Equation', <<-'TXT', uuid: '2E6F374A-C713-42BF-A7E9-C8728201A15A', file: 'Equation 2'
${1:Equation}~\eqref{${2:eq:}}$0
TXT

  tab 'figure', 'Figure', <<-'TXT', uuid: 'C4288DF5-A4DA-4F35-9AB9-4062EE5B7E61'
${1:Figure}~\ref{${2:fig:}}$0
TXT

  tab 'frame', 'Frame', <<-'TXT', scope: 'text.tex.latex.beamer', uuid: 'D5598935-ACE9-494D-BB2F-4B85066CBF45'
\begin{frame}[t]{${1:title}}
	${0:$TM_SELECTED_TEXT}
\end{frame}
%--- Next Frame ---%
TXT

  tab 'gat', 'Gather(ed)', <<-'TXT', uuid: 'BE56EE31-7C87-43A6-B0ED-7E5C31432C1C'
\begin{gather`echo $TM_SCOPE|grep math|
sed -e 's/.*math.*/ed/'`}
	$0
\end{gather`echo $TM_SCOPE|grep math|
sed -e 's/.*math.*/ed/'`}
TXT

  tab 'itd', '\item[description]', <<-'TXT', scope: 'text.tex.latex meta.function.environment.list', uuid: 'BC8B98E2-5F16-11D9-B9C3-000D93589AF6', file: 'Item[description]'
\\item[${1:description}] ${0:item}
TXT

  tab 'item', 'Itemize', <<-'TXT', uuid: 'CC9CC561-4BD2-4E50-A211-8C6141FFDE69'
\\begin{itemize}
	\item $0
\\end{itemize}
TXT

  tab 'listing', 'Listing', <<-'TXT', uuid: '0F8A8F61-0AE1-44F8-B4FA-01D4F877E9EE'
${1:Listing}~\ref{${2:lst:}}$0
TXT

  tab 'mat', 'Matrix', <<-'TXT', uuid: '66265AD6-3D2A-4888-9A9B-2B37860C79F3'
\begin{${1:p/b/v/V/B/small}matrix}
	$0
\end{${1:p/b/v/V/B/small}matrix}
TXT

  tab 'page', 'Page', <<-'TXT', uuid: 'FD59489B-7437-48DD-A4EC-9AF3AB2FCF19'
${1:page}~\pageref{$2}$0
TXT

  tab 'par', 'Paragraph', <<-'TXT', uuid: '76987ABA-D716-4F75-ADC1-5FB767FC460E'
\paragraph{${1:paragraph name}} % (fold)
\label{par:${2:${1/\\\\\w+\{(.*?)\}|\\\\(.)|(\w+)|([^\w\\\\]+)/(?4:_:\L$1$2$3)/g}}}
${0:$TM_SELECTED_TEXT}
% paragraph $2 (end)
TXT

  tab 'part', 'Part', <<-'TXT', uuid: 'A3F71E5B-C99E-488D-B1CB-39D588C28A8C'
\part{${1:part name}} % (fold)
\label{prt:${2:${1/(\w+)|\W+/(?1:\L$0:_)/g}}}
${0:$TM_SELECTED_TEXT}
% part $2 (end)
TXT

  tab 'sec', 'Section', <<-'TXT', uuid: '24282E70-BE2C-11D9-8F93-000D93589AF6', file: 'ʅsection .. (section)'
\section{${1:section name}} % (fold)
\label{sec:${2:${1/\\\\\w+\{(.*?)\}|\\\\(.)|(\w+)|([^\w\\\\]+)/(?4:_:\L$1$2$3)/g}}}
${0:$TM_SELECTED_TEXT}
% section $2 (end)
TXT

  tab 'section', 'Section', <<-'TXT', uuid: '5305AE18-1F7F-4284-A537-C0418119D078'
${1:Section}~\ref{${2:sec:}}$0
TXT

  tab 'spl', 'Split', <<-'TXT', uuid: '66B38313-2239-430C-8DE9-95023BA583C2'
\begin{split}
	$0
\end{split}
TXT

  tab 'sub', 'Sub Section', <<-'TXT', uuid: '4B41348F-BE2C-11D9-8F93-000D93589AF6', file: 'ʅsubsection .. (sub)'
\subsection{${1:subsection name}} % (fold)
\label{sub:${2:${1/\\\\\w+\{(.*?)\}|\\\\(.)|(\w+)|([^\w\\\\]+)/(?4:_:\L$1$2$3)/g}}}
${0:$TM_SELECTED_TEXT}
% subsection $2 (end)
TXT

  tab 'subp', 'Sub Paragraph', <<-'TXT', uuid: '1475649F-2577-4BF0-A392-DD8D4B64DA91'
\subparagraph{${1:subparagraph name}} % (fold)
\label{subp:${2:${1/\\\\\w+\{(.*?)\}|\\\\(.)|(\w+)|([^\w\\\\]+)/(?4:_:\L$1$2$3)/g}}}
${0:$TM_SELECTED_TEXT}
% subparagraph $2 (end)
TXT

  tab 'subs', 'Sub Sub Section', <<-'TXT', uuid: 'DF92968D-BF59-11D9-A668-000A95C0F626', file: 'ʅsubsubsection .. (ssub)'
\subsubsection{${1:subsubsection name}} % (fold)
\label{ssub:${2:${1/\\\\\w+\{(.*?)\}|\\\\(.)|(\w+)|([^\w\\\\]+)/(?4:_:\L$1$2$3)/g}}}
${0:$TM_SELECTED_TEXT}
% subsubsection $2 (end)
TXT

  tab 'tab', 'Tabular', <<-'TXT', uuid: '0E817E24-DC11-42A5-BBBD-EEF1FD282B2F'
\\begin{${1:t}${1/(t)$|(a)$|(.*)/(?1:abular)(?2:rray)/}}{${2:c}}
$0${2/((?<=[clr])([ |]*(c|l|r)))|./(?1: & )/g}
\\end{${1:t}${1/(t)$|(a)$|(.*)/(?1:abular)(?2:rray)/}}
TXT

  tab 'table', 'Table', <<-'TXT', uuid: '84216BD6-F6EB-4325-9485-1665E7364102'
${1:Table}~\ref{${2:tab:}}$0
TXT

end