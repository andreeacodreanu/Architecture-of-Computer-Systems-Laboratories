.data
string1: .asciiz "Dati lungimea mazima a sirului\n"
string2: .asciiz "Dati cheia de criptare\n"
string3: .asciiz "Se da cuvantul: "
alf: .asciiz "abcdefghijklmnopqrstuvwxyz"
string: .space 64
n: .word 0
k: .word 0
.data

proc:
move $t1,$a1
move $t0,$a2
la $t2,alf

loop:
lb $t3,($t2)
addi $t2,1
beq $t1,$t3,cript
back:
bnez $t3,loop

jr $ra

cript:
move $t5,$t2
add $t5,$t5,$t0
lb $t4,($t5)
sb $t4,($t2)
j back

main:
la $a0,alf
citire:
lb $s1,($a0)
addi $a0,1
bnez $s1,citire

li $v0,4
la $a0,string1
syscall

li $v0,5
syscall
sw $v0,n
lw $s0,n

li $v0,4
la $a0,string2
syscall

li $v0,5
syscall
sw $v0,k
lw $a2,k

li $v0,4
la $a0,string3
syscall

addi $a1,1
la $a0,string
li $v0,8
syscall

parcurgere: 
lb $s2,($a0)
move $a1,$s3
jal proc
addi $s0,1
bnez $s2,parcurgere

la $a0,string
li $v0,4

li $v0,10
syscall

