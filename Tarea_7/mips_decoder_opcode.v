/******************************************************************
* Description
*		Decoder for the type of instructions
*		In MIPS processor
*
* Version:
*	1.0
* Author:
*	Darío Arias Muñoz
* email:
*	darioaam@gmail.com
* Date:
*	12/03/2020
******************************************************************/
module mips_decoder_opcode
(
	input [5:0] in_opcode_6,
	output out_I_type,
	output out_R_type,
	output out_J_type
	 
);



	assign out_R_type = (~in_opcode_6[5]) & (~in_opcode_6[4]) & (~in_opcode_6[3]) & (~in_opcode_6[2]) & (~in_opcode_6[1]) & (~in_opcode_6[0]); // 0x0
							  
							  
	assign out_J_type = (~in_opcode_6[5]) & (~in_opcode_6[4]) & (~in_opcode_6[3]) & (~in_opcode_6[2]) & ( in_opcode_6[1]) & (~in_opcode_6[0]) |  // 0x2
	
					 	(~in_opcode_6[5]) & (~in_opcode_6[4]) & (~in_opcode_6[3]) & (~in_opcode_6[2]) & ( in_opcode_6[1]) & ( in_opcode_6[0]);   // 0x3 
						
							  
	assign out_I_type = (~out_R_type) & (~out_J_type);
							  
endmodule
