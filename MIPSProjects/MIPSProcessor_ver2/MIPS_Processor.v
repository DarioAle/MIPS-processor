/******************************************************************
* Description
*	This is the top-level of a MIPS processor
* This processor is written Verilog-HDL. Also, it is synthesizable into hardware.
* Parameter MEMORY_DEPTH configures the program memory to allocate the program to
* be execute. If the size of the program changes, thus, MEMORY_DEPTH must change.
* This processor was made for computer organization class at ITESO.
******************************************************************/

// Note about conventio
/*
	* The wire is declared in the same stage as the component is going out from.
	*
	*

*/

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

//********************     Instruction Fetch Wires  ****************/
wire [31:0] w_MuxBranchingOut_32;
wire [31:0] w_PC_wireToROM_32;
wire [31:0] w_PC_wirePlus4_32;
wire [31:0] w_MuxJumpingOut_32;
wire [31:0] w_Instruction_32;


wire [31:0] w_IF_R_Out_Instruction_32;
wire [31:0] w_IF_R_Out_PC_Plus4_32;

//********************     Instruction Decode Wires  ****************/
wire w_BranchType;
wire w_BranchEn;

wire w_jumpControlSignal;

wire w_memToRegister;
wire w_memRead;
wire w_memWrite;
wire w_RegWrite;
wire w_RegDst;
wire [2:0]  w_ALUOp_3;
wire w_ALUSrc;

wire [31:0] w_writeDataRegisterFile_32;
wire [31:0] w_ReadData1_32;
wire [31:0] w_ReadData2_32;

wire w_RegWriteOR;
wire [31:0] w_InmmediateExtend_32;

// Wires going out from ID/EX
wire w_ID_R_Out_RegWrite;
wire w_ID_R_Out_memToReg;
wire w_ID_R_Out_memWrite;
wire w_ID_R_Out_memRead;
wire w_ID_R_Out_BranchType;
wire w_ID_R_Out_BranchEn;
wire w_ID_R_Out_jumpCtrl;
wire w_ID_R_Out_AlUsrc;
wire w_ID_R_Out_RegDst;

wire [2:0]	w_ID_R_Out_ALUop_3;

wire [31:0] w_ID_R_Out_Plus4_32;
wire [31:0] w_ID_R_Out_ReadData1_32;
wire [31:0] w_ID_R_Out_ReadData2_32;
wire [31:0] w_ID_R_Out_SignExtend_32; 
wire [25:0] w_ID_R_Out_Instruction_26;
wire [4:0]  w_ID_R_Out_WriteAdd1_5;
wire [4:0]  w_ID_R_Out_WriteAdd2_5;

// ********************     Instruction Execution Wires  ****************/
wire w_branchingControlSignal;
wire w_jumprRegisterCtrl;


wire [31:0] w_AdderBranching_32;

wire w_Zero;
wire w_jumpAndLinkCtrl;

wire [3:0]  w_ALUOperation_4;
wire [31:0] w_ALUResult_32;

wire [31:0] w_ReadData2OrInmmediate_32;
wire [4:0] 	w_WriteRegisterAddress_5;

wire w_EX_R_Out_RegWrite;
wire w_EX_R_Out_memToReg;

wire w_EX_R_Out_memWrite;
wire w_EX_R_Out_memRead;
wire w_EX_R_Out_BranchType;
wire w_EX_R_Out_BranchEnable;

wire w_EX_R_Out_Zero;
wire [31:0] w_EX_R_Out_AdderBranching_32;
wire [31:0] w_EX_R_Out_ReadData2_32;
wire [31:0] w_EX_R_Out_ALUResult_32;
wire [ 4:0] w_EX_R_Out_WriteRegisterAddress_5;


//********************     Memory Access Wires  ****************/

wire [31:0] w_FromExternalMemToMux_32;

// wires going out from MEM/WB
wire w_MEM_R_Out_RegWrite;
wire w_MEM_R_Out_memToReg;
wire [31:0]	w_MEM_R_Out_MemoryData_32;
wire [31:0]	w_MEM_R_Out_ALUResult_32;
wire [ 4:0]	w_MEM_R_Out_WriteRegisterAddress_5;

//********************     Write Back Wires  ****************/

wire [31:0] w_writeRegisterFileFromMemOrALu_32;





wire [4:0]  w_MuxSelectRA_5;
wire [31:0] w_jumRegisterToPC_32;

// Program Counter wires


// Register wires




integer ALUStatus;


// ********************** MIPS Processor ************************************/
/*                                                                           /
*                                                                            /
*	Here begins the structural description of the pipelined MIPS processor   /
*																			 /
*																			 /
*****************************************************************************/


//******************************************************************/
//************     Instruction Fetch Stage        ******************/

Multiplexer2to1
#(  
	.NBits(32)
)
MUX_ForBranchingControl
(
	.in_Selector(w_branchingControlSignal),
	.MUX_Data0_dw(w_PC_wirePlus4_32),
	.MUX_Data1_dw(w_EX_R_Out_AdderBranching_32),
	
	.MUX_Output_dw(w_MuxBranchingOut_32)

);

