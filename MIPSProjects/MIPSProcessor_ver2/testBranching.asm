	# Test Branch Equal instruction 
	.text
	# Initializations
	addi $t0, $zero, 3
	addi $t1, $zero, 2
	addi $t2, $zero, 3
	addi $t3, $zero, 1
	
			
MoreIf:	beq $t0, $t2, if     # it is equal
notEqu:	sub $t0, $t0, $t3
if:	bne $t0, $zero, notEqu # It won't be equal. 
	beq $t0, $t1, MoreIf
	addi $t4, $zero, 0xF14
	
	
	