# encoding: utf-8

snippets do

  default_scope 'source.ocaml'
  file_format :textmate

  tab 'arith', 'arith_status', <<-'TXT', uuid: '04AA91DB-5A3C-4CC4-92D0-C79C0E74CC8A'
arith_status ()${1:;}$0
TXT

  tab 'arith', 'get_approx_printing', <<-'TXT', uuid: 'B1D28B7C-AA9B-4704-87AD-07DBBA68AF8E'
get_approx_printing ()
TXT

  tab 'arith', 'get_error_when_null_denominator', <<-'TXT', uuid: '5E46C172-0AF6-41F0-A4CE-170B72629985'
get_error_when_null_denominator ()
TXT

  tab 'arith', 'get_floating_precision', <<-'TXT', uuid: '65A11682-8015-4736-B48F-455AEE4E75C7'
get_floating_precision ()
TXT

  tab 'arith', 'get_normalize_ratio', <<-'TXT', uuid: '184354A2-02BF-4D14-A9B9-630FD0CD5DCF'
get_normalize_ratio ()
TXT

  tab 'arith', 'get_normalize_ratio_when_printing', <<-'TXT', uuid: '92231CB6-E702-43C4-9EEE-C5648BB2A482'
get_normalize_ratio_when_printing ()
TXT

  tab 'arith', 'set_approx_printing', <<-'TXT', uuid: '4F1A768E-BC8B-4F14-AD2C-6B88581F34AD'
set_approx_printing ${1:true}${2:;}$0
TXT

  tab 'arith', 'set_error_when_null_denominator', <<-'TXT', uuid: 'A3C9137B-06AD-4FEE-8CD1-C023964C4F6A'
set_error_when_null_denominator ${1:true}${2:;}$0
TXT

  tab 'arith', 'set_floating_precision', <<-'TXT', uuid: 'CBD5B004-265A-47CF-96AB-55233A3C470F'
set_floating_precision ${1:precision}${2:;}$0
TXT

  tab 'arith', 'set_normalize_ratio', <<-'TXT', uuid: '987BD2D1-13E4-4C7F-9CE2-22957D6146C1'
set_normalize_ratio ${1:true}${2:;}$0
TXT

  tab 'arith', 'set_normalize_ratio_when_printing', <<-'TXT', uuid: '69ACAB6B-06BE-4472-B95C-18AEB6352771'
set_normalize_ratio_when_printing ${1:true}${2:;}$0
TXT

  tab 'Array1.', 'blit', <<-'TXT', uuid: 'F37EB2C5-FD28-433D-8C78-BB8FA048A05A', file: 'blit 2'
Array1.blit ${1:src_bigarraay} ${2:dest_bigarray}$0
TXT

  tab 'Array1.', 'create', <<-'TXT', uuid: '9CD664F3-F208-4526-96F2-6B660B410190', file: 'create 6'
Array1.create BA.kind$0 ${1:fortran}-layout ${2:dim}
TXT

  tab 'Array1.', 'dim', <<-'TXT', uuid: 'DB8D9C5F-4975-4170-B8E9-55A4A98C4735'
Array1.dim ${1:bigarraay}$0
TXT

  tab 'Array1.', 'get', <<-'TXT', uuid: 'E1CFC1C2-3C6D-4EA6-8388-0E1CA40531A1', file: 'get 4'
Array1.get ${1:bigarraay} ${2:idx}$0
TXT

  tab 'Array1.', 'kind', <<-'TXT', uuid: '19622A76-6B14-4B72-B912-1074D4891F53', file: 'kind 3'
Array1.kind ${1:bigarraay}$0
TXT

  tab 'Array1.', 'layout', <<-'TXT', uuid: 'E4CBB9A1-D237-4745-9CDE-62012EC1535D', file: 'layout 4'
Array1.layout ${1:bigarraay}$0
TXT

  tab 'Array1.', 'map_file', <<-'TXT', uuid: '00469E67-82AD-4820-AB32-8D8F9D1BF3E3'
Array1.map_file ${1:Unix.file_descr} BA.kind$0 ${2:fortran}_layout${3:shared} ${4:dim}
TXT

  tab 'Array1.', 'of_array', <<-'TXT', uuid: '8C01370B-5570-4A0A-9A78-6DC3172F0D2E', file: 'of_array 3'
Array1.of_array BA.kind$0 ${1:fortran}_layout ${2:src_array}
TXT

  tab 'Array1.', 'set', <<-'TXT', uuid: '0701A974-8DB3-470E-AB7C-C4206EB7043C'
Array1.set ${1:bigarraay} ${2:idx} ${3:value}${4:;}$0
TXT

  tab 'Array1.', 'sub', <<-'TXT', uuid: '776B2524-47FD-45AE-BE4A-B068BFD9E361'
Array1.sub ${1:bigarraay} ${2:offset} ${3:len}$0
TXT

  tab 'Array2.', 'blit', <<-'TXT', uuid: '9EA1FFE8-4B5E-493E-A06F-0F330264CC94'
Array2.blit ${1:src_bigarray} ${2:dest_bigarray}$0
TXT

  tab 'Array2.', 'create', <<-'TXT', uuid: '2868281D-C000-4AF4-A451-458A4B326F3A', file: 'create 3'
Array2.create BA.kind$0 ${1:fortran}-layout ${2:dim1} ${3:dim2}
TXT

  tab 'Array2.', 'dim1', <<-'TXT', uuid: 'B6A9F704-D0BA-4952-B416-1524EF5E2A7B'
Array2.dim1 ${1:bigarray}$0
TXT

  tab 'Array2.', 'dim2', <<-'TXT', uuid: '864787B3-7F2D-41AF-B53E-DDD7D5248B90', file: 'dim2 2'
Array2.dim2 ${1:bigarray}$0
TXT

  tab 'Array2.', 'fill', <<-'TXT', uuid: 'C5C392B8-B3F9-41E5-AF73-40EC2AF1A791', file: 'fill 3'
Array2.fill ${1:bigarray} ${2:value}$0
TXT

  tab 'Array2.', 'get', <<-'TXT', uuid: 'E510D3FA-6FB3-4826-A82F-F34EDE90F5A1', file: 'get 3'
Array2.get ${1:bigarray} ${2:idx1} ${3:idx2}$0
TXT

  tab 'Array2.', 'kind', <<-'TXT', uuid: 'BCF17D91-55C8-4C1E-95E4-233C11C319BC', file: 'kind 4'
Array2.kind ${1:bigarray}$0
TXT

  tab 'Array2.', 'layout', <<-'TXT', uuid: '0AF36A57-3047-415D-A178-77B2CDC96ABB'
Array2.layout ${1:bigarray}$0
TXT

  tab 'Array2.', 'map_file', <<-'TXT', uuid: '85B435B3-471F-4418-BBF2-F84D05E7AC0B', file: 'map_file 2'
Array2.map_file ${1:Unix.file_descr} BA.kind$0 ${2:fortran}_layout${3:shared} ${4:dim1} ${5:dim2}
TXT

  tab 'Array2.', 'of_array', <<-'TXT', uuid: 'FAA0C594-4514-4201-A484-5CE3D50F5C7E', file: 'of_array 2'
Array2.of_array BA.kind$0 ${1:fortran}_layout ${2:src_array}
TXT

  tab 'Array2.', 'set', <<-'TXT', uuid: 'FC4DE385-CC8A-4DF0-BB97-43F1BF226106', file: 'set 4'
Array2.set ${1:bigarray} ${2:idx1} ${3:idx2} ${4:value}${5:;}$0
TXT

  tab 'Array2.', 'slice_left (C layout only)', <<-'TXT', uuid: '6530B9E8-D1BD-4AFF-8C71-5736685AE308', file: 'slice_left (C layout only) 2'
Array2.slice_left ${1:bigarray} ${2:idx}$0
TXT

  tab 'Array2.', 'slice_right (Fortran layout only)', <<-'TXT', uuid: '026577EE-A376-4421-BBA6-3AEE4DC1AC81', file: 'slice_right (Fortran layout only) 2'
Array2.slice_right ${1:bigarray} ${2:idx}$0
TXT

  tab 'Array2.', 'sub_left (C layout only)', <<-'TXT', uuid: '033FD85F-D61A-4BAF-8D20-CF8224459302'
Array2.sub_left ${1:bigarray} ${2:offset} ${3:len}$0
TXT

  tab 'Array2.', 'sub_right (Fortran layout only)', <<-'TXT', uuid: '97BB3F71-55C0-4395-B3FA-C06AF31DF646', file: 'sub_right (Fortran layout only) 2'
Array2.sub_right ${1:bigarray} ${2:offset} ${3:len}$0
TXT

  tab 'Array3.', 'blit', <<-'TXT', uuid: '33B8659C-19C8-4B4E-AAB9-0925DA30696C', file: 'blit 4'
Array3.blit ${1:src_bigarray} ${2:dest_bigarray}$0
TXT

  tab 'Array3.', 'create', <<-'TXT', uuid: '073A7E46-D618-4292-8A9C-5F4D7C4A167F', file: 'create 4'
Array3.create BA.kind$0 ${1:fortran}-layout ${2:dim1} ${3:dim2} ${4:dim3}
TXT

  tab 'Array3.', 'dim1', <<-'TXT', uuid: '667A638B-3A93-4ADD-B933-5B924E893AE0', file: 'dim1 2'
