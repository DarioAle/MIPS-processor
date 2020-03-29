	# Test Jump
	.text
	# Initializations
	addi $t0, $zero, 1
	addi $t1, $zero, 2
	addi $t2, $zero, 3
	addi $t3, $zero, 4
	j ten 
one:	addi $t0, $zero, 1
	addi $t1, $zero, 2
	addi $t2, $zero, 3
	addi $t3, $zero, 4
	jal  somewhere
	addi $t4, $zero, 0xf14
	j fin
ten:	addi $t4, $zero, 10
	addi $t4, $zero, 11
	addi $t4, $zero, 12
	addi $t4, $zero, 13
	j, one
	


somewhere:addi $t4, $zero 0xFE0
	addi $t4, $zero 0xFEA
	addi $t4, $zero 0xCA7
	addi $t4, $zero 0xD02
	jr $ra
	
	
fin:   

			
			

	
	
	
