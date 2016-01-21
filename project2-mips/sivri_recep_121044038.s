#############################################
# 	sivri_recep_121044038.s		    #
#  					    #
#   created by Recep Sivri on 30/102015	    #
# 	Description:			    #
#   This program computes less fee for	    #
#   accused.			            #
# 					    #
#############################################
.data
VilUFF: .word 6000 						#amounth of Ultimate Freedom Fee of Villain.
MisUFF:  .word 8000						#amounth of Ultimate Freedom Fee of Miscreant.
VilFwJF:  .word 4000						#amounth of Freedom with Jury Fee of Villain.
MisFwJF:  .word 3000						#amounth of Freedom with Jury Fee of Miscreant.
payOneJury:  .word 200						#amounth of pay of Jury.
str2: .space 20
str:  .asciiz "1.The name of the judge:" 
str3: .asciiz"Miscreant"
str6: .asciiz"Villain"
str5: .asciiz"\n"
str7: .asciiz"THERE IS NO JUDGE NAMED AS "
str8: .asciiz"2.The number of people in the jury: "
str9: .asciiz"(rule 1) "
str10: .asciiz"(rule 2) "
str11: .asciiz"(rule 3) "
str12: .asciiz"NL.\n"
str13:.asciiz" You have to spend "
str14:.asciiz"--------------- A NEW COURT ---------------\n"
plus:.asciiz" + "
multp:.asciiz"*"
equal:.asciiz"= "
.text

main:
li $v0,4 			#systemcall code for print string.
la $a0,str14			#send address of str14.
syscall				#prints string to screen.

li $v0,4 			#systemcall code for print string.
la $a0,str			#send address of str.
syscall				#prints string to screen.

li $v0,8			#systemcall code for read string.
la $a0, str2			#send address of str2 to $a0.
li $a1, 20 			#send size of str2 to $a1. 
syscall				#reads str2 from user .

la $a1,str3			#load address of str3 to $a1 because str3 and str2 compares in is_same procedure.

jal is_same			#calling is_same procedure.
move $t0,$v0			#move result to $t0.

beq $t0,0 NotEq1		#if $t0 is not 1 or 2 $t0 is equal with 0 goes to NotEql label.
li $t1,1			#if str2 user input same with miscreant $t1 will be 1.
j Prog				#goes to Prog label.
NotEq1: li,$t1,0		#in NotEql label if user input different with miscreant looks if same with Villain with User input.
la $a1,str6			#send to str6 to is_same so Villain and user input compares in is_same procedure.
jal is_same			#calling is_same.
move $t0,$v0			#move to result $t0.
beq $t0,0 NotEq2		#if $t0 is zero goes to  NotEq2 label.
li $t1,2			#if user input Equals with Villan $t1 will be 2
j Prog				#goes to Prog label.
NotEq2: li,$t1,0		#NotEq2 label $t1 will be 0 because user input is different from Villain and Miscraent.
beq $t1,0 Zero			#if  $t1 is equals with 0 goes to Zero label.

Prog:				#if user input equals Villain or Miscreant goes this label.
li $v0,4 			#systemcall code for  print string to screen.
la $a0,str8			#sends address of str8 because program asks number of juries to user.
syscall				#prints str8.
li $v0,5			#systemcall code for read int.
syscall				#read int which is number of juries.
move $t2,$v0			#moves number of juries to $t2
lw $s1,payOneJury		#load vaule of payOneJury to register $s1.


beq $t1,2 cal
lw $t3,MisUFF			#load Ultimate Freedom Fee of Miscreant to register $t3.
lw $t4,MisFwJF			#load Freedom with Jury Fee of Miscreant to register $t4.
j cont2
cal:lw $t3,VilUFF		#load Ultimate Freedom Fee of Villain to register $t3
lw $t4,VilFwJF			#load Freedom with Jury Fee of Villain to register $t4.
cont2:

move $a0,$t2			#sends number of juries to procedure as a argument.			
move $a1,$t3			#sends Ultimate Freedom Fee  to procedure as a argument.
jal rule_1			#calls procedure rule_1.
move $t5,$v0			#moves result of rule_1 to register $t5.
move $t8,$v1			#moves %10 of juries.
move $a0,$t2			#sends number of juries to procedure as a argument.
move $a1,$t4			#sends Freedom with Jury Fee  to procedure as a argument.
jal rule_2			#calls procedure rule_2.
move $t6,$v0			#moves result of rule_2 to register $t6.
move $t9,$v1			#moves %40 of juries to register $t9.
move $a0,$t2			#sends number of juries to procedure as a argument.
jal rule_3			#calls procedure rule_3.
move $t7,$v0			#moves result of rule_2 to register $t7.
move $s0,$v1			#moes ½80 of nýmber of juries to register $s0.
move $a0,$t5			#move register $t5(result or rule_1 ) to register $a0.
move $a1,$t6			#move register $t6(result or rule_2 ) to register $a1.			
move $a2,$t7			#move register $t7(result or rule_3 ) to register $a2.
jal calculate_less_fee		#calls  calculate_less_fee procedure this procedure calcaculates less fee.
move $t0,$v0			#move less fee to register $t0.

