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
	parameter MEMORY_DEPTH = 32
)

(
	// Inputs
	input clk,
	input reset,
	input [7:0] PortIn,
	// Output
	output [31:0] ALUResultOut,
	output [31:0] PortOut
);
//******************************************************************/
//******************************************************************/
assign  PortOut = 0;

//******************************************************************/
//******************************************************************/
// Data types to connect modules
wire w_BranchType;
wire w_BranchEn;
wire RegDst_wire;



wire ALUSrc_wire;
wire RegWrite_wire;
wire Zero_wire;

wire w_branchingControlSignal;
wire [31:0] w_MuxBranchingOut_32;
wire [31:0] w_AdderBranching_32;

wire w_jumpControlSignal;
wire w_jumpAndLinkControl;
wire [31:0] w_MuxJumpingOut_32;
wire [4:0] w_MuxSelectRA_5;

wire [31:0] w_adderPlus8_32;

wire [31:0] w_writeDataRegisterFile_32;

wire w_jumprRegisterControl;
wire [31:0] w_jumRegisterToPC_32;

wire [2:0] ALUOp_wire;
wire [3:0] ALUOperation_wire;
wire [4:0] WriteRegister_wire;
wire [31:0] PC_wire;
wire [31:0] MUX_PC_wire; 
wire [31:0] Instruction_wire;
wire [31:0] ReadData1_wire;
wire [31:0] ReadData2_wire;
wire [31:0] InmmediateExtend_wire;
wire [31:0] ReadData2OrInmmediate_wire;
wire [31:0] ALUResult_wire;
wire [31:0] PC_4_wire;


integer ALUStatus;


//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
Control
ControlUnit
(
	.OP(Instruction_wire[31:26]),
	.RegDst(RegDst_wire),
	.BranchType(w_BranchType),
	.BranchEn(w_BranchEn),
	.ALUOp(ALUOp_wire),
	.ALUSrc(ALUSrc_wire),
	.RegWrite(RegWrite_wire),
	.Jump(w_jumpControlSignal)
);


ProgramMemory
#(
	.MEMORY_DEPTH(MEMORY_DEPTH)
)
ROMProgramMemory
(
	.Address(PC_wire),
	.Instruction(Instruction_wire)
);


Adder32bits
PC_Plus_4
(
	.Data0(PC_wire),
	.Data1(4),
	
	.Result(PC_4_wire)
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
	.Selector(RegDst_wire),
	.MUX_Data0(Instruction_wire[20:16]),
	.MUX_Data1(Instruction_wire[15:11]),
	
	.MUX_Output(WriteRegister_wire)

);



RegisterFile
Register_File
(
	.clk(clk),
	.reset(reset),
	.RegWrite(RegWrite_wire),
	.WriteRegister(w_MuxSelectRA_5),
	.ReadRegister1(Instruction_wire[25:21]),
	.ReadRegister2(Instruction_wire[20:16]),
	.WriteData(w_writeDataRegisterFile_32),
	.ReadData1(ReadData1_wire),
	.ReadData2(ReadData2_wire)

);

SignExtend
SignExtendForConstants
(   
	.DataInput(Instruction_wire[15:0]),
   .SignExtendOutput(InmmediateExtend_wire)
);



Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForReadDataAndInmediate
(
	.Selector(ALUSrc_wire),
	.MUX_Data0(ReadData2_wire),
	.MUX_Data1(InmmediateExtend_wire),
	
	.MUX_Output(ReadData2OrInmmediate_wire)

);


ALUControl
ArithmeticLogicUnitControl
(
	.ALUOp(ALUOp_wire),
	.ALUFunction(Instruction_wire[5:0]),
	.ALUOperation(ALUOperation_wire),
	.o_JumpRegister(w_jumprRegisterControl)

);

PC_Register
ProgramCounter(
	.clk(clk),
	.reset(reset),
	.NewPC(w_jumRegisterToPC_32),
	.PCValue(PC_wire)
);


ALU
Arithmetic_Logic_Unit 
(
	.ALUOperation(ALUOperation_wire),
	.A(ReadData1_wire),
	.B(ReadData2OrInmmediate_wire),
	.in_shamt_5(Instruction_wire[10:6]),
	.Zero(Zero_wire),
	.ALUResult(ALUResult_wire)
);


//******************************************************************/
//**************         Branching logic        ********************/


Adder32bits
PC_Plus_Branching_Offset
(
	.Data0(PC_4_wire),
	.Data1({InmmediateExtend_wire[29:0], 2'b 00}),
	
	.Result(w_AdderBranching_32)


);


Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForBranchingControl
(
	.Selector(w_branchingControlSignal),
	.MUX_Data0(PC_4_wire),
	.MUX_Data1(w_AdderBranching_32),
	
	.MUX_Output(w_MuxBranchingOut_32)

);

assign w_branchingControlSignal = w_BranchEn & ~(w_BranchType ^ Zero_wire);

//******************************************************************/
//******************************************************************/
//**************         Jump logic        ********************/


Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForJumpControl
(
	.Selector(w_jumpControlSignal),
	.MUX_Data0(w_MuxBranchingOut_32),
	.MUX_Data1({PC_4_wire[31:28], Instruction_wire[25:0], 2'b 00}),
	
	.MUX_Output(w_MuxJumpingOut_32)

);


Multiplexer2to1
#(
	.NBits(32)
)MUX_JumpAndLink
(

	.Selector(w_jumpAndLinkControl),
	.MUX_Data0(ALUResult_wire),
	.MUX_Data1(PC_4_wire),
	
	.MUX_Output(w_writeDataRegisterFile_32)
);


Multiplexer2to1
#(
	.NBits(5)
)MUX_WriteToRegister_RA
(

	.Selector(w_jumpAndLinkControl),
	.MUX_Data0(WriteRegister_wire),
	.MUX_Data1(5'd 31),
	
	.MUX_Output(w_MuxSelectRA_5)
);

// Multiplexer between the jum to content of register or result of other muxes

Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForJumpToContentOfRegister
(
	.Selector(w_jumprRegisterControl),
	.MUX_Data0(w_MuxJumpingOut_32),
	.MUX_Data1(ReadData1_wire),
	
	.MUX_Output(w_jumRegisterToPC_32)

);

assign w_jumpAndLinkControl = RegWrite_wire & w_jumpControlSignal;


//******************************************************************/
//******************************************************************/


assign ALUResultOut = ALUResult_wire;


endmodule

