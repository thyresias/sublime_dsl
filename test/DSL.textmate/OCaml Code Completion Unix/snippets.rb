# encoding: utf-8

snippets do

  default_scope 'source.ocaml'
  file_format :textmate

  tab 'Unix.addr', 'Any inet address (for bind -- IPv6)', <<-'TXT', uuid: 'C7C8FE98-056C-44D0-9632-FC4AC24FB1F8'
Unix.inet6_addr_any
TXT

  tab 'Unix.addr', 'Any inet address (for bind)', <<-'TXT', uuid: '3A69AE2C-B6AD-438D-9A0C-DAFE15BE2EF4'
Unix.inet_addr_any
TXT

  tab 'Unix.addr', 'inet_addr_of_string', <<-'TXT', uuid: 'CB1A46BE-D697-4C5E-93BB-133D18E16FEA'
Unix.inet_addr_of_string ${1:dotted_quad_str}$0
TXT

  tab 'Unix.addr', 'Loopback address', <<-'TXT', uuid: 'B31B6D37-E9AA-435F-88D7-0CAF038B3B1C'
Unix.inet_addr_loopback
TXT

  tab 'Unix.addr', 'Loopback address (IPv6)', <<-'TXT', uuid: '7F800317-D33D-4722-BF70-4B6C4DE177E6'
Unix.inet6_addr_loopback
TXT

  tab 'Unix.addr', 'string_of_inet_addr', <<-'TXT', uuid: '2A4622D5-9C8B-4B06-80C8-950AA4D7CA99'
Unix.string_of_inet_addr ${1:inet_addr}$0
TXT

  tab 'Unix.ADDR_', 'Internet domain socket address', <<-'TXT', uuid: '66ECFE8E-ABD0-4EEC-9957-114219E854B4'
Unix.ADDR_INET ${1:(${2:addr}, ${3:port})}$0
TXT

  tab 'Unix.ADDR_', 'Unix domain socket address', <<-'TXT', uuid: '2C143470-FCD9-4F6F-82F3-9FB3F2B843DA'
Unix.ADDR_UNIX ${1:name}$0
TXT

  tab 'Unix.ai_', 'Address', <<-'TXT', uuid: '99EED0A4-7E0E-428B-9737-CF30BB2C5FD5'
Unix.ai_addr
TXT

  tab 'Unix.ai_', 'Canonical host name', <<-'TXT', uuid: 'F7FBA013-7E20-46BC-9E87-2DB4536712AE'
Unix.ai_cannonname
TXT

  tab 'Unix.AI_', "Don't call name resolver, ekpect numeric IP address", <<-'TXT', uuid: '723FC650-9716-4A36-B48F-D10902499447'
Unix.AI_NUMERICHOST
TXT

  tab 'Unix.AI_', 'Fill the ai_cannonname field of the result', <<-'TXT', uuid: 'C96B27BE-14E8-4FD6-B1F7-F850C56C2034'
Unix.AI_CANNONNAME
TXT

  tab 'Unix.AI_', 'Impose the given protocol', <<-'TXT', uuid: '50354308-404C-42C2-9F83-604EAD51A55C'
(Unix.AI_PROTOCOL ${1:proto})$0
TXT

  tab 'Unix.AI_', 'Impose the given socket domain', <<-'TXT', uuid: '613908BB-3E73-4977-87F0-1A31AAD617AF'
(Unix.AI_FAMILY UNIX.PF_$0)
TXT

  tab 'Unix.AI_', 'Impose the given socket type', <<-'TXT', uuid: 'C846F3C7-8398-4757-AC27-302A0258A173'
(Unix.AI_SOCKTYPE UNIX.SOCK_$0)
TXT

  tab 'Unix.AI_', 'Set address to "any" for bind', <<-'TXT', uuid: 'B0A82AB1-1DCE-4A3A-80FB-B6A230D4AFB3'
Unix.AI_PASSIVE
TXT

  tab 'Unix.ai_', 'Socket domain', <<-'TXT', uuid: '3A56B89D-7EF0-4B2E-AE2D-D3C99DB06C33'
Unix.ai_family
TXT

  tab 'Unix.ai_', 'Socket protocol number', <<-'TXT', uuid: '011CE84B-A5A6-4939-94E7-DAD55D4AE633'
Unix.ai_protocol
TXT

  tab 'Unix.ai_', 'Socket type', <<-'TXT', uuid: '07EF2591-A776-49DD-BE6C-AE7372112591'
Unix.ai_socktype
TXT

  tab 'Unix.connect', 'establish_server', <<-'TXT', uuid: 'F18DDBA3-ADED-462D-B19B-16AE8867A362'
Unix.establish_server ${1:(fun in_channel out_channel -> )}Unix.ADDR_$0;
TXT

  tab 'Unix.connect', 'open_connection', <<-'TXT', uuid: 'BAE3AD62-CB5D-4029-A88D-651C587B05A1'
Unix.open_connection Unix.ADDR_$0
TXT

  tab 'Unix.connect', 'shutdown_connection', <<-'TXT', uuid: '267F5A92-15F7-4C5E-8151-923347D1E5D9'
Unix.shutdown_connection ${1:in_channel}${2:;}$0
TXT

  tab 'Unix.dir', 'chdir', <<-'TXT', uuid: 'D1DA47F7-7AE3-411C-A4B2-1CB2BC074441'
Unix.chdir ${1:dir_name}$0
TXT

  tab 'Unix.dir', 'chroot', <<-'TXT', uuid: 'AB3B98E0-8EEE-4B6F-9644-F2C116656608'
Unix.chroot ${1:dir_name}${2:;}$0
TXT

  tab 'Unix.dir', 'closedir', <<-'TXT', uuid: '4BEBC207-930B-4600-A625-5F22580F0293'
Unix.closedir ${1:dir_handle}${2:;}$0
TXT

  tab 'Unix.dir', 'getcwd', <<-'TXT', uuid: 'D5DB2C1B-85CA-4BE6-A0AD-B86156107F24'
Unix.getcwd ()
TXT

  tab 'Unix.dir', 'mkdir', <<-'TXT', uuid: '1F528E17-9909-4168-85E1-BA69964BB415'
Unix.mkdir ${1:dir_name} 0o${2:644}$0
TXT

  tab 'Unix.dir', 'opendir', <<-'TXT', uuid: 'DFC47AF1-58CC-492D-BD5C-0CD3623E9A5A'
Unix.opendir ${1:dir_name}$0
TXT

  tab 'Unix.dir', 'readdir', <<-'TXT', uuid: 'FD48E575-539B-402D-B51C-A92D7C511BFF'
Unix.readdir ${1:dir_handle}$0
TXT

  tab 'Unix.dir', 'rewinddir', <<-'TXT', uuid: '9D70C3A1-4824-45D1-8032-1D8AB6FCB884'
Unix.rewinddir ${1:dir_handle}${2:;}$0
TXT

  tab 'Unix.dir', 'rmdir', <<-'TXT', uuid: '2C02B741-0A96-45FC-BF46-4D8B5FBE3223'
Unix.rmdir ${1:dir_name}$0
TXT

  tab 'Unix.env', 'environment', <<-'TXT', uuid: 'C92DC720-CC6F-4F3D-8E1D-F71F8A80DD36'
Unix.environment ()
TXT

  tab 'Unix.env', 'getenv', <<-'TXT', uuid: '98C963D9-BB6A-444E-8EF8-F10F84BA1C75'
Unix.getenv ${1:ENV_VAR}$0
TXT

  tab 'Unix.env', 'putenv', <<-'TXT', uuid: 'C9E353F3-B619-4BD2-A4B7-500CFB62120E'
Unix.putenv ${1:ENV_VAR} ${2:value}$0
TXT

  tab 'Unix.err', 'Address already in use', <<-'TXT', uuid: '9E62DC67-A22E-446B-BB2E-4803F8655BA1'
Unix.EADDRINUSE
TXT

  tab 'Unix.err', 'Address family not supported by protocol family', <<-'TXT', uuid: 'D2B39A09-0729-49C6-8488-F51A42E78C20'
Unix.EAFNOSUPPORT
TXT

  tab 'Unix.err', 'Argument list too long', <<-'TXT', uuid: 'F88749F7-392A-4B3A-86CE-CB4A6B173D4B'
Unix.E2BIG
TXT

  tab 'Unix.err', 'Bad address', <<-'TXT', uuid: '7C9CA754-86C1-4996-B920-E1A084954E48'
Unix.EFAULT
TXT

  tab 'Unix.err', 'Bad file descriptor', <<-'TXT', uuid: 'B44648FE-E0F2-4C5E-AD4D-65877FDD7C53'
Unix.EBADF
TXT

  tab 'Unix.err', 'Broken pipe', <<-'TXT', uuid: 'B35A9BC3-A586-43F9-8777-0D695AD3E50F'
Unix.EPIPE
TXT

  tab 'Unix.err', "Can't assign requested address", <<-'TXT', uuid: '3BFC4143-9B3D-4F1A-889C-741BFE2F4088'
Unix.EADDRNOTAVAIL
TXT

  tab 'Unix.err', "Can't send after socket shutdown", <<-'TXT', uuid: '4B5D29BC-0514-4976-B6FB-F3D6C29039D4'
Unix.ESHUTDOWN
TXT

  tab 'Unix.err', 'Connection refused', <<-'TXT', uuid: '1870A04D-12E3-457A-99DF-EBAB96EE1D25'
Unix.ECONNREFUSED
TXT

  tab 'Unix.err', 'Connection reset by peer', <<-'TXT', uuid: 'C7612D21-3C3C-4C1D-B997-6F837AD54A1D'
Unix.ECONNRESET
TXT

  tab 'Unix.err', 'Connection timed out', <<-'TXT', uuid: '382BA4B5-6D07-475C-9F1D-6F8848F76855'
Unix.ETIMEDOUT
TXT

  tab 'Unix.err', 'Destination address required', <<-'TXT', uuid: '22261736-8035-473C-B360-319B1806053F'
Unix.EDESTADDRREQ
TXT

  tab 'Unix.err', 'Directory not empty', <<-'TXT', uuid: '55E17489-6F41-480D-9C3C-41D5141CD35F'
Unix.ENOTEMPTY
TXT

  tab 'Unix.err', 'Domain error for math functions', <<-'TXT', uuid: 'C74A827A-1402-40B2-B545-F9FDE3CFD52D'
Unix.EDOM
TXT

  tab 'Unix.err', 'File exists', <<-'TXT', uuid: '981D3ACE-35CA-41BE-B9CC-30E12EC8FEAA', file: 'File exists 2'
Unix.EEXIST
TXT

  tab 'Unix.err', 'File size or position not representable', <<-'TXT', uuid: '71E07998-4704-4260-9977-75FF275C76F8'
Unix.EOVERFLOW
TXT

  tab 'Unix.err', 'File too large', <<-'TXT', uuid: '8FB385AA-4259-4661-9759-3785223D603C'
Unix.EFBIG
TXT

  tab 'Unix.err', 'Filename too long', <<-'TXT', uuid: 'F59ADDDF-B6EB-4415-BCCF-89F68439952A'
Unix.ENAMETOOLONG
TXT

  tab 'Unix.err', 'Function interrupted by signal', <<-'TXT', uuid: '6429F1BF-B14E-4E8F-A59D-3511D0828897'
Unix.EINTR
TXT

  tab 'Unix.err', 'Function not supported', <<-'TXT', uuid: '7D2C9B64-A543-406B-9507-320782120DD7'
