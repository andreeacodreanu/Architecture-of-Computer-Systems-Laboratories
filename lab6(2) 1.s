.data
string1: .asciiz"Dati dimensiunea matricei\n"
string3: .asciiz"Dati elemenetele matricei\n"
n: .word 0
elem: .space 64
.text

suma:
move $t0,$a0
move $t1,$a1
li $t2,0
li $t5,0
li $t4,4
mulo $t4,$s7,$t4
addi $t4,$t4,4

parcurgere:
bge $t2,$t0,end_parcurgere
addi $t2,$t2,1
add $t2,$s7,$t2
lw $t3,($t1)
add $t5,$t5,$t3
add $t1,$t1,$t4
b parcurgere
end_parcurgere:

move $v1,$t5
jr $ra

main:
li $v0,4
la $a0,string1
syscall
li $v0,5
syscall
sw $v0,n
lw $s7,n

mulo $s0,$s7,$s7
li $s1,0
la $s2,elem

li $v0,4
la $a0,string3
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
la $s2,elem
move $a0,$s0
move $a1,$s2

jal suma

move $a0,$v1
li $v0,1
syscall

li $v0,10
syscall