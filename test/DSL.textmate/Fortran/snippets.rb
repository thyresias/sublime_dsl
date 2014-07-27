# encoding: utf-8

snippets do

  default_scope 'source.fortran'
  file_format :textmate

  key "^\n", 'Line Continuation', <<-'TXT', uuid: '0B000E20-A4F2-495A-B0B1-242851333225'
 &

TXT

  key "@A", 'Wrap Selection in Array Brackets', <<-'TXT', uuid: 'E5E4BACF-96DD-43EF-A400-D7D3F6ABBF85'
(/ $TM_SELECTED_TEXT$0 /)
TXT

  tab 'al', 'Allocate Array', <<-'TXT', uuid: '51F171BF-D317-4510-A0E1-22565AFFDF55'
allocate(${1:array}, stat=${2:err})
if ($2 /= 0) print *, "${1/(\w+).*/$1/}: Allocation request denied"

TXT

  tab 'all', 'all', <<-'TXT', uuid: '93FA9EEB-7A4E-4907-B723-A2B379FCA041'
all(${1:mask}${2:, dim=${3:1}})
TXT

  tab 'alloc', 'Allocate and Deallocate array', <<-'TXT', uuid: '718929E8-73E2-4B9F-B430-0888D5971952'
allocate(${1:array}, stat=${2:err})
if ($2 /= 0) print *, "${1/(\w+).*/$1/}: Allocation request denied"

$0if (allocated(${1/(\w+).*/$1/})) deallocate(${1/(\w+).*/$1/}, stat=$2)
if ($2 /= 0) print *, "${1/(\w+).*/$1/}: Deallocation request denied$0"
TXT

  tab 'and', 'And', <<-'TXT', uuid: '3537B123-DB04-475A-8B8A-A5D223872FC1'
.and.
TXT

  tab 'any', 'any', <<-'TXT', uuid: 'ABBFB45A-CA54-4812-A2AC-732C52D78953'
any(${1:mask}${2:, dim=${3:1}})
TXT

  tab 'c', 'Quick Character', "character(len=*) :: ", uuid: '670364D4-4FAD-4A3B-949C-1A68F43FCDA1'

  tab 'case', 'case', <<-'TXT', uuid: '9C4F8960-34D5-4BE1-9CC0-91E6C67E7622'
case ${1:default}
	$0
TXT

  tab 'char', 'Character', <<-'TXT', uuid: '0D6B27F6-93D7-46FC-ABC5-658D26D13A2C'
character(len=$1${2:, kind=$3})${4:, ${5:attributes}} :: ${6:name}
TXT

  tab 'close', 'Close File', <<-'TXT', uuid: 'B011EFC4-3A9A-4A42-AEAC-B8766008B828'
close(unit=${1:iounit}, iostat=${2:ios}${3:, status="delete"})
if ( $2 /= 0 ) stop "Error closing file unit $1"

TXT

  tab 'count', 'count', <<-'TXT', uuid: '73D0556C-56DB-4BCD-ABBC-456B77BEAB7E'
count(${1:mask}${2:, dim=${3:1}})
TXT

  tab 'cy', 'cycle', <<-'TXT', uuid: 'CDED87E6-BD6D-4EA4-8649-10B1D7103A6F'
cycle
TXT

  tab 'data', 'data', <<-'TXT', uuid: 'A20B45D5-F448-410D-B9CD-FA6AC4F174D6'
data ${1:variable} / ${2:data} /
TXT

  tab 'deal', 'Deallocate Array', <<-'TXT', uuid: '8AA9DF85-9F20-417E-A71A-5B5BC555B0AA'
if (allocated($1)) deallocate(${1:array}, stat=${2:err})
if ($2 /= 0) print *, "$1: Deallocation request denied$0"
TXT

  tab 'do', 'do', <<-'TXT', uuid: '7A9D5F06-1CB9-46EF-9E93-C33A08BCC84D'
do${1: ${2:i} = ${3:1}, ${4:100}, ${5:1}}
	$0
end do
TXT

  tab 'dot', 'Dot Product of Vectors', <<-'TXT', uuid: 'F05CAEAE-2DBC-45F9-A83C-A41378159D5C'
