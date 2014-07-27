# encoding: utf-8

snippets do

  default_scope 'source.ocaml'
  file_format :textmate

  tab 'Arg.', 'Arg.align', <<-'TXT', uuid: '7973A90B-7530-11D9-87B3-000A95AFE286'
Arg.align ${1:speclist}$0
TXT

  tab 'Arg.', 'Arg.Bad', <<-'TXT', uuid: 'CCEA7817-C34B-4A0F-97CD-3C3C85731096', file: 'Arg_Bad'
Arg.Bad ${1:"${2:str}"}$0
TXT

  tab 'Arg.', 'Arg.Help', <<-'TXT', uuid: '29625672-A6D2-4733-88EA-DDF3939F30C4', file: 'Arg_Help'
Arg.Help ${1:"${2:str}"}$0
TXT

  tab 'Arg.', 'Arg.parse_argv', <<-'TXT', uuid: '21406DD8-7530-11D9-87B3-000A95AFE286'
Arg.parse_argv ${1:~current:${2:Arg.current}} ${3:args_array} ${4:speclist} ${5:anon_fun} ${6:usage_msg}$0
TXT

  tab 'Arg.', 'Arg.usage', <<-'TXT', uuid: '565C967E-7530-11D9-87B3-000A95AFE286'
Arg.usage ${1:speclist} ${2:usage_msg}$0
TXT

  tab 'Arg.spec', 'Arg.Bool', <<-'TXT', uuid: '079B0191-4B4B-42ED-AB40-9667DA468792', file: 'Arg_Bool'
Arg.Bool ${1:(fun ${2:b} -> ${3:})}$0
TXT

  tab 'Arg.spec', 'Arg.Clear', <<-'TXT', uuid: '669FE87F-D65C-4A74-AC10-F2126BADF752', file: 'Arg_Clear'
Arg.Clear ${1:bref}$0
TXT

  tab 'Arg.spec', 'Arg.current', <<-'TXT', uuid: 'B20CC9E6-7E26-4578-9D50-26E8AFB55A79', file: 'Arg_current'
Arg.current
TXT

  tab 'Arg.spec', 'Arg.Float', <<-'TXT', uuid: '562770E2-0A81-4FA0-8EBA-812991B8768F', file: 'Arg_Float'
Arg.Float ${1:(fun ${2:f} -> ${3:})}$0
TXT

  tab 'Arg.spec', 'Arg.Int', <<-'TXT', uuid: 'F7F4AA6E-9334-4BDE-B6A6-0A5271660634', file: 'Arg_Int'
Arg.Int ${1:(fun ${2:i} -> ${3:})}$0
TXT

  tab 'Arg.spec', 'Arg.Rest', <<-'TXT', uuid: 'BEDD503D-5D8E-4244-A8F0-CFB832B15DB2', file: 'Arg_Rest'
Arg.Rest ${1:arg_fun})}$0
TXT

  tab 'Arg.spec', 'Arg.Set', <<-'TXT', uuid: '07F3A424-4D42-4371-BBAD-51B333A7E804', file: 'Arg_Set'
Arg.Set ${1:bref}$0
TXT

  tab 'Arg.spec', 'Arg.Set_float', <<-'TXT', uuid: 'BB69C869-DEBB-4FA0-A96C-AE67525B5B68', file: 'Arg_Set_float'
Arg.Set_float ${1:fref}$0
TXT

  tab 'Arg.spec', 'Arg.Set_int', <<-'TXT', uuid: '5C007071-F14E-4023-AF5A-6F5E856A2C36', file: 'Arg_Set_int'
Arg.Set_int ${1:iref}$0
TXT

  tab 'Arg.spec', 'Arg.Set_string', <<-'TXT', uuid: '4A61F684-B2B6-47E2-8287-3E5E143B4DBF', file: 'Arg_Set_string'
Arg.Set_string ${1:sref}$0
TXT

  tab 'Arg.spec', 'Arg.String', <<-'TXT', uuid: 'F1E2E419-3CCE-411E-B19C-D1462C2E29B7', file: 'Arg_String'
Arg.String ${1:(fun ${2:s} -> ${3:})}$0
TXT

  tab 'Arg.spec', 'Arg.Symbol', <<-'TXT', uuid: '784D6712-5E39-4B13-95EF-19C10721DB5B', file: 'Arg_Symbol'
Arg.Symbol ${1:(${2:[${3:"${4:symb}"}]},${5:symb_fun})}$0
TXT

  tab 'Arg.spec', 'Arg.Tuple', <<-'TXT', uuid: '9FB4857C-BDD1-44AA-878C-D915723190AB', file: 'Arg_Tuple'
Arg.Tuple ${1:[Arg.spec$0]}
TXT

  tab 'Arg.spec', 'Arg.Unit', <<-'TXT', uuid: '00335CD8-3255-4DE0-B54C-3713EA359358', file: 'Arg_Unit'
Arg.Unit ${1:(fun () -> ${2:})}$0
TXT

  tab 'Array.', 'Array.append', <<-'TXT', uuid: 'B0E48D26-7531-11D9-87B3-000A95AFE286'
Array.append ${1:v1} ${2:v2}$0
TXT

  tab 'Array.', 'Array.blit', <<-'TXT', uuid: 'BB1628CC-7532-11D9-87B3-000A95AFE286'
Array.blit ${1:src} ${2:srcofs} ${3:dest} ${4:destofs} ${5:len}$0
TXT

  tab 'Array.', 'Array.concat', <<-'TXT', uuid: 'CF298BD2-7531-11D9-87B3-000A95AFE286'
Array.concat ${1:[${2:arr_list}]}$0
TXT

  tab 'Array.', 'Array.copy', <<-'TXT', uuid: '0C216E22-7532-11D9-87B3-000A95AFE286'
Array.copy ${1:arr}$0
TXT

  tab 'Array.', 'Array.create', <<-'TXT', uuid: '2A5A68EE-7531-11D9-87B3-000A95AFE286'
Array.create ${1:length} ${2:value}$0
TXT

  tab 'Array.', 'Array.create_matrix', <<-'TXT', uuid: '9C01E87E-7531-11D9-87B3-000A95AFE286'
Array.create_matrix ${1:dimx} ${2:dimy} ${3:value}$0
TXT

  tab 'Array.', 'Array.fast_sort', <<-'TXT', uuid: 'E131A14E-7533-11D9-87B3-000A95AFE286'
Array.sort ${1:compare} ${2:arr}$0
TXT

  tab 'Array.', 'Array.fill', <<-'TXT', uuid: '1ED9ECDF-7532-11D9-87B3-000A95AFE286'
Array.fill ${1:arr} ${2:ofs} ${3:len} ${4:value} $0
TXT

  tab 'Array.', 'Array.fold_left', <<-'TXT', uuid: '774DA006-7533-11D9-87B3-000A95AFE286'
Array.fold_left ${1:(fun ${2:b} ${3:v} -> ${4:})} ${5:base} ${6:arr} $0
TXT

  tab 'Array.', 'Array.fold_right', <<-'TXT', uuid: '9C1FC79E-7533-11D9-87B3-000A95AFE286'
Array.fold_right ${1:(fun ${2:v} ${3:b} -> ${4:})} ${5:arr} ${6:base} $0
TXT

  tab 'Array.', 'Array.get', <<-'TXT', uuid: 'CD3A1BDB-7530-11D9-87B3-000A95AFE286'
Array.get ${1:arr} ${2:pos} $0
TXT

  tab 'Array.', 'Array.init', <<-'TXT', uuid: '42752ABC-7531-11D9-87B3-000A95AFE286'
Array.init ${1:length} ${2:(fun ${3:i} -> ${4:})} $0
TXT

  tab 'Array.', 'Array.iter', <<-'TXT', uuid: '0DC3E50E-7533-11D9-87B3-000A95AFE286'
Array.iter ${1:(fun ${2:a} -> ${3:})} ${4:arr} $0
TXT

  tab 'Array.', 'Array.iteri', <<-'TXT', uuid: '357D9234-7533-11D9-87B3-000A95AFE286'
Array.iteri ${1:(fun ${2:i} ${3:a} -> ${4:})} ${5:arr} $0
TXT

  tab 'Array.', 'Array.length', <<-'TXT', uuid: 'B3EBF138-7530-11D9-87B3-000A95AFE286'
Array.length ${1:arr} $0
TXT

  tab 'Array.', 'Array.make', <<-'TXT', uuid: '0B65AEE9-7531-11D9-87B3-000A95AFE286'
Array.make ${1:length} ${2:value} $0
TXT

  tab 'Array.', 'Array.make_matrix', <<-'TXT', uuid: '6F3F25E6-7531-11D9-87B3-000A95AFE286'
Array.make_matrix ${1:dimx} ${2:dimy} ${3:value} $0
TXT

  tab 'Array.', 'Array.map', <<-'TXT', uuid: '254716A4-7533-11D9-87B3-000A95AFE286'
Array.map ${1:(fun ${2:a} -> ${3:})} ${4:arr} $0
TXT

  tab 'Array.', 'Array.mapi', <<-'TXT', uuid: '65BDBB56-7533-11D9-87B3-000A95AFE286'
Array.mapi ${1:(fun ${2:i} ${3:a} -> ${4:})} ${5:arr} $0
TXT

  tab 'Array.', 'Array.of_list', <<-'TXT', uuid: 'F947C37E-7532-11D9-87B3-000A95AFE286'
Array.of_list ${1:lst} $0
TXT

  tab 'Array.', 'Array.set', <<-'TXT', uuid: 'EDFC5FE3-7530-11D9-87B3-000A95AFE286'
Array.set ${1:arr} ${2:pos} ${3:value} $0
TXT

  tab 'Array.', 'Array.sort', <<-'TXT', uuid: 'BA3B6020-7533-11D9-87B3-000A95AFE286'
Array.sort ${1:compare} ${2:arr} $0
TXT

  tab 'Array.', 'Array.stable_sort', <<-'TXT', uuid: 'D19B2F23-7533-11D9-87B3-000A95AFE286'
Array.sort ${1:compare} ${2:arr} $0
TXT

  tab 'Array.', 'Array.sub', <<-'TXT', uuid: 'E2B1A666-7531-11D9-87B3-000A95AFE286'
Array.sub ${1:arr} ${2:start} ${3:len} $0
TXT

  tab 'Array.', 'Array.to_list', <<-'TXT', uuid: 'E83BC6FA-7532-11D9-87B3-000A95AFE286'
Array.to_list ${1:arr} $0
TXT

  tab 'bos', 'bool_of_string', <<-'TXT', uuid: '71B93CA9-4584-4704-8819-B0FCF7ACFFA6'
bool_of_string ${1:s}$0
TXT

  tab 'Buffer.', 'Buffer.add_buffer', <<-'TXT', uuid: '2C4C0E46-7535-11D9-AF11-000A95AFE286'
Buffer.add_buffer ${1:buf1} ${2:buf2} $0
TXT

  tab 'Buffer.', 'Buffer.add_channel', <<-'TXT', uuid: '57205528-7535-11D9-AF11-000A95AFE286'
Buffer.add_channel ${1:buf} ${2:ic} ${3:len} $0
TXT

  tab 'Buffer.', 'Buffer.add_char', <<-'TXT', uuid: 'B15356B6-7534-11D9-AF11-000A95AFE286'
Buffer.add_char ${1:buf} ${2:ch} $0
TXT

  tab 'Buffer.', 'Buffer.add_string', <<-'TXT', uuid: 'CAD99FF0-7534-11D9-AF11-000A95AFE286'
Buffer.add_string ${1:buf} ${2:str} $0
TXT

  tab 'Buffer.', 'Buffer.add_substitute', <<-'TXT', uuid: '099B6F94-7535-11D9-AF11-000A95AFE286'
Buffer.add_substitute ${1:buf} ${2:fun} ${3:str} $0
TXT

  tab 'Buffer.', 'Buffer.add_substring', <<-'TXT', uuid: 'DB77BD9C-7534-11D9-AF11-000A95AFE286'
Buffer.add_substring ${1:buf} ${2:str} ${3:ofs} ${4:len} $0
TXT

  tab 'Buffer.', 'Buffer.clear', <<-'TXT', uuid: '8F402C84-7534-11D9-AF11-000A95AFE286'
Buffer.clear ${1:buf} $0
TXT

  tab 'Buffer.', 'Buffer.contents', <<-'TXT', uuid: '3266C30A-7534-11D9-AF11-000A95AFE286'
Buffer.contents ${1:buf} $0
TXT

  tab 'Buffer.', 'Buffer.create', <<-'TXT', uuid: '20690D50-7534-11D9-AF11-000A95AFE286'
Buffer.create ${1:len} $0
TXT

  tab 'Buffer.', 'Buffer.length', <<-'TXT', uuid: '7FDA9906-7534-11D9-AF11-000A95AFE286'
Buffer.length ${1:buf} $0
TXT

  tab 'Buffer.', 'Buffer.nth', <<-'TXT', uuid: '692E2D97-7534-11D9-AF11-000A95AFE286'
Buffer.nth ${1:buf} ${2:n} $0
TXT

  tab 'Buffer.', 'Buffer.output_buffer', <<-'TXT', uuid: '73A08682-7535-11D9-AF11-000A95AFE286'
Buffer.output_buffer ${1:oc} ${2:buf} $0
TXT

  tab 'Buffer.', 'Buffer.reset', <<-'TXT', uuid: '9DACDA50-7534-11D9-AF11-000A95AFE286'
Buffer.reset ${1:buf} $0
TXT

  tab 'Buffer.', 'Buffer.sub', <<-'TXT', uuid: '4924437A-7534-11D9-AF11-000A95AFE286'
Buffer.sub ${1:buf} ${2:ofs} ${3:len}  $0
TXT

  tab 'Callback.', 'Callback.register', <<-'TXT', uuid: '8A8C4DC8-7535-11D9-AF11-000A95AFE286'
Callback.register ${1:name} ${2:value} $0
TXT

  tab 'Callback.', 'Callback.register_exception', <<-'TXT', uuid: 'AE741C91-7535-11D9-AF11-000A95AFE286'
Callback.register_exception ${1:name} ${2:exn} $0
TXT

  tab 'Char.', 'Char.chr', <<-'TXT', uuid: 'D701137B-7535-11D9-AF11-000A95AFE286'
Char.chr ${1:n} $0
TXT

  tab 'Char.', 'Char.code', <<-'TXT', uuid: 'C6F566FA-7535-11D9-AF11-000A95AFE286'
Char.code ${1:ch} $0
TXT

  tab 'Char.', 'Char.compare', <<-'TXT', uuid: '11670508-7536-11D9-AF11-000A95AFE286'
Char.compare ${1:${2:ch1} ${3:ch2}} $0
TXT

  tab 'Char.', 'Char.escaped', <<-'TXT', uuid: 'E76E6436-7535-11D9-AF11-000A95AFE286'
Char.escaped ${1:ch} $0
TXT

  tab 'Char.', 'Char.lowercase', <<-'TXT', uuid: 'F7508638-7535-11D9-AF11-000A95AFE286'
Char.lowercase ${1:ch} $0
TXT

  tab 'Char.', 'Char.uppercase', <<-'TXT', uuid: '041B9021-7536-11D9-AF11-000A95AFE286'
Char.uppercase ${1:ch} $0
TXT

  tab 'coi', 'char_of_int', <<-'TXT', uuid: '6F066877-A78A-4A63-B841-932CBCA47647'
