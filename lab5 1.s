.data
a1: .word 1
a2: .word 2
.text

proc:
move $t0,$a0
move $t1,$a1
li $t2,3
mulo $t2,$t2,$t0
add $t3,$t1,$t2
move $v0,$t3
jr $ra

main:
li $s0,0
lw $a0,a1
lw $a1,a2
jal proc
move $a0,$a1
move $a1,$v0
jal proc
move $a0,$a1
move $a1,$v0
jal proc
move $t0,$v0
li $v0,10
syscall