Unix.ENOSYS
TXT

  tab 'Unix.err', 'Hardware I/O error', <<-'TXT', uuid: '175B8123-1FAC-4906-9971-BBF0749941EF', file: 'Hardware I˸O error'
Unix.EIO
TXT

  tab 'Unix.err', 'Host is down', <<-'TXT', uuid: '68192E0B-DC85-4D0F-8DF0-C064CF09F976'
Unix.EHOSTDOWN
TXT

  tab 'Unix.err', 'Inappropriate I/O control operation', <<-'TXT', uuid: 'A3F34697-71A1-4492-B053-BD8A8061D70A', file: 'Inappropriate I˸O control operation'
Unix.ENOTTY
TXT

  tab 'Unix.err', 'Invalid argument', <<-'TXT', uuid: 'E3F9C46B-F4B4-4EBF-A61F-45560E625F31'
Unix.EINVAL
TXT

  tab 'Unix.err', 'Invalid link', <<-'TXT', uuid: 'CDC4C5C8-EF1C-4EBD-AEC9-49E4D2748A45'
Unix.EXDEV
TXT

  tab 'Unix.err', 'Invalid seek', <<-'TXT', uuid: '5E17CD1E-208D-4C58-9387-8555B07CCDAF'
Unix.ESPIPE
TXT

  tab 'Unix.err', 'Is a directory', <<-'TXT', uuid: '6EC09AF4-1E90-4955-BB4C-05FB7868D8D1'
Unix.EISDIR
TXT

  tab 'Unix.err', 'Message too long', <<-'TXT', uuid: '33F86C79-A3DD-490B-AA38-09C62F36C92C'
Unix.EMSGSIZE
TXT

  tab 'Unix.err', 'Network dropped connection on reset', <<-'TXT', uuid: 'F40E5D78-202F-42C5-B278-13AA9E00908D'
Unix.ENETRESET
TXT

  tab 'Unix.err', 'Network is down', <<-'TXT', uuid: '343EF7FB-586C-41D5-93C3-43840115C430'
Unix.ENETDOWN
TXT

  tab 'Unix.err', 'Network is unreachable', <<-'TXT', uuid: 'A230DC9A-E327-4FA9-ACB4-114AE07252CB'
Unix.ENETUNREACH
TXT

  tab 'Unix.err', 'No buffer space available', <<-'TXT', uuid: '7B08793E-7868-46FC-96A5-E2CEF4870220'
Unix.ENOBUFS
TXT

  tab 'Unix.err', 'No child process', <<-'TXT', uuid: '6E43DEF0-427F-4AF5-8F1B-4AA08D81DF16'
Unix.ECHILD
TXT

  tab 'Unix.err', 'No locks available', <<-'TXT', uuid: '483D1AFE-755C-4C98-A5F3-828BF49E92FE'
Unix.ENOLCK
TXT

  tab 'Unix.err', 'No route to host', <<-'TXT', uuid: 'AD41FC57-5F40-4997-8C31-6104B4BF81CC'
Unix.EHOSTUNREACH
TXT

  tab 'Unix.err', 'No space left on device', <<-'TXT', uuid: '20C1FB8E-F14C-45A7-B957-72B76491DBDD'
Unix.ENOSPC
TXT

  tab 'Unix.err', 'No such device', <<-'TXT', uuid: '5D14D9F9-04B3-4276-B69C-3BF283757B25'
Unix.ENODEV
TXT

  tab 'Unix.err', 'No such device or address', <<-'TXT', uuid: '96351FC8-5208-489D-A436-8FF2E33B5D72'
Unix.ENXIO
TXT

  tab 'Unix.err', 'No such file or directory', <<-'TXT', uuid: '94B76A79-EE13-4236-94DF-239924893E1A'
Unix.ENOENT
TXT

  tab 'Unix.err', 'No such process', <<-'TXT', uuid: 'B3E89FD1-A28E-44A0-821F-36CE215CA936'
Unix.ESRCH
TXT

  tab 'Unix.err', 'Not a directory', <<-'TXT', uuid: '1CF9AE29-CA69-4F56-B2AF-350DF4189639'
Unix.ENOTDIR
TXT

  tab 'Unix.err', 'Not an executable file', <<-'TXT', uuid: '3656E051-74D6-4F20-A32B-029CF193AFCE'
Unix.ENOEXEC
TXT

  tab 'Unix.err', 'Not enough memory', <<-'TXT', uuid: 'A0BB4487-A385-4AB7-A647-1B3A52B7FDFB'
Unix.ENOMEM
TXT

  tab 'Unix.err', 'Operation already in progress', <<-'TXT', uuid: 'CE33D913-CA5B-41B4-80CD-6C1AFA24F872'
Unix.EALREADY
TXT

  tab 'Unix.err', 'Operation not permitted', <<-'TXT', uuid: '3C7007FF-11C9-4F23-A6B1-374021A4EF9B'
Unix.EPERM
TXT

  tab 'Unix.err', 'Operation now in progress', <<-'TXT', uuid: 'D2859959-1B42-4F09-8E55-90F800477DA9'
Unix.EINPROGRESS
TXT

  tab 'Unix.err', 'Operation would block', <<-'TXT', uuid: '4B52E5D0-6336-4F8F-9C81-271DA23A3F65'
Unix.EWOULDBLOCK
TXT

  tab 'Unix.err', 'Permission denied', <<-'TXT', uuid: 'AFC5FCC1-1673-47D9-87BC-7DA312397876'
Unix.EACCES
TXT

  tab 'Unix.err', 'Protocol family not supported', <<-'TXT', uuid: '11E62F14-2B9B-486C-915F-701935CEA966'
Unix.EPFNOSUPPORT
TXT

  tab 'Unix.err', 'Protocol not supported', <<-'TXT', uuid: 'DF64D0C4-A340-447E-BD93-134631C43BAD'
Unix.EPROTONOTSUPP
TXT

  tab 'Unix.err', 'Protocol wrong type for socket', <<-'TXT', uuid: '714970A3-6845-44AE-ACD9-89CE328005A8'
Unix.EPROTOTYPE
TXT

  tab 'Unix.err', 'Read-only file system', <<-'TXT', uuid: '30D1A704-5B50-460F-A658-8D65A84B9296'
Unix.EROFS
TXT

  tab 'Unix.err', 'Resource deadlock would occur', <<-'TXT', uuid: 'C8F6BD64-71CB-4F46-A812-5F53EF232748'
Unix.EDEADLK
TXT

  tab 'Unix.err', 'Resource temporarily unavailable', <<-'TXT', uuid: 'C700969A-6406-4762-83FE-AE7A9D6191DA'
Unix.EAGAIN
TXT

  tab 'Unix.err', 'Resource unavailable', <<-'TXT', uuid: '8D8B3CDC-9B9C-4EDA-BD9E-B3935B97DE06'
Unix.EBUSY
TXT

  tab 'Unix.err', 'Result too large', <<-'TXT', uuid: 'A13F6132-5788-4231-B74D-046205E7F439'
Unix.ERANGE
TXT

  tab 'Unix.err', 'Socket is already connected', <<-'TXT', uuid: 'C9AF2417-A0F1-4328-B050-E2A137D0089D'
Unix.EISCONN
TXT

  tab 'Unix.err', 'Socket is not connected', <<-'TXT', uuid: '54158BFC-4139-456B-8039-C7E1A1F397CD'
Unix.ENOTCONN
TXT

  tab 'Unix.err', 'Socket operation on non-socket', <<-'TXT', uuid: '7DB07F23-F1E7-4645-892B-98D49347137C'
Unix.ENOTSOCK
TXT

  tab 'Unix.err', 'Software caused connection abort', <<-'TXT', uuid: 'D26CFEBC-3976-4E28-B6B6-87FD33A8C0AA'
Unix.ECONNABORTED
TXT

  tab 'Unix.err', 'stderr', <<-'TXT', uuid: 'C409462B-C872-4092-9FB4-7F0626D6AE26'
Unix.stderr
TXT

  tab 'Unix.err', 'Too many levels of symbolic links', <<-'TXT', uuid: 'B4BA8474-F2B7-4067-949A-004FC3BC7695'
Unix.ELOOP
TXT

  tab 'Unix.err', 'Too many links', <<-'TXT', uuid: '23A41FB1-542F-4115-98B6-D0869DF8E7BF'
Unix.EMLINK
TXT

  tab 'Unix.err', 'Too many open files by the process', <<-'TXT', uuid: '1DF42326-E31D-4948-BDEB-8ECA69AC10CE'
Unix.EMFILE
TXT

  tab 'Unix.err', 'Too many open files in the system', <<-'TXT', uuid: '25994D90-9C1B-4259-9202-6ADC222D2728'
Unix.ENFILE
TXT

  tab 'Unix.err', "Too many references: can't splice", <<-'TXT', uuid: 'E7324F33-AF00-476A-9B6A-2A621F8C2328'
Unix.ETOOMANYREFS
TXT

  tab 'Unix.err', 'Unknown error', <<-'TXT', uuid: 'E57F9798-4F65-4FAB-993F-C3001830C522'
(Unix.EUNKNOWNERR ${1:i})$0
TXT

  tab 'Unix.error', 'error_message', <<-'TXT', uuid: '33CC20FB-AD76-448B-8069-E32D9B4D7883'
Unix.error_message ${1:Unix.err}$0
TXT

  tab 'Unix.error', 'exception Unix_error', <<-'TXT', uuid: 'BAF99BBB-C40F-430F-B81B-1C335D6779E7'
Unix.Unix_error (${3:Unix.err}, ${1:func_name}, ${2:f_param})$0
TXT

  tab 'Unix.error', 'handle_unix_error', <<-'TXT', uuid: '5F6C51FA-6C82-4736-8ABB-9D9BB551CE76'
Unix.handle_unix_error ${1:func} ${2:arg}$0
TXT

  tab 'Unix.fch', 'descr_of_in_channel', <<-'TXT', uuid: 'DC513BCE-85EC-4E24-B06B-FA96B579B7BF'
Unix.descr_of_in_channel ${1:in_channel}$0
TXT

  tab 'Unix.fch', 'descr_of_out_channel', <<-'TXT', uuid: '9129E52E-6B44-44D0-838F-5EA245724DFE'
Unix.descr_of_out_channel ${1:out_channel}$0
TXT

  tab 'Unix.fch', 'in_channel_of_descr', <<-'TXT', uuid: 'A845D1D9-B014-4482-8C07-DA0D1EAB84F3'
Unix.in_channel_of_descr ${1:file_descr}$0
TXT

  tab 'Unix.fch', 'out_channel_of_descr', <<-'TXT', uuid: '0229765F-7633-498D-AC33-A88955C993F5'
Unix.out_channel_of_descr ${1:file_descr}$0
TXT

  tab 'Unix.fd', 'clear_close_on_exec', <<-'TXT', uuid: '9B7B883B-2BF9-46CB-B7C4-1C75EC796C13'
Unix.clear_close_on_exec ${1:file_descr}$0
TXT

  tab 'Unix.fd', 'clear_nonblock', <<-'TXT', uuid: '9EED490D-31F1-452C-A80A-CB073DD7C56F'
Unix.clear_nonblock ${1:file_descr}$0
TXT

  tab 'Unix.fd', 'dup', <<-'TXT', uuid: '58F08D44-7061-4C81-89FF-23E4BF6DF62E'
Unix.dup ${1:file_descr}$0
TXT

  tab 'Unix.fd', 'dup2', <<-'TXT', uuid: '53516A95-0DBB-4CD1-B413-9B76D91A5B46'