dot_product($1,$2)
TXT

  tab 'dow', 'do while', <<-'TXT', uuid: '6136E9F7-7683-43E8-94F8-535CBE8045CD'
do while ( ${1:condition} )
	$0
end do
TXT

  tab 'elif', 'elseif', <<-'TXT', uuid: 'E3CB3696-76E6-45E5-B3BD-98D6C412FB8E'
elseif ( ${1:condition} ) then

TXT

  tab 'eq', 'Equal', <<-'TXT', uuid: '2316E789-8E34-4874-A517-6BF8E52ECC4C'
.eq.
TXT

  tab 'eqv', 'Equality', <<-'TXT', uuid: '0123B289-0889-41AA-839A-F7F2D6154723'
.eqv.
TXT

  tab 'F', '.FALSE.', <<-'TXT', uuid: 'EC40FA8C-65A9-40B6-9A5E-FC681755FADD', file: '_FALSE_'
.FALSE.
TXT

  tab 'for', 'forall', <<-'TXT', scope: 'source.fortran.modern', uuid: 'BFF323CA-733A-41FD-A9EB-F32B84A77870'
forall (${1:i=1:100}${2:, mask})
	$0
end forall
TXT

  tab 'fun', 'function', <<-'TXT', uuid: 'F08951B5-CAC2-4373-9422-8588D0F1E742'
function ${1:name}
	${2:argument type}, intent(${3:inout}) :: ${1/\w+\((.*)\)|.*/$1/}
	${4:function type} :: ${1/(\w+).*/$1/}
	$0
end function ${1/(\w+).*/$1/}
TXT

  tab 'ge', 'Greater or Equal', <<-'TXT', uuid: 'BFF92277-2A0B-40E1-A896-9DB8C1C69036'
.ge.
TXT

  tab 'gt', 'Greater Than', <<-'TXT', uuid: '7526D521-2CF7-4436-9D11-824B76D424F6'
.gt.
TXT

  tab 'i', 'Quick Integer', "integer :: ", uuid: '34C0C62D-B2EC-4C39-B072-CCA5EBEC9B8C'

  tab 'ido', 'Implied do', <<-'TXT', uuid: '35ECB83E-D696-4441-989A-AAAF9E63F156'
(${1:i}, $1 = ${2:1}, ${3:100}, ${4:1})$0
TXT

  tab 'if', 'if', <<-'TXT', uuid: '93DAD02F-8CF5-413A-8C43-8574AABEF998'
if ( ${1:condition} ) then
	$0
end if
TXT

  tab 'if', 'if (single line)', "if ( ${1:condition} ) ", uuid: '3EE70024-01D5-46E1-A8FE-15A02D31C999'

  tab 'imp', 'implicit none', <<-'TXT', uuid: '097FA6C9-28FE-4A55-9FC6-0116074ED962'
implicit none

TXT

  tab 'inq', 'Inquire (by Filename)', <<-'TXT', uuid: '1A5B5A09-1080-48CF-A4C3-3F81ACE69074'
inquire(file=${1:filename}, opened=${2:ioopen}, exists=${3:ioexist}, number=${4:iounit})
TXT

  tab 'inq', 'Inquire (by Unit)', <<-'TXT', uuid: '60090CCF-B104-47B5-BCB8-E2811EBA9CCF'
inquire(unit=${1:iounit}, opened=${2:ioopen}, name=${3:filename}, action=${4:ioaction})
TXT

  tab 'int', 'Integer', <<-'TXT', uuid: 'F3344347-B9EF-4574-B15E-22170D50D850'
integer${1:(${2:kind})}${3:, ${4:attributes}} :: ${5:name}
TXT

  tab 'interf', 'interface', <<-'TXT', uuid: '358E0BE9-B020-4932-A421-79F269CE10A1'
interface ${1:name}
	$0
end interface ! $1
TXT

  tab 'l', 'Quick Logical', "logical :: ", uuid: 'C2434FF9-D70D-4C85-A93A-9CDC637FE633'

  tab 'lbound', 'Lower Bound', <<-'TXT', uuid: '1757DE15-4544-482C-89DC-0781E39A7F87'