beq $t0,$t5 Rule1		#if $t5 equals less fee jumps Rule1 label.
beq $t0,$t6 Rule2		#if $t6 equals less fee jumps Rule2 label.
beq $t0,$t7 Rule3		#if $t7 equals less fee jumps Rule3 label.
Rule1:
li $v0,4 			#load 4 to $v0 for print string.					
la $a0,str9			#loads address of str9.			
syscall				#prints str9.
li $v0,4 			#load 4 to $v0 for print string.					
la $a0,str13			#loads address of str13.	
syscall				#prints str13.
li $v0,1			#load 1 to $v0 for print int.		
move $a0,$t3			#move $t3 to $a0 for print int.
syscall				#prints int.
li $v0,4 			#load 4 to $v0 for print string.
la $a0,plus			#loads address of plus.
syscall				#prints plus.
mult $t8,$s1			#multiples $t8 and s1 for calcaculate %10 of juries and payOneJury.
mflo $t8			#moves result to register $t8.
li $v0,1			#load 1 to $v0 for print int.
move $a0,$t8			#move $t8 to $a0 for print int
syscall				#prints int.
li $v0,4 			#load 4 to $v0 for print string
la $a0,equal			#loads address of equal.
syscall				#prints equal.
j sysExit			#goes sysExit label.
Rule2:
li $v0,4 			#load 4 to $v0 for print string.					
la $a0,str10			#loads address of str10.			
syscall				#prints str10.
li $v0,4 			#load 4 to $v0 for print string.					
la $a0,str13			#loads address of str13.	
syscall				#prints str13.
li $v0,1			#load 1 to $v0 for print int.		
move $a0,$t4			#move $t4 to $a0 for print int.
syscall				#prints int.
li $v0,4 			#load 4 to $v0 for print string.
la $a0,plus			#loads address of plus.
syscall				#prints plus.
mult $t9,$s1			#multiples $t9 and s1 for calcaculate %10 of juries and payOneJury.
mflo $t9			#moves result to register $t9.
li $v0,1			#load 1 to $v0 for print int.
move $a0,$t9			#move $t8 to $a0 for print int
syscall				#prints int.
li $v0,4 			#load 4 to $v0 for print string
la $a0,equal			#loads address of equal.
syscall				#prints equal.
j sysExit			#goes sysExit label.
Rule3:
li $v0,4 			#load 4 to $v0 for print string.					
la $a0,str11			#loads address of str10.			
syscall				#prints str10.
li $v0,4 			#load 4 to $v0 for print string.					
la $a0,str13			#loads address of str13.	
syscall	
sysExit:			
li $v0,1			#load 1 to $v0 for print int.
move $a0,$t0			#moves $t0 (less fee) to register $a0 to print.
syscall				#prints $t0.
li $v0,4 			#load 4 to $v0 for print string.
la $a0,str12			#loads address of NL string.
syscall				#prints NL
j exit12
Zero:
li $v0,4 			#if user input is different Villain and Miscraent and systemcall code for print string.
la $a0,str7			#prints str7 to screen because str7 contains invalid input message and sends to address of str7.
syscall				#prints str7 to screen.
li $v0,4 			#systemcall code for print string.
la $a0,str2			#sends address of str2 so invalid user input 
syscall				#prints invalid user input to screen.
li $v0,4 			#systemcall code for print string.
la $a0,str5			#sends address of str2 so invalid user input 
syscall				#prints invalid user input to screen.
exit12:
j main




is_same:			#is_same procedure this procedure compares two string returns 0 if not equal two string,
				#return 1 if two string is equal.
			