Unix.dup2 ${1:file_descr1} ${2:file_descr2}$0
TXT

  tab 'Unix.fd', 'set_close_on_exec', <<-'TXT', uuid: 'C24B023F-2D6C-4CDD-BE01-ED6FC49E5688'
Unix.set_close_on_exec ${1:file_descr}$0
TXT

  tab 'Unix.fd', 'set_nonblock', <<-'TXT', uuid: '95A991E3-C5A2-4FC3-8EE8-DBE4865B5520'
Unix.set_nonblock ${1:file_descr}$0
TXT

  tab 'Unix.file', 'close', <<-'TXT', uuid: 'AFC65188-7880-4667-9A4C-AD8D41A7ACE0'
Unix.close ${1:file_descr}$0
TXT

  tab 'Unix.file', 'openfile', <<-'TXT', uuid: '74D18637-AFFC-4F7A-BF6C-A92F60245F20'
Unix.openfile ${1:file_name} ${2:[${3:open_flags}]} 0o${4:644}$0
TXT

  tab 'Unix.file', 'read', <<-'TXT', uuid: '7FAF68FC-20C4-457F-9C78-3B5A293B6E06'
Unix.read ${1:file_descr} ${2:buf} ${3:ofs} ${4:len}$0
TXT

  tab 'Unix.file', 'single_write', <<-'TXT', uuid: 'A8CA95A4-D142-4121-9D73-9310758F1C51'
Unix.single_write ${1:file_descr} ${2:buf} ${3:ofs} ${4:len}$0
TXT

  tab 'Unix.file', 'write', <<-'TXT', uuid: '1C792F3C-8F9F-4EF6-B14D-D3B01EA0D502'
Unix.write ${1:file_descr} ${2:buf} ${3:ofs} ${4:len}$0
TXT

  tab 'Unix.FLOW', 'Restart input (send START character)', <<-'TXT', uuid: '9885154D-95E9-411F-86B4-31ED73AF12B0'
Unix.TCION
TXT

  tab 'Unix.FLOW', 'Restart output', <<-'TXT', uuid: '55E1EEE7-C4FE-4185-A759-73953A39667B'
Unix.TCOON
TXT

  tab 'Unix.FLOW', 'Suspend input (send STOP character)', <<-'TXT', uuid: '7CD5D5F2-DFB8-46E2-AAE6-107DE4AB50D0'
Unix.TCIOFF
TXT

  tab 'Unix.FLOW', 'Suspend output', <<-'TXT', uuid: '68B405FA-ED07-46E6-B419-A4C8DBC4CFEC'
Unix.TCOOFF
TXT

  tab 'Unix.FLUSH', 'Flush both', <<-'TXT', uuid: 'CEE32D02-E8A9-4D6F-9D29-861FD1778B44'
Unix.TCIOFLUSH
TXT

  tab 'Unix.FLUSH', 'Flush received but not read', <<-'TXT', uuid: 'D4EF3BA1-8B82-4E86-B464-749DF6DBD3F7'
Unix.TCIFLUSH
TXT

  tab 'Unix.FLUSH', 'Flush written but not transmitted', <<-'TXT', uuid: '3A48CA79-10CA-4929-922A-B5A418260395'
Unix.TCOFLUSH
TXT

  tab 'Unix.FLUSH', 'tcflush', <<-'TXT', uuid: '34190EEB-5B0F-4AF0-B107-52865BAA66CC'
Unix.flush ${1:file_descr} Unix.FLUSH$0
TXT

  tab 'Unix.fn', 'link', <<-'TXT', uuid: '1FD3BBE5-6489-417C-A00C-AF34B79E02D6'
Unix.link ${1:src_file_name} ${2:dest_file_name}$0
TXT

  tab 'Unix.fn', 'rename', <<-'TXT', uuid: '34617709-7C95-4C8D-B611-2500E34A3FB2'
Unix.rename ${1:old_file_name} ${2:new_file_name}$0
TXT

  tab 'Unix.fn', 'unlink', <<-'TXT', uuid: 'EF0C4C70-0AB4-4408-8DA0-4EB1E02D4FCE'
Unix.unlink ${1:file_name}$0
TXT

  tab 'Unix.fperm', 'access', <<-'TXT', uuid: '56A026FB-D357-4CF5-98C0-12C788B3B372'
Unix.access ${1:file_name} ${2:[Unix.fperm$0]}
TXT

  tab 'Unix.fperm', 'chmod', <<-'TXT', uuid: 'B9C9DA7C-CBE5-4C7B-967C-B7B22427B9E2'
Unix.chmod ${1:file_name} 0o${2:644}$0
TXT

  tab 'Unix.fperm', 'chown', <<-'TXT', uuid: 'DB7F97F6-DF90-4D40-8B9B-0E4887CC7EB1'
Unix.chown ${1:file_name} ${2:uid} ${3:gid}$0
TXT

  tab 'Unix.fperm', 'Execute permission', <<-'TXT', uuid: '55F30B07-8B11-41A6-BC9F-0B5CC56B8B44'
Unix.X_OK
TXT

  tab 'Unix.fperm', 'fchmod', <<-'TXT', uuid: 'E2420524-844E-4391-BED4-DAF96BC43D47'
Unix.fchmod ${1:file_descr} 0o${2:644}$0
TXT

  tab 'Unix.fperm', 'fchown', <<-'TXT', uuid: 'A2DAD31A-1751-4B1D-A2C3-DF664D6A2635'
Unix.fchown ${1:file_descr} ${2:uid} ${3:gid}$0
TXT

  tab 'Unix.fperm', 'File exists', <<-'TXT', uuid: '2740A22A-DF32-4492-AE29-86D0A89FF295'
Unix.F_OK
TXT

  tab 'Unix.fperm', 'Read permission', <<-'TXT', uuid: 'EF7A3AB6-8670-4B6E-A16E-145ECA7A6B47'
Unix.R_OK
TXT

  tab 'Unix.fperm', 'umask', <<-'TXT', uuid: '30D91A50-BA7C-4D49-B977-1F45332892F3'
Unix.umask ${1:mask}$0
TXT

  tab 'Unix.fperm', 'Write permission', <<-'TXT', uuid: 'DA26233F-20C5-4E39-A704-0062EFB4BCD0'
Unix.W_OK
TXT

  tab 'Unix.fseek', 'ftruncate', <<-'TXT', uuid: 'FA5C2C27-68E2-4828-8CE8-441746A2C569'
Unix.ftruncate ${1:file_descr} ${2:len}$0
TXT

  tab 'Unix.fseek', 'lseek', <<-'TXT', uuid: '14B7B39B-1A69-418B-B07C-6D959DC4F40D'
Unix.lseek ${1:file_descr} ${2:ofs} Unix.fseek$0
TXT

  tab 'Unix.fseek', 'Seek relative to beginning of file', <<-'TXT', uuid: '6B7E74F0-4951-49B6-A9B1-E698B37DB3C5'
Unix.SEEK_SET
TXT

  tab 'Unix.fseek', 'Seek relative to current position', <<-'TXT', uuid: '8891EDB5-1EC7-4822-BB28-6F4BA7E328C5'
Unix.SEEK_CUR
TXT

  tab 'Unix.fseek', 'Seek relative to end of file', <<-'TXT', uuid: '0ADE01E9-AE44-4CB4-BE14-45D6AAA719FD'
Unix.SEEK_END
TXT

  tab 'Unix.fseek', 'truncate', <<-'TXT', uuid: '5D9C4076-4C1A-4450-933E-9A69C519AFD4'
Unix.truncate ${1:file_name} ${2:len}$0
TXT

  tab 'Unix.fstat', 'Block device', <<-'TXT', uuid: '862B3BA0-6BB3-412A-AF60-3276C5E6CF6B'
Unix.S_BLK
TXT

  tab 'Unix.fstat', 'Character device', <<-'TXT', uuid: '71EF6B20-277F-4B6B-9D43-2EDFF7C1FD98'
Unix.S_CHR
TXT

  tab 'Unix.fstat', 'Directory', <<-'TXT', uuid: 'D824BF02-E32C-4CBE-914C-D3FE23EC14D7'
Unix.S_DIR
TXT

  tab 'Unix.fstat', 'fstat', <<-'TXT', uuid: '88F3DAEB-C4C9-49CB-9225-2EAFCE2D18E8'
Unix.fstat ${1:file_descr}$0
TXT

  tab 'Unix.fstat', 'lstat', <<-'TXT', uuid: 'E6C8B934-3F38-449A-8B17-4F0150F2846C'
Unix.lstat ${1:file_name}$0
TXT

  tab 'Unix.fstat', 'Named pipe', <<-'TXT', uuid: '5B6194AC-9B83-4D9A-A661-821CB8F14054'
Unix.S_FIFO
TXT

  tab 'Unix.fstat', 'Regular file', <<-'TXT', uuid: 'A8AE0638-17E9-4F6E-9719-B7DF65DA32E8'
Unix.S_REG
TXT

  tab 'Unix.fstat', 'Socket', <<-'TXT', uuid: '76181ABD-5118-4EA7-8C30-9E731F8AFC2A'
Unix.S_SOCK
TXT

  tab 'Unix.fstat', 'stat', <<-'TXT', uuid: '12394859-BA8F-4204-86F8-05517FCE8901'
Unix.stat ${1:file_name}$0
TXT

  tab 'Unix.fstat', 'Stat: Access rights', <<-'TXT', uuid: '5633AE6E-773E-47C0-8953-530BFC2422EB'
Unix.st_perm
TXT

  tab 'Unix.fstat', 'Stat: Device minor number', <<-'TXT', uuid: '9DB68BEB-7825-4650-A4DA-F44D910B1EF1'
Unix.st_rdev
TXT

  tab 'Unix.fstat', 'Stat: Device number', <<-'TXT', uuid: '4D094B2B-19A8-474B-B0E1-1430E49792E5'
Unix.st_dev
TXT

  tab 'Unix.fstat', 'Stat: Group ID of file', <<-'TXT', uuid: '1754117E-DC89-4CAE-9155-B22228E4F722'
Unix.st_gid
TXT

  tab 'Unix.fstat', 'Stat: inode number', <<-'TXT', uuid: '545AF780-1873-46C5-A012-97059C1AFE82'
Unix.st_ino
TXT

  tab 'Unix.fstat', 'Stat: Kind of file', <<-'TXT', uuid: 'FA622A17-AAE1-4D75-B0DB-9477522E65E9'
Unix.st_kind
TXT

  tab 'Unix.fstat', 'Stat: Last access time', <<-'TXT', uuid: '6EE5C926-9B45-4912-8D82-3DDC52005355'
Unix.st_atime
TXT

  tab 'Unix.fstat', 'Stat: Last modification time', <<-'TXT', uuid: 'B67BE946-A398-4D46-88D6-DD96DD69393E'
Unix.st_mtime
TXT

  tab 'Unix.fstat', 'Stat: Last status change time', <<-'TXT', uuid: 'C85B071C-EB4E-4937-B460-EB89EA925102'
Unix.st_ctime
TXT

  tab 'Unix.fstat', 'Stat: Number of links', <<-'TXT', uuid: 'AB88C2BF-1AC6-41F8-8B64-1A039B76A51B'
Unix.st_nlink
TXT

  tab 'Unix.fstat', 'Stat: Size in bytes', <<-'TXT', uuid: '23518B6F-8F74-4310-995A-36DC5F87E963'
Unix.st_size
TXT

  tab 'Unix.fstat', 'Stat: User ID of owner', <<-'TXT', uuid: 'AD30BE12-970D-45F4-8EB1-7978BA403F22'