Array3.dim1 ${1:bigarray}$0
TXT

  tab 'Array3.', 'dim2', <<-'TXT', uuid: '55E0F302-034B-4CFD-9298-C9B4F5194558'
Array3.dim2 ${1:bigarray}$0
TXT

  tab 'Array3.', 'dim3', <<-'TXT', uuid: '1A655EB7-2622-4B52-AB8F-486776F68FCC'
Array3.dim3 ${1:bigarray}$0
TXT

  tab 'Array3.', 'fill', <<-'TXT', uuid: 'EEDEC161-006E-4329-A972-2F2225D10E65', file: 'fill 2'
Array3.fill ${1:bigarray} ${2:value}
TXT

  tab 'Array3.', 'get', <<-'TXT', uuid: '2AAA5E43-5BD5-44D9-8F9C-87E3EB61B89C', file: 'get 2'
Array3.get ${1:bigarray} ${2:idx1} ${3:idx2} ${4:idx3}$0
TXT

  tab 'Array3.', 'kind', <<-'TXT', uuid: 'FEF789EF-3352-47E2-B1F3-66E9260E9DA1', file: 'kind 2'
Array3.kind ${1:bigarray}$0
TXT

  tab 'Array3.', 'layout', <<-'TXT', uuid: '96344DB6-A44E-4266-9342-E93128E82210', file: 'layout 3'
Array3.layout ${1:bigarray}$0
TXT

  tab 'Array3.', 'map_file', <<-'TXT', uuid: '3131A077-3FE0-447F-A85D-89F04259BA34', file: 'map_file 4'
Array3.map_file ${1:Unix.file_descr} BA.kind$0 ${2:fortran}_layout${3:shared} ${4:dim1} ${5:dim2} ${6:dim3}
TXT

  tab 'Array3.', 'of_array', <<-'TXT', uuid: '98A9C347-DEF5-4711-AA67-CE66871A2417'
Array3.of_array BA.kind$0 ${1:fortran}_layout ${2:src_array3}
TXT

  tab 'Array3.', 'set', <<-'TXT', uuid: 'F8C2C2D5-BA51-4071-BEAF-1F426B9CE74A', file: 'set 3'
Array3.set ${1:bigarray} ${2:idx1} ${3:idx2} ${4:idx3} ${5:value}${6:;}$0
TXT

  tab 'Array3.', 'slice_left_1 (C layout only)', <<-'TXT', uuid: '28D10272-DD1A-48CA-9F9B-C8D756C0A344'
Array3.slice_left_1 ${1:bigarray} ${2:idx1} ${3:idx2}$0
TXT

  tab 'Array3.', 'slice_left_2 (C layout only)', <<-'TXT', uuid: 'A05CD913-B51A-4995-8A07-D762EF84BCD4'
Array3.slice_left_2 ${1:bigarray} ${2:idx1}$0
TXT

  tab 'Array3.', 'slice_right_1 (Fortran layout only)', <<-'TXT', uuid: '30E714CD-2900-403A-B630-A988D9717D7B'
Array3.slice_right_1 ${1:bigarray} ${2:idx1} ${3:idx2}$0
TXT

  tab 'Array3.', 'slice_right_2 (Fortran layout only)', <<-'TXT', uuid: '7B7580B8-311F-4F21-8017-A42F2706F464'
Array3.slice_right_2 ${1:bigarray} ${2:idx1}$0
TXT

  tab 'Array3.', 'sub_left (C layout only)', <<-'TXT', uuid: '20601C14-52A2-4076-92E4-208816558B37', file: 'sub_left (C layout only) 2'
Array3.sub_left ${1:bigarray} ${2:offset} ${3:len}$0
TXT

  tab 'Array3.', 'sub_right (Fortran layout only)', <<-'TXT', uuid: '3EC2A901-2D32-4554-9ECD-C690200CBBF2', file: 'sub_right (Fortran layout only) 3'
Array3.sub_right ${1:bigarray} ${2:offset} ${3:len}$0
TXT

  tab 'BA.', 'array1_of_genarray', <<-'TXT', uuid: '12080CDA-5A82-4148-8687-B6E411144D37'
array1_of_genarray ${1:genarray1}$0
TXT

  tab 'BA.', 'array2_of_genarray', <<-'TXT', uuid: '53535217-2B91-487A-ACFF-57FD964FD92E'
array2_of_genarray ${1:genarray2}$0
TXT

  tab 'BA.', 'array3_of_genarray', <<-'TXT', uuid: '6F3A61BE-21DF-4830-9385-1BC3D07CF260'
array3_of_genarray ${1:genarray3}$0
TXT

  tab 'BA.', 'c_layout', <<-'TXT', uuid: '30C4BFBD-CA8B-48B3-AD59-47C5DD20AF62'
c_layout
TXT

  tab 'BA.', 'fortran_layout', <<-'TXT', uuid: 'B4B58C32-3ECA-4D8F-9615-1D98DE00C70E'
fortran_layout
TXT

  tab 'BA.', 'genarray_of_array1', <<-'TXT', uuid: 'C7A4E540-5702-49E1-BE6F-7E6A8E714133'
genarray_of_array1 ${1:bigarray1}$0
TXT

  tab 'BA.', 'genarray_of_array2', <<-'TXT', uuid: '83CCE7EB-D5CA-4504-9FE6-4390F78E3F0D'
genarray_of_array2 ${1:bigarray2}$0
TXT

  tab 'BA.', 'genarray_of_array3', <<-'TXT', uuid: '04974658-7D28-4DAC-BAFD-5CBF30247C7B'
genarray_of_array3 ${1:bigarray3}$0
TXT

  tab 'BA.', 'reshape', <<-'TXT', uuid: 'D661F571-B77B-4ECC-B63A-312ECC5F0CB7'
reshape ${1:genarray} ${2:[|${3:new_dim_array;}|]}$0
TXT

  tab 'BA.', 'reshape_1', <<-'TXT', uuid: 'BDAE9736-0D22-4D0F-B5E0-9DC3A229722F'
reshape_1 ${1:genarray} ${2:new_dim}$0
TXT

  tab 'BA.', 'reshape_2', <<-'TXT', uuid: '53085064-2183-472E-9FC1-7973E141C88C'
reshape_2 ${1:genarray} ${2:new_dim1} ${3:new_dim2}$0
TXT

  tab 'BA.', 'reshape_3', <<-'TXT', uuid: '96B4ACD2-35A4-4523-A40A-70C8FE4BA836'
reshape_3 ${1:genarray} ${2:new_dim1} ${3:new_dim2} ${4:new_dim3}$0
TXT

  tab 'BA.kind', 'char', <<-'TXT', uuid: 'C29AF433-90D9-46BC-BCE5-FE3A6521089D'
char
TXT

  tab 'BA.kind', 'complex32', <<-'TXT', uuid: '7AEB7426-A920-4E78-A6A7-FD01E3B1D7A2'
complex32
TXT

  tab 'BA.kind', 'complex64', <<-'TXT', uuid: '5C9C75A5-9433-49A7-81FD-5BA81D3DDC4C'
complex64
TXT

  tab 'BA.kind', 'float32', <<-'TXT', uuid: 'A05DDFB0-0E37-4855-B382-E1547B103FA0'
float32
TXT

  tab 'BA.kind', 'float64', <<-'TXT', uuid: 'CDB25A6F-7E95-4E36-978F-031A5D69E832'
float64
TXT

  tab 'BA.kind', 'int', <<-'TXT', uuid: '08EF7700-E24C-47B9-BA9F-A92C5415BC20'
int
TXT

  tab 'BA.kind', 'int16_signed', <<-'TXT', uuid: '7246AA96-4EE3-447D-ABCE-7036911DC951'
int16_signed
TXT

  tab 'BA.kind', 'int16_unsigned', <<-'TXT', uuid: 'C3B8D837-EF1A-4229-9CA5-00858C8E1BDE'
int16_unsigned
TXT

  tab 'BA.kind', 'int32', <<-'TXT', uuid: '9CAE76F8-96D2-46D5-AF6B-6043786C210F'
int32
TXT

  tab 'BA.kind', 'int64', <<-'TXT', uuid: 'F206FF0B-282A-4DCF-9ABF-C3AAF2BF3BB9'
int64
TXT

  tab 'BA.kind', 'int8_signed', <<-'TXT', uuid: '239FDF95-8C36-4C36-9070-ED19677EE98F'
int8_signed
TXT

  tab 'BA.kind', 'int8_unsigned', <<-'TXT', uuid: '46C892FB-2421-44EE-95F2-24AA7AE7397A'
int8_unsigned
TXT

  tab 'BA.kind', 'nativeint', <<-'TXT', uuid: 'EDF8E4BE-62AA-407C-8BFD-69BF21F60EC6'
nativeint
TXT

  tab 'BA.t', '16-bit signed int', <<-'TXT', uuid: 'E4F58412-A02F-4A3B-A8B5-666919C3B7D1'
int16_signed_elt
TXT

  tab 'BA.t', '16-bit unsigned int', <<-'TXT', uuid: '3C56A960-E538-42DD-832A-9685C8CFC672'
