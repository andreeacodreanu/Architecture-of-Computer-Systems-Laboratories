.data
# declaratii date
.text
# cod
main: # eticheta marcand punctul de start
# cod
li $t2,0x7fffffff
li $t3,0x00000001
addu $t1,$t2,$t3
add $t0,$t2,$t3
li $v0,10
syscall