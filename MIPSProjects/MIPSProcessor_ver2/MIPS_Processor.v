/******************************************************************
* Description
*	This is the top-level of a MIPS processor
* This processor is written Verilog-HDL. Also, it is synthesizable into hardware.
* Parameter MEMORY_DEPTH configures the program memory to allocate the program to
* be execute. If the size of the program changes, thus, MEMORY_DEPTH must change.
* This processor was made for computer organization class at ITESO.
******************************************************************/


module MIPS_Processor
#(
	parameter MEMORY_DEPTH = 64
)

(
	// Inputs
	input clk,
	input reset,

	// Output
	output [31:0] ALUResultOut
);
//******************************************************************/
//******************************************************************/


//******************************************************************/
//******************************************************************/

// Branching wires
wire w_BranchType;
wire w_BranchEn;
wire w_branchingControlSignal;
wire [31:0] w_MuxBranchingOut_32;
wire [31:0] w_AdderBranching_32;

// Jumping wires
wire w_jumpControlSignal;
wire w_jumpAndLinkControl;
wire w_jumprRegisterControl;
wire [31:0] w_MuxJumpingOut_32;
wire [4:0]  w_MuxSelectRA_5;
wire [31:0] w_jumRegisterToPC_32;

// Program Counter wires
wire [31:0] w_PC_wireToROM_32;
wire [31:0] w_PC_wirePlus4_32;

// Register wires
wire w_RegWrite;
wire w_RegDst;
wire [31:0] w_writeDataRegisterFile_32;
wire [4:0] 	w_WriteRegisterAddress_5;
wire [31:0] w_ReadData1_32;
wire [31:0] w_ReadData2_32;
wire [31:0] w_Instruction_32;

// ALU Wires
wire w_ALUSrc;
wire w_Zero;
wire [2:0]  w_ALUOp_3;
wire [3:0]  w_ALUOperation_4;
wire [31:0] w_ALUResult_32;
wire [31:0] w_InmmediateExtend_32;
wire [31:0] w_ReadData2OrInmmediate_32;

// Memory wires
wire w_memToRegister;
wire w_memRead;
wire w_memWrite;
wire [31:0] w_FromExternalMemToMux_32;
wire [31:0] w_writeRegisterFileFromMemOrALu_32;

integer ALUStatus;

//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
Control
ControlUnit
(
	.in_OP_6(w_Instruction_32[31:26]),
	.o_RegDst(w_RegDst),
	.o_BranchType(w_BranchType),
	.o_BranchEn(w_BranchEn),
	.o_ALUOp_3(w_ALUOp_3),
	.o_ALUSrc(w_ALUSrc),
	.o_RegWrite(w_RegWrite),
	.o_Jump(w_jumpControlSignal),
	.o_MemRead(w_memRead),
	.o_MemtoReg(w_memToRegister),
	.o_MemWrite(w_memWrite)
);


ProgramMemory
#(
	.MEMORY_DEPTH(MEMORY_DEPTH)
)
ROMProgramMemory
(
	.Address(w_PC_wireToROM_32),
	.Instruction(w_Instruction_32)
);


Adder32bits
PC_Plus_4
(
	.in_Data0(w_PC_wireToROM_32),
	.in_Data1(4),
	
	.out_Result(w_PC_wirePlus4_32)
);


//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
Multiplexer2to1
#(
	.NBits(5)
)
MUX_ForRTypeAndIType
(
	.in_Selector(w_RegDst),
	.MUX_Data0_dw(w_Instruction_32[20:16]),
	.MUX_Data1_dw(w_Instruction_32[15:11]),
	
	.MUX_Output_dw(w_WriteRegisterAddress_5)

);



RegisterFile
Register_File
(
	.clk(clk),
	.reset(reset),
	.RegWrite(w_RegWrite),
	.in_WriteRegister_5(w_MuxSelectRA_5),
	.in_ReadRegister1_5(w_Instruction_32[25:21]),
	.in_ReadRegister2_5(w_Instruction_32[20:16]),
	.in_WriteData_32(w_writeDataRegisterFile_32),
	.o_ReadData1_32(w_ReadData1_32),
	.o_ReadData2_32(w_ReadData2_32)

);

SignExtend
SignExtendForConstants
(   
	.DataInput(w_Instruction_32[15:0]),
	.i_aluOP_3(w_ALUOp_3),
   .SignExtendOutput(w_InmmediateExtend_32)
);



Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForReadDataAndInmediate
(
	.in_Selector(w_ALUSrc),
	.MUX_Data0_dw(w_ReadData2_32),
	.MUX_Data1_dw(w_InmmediateExtend_32),
	
	.MUX_Output_dw(w_ReadData2OrInmmediate_32)

);


