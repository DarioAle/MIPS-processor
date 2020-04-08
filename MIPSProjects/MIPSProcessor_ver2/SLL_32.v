/******************************************************************
* Description
*		This is a combinational left shifter
*      Implemented with 32bits 2 to 1 Muxes
*
* Version:
*	1.0
* Authors:
*	Mariana Chávez Medina
*	Darío Arias Muñoz
* Date:
*	12/03/2020
******************************************************************/
module SLL_32
(
	input  [31:0] in_data_32,
	input   [4:0] in_shamt_5,
	output [31:0] out_shifted_data_32 
);

wire [31:0] w_mux_4to3_32;
wire [31:0] w_mux_3to2_32;
wire [31:0] w_mux_2to1_32;
wire [31:0] w_mux_1to0_32;

Multiplexer2to1
#(
	.NBits(32)
)
mux4
(
	.in_Selector(in_shamt_5[4]),
	.MUX_Data0_dw(in_data_32),
	.MUX_Data1_dw({in_data_32[15:0],16'b0}),
	
	.MUX_Output_dw(w_mux_4to3_32)

);

Multiplexer2to1
#(
	.NBits(32)
)
mux3
(
	.in_Selector(in_shamt_5[3]),
	.MUX_Data0_dw(w_mux_4to3_32),
	.MUX_Data1_dw({w_mux_4to3_32[23:0],8'b0}),
	
	.MUX_Output_dw(w_mux_3to2_32)

);

Multiplexer2to1
#(
	.NBits(32)
)
mux2
(
	.in_Selector(in_shamt_5[2]),
	.MUX_Data0_dw(w_mux_3to2_32),
	.MUX_Data1_dw({w_mux_3to2_32[27:0],4'b0}),
	
	.MUX_Output_dw(w_mux_2to1_32)

);

Multiplexer2to1
#(
	.NBits(32)
)
mux1
(
	.in_Selector(in_shamt_5[1]),
	.MUX_Data0_dw(w_mux_2to1_32),
	.MUX_Data1_dw({w_mux_2to1_32[29:0],2'b0}),
	
	.MUX_Output_dw(w_mux_1to0_32)

);

Multiplexer2to1
#(
	.NBits(32)
)
mux0
(
	.in_Selector(in_shamt_5[0]),
	.MUX_Data0_dw(w_mux_1to0_32),
	.MUX_Data1_dw({w_mux_1to0_32[30:0],1'b0}),
	
	.MUX_Output_dw(out_shifted_data_32)

);


endmodule
//left shifter//