Unix.st_uid
TXT

  tab 'Unix.fstat', 'Symbolic link', <<-'TXT', uuid: '3AA0DFC9-E202-4272-86BE-8014BC9BDA43'
Unix.S_LNK
TXT

  tab 'Unix.gr', 'groups : gid', <<-'TXT', uuid: '874469FF-E559-49CB-B51D-1ECA45F7C8BF'
Unix.gr_gid
TXT

  tab 'Unix.gr', 'groups : mem', <<-'TXT', uuid: '112B2971-F1EE-43AB-B000-2478731C67BC'
Unix.gr_mem
TXT

  tab 'Unix.gr', 'groups : name', <<-'TXT', uuid: 'C437F71F-761E-48E9-B76C-27B9134712E2'
Unix.gr_name
TXT

  tab 'Unix.gr', 'groups : passwd', <<-'TXT', uuid: '14D5023C-1EFE-4FFD-B652-0657E8072511'
Unix.gr_passwd
TXT

  tab 'Unix.h_', 'hosts: address array', <<-'TXT', uuid: 'DCFECD67-24AB-46D3-A1A6-A2A25A0D73C6'
Unix.h_addr_list
TXT

  tab 'Unix.h_', 'hosts: address domain', <<-'TXT', uuid: '224FE332-8E59-419D-A3F9-E94F8C4FF237'
Unix.h_addrtype
TXT

  tab 'Unix.h_', 'hosts: aliases', <<-'TXT', uuid: '5DC5CD5E-4DD3-4F66-9853-C25A4F98F7E0'
Unix.h_aliases
TXT

  tab 'Unix.h_', 'hosts: name', <<-'TXT', uuid: 'A0F2B932-8963-4928-BE5C-40B46F5311BD'
Unix.h_name
TXT

  tab 'Unix.host', 'gethostbyaddr', <<-'TXT', uuid: '6B2AB7E9-5699-4970-9B01-A0C22A5CF670'
Unix.gethostbyaddr ${1:inet_addr}$0
TXT

  tab 'Unix.host', 'gethostbyname', <<-'TXT', uuid: '60D19E63-16C6-4E56-ACBF-DEAF0617A745'
Unix.gethostbyname ${1:hostname}$0
TXT

  tab 'Unix.host', 'gethostname', <<-'TXT', uuid: '634126E9-77FB-4370-9C2B-80B3646101AA'
Unix.gethostname ()
TXT

  tab 'Unix.host', 'getprotobyname', <<-'TXT', uuid: '762DCDCF-9411-42C6-B59B-EFD5F3455C09'
Unix.getprototbyname ${1:name}$0
TXT

  tab 'Unix.host', 'getprotobynumber', <<-'TXT', uuid: 'C9169E13-EFFC-4FCF-AFC6-8BB07DFECDA0'
Unix.getprototbynumber ${1:proto}$0
TXT

  tab 'Unix.host', 'getservbyname', <<-'TXT', uuid: '7A41CACE-D715-4D97-B231-BBFE6CD595E3'
Unix.getprototbynumber ${1:name} ${2:proto_name}$0
TXT

  tab 'Unix.host', 'getservbyport', <<-'TXT', uuid: '17872E35-BF38-45FF-826B-8D31623F3C57'
Unix.getprototbynumber ${1:port} ${2:proto_name}$0
TXT

  tab 'Unix.id', 'getegid', <<-'TXT', uuid: '2210968F-3087-4F3E-A75C-BF947CD81D8A'
Unix.getegid ()
TXT

  tab 'Unix.id', 'geteuid', <<-'TXT', uuid: '8FD43FAC-7A22-49E2-9CDF-AAB148A9FB66'
Unix.geteuid ()
TXT

  tab 'Unix.id', 'getgid', <<-'TXT', uuid: 'A98B9122-6779-4F50-A5D7-EEB71E7CF3C6'
Unix.getgid ()
TXT

  tab 'Unix.id', 'getgrnam', <<-'TXT', uuid: '61E6C2B5-F930-48D0-8BF5-530612923DA5'
Unix.getgrnam ${1:name}$0
TXT

  tab 'Unix.id', 'getgroups', <<-'TXT', uuid: 'CB6F3068-F39A-4621-A05C-AE9363B737D5'
Unix.getgroups ()
TXT

  tab 'Unix.id', 'getgruid', <<-'TXT', uuid: '44BD981C-8460-4B8F-89DB-330C4C77B2FF'
Unix.getgruid ${1:uid}$0
TXT

  tab 'Unix.id', 'getlogin', <<-'TXT', uuid: '4CBF4164-C876-4741-8749-522CDCBF2CA1'
Unix.getlogin ()
TXT

  tab 'Unix.id', 'getpwnam', <<-'TXT', uuid: '866D4D5A-46BF-4647-A946-7FF867067917'
Unix.getpwnam ${1:name}$0
TXT

  tab 'Unix.id', 'getpwuid', <<-'TXT', uuid: 'B13F0097-1D98-4549-ABA2-CEA007CA8982'
Unix.getpwuid ${1:uid}$0
TXT

  tab 'Unix.id', 'getuid', <<-'TXT', uuid: 'A6689FBE-8A34-457A-BE45-D652272FBD13'
Unix.getuid ()
TXT

  tab 'Unix.id', 'setgid', <<-'TXT', uuid: '386956C9-B50D-4025-858C-64A6166353D1'
Unix.setgid ${1:gid}${2:;}$0
TXT

  tab 'Unix.id', 'setuid', <<-'TXT', uuid: 'C9D068A3-DFBC-45E3-8476-84108CF0368B'
Unix.setuid ${1:uid}${2:;}$0
TXT

  tab 'Unix.in', 'stdin', <<-'TXT', uuid: '4EFF8B8D-DE3F-41E4-AC50-F428AC7476FD'
Unix.stdin
TXT

  tab 'Unix.info', 'getaddrinfo', <<-'TXT', uuid: '582E92DC-30B3-4D01-BAFB-49D038330F86'
Unix.getaddrinfo ${1:host} ${2:service} ${3:[Unix.AI_$0]}
TXT

  tab 'Unix.it_', 'Interval period', <<-'TXT', uuid: 'E8B0020C-6526-4414-A774-72AB702EDC0F'
Unix.it_interval
TXT

  tab 'Unix.it_', 'Interval timer current value', <<-'TXT', uuid: 'AA6C8C95-2AD6-4FA1-ABA5-1B467548FB28'
Unix.it_value
TXT

  tab 'Unix.ITIMER_', 'Decrement interval timer for profiling', <<-'TXT', uuid: 'B5EFF69D-577C-4B46-86B3-BA0E11907EC4'
Unix.ITIMER_PROF
TXT

  tab 'Unix.ITIMER_', 'Decrement interval timer in real time', <<-'TXT', uuid: 'BE800D7C-F09B-41B5-815A-D8802F3D08A9'
Unix.ITIMER_REAL
TXT

  tab 'Unix.ITIMER_', 'Decrement interval timer in virtual time', <<-'TXT', uuid: '9A4E1ABE-F492-40FB-96D4-1055E847DA49'
Unix.ITIMER_VIRTUAL
TXT

  tab 'Unix.LargeFile', 'LargeFile.fstat', <<-'TXT', uuid: 'D34810A9-11B0-4379-82F2-1E07AAB2555F', file: 'LargeFile_fstat'
Unix.LargeFile.fstat ${1:file_descr}$0
TXT

  tab 'Unix.LargeFile', 'LargeFile.ftruncate', <<-'TXT', uuid: '574437AC-B7A4-4F8B-91AC-D6B32CCADC7C', file: 'LargeFile_ftruncate'
Unix.LargeFile.ftruncate ${1:file_descr} ${2:i64}$0
TXT

  tab 'Unix.LargeFile', 'LargeFile.lseek', <<-'TXT', uuid: '16428ADC-AD0F-40C9-A552-3880EAA20CC0', file: 'LargeFile_lseek'
Unix.LargeFile.lseek ${1:file_descr} ${2:i64} Unix.fseek$0
TXT

  tab 'Unix.LargeFile', 'LargeFile.lstat', <<-'TXT', uuid: '682C3BFB-C43F-4D37-959D-7A5CF09389BA', file: 'LargeFile_lstat'
Unix.LargeFile.lstat ${1:file_name}$0
TXT

  tab 'Unix.LargeFile', 'LargeFile.stat', <<-'TXT', uuid: '1A02ADA2-81CF-4D3A-9D78-EE4DB8CC4256', file: 'LargeFile_stat'
Unix.LargeFile.stat ${1:file_name}$0
TXT

  tab 'Unix.LargeFile', 'LargeFile.truncate', <<-'TXT', uuid: '28365C16-013E-4233-AC69-D0A03606A0E0', file: 'LargeFile_truncate'
Unix.LargeFile.truncate ${1:file_name} ${2:i64}$0
TXT

  tab 'Unix.LargeFile', 'LargeFile: Access rights', <<-'TXT', uuid: '4290AD6F-70E3-4ACB-BF5D-03DFB7DB42CD'
Unix.LargeFile.st_perm
TXT

  tab 'Unix.LargeFile', 'LargeFile: Device minor number', <<-'TXT', uuid: 'E73AEA48-F748-4332-8793-A2FF7E5683B1'
Unix.LargeFile.st_rdev
TXT

  tab 'Unix.LargeFile', 'LargeFile: Device number', <<-'TXT', uuid: '54D43CD3-CB29-4CA0-8A81-7C4611533E8D'
Unix.LargeFile.st_dev
TXT

  tab 'Unix.LargeFile', 'LargeFile: Group ID of file', <<-'TXT', uuid: '9D0CEA17-4412-4FD0-BAF6-5B30C96E6019'
Unix.LargeFile.st_gid
TXT

  tab 'Unix.LargeFile', 'LargeFile: inode number', <<-'TXT', uuid: '2C96070E-540D-4C58-91D6-01C9E79F957B'
Unix.LargeFile.st_ino
TXT

  tab 'Unix.LargeFile', 'LargeFile: Kind of file', <<-'TXT', uuid: 'A2BBE037-97DA-49FC-A5AA-60973177B883'
Unix.LargeFile.st_kind
TXT

  tab 'Unix.LargeFile', 'LargeFile: Last access time', <<-'TXT', uuid: 'E718A9A5-8817-4368-8AD5-CC77141BB429'
Unix.LargeFile.st_atime
TXT

  tab 'Unix.LargeFile', 'LargeFile: Last modification time', <<-'TXT', uuid: 'C7814E70-1089-4720-A785-C8A5493713D9'
Unix.LargeFile.st_mtime
TXT

  tab 'Unix.LargeFile', 'LargeFile: Last status change time', <<-'TXT', uuid: '1EAB6104-67C7-4864-914B-EAB829225575'
Unix.LargeFile.st_ctime
TXT

  tab 'Unix.LargeFile', 'LargeFile: Number of links', <<-'TXT', uuid: 'FADC915F-3C5D-4645-918F-584F65BAC4D7'
Unix.LargeFile.st_nlink
TXT

  tab 'Unix.LargeFile', 'LargeFile: Size in bytes', <<-'TXT', uuid: '0B235714-CF1F-48F1-B227-ADE3A4B3389E'
Unix.LargeFile.st_size
TXT

  tab 'Unix.LargeFile', 'LargeFile: User ID of owner', <<-'TXT', uuid: '14D95CA9-A7A4-4286-8ABD-FC00D7811B13'
Unix.LargeFile.st_uid
TXT

  tab 'Unix.link', 'readlink', <<-'TXT', uuid: 'F2D1C0CB-3ED0-42AA-A113-6A0C536DBEBF'
