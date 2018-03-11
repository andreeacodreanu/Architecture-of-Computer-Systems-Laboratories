.data
string1: .asciiz "Dati numarul de elemente ale vectorului\n"
string2: .asciiz "Dati elementele vectorului\n"
string3: .asciiz " "
string4: .asciiz "Vectorul sortat este\n"
n: .word 0
elem: .space 64
.text
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

parcurgere:
beq $s0,$s1,end_parcurgere
addi $s1,1
lw $s3,($s2)
lw $s4,4($s2)
bgt $s3,$s4,swap
addi $s2,$s2,4
b parcurgere

end_parcurgere:

li $s1,0
la $s2,elem

li $v0,4
la $a0,string4
syscall

addi $s2,$s2,4

afisare:
beq $s0,$s1,end_afisare
addi $s1,$s1,1
lw $a0,($s2)
li $v0,1
syscall
addi $s2,$s2,4

li $v0,4
la $a0,string3
syscall

b afisare

end_afisare:

li $v0,10
syscall

swap:
move $s5,$s3
sw $s3,4($s2)
sw $s4,($s2)
la $s2,elem
li $s1,0
b parcurgere
