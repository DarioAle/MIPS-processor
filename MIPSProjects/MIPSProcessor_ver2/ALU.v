/******************************************************************
* Description
*	This is an 32-bit arithetic logic unit that can execute the next set of operations:
*		add
*		sub
*		or
*		and
*		nor
* This ALU is written by using behavioral description.
* Version:
*	1.0
* Author:
*	Mariana Chávez Medina
*	Darío Arias Muñoz
* Date:
*	07/04/2020
******************************************************************/

module ALU 
(
	input [3:0]  in_ALUOperation_4,
	input [31:0] in_A_32,
	input [31:0] in_B_32,
	input [4:0]  in_shamt_5,

	output reg o_Zero,
	output reg [31:0] o_ALUResult_32
);

localparam AND = 4'b 0000;
localparam OR  = 4'b 0001;
localparam NOR = 4'b 0010;
localparam ADD = 4'b 0011;
localparam SUB = 4'b 0100;

localparam SLL = 4'b 0101;
localparam SRL = 4'b 0110;

localparam LUI = 4'b 0111;


wire [4:0]  w_definitive_shamt_5;
wire [31:0] w_leftShifted_32;
wire [31:0] w_rightShifted_32;


assign w_definitive_shamt_5 = (in_ALUOperation_4 == 4'b 0111) ? 5'b 10000 : in_shamt_5;


SLL_32 LeftShifter
(	.in_data_32(in_B_32),
 	.in_shamt_5(w_definitive_shamt_5),
 	.out_shifted_data_32(w_leftShifted_32)
);

SRL_32 RightShifter
(	.in_data_32(in_B_32),
 	.in_shamt_5(in_shamt_5),
 	.out_shifted_data_32(w_rightShifted_32)
);


   always @ (in_A_32 or in_B_32 or in_ALUOperation_4 or w_leftShifted_32 or w_rightShifted_32)
     begin
		case (in_ALUOperation_4)
		  ADD: // add
			o_ALUResult_32 =   in_A_32 + in_B_32;
		  SUB: // sub
			o_ALUResult_32 =   in_A_32 - in_B_32;
		  AND: 
			o_ALUResult_32 =   in_A_32 & in_B_32;
		  NOR:
			o_ALUResult_32 = ~(in_A_32 | in_B_32);
		  OR:
			o_ALUResult_32 =   in_A_32 | in_B_32;
		  SLL:
		  	o_ALUResult_32 = w_leftShifted_32;
		  LUI:
		  	o_ALUResult_32 = w_leftShifted_32;
		  SRL:
			o_ALUResult_32 = w_rightShifted_32;

		  default:
			o_ALUResult_32 = 0;
		endcase // case(control)
		o_Zero = (o_ALUResult_32 == 0) ? 1'b 1 : 1'b 0;
     end // always @ (A or B or control)
endmodule 
// alu//