Unix.symlink ${1:link_name}$0
TXT

  tab 'Unix.link', 'symlink', <<-'TXT', uuid: 'B545AD25-6308-441A-8A37-88F1FE3FF6C5'
Unix.symlink ${1:src_name} ${2:dest_name}$0
TXT

  tab 'Unix.lock', 'lockf', <<-'TXT', uuid: '44877A7B-CE46-4285-99B3-34677B4CE48C'
Unix.lockf ${1:file_descr} Unix.lock_t$0 ${2:size}
TXT

  tab 'Unix.lock_t', 'Lock a region for reading, blocking', <<-'TXT', uuid: '84E26A50-9461-44C0-A18B-D38E9D2BB533'
Unix.F_RLOCK
TXT

  tab 'Unix.lock_t', 'Lock a region for reading, non-blocking', <<-'TXT', uuid: '6ADB1B8D-B25F-4B4D-805A-83F3D2C4B671'
Unix.F_TRLOCK
TXT

  tab 'Unix.lock_t', 'Lock a region for writing, blocking', <<-'TXT', uuid: '32DECCC1-791B-47E9-8BBC-1471E4965A61'
Unix.F_LOCK
TXT

  tab 'Unix.lock_t', 'Lock a region for writing, non-blocking', <<-'TXT', uuid: '0AC6709F-178E-4723-A979-0DB6401F3F87'
Unix.F_TLOCK
TXT

  tab 'Unix.lock_t', 'Test a region for locks', <<-'TXT', uuid: 'CD1E5BD3-B7FE-4358-8BE5-F8EC40C6C3C9'
Unix.F_TEST
TXT

  tab 'Unix.lock_t', 'Unlock a region', <<-'TXT', uuid: 'B7CD68FD-50C1-4BDC-B80D-3C7F8C881B1E'
Unix.F_ULOCK
TXT

  tab 'Unix.MSG_', 'MSG_DONTROUTE', <<-'TXT', uuid: '82F77C1C-4030-4A1A-A713-923D631A178A'
Unix.MSG_DONTROUTE
TXT

  tab 'Unix.MSG_', 'MSG_OOB', <<-'TXT', uuid: 'D7462604-B4C4-452A-921D-F676C25F01BC'
Unix.MSG_OOB
TXT

  tab 'Unix.MSG_', 'MSG_PEEK', <<-'TXT', uuid: '66ACC8A9-9E34-45B3-BE1F-831F37984714'
Unix.MSG_PEEK
TXT

  tab 'Unix.NI_', 'Always return host as IP addresss', <<-'TXT', uuid: '38E08BE1-70D4-4D9E-92D1-698A481E9482'
Unix.NI_NUMERICHOST
TXT

  tab 'Unix.NI_', 'Always return service as port number', <<-'TXT', uuid: 'AFABFD5F-36F3-4FA1-AFAF-B287F924D79B'
Unix.NI_NUMERICSERV
TXT

  tab 'Unix.NI_', 'Consider service as UDP, not TCP', <<-'TXT', uuid: '5E0CF021-EA59-4D6F-B259-D148652A64FE'
Unix.NI_DGRAM
TXT

  tab 'Unix.NI_', 'Do not qualify local host names', <<-'TXT', uuid: '00173F11-A9E1-43BA-9429-9B200332E122'
Unix.NI_NOFQDN
TXT

  tab 'Unix.NI_', 'Fail if host name cannot be determined', <<-'TXT', uuid: '9F8E3D4F-877C-4A92-BFC4-6D1B8591CAD0'
Unix.NI_NAMEREQD
TXT

  tab 'Unix.ni_', 'Name of IP address of host', <<-'TXT', uuid: 'C1779A55-D26D-4C88-A6F8-062FC5053B25'
Unix.ni_hostname
TXT

  tab 'Unix.ni_', 'Name of service or port number', <<-'TXT', uuid: '21E7AE01-88BB-4127-855C-B4178E4FF002'
Unix.ni_service
TXT

  tab 'Unix.open_', 'Create if nonexistant', <<-'TXT', uuid: '047E4B60-A2DD-431E-8859-FAB37E308093'
Unix.O_CREAT
TXT

  tab 'Unix.open_', "Don't make this dev a controlling tty", <<-'TXT', uuid: '49C73A01-ED80-4386-A6EC-EA0DF4899221'
Unix.O_NOCTTY
TXT

  tab 'Unix.open_', 'Fail if existing', <<-'TXT', uuid: '67D562D7-0019-4716-B784-C050CEDBCCFC'
Unix.O_EXCL
TXT

  tab 'Unix.open_', 'Open for appending', <<-'TXT', uuid: 'B5C98728-1319-455D-B035-70147EC1ABD1'
Unix.O_APPEND
TXT

  tab 'Unix.open_', 'Open for reading and writing', <<-'TXT', uuid: '3B0073C6-9BD1-463A-9172-A82F450E992B'
Unix.O_RDWR
TXT

  tab 'Unix.open_', 'Open in non-blocking mode', <<-'TXT', uuid: 'F25985A5-638B-4147-8DDA-BE165ED80608'
Unix.O_NONBLOCK
TXT

  tab 'Unix.open_', 'Open read-only', <<-'TXT', uuid: '31A2564A-83B5-498B-97D1-0F223E4EB67B'
Unix.O_RDONLY
TXT

  tab 'Unix.open_', 'Open write-only', <<-'TXT', uuid: '7AE48A9F-BC77-471C-BB9C-63620B0ACF98'
Unix.O_WRONLY
TXT

  tab 'Unix.open_', 'Reads complete as writes', <<-'TXT', uuid: 'DF12A3EE-5F6C-4A0D-89FA-FECD63B3AB0E'
Unix.O_RSYNC
TXT

  tab 'Unix.open_', 'Truncate to 0 length if existing', <<-'TXT', uuid: '60C1A4D5-FE52-40F0-9CB0-B9697E37BBFB'
Unix.O_TRUNC
TXT

  tab 'Unix.open_', 'Writes complete as ‘Synchronised I/O data integrity completion’', <<-'TXT', uuid: '688D26E5-C7D9-41EE-B6A0-CE5D497838FF', file: 'Writes complete as ‘Synchronised I˸O data integrity completion’'
Unix.O_DSYNC
TXT

  tab 'Unix.open_', 'Writes complete as ‘Synchronised I/O file integrity completion’', <<-'TXT', uuid: '2F477FB7-B08B-4694-B38F-64F688025296', file: 'Writes complete as ‘Synchronised I˸O file integrity completion’'
Unix.O_SYNC
TXT

  tab 'Unix.out', 'stdout', <<-'TXT', uuid: 'D028025E-9763-4C2C-B56E-0ACF35792279'
Unix.stdout
TXT

  tab 'Unix.p_', 'protocols: aliases', <<-'TXT', uuid: '68AC8EF9-792C-43BC-A066-B6FC0EBAA1E7'
Unix.p_aliases
TXT

  tab 'Unix.p_', 'protocols: name', <<-'TXT', uuid: 'ACD2002C-84CB-4925-BFE8-ACEA0763213F'
Unix.p_name
TXT

  tab 'Unix.p_', 'protocols: protocol', <<-'TXT', uuid: 'E2AF882C-20EC-45B3-AE70-B998924251BA'
Unix.p_proto
TXT

  tab 'Unix.PF_', 'Internet socket domain', <<-'TXT', uuid: '4D635CDC-2F94-443C-801D-CB59936FB08C'
Unix.PF_INET
TXT

  tab 'Unix.PF_', 'Internet socket domain (IPv6)', <<-'TXT', uuid: 'D5EC1BA8-64CE-4806-B8B3-83AC49F4669B'
Unix.PF_INET6
TXT

  tab 'Unix.PF_', 'Unix socket domain', <<-'TXT', uuid: 'AC1E81FC-E0C5-4AE4-9C4D-A1D355B47432'
Unix.PF_UNIX
TXT

  tab 'Unix.pipe', 'mkfifo', <<-'TXT', uuid: '8B0B5555-5A7D-4B34-A0AA-DBDAA3E9B8C2'
Unix.mkfifo ${1:pipe_name} 0o${2:644}$0
TXT

  tab 'Unix.pipe', 'pipe', <<-'TXT', uuid: '1B6DED30-6DD5-4CA3-843A-5E7CEB1171FA'
Unix.pipe ()${1:;}$0
TXT

  tab 'Unix.proc', 'execv', <<-'TXT', uuid: 'FD3F6505-9D1E-469E-B912-2BD860B5433B'
Unix.execv ${1:prog} ${2:[|${3:arg_array;}|]}$0
TXT

  tab 'Unix.proc', 'execve', <<-'TXT', uuid: '4D018969-0C36-4C55-BA2E-987A0651D585'
Unix.execve ${1:prog} ${2:[|${3:arg_array;}|]} ${4:[|${5:env_array;}|]}$0
TXT

  tab 'Unix.proc', 'execvp', <<-'TXT', uuid: 'A16EE87B-B466-4A45-9E12-A3059E8F691E'
Unix.execvp ${1:prog} ${2:[|${3:arg_array;}|]}$0
TXT

  tab 'Unix.proc', 'execvpe', <<-'TXT', uuid: 'AEABD4F3-BC26-4583-8EA8-E8059CB3DAA5'
Unix.execvpe ${1:prog} ${2:[|${3:arg_array;}|]} ${4:[|${5:env_array;}|]}$0
TXT

  tab 'Unix.proc', 'fork', <<-'TXT', uuid: '2391A7BC-D747-4F74-9198-21EF8E6B78BE'
Unix.fork ()${1:;}$0
TXT

  tab 'Unix.proc', 'getpid', <<-'TXT', uuid: '8495A533-CCD3-40F5-8627-3852F6327524'
Unix.getpid ()${1:;}$0
TXT

  tab 'Unix.proc', 'getppid', <<-'TXT', uuid: '675DFD79-E529-4ADA-8864-9D866CCD2AA4'
Unix.getppid ()${1:;}$0
TXT

  tab 'Unix.proc', 'nice', <<-'TXT', uuid: '375C0E16-FAD2-4CAD-ADA0-9A92457570B2'
Unix.nice ${1:i}$0
TXT

  tab 'Unix.proc', 'Status: process killed by signal', <<-'TXT', uuid: 'AB590FDA-2AEC-4609-81EA-F127BCE4E232'
Unix.WSIGNALED ${1:sig_no}$0
TXT

  tab 'Unix.proc', 'Status: process stopped by signal', <<-'TXT', uuid: '689B34F2-AF7E-4B8E-BD38-B4CB3429CDA8'
Unix.WSTOPPED ${1:sig_no}$0
TXT

  tab 'Unix.proc', 'Status: process terminated normally', <<-'TXT', uuid: 'D48DD01E-AE7E-4E86-8E0F-C0D6FF8AAF31'
Unix.WEXITED ${1:exit_code}$0
TXT

  tab 'Unix.proc', 'system', <<-'TXT', uuid: 'F37CF8A9-730B-4DB2-86BA-BF8C871C5922'
Unix.system ${1:cmd}$0
TXT

  tab 'Unix.proc', 'wait', <<-'TXT', uuid: 'E038E738-DF0E-4425-93B7-CA4BB2EEE050'
Unix.wait ()${1:;}$0
TXT

  tab 'Unix.proc', "Wait flag : Don't block if children alive", <<-'TXT', uuid: 'BB87A3A8-B51D-4172-86BA-CE8CFB5B976F'
Unix.WNOHANG
TXT

  tab 'Unix.proc', 'Wait flag : Report stopped children', <<-'TXT', uuid: '0ABCAC8D-D3BC-4F3C-AD17-99989B776643'