int16_unsigned_elt
TXT

  tab 'BA.t', '31-bit signed int', <<-'TXT', uuid: '985BE4E8-FD7D-4F92-B550-3716FCEACD5C'
int_elt
TXT

  tab 'BA.t', '32-bit complex float', <<-'TXT', uuid: '88CA8F31-CA80-49FB-8A7C-1B9501427858'
complex32_elt
TXT

  tab 'BA.t', '32-bit float', <<-'TXT', uuid: '3BEADCB7-E4E7-4945-9AAE-639C01ADB84E'
float32_elt
TXT

  tab 'BA.t', '32-bit signed int', <<-'TXT', uuid: '8BACD33A-4381-4ED5-A84F-51533747E8BF'
int32_elt
TXT

  tab 'BA.t', '64-bit complex float', <<-'TXT', uuid: 'DF271984-B64B-4AE3-A9D5-4F2755619BA5'
complex64_elt
TXT

  tab 'BA.t', '64-bit float', <<-'TXT', uuid: '9E85BF67-D661-4152-A111-6A1D7F7D1AB2'
float64_elt
TXT

  tab 'BA.t', '64-bit signed int', <<-'TXT', uuid: 'B2937567-2372-454A-AE0F-526C059AA278'
int64_elt
TXT

  tab 'BA.t', '8-bit signed int', <<-'TXT', uuid: 'D1314C34-6752-4722-B0B8-1E1FB7511E2B'
int8_signed_elt
TXT

  tab 'BA.t', '8-bit unsigned int', <<-'TXT', uuid: '93F4BF41-CDD0-4AC2-8974-F087B7A59A09'
int8_unsigned_elt
TXT

  tab 'BA.t', 'Generalized type', <<-'TXT', uuid: '94BBDCF8-A8EE-4A1A-B7E3-634C31E40127'
(${1:'a}, ${2:'b}) kind
TXT

  tab 'BA.t', 'Native sized signed int', <<-'TXT', uuid: '591C9372-68FF-444C-988A-7CB338666034'
nativeint_elt
TXT

  tab 'bi', 'abs_big_int', <<-'TXT', uuid: 'BF2C96E2-EB57-4515-8086-3ACE5983A627'
abs_big_int ${1:bi}$0
TXT

  tab 'bi', 'add_big_int', <<-'TXT', uuid: '32D67D33-FB47-4E2C-B239-07F21FB8F8A0'
add_big_int ${1:bi} ${2:bi2}$0
TXT

  tab 'bi', 'add_int_big_int', <<-'TXT', uuid: '0ECF7CFF-7E74-4763-BE41-4A9B9AE7C08E'
add_int_big_int ${1:i} ${2:bi}$0
TXT

  tab 'bi', 'big_int_of_int', <<-'TXT', uuid: 'C41921D0-AFDD-4FAF-BE5C-A8F0267467D1'
big_int_of_int ${1:i}$0
TXT

  tab 'bi', 'big_int_of_string', <<-'TXT', uuid: 'F7CDE4F5-7AF5-4078-B60A-110427480140'
big_int_of_string ${1:bi_str}$0
TXT

  tab 'bi', 'compare_big_int', <<-'TXT', uuid: '58825C96-DD0E-4D12-ABA4-CA737C2FEBDA'
compare_big_int ${1:bi} ${2:bi2}$0
TXT

  tab 'bi', 'div_big_int', <<-'TXT', uuid: '06F109BC-E75C-4D0C-A91C-AB6144C1A7F8'
div_big_int ${1:bi} ${2:bi2}$0
TXT

  tab 'bi', 'eq_big_int', <<-'TXT', uuid: 'E9DDED0C-AC23-4E92-9D62-6A5BF2155F18'
eq_big_int ${1:bi} ${2:bi2}$0
TXT

  tab 'bi', 'float_of_big_int', <<-'TXT', uuid: '52DE9DDF-9550-42BC-8649-66C71D6A3022'
float_of_big_int ${1:bi}$0
TXT

  tab 'bi', 'gcd_big_int', <<-'TXT', uuid: 'C1D2BF0F-591D-4411-A395-912E4F2DB0F8'
gcd_big_int ${1:bi} ${2:bi2}$0
TXT

  tab 'bi', 'ge_big_int', <<-'TXT', uuid: 'DCEDAB8D-354A-4B56-8042-0DADA7F27DCA'
ge_big_int ${1:bi} ${2:bi2}$0
TXT

  tab 'bi', 'gt_big_int', <<-'TXT', uuid: '12D1E145-3A0A-460D-954E-41EDA189590E'
gt_big_int ${1:bi} ${2:bi2}$0
TXT

  tab 'bi', 'int_of_big_int', <<-'TXT', uuid: 'EC6DC943-3034-4802-9EA5-AA45EC2FF106'
int_of_big_int ${1:bi}$0
TXT

  tab 'bi', 'is_int_big_int', <<-'TXT', uuid: '4C0ED701-2097-405B-94CC-439B210455AD'
is_int_big_int ${1:bi}$0
TXT

  tab 'bi', 'le_big_int', <<-'TXT', uuid: '26AF394B-8D26-4264-9BEF-36D53D7A2B53'
le_big_int ${1:bi} ${2:bi2}$0
TXT

  tab 'bi', 'lt_big_int', <<-'TXT', uuid: 'DC2B355C-6E95-4831-811D-3FDD5B051D71'
lt_big_int ${1:bi} ${2:bi2}$0
TXT

  tab 'bi', 'max_big_int', <<-'TXT', uuid: 'C1CE115C-0C8B-4D63-877F-495180D95ED1'
max_big_int ${1:bi} ${2:bi2}$0
TXT

  tab 'bi', 'min_big_int', <<-'TXT', uuid: '8ECB7C9A-EBCC-42E3-A989-6D32B8F8E53D'
min_big_int ${1:bi} ${2:bi2}$0
TXT

  tab 'bi', 'minus_big_int', <<-'TXT', uuid: 'DF80F0EF-8692-4867-BD78-32C9C04B7C6E'
minus_big_int ${1:bi}$0
TXT

  tab 'bi', 'mod_big_int', <<-'TXT', uuid: '2B03D84A-5681-4D2D-B21E-F122DD37E43D'
mod_big_int ${1:bi} ${2:bi2}$0
TXT

  tab 'bi', 'mult_big_int', <<-'TXT', uuid: 'B7A8F1CC-D2A7-4F1C-9859-6AF0D4D5655F'
mult_big_int ${1:bi} ${2:bi2}$0
TXT

  tab 'bi', 'mult_int_big_int', <<-'TXT', uuid: '46EED719-CC65-42C6-9240-70C8917E4645'
mult_int_big_int ${1:i} ${2:bi}$0
TXT

  tab 'bi', 'num_digits_big_int', <<-'TXT', uuid: '2B64CDF5-1F55-4622-AFB6-B680E5657C9A'
num_digits_big_int ${1:bi}$0
TXT

  tab 'bi', 'power_big_int_positive_big_int', <<-'TXT', uuid: 'A5B86ED7-90BC-49DD-A008-1DA7C60EC767'
power_big_int_positive_big_int ${1:base} ${2:exp}$0
TXT

  tab 'bi', 'power_big_int_positive_int', <<-'TXT', uuid: 'C88B5628-8A4E-41C2-B17F-96F19A9ACFDC'
power_big_int_positive_int ${1:base} ${2:exp}$0
TXT

  tab 'bi', 'power_int_positive_big_int', <<-'TXT', uuid: '1D31052E-3127-4E2E-AA80-C755D84CF9BD'
power_int_positive_big_int ${1:base} ${2:exp}$0
TXT

  tab 'bi', 'power_int_positive_int', <<-'TXT', uuid: '6FA268F6-D767-4430-969F-066CFD890AAF'
power_int_positive_int ${1:base} ${2:exp}$0
TXT

  tab 'bi', 'pred_big_int', <<-'TXT', uuid: '50A8183C-906A-4071-9762-0BF8961C96B8'
pred_big_int ${1:bi}$0
TXT

  tab 'bi', 'quomod_big_int', <<-'TXT', uuid: '5B77659A-3F77-4CBB-AAC4-29004C28A65D'
quomod_big_int ${1:bi} ${2:bi2}$0
TXT

  tab 'bi', 'sign_big_int', <<-'TXT', uuid: 'ECE9BC5E-A9C7-4BC6-9088-41AE497A3EC4'
sign_big_int ${1:bi}$0
TXT

  tab 'bi', 'sqrt_big_int', <<-'TXT', uuid: '262C9CCE-F8B3-4BF5-9821-29149CDB8330'
sqrt_big_int ${1:bi}$0
TXT

  tab 'bi', 'square_big_int', <<-'TXT', uuid: '38B38CBE-8295-48CC-BD06-61D1756266FA'
square_big_int ${1:bi}$0
TXT

  tab 'bi', 'string_of_big_int', <<-'TXT', uuid: 'BE28247F-A925-4700-B087-2F914E733729'
string_of_big_int ${1:bi}$0
TXT

  tab 'bi', 'sub_big_int', <<-'TXT', uuid: 'C590FD82-239B-4B34-ACBE-AC123E90B011'
