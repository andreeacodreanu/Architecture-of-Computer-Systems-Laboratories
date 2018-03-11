.data
sir: .asciiz "aaabbcddde"
.text
main:
la $a0,sir
lb $t0,0($a0)
li $t2,1
li $t3,1  #$t3-max
for:
beqz $t0,sfarsit
addi $a0,1
lb $t1,0($a0)
beq $t0,$t1,adun
bgt $t2,$t3,maxim
li $t2,1
lb $t0,0($a0)
j for
maxim:
move $t3,$t2
li $t2,1
lb $t0,0($a0)
j for
adun:
addi $t2,1
j for
sfarsit:
li $v0,10
syscall