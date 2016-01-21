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
str14:.asciiz"numara gir faktöriel gir:"
plus:.asciiz" + "
multp:.asciiz"*"
equal:.asciiz"= "
.text

main:
li $v0,4 			#systemcall code for print string.
la $a0,str14			#send address of str14.
syscall				#prints string to screen.
li $v0,5			#systemcall code for read int.
syscall				#read int which is number of juries.
move $t2,$v0			#moves number of juries to $t2


jal fact


 fact:     addi $sp, $sp, -8     # adjust stack for 2 items     
 sw   $ra, 4($sp)      # save return address    
  sw   $a0, 0($sp)      # save argument     
  slti $t0, $a0, 1      # test for n < 1     
  beq  $t0, $zero, L1    
   addi $v0, $zero, 1    # if so, result is 1     
  addi $sp, $sp, 8      #   pop 2 items from stack    
   jr   $ra              #   and return 
   L1: addi $a0, $a0, -1     # else decrement n      
    jal  fact             # recursive call     
    lw   $a0, 0($sp)      # restore original n     
    lw   $ra, 4($sp)      #   and return address     
    addi $sp, $sp, 8      # pop 2 items from stack     
    mul  $v0, $a0, $v0    # multiply to get result     
    jr   $ra