sub_big_int ${1:bi} ${2:bi2}$0
TXT

  tab 'bi', 'succ_big_int', <<-'TXT', uuid: 'BC3B9850-CDC4-4EEB-A18D-1404FEA400D7'
succ_big_int ${1:bi}$0
TXT

  tab 'bi', 'unit_big_int', <<-'TXT', uuid: '3D590B6B-638D-4ECE-B1C6-748BE4680D87'
unit_big_int
TXT

  tab 'bi', 'zero_big_int', <<-'TXT', uuid: '11360AB6-7C68-4B62-9802-9AA86871C00E'
zero_big_int
TXT

  tab 'Condition.', 'broadcast', <<-'TXT', uuid: '3AF034FA-EF30-4B2A-9B38-3F0AD271B91A'
Condition.broadcast ${1:cond}${2:;}$0
TXT

  tab 'Condition.', 'create', <<-'TXT', uuid: '8A439FD2-BA96-485B-8ECF-514293D0781F'
Condition.create ()${1:;}$0
TXT

  tab 'Condition.', 'signal', <<-'TXT', uuid: 'B724C769-13B2-435E-B690-1A6043294E94'
Condition.signal ${1:cond}${2:;}$0
TXT

  tab 'Condition.', 'wait', <<-'TXT', uuid: '29202826-0AA3-4F34-8087-80436D16DD95'
Condition.wait ${1:cond} ${2:mtx}${3:;}$0
TXT

  tab 'Dbm.', 'close', <<-'TXT', uuid: '90222CF1-F170-4328-8D45-6A178C68B8DF'
Dbm.close ${1:db}$0
TXT

  tab 'Dbm.', 'find', <<-'TXT', uuid: 'FDB812EE-F90D-4C05-A421-F484F3E1F9E7'
Dbm.find ${1:db} ${2:key}$0
TXT

  tab 'Dbm.', 'firstkey', <<-'TXT', uuid: '2DA75834-092C-4E25-A6A3-7628B4EC90B5'
Dbm.firstkey ${1:db}$0
TXT

  tab 'Dbm.', 'iter', <<-'TXT', uuid: 'D0AAADF5-7A69-42FC-BF5E-0CE22A427A05'
Dbm.itel ${1:(fun ${2:key} ${3:data} -> ${4:})} ${5:db}$0
TXT

  tab 'Dbm.', 'nextkey', <<-'TXT', uuid: 'CB6E88C0-17F4-49DF-A82A-43A71990ED2A'
Dbm.nextkey ${1:db}$0
TXT

  tab 'Dbm.', 'opendbm', <<-'TXT', uuid: '11E4191B-4966-48C6-9897-A326905AA39A'
Dbm.opendbm ${1:file_name} [Dbm.Dbm_$0] 0o${2:644}
TXT

  tab 'Dbm.', 'remove', <<-'TXT', uuid: '6A8230A3-C90E-41DF-BC77-CDE36F7B63D7'
Dbm.remove ${1:db} ${2:key}${3:;}$0
TXT

  tab 'Dbm.', 'replace', <<-'TXT', uuid: 'FDD3FDEC-FB20-4391-B432-B3847272FD64'
Dbm.replace ${1:db} ${2:key} ${3:data}$0
TXT

  tab 'Dbm.Dbm_', 'Create if non-existent', <<-'TXT', uuid: 'ABD81C05-66C4-4A77-A06B-C565AEEBC742'
Dbm.Dbm_create
TXT

  tab 'Dbm.Dbm_', 'Open for reading and writing', <<-'TXT', uuid: '1D90994A-91CA-4E77-88CD-7C3E698B35D7'
Dbm.Dbm_rdwr
TXT

  tab 'Dbm.Dbm_', 'Open read-only', <<-'TXT', uuid: '82095097-74EC-4301-A380-59AA2D45F2A3'
Dbm.Dbm_rdonly
TXT

  tab 'Dbm.Dbm_', 'Open write-only', <<-'TXT', uuid: '2BCF426A-FCE7-4231-9EAC-AF27F4866235'
Dbm.Dbm_wronly
TXT

  tab 'Dynlink.', 'add_available_units', <<-'TXT', uuid: 'BF273D64-5FCD-47C6-A902-4CD2981667EF'
Dynlink.add_available_units ${1:[${2:(${3:unit},${4:digest});}]}${5:;}$0
TXT

  tab 'Dynlink.', 'add_interfaces', <<-'TXT', uuid: 'D2F56B2D-B21B-4E55-BBF5-01DAA26FA019'
Dynlink.add_interfaces ${1:[${2:unit_list;}]} [${3:path}]${4:;}$0
TXT

  tab 'Dynlink.', 'allow_only', <<-'TXT', uuid: 'D90D94A3-95AD-48B3-AFB7-F63EAFC4EDD5'
Dynlink.allow_only ${1:[${2:unit_list;}]}${3:;}$0
TXT

  tab 'Dynlink.', 'allow_unsafe_modules', <<-'TXT', uuid: 'FB122916-C761-449A-960E-2B188591596B'
Dynlink.allow_unsafe_modules ${1:true}${2:;}$0
TXT

  tab 'Dynlink.', 'clear_available_units', <<-'TXT', uuid: 'BC743847-1B0D-4C3A-89BA-8450FC72736F'
Dynlink.clear_available_units ()${1:;}$0
TXT

  tab 'Dynlink.', 'default_available_units', <<-'TXT', uuid: 'E3027ECB-382A-46A7-991F-22C1B56A5265'
Dynlink.default_available_units ()${1:;}$0
TXT

  tab 'Dynlink.', 'error_message', <<-'TXT', uuid: '2BF749CF-6834-4DD1-A8BF-88F83CFDE269'
Dynlink.error_message ${1:(Dynlink.err$0)}
TXT

  tab 'Dynlink.', 'init', <<-'TXT', uuid: '7C3245E7-BA99-4FCC-9664-A42F300BD76E'
Dynlink.init ()${1:;}$0
TXT

  tab 'Dynlink.', 'loadfile', <<-'TXT', uuid: '78111629-5D15-429C-8BD1-C7FB15CF3D18'
Dynlink.loadfile ${1:file_name}${2:;}$0
TXT

  tab 'Dynlink.', 'loadfile_private', <<-'TXT', uuid: 'D78C9AFF-460D-4859-87E0-BB6C9711235E'
Dynlink.loadfile_private ${1:file_name}${2:;}$0
TXT

  tab 'Dynlink.', 'prohibit', <<-'TXT', uuid: 'DFBD18D6-A32F-4725-AE2E-2591EE05B6B0'
Dynlink.prohibit ${1:[${2:unit_list;}]}${3:;}$0
TXT

  tab 'Dynlink.err', 'Cannot_open_dll', <<-'TXT', uuid: 'D505DE8B-5678-4401-937E-B9EB8F02EEF3'
Dynlink.Cannot_open_dll ${1:file_name}$0
TXT

  tab 'Dynlink.err', 'Corrupted_interface', <<-'TXT', uuid: 'BA7E7E95-D8E0-412F-AB52-B63AA6E1FDAA'
Dynlink.Corrupted_interface ${1:i}$0
TXT

  tab 'Dynlink.err', 'File_not_found', <<-'TXT', uuid: 'D2EA2D85-F4C9-4373-95D7-27BCFFFB63C6'
Dynlink.File_not_found ${1:file_name}$0
TXT

  tab 'Dynlink.err', 'Inconsistent_import', <<-'TXT', uuid: '8B77CF66-73FD-4E7A-A5ED-0BEBEC83CDF4'
Dynlink.Inconsistent_import ${1:i}$0
TXT

  tab 'Dynlink.err', 'Linking_error', <<-'TXT', uuid: '304BE9F8-0657-4B8B-AFA7-C320B58EFE37'
Dynlink.Linking_error ${1:(${2:str}, ${3:Dynlink.lerr})}$0
TXT

  tab 'Dynlink.err', 'Not_a_bytecode_file', <<-'TXT', uuid: 'BD4FD3E0-E9B7-4E98-B172-02E9B9A772E9'
Dynlink.Not_a_bytecode_file ${1:file_name}$0
TXT

  tab 'Dynlink.err', 'Unavailable_unit', <<-'TXT', uuid: 'EF69B529-68DD-4358-A61A-B73520A16B8E'
Dynlink.Unavailable_unit ${1:u}$0
TXT

  tab 'Dynlink.err', 'Unsafe_file', <<-'TXT', uuid: 'A8FEC30A-4E42-4726-9241-EB9B23293B48'
Dynlink.Unsafe_file
TXT

  tab 'Dynlink.lerr', 'Unavailable_primitive', <<-'TXT', uuid: '97A6CA32-D003-426A-86F4-9A6BBB42A8DA'
Dynlink.Unavailable_primitive ${1:primitive}$0
TXT

  tab 'Dynlink.lerr', 'Undefined_global', <<-'TXT', uuid: 'DC427CAB-CF64-4913-9815-7FA7662B01F6'
Dynlink.Undefined_global ${1:global}$0
TXT

  tab 'Dynlink.lerr', 'Uninitialized_global', <<-'TXT', uuid: '214FB5BA-0F73-435F-931A-6FBE4CB47855'
Dynlink.Uninitialized_global ${1:global}$0
TXT

  tab 'Event.', 'always', <<-'TXT', uuid: '63B8A335-45BF-4CCE-8ADA-EE133891923E'
