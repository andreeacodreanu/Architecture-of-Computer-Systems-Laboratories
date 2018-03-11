.data
string1: .asciiz"Dati dimensiunea matricei\n"
string3: .asciiz"Dati elemenetele matricei\n"
string4: .asciiz"Toate elementele de pe diagonala principala sunt impare\n"
string5: .asciiz"Nu toate elementele pe pe diagonala principala sunt impare\n"
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

lw $t7,n
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
li $t3,2
li $t5,4
mulo $t5,$t7,$t5

parcurgere:
bge $t1,$t0,end_parcurgere
addi $t1,1
add $t1,$t7,$t1
lw $t6,($t2)
rem $t4,$t6,$t3
beqz $t4,end
addi $t2,4
add $t2,$t5,$t2
b parcurgere

end_parcurgere:
li $v0,4
la $a0,string4
syscall
li $v0,10 
syscall

end:
li $v0,4
la $a0,string5
syscall
li $v0,10 
syscall