Unix.WUNTRACED
TXT

  tab 'Unix.proc', 'waitpid', <<-'TXT', uuid: '690E5400-B4D5-4B1E-9239-E639F3CC6FFF'
Unix.waitpid [${1:wait_flags}] ${2:pid}$0
TXT

  tab 'Unix.pw', 'passwd : dir', <<-'TXT', uuid: 'A764DE84-D484-4FE4-AF48-620424A5B771'
Unix.pw_dir
TXT

  tab 'Unix.pw', 'passwd : gecos', <<-'TXT', uuid: 'D5B153F3-2113-499A-B5F8-207C62449420'
Unix.pw_gecos
TXT

  tab 'Unix.pw', 'passwd : gid', <<-'TXT', uuid: '3383E347-C8A5-4B76-B1FC-907635D20105'
Unix.pw_gid
TXT

  tab 'Unix.pw', 'passwd : name', <<-'TXT', uuid: '5EE3F90A-0C72-4796-8740-A9F3C84B7E2D'
Unix.pw_name
TXT

  tab 'Unix.pw', 'passwd : passwd', <<-'TXT', uuid: 'FEC0CC46-493F-42A3-97D0-0CE07A54C1E5'
Unix.pw_passwd
TXT

  tab 'Unix.pw', 'passwd : shell', <<-'TXT', uuid: 'DE5822FA-4BC5-4C61-B89F-BD7BC55BC30E'
Unix.pw_shell
TXT

  tab 'Unix.pw', 'passwd : uid', <<-'TXT', uuid: '113C83E9-CC2D-4C17-97B8-3E57907630B0'
Unix.pw_uid
TXT

  tab 'Unix.run', 'close_process', <<-'TXT', uuid: 'D37E0573-86E9-48CF-B78F-8B6E657EA0DF'
Unix.close_process ${1:(${2:in_channel}, ${3:out_channel})}$0
TXT

  tab 'Unix.run', 'close_process_full', <<-'TXT', uuid: '5FDB4946-956E-4CC8-85D8-6272EF14509F'
Unix.close_process_full ${1:(${2:in_channel}, ${3:out_channel}, ${4:err_channel})}$0
TXT

  tab 'Unix.run', 'close_process_in', <<-'TXT', uuid: 'B0017660-450D-4D98-AC5D-78ADD02B3D25'
Unix.close_process_in ${1:in_channel}$0
TXT

  tab 'Unix.run', 'close_process_out', <<-'TXT', uuid: '5AAFB7F4-855F-49A1-88C2-CC7ED221A3F6'
Unix.close_process_out ${1:out_channel}$0
TXT

  tab 'Unix.run', 'create_process', <<-'TXT', uuid: '9A4FABC9-8909-4439-A6F3-B94BCDA7BF32'
Unix.create_process ${1:prog} ${2:[${3:arg_list;}]} ${4:new_stdin_descr} ${5:new_stdout_descr} ${6:new_stderr_descr}$0
TXT

  tab 'Unix.run', 'create_process_env', <<-'TXT', uuid: '96A31410-B9FF-4440-ACFF-AEAAD2B03DD1'
Unix.create_process ${1:prog} ${2:[${3:arg_list;}]}  ${4:[${5:env_list;}]} ${6:new_stdin_descr} ${7:new_stdout_descr} ${8:new_stderr_descr}$0
TXT

  tab 'Unix.run', 'open_process', <<-'TXT', uuid: '0AE54CE7-92C2-4CDC-9565-5A86BC8C8DAF'
Unix.open_process ${1:prog}$0
TXT

  tab 'Unix.run', 'open_process_full', <<-'TXT', uuid: 'E0A7C110-45D3-4659-8BA5-CA4D0BF559DB'
Unix.open_process_full ${1:prog} ${2:[${3:env_list;}]}$0
TXT

  tab 'Unix.run', 'open_process_in', <<-'TXT', uuid: 'A4A03E12-7D80-48D4-8DAA-E56FB23C7BAF'
Unix.open_process_in ${1:prog}$0
TXT

  tab 'Unix.run', 'open_process_out', <<-'TXT', uuid: '78B42424-152A-401C-8707-5317EC3B1764'
Unix.open_process_out ${1:prog}$0
TXT

  tab 'Unix.s_', 'services: aliases', <<-'TXT', uuid: 'D228702C-F70B-4D86-85D2-FEBF011C6DD8'
Unix.s_aliases
TXT

  tab 'Unix.s_', 'services: name', <<-'TXT', uuid: '4E46B15E-4A5A-4332-8389-E50C2E9AE458'
Unix.s_name
TXT

  tab 'Unix.s_', 'services: port', <<-'TXT', uuid: '937CE541-B905-4334-B34C-C6F3006F4AF0'
Unix.s_port
TXT

  tab 'Unix.s_', 'services: protocol', <<-'TXT', uuid: '01A83D69-B5E2-4632-B8AF-FE24D14A7ACC'
Unix.s_proto
TXT

  tab 'Unix.select', 'select', <<-'TXT', uuid: 'F90429D3-C766-4AE1-9A61-55EDD7306A11'
Unix.select ${1:[${2:read_descr_list;}]} ${3:[${4:write_descr_list;}]} ${5:[${6:exceptional_descr_list;}]} ${7:timeout_float}$0
TXT

  tab 'Unix.SHUTDOWN_', 'Close socket for receiving', <<-'TXT', uuid: '74F90F5C-4384-47F1-9B05-3BF43A2683D7'
Unix.SHUTDOWN_RECEIVE
TXT

  tab 'Unix.SHUTDOWN_', 'Close socket for sending', <<-'TXT', uuid: '193B9EAC-CFBE-4B84-A7D1-6795D1E5E884'
Unix.SHUTDOWN_SEND
TXT

  tab 'Unix.SHUTDOWN_', 'Close socket for sending and receiving', <<-'TXT', uuid: 'DCDB5A79-2067-47AE-9C60-A613A96404A7'
Unix.SHUTDOWN_ALL
TXT

  tab 'Unix.sig', 'kill', <<-'TXT', uuid: '680F6D59-9193-4F7C-B544-EDC59707F5F8'
Unix.kill ${1:pid} ${2:sig_no}$0
TXT

  tab 'Unix.sig', 'pause', <<-'TXT', uuid: 'A7342617-E0D3-400B-8346-01643216DD08'
Unix.pause ()${1:;}$0
TXT

  tab 'Unix.sig', 'sigpending', <<-'TXT', uuid: 'A723315D-84BE-497D-9CC4-0405B5BC1E4E'
Unix.sigpending ()
TXT

  tab 'Unix.sig', 'sigprocmask', <<-'TXT', uuid: 'BE88139B-FD69-4A7B-8197-79629195ED0D'
Unix.sigprocmask Unix.SIG_$0 [${1:signal list}]
TXT

  tab 'Unix.sig', 'sigsuspend', <<-'TXT', uuid: '3FE1761F-843A-418B-80D3-D2C57C53251B'
Unix.sigsuspend ${1:[${2:signal_list;}]}${3:;}$0
TXT

  tab 'Unix.SIG_', 'Blocked listed signals', <<-'TXT', uuid: 'B05DA541-8BA5-426E-9DDB-5E186A643A0F'
Unix.SIG_BLOCK
TXT

  tab 'Unix.SIG_', 'Set blocked signals to those listed', <<-'TXT', uuid: '9139F56F-991A-4FD6-B385-AB7BBA6DC81F'
Unix.SIG_SETMASK
TXT

  tab 'Unix.SIG_', 'Unblocked listed signals', <<-'TXT', uuid: 'BDBD65F1-6C4E-4819-83EA-726119A2912D'
Unix.SIG_UNBLOCK
TXT

  tab 'Unix.SOB_', 'Allow reuse of local addresses for bind', <<-'TXT', uuid: 'FDD1A0FA-5323-46B8-8391-3AB362ABE14C'
Unix.SO_REUSEADDR
TXT

  tab 'Unix.SOB_', 'Bypass standard routing algorithms', <<-'TXT', uuid: 'E160FB7B-2FA6-454D-A82F-124CAE091702'
Unix.SO_DONTROUTE
TXT

  tab 'Unix.SOB_', 'Keep connection alive', <<-'TXT', uuid: '6F7B633A-A192-4256-8108-46D6172D9AA2'
Unix.SO_KEEPALIVE
TXT

  tab 'Unix.SOB_', 'Leave out-of-band data in line', <<-'TXT', uuid: '89468BAD-4221-4372-ABA4-A4B83D0810D7'
Unix.SO_OOBINLINE
TXT

  tab 'Unix.SOB_', 'Permit sending of broadcast messages', <<-'TXT', uuid: 'F3C43C3A-8D66-492A-915F-D2DA02BB607A'
Unix.SO_BROADCAST
TXT

  tab 'Unix.SOB_', 'Record debugging information', <<-'TXT', uuid: 'DA6DC490-400C-4322-A21B-FFDDA05854AD'
Unix.SO_DEBUG
TXT

  tab 'Unix.SOB_', 'Report whether socket listening is enabled', <<-'TXT', uuid: '61296B56-F775-4C43-B20F-EE25DA68B0FA'
Unix.SO_ACCEPTCONN
TXT

  tab 'Unix.sock', 'accept', <<-'TXT', uuid: '57FCE0C1-93F7-4030-8E51-1B393AAFB84F'
Unix.accept ${1:sock}$0
TXT

  tab 'Unix.sock', 'bind', <<-'TXT', uuid: 'E8812CF7-7E38-413F-9148-45301A3992CC'
Unix.bind ${1:sock} (Unix.ADDR_$0);
TXT

  tab 'Unix.sock', 'connect', <<-'TXT', uuid: '401F6F0B-877F-4414-8CAA-F8B38F93EE6D'
Unix.connect ${1:sock} (Unix.ADDR_$0);
TXT

  tab 'Unix.sock', 'domain_of_sockaddr', <<-'TXT', uuid: 'E5014E66-AC38-4CD1-A664-3E92D735EBE9'
Unix.domain_of_sockaddr Unix.ADDR_$0
TXT

  tab 'Unix.sock', 'getpeername', <<-'TXT', uuid: '0143770D-5D42-4DAE-96C5-7FD0E223F985'
Unix.getpeername ${1:sock}$0
TXT

  tab 'Unix.sock', 'getsockname', <<-'TXT', uuid: '8BA7EABC-8E51-4456-B0ED-92F3328391F6'
Unix.getsockname ${1:sock}$0
TXT

  tab 'Unix.sock', 'listen', <<-'TXT', uuid: '90D7F19E-F239-464E-9A51-3F4A89AE174B'
Unix.listen ${1:sock} ${2:max_reqs}${3:;}$0
TXT

  tab 'Unix.sock', 'recv', <<-'TXT', uuid: '70238255-EC57-4F3B-A744-2E57482E3825'
Unix.recv ${1:sock} ${2:buf} ${3:pos} ${4:len} ${5:[Unix.msg_$0]}
TXT

  tab 'Unix.sock', 'recvfrom', <<-'TXT', uuid: '33720618-49FB-4CF4-99A0-917C9F86DB85'
Unix.recvfrom ${1:sock} ${2:buf} ${3:pos} ${4:len} ${5:[Unix.msg_$0]}
TXT

  tab 'Unix.sock', 'send', <<-'TXT', uuid: '0E2B2127-9419-41BD-A0D1-1FCC5A0CA178'
