	
	lui    $2, 0x1001
	addi   $3, $zero,  0x45
	sw     $3,($2) 

	
	addi   $3, $2, 0x4
	lw     $4, ($2)
	sw     $4, ($3) 