Event.always ${1:value}$0
TXT

  tab 'Event.', 'choose', <<-'TXT', uuid: '3211DB7E-5707-43D3-9264-D630C5AF2B33'
Event.choose ${1:[${2:event_list}]}$0
TXT

  tab 'Event.', 'guard', <<-'TXT', uuid: '4E121D62-A9AD-40EC-B58C-B0790007EA07'
Event.guard ${1:(fun () -> ${2:})}$0
TXT

  tab 'Event.', 'new_channel', <<-'TXT', uuid: 'AC5A8841-9B1D-48B5-9932-D6C3E5E3FAA5'
Event.new_channel ()
TXT

  tab 'Event.', 'poll', <<-'TXT', uuid: '6DEEBEE7-9CB6-4214-ACEC-A240A89290EB'
Event.poll ${1:event}$0
TXT

  tab 'Event.', 'receive', <<-'TXT', uuid: 'DE7675CC-4C5A-4223-BE3C-85DCA9BFB6F1'
Event.receive ${1:channel}$0
TXT

  tab 'Event.', 'select', <<-'TXT', uuid: '4A10883E-A428-4BB7-AE18-E762854AD135', file: 'select 2'
Event.select ${1:[${2:event_list}]}$0
TXT

  tab 'Event.', 'send', <<-'TXT', uuid: '60886CE1-62F5-447E-92B7-38040CCDDC06'
Event.send ${1:channel} ${2:value}$0
TXT

  tab 'Event.', 'sync', <<-'TXT', uuid: '5451D03D-1D7F-41C3-8BAB-26A054A171B0'
Event.sync ${1:event}$0
TXT

  tab 'Event.', 'wrap', <<-'TXT', uuid: 'CB63780E-F3A8-4210-8D04-D428FDCF9BAD'
Event.wrap ${1:even} ${2:funct}$0
TXT

  tab 'Event.', 'wrap_abort', <<-'TXT', uuid: '693B4AD6-5ADB-48EE-9461-D8D2BB1B3FF3'
Event.wrap_abort ${1:even} ${2:(fun () -> ${3:})}$0
TXT

  tab 'Genarray.', 'blit', <<-'TXT', uuid: 'F7820FB5-50A4-49D7-B8CD-F9A7DA31785B', file: 'blit 3'
Genarray.blit ${1:src_bigarray} ${2:dest_bigarray}${3:;}$0
TXT

  tab 'Genarray.', 'create', <<-'TXT', uuid: '136B9C39-5631-49EF-8940-FC57E1360B01', file: 'create 2'
Genarray.create BA.kind$0 ${1:fortran}-layout ${2:[|${3:dim_array;}|]}$0
TXT

  tab 'Genarray.', 'dims', <<-'TXT', uuid: '0E23BF9B-1ED5-48BB-BB63-6882318E8924'
Genarray.dims ${1:genarray}$0
TXT

  tab 'Genarray.', 'fill', <<-'TXT', uuid: '48DFA95D-043F-4369-85BF-560DBCD1E017'
Genarray.fill ${1:genarray} ${2:value}${3:;}$0
TXT

  tab 'Genarray.', 'get', <<-'TXT', uuid: '1FB7E092-11CC-4E91-9B96-E3CFED7B9BED'
Genarray.get ${1:genarray} ${2:[|${3:idx_array;}|]}$0
TXT

  tab 'Genarray.', 'kind', <<-'TXT', uuid: 'F0F17930-D40A-47F9-AC24-702CBF7CD96B'
Genarray.kind ${1:genarray}$0
TXT

  tab 'Genarray.', 'layout', <<-'TXT', uuid: 'A9C1D0C5-1B89-43F7-B02D-03DE0716F3D6', file: 'layout 2'
Genarray.layout ${1:genarray}$0
TXT

  tab 'Genarray.', 'map_file', <<-'TXT', uuid: 'CE8D91A0-08FB-4706-929F-9567C48ACD6C', file: 'map_file 3'
Genarray.map_file ${1:Unix.file_descr} BA.kind$0 ${2:fortran}_layout${3:shared} ${4:[|${5:dim_array;|]}}
TXT

  tab 'Genarray.', 'nth_dim', <<-'TXT', uuid: '0F780A66-B8B9-4053-BB23-CC6C516B7B04'
Genarray.nth_dim ${1:genarray}$0
TXT

  tab 'Genarray.', 'num_dims', <<-'TXT', uuid: 'F3B29281-729D-40ED-9FC5-2B5DADA0CA99'
Genarray.num_dims ${1:genarray}$0
TXT

  tab 'Genarray.', 'set', <<-'TXT', uuid: 'B6F3379E-380B-40F0-9AF7-19BE6B304530', file: 'set 2'
Genarray.set ${1:genarray}${2:[|${3:idx_array;}|]} ${4:value}${5:;}$0
TXT

  tab 'Genarray.', 'slice_left (C layout only)', <<-'TXT', uuid: 'E4790474-F1C1-4432-B422-98502281E59A'
Genarray.slice_left ${1:genarray} ${2:index_array}$0
TXT

  tab 'Genarray.', 'slice_right (Fortran layout only)', <<-'TXT', uuid: '7A4F4E9B-3A53-4E9C-9610-1BD249F7E716'
Genarray.slice_right ${1:genarray} ${2:index_array}$0
TXT

  tab 'Genarray.', 'sub_left (C layout only)', <<-'TXT', uuid: '884600B6-0BF8-4581-AB35-CD710181BC84', file: 'sub_left (C layout only) 3'
Genarray.sub_left ${1:genarray} ${2:offset} ${3:len}$0
TXT

  tab 'Genarray.', 'sub_right (Fortran layout only)', <<-'TXT', uuid: '9A952661-A806-4875-B060-BB0BF1E7E504'
Genarray.sub_right ${1:genarray} ${2:offset} ${3:len}$0
TXT

  tab 'Mutex.', 'create', <<-'TXT', uuid: '4EFD1B99-71D0-4AF7-87EA-FD6424E12AB5', file: 'create 5'
Mutex.create ()${1:;}$0
TXT

  tab 'Mutex.', 'lock', <<-'TXT', uuid: 'B6BDD408-256B-4546-98C5-F31E1E6D8923'
Mutex.lock ${1:mtx}${2:;}$0
TXT

  tab 'Mutex.', 'try_lock', <<-'TXT', uuid: '8B2E4B5E-BF3C-4416-B8C8-2694DCE869C3'
Mutex.try_lock ${1:mtx}$0
TXT

  tab 'Mutex.', 'unlock', <<-'TXT', uuid: '51EAF06A-B5DA-48C4-8C16-7FB416521082'
Mutex.unlock ${1:mtx}${2:;}$0
TXT

  tab 'num', 'abs_num', <<-'TXT', uuid: 'E5267162-39C9-4A37-93D8-0CDDD02B49C7'
abs_num ${1:num}$0
TXT

  tab 'num', 'add_num', <<-'TXT', uuid: 'E58F092E-57AF-4475-AEF0-F477BC4D44A4'
add_num ${1:num1} ${2:num2}$0
TXT

  tab 'num', 'approx_num_exp', <<-'TXT', uuid: '269D63A0-97D3-449F-8F89-98EDECCF76C5'
approx_num_exp ${1:precision} ${1:num}$0
TXT

  tab 'num', 'approx_num_fix', <<-'TXT', uuid: 'EE89BC6F-7149-4C7C-A744-50E39840EEC9'
approx_num_fix ${1:precision} ${1:num}$0
TXT

  tab 'num', 'big_int_of_num', <<-'TXT', uuid: '63BBF13F-7373-4902-A536-6D98BD7A5599'
big_int_of_num ${1:num}$0
TXT

  tab 'num', 'ceiling_num', <<-'TXT', uuid: 'F94E1805-85FF-4B7E-A454-61D10025BA1E'
ceiling_num ${1:num}$0
TXT

  tab 'num', 'compare_num', <<-'TXT', uuid: '77E6EA25-695A-4354-9BC2-88B15342D51B'
compare_num ${1:num} ${2:num2}$0
TXT

  tab 'num', 'decr_num', <<-'TXT', uuid: '427719D4-D6E8-464C-B58B-EEDDD01175ED'
decr_num ${1:num_ref}$0
TXT

  tab 'num', 'div_num', <<-'TXT', uuid: '354627B6-0CEE-4193-B752-B481E95BD615'
div_num ${1:num} ${2:num2}$0
TXT

  tab 'num', 'eq_num', <<-'TXT', uuid: '5E490764-0D8A-4ED7-96E3-91CDC8F053C1'
eq_num ${1:num} ${2:num2}$0
TXT

  tab 'num', 'float_of_num', <<-'TXT', uuid: '929E2116-17F9-41F7-A787-39972B2669BF'
float_of_num ${1:num}$0
TXT

  tab 'num', 'floor_num', <<-'TXT', uuid: 'C892691F-9C57-4ABF-B9D8-C278FEB7D6C1'
floor_num ${1:num}$0
TXT

  tab 'num', 'ge_num', <<-'TXT', uuid: '01BA38EB-2678-40F7-8CC9-4936AA6820AB'
ge_num ${1:num} ${2:num2}$0
TXT

  tab 'num', 'gt_num', <<-'TXT', uuid: 'F8CD008A-6EEB-484F-AF52-F5023F789F6A'
gt_num ${1:num} ${2:num2}$0
TXT

  tab 'num', 'incr_num', <<-'TXT', uuid: 'DB80328F-A5D6-46FF-B382-A422C4564981'
incr_num ${1:num_ref}$0
TXT

  tab 'num', 'int_of_num', <<-'TXT', uuid: 'E924D254-E310-4725-8C16-FFAE18B66F0C'
int_of_num ${1:num}$0
TXT

  tab 'num', 'integer_num', <<-'TXT', uuid: '814A8EE0-A55C-414E-93DA-3AC30F59049F'
integer_num ${1:num}$0
TXT

  tab 'num', 'is_integer_num', <<-'TXT', uuid: '1960A397-D145-4C7B-AF11-233F16395D1A'
is_integer_num ${1:num}$0
TXT

  tab 'num', 'le_num', <<-'TXT', uuid: '2F9D7374-5687-47CC-ACD0-11A565E61235'
le_num ${1:num} ${2:num2}$0
TXT

  tab 'num', 'lt_num', <<-'TXT', uuid: '30A72A33-8992-422F-8B50-70768203E8CF'
lt_num ${1:num} ${2:num2}$0
TXT

  tab 'num', 'max_num', <<-'TXT', uuid: 'E47948D5-51A6-4F45-9D4A-4DFAD9EECAC9'
max_num ${1:num} ${2:num2}$0
TXT

  tab 'num', 'min_num', <<-'TXT', uuid: 'DD2B5D99-0B6A-40C6-A7A8-516FC2905546'
min_num ${1:num} ${2:num2}$0
TXT

  tab 'num', 'minus_num', <<-'TXT', uuid: 'C8F1F164-B1D5-4BC1-99F1-D8D501F74E2A'
minus_num ${1:num}$0
TXT

  tab 'num', 'mod_num', <<-'TXT', uuid: '8A0911E5-1A68-46A6-9649-80D2949322FC'
mod_num ${1:num} ${2:num2}$0
TXT

  tab 'num', 'mult_num', <<-'TXT', uuid: 'ED4AF47B-BFF3-428C-82A7-353F3928C58F'
mult_num ${1:num} ${2:num2}$0
TXT

  tab 'num', 'nat_of_num', <<-'TXT', uuid: '10732BFF-5EA0-409B-BE77-D6CA921669F2'
nat_of_num ${1:num}$0
TXT

  tab 'num', 'num_of_big_int', <<-'TXT', uuid: 'AF153FB1-A630-4019-B0B7-F11952532862'
num_of_big_int ${1:bi}$0
TXT

  tab 'num', 'num_of_int', <<-'TXT', uuid: 'EBAC8706-B116-4C93-BAFC-3D80F39D3AE8'
num_of_int ${1:i}$0
TXT

  tab 'num', 'num_of_nat', <<-'TXT', uuid: '5DAB2A81-8A86-4D72-892D-5151B28830B7'
num_of_nat ${1:nat}$0
TXT

  tab 'num', 'num_of_ratio', <<-'TXT', uuid: '59FA6802-A2F8-4479-8DC3-FA408CBE32CF'
num_of_big_ratio ${1:r}$0
TXT

  tab 'num', 'num_of_string', <<-'TXT', uuid: 'E0995305-3074-4024-93AE-7130E308855F'
num_of_string ${1:num_str}$0
TXT

  tab 'num', 'power_num', <<-'TXT', uuid: 'C8B5B88B-E1B4-41E4-A8B6-08C4F641ED47'
power_num ${1:num} ${2:num2}$0
TXT

  tab 'num', 'pred_num', <<-'TXT', uuid: '0780A3B3-E095-4322-A71B-BD58B7D3A9ED'
pred_num ${1:num}$0
TXT

  tab 'num', 'quo_num', <<-'TXT', uuid: '9A0BFECB-F0C9-4AC6-AF8C-5E7971458253'
quo_num ${1:num} ${2:num2}$0
TXT

  tab 'num', 'ratio_of_num', <<-'TXT', uuid: 'E0F81ECA-6CE4-4688-8C20-BF2D827D0672'
ratio_of_num ${1:num}$0
TXT

  tab 'num', 'round_num', <<-'TXT', uuid: '8B766EBC-F084-4C2F-8189-67A8BB571731'
round_num ${1:num}$0
TXT

  tab 'num', 'sign_num', <<-'TXT', uuid: '7593A3BC-31C4-4EE0-AE5B-EBFCA6B20589'
sign_num ${1:num}$0
TXT

  tab 'num', 'square_num', <<-'TXT', uuid: 'DF4247F8-57F3-4A9B-8621-2E326D8C9607'
square_num ${1:num}$0
TXT

  tab 'num', 'string_of_num', <<-'TXT', uuid: '275C6A1C-2E6E-4F9C-86BC-92E693DF0833'
string_of_num ${1:num}$0
TXT

  tab 'num', 'sub_num', <<-'TXT', uuid: '0686B198-1A17-4CF2-9CBF-E0309B56737E'
sub_num ${1:num} ${2:num2}$0
TXT

  tab 'num', 'succ_num', <<-'TXT', uuid: '96A16705-0D9D-4D28-8F0A-1B9E0F2FFDB6'
succ_num ${1:num}$0
TXT

  tab 'rat', 'abs_ratio', <<-'TXT', uuid: 'B472931E-3771-4185-BB54-58B67951FA3A'
abs_ratio ${1:ratio}$0
TXT

  tab 'rat', 'add_big_int_ratio', <<-'TXT', uuid: 'ECB243E5-C28E-47B6-BCC0-B788970DAD99'
add_big_int_ratio ${1:bi} ${2:ratio}$0
TXT

  tab 'rat', 'add_int_ratio', <<-'TXT', uuid: '2462C9C6-1148-4F7B-87DD-B18F1A6C3E49'
add_int_ratio ${1:i} ${2:ratio}$0
TXT

  tab 'rat', 'add_ratio', <<-'TXT', uuid: '29983E27-0A84-4E7C-B746-2C29BBAF3A4D'
add_ratio ${1:ratio} ${2:ratio2}$0
TXT

  tab 'rat', 'approx_ratio_exp', <<-'TXT', uuid: '1464EAF1-346E-49A6-9838-0249A4C9D6F9'
approx_ratio_exp ${1:precision} ${2:ratio}$0
TXT

  tab 'rat', 'approx_ratio_fix', <<-'TXT', uuid: 'FE2CAF0C-8385-423C-99A6-EE507DAB392E'
approx_ratio_fix ${1:precision} ${2:ratio}$0
TXT

  tab 'rat', 'big_int_of_ratio', <<-'TXT', uuid: '13D88829-DE1A-4B0A-BDEC-838A3CEBB1C5'
big_int_of_ratio ${1:ratio}$0
TXT

  tab 'rat', 'cautious_normalize_ratio', <<-'TXT', uuid: 'C8D0EF30-BBDE-4285-99CB-AFE2F4BC51DE'
cautious_normalize_ratio ${1:ratio}$0
TXT

  tab 'rat', 'cautious_normalize_ratio_when_printing', <<-'TXT', uuid: 'F6AB794A-071A-4361-A08A-2579B5DB0814'
cautious_normalize_ratio_when_printing ${1:ratio}$0
TXT

  tab 'rat', 'ceiling_ratio', <<-'TXT', uuid: '47EA9C81-B9F1-4AB1-8A65-2F411D5AE361'
ceiling_ratio ${1:ratio}$0
TXT

  tab 'rat', 'compare_big_int_ratio', <<-'TXT', uuid: '55A56C73-5CA7-4C9F-8B4A-B8E8FEAEDFA9'
compare_big_int_ratio ${1:bi} ${2:ratio}$0
TXT

  tab 'rat', 'compare_ratio', <<-'TXT', uuid: '02973C13-B642-43C4-BC98-4893E94AB287'
compare_ratio ${1:ratio} ${2:ratio2}$0
TXT

  tab 'rat', 'create_normalized_ratio', <<-'TXT', uuid: '8651C966-3874-4E9E-A6DB-031B59CD0F29'
create_normalized_ratio ${1:bi} ${2:bi2}$0
TXT

  tab 'rat', 'create_ratio', <<-'TXT', uuid: 'DC449B21-7E0A-416C-BB5D-CF8EA8D1DB60'
create_ratio ${1:bi} ${2:bi2}$0
TXT

  tab 'rat', 'denominator_ratio', <<-'TXT', uuid: '43934351-3255-491D-964D-F3088253DE68'
denominator_ratio ${1:ratio}$0
TXT

  tab 'rat', 'div_big_int_ratio', <<-'TXT', uuid: 'C48CC014-BB24-4AC5-A1CA-9FE0CE9ADB8A'
div_big_int_ratio ${1:bi} ${2:ratio}$0
TXT

  tab 'rat', 'div_int_ratio', <<-'TXT', uuid: 'FAE34E20-B6CD-4A79-988D-C2B55438FAD2'
div_int_ratio ${1:i} ${2:ratio}$0
TXT

  tab 'rat', 'div_ratio', <<-'TXT', uuid: '90F26D7C-2031-4BD9-84C6-0F9261D36160'