lbound(${1:source}${2:, dim=${3:1}})
TXT

  tab 'le', 'Less or Equal', <<-'TXT', uuid: 'F19E59C4-7D5F-4EA8-A29A-F144F4F2AC85'
.le.
TXT

  tab 'log', 'Logical', <<-'TXT', uuid: '6DBAE3F7-1B5A-4999-9246-E2A12A7C5555'
logical${1:(${2:kind})}${3:, ${4:attributes}} :: ${5:name}
TXT

  tab 'lt', 'Less Than', <<-'TXT', uuid: 'F8C2C9C2-B317-43E4-AEFD-AFF17B85728F'
.lt.
TXT

  tab 'mat', 'Matrix Multiplication', <<-'TXT', uuid: 'E8684191-D405-4BD8-BCEB-8BC9E150550B'
matmul($1,$2)
TXT

  tab 'max', 'max', <<-'TXT', uuid: '450D663B-E62D-45BA-B194-D2C560A886B8'
max($1, $2${, $3:...})$0
TXT

  tab 'maxloc', 'Index of Maximum', <<-'TXT', uuid: '5092CD14-3CCC-4EC2-B8F1-09A5277977F9'
maxloc(${1:source}${2:, mask=${3:($1>0)}})
TXT

  tab 'maxval', 'Maximum Value', <<-'TXT', uuid: '8781D199-2E4E-4D11-BFF3-F8729D9523C1'
maxval(${1:source}${2:, dim=${3:1}}${4:, mask=${5:($1>0)}})
TXT

  tab 'merge', 'merge', <<-'TXT', uuid: '61F063A9-1F71-4748-97ED-DB2E8DC4E8F5'
merge(${1:source}, ${2:alternative}, mask=(${2:$1>0}))
TXT

  tab 'min', 'min', <<-'TXT', uuid: '8814A6E1-7A85-4313-A75A-1D83EC1A9CD7'
min($1, $2${, $3:...})$0
TXT

  tab 'minloc', 'Index of Minimum', <<-'TXT', uuid: 'F0A4E40E-C92B-44B8-AFD8-CB15E94C81F1'
minloc(${1:source}${2:, mask=${3:$1>0}})
TXT

  tab 'minval', 'Minimum Value', <<-'TXT', uuid: '4AD4A84B-5110-4B49-9E0F-88B08A5AAF97'
minval(${1:source}${2:, dim=${3:1}}${4:, mask=${5:($1>0)}})
TXT

  tab 'mod', 'module', <<-'TXT', uuid: 'BE566EAC-E0C9-4922-99CC-AE5349751A5C'
module ${1:name}

	implicit none
	$0

end module $1

TXT

  tab 'mp', 'module procedure', <<-'TXT', uuid: '212C550B-1D28-4713-BF75-F660254D04C4'
module procedure ${0:name}
TXT

  tab 'ndo', 'named: do', <<-'TXT', uuid: '5F5CE350-E65B-4A12-9DE4-7F520EA7CEDA'
${1:name}: do${2: ${3:i} = ${4:1}, ${5:100}, ${6:1}}
	$0
end do $1
TXT

  tab 'neqv', 'Non-Equality', <<-'TXT', uuid: '3B8BB0B3-CEE1-496B-B844-465F49C038E6'
.neqv.
TXT

  tab 'not', 'Not', <<-'TXT', uuid: '76A04572-9358-499C-B2E3-5E96445441E2'
.not.
TXT

  tab 'nsel', 'named: select case', <<-'TXT', uuid: '883F17D6-1CC0-4D5F-8F47-0A57E59BAEE5'
${1:name}: select case ($2:variable)
	case ($3:values) $1
		$0
end select $1
TXT

  tab 'op', 'Quick Open', <<-'TXT', uuid: 'B118C813-3B21-49DB-8EEB-323CBAADBE00'
open(unit=${1:iounit}, file=${2:name}, iostat=${3:ios})
if ( $3 /= 0 ) stop "Error opening file ${2/[\"\'](.*)[\"\']/$1/}"
TXT

  tab 'open', 'Input File', <<-'TXT', uuid: '20CAACE7-E2D8-4233-8F1E-0ABA182047D4'