char_of_int ${1:i}$0
TXT

  tab 'Complex.', 'Complex.add', <<-'TXT', uuid: '6E3E0F35-7536-11D9-AF11-000A95AFE286'
Complex.add ${1:c1} ${2:c2} $0
TXT

  tab 'Complex.', 'Complex.arg', <<-'TXT', uuid: 'EA829DC2-7536-11D9-AF11-000A95AFE286'
Complex.arg ${1:c} $0
TXT

  tab 'Complex.', 'Complex.conj', <<-'TXT', uuid: '5ED5F93C-7536-11D9-AF11-000A95AFE286'
Complex.conj ${1:c} $0
TXT

  tab 'Complex.', 'Complex.div', <<-'TXT', uuid: 'B1D445E8-7536-11D9-AF11-000A95AFE286'
Complex.div ${1:c1} ${2:c2} $0
TXT

  tab 'Complex.', 'Complex.exp', <<-'TXT', uuid: '0F934813-7537-11D9-AF11-000A95AFE286'
Complex.exp ${1:c} $0
TXT

  tab 'Complex.', 'Complex.inv', <<-'TXT', uuid: '7CEA1FDA-7536-11D9-AF11-000A95AFE286'
Complex.inv ${1:c} $0
TXT

  tab 'Complex.', 'Complex.log', <<-'TXT', uuid: '1E073140-7537-11D9-AF11-000A95AFE286'
Complex.log ${1:c} $0
TXT

  tab 'Complex.', 'Complex.mul', <<-'TXT', uuid: '8F14E72D-7536-11D9-AF11-000A95AFE286'
Complex.mul ${1:c1} ${2:c2} $0
TXT

  tab 'Complex.', 'Complex.neg', <<-'TXT', uuid: '4CEBC8C0-7536-11D9-AF11-000A95AFE286'
Complex.neg ${1:c} $0
TXT

  tab 'Complex.', 'Complex.norm', <<-'TXT', uuid: 'E3446126-7536-11D9-AF11-000A95AFE286'
Complex.norm ${1:c} $0
TXT

  tab 'Complex.', 'Complex.norm2', <<-'TXT', uuid: 'D8B0E44B-7536-11D9-AF11-000A95AFE286'
Complex.norm2 ${1:c} $0
TXT

  tab 'Complex.', 'Complex.one', <<-'TXT', uuid: '390AB0CC-7536-11D9-AF11-000A95AFE286'
Complex.one $0
TXT

  tab 'Complex.', 'Complex.polar', <<-'TXT', uuid: 'FBA4BAE0-7536-11D9-AF11-000A95AFE286'
Complex.polar ${1:norm} ${2:arg} $0
TXT

  tab 'Complex.', 'Complex.pow', <<-'TXT', uuid: '28BE18F9-7537-11D9-AF11-000A95AFE286'
Complex.pow ${1:c1} ${2:c2} $0
TXT

  tab 'Complex.', 'Complex.sqrt', <<-'TXT', uuid: 'C4583FE6-7536-11D9-AF11-000A95AFE286'
Complex.sqrt ${1:c} $0
TXT

  tab 'Complex.', 'Complex.sub', <<-'TXT', uuid: '8E519B53-7536-11D9-AF11-000A95AFE286'
Complex.sub ${1:c1} ${2:c2} $0
TXT

  tab 'Digest.', 'Digest.channel', <<-'TXT', uuid: '67DDC1DB-7537-11D9-AF11-000A95AFE286'
Digest.channel ${1:ic} ${2:len} $0
TXT

  tab 'Digest.', 'Digest.file', <<-'TXT', uuid: '7C242EB0-7537-11D9-AF11-000A95AFE286'
Digest.file ${1:"${2:fname}"} $0
TXT

  tab 'Digest.', 'Digest.input', <<-'TXT', uuid: 'ABDF6996-7537-11D9-AF11-000A95AFE286'
Digest.input ${1:ic} $0
TXT

  tab 'Digest.', 'Digest.output', <<-'TXT', uuid: '9065B1E6-7537-11D9-AF11-000A95AFE286'
Digest.output ${1:oc} ${2:dig} $0
TXT

  tab 'Digest.', 'Digest.string', <<-'TXT', uuid: '3B27459A-7537-11D9-AF11-000A95AFE286'
Digest.string ${1:str} $0
TXT

  tab 'Digest.', 'Digest.substring', <<-'TXT', uuid: '4FF52778-7537-11D9-AF11-000A95AFE286'
Digest.substring ${1:str} ${2:ofs} ${3:len} $0
TXT

  tab 'Digest.', 'Digest.to_hex', <<-'TXT', uuid: 'B8F8AE89-7537-11D9-AF11-000A95AFE286'
Digest.to_hex ${1:dig} $0
TXT

  tab 'err', 'stderr', "stderr ", uuid: '25A795A8-FCF5-447F-B3FC-D35EC7A297A8'

  tab 'exn', 'exception Assert_failure', <<-'TXT', uuid: '718C8225-0EB5-4872-B474-2E3CB771AAF0'
Assert_failure ${1:(${2:file_name},${3:line_no},${4:col_no})}$0
TXT

  tab 'exn', 'exception Division_by_zero', <<-'TXT', uuid: '92EE00B8-C616-4EBF-BE24-3FB9298B32FC'
Division_by_zero
TXT

  tab 'exn', 'exception End_of_file', <<-'TXT', uuid: 'EE83C662-C95B-41B2-952A-F4F8AE6DC2B1'
End_of_file
TXT

  tab 'exn', 'exception Exit', <<-'TXT', uuid: '128A9EFE-27CA-4F79-BE89-7E50BB4E99D9'
Exit
TXT

  tab 'exn', 'exception Failure', <<-'TXT', uuid: 'CECB72B0-905C-46B9-A7E4-5DDA6DACF6A3'
Failure ${1:"${2:str}"}$0
TXT

  tab 'exn', 'exception Invalid_argument', <<-'TXT', uuid: '944E98B7-DB23-4D8B-BEBF-D6DBD38EB0F1'
Invalid_argument ${1:"${2:str}"}$0
TXT

  tab 'exn', 'exception Match_failure', <<-'TXT', uuid: '3649C0E6-E0E9-41BF-A19A-C50345EE4BE6'
Match_failure ${1:(${2:file_name},${3:line_no},${4:col_no})}$0
TXT

  tab 'exn', 'exception Not_found', <<-'TXT', uuid: 'EB04852F-796F-4177-A238-B53AC4BE8B71'
Not_found
TXT

  tab 'exn', 'exception Out_of_memory', <<-'TXT', uuid: '1C539C22-333E-4C15-A9C6-C0CE1524DBB7'
Out_of_memory
TXT

  tab 'exn', 'exception Stack_overflow', <<-'TXT', uuid: '086EC3ED-BAF9-48ED-A45B-3990090A9A17'
Stack_overflow
TXT

  tab 'exn', 'exception Sys_blocked_io', <<-'TXT', uuid: 'DDF3F118-7EE9-452F-90AA-CE7A6E3C62DD'
Sys_blocked_io
TXT

  tab 'exn', 'exception Sys_error', <<-'TXT', uuid: '0910E930-D521-45CF-B5C6-CAE08A629CDA'
Sys_error ${1:"${2:str}"}$0
TXT

  tab 'exn', 'exception Undefined_recursive_module', <<-'TXT', uuid: '2F07863C-8060-4C3A-92E6-520D928B02A2'
Undefined_recursive_module ${1:(${2:file_name},${3:line_no},${4:col_no})}$0
TXT

  tab 'Filename.', 'Filename.basename', <<-'TXT', uuid: 'A6E4020C-7538-11D9-81F4-000A95AFE286'
Filename.basename ${1:fname} $0
TXT

  tab 'Filename.', 'Filename.check_suffix', <<-'TXT', uuid: '5A3ACAC6-7538-11D9-81F4-000A95AFE286'
Filename.check_suffix ${1:fname} ${2:suff} $0
TXT

  tab 'Filename.', 'Filename.chop_extension', <<-'TXT', uuid: '8EF40F59-7538-11D9-81F4-000A95AFE286'
Filename.chop_extension ${1:fname} $0
TXT

  tab 'Filename.', 'Filename.chop_suffix', <<-'TXT', uuid: '78418DC7-7538-11D9-81F4-000A95AFE286'
Filename.chop_suffix ${1:fname} ${2:suff} $0
TXT

  tab 'Filename.', 'Filename.concat', <<-'TXT', uuid: 'FF3130FA-7537-11D9-81F4-000A95AFE286'
Filename.concat ${1:dir} ${2:file} $0
TXT

  tab 'Filename.', 'Filename.current_dir_name', <<-'TXT', uuid: '88AEA7D2-8FAF-4D36-839C-89145AD99308', file: 'Filename_basename'
Filename.current_dir_name
TXT

  tab 'Filename.', 'Filename.dirname', <<-'TXT', uuid: 'BCCAB031-7538-11D9-81F4-000A95AFE286'
Filename.dirname ${1:fname} $0
TXT

  tab 'Filename.', 'Filename.is_implicit', <<-'TXT', uuid: '444B8F64-7538-11D9-81F4-000A95AFE286'
Filename.is_implicit ${1:fname} $0
TXT

  tab 'Filename.', 'Filename.is_relative', <<-'TXT', uuid: '30E5CAC2-7538-11D9-81F4-000A95AFE286'
Filename.is_relative ${1:fname} $0
TXT

  tab 'Filename.', 'Filename.open_temp_file', <<-'TXT', uuid: 'FC0ED678-7538-11D9-81F4-000A95AFE286'
Filename.open_temp_file ${5:~mode:${6:[Open_$0]}} ${1:"${2:prefix}"} ${3:"${4:suffix}"}
TXT

  tab 'Filename.', 'Filename.parent_dir_name', <<-'TXT', uuid: '48461527-E906-45CB-AC88-EEFF4AF1D70C', file: 'Filename_parent_dir_name'
Filename.parent_dir_name
TXT

  tab 'Filename.', 'Filename.quote', <<-'TXT', uuid: '203D9E2F-7539-11D9-81F4-000A95AFE286'
Filename.quote ${1:fname} $0
TXT

  tab 'Filename.', 'Filename.temp_file', <<-'TXT', uuid: 'CC785E58-7538-11D9-81F4-000A95AFE286'
Filename.temp_file ${1:"${2:prefix}"} ${3:"${4:suffix}"} $0
TXT

  tab 'flush', 'flush', <<-'TXT', uuid: 'FED9AEB2-E68C-449A-B399-FCE28A15CF27'
flush ${1:out_channel}${2:;}$0
TXT

  tab 'flush_all', 'flush_all', <<-'TXT', uuid: '25982C7E-BCFB-4D81-B695-BA9F42776660'
flush_all ()${1:;}$0
TXT

  tab 'fmos', 'format_of_string copy', <<-'TXT', uuid: 'E469F8CD-F7F5-4141-9B10-52B6BFB1DF06'
format_of_string ${1:"${2:s}"}$0
TXT

  tab 'foi', 'float_of_int', <<-'TXT', uuid: '72177E98-F7D5-424F-B48E-4848D55A6EA8'
float_of_int ${1:i}$0
TXT

  tab 'Format.', 'Format.bprintf', <<-'TXT', uuid: '0BC923B6-7551-11D9-A353-000A95AFE286'
Format.bprintf ${1:buf} ${2:"${3:format}"} $0
TXT

  tab 'Format.', 'Format.eprintf', <<-'TXT', uuid: 'F2688C8B-7550-11D9-A353-000A95AFE286'
Format.eprintf ${1:"${2:format}"} $0
TXT

  tab 'Format.', 'Format.formatter_of_buffer', <<-'TXT', uuid: 'A7969D9C-753C-11D9-81F4-000A95AFE286'
Format.formatter_of_buffer ${1:buf} $0
TXT

  tab 'Format.', 'Format.formatter_of_out_channel', <<-'TXT', uuid: '78DE2A96-753C-11D9-81F4-000A95AFE286'
Format.formatter_of_out_channel ${1:oc} $0
TXT

  tab 'Format.', 'Format.fprintf', <<-'TXT', uuid: 'BA16F711-7550-11D9-A353-000A95AFE286'
Format.fprintf ${1:fmtr} ${2:"${3:format}"} $0
TXT

  tab 'Format.', 'Format.get_all_formatter_output_functions', <<-'TXT', uuid: '67929519-753C-11D9-81F4-000A95AFE286'
Format.get_all_formatter_output_functions ()
TXT

  tab 'Format.', 'Format.get_formatter_output_functions', <<-'TXT', uuid: '01BE7B9B-753C-11D9-81F4-000A95AFE286'
Format.get_formatter_output_functions ()
TXT

  tab 'Format.', 'Format.kfprintf', <<-'TXT', uuid: '1CDEE9BA-7551-11D9-A353-000A95AFE286'
Format.kprintf ${1:ffunc} ${2:fmtr} ${3:"${4:format}"} $0
TXT

  tab 'Format.', 'Format.kprintf', <<-'TXT', uuid: '663DDC96-7551-11D9-A353-000A95AFE286'
Format.kprintf ${1:sfunc} ${2:"${3:format}"} $0
TXT

  tab 'Format.', 'Format.ksprintf', <<-'TXT', uuid: '40888AAA-7551-11D9-A353-000A95AFE286'
Format.ksprintf ${1:sfunc} ${2:"${3:format}"} $0
TXT

  tab 'Format.', 'Format.make_formatter', <<-'TXT', uuid: 'D0E3149D-753C-11D9-81F4-000A95AFE286'
Format.make_formatter ${1:out} ${2:flush} $0
TXT

  tab 'Format.', 'Format.open_box', <<-'TXT', uuid: '36AF7646-7539-11D9-81F4-000A95AFE286'
Format.open_box ${1:d} $0
TXT

  tab 'Format.', 'Format.open_hovbox', <<-'TXT', uuid: 'C095D3D4-753A-11D9-81F4-000A95AFE286'
Format.open_hovbox ${1:d} $0
TXT

  tab 'Format.', 'Format.open_hvbox', <<-'TXT', uuid: 'B5D3E6CB-753A-11D9-81F4-000A95AFE286'
Format.open_hvbox ${1:d} $0
TXT

  tab 'Format.', 'Format.open_tag', <<-'TXT', uuid: '49EC9547-753B-11D9-81F4-000A95AFE286'
Format.open_tag ${1:tag} $0
TXT

  tab 'Format.', 'Format.open_vbox', <<-'TXT', uuid: 'A5AC4D20-753A-11D9-81F4-000A95AFE286'
Format.open_vbox ${1:d} $0
TXT

  tab 'Format.', 'Format.print_as', <<-'TXT', uuid: '6F393334-7539-11D9-81F4-000A95AFE286'
Format.print_as ${1:len} ${2:"${3:str}"} $0
TXT

  tab 'Format.', 'Format.print_bool', <<-'TXT', uuid: '9AEE2490-7539-11D9-81F4-000A95AFE286'
Format.print_bool ${1:b} $0
TXT

  tab 'Format.', 'Format.print_break', <<-'TXT', uuid: 'DD66DAF0-7539-11D9-81F4-000A95AFE286'
