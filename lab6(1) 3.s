.data
string1: .asciiz "Lungimea maxima a sirului\n"
string2: .asciiz "Se da sirul\n"
n: .word 0
string: .space 64
.text

Aa:
move $t1,$a1
li $t2,'A'
li $t3,'a'
beq $t2,$t1,A
beq $t3,$t1,a
j end_Aa

A:
sb $t3,($a0)
j end_Aa

a:
sb $t2,($a0)

end_Aa:
jr $ra

main:
li $v0,4
la $a0,string1
syscall

li $v0,5
syscall
sw $v0,n

lw $s7,n

li $v0,4
la $a0,string2
syscall

addi $a1,1
la $a0,string
li $v0,8
syscall

loop:
lb $s3,($a0)
move $a1,$s3
jal Aa
addi $a0,1
bnez $s3,loop

la $a0,string
li $v0,4
syscall

li $v0,10
syscall
