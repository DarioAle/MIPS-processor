	
	.text
	# Initializations
	lui  $t0, 0xF
	ori  $t0,$t0,2
	addi $t1,$zero,3
	addi $t2,$zero,7
	addi $t3,$zero,1
	addi $s7, $s7, 0
	ori  $t4, $zero , 0x100
	addi $t5, $zero,  31
	andi $t5, $t5,    15
	sll  $t5, $t5, 4
	srl  $t5, $t5, 4
	sub  $t5, $t5, $t5
	
	beq  $zero, $t5, if	
	addi $t5, $t5, 0x715E
if:     addi $t5, $t5, 0x1F