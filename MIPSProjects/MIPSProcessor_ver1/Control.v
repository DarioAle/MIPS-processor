/******************************************************************
* Description
*	This is control unit for the MIPS processor. The control unit is 
*	in charge of generation of the control signals. Its only input 
*	corresponds to opcode from the instruction.
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	01/03/2014
******************************************************************/
module Control
(
	input [5:0] OP,
	
	output RegDst,

	output BranchType, // 1 beq, 0 bne
	output BranchEn,
	output MemRead,

	output MemtoReg,
	output MemWrite,

	output ALUSrc,
	output RegWrite,

	output [2:0] ALUOp
);
localparam R_Type      = 6'h 00;


localparam I_Type_ADDI = 6'h 08;
localparam I_Type_ORI  = 6'h 0D;
localparam I_Type_ANDI = 6'h 0C;
localparam I_Type_LUI  = 6'h 0F;

localparam I_Type_BEQ  = 6'h 04;
localparam I_Type_BNE  = 6'h 05;  

reg [10:0] ControlValues;

always@(OP) begin
	casex(OP)
	//       RegDst  ALUsrc   MemToReg    RegWrite    MemRead    MemWrite   BranchEn    BranchType   ALUOp
		R_Type     :  ControlValues = 11'b 1_001_00_00_111;

		I_Type_ADDI:  ControlValues = 11'b 0_101_00_00_100;
		I_Type_ORI :  ControlValues = 11'b 0_101_00_00_101;
		I_Type_ANDI:  ControlValues = 11'b 0_101_00_00_110; // Chose 110 randomly to see if it works, haven't figure out where this bits come from

		// RegDst   0, we don't write to register [15-11]
		// ALUsrc   0, we don't read from immediate
		// RewWrite 0, we don't write to any regsiter 

		// MemToRead 0, we don't read or write to memory
		// MemWrite 0, we don't write either

		// Enable Branching
		// Branch Type it's a branch on Equal 1

		// ALU OP it's a substraction code 001
		I_Type_BEQ:   ControlValues = 11'b 0_000_00_11_001;
		I_Type_BNE:   ControlValues = 11'b 0_000_00_10_001;               

		I_Type_LUI :  ControlValues = 11'b 0_101_00_00_000; // Chose 110 randomly to see if it works, haven't figure out where this bits come from

		default:
			ControlValues= 10'b 0000000000;
		endcase
end	
	
assign RegDst     = ControlValues[10];
assign ALUSrc     = ControlValues[9];
assign MemtoReg   = ControlValues[8];
assign RegWrite   = ControlValues[7];
assign MemRead    = ControlValues[6];
assign MemWrite   = ControlValues[5];
assign BranchEn   = ControlValues[4];
assign BranchType = ControlValues[3];
assign ALUOp      = ControlValues[2:0];	

endmodule
//control//

