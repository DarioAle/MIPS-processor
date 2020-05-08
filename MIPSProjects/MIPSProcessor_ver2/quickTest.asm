	
	lui    $2, 0x1001
	addi   $3, $zero,  0x45
	sw     $3,($2) 

	
	addi   $3, $2, 0x4
	lw     $4, ($2)
	sw     $4, ($3) 
	
	addi  $2, $4, 0x20
	addi  $3, $4, 0x20
	
	beq   $2, $3, beq_
	add $0, $0, $0
	add $0, $0, $0
	add $0, $0, $0
	add $s2, $0, 0xFAI
beq_:	add $s2