Unix.send ${1:sock} ${2:buf} ${3:pos} ${4:len} ${5:[Unix.msg_$0]}
TXT

  tab 'Unix.sock', 'sendto', <<-'TXT', uuid: '181F8313-7661-4368-97AD-60C85A722BBF'
Unix.sendto ${1:sock} ${2:buf} ${3:pos} ${4:len} ${5:[Unix.msg_$0]} (Unix.ADDR_)
TXT

  tab 'Unix.sock', 'shutdown', <<-'TXT', uuid: '10528A94-D56C-427D-823B-AD3E47CE4856'
Unix.shutdown ${1:sock} Unix.SHUTDOWN_$0;
TXT

  tab 'Unix.sock', 'socket', <<-'TXT', uuid: '34D9E453-A1C7-44EB-9093-7525600AB5D6', file: 'socket 2'
Unix.socket Unix.PF_$0 Unix.SOCK_ ${1:proto}
TXT

  tab 'Unix.sock', 'socketpair', <<-'TXT', uuid: '4653CE0B-F06F-4095-8FCB-F89217A63A26'
Unix.socketpair Unix.PF_$0 Unix.SOCK_ ${1:proto}
TXT

  tab 'Unix.SOCK_', 'Datagram socket', <<-'TXT', uuid: 'E30FB797-842C-4A72-9BD6-9A062B420635'
Unix.SOCK_DGRAM
TXT

  tab 'Unix.SOCK_', 'Raw socket', <<-'TXT', uuid: '136C3483-7487-4A15-BA6E-61772C896851'
Unix.SOCK_RAW
TXT

  tab 'Unix.SOCK_', 'Sequenced packets socket', <<-'TXT', uuid: '06B4D164-9228-4B3B-A206-7F8E33202148'
Unix.SOCK_SEQPACKET
TXT

  tab 'Unix.SOCK_', 'Stream socket', <<-'TXT', uuid: 'CB8AB443-33F4-4338-90B7-D1FEE3B9E637'
Unix.SOCK_STREAM
TXT

  tab 'Unix.sockopt', 'getsockopt', <<-'TXT', uuid: '6A9F8385-2F83-4A87-9C67-2B95EC9A2A36'
Unix.getsockopt ${1:sock} Unix.SOB_$0
TXT

  tab 'Unix.sockopt', 'getsockopt_float', <<-'TXT', uuid: '4B1292D8-89D3-428C-A716-07121A73E283'
Unix.getsockopt_float ${1:sock} Unix.SOF_$0
TXT

  tab 'Unix.sockopt', 'getsockopt_int', <<-'TXT', uuid: '1F129C8B-E6AE-494E-8932-C9599636C199'
Unix.getsockopt_int ${1:sock} Unix.SOI_$0
TXT

  tab 'Unix.sockopt', 'getsockopt_optint', <<-'TXT', uuid: '54F745FE-04F3-47D8-9B1E-A052D670C76C'
Unix.getsockopt_optint ${1:sock} Unix.SOIO_$0
TXT

  tab 'Unix.sockopt', 'setsockopt', <<-'TXT', uuid: '60FBE596-A7C8-4531-AEB9-B9E8F4EAA393'
Unix.setsockopt ${1:sock} Unix.SOB_$0 ${2:true};
TXT

  tab 'Unix.sockopt', 'setsockopt_float', <<-'TXT', uuid: 'A090C9D5-4337-418A-8D9E-8152D6363F49'
Unix.setsockopt_float ${1:sock} Unix.SOF_$0 ${2:value};
TXT

  tab 'Unix.sockopt', 'setsockopt_int', <<-'TXT', uuid: '7727EB00-9DB4-41BF-A68C-514B609E8523'
Unix.setsockopt_int ${1:sock} Unix.SOI_$0 ${2:value};
TXT

  tab 'Unix.sockopt', 'setsockopt_optint', <<-'TXT', uuid: 'A26FDD44-CD25-4F66-8842-74984243EE0D'
Unix.setsockopt_optint ${1:sock} Unix.SOIO_$0 ${2:value_option};
TXT

  tab 'Unix.SOF_', 'Timeout for input operations', <<-'TXT', uuid: '387660C7-5B58-4E0E-8C76-CFF6F802AF1E'
Unix.SO_RCVTIMEO
TXT

  tab 'Unix.SOF_', 'Timeout for output operations', <<-'TXT', uuid: '58A4D5C0-BDDF-4C9A-80D7-CB636CF41383'
Unix.SO_SNDTIMEO
TXT

  tab 'Unix.SOI_', 'Min number of bytes to process for input ops', <<-'TXT', uuid: '79E75AE7-1968-4917-B275-A1EA530CA9F9'
Unix.SO_RCVLOWAT
TXT

  tab 'Unix.SOI_', 'Min number of bytes to process for output ops', <<-'TXT', uuid: 'E9218FD2-DD14-4F0E-AD71-07418E622D98'
Unix.SO_SNDLOWAT
TXT

  tab 'Unix.SOI_', 'Report error status and clear it', <<-'TXT', uuid: '08AE4AF9-F1EB-44AB-ABD0-96AD876BEA18'
Unix.SO_ERROR
TXT

  tab 'Unix.SOI_', 'Size of receive buffer', <<-'TXT', uuid: '09A24B8B-8C43-4D62-AAF7-278228825C4E'
Unix.SO_RCVBUF
TXT

  tab 'Unix.SOI_', 'Size of send buffer', <<-'TXT', uuid: '1940EC35-758C-40E3-BEB2-C8142F087668'
Unix.SO_SNDBUF
TXT

  tab 'Unix.SOIO_', 'Whether to linger on closed connections and for how long', <<-'TXT', uuid: '0C02A630-A24E-4E65-8100-7A0E1A8746A8'
Unix.SO_LINGER
TXT

  tab 'Unix.TCSA', 'Set term attribute after flushing rcvd input', <<-'TXT', uuid: 'FC917331-3F21-4035-AF15-C741F3099767'
Unix.TCSAFLUSH
TXT

  tab 'Unix.TCSA', 'Set term attribute after pending output xmitted', <<-'TXT', uuid: '111CD901-F48F-423D-A01F-BEF3FB1AB3FF'
Unix.TCSADRAIN
TXT

  tab 'Unix.TCSA', 'Set term attribute now', <<-'TXT', uuid: 'E47E304B-44AF-4473-80AC-8030FBD77F51'
Unix.TCSANOW
TXT

  tab 'Unix.term', 'setsid', <<-'TXT', uuid: 'F9C7049D-F3F9-4AD9-88DA-008A8558239C'
Unix.setsid ()
TXT

  tab 'Unix.term', 'tcdrain', <<-'TXT', uuid: '5F61C35B-98FF-419F-A6F6-A85979CC211E'
Unix.tcsendbreak ${1:file_descr}${2:;}$0
TXT

  tab 'Unix.term', 'tcflow', <<-'TXT', uuid: 'C760D6E1-1B04-4485-987E-736B958DE33F'
Unix.tcflow ${1:file_descr} Unix.FLOW$0;
TXT

  tab 'Unix.term', 'tcgetattr', <<-'TXT', uuid: '33F68AD6-74BA-4505-8FF1-4C51C165FD8A'
Unix.tcgetattr ${1:file_descr}$0
TXT

  tab 'Unix.term', 'tcsendbreak', <<-'TXT', uuid: 'BC72C717-C805-4E56-8064-9D418F827CBF'
Unix.tcsendbreak ${1:file_descr} ${2:break_len}${3:;}$0
TXT

  tab 'Unix.term', 'tcsetaddr', <<-'TXT', uuid: 'D26F3667-6147-4243-A00B-065F403933E5'
Unix.tcsetaddr ${1:file_descr} Unix.TCSA$0 ${2:terminal_io record}
TXT

  tab 'Unix.term', 'terminal_io record', <<-'TXT', uuid: '96862CC0-373E-4310-9777-FC6965A139F7'
{ Unix.c_ignbrk = ${1:true}
; Unix.c_brkint = ${2:true}
; Unix.c_ignpar = ${3:true}
; Unix.c_parmrk = ${4:true}
; Unix.c_inpck  = ${5:true}
; Unix.c_istrip = ${6:true}
; Unix.c_inlcr  = ${7:true}
; Unix.c_igncr  = ${8:true}
; Unix.c_icrnl  = ${9:true}
; Unix.c_ixon   = ${10:true}
; Unix.c_ixoff  = ${11:true}
; Unix.c_opost  = ${12:true}
; Unix.c_obaud  = ${13:true}
; Unix.c_ibaud  = ${14:true}
; Unix.c_csize  = ${15:true}
; Unix.c_cstopb = ${16:true}
; Unix.c_cread  = ${17:true}
; Unix.c_parenb = ${18:true}
; Unix.c_parodd = ${19:true}
; Unix.c_hupcl  = ${20:true}
; Unix.c_clocal = ${21:true}
; Unix.c_isig   = ${22:true}
; Unix.c_icanon = ${23:true}
; Unix.c_noflsh = ${24:true}
; Unix.c_echo   = ${25:true}
; Unix.c_echoe  = ${26:true}
; Unix.c_echok  = ${27:true}
; Unix.c_echonl = ${28:true}
; Unix.c_vintr  = ${29:true}
; Unix.c_vquit  = ${30:true}
; Unix.c_verase = ${31:true}
; Unix.c_vkill  = ${32:true}
; Unix.c_veof   = ${33:true}
; Unix.c_veol   = ${34:true}
; Unix.c_vmin   = ${35:true}
; Unix.c_vtime  = ${36:true}
; Unix.c_vstart = ${37:true}
; Unix.c_vstop  = ${38:true}
}$0
TXT

  tab 'Unix.term_', 'Disable flush after INTR, QUIT, SUSP.', <<-'TXT', uuid: 'A3FB4C2E-BBD3-4C00-98A1-9A04B904DD22', file: 'Disable flush after INTR, QUIT, SUSP_'
Unix.c_noflsh
TXT

  tab 'Unix.term_', 'Echo ERASE (to erase previous char)', <<-'TXT', uuid: '384F3187-B470-40D8-A0A9-0AB73300C894'
Unix.c_echoe
TXT

  tab 'Unix.term_', 'Echo input characters', <<-'TXT', uuid: '96329710-76E9-4CB9-B683-09C5C90759D8'
Unix.c_echo
TXT

  tab 'Unix.term_', 'Echo KILL (to erase current line)', <<-'TXT', uuid: '169F2CA2-157F-457D-A4B6-E1F0CDB12ABC'
Unix.c_echok
TXT

  tab 'Unix.term_', 'Echo NL even if c_echo is not set', <<-'TXT', uuid: '3836DF16-5B34-48A5-9962-5CADD97B5AE1'
Unix.c_echonl
TXT

  tab 'Unix.term_', 'Emit XON/XOFF chars to control input flow', <<-'TXT', uuid: 'E6B4542E-8225-460A-B965-E70C67E2A209', file: 'Emit XON˸XOFF chars to control input flow'
Unix.c_ixoff
TXT

  tab 'Unix.term_', 'Enable canonical processing (line buffering and edititng)', <<-'TXT', uuid: '4ACB5154-7228-4B5A-9C7D-ADED83DD37BA'
Unix.c_icanon
TXT

  tab 'Unix.term_', 'Enable output processing', <<-'TXT', uuid: '993DFE0C-859D-430E-8426-18BC44E5491B'
Unix.c_opost
TXT

  tab 'Unix.term_', 'Enable parity check on input', <<-'TXT', uuid: '065A4CDB-F159-4EDD-89B2-525A0103294E'
Unix.c_inpck
TXT

  tab 'Unix.term_', 'Enable parity generation and detection', <<-'TXT', uuid: '090978A4-CC49-445C-8E27-E27DED9FB666'
