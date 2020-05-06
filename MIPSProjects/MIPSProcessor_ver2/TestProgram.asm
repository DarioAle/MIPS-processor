	
	.text
	# Initializations
	addi $t0, $zero, 0x100
	lui  $t0, 0x1001	# ALU: 0x10010000
	ori  $t1,$zero,0xFFF	# ALU: 0xFFF
	addi $t2,$zero,0xAB5	# ALU: 0xAB5
	add  $0, $0, $0		# NOP
	andi $t3, $t1, 0x3	# ALU: 0x3
	and  $t4, $t1, $t2	# ALU: 0xAB5
	add  $0, $0, $0		# NOP
	nor  $t5, $t2, $t3	# ALU: 0xffff f548
	or   $t5, $t2, $t3	# ALU: 0xAB7
	srl  $t6, $t0, 4	# ALU: 0x01001000
	sll  $t6, $t2, 4	# ALU: AB50
	sub  $s0, $t5, $t3	# ALU: AB4
	add  $s1, $t5, $t3	# ALU: ABA
	
	sw  $s1, ($t0)		#: 0x1001 0000
	add $0, $0, $0		# NOP
	add $0, $0, $0		# NOP
	add $0, $0, $0		# NOP
	lw  $s3, ($t0)		# 0x1001 0000: aba
	
	beq  $s1, $s1, br_eq	# ALU Zero
	add  $0, $0, $0
	add  $0, $0, $0
	addi $s4, $zero, 0xFA1
j_:	bne  $s4, $t0, br_neq
	add  $0, $0, $0
	add  $0, $0, $0
	addi $s4, $zero ,0xFA1
br_eq:	j j_
	add  $0, $0, $0
	add  $0, $0, $0
	add $s4, $zero, 0xFA1
br_neq: jal fx 
	add  $0, $0, $0
	add  $0, $0, $0
   	j EXIT
   	add $0, $0, $0
   	add $0, $0, $0
		
fx:    add $s6, $0, 0x100 
       add  $0, $0, $0
       add  $0, $0, $0
       jr  $ra
       add $0, $0, $0
       add $0, $0, $0

EXIT:
	
	

