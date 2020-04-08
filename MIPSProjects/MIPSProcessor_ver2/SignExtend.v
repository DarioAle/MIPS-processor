/******************************************************************
* Description
*	This module performes a sign-extend operation that is need with
*	in instruction like andi or ben.
* Version:
*	1.0
* Author:
*	Mariana Chávez Medina
* 	Darío Arias Muñoz
* Date:
*	08/04/2020
******************************************************************/
module SignExtend
(   
	input  [15:0]  DataInput,
	input  [2:0]   i_aluOP_3,

    output [31:0]  SignExtendOutput
);

// If alu operation is ori or andi, we should not extend the sign.
assign  SignExtendOutput = (i_aluOP_3 == 3'h 5 ||
                            i_aluOP_3 == 3'h 6) ?  {16'b 0, DataInput[15:0]}             :
                                                   {{16{DataInput[15]}}, DataInput[15:0]};

endmodule 
// signextend//