open(unit=${1:iounit}, file=${2:name}, iostat=${3:ios}, status="${4:old}", action="${5:read}")
if ( $3 /= 0 ) stop "Error opening file ${2/[\"\'](.*)[\"\']/$1/}"

TXT

  tab 'open', 'Open File', <<-'TXT', uuid: '48F02C1F-F6FA-444F-8CE7-7B81C7A7344B'
open(unit=${1:iounit}, file=${2:name}, iostat=${3:ios}, &
     status="${4:old/new/replace/scratch/unknown}", action="${5:read/write/readwrite}", access="${7:sequential/direct}"${7/(direct)$|.*/(?1:, recl=)/}$0)
if ( $3 /= 0 ) stop "Error opening file ${2/[\"\'](.*)[\"\']/$1/}"
TXT

  tab 'open', 'Output File', <<-'TXT', uuid: '9AA512D2-E341-4F05-A2BB-EBB339E3B187'
open(unit=${1:iounit}, file=${2:name}, iostat=${3:ios}, status="${4:new}", action="${5:write}")
if ( $3 /= 0 ) stop "Error opening file ${2/[\"\'](.*)[\"\']/$1/}"

TXT

  tab 'open', 'Scratch File', <<-'TXT', uuid: '3693BFC4-76F5-4ED3-837B-BD383BBAC5B0'
open(unit=${1:iounit}, iostat=${3:ios}, status="${4:scratch}", action="${5:readwrite}")
if ( $3 /= 0 ) stop "Error opening scratch file on unit $1"

TXT

  tab 'or', 'Or', <<-'TXT', uuid: '536D0C28-DD04-4B0C-8B22-61649F607322'
.or.
TXT

  tab 'pack', 'pack', <<-'TXT', uuid: 'BCB3E520-B100-4B1D-9DAE-62D0FEB1EA52'
pack(${1:array}, mask=(${2:$1>0})${3:, vector=${4:destination vector}})
TXT

  tab 'pr', 'Quick Print', "print*, ", uuid: 'B907E3F4-F0DD-41BF-8148-98486B9F7654', file: 'print'

  tab 'prod', 'Product of Elements', <<-'TXT', uuid: '3D90E5F6-5002-4E48-B1C1-4C9E62DF24AF'
product(${1:source}${2:, dim=${3:1}}${4:, mask=${5:($1>0)}})
TXT

  tab 'prog', 'program', <<-'TXT', uuid: '3CE33649-97AE-4497-BFA0-FA79AAEB5EE0'
program ${1:name}

	implicit none
	$0

end program $1

TXT

  tab 'r', 'Quick Real', "real :: ", uuid: 'C5AD4DF9-76C8-45A2-9705-6A31AD084007'

  tab 're', 'Quick Read', "read*, ", uuid: '397592DB-34D9-45B6-AD23-F2E88FEB36C9'

  tab 'rea', 'Real', <<-'TXT', uuid: '819B3AC9-225F-4699-A0F7-7ECBEE895AD2'
real${1:(${2:kind})}${3:, ${4:attributes}} :: ${5:name}
TXT

  tab 'read', 'Read', <<-'TXT', uuid: 'C1A0A9D5-9D5D-479C-B079-7C4FB7ACD700', file: 'read'
read(unit=${1:iounit}, fmt="(${2:format string})", iostat=${3:istat}) ${4:variables}
if ( $3 /= 0 ) stop "Read error in file unit $1"

TXT

  tab 'read', 'Read (Non Advancing Mode)', <<-'TXT', uuid: 'C93DF526-E933-4560-B63A-8E1CE6196FB7', file: 'read (Sequential Access)'
read(unit=${1:iounit}, fmt="(${2:format string})", iostat=${3:istat}, advance='NO', size=${4:number of characters}) ${5:variables}
if ( $3 /= 0 ) stop "Read error in file unit $1"

TXT

  tab 'resh', 'reshape', <<-'TXT', uuid: '41715FAB-5954-4B10-A092-3FC9FA3E3D67'
