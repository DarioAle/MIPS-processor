/******************************************************************
* Description
*	This a decoder used in the register file.
*	1.0
* Authors:
*	Mariana Chávez Medina
*	Darío Arias Muñoz
* Date:
*	07/04/2020
******************************************************************/
module DecoderRegisterFile
(
	input [4:0] in_WriteRegister_5,
	output [31:0] o_SelectRegister_32
);
reg [31:0] r_SelectRegister_32;

always@(*)begin
	case(in_WriteRegister_5)
		0:    r_SelectRegister_32 = 32'b 0000_0000_0000_0000_0000_0000_0000_0001;
		1:	  r_SelectRegister_32 = 32'b 0000_0000_0000_0000_0000_0000_0000_0010;
		2:	  r_SelectRegister_32 = 32'b 0000_0000_0000_0000_0000_0000_0000_0100;
		3:	  r_SelectRegister_32 = 32'b 0000_0000_0000_0000_0000_0000_0000_1000;
		4:	  r_SelectRegister_32 = 32'b 0000_0000_0000_0000_0000_0000_0001_0000;		
		5:	  r_SelectRegister_32 = 32'b 0000_0000_0000_0000_0000_0000_0010_0000;
		6:	  r_SelectRegister_32 = 32'b 0000_0000_0000_0000_0000_0000_0100_0000;
		7:	  r_SelectRegister_32 = 32'b 0000_0000_0000_0000_0000_0000_1000_0000;
		8:	  r_SelectRegister_32 = 32'b 0000_0000_0000_0000_0000_0001_0000_0000;
		9:	  r_SelectRegister_32 = 32'b 0000_0000_0000_0000_0000_0010_0000_0000;
		10:   r_SelectRegister_32 = 32'b 0000_0000_0000_0000_0000_0100_0000_0000;
		11:   r_SelectRegister_32 = 32'b 0000_0000_0000_0000_0000_1000_0000_0000;
		12:   r_SelectRegister_32 = 32'b 0000_0000_0000_0000_0001_0000_0000_0000;
		13:   r_SelectRegister_32 = 32'b 0000_0000_0000_0000_0010_0000_0000_0000;
		14:   r_SelectRegister_32 = 32'b 0000_0000_0000_0000_0100_0000_0000_0000;
		15:   r_SelectRegister_32 = 32'b 0000_0000_0000_0000_1000_0000_0000_0000;
		16:   r_SelectRegister_32 = 32'b 0000_0000_0000_0001_0000_0000_0000_0000;
		17:   r_SelectRegister_32 = 32'b 0000_0000_0000_0010_0000_0000_0000_0000;
		18:   r_SelectRegister_32 = 32'b 0000_0000_0000_0100_0000_0000_0000_0000;
		19:   r_SelectRegister_32 = 32'b 0000_0000_0000_1000_0000_0000_0000_0000;
		20:   r_SelectRegister_32 = 32'b 0000_0000_0001_0000_0000_0000_0000_0000;
		21:   r_SelectRegister_32 = 32'b 0000_0000_0010_0000_0000_0000_0000_0000;		
		22:   r_SelectRegister_32 = 32'b 0000_0000_0100_0000_0000_0000_0000_0000;
		23:   r_SelectRegister_32 = 32'b 0000_0000_1000_0000_0000_0000_0000_0000;
		24:   r_SelectRegister_32 = 32'b 0000_0001_0000_0000_0000_0000_0000_0000;
		25:   r_SelectRegister_32 = 32'b 0000_0010_0000_0000_0000_0000_0000_0000;
		26:   r_SelectRegister_32 = 32'b 0000_0100_0000_0000_0000_0000_0000_0000;
		27:   r_SelectRegister_32 = 32'b 0000_1000_0000_0000_0000_0000_0000_0000;
		28:   r_SelectRegister_32 = 32'b 0001_0000_0000_0000_0000_0000_0000_0000;
		29:   r_SelectRegister_32 = 32'b 0010_0000_0000_0000_0000_0000_0000_0000;
		30:   r_SelectRegister_32 = 32'b 0100_0000_0000_0000_0000_0000_0000_0000;
		31:   r_SelectRegister_32 = 32'b 1000_0000_0000_0000_0000_0000_0000_0000;
	endcase
end

assign o_SelectRegister_32 = r_SelectRegister_32;

endmodule
//decoderregisterfile//