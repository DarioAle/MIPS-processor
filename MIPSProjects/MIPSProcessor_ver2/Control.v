/******************************************************************
* Description
*	This is control unit for the MIPS processor. The control unit is 
*	in charge of generation of the control signals. Its only input 
*	corresponds to opcode from the instruction.
*	1.0
* Author:
*	Mariana Chávez Medina
*	Darío Arias Muñoz
* Date:
*	07/04/2020
******************************************************************/
module Control
(
	input [5:0] in_OP_6,
	
	output o_RegDst,

	output o_BranchType, // 1 beq, 0 bne
	output o_BranchEn,
	output o_MemRead,

	output o_MemtoReg,
	output o_MemWrite,

	output o_ALUSrc,
	output o_RegWrite,

	output o_Jump,

	output [2:0] o_ALUOp_3
);
localparam R_Type      = 6'h 00;


localparam I_Type_ADDI = 6'h 08;
localparam I_Type_ORI  = 6'h 0D;
localparam I_Type_ANDI = 6'h 0C;
localparam I_Type_LUI  = 6'h 0F;

localparam I_Type_BEQ  = 6'h 04;
localparam I_Type_BNE  = 6'h 05; 

localparam I_Type_LW   = 6'h 23;
localparam I_Type_SW   = 6'h 2B;

localparam J_Type_J    = 6'h 02;
localparam J_Type_JAL  = 6'h 03;  

reg [11:0] r_ControlValues_12;

always@(in_OP_6) begin
	casex(in_OP_6)
	            //  Jump     RegDst  ALUsrc   MemToReg    RegWrite    MemRead    MemWrite   BranchEn    BranchType   ALUOp
		R_Type     :   r_ControlValues_12 = 12'b 0_1_001_00_00_111;

		I_Type_ADDI:   r_ControlValues_12 = 12'b 0_0_101_00_00_100;
		I_Type_ORI :   r_ControlValues_12 = 12'b 0_0_101_00_00_101;
		I_Type_ANDI:   r_ControlValues_12 = 12'b 0_0_101_00_00_110; 

		I_Type_BEQ :   r_ControlValues_12 = 12'b 0_0_000_00_11_001;
		I_Type_BNE :   r_ControlValues_12 = 12'b 0_0_000_00_10_001;

		J_Type_J   :   r_ControlValues_12 = 12'b 1_0_000_00_00_010;
		J_Type_JAL :   r_ControlValues_12 = 12'b 1_0_001_00_00_010;   // we send two as alu op to force no operation      

		I_Type_LUI :   r_ControlValues_12 = 12'b 0_0_101_00_00_000;
		I_Type_LW  :   r_ControlValues_12 = 12'b 0_0_111_10_00_011;
		I_Type_SW  :   r_ControlValues_12 = 12'b 0_0_100_01_00_011;

		default:
			r_ControlValues_12 = 12'b 000000000000;
		endcase
end	

assign o_Jump       = r_ControlValues_12[11];
assign o_RegDst     = r_ControlValues_12[10];
assign o_ALUSrc     = r_ControlValues_12[9];
assign o_MemtoReg   = r_ControlValues_12[8];
assign o_RegWrite   = r_ControlValues_12[7];
assign o_MemRead    = r_ControlValues_12[6];
assign o_MemWrite   = r_ControlValues_12[5];
assign o_BranchEn   = r_ControlValues_12[4];
assign o_BranchType = r_ControlValues_12[3];
assign o_ALUOp_3    = r_ControlValues_12[2:0];	

endmodule
//control//