Unix.c_parenb
TXT

  tab 'Unix.term_', 'End-of-file character (usually ctrl-D)', <<-'TXT', uuid: '38F9958B-59C4-47FA-A018-AB025788FEE6'
Unix.c_veof
TXT

  tab 'Unix.term_', 'End-of-line character (usually none)', <<-'TXT', uuid: '64338DF0-4791-44BC-A12B-53C2EDB0ED2B'
Unix.c_veol
TXT

  tab 'Unix.term_', 'Erase character (usually DEL or ctrl-H) ', <<-'TXT', uuid: '623E602B-6451-4C39-934C-A24EB1EAD3A9'
Unix.c_verase
TXT

  tab 'Unix.term_', 'Generate signal on INTR, QUIT, SUSP.', <<-'TXT', uuid: '8387CB4D-3513-48FB-83ED-B3F32DB1ED48', file: 'Generate signal on INTR, QUIT, SUSP_'
Unix.c_isig
TXT

  tab 'Unix.term_', 'Hang up on last close', <<-'TXT', uuid: 'F05D40C7-A6C9-48B1-B86E-7362F873B342'
Unix.c_hupcl
TXT

  tab 'Unix.term_', 'Ignore break condition', <<-'TXT', uuid: '50DB1218-13B7-407E-AEEB-E7A4A57D2EFB'
Unix.c_ignbrk
TXT

  tab 'Unix.term_', 'Ignore characters with parity errors', <<-'TXT', uuid: '30501345-B341-4260-88ED-534A457405D8'
Unix.c_ignpar
TXT

  tab 'Unix.term_', 'Ignore CR on input', <<-'TXT', uuid: '964B1490-FA62-4D82-A30A-DB317904233F'
Unix.c_igncr
TXT

  tab 'Unix.term_', 'Ignore modem status lines', <<-'TXT', uuid: 'EBD58598-53D0-4995-870F-305F5FF68ADA'
Unix.c_clocal
TXT

  tab 'Unix.term_', 'Input baud rate', <<-'TXT', uuid: '3E5CF35F-EB7A-4D86-B068-3A865311BF39'
Unix.c_ibaud
TXT

  tab 'Unix.term_', 'Interrupt character (usually ctrl-C)', <<-'TXT', uuid: '46F87A90-F0F4-4194-AE3E-0E860194B07F'
Unix.c_vintr
TXT

  tab 'Unix.term_', 'Kill character (usually ctrl-U)', <<-'TXT', uuid: 'F4870C5A-EB67-48D6-A26C-B7C62D54DFD3'
Unix.c_vkill
TXT

  tab 'Unix.term_', 'Map CR to NL on input', <<-'TXT', uuid: 'AEA08B90-1917-46BC-BDD0-99AA2DB5C47F'
Unix.c_icrnl
TXT

  tab 'Unix.term_', 'Map NL to CR on input', <<-'TXT', uuid: '0347D8D5-B272-4DE1-83A4-BA1E8ACCAABB'
Unix.c_inlcr
TXT

  tab 'Unix.term_', 'Mark parity errors', <<-'TXT', uuid: '294ACFCE-85AF-45E6-8C09-0566FD61A3EC'
Unix.c_parmrk
TXT

  tab 'Unix.term_', 'Maximum read wait (in 0.1s units)', <<-'TXT', uuid: '361B4C8E-E537-479F-92C8-406176D98821', file: 'Maximum read wait (in 0_1s units)'
Unix.c_vtime
TXT

  tab 'Unix.term_', 'Min chars to read before read request is satisfied', <<-'TXT', uuid: '74A45F51-154D-4148-9A9C-BB04738E55C2'
Unix.c_vmin
TXT

  tab 'Unix.term_', 'Number of bits per character (5-8)', <<-'TXT', uuid: '03F80394-8232-40EB-9D69-E7E5F039E021'
Unix.c_csize
TXT

  tab 'Unix.term_', 'Number of stop bits', <<-'TXT', uuid: 'C4E7E120-BA4D-4474-BFED-6026B92E5CA3'
Unix.c_cstopb
TXT

  tab 'Unix.term_', 'Output baud rate (0 means close connection)', <<-'TXT', uuid: 'C70AC196-AD0E-4442-80BB-EB7BAB664D3C'
Unix.c_obaud
TXT

  tab 'Unix.term_', 'Quit character (usually ctrl-\)', <<-'TXT', uuid: '54FD52FB-B95D-46A1-9950-19C4591FBE53'
Unix.c_vquit
TXT

  tab 'Unix.term_', 'Reception is enabled', <<-'TXT', uuid: '0AE52244-B254-4379-871E-47A4978A8170'
Unix.c_cread
TXT

  tab 'Unix.term_', 'Recognize XON/XOFF characters on input', <<-'TXT', uuid: 'EE0DC243-D42A-4423-B554-DE7FB4B7A5F8', file: 'Recognize XON˸XOFF characters on input'
Unix.c_ixon

TXT

  tab 'Unix.term_', 'Signal interrupt on break', <<-'TXT', uuid: 'B4E23C6F-3588-42B6-8A1E-FCE5C6961B3B'
Unix.c_brkint
TXT

  tab 'Unix.term_', 'Specify odd parity instead of even', <<-'TXT', uuid: '9399A958-A8F9-4CFE-B5F0-D57F37377A0C'
Unix.c_parodd
TXT

  tab 'Unix.term_', 'Start character (usually ctrl-Q)', <<-'TXT', uuid: '8C87E677-A540-4F33-A739-09423EE11A7F'
Unix.c_vstart
TXT

  tab 'Unix.term_', 'Stop character (usually ctrl-S)', <<-'TXT', uuid: '880C2C63-864C-4B25-88CA-22F2EDE9B515'
Unix.c_vstop
TXT

  tab 'Unix.term_', 'Strip 8th bit on input characters', <<-'TXT', uuid: 'FA7D23CB-B971-48C6-A1BD-ED5F34161DA6'
Unix.c_istrip
TXT

  tab 'Unix.time', 'alarm', <<-'TXT', uuid: 'FFAF7A98-1A92-4B00-A54C-E3914E89CAA0'
Unix.alarm ${1:delay}$0
TXT

  tab 'Unix.time', 'getitimer', <<-'TXT', uuid: 'EE11042E-A091-4C3B-9CD4-8FCA940E1BB6'
Unix.getitimer Unix.ITIMER_$0
TXT

  tab 'Unix.time', 'gettimeofday', <<-'TXT', uuid: 'A723C737-8B0E-499F-A078-55AC8E65CCC1'
Unix.gettimeofday ()
TXT

  tab 'Unix.time', 'gmtime', <<-'TXT', uuid: '4EA8D402-C6CB-441C-9666-EBECA3749FB8'
Unix.gmtime ${1:time_float}$0
TXT

  tab 'Unix.time', 'localtime', <<-'TXT', uuid: '91D4E914-3443-49B1-A164-60FC05FED961'
Unix.localtime ${1:time_float}$0
TXT

  tab 'Unix.time', 'mktime', <<-'TXT', uuid: '1C5A26DF-C277-4B4E-921B-422ED69941D9'
Unix.mktime Unix.tm$0
TXT

  tab 'Unix.time', 'setitimer', <<-'TXT', uuid: '72DC7584-31C5-46C7-9EAE-CFA9446CABC7'
Unix.setitimer Unix.ITIMER_$0 Unix.it_
TXT

  tab 'Unix.time', 'sleep', <<-'TXT', uuid: 'FBDE5CFA-5A4F-44AF-9B07-B803D42B1770'
Unix.sleep ${1:delay}$0
TXT

  tab 'Unix.time', 'time', <<-'TXT', uuid: 'E4FBF23D-81FD-4DC2-96D6-54349B76B101'
Unix.time ()
TXT

  tab 'Unix.time', 'times', <<-'TXT', uuid: '6646DE82-9B89-44F8-83B7-80116FBB2D6C'
Unix.times ()
TXT

  tab 'Unix.time', 'utimes', <<-'TXT', uuid: '854473B4-DAA6-46C0-B524-D88B044768D2'
Unix.utimes ${1:file_name} ${2:last_access_time} ${3:last_modified_time}${4:;}$0
TXT

  tab 'Unix.tm', 'Day of month (1..31)', <<-'TXT', uuid: '36948080-E992-477B-B460-D013C05E93BC', file: 'Day of month (1__31)'
Unix.tm_mday
TXT

  tab 'Unix.tm', 'Day of week (Sunday is 0)', <<-'TXT', uuid: 'C4377EB5-BAA8-41CF-AF5F-DA4E34211A1E'
Unix.tm_wday
TXT

  tab 'Unix.tm', 'Day of year (0..365)', <<-'TXT', uuid: '5A8E10E1-F433-4BAD-BE71-74695161385B', file: 'Day of year (0__365)'
Unix.tm_yday
TXT

  tab 'Unix.tm', 'Daylight savings time is in effect', <<-'TXT', uuid: 'FF099831-D594-4377-BC9A-48C026128C9F'
Unix.tm_isdt
TXT

  tab 'Unix.tm', 'Hours (0..23)', <<-'TXT', uuid: 'BEFCCF62-5BAF-4332-A055-9D1B886E2452', file: 'Hours (0__23)'
Unix.tm_hour
TXT

  tab 'Unix.tm', 'Minutes (0..59)', <<-'TXT', uuid: '7EE76969-FE47-4D41-B9DD-8F97373C7BF0', file: 'Minutes (0__59)'
Unix.tm_min
TXT

  tab 'Unix.tm', 'Month of year (0..11)', <<-'TXT', uuid: '5A302B1F-6E01-4122-BDE7-84926F4DF15C', file: 'Month of year (0__11)'
Unix.tm_mon
TXT

  tab 'Unix.tm', 'Seconds (0..60)', <<-'TXT', uuid: '786375BC-FE2C-4FAB-B4F8-F488D8B81D99', file: 'Seconds (0__60)'
Unix.tm_sec
TXT

  tab 'Unix.tm', 'Unix tm record', <<-'TXT', uuid: '9700FB51-970E-414D-A49C-5ED4485621F2'
{ Unix.tm_sec  = ${1:secs}
; Unix.tm_min  = ${2:mins}
; Unix.tm_hour = ${3:hour}
; Unix.tm_mday = ${4:day of month}
; Unix.tm_mon  = ${5:month}
; Unix.tm_year = ${6:year}
; Unix.tm_wday = ${7:day of week}
; Unix.tm_yday = ${8:day of year}
; Unix.tm_isdt = ${9:true}
}$0
TXT

  tab 'Unix.tm', 'Year-1900', <<-'TXT', uuid: '2225AE2C-52AB-4582-A8BC-2B0AEDCA69DE'
Unix.tm_year
TXT

  tab 'Unix.tms', 'System time for child processes', <<-'TXT', uuid: 'D9BD2CDB-8599-4107-8198-5F5D2CBC2F25'
Unix.tms_cstime
TXT

  tab 'Unix.tms', 'System time for process', <<-'TXT', uuid: '0EC60F78-6F65-4B8E-9B0F-F51357726B38'
Unix.tms_stime
TXT

  tab 'Unix.tms', 'User time for child processes', <<-'TXT', uuid: '5471E53B-1A8D-40BA-BFD1-191228E704DB'
Unix.tms_cutime
TXT

  tab 'Unix.tms', 'User time for process', <<-'TXT', uuid: '1CDFF4BC-B507-4E58-A181-52D55D3D28FD'
Unix.tms_utime
TXT

end