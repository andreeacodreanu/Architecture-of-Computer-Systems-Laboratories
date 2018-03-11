.data
sir1:.asciiz "Da"
sir2:.asciiz "Nu"
.text
main:
li $v0,5
syscall
move $t0,$v0
li $v0,5
syscall
move $t1,$v0
li $t2,10

eticheta:
div $t0,$t2
mfhi $t3
mflo $t0
beq $t3,$t1,da
beqz $t0,nu
bgtz $t0,eticheta

da:
li $v0,4
la $a0,sir1
syscall
li $v0,10
syscall
nu:
li $v0,4
la $a0,sir2
syscall
li $v0,10
syscall