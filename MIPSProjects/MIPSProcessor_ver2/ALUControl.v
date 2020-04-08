/******************************************************************
* Description
*	This is the control unit for the ALU. It receves an signal called 
*	ALUOp from the control unit and a signal called ALUFunction from
*	the intrctuion field named function.
* Version:
*	1.0
* Author:
*	Mariana Chávez Medina
*	Darío Arias Muñoz
* Date:
*	07/04/2020
******************************************************************/
module ALUControl
(
	input  [2:0] in_ALUOp_3,
	input  [5:0] in_ALUFunction_6,

	output [3:0] o_ALUOperation_4,
	output o_JumpRegister

);

localparam R_Type_AND    = 9'b 111_100100;
localparam R_Type_OR     = 9'b 111_100101;
localparam R_Type_NOR    = 9'b 111_100111;
localparam R_Type_ADD    = 9'b 111_100000;
localparam R_Type_SUB    = 9'b 111_100010;

localparam R_Type_SLL    = 9'b 111_000000;
localparam R_Type_SRL    = 9'b 111_000010;

localparam R_Type_JR     = 9'b 111_001000;

localparam I_Type_ADDI   = 9'b 100_xxxxxx;
localparam I_Type_ORI    = 9'b 101_xxxxxx;
localparam I_Type_ANDI   = 9'b 110_xxxxxx;

localparam I_Type_LUI    = 9'b 000_xxxxxx;
localparam I_Type_LW     = 9'b 011_xxxxxx;

localparam I_Type_BR     = 9'b 001_xxxxxx; // Operation for branching it's the same regardless eq or ne : substraction

localparam J_Type_J      = 9'b 010_xxxxxx;

reg  [3:0] r_ALUControlValues_4;
wire [8:0] w_Selector_9;

assign w_Selector_9 = {in_ALUOp_3, in_ALUFunction_6};

always@(w_Selector_9)begin
	casex(w_Selector_9)
		R_Type_AND :  r_ALUControlValues_4 = 4'b 0000;
		R_Type_OR  :  r_ALUControlValues_4 = 4'b 0001;
		R_Type_NOR :  r_ALUControlValues_4 = 4'b 0010;
		R_Type_ADD :  r_ALUControlValues_4 = 4'b 0011;
		R_Type_SUB :  r_ALUControlValues_4 = 4'b 0100;

		R_Type_SLL :  r_ALUControlValues_4 = 4'b 0101;
		R_Type_SRL :  r_ALUControlValues_4 = 4'b 0110;

		R_Type_JR :   r_ALUControlValues_4 = 4'b 1001; // we assign the same as default value, we don't want to perform operations

		I_Type_LUI :  r_ALUControlValues_4 = 4'b 0111;
		I_Type_LW  :  r_ALUControlValues_4 = 4'b 0011; // We add sign extend and address in register to get definitive address 

		I_Type_ADDI:  r_ALUControlValues_4 = 4'b 0011;
		I_Type_ORI :  r_ALUControlValues_4 = 4'b 0001;
		I_Type_ANDI:  r_ALUControlValues_4 = 4'b 0000;

		I_Type_BR  :  r_ALUControlValues_4 = 4'b 0100;
		J_Type_J   :  r_ALUControlValues_4 = 4'b 1001; // we assign the same as default value, we don't want to perform operations
		
		default: r_ALUControlValues_4 = 4'b 1001;
	endcase
end

assign o_JumpRegister = (w_Selector_9 == R_Type_JR) ? 1'b 1 : 1'b 0;
assign o_ALUOperation_4 = r_ALUControlValues_4;

endmodule
//alucontrol//