div_ratio ${1:ratio} ${2:ratio2}$0
TXT

  tab 'rat', 'div_ratio_big_int', <<-'TXT', uuid: '58949485-8B6A-41EA-B4F1-FAF336552EC6'
div_ratio_big_int ${1:ratio} ${2:bi}$0
TXT

  tab 'rat', 'div_ratio_int', <<-'TXT', uuid: 'E6C82E6B-6A48-4ABE-888E-FA55379BE471'
div_ratio_int ${1:ratio} ${2:i}$0
TXT

  tab 'rat', 'eq_big_int_ratio', <<-'TXT', uuid: 'B5B6BCB7-D775-4621-94E6-2974ECF5107A'
eq_big_int_ratio ${1:bi} ${2:ratio}$0
TXT

  tab 'rat', 'eq_ratio', <<-'TXT', uuid: 'F87645FA-A614-4405-8379-11A2637ED657'
eq_ratio ${1:ratio} ${2:ratio2}$0
TXT

  tab 'rat', 'float_of_ratio', <<-'TXT', uuid: '324AC355-72D0-461D-B88B-43F5538191C3'
float_of_ratio ${1:ratio}$0
TXT

  tab 'rat', 'float_of_rational_string', <<-'TXT', uuid: '8123F51D-C668-4CDB-B1E0-A04D988C0A56'
float_of_rational_string ${1:ratio}$0
TXT

  tab 'rat', 'floor_ratio', <<-'TXT', uuid: '6CB30146-262A-4F24-94A3-1D71F15FDB9F'
floor_ratio ${1:ratio}$0
TXT

  tab 'rat', 'ge_big_int_ratio', <<-'TXT', uuid: 'D7700840-9DE3-4705-B37D-9148272BF03D'
ge_big_int_ratio ${1:bi} ${2:ratio}$0
TXT

  tab 'rat', 'ge_ratio', <<-'TXT', uuid: '9F58531D-8471-4789-9A6E-2129AA715C65'
ge_ratio ${1:ratio} ${2:ratio2}$0
TXT

  tab 'rat', 'gt_big_int_ratio', <<-'TXT', uuid: '33B8253F-FD9F-4821-BE99-9A98DA71257A'
gt_big_int_ratio ${1:bi} ${2:ratio}$0
TXT

  tab 'rat', 'gt_ratio', <<-'TXT', uuid: '60BEB98C-CD19-43DF-9B7A-CEF07C448C12'
gt_ratio ${1:ratio} ${2:ratio2}$0
TXT

  tab 'rat', 'int_of_ratio', <<-'TXT', uuid: 'C24E4B96-6372-4779-860C-629DA3D027A6'
int_of_ratio ${1:ratio}$0
TXT

  tab 'rat', 'integer_ratio', <<-'TXT', uuid: '2B7A5022-515C-445F-B0A7-C1EAA617484C'
integer_ratio ${1:ratio}$0
TXT

  tab 'rat', 'inverse_ratio', <<-'TXT', uuid: '604F6BC3-1422-4F04-97D1-7489F1EFB585'
inverse_ratio ${1:ratio}$0
TXT

  tab 'rat', 'is_integer_ratio', <<-'TXT', uuid: '0D5B4217-9E29-4CC9-B6E4-8D4BC142F27B'
is_integer_ratio ${1:ratio}$0
TXT

  tab 'rat', 'is_normalized_ratio', <<-'TXT', uuid: '7C085746-87EB-4AA2-8EC9-1D00D671126F'
is_normalized_ratio ${1:ratio}$0
TXT

  tab 'rat', 'le_big_int_ratio', <<-'TXT', uuid: '0539D080-F3F2-4676-AC09-C002A9D023D3'
le_big_int_ratio ${1:bi} ${2:ratio}$0
TXT

  tab 'rat', 'le_ratio', <<-'TXT', uuid: 'C914ED78-BFB6-491A-B6A1-D24FBC1DBA47'
le_ratio ${1:ratio} ${2:ratio2}$0
TXT

  tab 'rat', 'lt_big_int_ratio', <<-'TXT', uuid: '22D98943-6CB5-4EA4-9B30-A4535AB89AD8'
lt_big_int_ratio ${1:bi} ${2:ratio}$0
TXT

  tab 'rat', 'lt_ratio', <<-'TXT', uuid: 'F3AD4079-56A1-4D1C-8344-5E644DC1BFEF'
lt_ratio ${1:ratio} ${2:ratio2}$0
TXT

  tab 'rat', 'max_ratio', <<-'TXT', uuid: '8F34C959-C279-4A6C-9AC9-F001B138C907'
max_ratio ${1:ratio} ${2:ratio2}$0
TXT

  tab 'rat', 'min_ratio', <<-'TXT', uuid: '64504C16-2F66-41FB-8418-A7B75D5383C1'
min_ratio ${1:ratio} ${2:ratio2}$0
TXT

  tab 'rat', 'mult_big_int_ratio', <<-'TXT', uuid: '2350B4C1-F5CA-46C7-8399-23D91C6606D9'
mult_big_int_ratio ${1:bi} ${2:ratio}$0
TXT

  tab 'rat', 'mult_int_ratio', <<-'TXT', uuid: '94E6F358-110A-4ADB-8EA0-E164B921251D'
mult_int_ratio ${1:i} ${2:ratio}$0
TXT

  tab 'rat', 'mult_ratio', <<-'TXT', uuid: 'B2A828F0-DBEA-4B4E-BEC3-9E6D118FE32E'
mult_ratio ${1:ratio} ${2:ratio2}$0
TXT

  tab 'rat', 'nat_of_ratio', <<-'TXT', uuid: 'B880F925-B10C-4139-A2E9-21E5FA00FAE2'
nat_of_ratio ${1:ratio}$0
TXT

  tab 'rat', 'normalize_ratio', <<-'TXT', uuid: 'C9FC2D24-6277-414A-B609-92C97912F972'
normalize_ratio ${1:ratio}$0
TXT

  tab 'rat', 'null_denominator', <<-'TXT', uuid: 'D78C74CE-E4CB-404B-B4C3-AADF5ACB0D75'
null_denominator ${1:ratio}$0
TXT

  tab 'rat', 'numerator_ratio', <<-'TXT', uuid: '3486EA62-D5F9-4C63-9443-D68D818632E5'
numerator_ratio ${1:ratio}$0
TXT

  tab 'rat', 'power_ratio_positive_big_int', <<-'TXT', uuid: '2520F6FD-57E4-4139-BDED-59EDC7F8B151'
power_ratio_positive_big_int ${1:ratio} ${2:bi}$0
TXT

  tab 'rat', 'power_ratio_positive_int', <<-'TXT', uuid: 'D7A9ADAC-3530-47D0-9351-2ACEE5D43017'
power_ratio_positive_int ${1:ratio} ${2:i}$0
TXT

  tab 'rat', 'ratio_of_big_int', <<-'TXT', uuid: '0908F943-9657-4CA4-9F43-4E8A7168BCF1'
ratio_of_big_int ${1:bi}$0
TXT

  tab 'rat', 'ratio_of_int', <<-'TXT', uuid: 'AB6A95F0-0C62-40CC-BF89-F0FC4CE1FDBF'
ratio_of_int ${1:i}$0
TXT

  tab 'rat', 'ratio_of_nat', <<-'TXT', uuid: '1E333C10-F881-4748-AB96-1F0AA508F957'
ratio_of_nat ${1:nat}$0
TXT

  tab 'rat', 'ratio_of_string', <<-'TXT', uuid: 'DAA03FD5-09F7-4A6C-B670-F81765426AAE'
ratio_of_string ${1:str}$0
TXT

  tab 'rat', 'report_sign_ratio', <<-'TXT', uuid: 'D8665E16-0C71-4DB5-9BC3-766E0830CB5D'
report_sign_ratio ${1:ratio} ${2:bi}$0
TXT

  tab 'rat', 'round_ratio', <<-'TXT', uuid: 'BD853183-D495-437F-BC13-F8479357F1EB'
round_ratio ${1:ratio}$0
TXT

  tab 'rat', 'sign_ratio', <<-'TXT', uuid: 'FB4C32CD-1203-403B-821B-D2FD21D85C3C'
sign_ratio ${1:ratio}$0
TXT

  tab 'rat', 'square_ratio', <<-'TXT', uuid: '14CCDFE5-D0F0-48CA-B8C4-7419A437EF82'
square_ratio ${1:ratio}$0
TXT

  tab 'rat', 'string_of_ratio', <<-'TXT', uuid: '7E1D4E6E-6FD8-4C37-AEAF-56120B7CC9C2'
string_of_ratio ${1:ratio}$0
TXT

  tab 'rat', 'sub_ratio', <<-'TXT', uuid: '8838AE09-5358-4BB6-9E4A-6B9F1B408D47'
sub_ratio ${1:ratio} ${2:ratio2}$0
TXT

  tab 'Str.', 'bounded_full_split', <<-'TXT', uuid: '8A2D6E86-7CED-40F1-AE0A-C242D50E478D'
Str.bounded_full_split ${1:regexp} ${2:str} ${3:lim}$0
TXT

  tab 'Str.', 'bounded_split', <<-'TXT', uuid: 'F97A1CD9-FA58-4769-8A57-5F516142EC9B'