assign w_branchingControlSignal = w_EX_R_Out_BranchEnable & ~(w_EX_R_Out_BranchType ^ w_EX_R_Out_Zero);

// --------------------------- Jump logic


Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForJumpControl
(
	.in_Selector(w_ID_R_Out_jumpCtrl),
	.MUX_Data0_dw(w_MuxBranchingOut_32),
	.MUX_Data1_dw({w_ID_R_Out_Plus4_32[31:28], w_ID_R_Out_Instruction_26, 2'b 00}),
	
	.MUX_Output_dw(w_MuxJumpingOut_32)

);


// Multiplexer between the jump to content of register or result of other muxes

Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForJumpToContentOfRegister
(
	.in_Selector(w_jumprRegisterCtrl),
	.MUX_Data0_dw(w_MuxJumpingOut_32),
	.MUX_Data1_dw(w_ID_R_Out_ReadData1_32),
	
	.MUX_Output_dw(w_jumRegisterToPC_32)

);

PC_Register
ProgramCounter(
	.clk(clk),
	.reset(reset),
	.in_NewPC_dw(w_jumRegisterToPC_32),

	.o_PCValue_dw(w_PC_wireToROM_32)
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

RegisterPipeline
#(
	.N(64)
)
IF_ID_Register
(

	.clk(clk),
	.reset(reset),
	.enable(1'b 1),
	.DataInput_dw(
		{
			w_Instruction_32, 
			w_PC_wirePlus4_32
		}),

	.DataOutput_dw(
		{
			w_IF_R_Out_Instruction_32,
			w_IF_R_Out_PC_Plus4_32
		})
);


//******************************************************************/
//*******************  Instruction Decode       ********************/
Control
ControlUnit
(
	.in_OP_6(w_IF_R_Out_Instruction_32[31:26]),

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


// Write the contents of program counter if the jal it's enable
Multiplexer2to1
#(
	.NBits(32)
)MUX_JumpAndLink
(

	.in_Selector(w_jumpAndLinkCtrl),
	.MUX_Data0_dw(w_writeRegisterFileFromMemOrALu_32),
	.MUX_Data1_dw(w_ID_R_Out_Plus4_32),

	.MUX_Output_dw(w_writeDataRegisterFile_32)
);


Multiplexer2to1
#(
	.NBits(5)
)MUX_WriteToRegister_RA
(

	.in_Selector(w_jumpAndLinkCtrl),
	.MUX_Data0_dw(w_MEM_R_Out_WriteRegisterAddress_5),
	.MUX_Data1_dw(5'd 31),
	
	.MUX_Output_dw(w_MuxSelectRA_5)
);

assign w_jumpAndLinkCtrl =  w_ID_R_Out_RegWrite & w_ID_R_Out_jumpCtrl;


RegisterFile
Register_File
(
	.clk(clk),
	.reset(reset),
	.RegWrite(w_RegWriteOR),
	.in_WriteRegister_5(w_MuxSelectRA_5),
	.in_ReadRegister1_5(w_IF_R_Out_Instruction_32[25:21]),
	.in_ReadRegister2_5(w_IF_R_Out_Instruction_32[20:16]),
	.in_WriteData_32(w_writeDataRegisterFile_32),

	.o_ReadData1_32(w_ReadData1_32),
	.o_ReadData2_32(w_ReadData2_32)

);

assign w_RegWriteOR = w_jumpAndLinkCtrl | w_MEM_R_Out_RegWrite;

SignExtend
SignExtendForConstants
(   
	.DataInput(w_IF_R_Out_Instruction_32[15:0]),
	.i_aluOP_3(w_ALUOp_3),

   .SignExtendOutput(w_InmmediateExtend_32)
);

RegisterPipeline
#(
	.N(166)
)
ID_EX_Register
(

	.clk(clk),
	.reset(reset),
	.enable(1'b 1),
	.DataInput_dw(
					{
						w_RegWrite,
						w_memToRegister,

						w_memRead,
						w_memWrite,
						w_BranchType,
						w_BranchEn,

						w_jumpControlSignal,
						w_ALUOp_3,
						w_ALUSrc,
						w_RegDst,

						w_IF_R_Out_PC_Plus4_32,
						w_ReadData1_32,
						w_ReadData2_32,
						w_InmmediateExtend_32,
						w_IF_R_Out_Instruction_32[25:0]
					}
		),

	.DataOutput_dw(
					{ w_ID_R_Out_RegWrite,
					  w_ID_R_Out_memToReg,
					 
					  w_ID_R_Out_memRead,
					  w_ID_R_Out_memWrite,
					  w_ID_R_Out_BranchType,
					  w_ID_R_Out_BranchEn,
					  
					  w_ID_R_Out_jumpCtrl,
					  w_ID_R_Out_ALUop_3,
					  w_ID_R_Out_AlUsrc,
					  w_ID_R_Out_RegDst,

					  w_ID_R_Out_Plus4_32,
					  w_ID_R_Out_ReadData1_32,
					  w_ID_R_Out_ReadData2_32,
					  w_ID_R_Out_SignExtend_32,
					  w_ID_R_Out_Instruction_26
					}
				  )
);



//******************************************************************/
//***************    Execute Instruction ***************************/


ALU
Arithmetic_Logic_Unit 
(
	.in_ALUOperation_4(w_ALUOperation_4),
	.in_A_32(w_ID_R_Out_ReadData1_32),
	.in_B_32(w_ReadData2OrInmmediate_32),
	.in_shamt_5(w_ID_R_Out_Instruction_26[10:6]),

	.o_Zero(w_Zero),
	.o_ALUResult_32(w_ALUResult_32)
);

ALUControl
ArithmeticLogicUnitControl
(
	.in_ALUOp_3(w_ID_R_Out_ALUop_3),
	.in_ALUFunction_6(w_ID_R_Out_Instruction_26[5:0]),

	.o_ALUOperation_4(w_ALUOperation_4),
	.o_JumpRegister(w_jumprRegisterCtrl)

);

Multiplexer2to1
#(
	.NBits(5)
)
MUX_ForRTypeAndIType
(
	.in_Selector(w_ID_R_Out_RegDst),
	.MUX_Data0_dw(w_ID_R_Out_Instruction_26[20:16]),
	.MUX_Data1_dw(w_ID_R_Out_Instruction_26[15:11]),
	
	.MUX_Output_dw(w_WriteRegisterAddress_5)

);

Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForReadDataAndInmediate
(
	.in_Selector(w_ID_R_Out_AlUsrc),
	.MUX_Data0_dw(w_ID_R_Out_ReadData2_32),
	.MUX_Data1_dw(w_ID_R_Out_SignExtend_32),
	
	.MUX_Output_dw(w_ReadData2OrInmmediate_32)

);

Adder32bits
PC_Plus_Branching_Offset
(
	.in_Data0(w_ID_R_Out_Plus4_32),
	.in_Data1({w_ID_R_Out_SignExtend_32[29:0], 2'b 00}),
	
	.out_Result(w_AdderBranching_32)
);


RegisterPipeline
#(
	.N(108)
)
EX_MEM_Register
(

	.clk(clk),
	.reset(reset),
	.enable(1'b 1),
	.DataInput_dw(
		{
			w_ID_R_Out_RegWrite,
			w_ID_R_Out_memToReg,		 

		 	w_ID_R_Out_memRead,
		 	w_ID_R_Out_memWrite,
		 	w_ID_R_Out_BranchType,
		 	w_ID_R_Out_BranchEn,

			w_Zero,
			w_AdderBranching_32,
			w_ID_R_Out_ReadData2_32,
			w_ALUResult_32,
			w_WriteRegisterAddress_5

		}),

	.DataOutput_dw(
		{
			w_EX_R_Out_RegWrite,
			w_EX_R_Out_memToReg,

			w_EX_R_Out_memRead,
			w_EX_R_Out_memWrite,
			w_EX_R_Out_BranchType,
			w_EX_R_Out_BranchEnable,

			w_EX_R_Out_Zero,
			w_EX_R_Out_AdderBranching_32,
			w_EX_R_Out_ReadData2_32,
			w_EX_R_Out_ALUResult_32,
			w_EX_R_Out_WriteRegisterAddress_5
		})
);

//*******************************************************************/
// ************************ External memory *********************** //

DataMemory 
#(	
	.DATA_WIDTH(32),
	.MEMORY_DEPTH(256)
)
RAM_External
(
	 .in_WriteData_dw(w_EX_R_Out_ReadData2_32),
	 .in_Address_dw({24'b 0,w_EX_R_Out_ALUResult_32[7:0]}),
	 .in_MemWrite(w_EX_R_Out_memWrite),
	 .in_MemRead(w_EX_R_Out_memRead),
	 .clk(clk),

	 .o_ReadData_dw(w_FromExternalMemToMux_32)
);


RegisterPipeline
#(
	.N(71)
)
MEM_WB_Register
(

	.clk(clk),
	.reset(reset),
	.enable(1'b 1),
	.DataInput_dw(
		{	
			w_EX_R_Out_RegWrite,
			w_EX_R_Out_memToReg,
			w_FromExternalMemToMux_32,
			w_EX_R_Out_ALUResult_32,
			w_EX_R_Out_WriteRegisterAddress_5
		}),

	.DataOutput_dw(
		{
			w_MEM_R_Out_RegWrite,
			w_MEM_R_Out_memToReg,
			w_MEM_R_Out_MemoryData_32,
			w_MEM_R_Out_ALUResult_32,
			w_MEM_R_Out_WriteRegisterAddress_5
		})
);

//******************************************************************/
//********************    Write Back        ************************/

// If mem to register we write register from memory
Multiplexer2to1
#(
	.NBits(32)
)
writeRegisterSource
(
	.in_Selector(w_MEM_R_Out_memToReg),
	.MUX_Data0_dw(w_MEM_R_Out_ALUResult_32),
	.MUX_Data1_dw(w_MEM_R_Out_MemoryData_32),
	
	.MUX_Output_dw(w_writeRegisterFileFromMemOrALu_32)

);


assign ALUResultOut = w_ALUResult_32;


endmodule

