/******************************************************************
* Description
*	This is  module represents the register file where the registers 
*	like $s0-$s7 are store. 
*	of MIPS processor.
* Version:
*	1.0
* Authors:
*	Mariana Chávez Medina
*	Darío Arias Muñoz
* Date:
*	07/04/2020
******************************************************************/
module RegisterFile
#(
	parameter N=32
)
(
	input  clk,
	input  reset,
	input  RegWrite,                   // Habilitador de escritura general
	input  [4:0]  in_WriteRegister_5,  // Dirección del registro a escribir
	input  [4:0]  in_ReadRegister1_5,  // Dirección del registro a leer1
 	input  [4:0]  in_ReadRegister2_5,  // Dirección del registro a leer2
	input  [31:0] in_WriteData_32,     // Dato a escribir

	output [31:0] o_ReadData1_32,     // SALIDA dato leído1
	output [31:0] o_ReadData2_32      // Dato leído 2

);


wire [32*N-1:0] w_Interconnection_32x32;
wire [31:0] 	w_SelectRegister_32;


DecoderRegisterFile
Decoder
(
	.in_WriteRegister_5(in_WriteRegister_5),
	.o_SelectRegister_32(w_SelectRegister_32)
);

/****************************************************************/
/****************************************************************/
/****************************************************************/
/****************************************************************/
/****************************************************************/

Register
Register_Zero
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[0]&RegWrite),
	.DataInput_dw(0),
	.DataOutput_dw(w_Interconnection_32x32[N-1:0])
);


	
	
	
Register
Register_at
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[1]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[2*N-1:1*N])
);	
	

	
Register
Register_v0
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[2]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[3*N-1:2*N])
);	


Register
Register_v1
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[3]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[4*N-1:3*N])
);		
	


Register
Register_a0
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[4]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[5*N-1:4*N])
);



Register
Register_a1
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[5]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[6*N-1:5*N])
);



Register
Register_a2
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[6]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[7*N-1:6*N])
);




Register
Register_a3
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[7]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[8*N-1:7*N])
);



Register
Register_t0
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[8]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[9*N-1:8*N])
);



Register
Register_t1
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[9]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[10*N-1:9*N])
);



Register
Register_t2
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[10]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[11*N-1:10*N])
);



Register
Register_t3
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[11]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[12*N-1:11*N])
);



Register
Register_t4
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[12]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[13*N-1:12*N])
);



Register
Register_t5
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[13]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[14*N-1:13*N])
);



Register
Register_t6
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[14]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[15*N-1:14*N])
);



Register
Register_t7
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[15]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[16*N-1:15*N])
);


Register
Register_s0
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[16]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[17*N-1:16*N])
);



Register
Register_s1
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[17]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[18*N-1:17*N])
);



Register
Register_s2
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[18]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[19*N-1:18*N])
);



Register
Register_s3
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[19]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[20*N-1:19*N])
);




Register
Register_s4
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[20]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[21*N-1:20*N])
);




Register
Register_s5
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[21]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[22*N-1:21*N])
);




Register
Register_s6
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[22]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[23*N-1:22*N])
);




Register
Register_s7
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[23]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[24*N-1:23*N])
);



Register
Register_t8
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[24]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[25*N-1:24*N])
);

Register
Register_t9
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[25]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[26*N-1:25*N])
);



Register
Register_k0
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[26]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[27*N-1:26*N])
);
	


Register
Register_k1
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[27]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[28*N-1:27*N])
);	



Register
Register_gp
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[28]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[29*N-1:28*N])
);


Register
Register_sp
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[29]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[30*N-1:29*N])
);




Register
Register_fp
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[30]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[31*N-1:30*N])
);



Register
Register_ra
(
	.clk(clk),
	.reset(reset),
	.enable(w_SelectRegister_32[31]&RegWrite),
	.DataInput_dw(in_WriteData_32),
	.DataOutput_dw(w_Interconnection_32x32[32*N-1:31*N])
);