Format.print_break ${1:nspaces} ${2:offset} $0
TXT

  tab 'Format.', 'Format.print_char', <<-'TXT', uuid: '9A82B4B6-7539-11D9-81F4-000A95AFE286'
Format.print_char ${1:'${2:ch}'} $0
TXT

  tab 'Format.', 'Format.print_float', <<-'TXT', uuid: '99D08437-7539-11D9-81F4-000A95AFE286'
Format.print_float ${1:fl} $0
TXT

  tab 'Format.', 'Format.print_int', <<-'TXT', uuid: '8699311E-7539-11D9-81F4-000A95AFE286'
Format.print_int ${1:i} $0
TXT

  tab 'Format.', 'Format.print_newline', <<-'TXT', uuid: '4A37C4D0-5243-4C8D-9975-B76DAAA305B8', file: 'Format_print_newline'
Format.print_newline ()
TXT

  tab 'Format.', 'Format.print_string', <<-'TXT', uuid: '5C59CA96-7539-11D9-81F4-000A95AFE286'
Format.print_string ${1:"${2:str}"} $0
TXT

  tab 'Format.', 'Format.print_tbreak', <<-'TXT', uuid: 'EF92BBBA-753A-11D9-81F4-000A95AFE286'
Format.print_tbreak ${1:spaces} ${2:offset} $0
TXT

  tab 'Format.', 'Format.printf', <<-'TXT', uuid: 'E4550DE2-7550-11D9-A353-000A95AFE286'
Format.printf ${2:"${3:format}"} $0
TXT

  tab 'Format.', 'Format.set_all_formatter_output_functions', <<-'TXT', uuid: '4AB1FE7B-753C-11D9-81F4-000A95AFE286'
Format.set_all_formatter_output_functions ${1:out} ${2:flush} ${3:newline} ${4:spaces} $0
TXT

  tab 'Format.', 'Format.set_ellipsis_text', <<-'TXT', uuid: '28E5FCE1-753B-11D9-81F4-000A95AFE286'
Format.set_ellipsis_text ${1:"${2:txt}"} $0
TXT

  tab 'Format.', 'Format.set_formatter_out_channel', <<-'TXT', uuid: 'C527238C-753B-11D9-81F4-000A95AFE286'
Format.set_formatter_out_channel ${1:oc} $0
TXT

  tab 'Format.', 'Format.set_formatter_output_functions', <<-'TXT', uuid: 'DDC7F39A-753B-11D9-81F4-000A95AFE286'
Format.set_formatter_output_functions ${1:out} ${2:flush} $0
TXT

  tab 'Format.', 'Format.set_formatter_tag_functions', <<-'TXT', uuid: '1C13316E-753C-11D9-81F4-000A95AFE286'
Format.set_formatter_tag_functions ${1:tagfuns} $0
TXT

  tab 'Format.', 'Format.set_margin', <<-'TXT', uuid: '25EEF182-753A-11D9-81F4-000A95AFE286'
Format.set_margin ${1:d} $0
TXT

  tab 'Format.', 'Format.set_mark_tags', <<-'TXT', uuid: '8FE02074-753B-11D9-81F4-000A95AFE286'
Format.set_mark_tags ${1:b} $0
TXT

  tab 'Format.', 'Format.set_max_boxes', <<-'TXT', uuid: '66609DAC-753A-11D9-81F4-000A95AFE286'
Format.set_max_boxes ${1:d} $0
TXT

  tab 'Format.', 'Format.set_max_indent', <<-'TXT', uuid: '45CF33F3-753A-11D9-81F4-000A95AFE286'
Format.set_max_indent ${1:d} $0
TXT

  tab 'Format.', 'Format.set_print_tags', <<-'TXT', uuid: '7EA0DC2D-753B-11D9-81F4-000A95AFE286'
Format.set_print_tags ${1:b} $0
TXT

  tab 'Format.', 'Format.set_tags', <<-'TXT', uuid: '6B7488A6-753B-11D9-81F4-000A95AFE286'
Format.set_tags ${1:b} $0
TXT

  tab 'Format.', 'Format.sprintf', <<-'TXT', uuid: 'F2D5327A-7550-11D9-A353-000A95AFE286'
Format.sprintf ${1:"${2:format}"} $0
TXT

  tab 'Format.pp', 'Format.pp_close_box', <<-'TXT', uuid: '6446E505-753D-11D9-81F4-000A95AFE286'
Format.pp_close_box ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_close_tag', <<-'TXT', uuid: 'AD53FD1A-753D-11D9-81F4-000A95AFE286'
Format.pp_open_box ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_force_newline', <<-'TXT', uuid: '72123FAD-753E-11D9-81F4-000A95AFE286'
Format.pp_force_newline ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_get_all_formatter_output_functions', <<-'TXT', uuid: '79B9CD2C-7550-11D9-A353-000A95AFE286'
Format.pp_get_all_formatter_output_functions ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_get_ellipsis_text', <<-'TXT', uuid: 'EB701613-754F-11D9-A353-000A95AFE286'
Format.pp_get_max_boxes ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_get_formatter_output_functions', <<-'TXT', uuid: '50044F98-7550-11D9-A353-000A95AFE286'
Format.pp_get_formatter_output_functions ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_get_formatter_tag_functions', <<-'TXT', uuid: 'A4CEE2B8-7550-11D9-A353-000A95AFE286'
Format.pp_get_formatter_tag_functions ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_get_margin', <<-'TXT', uuid: '6E70934A-754F-11D9-A353-000A95AFE286'
Format.pp_get_margin ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_get_mark_tags', <<-'TXT', uuid: '581A0264-753F-11D9-81F4-000A95AFE286'
Format.pp_get_mark_tags ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_get_max_boxes', <<-'TXT', uuid: 'AE0CBC1A-754F-11D9-A353-000A95AFE286'
Format.pp_get_max_boxes ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_get_max_indent', <<-'TXT', uuid: '7DF111F4-754F-11D9-A353-000A95AFE286'
Format.pp_get_max_indent ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_get_print_tags', <<-'TXT', uuid: '4AFE4843-753F-11D9-81F4-000A95AFE286'
Format.pp_get_print_tags ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_open_box', <<-'TXT', uuid: '2572E75C-753D-11D9-81F4-000A95AFE286'
Format.pp_open_box ${1:fmtr} ${2:d} $0
TXT

  tab 'Format.pp', 'Format.pp_open_hbox', <<-'TXT', uuid: '0571A8DF-753D-11D9-81F4-000A95AFE286'
Format.pp_open_hbox ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_open_hovbox', <<-'TXT', uuid: '23E4EDDE-753D-11D9-81F4-000A95AFE286'
Format.pp_open_hovbox ${1:fmtr} ${2:d} $0
TXT

  tab 'Format.pp', 'Format.pp_open_hvbox', <<-'TXT', uuid: '2369A606-753D-11D9-81F4-000A95AFE286'
Format.pp_open_hvbox ${1:fmtr} ${2:d} $0
TXT

  tab 'Format.pp', 'Format.pp_open_tag', <<-'TXT', uuid: '9DA191BA-753D-11D9-81F4-000A95AFE286'
Format.pp_open_box ${1:fmtr} ${2:tag} $0
TXT

  tab 'Format.pp', 'Format.pp_open_vbox', <<-'TXT', uuid: '22CFD7F6-753D-11D9-81F4-000A95AFE286'
Format.pp_open_vbox ${1:fmtr} ${2:d} $0
TXT

  tab 'Format.pp', 'Format.pp_over_max_boxes', <<-'TXT', uuid: 'C59FE58A-754F-11D9-A353-000A95AFE286'
Format.pp_over_max_boxes ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_print_as', <<-'TXT', uuid: 'C8B1981C-753D-11D9-81F4-000A95AFE286'
Format.pp_print_as ${1:fmtr} ${2:len} ${3:str} $0
TXT

  tab 'Format.pp', 'Format.pp_print_bool', <<-'TXT', uuid: '0AC74C8F-753E-11D9-81F4-000A95AFE286'
Format.pp_print_bool ${1:fmtr} ${2:b} $0
TXT

  tab 'Format.pp', 'Format.pp_print_break', <<-'TXT', uuid: '2B5C5B16-753E-11D9-81F4-000A95AFE286'
Format.pp_print_break ${1:fmtr} ${2:spaces} ${3:offset} $0
TXT

  tab 'Format.pp', 'Format.pp_print_char', <<-'TXT', uuid: '0A4857DB-753E-11D9-81F4-000A95AFE286'
Format.pp_print_char ${1:fmtr} ${2:'${3:ch}'} $0
TXT

  tab 'Format.pp', 'Format.pp_print_close_tbox', <<-'TXT', uuid: 'C4CE85BA-753E-11D9-81F4-000A95AFE286'
Format.pp_print_close_tbox ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_print_cut', <<-'TXT', uuid: '4A351280-753E-11D9-81F4-000A95AFE286'
Format.pp_print_cut ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_print_float', <<-'TXT', uuid: '01516C34-753E-11D9-81F4-000A95AFE286'
Format.pp_print_float ${1:fmtr} ${2:fl} $0
TXT

  tab 'Format.pp', 'Format.pp_print_flush', <<-'TXT', uuid: '8B11330E-753E-11D9-81F4-000A95AFE286'
Format.pp_print_flush ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_print_if_newline', <<-'TXT', uuid: 'A8325090-753E-11D9-81F4-000A95AFE286'
Format.pp_print_if_newline ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_print_int', <<-'TXT', uuid: 'F40FE004-753D-11D9-81F4-000A95AFE286'
Format.pp_print_int ${1:fmtr} ${2:i} $0
TXT

  tab 'Format.pp', 'Format.pp_print_newline', <<-'TXT', uuid: '8B7DB490-753E-11D9-81F4-000A95AFE286'
Format.pp_print_newline ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_print_open_tbox', <<-'TXT', uuid: 'B78F66EB-753E-11D9-81F4-000A95AFE286'
Format.pp_print_open_tbox ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_print_space', <<-'TXT', uuid: '6391FBA0-753E-11D9-81F4-000A95AFE286'
Format.pp_print_space ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_print_string', <<-'TXT', uuid: 'BCB9CAA8-753D-11D9-81F4-000A95AFE286'
Format.pp_print_string ${1:fmtr} ${2:"${3:str}"} $0
TXT

  tab 'Format.pp', 'Format.pp_print_tab', <<-'TXT', uuid: '00F0C800-753F-11D9-81F4-000A95AFE286'
Format.pp_print_tab ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_print_tbreak', <<-'TXT', uuid: 'D5A60B89-753E-11D9-81F4-000A95AFE286'
Format.pp_print_tbreak ${1:fmtr} ${2:spaces} ${3:offset} $0
TXT

  tab 'Format.pp', 'Format.pp_set_all_formatter_output_functions', <<-'TXT', uuid: '5DB62D96-7550-11D9-A353-000A95AFE286'
Format.pp_set_all_formatter_output_functions ${1:fmtr} ${2:out} ${3:flush} ${4:newline} ${5:spaces} $0
TXT

  tab 'Format.pp', 'Format.pp_set_ellipsis_text', <<-'TXT', uuid: 'D554DFA5-754F-11D9-A353-000A95AFE286'
Format.pp_set_ellipsis_text ${1:fmtr} ${2:"${3:txt}"} $0
TXT

  tab 'Format.pp', 'Format.pp_set_formatter_out_channel', <<-'TXT', uuid: 'FE7B87D0-754F-11D9-A353-000A95AFE286'
Format.pp_set_formatter_out_channel ${1:fmtr} ${2:oc} $0
TXT

  tab 'Format.pp', 'Format.pp_set_formatter_output_functions', <<-'TXT', uuid: '24AE9436-7550-11D9-A353-000A95AFE286'
Format.pp_set_formatter_output_functions ${1:fmtr} ${2:out} ${3:flush} $0
TXT

  tab 'Format.pp', 'Format.pp_set_formatter_tag_functions', <<-'TXT', uuid: '8D17235D-7550-11D9-A353-000A95AFE286'
Format.pp_set_formatter_tag_functions ${1:fmtr} ${2:tag_funs} $0
TXT

  tab 'Format.pp', 'Format.pp_set_margin', <<-'TXT', uuid: '5FD45C59-754F-11D9-A353-000A95AFE286'
Format.pp_set_margin ${1:fmtr} ${2:d} $0
TXT

  tab 'Format.pp', 'Format.pp_set_mark_tags', <<-'TXT', uuid: '3E9C214F-753F-11D9-81F4-000A95AFE286'
Format.pp_set_mark_tags ${1:fmtr} ${2:b} $0
TXT

  tab 'Format.pp', 'Format.pp_set_max_boxes', <<-'TXT', uuid: 'A200040C-754F-11D9-A353-000A95AFE286'
Format.pp_set_max_boxes ${1:fmtr} ${2:d} $0
TXT

  tab 'Format.pp', 'Format.pp_set_max_indent', <<-'TXT', uuid: '8E6BD25A-754F-11D9-A353-000A95AFE286'
Format.pp_set_max_indent ${1:fmtr} ${2:d} $0
TXT

  tab 'Format.pp', 'Format.pp_set_print_tags', <<-'TXT', uuid: '329B9A4A-753F-11D9-81F4-000A95AFE286'
Format.pp_set_print_tags ${1:fmtr} ${2:b} $0
TXT

  tab 'Format.pp', 'Format.pp_set_tab', <<-'TXT', uuid: '1161C613-753F-11D9-81F4-000A95AFE286'
Format.pp_set_tab ${1:fmtr} () $0
TXT

  tab 'Format.pp', 'Format.pp_set_tags', <<-'TXT', uuid: '1FDBD13B-753F-11D9-81F4-000A95AFE286'
Format.pp_set_tags ${1:fmtr} ${2:b} $0
TXT

  tab 'fos', 'float_of_string', <<-'TXT', uuid: '5DC9A24B-8932-4786-BE26-35DB56255C82'
float_of_string ${1:s}$0
TXT

  tab 'fw', 'failwith', <<-'TXT', uuid: '48E6AF6E-4D43-4B5F-BE3D-5DE0CA059A9B'
failwith ${1:"${2:str}"}$0
TXT

  tab 'Gc.', 'Gc.create_alarm', <<-'TXT', uuid: '9056D3A0-7552-11D9-928F-000A95AFE286'
Gc.create_alarm ${1:f} $0
TXT

  tab 'Gc.', 'Gc.delete_alarm', <<-'TXT', uuid: 'A1088140-7552-11D9-928F-000A95AFE286'
Gc.delete_alarm ${1:alarm} $0
TXT

  tab 'Gc.', 'Gc.finalise', <<-'TXT', uuid: '5C81D88A-7552-11D9-928F-000A95AFE286', file: 'Gc.finalize'
Gc.finalise ${1:finaliser} ${2:v} $0
TXT

  tab 'Gc.', 'Gc.finalise_release', <<-'TXT', uuid: '81331009-7552-11D9-928F-000A95AFE286', file: 'Gc.finalize_release'
Gc.finalise_release ()
TXT

  tab 'Gc.', 'Gc.major_slice', <<-'TXT', uuid: 'FA5FC1B4-7551-11D9-928F-000A95AFE286'
Gc.major_slice ${1:size} $0
TXT

  tab 'Gc.', 'Gc.print_stat', <<-'TXT', uuid: '36722F41-7552-11D9-928F-000A95AFE286'
Gc.print_stat ${1:oc} $0
TXT

  tab 'Gc.', 'Gc.set', <<-'TXT', uuid: 'DFEB4EA3-7551-11D9-928F-000A95AFE286'
Gc.set ${1:ctrl} $0
TXT

  tab 'Genlex.', 'Genlex.Char', <<-'TXT', uuid: 'EF404482-840B-423E-A7A1-83988AD059B1', file: 'Genlex_Char'
Genlex.Char ${1:'${2:ch}'}$0
TXT

  tab 'Genlex.', 'Genlex.Float', <<-'TXT', uuid: 'F23AC3BE-267E-4726-A8E8-B4F06D1107AF', file: 'Genlex_Float'
Genlex.Float ${1:f}$0
TXT

  tab 'Genlex.', 'Genlex.Ident', <<-'TXT', uuid: '4E9FD49C-8611-46D3-A76B-378A7014126C', file: 'Genlex_Ident'
Genlex.Ident ${1:"${2:str}"}$0
TXT

  tab 'Genlex.', 'Genlex.Int', <<-'TXT', uuid: '866CDB92-4A75-4602-B8D9-4D474AC14BAA', file: 'Genlex_Int'
Genlex.Int ${1:i}$0
TXT

  tab 'Genlex.', 'Genlex.Kwd', <<-'TXT', uuid: '72293E95-19F8-4059-9CA8-BEFF34621C32', file: 'Genlex_Kwd'
Genlex.Kwd ${1:"${2:str}"}$0
TXT

  tab 'Genlex.', 'Genlex.make_lexer', <<-'TXT', uuid: '0C227735-755D-11D9-AC9E-000A95AFE286'
Genlex.make_lexer ${1:tok_lst} ${2:char_stream} $0
TXT

  tab 'Genlex.', 'Genlex.String', <<-'TXT', uuid: '3D661846-0BDE-4E0A-8616-4B952E5E49F6', file: 'Genlex_String'
Genlex.String ${1:"${2:str}"}$0
TXT

  tab 'Hashtbl.', 'Hashtbl.add', <<-'TXT', uuid: '64E850E4-755D-11D9-AC9E-000A95AFE286'
Hashtbl.add ${1:h} ${2:key} ${3:value} $0
TXT

  tab 'Hashtbl.', 'Hashtbl.clear', <<-'TXT', uuid: '5443FEBC-755D-11D9-AC9E-000A95AFE286'
Hashtbl.clear ${1:h} $0
TXT

  tab 'Hashtbl.', 'Hashtbl.copy', <<-'TXT', uuid: '89DF2C70-755D-11D9-AC9E-000A95AFE286'
Hashtbl.copy ${1:h} $0
TXT

  tab 'Hashtbl.', 'Hashtbl.create', <<-'TXT', uuid: '3E0F4194-755D-11D9-AC9E-000A95AFE286'
Hashtbl.create ${1:size} $0
TXT

  tab 'Hashtbl.', 'Hashtbl.find', <<-'TXT', uuid: '98FB99FC-755D-11D9-AC9E-000A95AFE286'
Hashtbl.find ${1:h} ${2:key} $0
TXT

  tab 'Hashtbl.', 'Hashtbl.find_all', <<-'TXT', uuid: 'AB02F3BE-755D-11D9-AC9E-000A95AFE286'
Hashtbl.find_all ${1:h} ${2:key} $0
TXT

  tab 'Hashtbl.', 'Hashtbl.fold', <<-'TXT', uuid: '0229BBF8-755E-11D9-AC9E-000A95AFE286'
Hashtbl.fold ${1:(fun ${2:k} ${3:v} ${4:b} -> ${5:})} ${6:h} ${7:base} $0
TXT

  tab 'Hashtbl.', 'Hashtbl.hash', <<-'TXT', uuid: '69B66162-755E-11D9-AC9E-000A95AFE286'
Hashtbl.hash ${1:value} $0
TXT

  tab 'Hashtbl.', 'Hashtbl.hash_param', <<-'TXT', uuid: '8C1536F7-755E-11D9-AC9E-000A95AFE286'
Hashtbl.hash_param ${1:n} ${2:m} ${3:value} $0
TXT

  tab 'Hashtbl.', 'Hashtbl.iter', <<-'TXT', uuid: 'E2EBC7DB-755D-11D9-AC9E-000A95AFE286'
Hashtbl.iter ${1:(fun ${2:k} ${3:v} -> ${4:})} ${5:h} $0
TXT

  tab 'Hashtbl.', 'Hashtbl.length', <<-'TXT', uuid: '169134C9-755E-11D9-AC9E-000A95AFE286'
Hashtbl.length ${1:h} $0
TXT

  tab 'Hashtbl.', 'Hashtbl.Make', <<-'TXT', uuid: '33A29B42-755E-11D9-AC9E-000A95AFE286'
Hashtbl.Make ${1:(${2:H} : Hashtbl.HashedType)} $0
TXT

  tab 'Hashtbl.', 'Hashtbl.mem', <<-'TXT', uuid: 'B8A4E852-755D-11D9-AC9E-000A95AFE286'
Hashtbl.mem ${1:h} ${2:key} $0
TXT

  tab 'Hashtbl.', 'Hashtbl.remove', <<-'TXT', uuid: 'C5B6E73C-755D-11D9-AC9E-000A95AFE286'
Hashtbl.remove ${1:h} ${2:key} $0
TXT

  tab 'Hashtbl.', 'Hashtbl.replace', <<-'TXT', uuid: 'D6C552A9-755D-11D9-AC9E-000A95AFE286'
Hashtbl.replace ${1:h} ${2:key} ${3:value} $0
TXT

  tab 'iarg', 'invalid_arg', <<-'TXT', uuid: '5A60803D-FFE6-4ED2-8D0E-D1913C0066A1'
invalid_arg ${1:"${2:str}"}$0
TXT

  tab 'ic', 'open_in', <<-'TXT', uuid: 'F8DC0546-B247-447C-8525-A00E4E038D73'
open_in ${1:"${2:file_name}"}$0
TXT

  tab 'icb', 'open_in_bin', <<-'TXT', uuid: 'B1FBDC16-29C6-49B5-BE08-DCAABC44DAC9'
open_in_bin ${1:"${2:file_name}"}$0
TXT

  tab 'icg', 'open_in_gen', <<-'TXT', uuid: 'A349E94F-882F-46E7-9D78-F1034D727669'
open_in_gen ${4:[Open_$0]} 0o${1:644} ${2:"${3:file_name}"}
TXT

  tab 'iclen', 'in_channel_length', <<-'TXT', uuid: 'E7A48960-93AB-4823-85A2-5480124BC976'
in_channel_length ${1:in_channel}$0
TXT

  tab 'in', 'stdin', "stdin ", uuid: '1DC1DF03-E8B0-4998-866C-C513C6D08228'

  tab 'inb', 'input byte', <<-'TXT', uuid: '190252C5-BAEE-45DB-A244-914F82D05F53'
input_byte ${1:in_channel}$0
TXT

  tab 'inbin', 'input binary int', <<-'TXT', uuid: '3EB5C69A-8430-4589-8648-79F4BEDA6A1F'
input_binary_int ${1:in_channel}$0
TXT

  tab 'inc', 'input_char', <<-'TXT', uuid: 'FD9CAEC4-9C43-425B-9D8E-9DB6A81E46E0'
input_char ${1:in_channel}$0
TXT

  tab 'inl', 'input_line', <<-'TXT', uuid: 'C642FC12-B52E-4B05-92E6-301EB65A32D5'
input_line ${1:in_channel}$0
TXT

  tab 'inp', 'input', <<-'TXT', uuid: '8086AF0C-13AB-49B3-AB46-9D2BDC66BD3D'
input ${1:in_channel} ${2:buf} ${3:pos} ${4:len}$0
TXT

  tab 'Int32.', 'Int32.abs', <<-'TXT', uuid: '3A2F608E-755F-11D9-AC9E-000A95AFE286'
Int32.abs ${1:i32} $0
TXT

  tab 'Int32.', 'Int32.add', <<-'TXT', uuid: 'E95A2012-755E-11D9-AC9E-000A95AFE286'
Int32.add ${1:i32_1} ${2:i32_2} $0
TXT

  tab 'Int32.', 'Int32.bits_of_float', <<-'TXT', uuid: '31A62671-7560-11D9-AC9E-000A95AFE286'
Int32.bits_of_float ${1:f} $0
TXT

  tab 'Int32.', 'Int32.compare', <<-'TXT', uuid: '526E9779-7560-11D9-AC9E-000A95AFE286'
Int32.compare ${1:${2:i32_1} ${3:i32_2}}$0
TXT

  tab 'Int32.', 'Int32.div', <<-'TXT', uuid: '0024FDAA-755F-11D9-AC9E-000A95AFE286'
Int32.div ${1:i32_1} ${2:i32_2}$0
TXT

  tab 'Int32.', 'Int32.float_of_bits', <<-'TXT', uuid: '425B7CCC-7560-11D9-AC9E-000A95AFE286'
Int32.float_of_bits ${1:i32}$0
TXT

  tab 'Int32.', 'Int32.logand', <<-'TXT', uuid: '61A5E56A-755F-11D9-AC9E-000A95AFE286'
Int32.logand ${1:i32_1} ${2:i32_2}$0
TXT

  tab 'Int32.', 'Int32.lognot', <<-'TXT', uuid: '894C0AE0-755F-11D9-AC9E-000A95AFE286'
Int32.lognot ${1:i32}$0
TXT

  tab 'Int32.', 'Int32.logor', <<-'TXT', uuid: '6E5B1604-755F-11D9-AC9E-000A95AFE286'
Int32.logor ${1:i32_1} ${2:i32_2}$0
TXT

  tab 'Int32.', 'Int32.logxor', <<-'TXT', uuid: '75BCBD50-755F-11D9-AC9E-000A95AFE286'
Int32.logxor ${1:i32_1} ${2:i32_2}$0
TXT

  tab 'Int32.', 'Int32.mul', <<-'TXT', uuid: 'FFAFCA3A-755E-11D9-AC9E-000A95AFE286'
Int32.mul ${1:i32_1} ${2:i32_2}$0
TXT

  tab 'Int32.', 'Int32.neg', <<-'TXT', uuid: 'D08D45C0-755E-11D9-AC9E-000A95AFE286'
Int32.neg ${1:i32}$0
TXT

  tab 'Int32.', 'Int32.of_float', <<-'TXT', uuid: 'F841C604-755F-11D9-AC9E-000A95AFE286'
Int32.of_float ${1:f}$0
TXT

  tab 'Int32.', 'Int32.of_int', <<-'TXT', uuid: 'D39903F5-755F-11D9-AC9E-000A95AFE286'
Int32.of_int ${1:i}$0
TXT

  tab 'Int32.', 'Int32.of_string', <<-'TXT', uuid: '10F2912A-7560-11D9-AC9E-000A95AFE286'
Int32.of_string ${1:str}$0
TXT

  tab 'Int32.', 'Int32.pred', <<-'TXT', uuid: '3990B11A-755F-11D9-AC9E-000A95AFE286'
Int32.pred ${1:i32}$0
TXT

  tab 'Int32.', 'Int32.rem', <<-'TXT', uuid: '23150F6B-755F-11D9-AC9E-000A95AFE286'
Int32.rem ${1:i32_1} ${2:i32_2}$0
TXT

  tab 'Int32.', 'Int32.shift_left', <<-'TXT', uuid: '99C0D07A-755F-11D9-AC9E-000A95AFE286'
Int32.shift_left ${1:i32} ${2:i}$0
TXT

  tab 'Int32.', 'Int32.shift_right', <<-'TXT', uuid: 'B4736410-755F-11D9-AC9E-000A95AFE286'
Int32.shift_right ${1:i32} ${2:i}$0
TXT

  tab 'Int32.', 'Int32.shift_right_logical', <<-'TXT', uuid: 'BF10ACDC-755F-11D9-AC9E-000A95AFE286'
Int32.shift_right_logical ${1:i32} ${2:i}$0
TXT

  tab 'Int32.', 'Int32.sub', <<-'TXT', uuid: 'FF0C3836-755E-11D9-AC9E-000A95AFE286'
Int32.sub ${1:i32_1} ${2:i32_2}$0
TXT

  tab 'Int32.', 'Int32.succ', <<-'TXT', uuid: '2E5FB28A-755F-11D9-AC9E-000A95AFE286'
Int32.succ ${1:i32}$0
TXT

  tab 'Int32.', 'Int32.to_float', <<-'TXT', uuid: '04EF9FA0-7560-11D9-AC9E-000A95AFE286'
Int32.to_float ${1:i32}$0
TXT

  tab 'Int32.', 'Int32.to_int', <<-'TXT', uuid: 'D6C9AB8E-755F-11D9-AC9E-000A95AFE286'
Int32.to_int ${1:i32}$0
TXT

  tab 'Int32.', 'Int32.to_string', <<-'TXT', uuid: '1AA6B66A-7560-11D9-AC9E-000A95AFE286'
Int32.to_string ${1:i32}$0
TXT

  tab 'Int64.', 'Int64.abs', <<-'TXT', uuid: 'EFE6F33A-7560-11D9-AC9E-000A95AFE286'
Int64.abs ${1:i64}$0
TXT

  tab 'Int64.', 'Int64.add', <<-'TXT', uuid: '946954C6-7560-11D9-AC9E-000A95AFE286'
Int64.add ${1:i64_1} ${2:i64_2}$0
TXT

  tab 'Int64.', 'Int64.bits_of_float', <<-'TXT', uuid: 'A30A4F00-7561-11D9-AC9E-000A95AFE286'
Int64.bits_of_float ${1:f}$0
TXT

  tab 'Int64.', 'Int64.compare', <<-'TXT', uuid: 'B461FEAE-7561-11D9-AC9E-000A95AFE286'
Int64.compare ${1:${2:i64_1} $ {3:i64_2}}$0
TXT

  tab 'Int64.', 'Int64.div', <<-'TXT', uuid: 'C0505AD1-7560-11D9-AC9E-000A95AFE286'
Int64.div ${1:i64_1} ${2:i64_2}$0
TXT

  tab 'Int64.', 'Int64.float_of_bits', <<-'TXT', uuid: 'ABCA4E3F-7561-11D9-AC9E-000A95AFE286'
Int64.float_of_bits ${1:i64}$0
TXT

  tab 'Int64.', 'Int64.logand', <<-'TXT', uuid: '102B72FB-7561-11D9-AC9E-000A95AFE286'
Int64.logand ${1:i64_1} ${2:i64_2}$0
TXT

  tab 'Int64.', 'Int64.lognot', <<-'TXT', uuid: '36B17F8A-7561-11D9-AC9E-000A95AFE286'
Int64.lognot ${1:i64}$0
TXT

  tab 'Int64.', 'Int64.logor', <<-'TXT', uuid: '1CB23B2C-7561-11D9-AC9E-000A95AFE286'
Int64.logor ${1:i64_1} ${2:i64_2}$0
TXT

  tab 'Int64.', 'Int64.logxor', <<-'TXT', uuid: '2AA39004-7561-11D9-AC9E-000A95AFE286'
Int64.logxor ${1:i64_1} ${2:i64_2}$0
TXT

  tab 'Int64.', 'Int64.mul', <<-'TXT', uuid: 'B0F6E590-7560-11D9-AC9E-000A95AFE286'
