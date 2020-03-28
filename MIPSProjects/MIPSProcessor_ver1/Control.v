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

	output Jump,

	output [2:0] ALUOp
);
localparam R_Type      = 6'h 00;


localparam I_Type_ADDI = 6'h 08;
localparam I_Type_ORI  = 6'h 0D;
localparam I_Type_ANDI = 6'h 0C;
localparam I_Type_LUI  = 6'h 0F;

localparam I_Type_BEQ  = 6'h 04;
localparam I_Type_BNE  = 6'h 05; 

localparam I_Type_LW   = 6'h 23;

localparam J_Type_J    = 6'h 02;
localparam J_Type_JAL  = 6'h 03;  

reg [11:0] ControlValues;

always@(OP) begin
	casex(OP)
	            //  Jump     RegDst  ALUsrc   MemToReg    RegWrite    MemRead    MemWrite   BranchEn    BranchType   ALUOp
		R_Type     :  ControlValues = 12'b 0_1_001_00_00_111;

		I_Type_ADDI:  ControlValues = 12'b 0_0_101_00_00_100;
		I_Type_ORI :  ControlValues = 12'b 0_0_101_00_00_101;
		I_Type_ANDI:  ControlValues = 12'b 0_0_101_00_00_110; // Chose 110 randomly to see if it works, haven't figure out where this bits come from

		// RegDst   0, we don't write to register [15-11]
		// ALUsrc   0, we don't read from immediate
		// RewWrite 0, we don't write to any regsiter 

		// MemToRead 0, we don't read or write to memory
		// MemWrite 0, we don't write either

		// Enable Branching
		// Branch Type -> it's  beq 1 | bne

		// ALU OP it's a substraction code 001
		I_Type_BEQ :   ControlValues = 12'b 0_0_000_00_11_001;
		I_Type_BNE :   ControlValues = 12'b 0_0_000_00_10_001;

		J_Type_J   :   ControlValues = 12'b 1_0_000_00_00_010;
		J_Type_JAL :   ControlValues = 12'b 1_0_001_00_00_010;      // we send two as alu op to force no operation      

		I_Type_LUI :   ControlValues = 12'b 0_0_101_00_00_000;
		I_Type_LW  :   ControlValues = 12'b 0_0_111_10_00_011;


		default:
			ControlValues= 12'b 000000000000;
		endcase
end	

assign Jump       = ControlValues[11];
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

