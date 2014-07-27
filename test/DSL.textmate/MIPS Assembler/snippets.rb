# encoding: utf-8

snippets do

  default_scope 'source.mips'
  file_format :textmate

  tab 'add', 'add', <<-'TXT', uuid: '56A260D5-7D59-4DE8-89C9-F09EF8429DFE'
add		${1:\$t0}, ${2:\$t1}, ${3:\$t2}		# $1 = $2 + $3

TXT

  tab 'addi', 'add immediate', <<-'TXT', uuid: '6DCA5FC6-9199-4C63-8942-E4651E80FF66'
addi	${1:\$t0}, ${2:\$t1}, ${3:0}			# $1 = $2 + $3

TXT

  tab 'b', 'branch uncodnitional', <<-'TXT', uuid: '3B3A65C5-3EA8-49C4-9C5C-233AAFDE0FF0'
b		${1:target}			# branch to $1

TXT

  tab 'beq', 'branch if equal', <<-'TXT', uuid: '92208817-3BC0-4850-B118-98B4528C5DF8'
beq		${1:\$t0}, ${2:\$t1}, ${3:target}	# if $1 == $2 then $3

TXT

  tab 'bge', 'branch if greater then or equal', <<-'TXT', uuid: '6A8E47B3-46B6-4A9E-85DD-3719BCF6020F'
bge		${1:\$t0}, ${2:\$t1}, ${3:target}	# if $1 >= $2 then $3

TXT

  tab 'bgt', 'branch if greater then', <<-'TXT', uuid: '8DA62990-6318-4572-899B-DAA433C00002'
bgt		${1:\$t0}, ${2:\$t1}, ${3:target}	# if $1 > $2 then $3

TXT

  tab 'ble', 'branch if less then or equal', <<-'TXT', uuid: '64E84153-3437-4ABC-A6E4-2B97A1937243'
ble		${1:\$t0}, ${2:\$t1}, ${3:target}	# if $1 <= $2 then $3

TXT

  tab 'blt', 'branch if less then', <<-'TXT', uuid: 'A795DACA-9018-4E9A-9F40-F9A6D94E358F'
blt		${1:\$t0}, ${2:\$t1}, ${3:target}	# if $1 < $2 then $3

TXT

  tab 'bne', 'branch if not equal', <<-'TXT', uuid: '6D9FFD17-43A2-4502-B759-8AA86EEF7C94'
bne		${1:\$t0}, ${2:\$t1}, ${3:target}	# if $1 != $2 then $3

TXT

  tab 'div', 'divide', "div\t\t${1:\\$t0}, ${2:\\$t1}\t\t\t# $1 / $2\nmflo\t${3:\\$t2}\t\t\t\t\t# $3 = floor($1 / $2) \nmfhi\t${4:\\$t3}\t\t\t\t\t# $4 = $1 mod $2 \n", uuid: 'D5F24791-FDDE-47FC-9FCC-66F7B77F1DD9'

  tab 'hello', 'Hello World (mips)', <<-'TXT', uuid: 'E670F342-6BE2-11D9-96CC-0011242E4184', file: '010 hello world', key_equivalent: ""
#  a basic example in mips-assembler: hello world.
#  tested with xspim-7.0

	.text
	.globl main

main:
	li       \$v0, 4            # call = 4 = print_string
	la       \$a0, hello_string # set \$a0 to point to the string
	syscall                    # print it.
	li       \$v0, 10           # call = 10 = exit
	syscall                    # done.


	.data

hello_string:  .asciiz  "Hello World!"
$1
TXT

  tab 'j', 'jump', <<-'TXT', uuid: 'E3C16D8E-16C6-49AB-9C81-9FBF0710C7F1'
j		${1:target}				# jump to $1

TXT

  tab 'jal', 'jump and link', <<-'TXT', uuid: '25AAEEEE-4E28-4601-9C3A-863F05806E38'
jal		${1:target}				# jump to $1 and save position to \$ra

TXT

  tab 'jr', 'jump register', <<-'TXT', uuid: '2D313705-F80D-45DD-9F99-AEB71BCDD6F6'
jr		${1:\$ra}					# jump to $1

TXT

  tab 'la', 'load address', "la\t\t${1:\\$t1}, ${2:var1}\t\t# \n", uuid: '5EBF2AC7-627C-4971-9881-84B91D9B827A'

  tab 'lb', 'load byte', "lb\t\t${1:\\$t1}, ${2:${3:0}(${4:\\$s1})}\t\t# \n", uuid: '19F56CDB-E6E5-4EBF-BF10-164CF1001317'

  tab 'li', 'load immediate', <<-'TXT', uuid: 'D5562821-4176-44A4-BB02-B8CEB03187CD'
li		${1:\$t1}, $2		# $1 = $2

TXT

  tab 'lw', 'load word', "lw\t\t${1:\\$t1}, ${2:${3:0}(${4:\\$s1})}\t\t# \n", uuid: '2B8E498B-DD6F-4815-AB95-DA2AE01B6BE6'

  tab 'move', 'move', <<-'TXT', uuid: '62D80F7F-437F-4413-9819-939DD017E419'
move 	${1:\$t0}, ${2:\$t1}		# $1 = $2
TXT

  tab 'mult', 'multiply', <<-'TXT', uuid: 'ECD0D84E-F275-42CB-AAC1-E675235579C2'
mult	${1:\$t0}, ${2:\$t1}			# $1 * $2 = Hi and Lo registers
mflo	${3:\$t2}					# copy Lo to $3

TXT

  tab 'print', 'print double', <<-'TXT', uuid: 'C1085122-0ED3-4C45-A2EC-AE1F0C867B42'
li		\$v0, 3		# system call #3 - print double
la		\$a0, ${1:variable}
syscall				# execute
TXT

  tab 'print', 'print float', <<-'TXT', uuid: '72E29A82-6A08-4420-AC4F-19CCD8F96777'
li		\$v0, 2		# system call #2 - print float
la		\$a0, ${1:variable}
syscall				# execute
TXT

  tab 'print', 'print int', <<-'TXT', uuid: '2C307A65-F254-44F7-8F6F-475005AE9187'
li		\$v0, 1		# system call #1 - print int
la		\$a0, ${1:variable}
syscall				# execute
TXT

  tab 'print', 'print string', <<-'TXT', uuid: '2441B939-ECCF-4815-8B44-E91F6124FD92', file: 'Print string'
li		\$v0, 1		# system call #4 - print string
la		\$a0, ${1:string}
syscall				# execute
TXT

  tab 'sb', 'store byte', "sb\t\t${1:\\$t1}, ${2:${3:0}(${4:\\$s1})}\t\t# \n", uuid: 'DFFBAC5F-C07A-49A8-8593-F06FD5FE56C4'

  tab 'string', 'string var', <<-'TXT', uuid: '78C8E3C2-DF37-41D7-ACED-8532985FFE54', file: 'string data'
${1:string}: .asciiz "$2"
TXT

  tab 'sub', 'substract', <<-'TXT', uuid: 'E3046DFB-BB1C-4052-98E9-B8416185A025'
sub		${1:\$t0}, ${2:\$t1}, ${3:\$t2}		# $1 = $2 - $3

TXT

  tab 'sw', 'store word', "sw\t\t${1:\\$t1}, ${2:${3:0}(${4:\\$s1})}\t\t# \n", uuid: '0FC6E5A9-4C17-4865-A53D-233C56CF91B5'

  tab 'var', 'variable', <<-'TXT', uuid: '9687482F-184C-4556-A370-B9D0F479DA8E'
${1:var}: .${2:word} $3
TXT

end