Int64.mul ${1:i64_1} ${2:i64_2}$0
TXT

  tab 'Int64.', 'Int64.neg', <<-'TXT', uuid: '88E07362-7560-11D9-AC9E-000A95AFE286'
Int64.neg ${1:i64}$0
TXT

  tab 'Int64.', 'Int64.of_float', <<-'TXT', uuid: '835D2CEA-7561-11D9-AC9E-000A95AFE286'
Int64.of_float ${1:f}$0
TXT

  tab 'Int64.', 'Int64.of_int', <<-'TXT', uuid: '67598D80-7561-11D9-AC9E-000A95AFE286'
Int64.of_int ${1:i}$0
TXT

  tab 'Int64.', 'Int64.of_int32', <<-'TXT', uuid: '3E2F162E-7562-11D9-AC9E-000A95AFE286'
Int64.of_int32 ${1:i32}$0
TXT

  tab 'Int64.', 'Int64.of_nativeint', <<-'TXT', uuid: '3E8AA110-7562-11D9-AC9E-000A95AFE286'
Int64.of_nativeint ${1:ni}$0
TXT

  tab 'Int64.', 'Int64.of_string', <<-'TXT', uuid: '944E5A68-7561-11D9-AC9E-000A95AFE286'
Int64.of_string ${1:str}$0
TXT

  tab 'Int64.', 'Int64.pred', <<-'TXT', uuid: 'E4447070-7560-11D9-AC9E-000A95AFE286'
Int64.pred ${1:i64}$0
TXT

  tab 'Int64.', 'Int64.rem', <<-'TXT', uuid: 'CD513402-7560-11D9-AC9E-000A95AFE286'
Int64.rem ${1:i64_1} ${2:i64_2}$0
TXT

  tab 'Int64.', 'Int64.shift_left', <<-'TXT', uuid: '42098DF1-7561-11D9-AC9E-000A95AFE286'
Int64.shift_left ${1:i64} ${2:i}$0
TXT

  tab 'Int64.', 'Int64.shift_right', <<-'TXT', uuid: '4BE24CBF-7561-11D9-AC9E-000A95AFE286'
Int64.shift_right ${1:i64} ${2:i}$0
TXT

  tab 'Int64.', 'Int64.shift_right_logical', <<-'TXT', uuid: '5D255F4C-7561-11D9-AC9E-000A95AFE286'
Int64.shift_right_logical ${1:i64} ${2:i}$0
TXT

  tab 'Int64.', 'Int64.sub', <<-'TXT', uuid: 'A441B868-7560-11D9-AC9E-000A95AFE286'
Int64.sub ${1:i64_1} ${2:i64_2}$0
TXT

  tab 'Int64.', 'Int64.succ', <<-'TXT', uuid: 'D96545D6-7560-11D9-AC9E-000A95AFE286'
Int64.succ ${1:i64}$0
TXT

  tab 'Int64.', 'Int64.to_float', <<-'TXT', uuid: '8AE0FF7A-7561-11D9-AC9E-000A95AFE286'
Int64.to_float ${1:i64}$0
TXT

  tab 'Int64.', 'Int64.to_int', <<-'TXT', uuid: '6DA2704E-7561-11D9-AC9E-000A95AFE286'
Int64.to_int ${1:i64}$0
TXT

  tab 'Int64.', 'Int64.to_int32', <<-'TXT', uuid: '40CD410F-7562-11D9-AC9E-000A95AFE286'
Int64.to_int32 ${1:i64}$0
TXT

  tab 'Int64.', 'Int64.to_nativeint', <<-'TXT', uuid: '4122B1E8-7562-11D9-AC9E-000A95AFE286'
Int64.to_nativeint ${1:i64}$0
TXT

  tab 'Int64.', 'Int64.to_string', <<-'TXT', uuid: '9AFC88CE-7561-11D9-AC9E-000A95AFE286'
Int64.to_string ${1:i64}$0
TXT

  tab 'inval', 'input value', <<-'TXT', uuid: '056F9D75-4FFF-44B8-82FB-3FF3F3ACEE39'
(input_value ${1:in_channel} : ${2:type})$0
TXT

  tab 'ioc', 'int_of_char', <<-'TXT', uuid: 'B4EA3647-8EAC-4903-A5DF-1FCD863FEEC6'
int_of_char ${1:'${2:ch}'}$0
TXT

  tab 'iof', 'int_of_float', <<-'TXT', uuid: '79FDBABF-A7C5-469E-BA46-26BE7DCF8D15'
int_of_float ${1:f}$0
TXT

  tab 'ios', 'int_of_string', <<-'TXT', uuid: 'B9A7C235-67EC-4016-A06B-BBF0D0A33747'
int_of_string ${1:s}$0
TXT

  tab 'LargeFile.', 'LargeFile.in_channel_length', <<-'TXT', uuid: 'AC82BF54-4720-488E-96C0-6E57D30FF681', file: 'LargeFile_in_channel_length'
LargeFile.pos_in ${1:in_channel}$0
TXT

  tab 'LargeFile.', 'LargeFile.out_channel_length', <<-'TXT', uuid: '606DA7D6-27E8-47F3-9B29-8E61F88C5054', file: 'LargeFile_out_channel_length'
LargeFile.pos_out ${1:out_channel}$0
TXT

  tab 'LargeFile.', 'LargeFile.pos_in', <<-'TXT', uuid: 'D94D1FB5-5921-42D4-8D13-FEBF1456434F', file: 'LargeFile_pos_in'
LargeFile.pos_in ${1:in_channel}$0
TXT

  tab 'LargeFile.', 'LargeFile.pos_out', <<-'TXT', uuid: 'D7C11788-F917-4FA7-AEE1-D4480729A6BC', file: 'LargeFile_pos_out'
LargeFile.pos_out ${1:out_channel}$0
TXT

  tab 'LargeFile.', 'LargeFile.seek_in', <<-'TXT', uuid: 'D125F40A-1AC0-4BC6-B1EC-275BD4B0AFCD', file: 'LargeFile_seek_in'
LargeFile.seek_in ${1:in_channel} ${2:i64}$0
TXT

  tab 'LargeFile.', 'LargeFile.seek_out', <<-'TXT', uuid: '21D60E83-ACD9-4C4F-A8F4-10B7CAAEF672', file: 'LargeFile_seek_out'
LargeFile.seek_out ${1:out_channel} ${2:i64}$0
TXT

  tab 'Lazy.', 'Lazy.force', <<-'TXT', uuid: 'A9AD11DA-7564-11D9-B7C0-000A95AFE286'
Lazy.force ${1:x}$0
TXT

  tab 'Lazy.', 'Lazy.force_val', <<-'TXT', uuid: 'BC38471E-7564-11D9-B7C0-000A95AFE286'
Lazy.force_val ${1:x}$0
TXT

  tab 'Lazy.', 'Lazy.from_fun', <<-'TXT', uuid: 'CA4F9562-7564-11D9-B7C0-000A95AFE286'
Lazy.from_fun ${1:f}$0
TXT

  tab 'Lazy.', 'Lazy.from_val', <<-'TXT', uuid: 'DB5420F3-7564-11D9-B7C0-000A95AFE286'
Lazy.from_val ${1:x}$0
TXT

  tab 'Lazy.', 'Lazy.is_val', <<-'TXT', uuid: 'E78B9C13-7564-11D9-B7C0-000A95AFE286'
Lazy.is_val ${1:x}$0
TXT

  tab 'Lexing.', 'Lexing.flush_input', <<-'TXT', uuid: '9D55AD4E-7565-11D9-B7C0-000A95AFE286'
Lexing.flush_input ${1:buf}$0
TXT

  tab 'Lexing.', 'Lexing.from_channel', <<-'TXT', uuid: '0CC20B55-7565-11D9-B7C0-000A95AFE286'
Lexing.from_channel ${1:ic}$0
TXT

  tab 'Lexing.', 'Lexing.from_function', <<-'TXT', uuid: '38CB1E20-7565-11D9-B7C0-000A95AFE286'
Lexing.from_function ${1:f}$0
TXT

  tab 'Lexing.', 'Lexing.from_string', <<-'TXT', uuid: '27E765A6-7565-11D9-B7C0-000A95AFE286'
Lexing.from_string ${1:str}$0
TXT

  tab 'Lexing.', 'Lexing.lexeme', <<-'TXT', uuid: '53CADC04-7565-11D9-B7C0-000A95AFE286'
Lexing.lexeme ${1:buf}$0
TXT

  tab 'Lexing.', 'Lexing.lexeme_char', <<-'TXT', uuid: '624FC7EA-7565-11D9-B7C0-000A95AFE286'
Lexing.lexeme_char ${1:buf} ${2:n}$0
TXT

  tab 'Lexing.', 'Lexing.lexeme_end', <<-'TXT', uuid: '7CDF1BFD-7565-11D9-B7C0-000A95AFE286'
Lexing.lexeme_end ${1:buf}$0
TXT

  tab 'Lexing.', 'Lexing.lexeme_end_p', <<-'TXT', uuid: '91E183EE-7565-11D9-B7C0-000A95AFE286'
Lexing.lexeme_end_p ${1:buf}$0
TXT

  tab 'Lexing.', 'Lexing.lexeme_start', <<-'TXT', uuid: '63CCA307-7565-11D9-B7C0-000A95AFE286'
Lexing.lexeme_start ${1:buf}$0
TXT

  tab 'Lexing.', 'Lexing.lexeme_start_p', <<-'TXT', uuid: '7E1C790F-7565-11D9-B7C0-000A95AFE286'
Lexing.lexeme_start_p ${1:buf}$0
TXT

  tab 'List.', 'List.append', <<-'TXT', uuid: '0662F7C9-7566-11D9-B7C0-000A95AFE286'
List.append ${1:lst1} ${2:lst2}$0
TXT

  tab 'List.', 'List.assoc', <<-'TXT', uuid: '28D8D366-7568-11D9-B7C0-000A95AFE286'
List.assoc ${1:key} ${2:lst}$0
TXT

  tab 'List.', 'List.assq', <<-'TXT', uuid: '3EA351D8-7568-11D9-B7C0-000A95AFE286'
List.assq ${1:key} ${2:lst}$0
TXT

  tab 'List.', 'List.combine', <<-'TXT', uuid: '98A0973A-7568-11D9-B7C0-000A95AFE286'
List.combine ${1:lst1} ${2:lst2}$0
TXT

  tab 'List.', 'List.concat', <<-'TXT', uuid: '36453E60-7566-11D9-B7C0-000A95AFE286'
List.concat ${1:lstlst}$0
TXT

  tab 'List.', 'List.exists', <<-'TXT', uuid: '0B34F054-7567-11D9-B7C0-000A95AFE286'
List.exists ${1:predicate} ${2:lst}$0
TXT

  tab 'List.', 'List.exists2', <<-'TXT', uuid: '250AB6DC-7567-11D9-B7C0-000A95AFE286'
List.exists2 ${1:predicate} ${2:lst1} ${3:lst2}$0
TXT

  tab 'List.', 'List.fast_sort', <<-'TXT', uuid: 'C6E4E674-7568-11D9-B7C0-000A95AFE286'
List.fast_sort ${1:compare} ${2:lst}$0
TXT

  tab 'List.', 'List.filter', <<-'TXT', uuid: 'EF745747-7567-11D9-B7C0-000A95AFE286'
List.filter ${1:predicate} ${2:lst}$0
TXT

  tab 'List.', 'List.find', <<-'TXT', uuid: 'D5B2177A-7567-11D9-B7C0-000A95AFE286'
List.find ${1:predicate} ${2:lst}$0
TXT

  tab 'List.', 'List.find_all', <<-'TXT', uuid: 'D608D0B4-7567-11D9-B7C0-000A95AFE286'
List.find_all ${1:predicate} ${2:lst}$0
TXT

  tab 'List.', 'List.flatten', <<-'TXT', uuid: '47F3A2A6-7566-11D9-B7C0-000A95AFE286'
List.flatten ${1:lstlst}$0
TXT

  tab 'List.', 'List.fold_left', <<-'TXT', uuid: '601F7E33-7566-11D9-B7C0-000A95AFE286'
List.fold_left ${1:(fun ${2:b} ${3:v} -> ${4:})} ${5:base} ${6:lst}$0
TXT

  tab 'List.', 'List.fold_left2', <<-'TXT', uuid: 'C7C21B8B-7566-11D9-B7C0-000A95AFE286'
List.fold_left2 ${1:(fun ${2:b} ${3:v1} ${4:v2} -> ${5:})} ${6:base} ${7:lst1} ${8:lst2}$0
TXT

  tab 'List.', 'List.fold_right', <<-'TXT', uuid: '82BB3E65-7566-11D9-B7C0-000A95AFE286'
List.fold_right ${1:(fun ${2:v} ${3:b} -> ${4:})} ${5:lst} ${6:base}$0
TXT

  tab 'List.', 'List.fold_right2', <<-'TXT', uuid: 'DD0DC462-7566-11D9-B7C0-000A95AFE286'
List.fold_right2 ${1:(fun ${2:v1} ${3:v2} ${4:b} -> ${5:})} ${6:lst1} ${7:lst2} ${8:base}$0
TXT

  tab 'List.', 'List.for_all', <<-'TXT', uuid: 'F838D194-7566-11D9-B7C0-000A95AFE286'
List.for_all ${1:predicate} ${2:lst}$0
TXT

  tab 'List.', 'List.for_all2', <<-'TXT', uuid: '15953612-7567-11D9-B7C0-000A95AFE286'
List.for_all ${1:predicate} ${2:lst1} ${3:lst2}$0
TXT

  tab 'List.', 'List.hd', <<-'TXT', uuid: 'D3588CE7-7565-11D9-B7C0-000A95AFE286'
List.hd ${1:lst}$0
TXT

  tab 'List.', 'List.iter', <<-'TXT', uuid: '96E843E2-752F-11D9-87B3-000A95AFE286'
List.iter ${1:(fun ${2:x} -> ${3:})} ${4:lst}$0
TXT

  tab 'List.', 'List.iter2', <<-'TXT', uuid: 'A073DBB2-7566-11D9-B7C0-000A95AFE286'
List.iter2 ${1:(fun ${2:x1} ${3:x2} -> ${4:})} ${5:lst1} ${6:lst2}$0
TXT

  tab 'List.', 'List.length', <<-'TXT', uuid: 'C2A0E131-7565-11D9-B7C0-000A95AFE286'
List.length ${1:lst}$0
TXT

  tab 'List.', 'List.map', <<-'TXT', uuid: '5DF316D0-752F-11D9-87B3-000A95AFE286'
List.map ${1:(fun ${2:x} -> ${3:})} ${4:lst}$0
TXT

  tab 'List.', 'List.map2', <<-'TXT', uuid: 'B16B1AA0-7566-11D9-B7C0-000A95AFE286'
List.map2 ${1:(fun ${2:x1} ${3:x2} -> ${4:})} ${5:lst1} ${6:lst2}$0
TXT

  tab 'List.', 'List.mem', <<-'TXT', uuid: '392A35B3-7567-11D9-B7C0-000A95AFE286'
List.mem ${1:x} ${2:lst}$0
TXT

  tab 'List.', 'List.mem_assoc', <<-'TXT', uuid: '40300F08-7568-11D9-B7C0-000A95AFE286'
