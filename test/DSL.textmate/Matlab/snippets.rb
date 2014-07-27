# encoding: utf-8

snippets do

  default_scope 'source.matlab, source.octave'
  file_format :textmate

  tab '^', '^', <<-'TXT', uuid: '6B86576E-F8E3-4E3A-8083-CFE4C0DF9E42'
^($1) $2
TXT

  tab 'case', 'case', <<-'TXT', uuid: 'F7A928F5-B70D-4DB0-8DEF-F61928038A6C'
case ${2:'${3:string}'}
	$0
TXT

  tab 'disp', 'disp', <<-'TXT', uuid: '975C9569-8B7D-4A60-8ED4-478A724D3A4E'
disp('${1:Text}');
TXT

  tab 'dlmwrite', 'dlmwrite', <<-'TXT', uuid: '0FDCE9D1-A757-4793-816D-1364192CE326'
dlmwrite('${1:filename}.dat', [${2:variables}], ${3:'${4:delimiter}', '${5:\t}'});
$0
TXT

  tab 'dsp', 'disp sprintf', <<-'TXT', uuid: 'EC4078AC-7F43-42CA-A83A-E1477558D84E'
disp(sprintf('${1:%s}\\n'${1/([^%]|%%)*(%.)?.*/(?2:, :\))/}$2${1/([^%]|%%)*(%.)?.*/(?2:\))/});
TXT

  tab 'e', 'exp', <<-'TXT', uuid: 'C00046EC-C7DC-4BC5-81CD-EBCB0F6FE8F7'
exp($1) $2
TXT

  tab 'else', 'else', <<-'TXT', uuid: '582075F1-DB3F-4280-9F46-B615F8EF4A86'
else
	${1:body}
TXT

  tab 'elseif', 'elseif', <<-'TXT', uuid: 'EA7BD80E-6346-44E9-A909-CE0703CFB390'
elseif ${1:condition}
	$0
TXT

  tab 'error', 'error', <<-'TXT', uuid: '7135F592-1176-478A-BA31-BD8A7DA56F93'
error('${1:Description}');
TXT

  tab 'f', 'small function', <<-'TXT', uuid: '2376F2E2-E240-422F-B6E8-48B6AA20C9EE'
function ${1:out} = ${2:f}(${3:in})
	$0
`if [[ $TM_CLOSE_FUNCTIONS -ne '0' ]]
	then
	if [[ $TM_USE_OCTAVE -ne '0' ]]
		then echo "endfunction"
	else
		echo "end"
	fi
fi`
TXT

  tab 'for', 'for … end', <<-'TXT', uuid: '08CB1F21-B7EB-4AD7-B066-BB365966E390', file: 'for'
for ${1:ii}=${2:1}${3::${4:n}}
	$0
`if [[ $TM_USE_OCTAVE -ne '0' ]]
	then echo "endfor"
else
	echo "end"
fi`
TXT

  tab 'fors', 'for … end cell strings', <<-'TXT', uuid: 'B8E195CE-1606-4311-900D-4A1E1ACE6F94'
for ${1:s} = transpose(${2:strings}(:)); $1 = $1{1};
	$0
`if [[ $TM_USE_OCTAVE -ne '0' ]]
	then echo "endfor"
else
	echo "end"
fi`; clear $1;
TXT

  tab 'fpr', 'fprintf', <<-'TXT', uuid: '163D3790-C8E8-4888-81D7-50907D825EA0'
fprintf(${1:fid}, '${2:%s}\\n'${2/([^%]|%%)*(%.)?.*/(?2:, :\);)/}$3${2/([^%]|%%)*(%.)?.*/(?2:\);)/}
TXT

  tab 'function', 'function', "function ${1:out} = ${2:${TM_FILENAME:?${TM_FILENAME/\\.m//}:f}}(${3:in})\n% ${2/.*/\\U$0/} ${4:Description}\n%\t${1/.*/\\U$0/} = ${2/.*/\\U$0/}(${6:${3/.*/\\U$0/}})\n%\n% ${5:Long description}\n\n$0\n\n`if [[ $TM_CLOSE_FUNCTIONS -ne '0' ]]\n\tthen\n\tif [[ $TM_USE_OCTAVE -ne '0' ]]\n\t\tthen echo \"endfunction\"\n\telse\n\t\techo \"end ${TM_COMMENT_START}function\" \n\tfi\nfi`\n", uuid: '0EA9BDAD-6EA3-48C4-ADF5-EA549D84CAF0', file: 'function (fun)'

  tab 'get', 'get', <<-'TXT', uuid: '9915BCE4-2499-4E17-9006-7BB08A8539F0'
get(${1:gca},'${2:PropertyName}');
TXT

  tab 'griddata', 'griddata', "griddata(${1:xx}, ${2:yy}, ${3:zz}, ${4:xi}, ${5:yi}); ", uuid: '8E4BA761-42BB-4CFC-B117-A547228878B8'

  tab 'if', 'if … end', <<-'TXT', uuid: '876FEC4C-FD21-401A-8947-0B2E232E19CA', file: 'if'
if ${1:condition}
	$0
`if [[ $TM_USE_OCTAVE -ne '0' ]]
	then echo "endif"
else
	echo "end"
fi`
TXT

  tab 'ife', 'if … else …end', <<-'TXT', uuid: '4A86BFC8-5C03-45F8-B7D6-597F476E7C93', file: 'if else'
if ${1:condition}
	$2
else
	$3
