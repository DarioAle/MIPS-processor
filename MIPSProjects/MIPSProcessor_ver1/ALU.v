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
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	01/03/2014
******************************************************************/

module ALU 
(
	input [3:0] ALUOperation,
	input [31:0] A,
	input [31:0] B,
	input [4:0] in_shamt_5,

	output reg Zero,
	output reg [31:0]ALUResult
);

localparam AND = 4'b 0000;
localparam OR  = 4'b 0001;
localparam NOR = 4'b 0010;
localparam ADD = 4'b 0011;
localparam SUB = 4'b 0100;

localparam SLL = 4'b 0101;
localparam SRL = 4'b 0110;



wire [4:0]  w_definitive_shamt_5;
wire [31:0] w_leftShifted_32;

mux_2To1_shamt ChooseShamt
(
	.in_channelA_5 (5'b 10000),
	 .in_channelB_5(in_shamt_5),
	.in_selector_5 (in_shamt_5),
	.out_Zoutput_5 (w_definitive_shamt_5)
);


SLL_32 LeftShifter
(	.in_data_32(B),
 	.in_shamt_5(w_definitive_shamt_5),
 	.out_data_32(w_leftShifted_32)
);

   always @ (A or B or ALUOperation)
     begin
		case (ALUOperation)
		  ADD: // add
			ALUResult =   A + B;
		  SUB: // sub
			ALUResult =   A - B;
		  AND: 
			ALUResult =   A & B;
		  NOR:
			ALUResult = ~(A | B);
		  OR:
			ALUResult =   A | B;
		  SLL:
		  	ALUResult = w_leftShifted_32;

		default:
			ALUResult = 0;
		endcase // case(control)
		Zero = (ALUResult == 0) ? 1'b1 : 1'b0;
     end // always @ (A or B or control)
endmodule 
// alu//