List.mem_assoc ${1:key} ${2:lst}$0
TXT

  tab 'List.', 'List.mem_assq', <<-'TXT', uuid: '426EFFA8-7568-11D9-B7C0-000A95AFE286'
List.mem_assq ${1:key} ${2:lst}$0
TXT

  tab 'List.', 'List.memq', <<-'TXT', uuid: '4DCE8330-7567-11D9-B7C0-000A95AFE286'
List.memq ${1:x} $ {2:lst}$0
TXT

  tab 'List.', 'List.merge', <<-'TXT', uuid: 'C75B53D8-7568-11D9-B7C0-000A95AFE286'
List.merge ${1:compare} ${2:lst1} ${3:lst2}$0
TXT

  tab 'List.', 'List.nth', <<-'TXT', uuid: 'D4EC99E0-7565-11D9-B7C0-000A95AFE286'
List.nth ${1:lst} ${2:n}$0
TXT

  tab 'List.', 'List.partition', <<-'TXT', uuid: '007CAB12-7568-11D9-B7C0-000A95AFE286'
List.partition ${1:predicate} ${2:lst}$0
TXT

  tab 'List.', 'List.remove_assoc', <<-'TXT', uuid: '43B14842-7568-11D9-B7C0-000A95AFE286'
List.remove_assoc ${1:key} ${2:lst}$0
TXT

  tab 'List.', 'List.remove_assq', <<-'TXT', uuid: '442B5BBA-7568-11D9-B7C0-000A95AFE286'
List.remove_assq ${1:key} ${2:lst}$0
TXT

  tab 'List.', 'List.rev', <<-'TXT', uuid: 'D588DC69-7565-11D9-B7C0-000A95AFE286'
List.rev ${1:lst}$0
TXT

  tab 'List.', 'List.rev_append', <<-'TXT', uuid: '2915FF74-7566-11D9-B7C0-000A95AFE286'
List.rev_append ${1:lst1} ${2:lst2}$0
TXT

  tab 'List.', 'List.rev_map', <<-'TXT', uuid: '53877946-7566-11D9-B7C0-000A95AFE286'
List.rev_map ${1:(fun ${2:x} -> ${3:})} ${4:lst}$0
TXT

  tab 'List.', 'List.rev_map2', <<-'TXT', uuid: 'BE61599C-7566-11D9-B7C0-000A95AFE286'
List.rev_map2 ${1:(fun ${2:x1} ${3:x2} -> ${4:})} ${5:lst1} ${6:lst2}$0
TXT

  tab 'List.', 'List.sort', <<-'TXT', uuid: 'ADE1367E-7568-11D9-B7C0-000A95AFE286'
List.sort ${1:compare} ${2:lst}$0
TXT

  tab 'List.', 'List.split', <<-'TXT', uuid: '8B825A1D-7568-11D9-B7C0-000A95AFE286'
List.split ${1:lst}$0
TXT

  tab 'List.', 'List.stable_sort', <<-'TXT', uuid: 'C670F3A2-7568-11D9-B7C0-000A95AFE286'
List.stable_sort ${1:compare} ${2:lst}$0
TXT

  tab 'List.', 'List.tl', <<-'TXT', uuid: 'D4246581-7565-11D9-B7C0-000A95AFE286'
List.tl ${1:lst}$0
TXT

  tab 'Map.', 'Map.Make', <<-'TXT', uuid: 'FEF9C15C-7568-11D9-B7C0-000A95AFE286'
Map.Make ${1:(${2:Ord} : OrderedType)}$0
TXT

  tab 'Marshal.', 'Marshal.data_size', <<-'TXT', uuid: 'E3B09E5C-7569-11D9-B7C0-000A95AFE286'
Marshal.data_size ${1:buf} ${2:ofs}$0
TXT

  tab 'Marshal.', 'Marshal.from_channel', <<-'TXT', uuid: '85D6E063-7569-11D9-B7C0-000A95AFE286'
Marshal.from_channel ${1:ic}$0
TXT

  tab 'Marshal.', 'Marshal.from_string', <<-'TXT', uuid: '9745A552-7569-11D9-B7C0-000A95AFE286'
Marshal.from_string ${1:str} ${2:ofs}$0
TXT

  tab 'Marshal.', 'Marshal.to_buffer', <<-'TXT', uuid: '46606B32-7569-11D9-B7C0-000A95AFE286'
Marshal.to_buffer ${1:buf} ${2:ofs} ${3:len} ${4:v} ${5:[${6:flags}]}$0
TXT

  tab 'Marshal.', 'Marshal.to_channel', <<-'TXT', uuid: '271FFB7A-7569-11D9-B7C0-000A95AFE286'
Marshal.to_channel ${1:oc} ${2:v} ${3:[${4:flags}]}$0
TXT

  tab 'Marshal.', 'Marshal.to_string', <<-'TXT', uuid: '460749AF-7569-11D9-B7C0-000A95AFE286'
Marshal.to_channel ${1:v} ${2:[${3:flags}]}$0
TXT

  tab 'Marshal.', 'Marshal.total_size', <<-'TXT', uuid: 'C38F8EB3-7569-11D9-B7C0-000A95AFE286'
Marshal.total_size ${1:buf} ${2:ofs}$0
TXT

  tab 'Nativeint.', 'Nativeint.abs', <<-'TXT', uuid: '0F51DE9A-7563-11D9-AC9E-000A95AFE286'
Nativeint.abs ${1:ni}$0
TXT

  tab 'Nativeint.', 'Nativeint.add', <<-'TXT', uuid: 'BB99FFFC-7562-11D9-AC9E-000A95AFE286'
Nativeint.add ${1:ni_1} ${2:ni_2}$0
TXT

  tab 'Nativeint.', 'Nativeint.compare', <<-'TXT', uuid: 'E3D3B422-7563-11D9-AC9E-000A95AFE286', file: 'Nativeint.mcompare'
Nativeint.compare ${1:${2:ni_1} $ {2:ni_2}}$0
TXT

  tab 'Nativeint.', 'Nativeint.div', <<-'TXT', uuid: 'E330435A-7562-11D9-AC9E-000A95AFE286'
Nativeint.div ${1:ni_1} ${2:ni_2}$0
TXT

  tab 'Nativeint.', 'Nativeint.logand', <<-'TXT', uuid: '30350BFE-7563-11D9-AC9E-000A95AFE286'
Nativeint.logand ${1:ni_1} ${2:ni_2}$0
TXT

  tab 'Nativeint.', 'Nativeint.lognot', <<-'TXT', uuid: '51A97F92-7563-11D9-AC9E-000A95AFE286'
Nativeint.lognot ${1:ni}$0
TXT

  tab 'Nativeint.', 'Nativeint.logor', <<-'TXT', uuid: '3B157A5C-7563-11D9-AC9E-000A95AFE286'
Nativeint.logor ${1:ni_1} ${2:ni_2}$0
TXT

  tab 'Nativeint.', 'Nativeint.logxor', <<-'TXT', uuid: '47FB7616-7563-11D9-AC9E-000A95AFE286'
Nativeint.logxor ${1:ni_1} ${2:ni_2}$0
TXT

  tab 'Nativeint.', 'Nativeint.mul', <<-'TXT', uuid: 'D7BE9372-7562-11D9-AC9E-000A95AFE286'
Nativeint.mul ${1:ni_1} ${2:ni_2}$0
TXT

  tab 'Nativeint.', 'Nativeint.neg', <<-'TXT', uuid: 'ADAEC108-7562-11D9-AC9E-000A95AFE286'
Nativeint.neg ${1:ni}$0
TXT

  tab 'Nativeint.', 'Nativeint.of_float', <<-'TXT', uuid: 'BDB566EC-7563-11D9-AC9E-000A95AFE286'
Nativeint.of_float ${1:f}$0
TXT

  tab 'Nativeint.', 'Nativeint.of_int', <<-'TXT', uuid: '83558CEC-7563-11D9-AC9E-000A95AFE286'
Nativeint.of_int ${1:i}$0
TXT

  tab 'Nativeint.', 'Nativeint.of_int32', <<-'TXT', uuid: '941D3674-7563-11D9-AC9E-000A95AFE286'
Nativeint.of_int32 ${1:i32}$0
TXT

  tab 'Nativeint.', 'Nativeint.of_string', <<-'TXT', uuid: 'D2EB168C-7563-11D9-AC9E-000A95AFE286'
Nativeint.of_string ${1:str}$0
TXT

  tab 'Nativeint.', 'Nativeint.pred', <<-'TXT', uuid: '04EDF3A2-7563-11D9-AC9E-000A95AFE286'
Nativeint.pred ${1:ni}$0
TXT

  tab 'Nativeint.', 'Nativeint.rem', <<-'TXT', uuid: 'EEF9D637-7562-11D9-AC9E-000A95AFE286'
Nativeint.rem ${1:ni_1} ${2:ni_2}$0
TXT

  tab 'Nativeint.', 'Nativeint.shift_left', <<-'TXT', uuid: '601B0110-7563-11D9-AC9E-000A95AFE286'
Nativeint.shift_left ${1:ni} ${2:i}$0
TXT

  tab 'Nativeint.', 'Nativeint.shift_right', <<-'TXT', uuid: '6E002157-7563-11D9-AC9E-000A95AFE286'
Nativeint.shift_right ${1:ni} ${2:i}$0
TXT

  tab 'Nativeint.', 'Nativeint.shift_right_logical', <<-'TXT', uuid: '7A169CE7-7563-11D9-AC9E-000A95AFE286'
Nativeint.shift_right_logical ${1:ni} ${2:i}$0
TXT

  tab 'Nativeint.', 'Nativeint.sub', <<-'TXT', uuid: 'C8037951-7562-11D9-AC9E-000A95AFE286'
Nativeint.sub ${1:ni_1} ${2:ni2}$0
TXT

  tab 'Nativeint.', 'Nativeint.succ', <<-'TXT', uuid: 'FB5C0502-7562-11D9-AC9E-000A95AFE286'
Nativeint.succ ${1:ni}$0
TXT

  tab 'Nativeint.', 'Nativeint.to_float', <<-'TXT', uuid: 'C42A3A98-7563-11D9-AC9E-000A95AFE286'
Nativeint.to_float ${1:ni}$0
TXT

  tab 'Nativeint.', 'Nativeint.to_int', <<-'TXT', uuid: '8A5F5125-7563-11D9-AC9E-000A95AFE286'
Nativeint.to_int ${1:ni}$0
TXT

  tab 'Nativeint.', 'Nativeint.to_int32', <<-'TXT', uuid: '9F2FADA6-7563-11D9-AC9E-000A95AFE286'
Nativeint.to_int32 ${1:ni}$0
TXT

  tab 'Nativeint.', 'Nativeint.to_string', <<-'TXT', uuid: 'DA47DC38-7563-11D9-AC9E-000A95AFE286'
Nativeint.to_string ${1:ni}$0
TXT

  tab 'oc', 'open_out', <<-'TXT', uuid: '1700870E-2F3B-4E7F-8159-626986D016FB'
open_out ${1:"${2:file_name}"}$0
TXT

  tab 'ocb', 'open_out_bin', <<-'TXT', uuid: 'F6564687-5677-47FF-82DE-C05D0DB6C9B8'
open_out_bin ${1:"${2:file_name}"}$0
TXT

  tab 'ocg', 'open_out_gen', <<-'TXT', uuid: 'C2CA7CD1-8A33-48EE-A211-19183DB99BEE'
open_out_gen ${4:[Open_$0]} 0o${1:644} ${2:"${3:file_name}"}
TXT

  tab 'oclen', 'out_channel_length', <<-'TXT', uuid: '0D62770C-03F2-4510-82A3-388BBCA9F3EC'
out_channel_length ${1:out_channel}$0
TXT

  tab 'Oo.', 'Oo.copy', <<-'TXT', uuid: '405DA99E-756A-11D9-83BC-000A95AFE286'
Oo.copy ${1:obj}$0
TXT

  tab 'Oo.', 'Oo.id', <<-'TXT', uuid: '54537766-756A-11D9-83BC-000A95AFE286'
Oo.id ${1:obj}$0
TXT

  tab 'Open_', 'Create if non-existant', <<-'TXT', uuid: 'D10E9AC7-7861-4407-BB41-045522849422'
Open_creat
TXT

  tab 'Open_', 'Empty if file exists', <<-'TXT', uuid: '3BBF6832-BE38-4DD5-A916-3B0578430A7E'
Open_trunc
TXT

  tab 'Open_', 'Fail if Create and file exists', <<-'TXT', uuid: '8760C3F9-1911-431F-BEFA-0C0DDC6800BA'
Open_excl
TXT

  tab 'Open_', 'Open append', <<-'TXT', uuid: 'AD88FE1B-8929-4969-9C62-09C34BC87BD9'
Open_append
TXT

  tab 'Open_', 'Open in binary mode', <<-'TXT', uuid: '84E99903-E457-4201-B6D8-DD1D27D8CEF8'
Open_binary
TXT

  tab 'Open_', 'Open in non-blocking mode', <<-'TXT', uuid: '64DB653B-46BE-43A3-8615-EF76814B8433'
Open_nonblock
TXT

  tab 'Open_', 'Open in text mode', <<-'TXT', uuid: 'DAA6C274-FA1C-4AC0-89DA-10E159A67685'
Open_text
TXT

  tab 'Open_', 'Open read-only', <<-'TXT', uuid: 'EB92D44D-75F4-4A5D-9E18-C545E4716023'
Open_rdonly
TXT

  tab 'Open_', 'Open write-only', <<-'TXT', uuid: '2186B22B-C879-41DC-B590-26A96BF21802'
Open_wronly
TXT

  tab 'out', 'output', <<-'TXT', uuid: 'B1E66182-3C99-4ACE-B8A5-9CE4E6F5F0D3'
output ${1:out_channel} ${2:buf} ${3:pos} ${4:len}$0
TXT

  tab 'out', 'stdout', "stdout ", uuid: '766DCF40-1EB7-49CF-94AD-437A61B0FDEC'

  tab 'outb', 'output byte', <<-'TXT', uuid: '8F77AD74-8310-442A-A354-DE4E42C7622E'
output_byte ${1:out_channel} ${2:i}$0
TXT

  tab 'outbin', 'output binary int', <<-'TXT', uuid: 'F4B6E13F-1DF9-47B2-B0B9-244D64364E90'
output_binary_int ${1:out_channel} ${2:i}$0
TXT

  tab 'outc', 'output char', <<-'TXT', uuid: '6EF37EE9-7FF1-4FE9-90C5-A5D14CF0C2C1'
output_char ${1:out_channel} ${2:'${3:ch}'}$0
TXT

  tab 'outs', 'output string', <<-'TXT', uuid: '6D5C56EE-CE5C-4CCC-BD38-B1D369341553'
output_string ${1:out_channel} ${2:"${3:s}"}$0
TXT

  tab 'outval', 'output value', <<-'TXT', uuid: 'C2434C74-189A-414A-BFFB-069C40AE5238'
output_value ${1:out_channel} ${2:v}$0
TXT

  tab 'Parsing.', 'Parsing.Parse_error', <<-'TXT', uuid: '6BA48AEC-D1CA-420A-A533-58CA0AC266F2', file: 'Parsing_Parse_error'
Parsing.Parse_error
TXT

  tab 'Parsing.', 'Parsing.rhs_end', <<-'TXT', uuid: 'B2E812E8-756A-11D9-83BC-000A95AFE286'
