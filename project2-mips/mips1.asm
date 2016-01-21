.data

str2: .space 20
.text
main:

li $v0,8
la $a0,str2
li $a1, 20 
syscall

li $v0,4
la $a0,str2
syscall