.data
string1: .asciiz "Dati numarul de elemente ale vectorului\n"
string2: .asciiz "Dati elementele vectorului\n"
string3: .asciiz "Dati puterea p="
n: .word 0
p: .word 0
elem: .space 64

.text

putere:
move $t0,$s6
move $t1,$s7
li $t2,0
li $t5,1

loop:
beq $t1,$t2,end
addi $t2,1
mulo $t5,$t5,$t0
b loop

end:
move $v1,$t5
jr $ra

main:
li $v0,4
la $a0,string1
syscall

li $v0,5
syscall
sw $v0,n
lw $s0,n

li $v0,4
la $a0,string3
syscall

li $v0,5
syscall
sw $v0,p
lw $s7,p

li $s1,0
la $s2,elem

li $v0,4
la $a0,string2
syscall

citire:
beq $s0,$s1,end_citire
addi $s1,$s1,1
li $v0,5
syscall
sw $v0,($s2)
addi $s2,$s2,4
b citire

end_citire:
li $s1,0
la $s2,elem

li $s4,0

parcurgere:
beq $s0,$s1,end_parcurgere
addi $s1,1
lw $s6,($s2)
jal putere
add $s4,$s4,$v1
addi $s2,4
b parcurgere

end_parcurgere:
move $a0,$s4
li $v0,1
syscall
li $v0,10
syscall