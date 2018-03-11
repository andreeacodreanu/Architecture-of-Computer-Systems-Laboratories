.data
string1: .asciiz "Dati numarul de elemente ale vectorului\n"
string2: .asciiz "Dati elementele vectorului\n"
n: .word 0

elem: .space 64

.text

factorial:
move $t1,$a0
li $t0,1
li $t4,1
loop:
mulo $t4,$t4,$t0
addi $t0,1
ble $t0,$t1,loop

move $v0,$t4
jr $ra

main:
li $v0,4
la $a0,string1
syscall

li $v0,5
syscall
sw $v0,n
lw $s0,n

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
lw $a0,($s2)
jal factorial
add $s4,$s4,$v0
addi $s2,4
b parcurgere

end_parcurgere:
move $a0,$s4
li $v0,1
syscall

li $v0,10
syscall