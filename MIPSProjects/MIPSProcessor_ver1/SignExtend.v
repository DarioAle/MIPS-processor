/******************************************************************
* Description
*	This module performes a sign-extend operation that is need with
*	in instruction like andi or ben.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	01/03/2014
******************************************************************/
module SignExtend
(   
	input [15:0]  DataInput,
	input [5:0]   i_Instruction,

    output[31:0] SignExtendOutput
);

assign  SignExtendOutput = (i_Instruction == 6'h c ||
                            i_Instruction == 6'h d) ?  {16'b 0, DataInput[15:0]} :
                                                       {{16{DataInput[15]}},DataInput[15:0]};

endmodule 
// signextend//