Str.bounded_split ${1:regexp} ${2:str} ${3:lim}$0
TXT

  tab 'Str.', 'bounded_split_delim', <<-'TXT', uuid: 'F00DFAA1-0D9F-4B28-B79B-EC88C660572B'
Str.bounded_split_delim ${1:regexp} ${2:str} ${3:lim}$0
TXT

  tab 'Str.', 'first_chars', <<-'TXT', uuid: '2EC935CA-0C56-45D5-9120-CF67CD3A5532'
Str.first_chars ${1:str} ${2:pos}$0
TXT

  tab 'Str.', 'full_split', <<-'TXT', uuid: 'CB4DB258-942D-444F-885C-2CA1FD40628F'
Str.full_split ${1:regexp} ${2:str}$0
TXT

  tab 'Str.', 'global_replace', <<-'TXT', uuid: '91B4F79B-05E8-4C39-9161-A432C8D57A59'
Str.global_replace ${1:regexp} ${2:"${3:templ}"} ${4:str}$0
TXT

  tab 'Str.', 'global_substitute', <<-'TXT', uuid: 'DD77EDA2-86E6-4B34-B588-24C41BC2F69A'
Str.global_substitute ${1:regexp} ${2:subst_func} ${3:str}$0
TXT

  tab 'Str.', 'group_beginning', <<-'TXT', uuid: '68B5A628-081B-4525-BBAF-621E6A66FCDE'
Str.group_beginning ${1:group_no}$0
TXT

  tab 'Str.', 'group_end', <<-'TXT', uuid: '33B217F0-8DFD-4484-B543-FE274A70AA14'
Str.group_end ${1:group_no}$0
TXT

  tab 'Str.', 'last_chars', <<-'TXT', uuid: '1C598286-11ED-4D33-AF7A-00A0E9341D66'
Str.last_chars ${1:str} ${2:pos}$0
TXT

  tab 'Str.', 'match_beginning', <<-'TXT', uuid: '4CCE29E9-7F36-4F93-8718-FCB39269A022'
Str.match_beginning ()
TXT

  tab 'Str.', 'match_end', <<-'TXT', uuid: 'CE0DD215-653B-40C7-A4D8-9B2E6CF4FC26'
Str.match_end ()
TXT

  tab 'Str.', 'matched_group', <<-'TXT', uuid: '3D29D024-CD80-42A6-B5F6-1F17F71093A9'
Str.matched_group ${1:group_no} ${2:str}$0
TXT

  tab 'Str.', 'matched_string', <<-'TXT', uuid: 'F2B473E0-E22E-4F82-94EB-7FD57590BDFD'
Str.matched_string ${1:str}$0
TXT

  tab 'Str.', 'quote', <<-'TXT', uuid: '8F66B6DF-DA99-470E-869C-C8A476F06FC7'
Str.quote ${1:reg_str}$0
TXT

  tab 'Str.', 'regexp', <<-'TXT', uuid: 'F9E59E71-F9B4-4D0D-B2CE-F8911B9E4597'
Str.regexp ${1:reg_str}$0
TXT

  tab 'Str.', 'regexp_case_fold', <<-'TXT', uuid: '9AB12341-FF13-43B7-877E-84D5BC4712C5'
Str.regexp_case_fold ${1:reg_str}$0
TXT

  tab 'Str.', 'regexp_string', <<-'TXT', uuid: '4622079A-9D21-47A7-80A2-0C598953B36B'
Str.regexp_string ${1:reg_str}$0
TXT

  tab 'Str.', 'regexp_string_case_fold', <<-'TXT', uuid: 'CC65D8D2-F0B2-47E7-A4D3-E33D98D48F42'
Str.regexp_string_case_fold ${1:reg_str}$0
TXT

  tab 'Str.', 'replace_first', <<-'TXT', uuid: '686B65D9-5215-4C33-8B63-C89F5196CE9B'
Str.replace_first ${1:regexp} ${2:"${3:templ}"} ${4:str}$0
TXT

  tab 'Str.', 'replace_matched', <<-'TXT', uuid: '19E4E13E-26E2-467F-A5F1-EF5E72AA1484'
Str.replace_matched ${1:repl} ${2:str}$0
TXT

  tab 'Str.', 'search_backward', <<-'TXT', uuid: 'C8D60AE5-C936-467E-B1DA-937EDD533EFA'
Str.search_backward ${1:regexp} ${2:str} ${3:start_pos}$0
TXT

  tab 'Str.', 'search_forward', <<-'TXT', uuid: 'E3217A9B-9A89-4FE0-A926-915F2FA7B00A'
Str.search_forward ${1:regexp} ${2:str} ${3:start_pos}$0
TXT

  tab 'Str.', 'split', <<-'TXT', uuid: 'F196FA88-6AF3-4F92-9859-437A372541D2'
Str.split ${1:regexp} ${2:str}$0
TXT

  tab 'Str.', 'split_delim', <<-'TXT', uuid: '2E2AE9EB-DE4E-412B-90F3-527D4FA50481'
Str.split_delim ${1:regexp} ${2:str}$0
TXT

  tab 'Str.', 'string_after', <<-'TXT', uuid: '31806576-0D20-4CA9-94E9-796C73251311'
Str.string_after ${1:str} ${2:pos}$0
TXT

  tab 'Str.', 'string_before', <<-'TXT', uuid: '82705D7E-E519-4DB7-91B0-F911EB21E753'
Str.string_before ${1:str} ${2:pos}$0
TXT

  tab 'Str.', 'string_match', <<-'TXT', uuid: '87ECE9C8-8C4E-4A7B-BC4F-D44C8E79541A'
Str.string_match ${1:regexp} ${2:str} ${3:start_pos}$0
TXT

  tab 'Str.', 'string_partial_match', <<-'TXT', uuid: 'BE814411-426A-42E2-A507-D29B9608CE19'
Str.string_partial_match ${1:regexp} ${2:str} ${3:start_pos}$0
TXT

  tab 'Str.', 'substitute_first', <<-'TXT', uuid: 'D61EC992-1591-41A8-8E38-0CC976730E82'
Str.substitute_first ${1:regexp} ${2:subst_func} ${3:str}$0
TXT

  tab 'Thread.', 'create', <<-'TXT', uuid: 'D9E97BB7-DEB9-4208-9442-5BB68355DA1C', file: 'create 7'
Thread.create ${1:funct} ${2:arg}$0
TXT

  tab 'Thread.', 'delay', <<-'TXT', uuid: '3AF95140-8144-489C-A26B-E15B1254D1C8'
Thread.delay ${1:secs}${2:;}$0
TXT

  tab 'Thread.', 'exit', <<-'TXT', uuid: '9BC929FE-0764-43FE-90E1-F081FDF880ED'
Thread.exit ()${1:;}$0
TXT

  tab 'Thread.', 'id', <<-'TXT', uuid: '54FB8B1A-8977-43BD-86AB-491905295272'
Thread.id ${1:thd}$0
TXT

  tab 'Thread.', 'join', <<-'TXT', uuid: '8407EE88-8659-4D6C-A8EE-E0B1A88CEBEF'
Thread.join ${1:thd}${2:;}$0
TXT

  tab 'Thread.', 'select', <<-'TXT', uuid: 'E830157B-9FF6-4572-A9F3-40C200079B23'
Thread.select ${1:[${2:read_descr_list;}]} ${3:[${4:write_descr_list;}]} ${5:[${6:exceptional_descr_list;}]} ${7:timeout_float}$0
TXT

  tab 'Thread.', 'self', <<-'TXT', uuid: '657D90C7-3D48-4982-850C-103E62373DB6'
Thread.self ()
TXT

  tab 'Thread.', 'wait_pid', <<-'TXT', uuid: 'C99BC602-C853-4716-B6C9-139ECC9626B3'
Thread.wait_pid ${1:pid}$0
TXT

  tab 'Thread.', 'wait_read', <<-'TXT', uuid: 'E1F71CB3-BF6A-44B0-A2BA-0B471CA0941F'
Thread.wait_read ${1:Unix.file_descr}${2:;}$0
TXT

  tab 'Thread.', 'wait_signal', <<-'TXT', uuid: '7B0E921C-CCED-459A-8814-3B3E148CFB91'
Thread.wait_pid ${1:[${2:signal_list;}]}$0
TXT

  tab 'Thread.', 'wait_timed_read', <<-'TXT', uuid: 'B9194CE4-2C08-40F1-9969-54618AA775B3'
Thread.wait_timed_read ${1:Unix.file_descr} ${2:timeout}$0
TXT

  tab 'Thread.', 'wait_timed_write', <<-'TXT', uuid: '6081DF0A-2580-47AB-A3F6-FA3442C54783'
Thread.wait_timed_write ${1:Unix.file_descr} ${2:timeout}$0
TXT

  tab 'Thread.', 'wait_write', <<-'TXT', uuid: '87CD7EBF-91BC-483D-8C01-FFAAE1798D10'
Thread.wait_write ${1:Unix.file_descr}${2:;}$0
TXT

  tab 'Thread.', 'yield', <<-'TXT', uuid: '0A588301-3DE5-41C0-8C41-A0CAFD5B958C'
Thread.yield ()${1:;}$0
TXT

end