addi   $sp, $sp, -36		#get place for 9 item from stack.
sw $t0, 0($sp)			#save register $t0 to this adress in stack.
sw $t1, 4($sp)			#save register $t1 to this adress in stack.
sw $t2, 8($sp)			#save register $t2 to this adress in stack.
sw $t3, 12($sp)			#save register $t3 to this adress in stack.
sw $t4, 16($sp)			#save register $t4 to this adress in stack.	
sw $t5, 20($sp)			#save register $t5 to this adress in stack.
sw $t6, 24($sp)			#save register $t6 to this adress in stack.
sw $t7, 28($sp)			#save register $t7 to this adress in stack.
sw $t8,	32($sp)			#save register $t8 to this adress in stack.
move $t1,$a1			#move arument2 $a1 to register #t1.
move $t2,$a0			#move arument1 $a0 to register #t2.
move $t0,$zero			#move $zero to $t0.(counter1)
move $t3,$zero			#move $zero to $t3.(counter2)
move $t6,$t1			#move $t1(addres of str3 or str6) $t6.
move $t7,$t2			#move $t2(addres of user input) $t7.
loop1: lb $t4 0($t2)		#load first byte of $t2 to $t4(first element of user input).
addi $t2,$t2,1			#next byte of $t2(adds array index)
addi $t0,$t0,1			#adds $t0 (counter for loop1)
bne $t4,$zero loop1		#checks if content of $t4 is not equals zero,if equals zero breaks loop1.
li $t8,2
sub $t0,$t0,$t8		
loop2: lb $t5 0($t1)		#loads address of first byte in $t1 to $t5
addi $t1,$t1,1			#next byte of $t1(adds array index)
addi $t3,$t3,1			#adds $t3 (counter for loop2)
bne $t5,$zero loop2		#checks if content of $t5 is not equals zero,if equals zero breaks loop2.
li $t8,1
sub $t3,$t3,$t8			#substack 1 from register $t3.
bne $t0,$t3 Not			#if $t0 and $t3 is not equals goes to Not label.

loop3:lb $t2 0($t6)		#load first byte of $t6 to $t0.
lb $t3 0($t7)			#load first byte of $t7 t0 $t3.
bne $t2,$t3 Not			#if 4t0 and $t3 are not equal goes to Not label.
addi $t6,$t6,1			#increments $t6 
addi $t5,$t5,1			#increment $t5
addi $t7,$t7,1			#increments $t7 
slt $t4 $t5,$t0			#checks if $t5 less then $t0
beq $t4,1 loop3			#if $t0 equals with 0 goes to loop3 label.
li $v0,1			#returns 1 if each string is equals.
j Exit				#goes to Exit Label.
Not:li $v0,0			#returns if not equal each string.
Exit:	
lw $t0, 0($sp)			#load register $t0 from stack .	
lw $t1, 4($sp)			#load register $t1 from stack .	
lw $t2, 8($sp)			#load register $t2 from stack .			
lw $t3, 12($sp)			#load register $t3 from stack .	
lw $t4, 16($sp)			#load register $t4 from stack .	
lw $t5, 20($sp)			#load register $t5 from stack .	
lw $t6, 24($sp)			#load register $t6 from stack .	
lw $t7, 28($sp)			#load register $t7 from stack .	
lw $t8,	32($sp)			#load register $t8 from stack .	
addi $sp, $sp,36		#delete 9 item from stack.
jr $ra 				#jump back to calling routine


rule_1:
addi   $sp, $sp, -24			#get place for 8 item from stack.
sw $t0, 0($sp)				#save register $t0 to this adress in stack.
sw $t1, 4($sp)				#save register $t1 to this adress in stack.
sw $t2, 8($sp)				#save register $t2 to this adress in stack.
sw $t3, 12($sp)				#save register $t3 to this adress in stack.
sw $t4, 16($sp)				#save register $t4 to this adress in stack.	
sw $t5, 20($sp)				#save register $t5 to this adress in stack.

li $t0,10				#for divination	
move $t1,$a0				#move argument1 to register $t1.
div $t1, $t0				#divination processing.
mfhi $t2				#remaining.
mflo $t3 				#fraction.
bne $t2,0,status			#if remaining not equal zeo goes to status label.
move $t4,$t3				#moves result to register $t4.
j result				#goes jump label.
status:	
addi $t4,$t3,1				#increments result if remaining is not zero.
result:
lw $t5,payOneJury			#loads payOneJury to register $t5.
mult $t4,$t5				#multiple payOneJury and number of payed jury. 
mflo $t0				#takes result.
move $v1,$t4				#returns %10 of juries.
add $v0 $a1,$t0				#returns total pay for rule1.
lw $t0, 0($sp)				#load register $t0 from stack .	
lw $t1, 4($sp)				#load register $t1 from stack .	
lw $t2, 8($sp)				#load register $t2 from stack .			
lw $t3, 12($sp)				#load register $t3 from stack .	
lw $t4, 16($sp)				#load register $t4 from stack .	
lw $t5, 20($sp)				#load register $t5 from stack .	
addi $sp, $sp,24			#delete 8 item from stack.
jr $ra					#jump back to calling routine

rule_2:
addi   $sp, $sp, -24			#get place for 8 item from stack.
sw $t0, 0($sp)				#save register $t0 to this adress in stack.
sw $t1, 4($sp)				#save register $t1 to this adress in stack.
sw $t2, 8($sp)				#save register $t2 to this adress in stack.
sw $t3, 12($sp)				#save register $t3 to this adress in stack.
sw $t4, 16($sp)				#save register $t4 to this adress in stack.	
sw $t5, 20($sp)				#save register $t5 to this adress in stack.