Parsing.rhs_end ${1:n}$0
TXT

  tab 'Parsing.', 'Parsing.rhs_end_pos', <<-'TXT', uuid: 'D66E4D7B-756A-11D9-83BC-000A95AFE286'
Parsing.rhs_end_pos ${1:n}$0
TXT

  tab 'Parsing.', 'Parsing.rhs_start', <<-'TXT', uuid: '9E770DC8-756A-11D9-83BC-000A95AFE286'
Parsing.rhs_start ${1:n}$0
TXT

  tab 'Parsing.', 'Parsing.rhs_start_pos', <<-'TXT', uuid: 'D0F4F2D0-756A-11D9-83BC-000A95AFE286'
Parsing.rhs_start_pos ${1:n}$0
TXT

  tab 'pc', 'print_char', <<-'TXT', uuid: '433A373B-4D03-4EBB-94F5-2E66B0FA1F15'
print_char ${1:'${2:ch}'}$0
TXT

  tab 'pe', 'print_endline', <<-'TXT', uuid: '277F0C21-AE07-4D85-A6E6-E8B8DB81450D'
print_endline ${1:"${2:str}"}$0
TXT

  tab 'pec', 'prerr_char', <<-'TXT', uuid: '1C9C63B7-23F6-4325-A8DD-0A65124E7A87'
prerr_char ${1:'${2:ch}'}$0
TXT

  tab 'pee', 'prerr_endline', <<-'TXT', uuid: 'A46DCCC8-C93A-46FD-B992-A37CC97B2B0C'
prerr_endline ${1:"${2:str}"}$0
TXT

  tab 'pef', 'prerr_float', <<-'TXT', uuid: 'D258076A-BCD0-4CCB-977E-132DB888A514'
prerr_float ${1:f}$0
TXT

  tab 'pei', 'prerr_int', <<-'TXT', uuid: '8939B4B2-0512-4CF9-BF33-3A6E6DD53471'
prerr_int ${1:i}$0
TXT

  tab 'pen', 'prerr_newline', <<-'TXT', uuid: '1761D6FD-97FB-4DAF-B8CC-8C4717F62864'
prerr_newline ()${1:;}$0
TXT

  tab 'pes', 'prerr_string', <<-'TXT', uuid: 'B1E4AB5E-AB97-4314-9BE6-6372B750901D'
prerr_string ${1:"${2:str}"}$0
TXT

  tab 'pf', 'print_float', <<-'TXT', uuid: 'CB7ABA48-CDE6-4C72-A5CC-59B9F1CE7F42'
print_float ${1:f}$0
TXT

  tab 'pi', 'print_int', <<-'TXT', uuid: '405A9A3D-D832-4651-A1A7-86437AE2DC11'
print_int ${1:i}$0
TXT

  tab 'pn', 'print_newline', <<-'TXT', uuid: '0EBF01CA-0434-44DE-A90F-4AC8E6BD978A'
print_newline ()${1:;}$0
TXT

  tab 'posi', 'pos_in', <<-'TXT', uuid: 'F508879B-C42A-4984-BE8B-2F8196D67CAE'
pos_in ${1:in_channel}$0
TXT

  tab 'poso', 'pos_out', <<-'TXT', uuid: '5AE52B99-89A7-497D-A4EF-9BD7738FB3D8'
pos_out ${1:out_channel}$0
TXT

  tab 'Printexc.', 'Printexc.catch', <<-'TXT', uuid: '271067D4-756B-11D9-83BC-000A95AFE286'
Printexc.catch ${1:fn} ${x}$0
TXT

  tab 'Printexc.', 'Printexc.print', <<-'TXT', uuid: '16144D33-756B-11D9-83BC-000A95AFE286'
Printexc.print ${1:fn} ${2:x}$0
TXT

  tab 'Printexc.', 'Printexc.to_string', <<-'TXT', uuid: 'F9DD7572-756A-11D9-83BC-000A95AFE286'
Printexc.to_string ${1:exn}$0
TXT

  tab 'Printf.', 'Printf.bprintf', <<-'TXT', uuid: '88F9187D-756B-11D9-83BC-000A95AFE286'
Printf.fprintf ${1:buf} ${2:"${3:format}"} ${4:args}$0
TXT

  tab 'Printf.', 'Printf.eprintf', <<-'TXT', uuid: '77F0BE01-756B-11D9-83BC-000A95AFE286'
Printf.eprintf ${1:"${2:format}"} ${3:args}$0
TXT

  tab 'Printf.', 'Printf.fprintf', <<-'TXT', uuid: '3251597C-756B-11D9-83BC-000A95AFE286'
Printf.fprintf ${1:oc} ${2:"${3:format}"} ${4:args}$0
TXT

  tab 'Printf.', 'Printf.kprintf', <<-'TXT', uuid: '897200F3-756B-11D9-83BC-000A95AFE286'
Printf.kprintf ${1:k} ${2:"${3:format}"} ${4:args}$0
TXT

  tab 'Printf.', 'Printf.printf', <<-'TXT', uuid: '6426D4BB-756B-11D9-83BC-000A95AFE286'
Printf.printf ${1:"${2:format}"} ${3:args}$0
TXT

  tab 'Printf.', 'Printf.sprintf', <<-'TXT', uuid: '78B2D5D5-756B-11D9-83BC-000A95AFE286'
Printf.sprintf ${1:"${2:format}"} ${3:args}$0
TXT

  tab 'ps', 'print_string', <<-'TXT', uuid: 'E133BC37-A8C7-4A64-8B59-A11C7468A449'
print_string ${1:"${2:str}"}$0
TXT

  tab 'Queue.', 'Queue.add', <<-'TXT', uuid: 'E0128F3D-756B-11D9-A861-000A95AFE286'
Queue.add ${1:x} ${2:q}$0
TXT

  tab 'Queue.', 'Queue.clear', <<-'TXT', uuid: '1726C9EE-756C-11D9-A861-000A95AFE286'
Queue.clear ${1:q}$0
TXT

  tab 'Queue.', 'Queue.copy', <<-'TXT', uuid: '17860332-756C-11D9-A861-000A95AFE286'
Queue.copy ${1:q}$0
TXT

  tab 'Queue.', 'Queue.fold', <<-'TXT', uuid: '81E6C26F-756C-11D9-A861-000A95AFE286'
Queue.fold ${1:(fun ${2:b} ${3:v} -> ${4:})} ${5:base} ${6:q}$0
TXT

  tab 'Queue.', 'Queue.is_empty', <<-'TXT', uuid: '1804F65A-756C-11D9-A861-000A95AFE286'
Queue.is_empty ${1:q}$0
TXT

  tab 'Queue.', 'Queue.iter', <<-'TXT', uuid: '6AF38A18-756C-11D9-A861-000A95AFE286'
Queue.iter ${1:(fun ${2:x} -> ${3:})} ${4:q}$0
TXT

  tab 'Queue.', 'Queue.length', <<-'TXT', uuid: '188C73F9-756C-11D9-A861-000A95AFE286'
Queue.length ${1:q}$0
TXT

  tab 'Queue.', 'Queue.peek', <<-'TXT', uuid: '165FD415-756C-11D9-A861-000A95AFE286'
Queue.peek ${1:q}$0
TXT

  tab 'Queue.', 'Queue.pop', <<-'TXT', uuid: '08610DEA-756C-11D9-A861-000A95AFE286'
Queue.pop ${1:q}$0
TXT

  tab 'Queue.', 'Queue.push', <<-'TXT', uuid: 'F2ADA742-756B-11D9-A861-000A95AFE286'
Queue.push ${1:x} ${2:q}$0
TXT

  tab 'Queue.', 'Queue.take', <<-'TXT', uuid: 'FE64EEE2-756B-11D9-A861-000A95AFE286'
Queue.take ${1:q}$0
TXT

  tab 'Queue.', 'Queue.top', <<-'TXT', uuid: '16C2B41A-756C-11D9-A861-000A95AFE286'
Queue.top ${1:q}$0
TXT

  tab 'Queue.', 'Queue.transfer', <<-'TXT', uuid: '95292BDE-756C-11D9-A861-000A95AFE286'
Queue.transfer ${1:q1} ${2:q2}$0
TXT

  tab 'raise', 'Raise an exception', <<-'TXT', uuid: '4A6B4B90-3E2F-489B-9E9A-5DE8C2F139EE'
raise (${1:exn}$0)
TXT

  tab 'Random.', 'Random.float', <<-'TXT', uuid: '293E07AC-756D-11D9-A861-000A95AFE286'
Random.float ${1:max}$0
TXT

  tab 'Random.', 'Random.full_init', <<-'TXT', uuid: 'C39E6756-756C-11D9-A861-000A95AFE286'
Random.full_init ${1:[|${2:seed}|]}$0
TXT

  tab 'Random.', 'Random.init', <<-'TXT', uuid: 'B0A55168-756C-11D9-A861-000A95AFE286'
Random.init ${1:seed}$0
TXT

  tab 'Random.', 'Random.int', <<-'TXT', uuid: 'F8A4B486-756C-11D9-A861-000A95AFE286'
Random.int ${1:max}$0
TXT

  tab 'Random.', 'Random.int32', <<-'TXT', uuid: '09DDCE05-756D-11D9-A861-000A95AFE286'
Random.int32 ${1:max}$0
TXT

  tab 'Random.', 'Random.int64', <<-'TXT', uuid: '14EA2984-756D-11D9-A861-000A95AFE286'
Random.int64 ${1:max}$0
TXT

  tab 'Random.', 'Random.nativeint', <<-'TXT', uuid: '14280F90-756D-11D9-A861-000A95AFE286'
Random.nativeint ${1:max}$0
TXT

  tab 'Random.', 'Random.set_state', <<-'TXT', uuid: '4E6E4926-756D-11D9-A861-000A95AFE286'
Random.set_state ${1:state}$0
TXT

  tab 'rf', 'read_float', <<-'TXT', uuid: 'A3A0B5CD-01D2-48DB-9232-80327CF56259'
read_float ()${1:;}$0
TXT

  tab 'ri', 'read_int', <<-'TXT', uuid: 'EE4302F5-07EA-4CB7-8C85-8FF048B61D89'
read_int ()${1:;}$0
TXT

  tab 'rinp', 'really_input', <<-'TXT', uuid: 'C7D0B6BB-AF69-4F2D-B260-CEC925CDE095'
really_input ${1:in_channel} ${2:buf} ${3:pos} ${4:len}$0
TXT

  tab 'rl', 'read_line', <<-'TXT', uuid: 'DE927E47-1127-480C-B95B-94C68CDE9273'
read_line ()${1:;}$0
TXT

  tab 'Scanf.', 'Scanf.bscanf', <<-'TXT', uuid: 'F3384DD9-758B-11D9-8C3A-003065F3078C'
Scanf.bscanf ${1:sbuf} ${2:"${3:format}"} ${4:f}$0
TXT

  tab 'Scanf.', 'Scanf.fscanf', <<-'TXT', uuid: '1E90BA3C-758C-11D9-8C3A-003065F3078C'
Scanf.fscanf ${1:ic} ${2:"${3:format}"} ${4:f}$0
TXT

  tab 'Scanf.', 'Scanf.kscanf', <<-'TXT', uuid: '5CB5CB48-758C-11D9-8C3A-003065F3078C'
Scanf.bscanf ${1:sbuf} ${2:ef} ${3:"${4:format}"} ${5:f}$0
TXT

  tab 'Scanf.', 'Scanf.scanf', <<-'TXT', uuid: '3E61268A-758C-11D9-8C3A-003065F3078C'
Scanf.scanf ${1:"${2:format}"} ${3:f}$0
TXT

  tab 'Scanf.', 'Scanf.sscanf', <<-'TXT', uuid: '2F8DDB18-758C-11D9-8C3A-003065F3078C'
Scanf.sscanf ${1:str} ${2:"${3:format}"} ${4:f}$0
TXT

  tab 'Scanf.Scanning.', 'Scanf.Scanning.beginning_of_input', <<-'TXT', uuid: '8DC8E1AA-758B-11D9-8C3A-003065F3078C'
Scanf.Scanning.beggining_of_input ${1:sbuf}$0
TXT

  tab 'Scanf.Scanning.', 'Scanf.Scanning.end_of_input', <<-'TXT', uuid: '7808AFA5-758B-11D9-8C3A-003065F3078C'
Scanf.Scanning.end_of_input ${1:sbuf}$0
TXT

  tab 'Scanf.Scanning.', 'Scanf.Scanning.from_channel', <<-'TXT', uuid: '69D2662C-758B-11D9-8C3A-003065F3078C'
Scanf.Scanning.from_channel ${1:ic}$0
TXT

  tab 'Scanf.Scanning.', 'Scanf.Scanning.from_file', <<-'TXT', uuid: '43D420B1-758B-11D9-8C3A-003065F3078C'
Scanf.Scanning.from_file ${1:"${2:fname}"}$0
TXT

  tab 'Scanf.Scanning.', 'Scanf.Scanning.from_file_bin', <<-'TXT', uuid: '52727C6C-758B-11D9-8C3A-003065F3078C'
Scanf.Scanning.from_file_bin ${1:"${2:fname}"}$0
TXT

  tab 'Scanf.Scanning.', 'Scanf.Scanning.from_function', <<-'TXT', uuid: '5CF98890-758B-11D9-8C3A-003065F3078C'
Scanf.Scanning.from_function ${1:f}$0
TXT

  tab 'Scanf.Scanning.', 'Scanf.Scanning.from_string', <<-'TXT', uuid: '31B44ED2-758B-11D9-8C3A-003065F3078C'
Scanf.Scanning.from_string ${1:str}$0
TXT

  tab 'seeki', 'seek_in', <<-'TXT', uuid: '14AC0011-69E8-440E-B111-C03A6684F1F3'
seek_in ${1:in_channel} ${2:pos}$0
TXT

  tab 'seeko', 'seek_out', <<-'TXT', uuid: '01A4120C-E2A7-4C8B-909D-D458D9FF9666'
seek_out ${1:out_channel} ${2:pos}$0
TXT

  tab 'Set.', 'Set.Make', <<-'TXT', uuid: '78CF554F-758C-11D9-8C3A-003065F3078C'
Set.Make ${1:(${2:Ord} : OrderedType)}$0
TXT

  tab 'setbini', 'set_binary_mode_in', <<-'TXT', uuid: 'B1AB5F97-1ABC-4AC9-B47C-730243099D87'
set_binary_mode_in ${1:in_channel} ${2:true}$0
TXT

  tab 'setbino', 'set_binary_mode_out', <<-'TXT', uuid: 'C7F6BBA1-0D8D-4C41-A1C2-E4A296D9DBBF'
set_binary_mode_out ${1:out_channel} ${2:true}$0
TXT

  tab 'sob', 'string_of_bool', <<-'TXT', uuid: 'D48F1FD3-6B21-473F-B460-E142F067A7B0'
string_of_bool ${1:b}$0
TXT

  tab 'sof', 'string_of_float', <<-'TXT', uuid: '69D0EF0D-2204-4448-BEAC-D424CD2D736A'
string_of_bool ${1:f}$0
TXT

  tab 'sofm', 'string_of_format', <<-'TXT', uuid: '1732DC57-42EF-4B0C-AA6F-BB832BAEC3D3'