reshape(${1:source}${2:, shape=(/$3/)}${4:, pad=(/$5/)}${6:, order=(/${7:2,1}/)})
TXT

  tab 'rn', 'Random Number', <<-'TXT', uuid: '2186372D-4DFE-424D-B7CC-81686816FBEB'
call random_number($0)
TXT

  tab 'rs', 'Random Seed', <<-'TXT', uuid: '9D750E6B-948F-4913-9710-A3EAD3B9F804'
call random_seed(${1:size=${2:<int>}}${3:put=(/$4/)})
TXT

  tab 'sel', 'select case', <<-'TXT', uuid: '37641F82-864C-4FE5-B93B-7B9FC13166BB'
select case ($1:variable)
	case ($2:values)
		$0
end select
TXT

  tab 'size', 'Size', <<-'TXT', uuid: 'CA4E14B0-9F08-40F4-A7D9-61E9E7192FD4'
size(${1:source}${2:, dim=${3:1}})
TXT

  tab 'spread', 'spread', <<-'TXT', uuid: '7331B9EE-F03D-4472-9243-992184B260A6'
spread(${1:source}, dim=${2:1}, ncopies=$3)
TXT

  tab 'stop', 'stop', <<-'TXT', uuid: '7F2C2B22-50AA-49D5-A432-C8CDE12EDB09'
stop "${1:message}"
TXT

  tab 'sub', 'subroutine', <<-'TXT', uuid: '73DCA7B1-1444-418A-89ED-6F44B061538F'
subroutine ${1:name}
	${2:argument type}, intent(${3:inout}) :: ${1/\w+\((.*)\)|.*/$1/}
	$0
end subroutine ${1/(\w+).*/$1/}
TXT

  tab 'sum', 'Sum of Elements', <<-'TXT', uuid: '06C627D7-EB49-4FDF-A2B6-C9CC7CE97241'
sum(${1:source}${2:, dim=${3:1}}${4:, mask=${5:($1>0)}})
TXT

  tab 'T', '.TRUE.', <<-'TXT', uuid: '9A5E1955-62E4-4BA4-937B-A76B402D0825', file: '_TRUE_'
.TRUE.
TXT

  tab 't', 'Quick Custom Type', "type(${1:type name}) :: ", uuid: '1503AED6-304A-423E-AEC6-BE6836EBB720'

  tab 'typ', 'Custom Type', <<-'TXT', uuid: 'C7F4ECBD-46FE-4E88-A6C6-2F645B319821'
type(${1:type name})${2:, ${3:attributes}} :: ${4:name}
TXT

  tab 'type', 'Type Definition', <<-'TXT', uuid: '03298138-1221-4FF3-A6E6-C3F016CEA132'
type ${1:type name}
	$0
end type $1
TXT

  tab 'ubound', 'Upper Bound', <<-'TXT', uuid: 'EDA18DD2-F08C-44BF-90C1-A5FC7E55E909'
ubound(${1:source}${2:, dim=${3:1}})
TXT

  tab 'unpack', 'unpack', <<-'TXT', uuid: 'FFB7CA04-CB4B-4303-BF2A-CFD69A8665FA'
unpack(${1:vector}, mask=(${2:$1>0}), field=${3:destination array})
TXT

  tab 'wh', 'where (single line)', "where ( $1 ${2:==} $3 ) ", uuid: '663FC26D-BEC6-4B64-8704-502E7348CABD'

  tab 'whe', 'where', <<-'TXT', uuid: 'EDEB3A12-66A0-435B-A15D-28C18444A242'
where ( $1 ${2:==} $3 )
	$0
end where
TXT

  tab 'wr', 'Quick Write', <<-'TXT', uuid: '87B37A6D-B542-4502-94CA-521A92E056D6'
write(unit=${1:iounit}, fmt=*) ${0:variables}

TXT

  tab 'write', 'Write', <<-'TXT', uuid: 'A96BC9D7-5A5C-413C-8F3D-8155F98CCC79', file: 'write (Sequental Access)'
write(unit=${1:iounit}, fmt="(${2:format string})", iostat=${3:ios}${4:, advance='NO'}) ${5:variables}
if ( $3 /= 0 ) stop "Write error in file unit $1"

TXT

end