`if [[ $TM_USE_OCTAVE -ne '0' ]]
	then echo "endif"
else
	echo "end"
fi`
TXT

  tab 'ifeif', 'if … elseif … end', <<-'TXT', scope: 'source.matlab , source.octave', uuid: '93234216-9807-416E-8416-A130A05C2C1F', file: 'if elseif'
if ${1:condition}
	${2:body}
elseif ${3:condition}
	${4:body}
else
	${5:body}
end

TXT

  tab 'line', 'line', <<-'TXT', uuid: '3FFA60EB-FA14-47DE-AEF7-5A3E840BE637'
line(${1:xvector},${2:yvector}${3:,'Color','${4:b}','LineWidth',${5:1},'LineStyle','${6:-}'})

TXT

  tab 'nargchk', 'nargchk', <<-'TXT', uuid: '8325A3D7-1025-48C4-810F-CF41E7E71DA2'
error(nargchk(${1:min}, ${2:max}, ${3:nargin}, `if [[ $TM_USE_OCTAVE -eq '0' ]]; then
	echo -n "'struct'"
fi` ));

TXT

  tab 'octfun', 'Octave function', <<-'TXT', scope: 'source.matlab', uuid: '5C7F21FA-156C-4A86-AB20-7F9678010BCA'
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

  tab 'set', 'set', <<-'TXT', scope: 'source.matlab , source.octave', uuid: '1166137D-A579-484D-BDD7-AC62EFFA3FFA'
set(${1:get(${2:gca},'${3:PropertyName}')},'${4:PropertyName}',${5:PropertyValue});
TXT

  tab 'spr', 'sprintf', <<-'TXT', uuid: '71CFA3F2-D883-4571-95B9-D98651890156'
sprintf('${1:%s}\\n'${1/([^%]|%%)*(%.)?.*/(?2:, :\);)/}$2${1/([^%]|%%)*(%.)?.*/(?2:\);)/}
TXT

  tab 'switch', 'switch … case … end', <<-'TXT', scope: 'source.matlab', uuid: '631FAA9C-ECC2-484A-A29C-3CD66D944693'
switch ${1:var}
case ${2:'${3:string}'}
	$0
`if [[ $TM_USE_OCTAVE -ne '0' ]]
	then echo "endswitch"
else
	echo "end"
fi`
TXT

  tab 'switcho', 'switch … case … otherwise … end', <<-'TXT', scope: 'source.matlab', uuid: 'C600A817-A58A-4884-9BDC-F7CB13407CB6'
switch ${1:var}
	case ${2:'${3:string}'}
		$4
	otherwise
		$0
`if [[ $TM_USE_OCTAVE -ne '0' ]]
	then echo "endswitch"
else
	echo "end"
fi`
TXT

  tab 'try', 'try … catch … end', "try \n\t$1\ncatch \n\t$0\n`if [[ $TM_USE_OCTAVE -ne '0' ]]\n\tthen echo \"end_try_catch\"\nelse\n\techo \"end\"\nfi`", scope: 'source.matlab', uuid: 'B287F24B-9BC5-4EAB-9621-1E73D367AAB7'

  tab 'uni', 'unix', <<-'TXT', uuid: 'F0A7C9BF-8FE2-4452-8EC9-F71881C7831F'
[${1:s},${2:w}] = unix('${3:Unix commands}');
TXT

  tab 'unwind', 'unwind_protect … cleanup … end', "unwind_protect \n\t$1\nunwnd_protect_cleanup \n\t$0\nend_unwind_protect", scope: 'source.matlab', uuid: '9475371F-F8A7-4C46-BAC9-B42E7E34F2AD'

  tab 'war', 'warning', <<-'TXT', uuid: '6392FF26-D584-435E-8202-9BC99FF26488'
warning(['${1:Description}']);
TXT

  tab 'whi', 'while', <<-'TXT', scope: 'source.matlab , source.octave', uuid: 'ADE63DB1-7F3A-4EAC-A5A4-3A35A28FE8F0'
while ${1:condition}
	${2:body}
end

TXT

  tab 'xla', 'xlabel', <<-'TXT', scope: 'source.matlab , source.octave', uuid: '178F5EE1-2953-4FB2-8623-99A1C7D0772F'
set(get(gca,'XLabel'),'String',${1:'${2}'});
TXT

  tab 'xti', 'xtick', <<-'TXT', scope: 'source.matlab , source.octave', uuid: 'A93C4844-87F4-4136-9580-75B697D0CFD7'
set(gca,'XTick',${1:[${2}]});
TXT

  tab 'yla', 'ylabel', <<-'TXT', scope: 'source.matlab , source.octave', uuid: '1F4C6EA6-370C-45A9-96C5-36E69CC297E3'
set(get(gca,'YLabel'),'String',${1:'${2}'});
TXT

  tab 'yti', 'ytick', <<-'TXT', scope: 'source.matlab , source.octave', uuid: '2FED97FA-0EB0-45E3-B92F-757903E79684'
set(gca,'YTick',${1:[${2}]});
TXT

  tab 'zla', 'title', <<-'TXT', scope: 'source.matlab , source.octave', uuid: '7298E093-E86F-4A60-ACFF-67580F24FD27'
set(get(gca,'Title'),'String',${1:'${2}'});
TXT

  tab 'zla', 'zlabel', <<-'TXT', scope: 'source.matlab , source.octave', uuid: '3C12382B-FD63-4DD8-9198-02D25AF755FF'
set(get(gca,'ZLabel'),'String',${1:'${2}'});
TXT

end