ALUControl
ArithmeticLogicUnitControl
(
	.in_ALUOp_3(w_ALUOp_3),
	.in_ALUFunction_6(w_Instruction_32[5:0]),
	.o_ALUOperation_4(w_ALUOperation_4),
	.o_JumpRegister(w_jumprRegisterControl)

);

PC_Register
ProgramCounter(
	.clk(clk),
	.reset(reset),
	.in_NewPC_dw(w_jumRegisterToPC_32),

	.o_PCValue_dw(w_PC_wireToROM_32)
);


ALU
Arithmetic_Logic_Unit 
(
	.in_ALUOperation_4(w_ALUOperation_4),
	.in_A_32(w_ReadData1_32),
	.in_B_32(w_ReadData2OrInmmediate_32),
	.in_shamt_5(w_Instruction_32[10:6]),
	.o_Zero(w_Zero),
	.o_ALUResult_32(w_ALUResult_32)
);


//******************************************************************/
//**************         Branching logic        ********************/


Adder32bits
PC_Plus_Branching_Offset
(
	.in_Data0(w_PC_wirePlus4_32),
	.in_Data1({w_InmmediateExtend_32[29:0], 2'b 00}),
	
	.out_Result(w_AdderBranching_32)


);


Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForBranchingControl
(
	.in_Selector(w_branchingControlSignal),
	.MUX_Data0_dw(w_PC_wirePlus4_32),
	.MUX_Data1_dw(w_AdderBranching_32),
	
	.MUX_Output_dw(w_MuxBranchingOut_32)

);

assign w_branchingControlSignal = w_BranchEn & ~(w_BranchType ^ w_Zero);

//******************************************************************/
//******************************************************************/
//**************         Jump logic        ********************/


Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForJumpControl
(
	.in_Selector(w_jumpControlSignal),
	.MUX_Data0_dw(w_MuxBranchingOut_32),
	.MUX_Data1_dw({w_PC_wirePlus4_32[31:28], w_Instruction_32[25:0], 2'b 00}),
	
	.MUX_Output_dw(w_MuxJumpingOut_32)

);

// Write the contents of program counter if the jal it's enable
Multiplexer2to1
#(
	.NBits(32)
)MUX_JumpAndLink
(

	.in_Selector(w_jumpAndLinkControl),
	.MUX_Data0_dw(w_writeRegisterFileFromMemOrALu_32),
	.MUX_Data1_dw(w_PC_wirePlus4_32),
	.MUX_Output_dw(w_writeDataRegisterFile_32)
);


Multiplexer2to1
#(
	.NBits(5)
)MUX_WriteToRegister_RA
(

	.in_Selector(w_jumpAndLinkControl),
	.MUX_Data0_dw(w_WriteRegisterAddress_5),
	.MUX_Data1_dw(5'd 31),
	
	.MUX_Output_dw(w_MuxSelectRA_5)
);

assign w_jumpAndLinkControl = w_RegWrite & w_jumpControlSignal;


// Multiplexer between the jump to content of register or result of other muxes

Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForJumpToContentOfRegister
(
	.in_Selector(w_jumprRegisterControl),
	.MUX_Data0_dw(w_MuxJumpingOut_32),
	.MUX_Data1_dw(w_ReadData1_32),
	
	.MUX_Output_dw(w_jumRegisterToPC_32)

);


//******************************************************************/
//******************************************************************/
// ************************ External memory *********************** //

DataMemory 
#(	
	.DATA_WIDTH(32),
	.MEMORY_DEPTH(256)
)
RAM_External
(
	 .in_WriteData_dw(w_ReadData2_32),
	 .in_Address_dw({24'b 0,w_ALUResult_32[7:0]}),
	 .in_MemWrite(w_memWrite),
	 .in_MemRead(w_memRead),
	 .clk(clk),
	 .o_ReadData_dw(w_FromExternalMemToMux_32)
);

// If mem to register we write register from memory
Multiplexer2to1
#(
	.NBits(32)
)
writeRegisterSource
(
	.in_Selector(w_memToRegister),
	.MUX_Data0_dw(w_ALUResult_32),
	.MUX_Data1_dw(w_FromExternalMemToMux_32),
	
	.MUX_Output_dw(w_writeRegisterFileFromMemOrALu_32)

);

//******************************************************************/
//*********************************************************
// *********/
assign ALUResultOut = w_ALUResult_32;


endmodule
