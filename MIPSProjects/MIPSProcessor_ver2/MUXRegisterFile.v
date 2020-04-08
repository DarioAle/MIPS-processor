
module MUXRegisterFile
#(
	parameter N=32
)
(
	input [4:0] in_Selector_5,

	input [N-1:0] in_Data_0,
	input [N-1:0] in_Data_1,
	input [N-1:0] in_Data_2,
	input [N-1:0] in_Data_3,
	input [N-1:0] in_Data_4,
	input [N-1:0] in_Data_5,
	input [N-1:0] in_Data_6,
	input [N-1:0] in_Data_7,
	input [N-1:0] in_Data_8,
	input [N-1:0] in_Data_9,
	input [N-1:0] in_Data_10,
	input [N-1:0] in_Data_11,
	input [N-1:0] in_Data_12,
	input [N-1:0] in_Data_13,
	input [N-1:0] in_Data_14,
	input [N-1:0] in_Data_15,
	input [N-1:0] in_Data_16,
	input [N-1:0] in_Data_17,
	input [N-1:0] in_Data_18,
	input [N-1:0] in_Data_19,
	input [N-1:0] in_Data_20,
	input [N-1:0] in_Data_21,
	input [N-1:0] in_Data_22,
	input [N-1:0] in_Data_23,
	input [N-1:0] in_Data_24,
	input [N-1:0] in_Data_25,
	input [N-1:0] in_Data_26,
	input [N-1:0] in_Data_27,
	input [N-1:0] in_Data_28,
	input [N-1:0] in_Data_29,
	input [N-1:0] in_Data_30,
	input [N-1:0] in_Data_31,
	
	output reg [N-1:0] o_MUX_Output_dw
	
);

always@(*)begin
	case(in_Selector_5)
		 0: o_MUX_Output_dw = in_Data_0;
		 1: o_MUX_Output_dw = in_Data_1;
		 2: o_MUX_Output_dw = in_Data_2;
		 3: o_MUX_Output_dw = in_Data_3;
		 4: o_MUX_Output_dw = in_Data_4;
		 5: o_MUX_Output_dw = in_Data_5;
		 6: o_MUX_Output_dw = in_Data_6;
		 7: o_MUX_Output_dw = in_Data_7;
		 8: o_MUX_Output_dw = in_Data_8;
		 9: o_MUX_Output_dw = in_Data_9;
		10: o_MUX_Output_dw = in_Data_10;
		11: o_MUX_Output_dw = in_Data_11;
		12: o_MUX_Output_dw = in_Data_12;
		13: o_MUX_Output_dw = in_Data_13;
		14: o_MUX_Output_dw = in_Data_14;
		15: o_MUX_Output_dw = in_Data_15;
		16: o_MUX_Output_dw = in_Data_16;
		17: o_MUX_Output_dw = in_Data_17;
		18: o_MUX_Output_dw = in_Data_18;
		19: o_MUX_Output_dw = in_Data_19;
		20: o_MUX_Output_dw = in_Data_20;
		21: o_MUX_Output_dw = in_Data_21;
		22: o_MUX_Output_dw = in_Data_22;
		23: o_MUX_Output_dw = in_Data_23;
		24: o_MUX_Output_dw = in_Data_24;
		25: o_MUX_Output_dw = in_Data_25;
		26: o_MUX_Output_dw = in_Data_26;
		27: o_MUX_Output_dw = in_Data_27;
		28: o_MUX_Output_dw = in_Data_28;
		29: o_MUX_Output_dw = in_Data_29;
		30: o_MUX_Output_dw = in_Data_30;
		31: o_MUX_Output_dw = in_Data_31;
	endcase
end

endmodule
//muxregfile//