string_of_format ${1:"${2:fmt}"}$0
TXT

  tab 'soi', 'string_of_int', <<-'TXT', uuid: 'C06547CB-78F0-4AC2-9292-742A261C2902'
string_of_int ${1:i}$0
TXT

  tab 'Sort.', 'Sort.array', <<-'TXT', uuid: 'A8AAAC5C-758C-11D9-8C3A-003065F3078C'
Sort.array ${1:compare} ${2:arr}$0
TXT

  tab 'Sort.', 'Sort.list', <<-'TXT', uuid: '92D1F0E4-758C-11D9-8C3A-003065F3078C'
Sort.list ${1:compare} ${2:lst}$0
TXT

  tab 'Sort.', 'Sort.merge', <<-'TXT', uuid: 'AAC08AF8-758C-11D9-8C3A-003065F3078C'
Sort.merge ${1:compare} ${2:lst1} ${3:lst2}$0
TXT

  tab 'Stack.', 'Stack.clear', <<-'TXT', uuid: '0E3918C3-758D-11D9-8C3A-003065F3078C'
Stack.clear ${1:stk}$0
TXT

  tab 'Stack.', 'Stack.copy', <<-'TXT', uuid: '0F84092F-758D-11D9-8C3A-003065F3078C'
Stack.copy ${1:stk}$0
TXT

  tab 'Stack.', 'Stack.is_empty', <<-'TXT', uuid: '105999BA-758D-11D9-8C3A-003065F3078C'
Stack.is_empty ${1:stk}$0
TXT

  tab 'Stack.', 'Stack.iter', <<-'TXT', uuid: '3FBE9DDC-758D-11D9-8C3A-003065F3078C'
Stack.iter ${1:(fun ${2:x} -> ${3:})} ${4:stk}$0
TXT

  tab 'Stack.', 'Stack.length', <<-'TXT', uuid: '11353EF1-758D-11D9-8C3A-003065F3078C'
Stack.length ${1:stk}$0
TXT

  tab 'Stack.', 'Stack.pop', <<-'TXT', uuid: 'FC2A7554-758C-11D9-8C3A-003065F3078C'
Stack.pop ${1:stk}$0
TXT

  tab 'Stack.', 'Stack.push', <<-'TXT', uuid: 'E97C4BE8-758C-11D9-8C3A-003065F3078C'
Stack.push ${1:x} ${2:stk}$0
TXT

  tab 'Stack.', 'Stack.top', <<-'TXT', uuid: '0D1A335E-758D-11D9-8C3A-003065F3078C'
Stack.top ${1:stk}$0
TXT

  tab 'Stream.', 'Stream.count', <<-'TXT', uuid: 'C6EA9117-758D-11D9-8C3A-003065F3078C'
Stream.count ${1:stream}$0
TXT

  tab 'Stream.', 'Stream.empty', <<-'TXT', uuid: 'B8928976-758D-11D9-8C3A-003065F3078C'
Stream.empty ${1:stream}$0
TXT

  tab 'Stream.', 'Stream.from', <<-'TXT', uuid: '6764FDF9-758D-11D9-8C3A-003065F3078C'
Stream.from ${1:f}$0
TXT

  tab 'Stream.', 'Stream.iter', <<-'TXT', uuid: '9C9CD06C-758D-11D9-8C3A-003065F3078C'
Stream.iter ${1:(fun ${2:x} -> ${3:})} ${4:stream}$0
TXT

  tab 'Stream.', 'Stream.junk', <<-'TXT', uuid: 'C654DCE3-758D-11D9-8C3A-003065F3078C'
Stream.junk ${1:stream}$0
TXT

  tab 'Stream.', 'Stream.next', <<-'TXT', uuid: 'ACF09C9A-758D-11D9-8C3A-003065F3078C'
Stream.next ${1:stream}$0
TXT

  tab 'Stream.', 'Stream.npeek', <<-'TXT', uuid: 'E06F8F79-758D-11D9-8C3A-003065F3078C'
Stream.npeek ${1:n} ${2:stream}$0
TXT

  tab 'Stream.', 'Stream.of_channel', <<-'TXT', uuid: '84DE69D1-758D-11D9-8C3A-003065F3078C'
Stream.of_channel ${1:ic}$0
TXT

  tab 'Stream.', 'Stream.of_list', <<-'TXT', uuid: '762F4E3C-758D-11D9-8C3A-003065F3078C'
Stream.of_list ${1:lst}$0
TXT

  tab 'Stream.', 'Stream.of_string', <<-'TXT', uuid: '842D58CA-758D-11D9-8C3A-003065F3078C'
Stream.of_string ${1:str}$0
TXT

  tab 'Stream.', 'Stream.peek', <<-'TXT', uuid: 'C59F494A-758D-11D9-8C3A-003065F3078C'
Stream.peek ${1:stream}$0
TXT

  tab 'String.', 'String.blit', <<-'TXT', uuid: '6D9E0219-758E-11D9-8C3A-003065F3078C'
String.blit ${1:src} ${2:srcoff} ${3:dest} ${4:destoff} ${5:len}$0
TXT

  tab 'String.', 'String.capitalize', <<-'TXT', uuid: '6E23A0C2-758F-11D9-8C3A-003065F3078C'
String.capitalize ${1:str}$0
TXT

  tab 'String.', 'String.compare', <<-'TXT', uuid: '84BED911-758F-11D9-8C3A-003065F3078C'
String.compare ${1:${2:str1} ${3:str2}}$0
TXT

  tab 'String.', 'String.concat', <<-'TXT', uuid: '953E4692-758E-11D9-8C3A-003065F3078C'
String.concat ${1:sep} ${2:strlst}$0
TXT

  tab 'String.', 'String.contains', <<-'TXT', uuid: '2F9E8ECA-758F-11D9-8C3A-003065F3078C'
String.contains ${1:str} ${2:ch}$0
TXT

  tab 'String.', 'String.contains_from', <<-'TXT', uuid: '3EE138F0-758F-11D9-8C3A-003065F3078C'
String.contains_from ${1:str} ${2:start} ${3:'${4:ch}'}$0
TXT

  tab 'String.', 'String.copy', <<-'TXT', uuid: '3AFDE4D4-758E-11D9-8C3A-003065F3078C'
String.copy ${1:str}$0
TXT

  tab 'String.', 'String.create', <<-'TXT', uuid: '22F9010E-758E-11D9-8C3A-003065F3078C'
String.create ${1:len}$0
TXT

  tab 'String.', 'String.escaped', <<-'TXT', uuid: 'E6B038BA-758E-11D9-8C3A-003065F3078C'
String.escaped ${1:str}$0
TXT

  tab 'String.', 'String.fill', <<-'TXT', uuid: '5B1336CB-758E-11D9-8C3A-003065F3078C'
String.fill ${1:str} ${2:start} ${3:len} ${4:'${5:ch}'}$0
TXT

  tab 'String.', 'String.get', <<-'TXT', uuid: 'FF7C999E-758D-11D9-8C3A-003065F3078C'
String.get ${1:str} ${2:n}$0
TXT

  tab 'String.', 'String.index', <<-'TXT', uuid: 'F15952E5-758E-11D9-8C3A-003065F3078C'
String.index ${1:str} ${2:'${3:ch}'}$0
TXT

  tab 'String.', 'String.index_from', <<-'TXT', uuid: '0DC30145-758F-11D9-8C3A-003065F3078C'
String.index_from ${1:str} ${2:start} ${3:'${4:ch}'}$0
TXT

  tab 'String.', 'String.iter', <<-'TXT', uuid: 'BDF8C792-758E-11D9-8C3A-003065F3078C'
String.iter ${1:(fun ${2:c} -> ${3:})} ${4:str}$0
TXT

  tab 'String.', 'String.length', <<-'TXT', uuid: 'F0BB8AF2-758D-11D9-8C3A-003065F3078C'
String.length ${1:str}$0
TXT

  tab 'String.', 'String.lowercase', <<-'TXT', uuid: '6207D4B6-758F-11D9-8C3A-003065F3078C'
String.lowercase ${1:str}$0
TXT

  tab 'String.', 'String.make', <<-'TXT', uuid: '2EE28DDF-758E-11D9-8C3A-003065F3078C'
String.make ${1:len} ${2:'${3:ch}'}$0
TXT

  tab 'String.', 'String.rcontains_from', <<-'TXT', uuid: '4F412914-758F-11D9-8C3A-003065F3078C'
String.rcontains_from ${1:str} ${2:start} ${3:'${4:ch}'}$0
TXT

  tab 'String.', 'String.rindex', <<-'TXT', uuid: '03A643B7-758F-11D9-8C3A-003065F3078C'
String.rindex ${1:str} ${2:'${3:ch}'}$0
TXT

  tab 'String.', 'String.rindex_from', <<-'TXT', uuid: '238D7310-758F-11D9-8C3A-003065F3078C'
String.rindex_from ${1:str} ${2:start} ${3:'${4:ch}'}$0
TXT

  tab 'String.', 'String.set', <<-'TXT', uuid: '0D75D08C-758E-11D9-8C3A-003065F3078C'
String.set ${1:str} ${2:n} ${3:'${4:ch}'}$0
TXT

  tab 'String.', 'String.sub', <<-'TXT', uuid: '4850A5A0-758E-11D9-8C3A-003065F3078C'
String.sub ${1:str} ${2:start} ${3:len}$0
TXT

  tab 'String.', 'String.uncapitalize', <<-'TXT', uuid: '7CCC4626-758F-11D9-8C3A-003065F3078C'
String.uncapitalize ${1:str}$0
TXT

  tab 'String.', 'String.uppercase', <<-'TXT', uuid: '58571CEA-758F-11D9-8C3A-003065F3078C'
String.uppercase ${1:str}$0
TXT

  tab 'Sys.', 'Sys.catch_break', <<-'TXT', uuid: 'C428DEA0-7592-11D9-8C3A-003065F3078C'
Sys.catch_break ${1:true}$0
TXT

  tab 'Sys.', 'Sys.chdir', <<-'TXT', uuid: '1D9E7095-7590-11D9-8C3A-003065F3078C'
Sys.chdir ${1:"${2:new_dir}"}$0
TXT

  tab 'Sys.', 'Sys.command', <<-'TXT', uuid: '02F58D52-7590-11D9-8C3A-003065F3078C'
Sys.command ${1:${2:cmd}"}$0
TXT

  tab 'Sys.', 'Sys.file_exists', <<-'TXT', uuid: 'ABD74F5A-758F-11D9-8C3A-003065F3078C'
Sys.file_exists ${1:"${2:fname}"}$0
TXT

  tab 'Sys.', 'Sys.getenv', <<-'TXT', uuid: 'E31A99FC-758F-11D9-8C3A-003065F3078C'
Sys.getenv ${1:"${2:env_var}"}$0
TXT

  tab 'Sys.', 'Sys.readdir', <<-'TXT', uuid: '401595B7-7590-11D9-8C3A-003065F3078C'
Sys.readdir ${1:"${2:dirname}"}$0
TXT

  tab 'Sys.', 'Sys.remove', <<-'TXT', uuid: 'BBC9F2AE-758F-11D9-8C3A-003065F3078C'
Sys.remove ${1:"${2:fname}"}$0
TXT

  tab 'Sys.', 'Sys.rename', <<-'TXT', uuid: 'C5755EB6-758F-11D9-8C3A-003065F3078C'
Sys.rename ${1:"${2:old_fname}"} ${3:"${4:new_fname}"}$0
TXT

  tab 'Sys.', 'Sys.set_signal', <<-'TXT', uuid: 'B01C662C-A6D9-402E-B7D4-577E2683E2D9'
Sys.set_signal ${1:sig} ${2:behavior}$0
TXT

  tab 'Sys.', 'Sys.signal', <<-'TXT', uuid: '3D8C5704-7591-11D9-8C3A-003065F3078C'
Sys.signal ${1:sig} ${2:behavior}$0
TXT

  tab 'Sys.', 'Sys.Signal_default', <<-'TXT', uuid: '5DA754BF-7591-11D9-8C3A-003065F3078C', file: 'Sys.signal_default'
Sys.Signal_default
TXT

  tab 'Sys.', 'Sys.Signal_handle', <<-'TXT', uuid: '69E06F97-7591-11D9-8C3A-003065F3078C', file: 'Sys.signal_handle'
Sys.Signal_handle ${1:handler}$0
TXT

  tab 'Sys.', 'Sys.Signal_ignore', <<-'TXT', uuid: '68DD42DE-7591-11D9-8C3A-003065F3078C', file: 'Sys.signal_ignore'
Sys.Signal_ignore
TXT

  tab 'Weak.', 'Weak.blit', <<-'TXT', uuid: '75F53A98-7593-11D9-8C3A-003065F3078C'
Weak.blit ${1:w_src} ${2:srcoff} ${3:w_dst} ${4:dstoff} ${5:len}$0
TXT

  tab 'Weak.', 'Weak.check', <<-'TXT', uuid: '47A29F13-7593-11D9-8C3A-003065F3078C'
Weak.check ${1:w_arr} ${2:n}$0
TXT

  tab 'Weak.', 'Weak.create', <<-'TXT', uuid: 'E7EB33F4-7592-11D9-8C3A-003065F3078C'
Weak.create ${1:n}$0
TXT

  tab 'Weak.', 'Weak.fill', <<-'TXT', uuid: '5431FC40-7593-11D9-8C3A-003065F3078C'
Weak.fill ${w_arr} ${2:ofs} ${3:len} ${4:len} ${5:el}$0
TXT

  tab 'Weak.', 'Weak.get', <<-'TXT', uuid: '2BE59DC7-7593-11D9-8C3A-003065F3078C'
Weak.get ${1:w_arr} ${2:n}$0
TXT

  tab 'Weak.', 'Weak.get_copy', <<-'TXT', uuid: '3A83AC65-7593-11D9-8C3A-003065F3078C'
Weak.get_copy ${1:w_arr} ${2:n}$0
TXT

  tab 'Weak.', 'Weak.length', <<-'TXT', uuid: 'FD3EB2AC-7592-11D9-8C3A-003065F3078C'
Weak.length ${1:w_arr}$0
TXT

  tab 'Weak.', 'Weak.Make', <<-'TXT', uuid: 'A5AB8A36-7593-11D9-8C3A-003065F3078C'
Weak.Make ${1:(${2:H} : Hashtbl.HashedType)}$0
TXT

  tab 'Weak.', 'Weak.set', <<-'TXT', uuid: '0D877B63-7593-11D9-8C3A-003065F3078C'
Weak.set ${1:w_arr} ${2:n} ${3:el}$0
TXT

  tab 'xi', 'close_in', <<-'TXT', uuid: '45082B85-5533-4BF6-803B-E5F709A5AD16'
close_in ${1:in_channel}$0
TXT

  tab 'xix', 'close_in_noerr', <<-'TXT', uuid: 'CDDDFC61-703F-47DE-8872-360A7285E707'
close_in_noerr ${1:in_channel}$0
TXT

  tab 'xo', 'close_out', <<-'TXT', uuid: 'B4EA5CEC-B7DA-4416-BF2E-681BEC07FB31'
close_out ${1:out_channel}$0
TXT

  tab 'xox', 'close_out_noerr', <<-'TXT', uuid: '4EB38DCE-2C7C-49F5-9F73-6FB9CBC66DDB'
close_out_noerr ${1:out_channel}$0
TXT

end