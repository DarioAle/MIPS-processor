/******************************************************************
* Description
*	This is the control unit for the ALU. It receves an signal called 
*	ALUOp from the control unit and a signal called ALUFunction from
*	the intrctuion field named function.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	01/03/2014
******************************************************************/
module ALUControl
(
	input  [2:0] ALUOp,
	input  [5:0] ALUFunction,

	output [3:0] ALUOperation

);

localparam R_Type_AND    = 9'b 111_100100;
localparam R_Type_OR     = 9'b 111_100101;
localparam R_Type_NOR    = 9'b 111_100111;
localparam R_Type_ADD    = 9'b 111_100000;

localparam R_Type_SLL    = 9'b 111_000000;
localparam R_Type_SRL    = 9'b 111_000010;

localparam I_Type_ADDI   = 9'b 100_xxxxxx;
localparam I_Type_ORI    = 9'b 101_xxxxxx;
localparam I_Type_ANDI   = 9'b 110_xxxxxx;
localparam I_Type_LUI    = 9'b 000_xxxxxx;

reg  [3:0] ALUControlValues;
wire [8:0] Selector;

assign Selector = {ALUOp, ALUFunction};

always@(Selector)begin
	casex(Selector)
		R_Type_AND :  ALUControlValues = 4'b 0000;
		R_Type_OR  :  ALUControlValues = 4'b 0001;
		R_Type_NOR :  ALUControlValues = 4'b 0010;
		R_Type_ADD :  ALUControlValues = 4'b 0011;

		R_Type_SLL :  ALUControlValues = 4'b 0101;
		R_Type_SRL :  ALUControlValues = 4'b 0110;

		I_Type_LUI :  ALUControlValues = 4'b 0101;

		I_Type_ADDI:  ALUControlValues = 4'b 0011;
		I_Type_ORI :  ALUControlValues = 4'b 0001;
		I_Type_ANDI:  ALUControlValues = 4'b 0000;
		
		default: ALUControlValues = 4'b 1001;
	endcase
end


assign ALUOperation = ALUControlValues;

endmodule
//alucontrol//