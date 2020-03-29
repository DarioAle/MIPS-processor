	# Test Load Word
	.text
	# Initializations
	addi $a1, $zero, 0x1000	# Loading base address upper half for Peg A
	sll $a1, $a1 16		# Shifting to the left 16 positions
	
	addi $t1, $zero, 0xDA1
	sw   $t1, ($a1)
			
	lw   $t7, ($a1)
	andi $t7, 0xFF0
	

			
			

	
	
	
