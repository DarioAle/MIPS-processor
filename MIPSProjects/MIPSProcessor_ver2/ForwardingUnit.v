/******************************************************************
* Description
*	This is the Forwanrding Unit . It receives an signal called 
*	ALUOp from the control unit and a signal called ALUFunction from
*	the intrctuion field named function.
* Version:
*	1.0
* Author:
*	Mariana Chávez Medina
*	Darío Arias Muñoz
* Date:
*	03/05/2020
******************************************************************/
module ForwardingUnit
(	
	input  in_MEM_WB_RegWrite,
	input  in_EX_MEM_RegWrite,
	input  [4:0] in_MEM_WB_Rd_address_5,
	input  [4:0] in_EX_MEM_Rd_address_5,


	input  [4:0] in_ID_EX_Rt_address_5,
	input  [4:0] in_ID_EX_Rs_address_5,

	input  [4:0] in_EX_MEM_Rt_address_5,

	output o_forward_lw,
	output [1:0] o_forwardA_2,
	output [1:0] o_forwardB_2
);


wire w_exHazardRs;
wire w_exHazardRt;

wire w_memHazardRs;
wire w_memHazardRt;

wire w_ExRdNotZeroAndRegWrite;
wire w_MemRdNotZeroAndRegWrite;
// EXecution hazard

// Rs -> A
// Rt -> B

assign w_ExRdNotZeroAndRegWrite  = (in_EX_MEM_RegWrite == 1'b 1 & in_EX_MEM_Rd_address_5 != 5'b 0);

assign w_exHazardRs = w_ExRdNotZeroAndRegWrite & (in_ID_EX_Rs_address_5 == in_EX_MEM_Rd_address_5);
assign w_exHazardRt = w_ExRdNotZeroAndRegWrite & (in_ID_EX_Rt_address_5 == in_EX_MEM_Rd_address_5);



assign w_MemRdNotZeroAndRegWrite = (in_MEM_WB_RegWrite == 1'b 1 & in_MEM_WB_Rd_address_5 != 5'b 0);

assign w_memHazardRs = w_MemRdNotZeroAndRegWrite & (in_ID_EX_Rs_address_5 == in_MEM_WB_Rd_address_5);
assign w_memHazardRt = w_MemRdNotZeroAndRegWrite & (in_ID_EX_Rt_address_5 == in_MEM_WB_Rd_address_5);




assign o_forwardA_2 =  (w_exHazardRs) ? 2'b 10 : (w_memHazardRs) ? 2'b 01 : 2'b 00;
assign o_forwardB_2 =  (w_exHazardRt) ? 2'b 10 : (w_memHazardRt) ? 2'b 01 : 2'b 00;
assign o_forward_lw =  (in_EX_MEM_Rt_address_5 == in_MEM_WB_Rd_address_5) ? (w_MemRdNotZeroAndRegWrite) : 1'b 0;



endmodule
//alucontrol//