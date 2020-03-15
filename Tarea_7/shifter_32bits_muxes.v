/******************************************************************
* Description
*		This is a combinational left shifter
*      Implemented with 32bits 2 to 1 Muxes
*
* Version:
*	1.0
* Author:
*	Darío Arias Muñoz
* email:
*	darioaam@gmail.com
* Date:
*	12/03/2020
******************************************************************/
module shifter_32bits_muxes
(
	input  [31:0] in_data_32,
	input   [4:0] in_shamt_5,
	output [31:0] out_data_32 
);

wire [31:0] mux_4_to_3;
wire [31:0] mux_3_to_2;
wire [31:0] mux_2_to_1;
wire [31:0] mux_1_to_0;

mux_2_to_1 mux4
(
	.A(in_data_32),
	.B({in_data_32[15:0],16'b0}),
	.Sel(in_shamt_5[4]),
	.C(mux_4_to_3)
);

mux_2_to_1 mux3
(
	.A(mux_4_to_3),
	.B({mux_4_to_3[23:0],8'b0}),
	.Sel(in_shamt_5[3]),
	.C(mux_3_to_2)
);

mux_2_to_1 mux2
(
	.A(mux_3_to_2),
	.B({mux_3_to_2[27:0],4'b0}),
	.Sel(in_shamt_5[2]),
	.C(mux_2_to_1)
);

mux_2_to_1 mux1
(
	.A(mux_2_to_1),
	.B({mux_3_to_2[29:0],2'b0}),
	.Sel(in_shamt_5[1]),
	.C(mux_1_to_0)
);

mux_2_to_1 mux0
(
	.A(mux_1_to_0),
	.B({mux_3_to_2[30:0],1'b0}),
	.Sel(in_shamt_5[0]),
	.C(out_data_32)
);



endmodule
//left shifter//


