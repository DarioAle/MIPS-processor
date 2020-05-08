#/*
# *  towers_of_hanoi.asm
# *
# *  Created on: 25/02/2020
# *
# *  Authors: 
# *           Dario Arias Munoz
# *  Description:
#    This programs calculates the transpose, the matrix must be put in linear fashion, one
#    row at a time in the label vector1
#    Real part/ imaginary part
.data

Vector1: .word  1 2 3 -4 5 6 7 8 9 10 11 -12 13 14 15 16 17 -18
.text

Main:		
		
		addi $a0, $zero, 0x1001	# Loading base address upper half
		sll $a0, $a0 16		# Shifting to the left 16 positions

		addi $a1, $zero, 3 	# Number of columns
		addi $a2, $zero, 3 	# Number of rows
		
		# addi $s1, $a0,  64	# Addi to where the transpose it's gonna be
		
		add  $t1, $zero, $a2	# Load the number of rows
For_total2:	
		add  $t0, $zero, $a1	# Load number of columns
FOR_total1:	
		addi  $s7, $s7, 8
		addi $t0, $t0, -1		# Decrement counter columns
		bne  $t0, $zero, FOR_total1	# If counter column is not zero iterate
		
		addi $t1, $t1, -1	       # Decrement counter rows	
		bne  $t1, $zero, For_total2    # If number of columns is not zero , load againn columns
		
		add $s1, $a0, $s7	       # Now s1 holds the address where the copied matrix begin
	
		
				
		add $t0, $zero, $a2 	       # Load number of rows to index varaible
For_row:		
		add  $s6, $s6, 8
		addi $t0, $t0, -1		# Decrement counter
		bne  $t0, $zero, For_row	# If counter rows is not zero iterate
		
		# s6 is the number of elements by row 
		
		add $t7, $a2, $zero	# Load number of rows
FOR_OUTER:	
		add $t0, $a1, $zero	# Start at the number of columns
		
		add $s2, $zero, $s1         # temp value with the base adress
		add $s2, $s2, $t4	    # add the iteration numer multiple of four							
FOR_Inner:	
		lw   $t2, 4($a0)	    # Load consecutelive complex number
		lw   $t1, ($a0) 	    
		sw   $t1, ($s2)		    # store loaded value
		#addi $a0, $a0,  4	    # increment
		
		sub  $t2, $zero, $t2 
		sw   $t2, 4($s2)
		addi $a0, $a0, 8
		
		add $s2, $s2, $s6	    # Increment to next row 
		
		addi $t0, $t0, -1	    # Decrement counter
		bne  $t0, $zero, FOR_Inner  # If counter column is not zero iterate
		
		
		addi $t7, $t7, -1	    # Decremente counter
		addi $t4, $t4, 8	    # Increase which column to put the values to
		bne  $t7, $zero, FOR_OUTER  #if counter row is not zero iterate
		
		
		add $a0, $a0, $s0	# Set argument to number of disks
		j EXIT	
		
EXIT:
