.data
string1: .asciiz"Dati dimensiunea matricei n="
string3: .asciiz"Dati elemenetele matricei:\n"
string4: .asciiz"Dati 2 numere 0<x<y<=n\n"
string5: .asciiz"Matricea este\n"
string6: .asciiz"\n"
n: .word 0
x: .word 0
y: .word 0
elem: .space 64
.text
main:
li $v0,4
la $a0,string1
syscall
li $v0,5
syscall
sw $v0,n

li $v0,4
la $a0,string4
syscall
li $v0,5
syscall
sw $v0,x
li $v0,5
syscall
sw $v0,y

lw $t7,n 
lw $t3,x
lw $t4,y        
mulo $t0,$t7,$t7
li $t1,0
la $t2,elem

li $v0,4
la $a0,string3
syscall

citire:
beq $t0,$t1,end_citire
addi $t1,1
li $v0,5
syscall
sw $v0,($t2)
addi $t2,4
b citire

end_citire:
li $t1,0
la $t2,elem
li $t5,4
mulo $t5,$t5,$t7
mulo $t6,$t5,$t3
add $t6,$t2,$t6
sub $t6,$t6,$t5

li $t5,4
mulo $t5,$t5,$t7
mulo $t8,$t5,$t4
add $t8,$t2,$t8
sub $t8,$t8,$t5

move $t2,$t6

parcurgere:
beq $t7,$t1,end_parcurgere
addi $t1,1
lw $t6,($t2)
lw $t9,($t8)
move $t5,$t6
sw $t9,($t2)
sw $t5,($t8)
addi $t2,$t2,4
addi $t8,$t8,4
b parcurgere

end_parcurgere:
li $v0,4
la $a0,string5
syscall

li $t1,0
li $t3,0
la $t2,elem

afisare:
beq $t3,$t7,new_line
cont:
addi $t3,1
beq $t0,$t1,end_afisare
addi $t1,1
lw $a0,($t2)
li $v0,1
syscall
addi $t2,4
b afisare


new_line:
li $v0,4
la $a0,string6
syscall
li $t3,0
j cont

end_afisare:
li $v0,10 
syscall
