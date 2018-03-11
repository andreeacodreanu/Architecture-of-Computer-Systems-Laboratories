.data
.text
main:
div $t1,$t2
mflo $t3
div $t2,$t1
mfhi $t4
mulo $t5,$t3,$4
li $v0,10
syscall