li $t0,10				#for divination	
move $t1,$a0				#move argument1 to register $t1.
div $t1, $t0				#divination processing.
mfhi $t2				#remaining.
mflo $t3 				#fraction.
bne $t2,0,status1			#if remaining not equal zeo goes to status label.
move $t4,$t3				#moves result to register $t4.
j result1				#goes jump label.
status1:
addi $t4,$t3,1				#increments result if remaining is not zero.
result1:
lw $t5,payOneJury			#loads payOneJury to register $t5.
li $t2,4				#load 4 to register $t2.
mult $t4,$t2				#multiple 4 and number of %10 jury. 
mflo $t0				#takes result of multiply.
mult $t0,$t5				#multiple register $t5 and register $t2.
mflo $t2				#takes value of multiplication to register $t2.
add $v0,$a1,$t2				#adds pay of juries and amounth of Freedom with Jury Fee.
move $v1,$t0				#return ½40 of number of juries.
lw $t0, 0($sp)				#load register $t0 from stack .	
lw $t1, 4($sp)				#load register $t1 from stack .	
lw $t2, 8($sp)				#load register $t2 from stack .			
lw $t3, 12($sp)				#load register $t3 from stack .	
lw $t4, 16($sp)				#load register $t4 from stack .	
lw $t5, 20($sp)				#load register $t5 from stack .	
addi $sp, $sp,24			#delete 8 item from stack.
jr $ra					#jump back to calling routine

rule_3:
addi   $sp, $sp, -24				#get place for 8 item from stack.
sw $t0, 0($sp)					#save register $t0 to this adress in stack.
sw $t1, 4($sp)					#save register $t1 to this adress in stack.
sw $t2, 8($sp)					#save register $t2 to this adress in stack.
sw $t3, 12($sp)					#save register $t3 to this adress in stack.
sw $t4, 16($sp)					#save register $t4 to this adress in stack.	
sw $t5, 20($sp)					#save register $t5 to this adress in stack.

li $t0,10					#for divination	
move $t1,$a0					#move argument1 to register $t1.
div $t1, $t0					#divination processing.
mfhi $t2					#remaining.
mflo $t3 					#fraction.
bne $t2,0,status3				#if remaining not equal zeo goes to status label.
move $t4,$t3					#moves result to register $t4.
j result3					#goes jump label.
status3:
addi $t4,$t3,1					#increments result if remaining is not zero.
result3:
lw $t5,payOneJury				#loads payOneJury to register $t5.
li $t2,8					#load 4 to register $t2.
mult $t4,$t2					#multiple $t4  and $t2.
mflo $t0					#takes result of multiply.
mult $t5,$t0					#multiple register $t5 and register $t2.
mflo $t5					#takes value of multiplication to register $t0.
move $v0,$t5					#adds pay of juries and amounth of Freedom with Jury Fee.
move $v1,$t0					#return ½80 of number of juries.
lw $t0, 0($sp)					#load register $t0 from stack .	
lw $t1, 4($sp)					#load register $t1 from stack .	
lw $t2, 8($sp)					#load register $t2 from stack .			
lw $t3, 12($sp)					#load register $t3 from stack .	
lw $t4, 16($sp)					#load register $t4 from stack .	
lw $t5, 20($sp)					#load register $t5 from stack .	
addi $sp, $sp,24				#delete 8 item from stack.
jr $ra						#jump back to calling routine.

calculate_less_fee:				#This procedure calcaculates less fee.
addi   $sp, $sp, -12				#get place for 8 item from stack.
sw $t0, 0($sp)					#save register $t0 to this adress in stack.
sw $t1, 4($sp)					#save register $t1 to this adress in stack.
sw $t2, 8($sp)					#save register $t2 to this adress in stack.
slt $t0 $a0,$a1					#compares $a0 and $a1 registers.
beq $t0,1,less1					
move $t1,$a1					#if $a1 less then $a0 moves to $t1.
j next						
less1: move $t1,$a0				#else $a0 less then $a1 moves to $t1.
next:
slt $t0 $t1,$a2			
beq $t0,1,less2
move $t2,$a2					#if $a2 less then $t1 moves to $t2.
j exit
less2:
move $t2,$t1					#else $t2 less then $a2 moves to $t2.
exit:		
move $v0,$t2					#return less fee.																	
lw $t0, 0($sp)					#save register $t0 to this adress in stack.
lw $t1, 4($sp)					#save register $t1 to this adress in stack.
lw $t2, 8($sp)					#save register $t2 to this adress in stack.
addi   $sp, $sp, 12				#get place for 8 item from stack.
jr $ra						#jump back to calling routine.
