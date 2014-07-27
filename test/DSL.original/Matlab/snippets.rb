# encoding: utf-8

snippets do

  default_scope 'source.matlab, source.octave'

  tab '^', '^', <<-'TXT'
^($1) $2
TXT

  tab 'case', 'case', <<-'TXT'
case ${2:'${3:string}'}
	$0
TXT

  tab 'clear', 'clear', <<-'TXT'
clear('${1:all}'$2);
TXT

  tab 'disp', 'disp', <<-'TXT'
disp('${1:Text}');
TXT

  tab 'dlmwrite', 'dlmwrite', <<-'TXT'
dlmwrite('${1:filename}.dat', [${2:variables}], ${3:'${4:delimiter}', '${5:\t}'});
$0
TXT

  tab 'dsp', 'disp sprintf', <<-'TXT', file: 'disp-sprintf'
disp(sprintf('${1:%s}\\n'${1/([^%]|%%)*(%.)?.*/(?2:, :\);)/}$2${1/([^%]|%%)*(%.)?.*/(?2:\);)/});
TXT

  tab 'e', 'exp', <<-'TXT'
exp($1) $2
TXT

  tab 'else', 'else', <<-'TXT'
else
	${1:body}
TXT

  tab 'elseif', 'elseif', <<-'TXT'
elseif ${1:condition}
	$0
TXT

  tab 'error', 'error', <<-'TXT'
error('${1:Description}');
TXT

  tab 'fpr', 'fprintf', <<-'TXT'
fprintf(${1:fid}, '${2:%s}\\n'${2/([^%]|%%)*(%.)?.*/(?2:, :\);)/}$3${2/([^%]|%%)*(%.)?.*/(?2:\);)/}
TXT

  tab 'func', 'small function', <<-'TXT', file: 'small-function'
%% ${1:functionname}: ${2:function description}
function [${3:outputs}] = ${1}(${4:arg})
${3/,?\s*([a-zA-Z]\w*)|,\s*/(?1:\t$1 = ;\n)/g}
TXT

  tab 'get', 'get', <<-'TXT'
get(${1:gca},'${2:PropertyName}');
TXT

  tab 'griddata', 'griddata', "griddata(${1:xx}, ${2:yy}, ${3:zz}, ${4:xi}, ${5:yi}); "

  tab 'ifeif', 'if … elseif … end', <<-'TXT', scope: 'source.matlab , source.octave', file: 'if-elseif'
if ${1:condition}
	${2:body}
elseif ${3:condition}
	${4:body}
else
	${5:body}
end

TXT

  tab 'line', 'line', <<-'TXT'
line(${1:xvector},${2:yvector}${3:,'Color','${4:b}','LineWidth',${5:1},'LineStyle','${6:-}'})

TXT

  tab 'octfun', 'Octave function', <<-'TXT', scope: 'source.matlab', file: 'Octave-function'
## Copyright (C) ${TM_YEAR} $TM_FULLNAME
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {${1:Outputs} = } ${2:Function Name} (${3:Input Arguments)
## ${4:Short Description}
##
## ${5:Long Description}
##
## @seealso{${6:functions}}
## @end deftypefn

## Author:  $TM_FULLNAME

$0

endfunction
TXT

  tab 'set', 'set', <<-'TXT', scope: 'source.matlab , source.octave'
set(${1:get(${2:gca},'${3:PropertyName}')},'${4:PropertyName}',${5:PropertyValue});
TXT

  tab 'spr', 'sprintf', <<-'TXT'
sprintf('${1:%s}\\n'${1/([^%]|%%)*(%.)?.*/(?2:, :\);)/}$2${1/([^%]|%%)*(%.)?.*/(?2:\);)/}
TXT

  tab 'switch', 'switch ... case ... otherwise ... end', <<-'TXT', file: 'switch___case___otherwise___end'
switch ${1:switch_expression}
	case ${2:case_expression}
		${3:body}
	otherwise
		${4:body}
end
TXT

  tab 'uni', 'unix', <<-'TXT'
[${1:s},${2:w}] = unix('${3:Unix commands}');
TXT

  tab 'unwind', 'unwind_protect … cleanup … end', "unwind_protect \n\t$1\nunwnd_protect_cleanup \n\t$0\nend_unwind_protect", scope: 'source.matlab', file: 'unwind_protect-cleanup-end'

  tab 'war', 'warning', <<-'TXT'
warning(['${1:Description}']);
TXT

  tab 'whi', 'while', <<-'TXT', scope: 'source.matlab , source.octave'
while ${1:condition}
	${2:body}
end

TXT

  tab 'xla', 'xlabel', <<-'TXT', scope: 'source.matlab , source.octave'
set(get(gca,'XLabel'),'String',${1:'${2}'});
TXT

  tab 'xti', 'xtick', <<-'TXT', scope: 'source.matlab , source.octave'
set(gca,'XTick',${1:[${2}]});
TXT

  tab 'yla', 'ylabel', <<-'TXT', scope: 'source.matlab , source.octave'
set(get(gca,'YLabel'),'String',${1:'${2}'});
TXT

  tab 'yti', 'ytick', <<-'TXT', scope: 'source.matlab , source.octave'
set(gca,'YTick',${1:[${2}]});
TXT

  tab 'zla', 'title', <<-'TXT', scope: 'source.matlab , source.octave'
set(get(gca,'Title'),'String',${1:'${2}'});
TXT

  tab 'zla', 'zlabel', <<-'TXT', scope: 'source.matlab , source.octave'
set(get(gca,'ZLabel'),'String',${1:'${2}'});
TXT

end