MUXRegisterFile
#(
	.N(32)
)
MUXRegister1
(
	.in_Selector_5(in_ReadRegister1_5),

	.in_Data_0(w_Interconnection_32x32[1*N-1:0*N]),
	.in_Data_1(w_Interconnection_32x32[2*N-1:1*N]),
	.in_Data_2(w_Interconnection_32x32[3*N-1:2*N]),
	.in_Data_3(w_Interconnection_32x32[4*N-1:3*N]),
	.in_Data_4(w_Interconnection_32x32[5*N-1:4*N]),
	.in_Data_5(w_Interconnection_32x32[6*N-1:5*N]),
	.in_Data_6(w_Interconnection_32x32[7*N-1:6*N]),
	.in_Data_7(w_Interconnection_32x32[8*N-1:7*N]),
	.in_Data_8(w_Interconnection_32x32[9*N-1:8*N]),
    .in_Data_9(w_Interconnection_32x32[10*N-1:9*N]),
	.in_Data_10(w_Interconnection_32x32[11*N-1:10*N]),
	.in_Data_11(w_Interconnection_32x32[12*N-1:11*N]),
	.in_Data_12(w_Interconnection_32x32[13*N-1:12*N]),
	.in_Data_13(w_Interconnection_32x32[14*N-1:13*N]),
	.in_Data_14(w_Interconnection_32x32[15*N-1:14*N]),
	.in_Data_15(w_Interconnection_32x32[16*N-1:15*N]),
	.in_Data_16(w_Interconnection_32x32[17*N-1:16*N]),
	.in_Data_17(w_Interconnection_32x32[18*N-1:17*N]),
	.in_Data_18(w_Interconnection_32x32[19*N-1:18*N]),
	.in_Data_19(w_Interconnection_32x32[20*N-1:19*N]),
	.in_Data_20(w_Interconnection_32x32[21*N-1:20*N]),
	.in_Data_21(w_Interconnection_32x32[22*N-1:21*N]),
	.in_Data_22(w_Interconnection_32x32[23*N-1:22*N]),
	.in_Data_23(w_Interconnection_32x32[24*N-1:23*N]),
	.in_Data_24(w_Interconnection_32x32[25*N-1:24*N]),
	.in_Data_25(w_Interconnection_32x32[26*N-1:25*N]),
	.in_Data_26(w_Interconnection_32x32[27*N-1:26*N]),
	.in_Data_27(w_Interconnection_32x32[28*N-1:27*N]),
	.in_Data_28(w_Interconnection_32x32[29*N-1:28*N]),
	.in_Data_29(w_Interconnection_32x32[30*N-1:29*N]),
	.in_Data_30(w_Interconnection_32x32[31*N-1:30*N]),
	.in_Data_31(w_Interconnection_32x32[32*N-1:31*N]),
	
	.o_MUX_Output_dw(o_ReadData1_32)
);


MUXRegisterFile
#(
	.N(32)
)
MUXRegister2
(
	.in_Selector_5(in_ReadRegister2_5),

	.in_Data_0(w_Interconnection_32x32 [1*N-1:0*N]),
	.in_Data_1(w_Interconnection_32x32 [2*N-1:1*N]),
	.in_Data_2(w_Interconnection_32x32 [3*N-1:2*N]),
	.in_Data_3(w_Interconnection_32x32 [4*N-1:3*N]),
	.in_Data_4(w_Interconnection_32x32 [5*N-1:4*N]),
	.in_Data_5(w_Interconnection_32x32 [6*N-1:5*N]),
	.in_Data_6(w_Interconnection_32x32 [7*N-1:6*N]),
	.in_Data_7(w_Interconnection_32x32 [8*N-1:7*N]),
	.in_Data_8(w_Interconnection_32x32 [9*N-1:8*N]),
    .in_Data_9(w_Interconnection_32x32 [10*N-1:9*N]),
	.in_Data_10(w_Interconnection_32x32[11*N-1:10*N]),
	.in_Data_11(w_Interconnection_32x32[12*N-1:11*N]),
	.in_Data_12(w_Interconnection_32x32[13*N-1:12*N]),
	.in_Data_13(w_Interconnection_32x32[14*N-1:13*N]),
	.in_Data_14(w_Interconnection_32x32[15*N-1:14*N]),
	.in_Data_15(w_Interconnection_32x32[16*N-1:15*N]),
	.in_Data_16(w_Interconnection_32x32[17*N-1:16*N]),
	.in_Data_17(w_Interconnection_32x32[18*N-1:17*N]),
	.in_Data_18(w_Interconnection_32x32[19*N-1:18*N]),
	.in_Data_19(w_Interconnection_32x32[20*N-1:19*N]),
	.in_Data_20(w_Interconnection_32x32[21*N-1:20*N]),
	.in_Data_21(w_Interconnection_32x32[22*N-1:21*N]),
	.in_Data_22(w_Interconnection_32x32[23*N-1:22*N]),
	.in_Data_23(w_Interconnection_32x32[24*N-1:23*N]),
	.in_Data_24(w_Interconnection_32x32[25*N-1:24*N]),
	.in_Data_25(w_Interconnection_32x32[26*N-1:25*N]),
	.in_Data_26(w_Interconnection_32x32[27*N-1:26*N]),
	.in_Data_27(w_Interconnection_32x32[28*N-1:27*N]),
	.in_Data_28(w_Interconnection_32x32[29*N-1:28*N]),
	.in_Data_29(w_Interconnection_32x32[30*N-1:29*N]),
	.in_Data_30(w_Interconnection_32x32[31*N-1:30*N]),
	.in_Data_31(w_Interconnection_32x32[32*N-1:31*N]),
	
	.o_MUX_Output_dw(o_ReadData2_32)
);
endmodule
//regfile//