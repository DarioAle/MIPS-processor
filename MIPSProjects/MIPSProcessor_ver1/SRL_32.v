/******************************************************************
* Description
*		This is a combinational right shifter
*      Implemented with 32bits 2 to 1 Muxes
*
* Version:
*	1.0
* Author:
*	Mariana Chavez Medina
* email:
*	mariana_chvz@hotmail.com
* Date:
*	17/03/2020
******************************************************************/
module SRL_32
(
	input  [31:0] in_data_32,
	input   [4:0] in_shamt_5,
	output [31:0] out_data_32 
);

wire [31:0] mux_4_to_3;
wire [31:0] mux_3_to_2;
wire [31:0] mux_2_to_1;
wire [31:0] mux_1_to_0;

mux_2To1_32 mux4
(
	.in_channelA_32(in_data_32),
	.in_channelB_32({16'b0,in_data_32[31:16]}),
	.in_selector(in_shamt_5[4]),
	.out_Zoutput_32(mux_4_to_3)
);

mux_2To1_32 mux3
(
	.in_channelA_32(mux_4_to_3),
	.in_channelB_32({8'b0, mux_4_to_3[31:8]}),
	.in_selector(in_shamt_5[3]),
	.out_Zoutput_32(mux_3_to_2)
);

mux_2To1_32 mux2
(
	.in_channelA_32(mux_3_to_2),
	.in_channelB_32({4'b0,mux_3_to_2[31:4]}),
	.in_selector(in_shamt_5[2]),
	.out_Zoutput_32(mux_2_to_1)
);

mux_2To1_32 mux1
(
	.in_channelA_32(mux_2_to_1),
	.in_channelB_32({2'b0,mux_2_to_1[31:2]}),
	.in_selector(in_shamt_5[1]),
	.out_Zoutput_32(mux_1_to_0)
);

mux_2To1_32 mux0
(
	.in_channelA_32(mux_1_to_0),
	.in_channelB_32({1'b0,mux_1_to_0[31:1]}),
	.in_selector(in_shamt_5[0]),
	.out_Zoutput_32(out_data_32)
);



endmodule


