/******************************************************************
* Description
*	This is  a ROM memory that represents the program memory. 
* 	Internally, the memory is read without a signal clock. The initial 
*	values (program) of this memory are written from a file named text.dat.
* Version:
*	1.0
* Authors:
*	Mariana Chávez Medina
*	Darío Arias Muñoz
* Date:
*	08/04/2020
******************************************************************/
module ProgramMemory
#
(
	parameter MEMORY_DEPTH = 51,
	parameter DATA_WIDTH   = 32
)
(
	input 	   [(DATA_WIDTH-1):0] Address,
	output reg [(DATA_WIDTH-1):0] Instruction
);

wire [(DATA_WIDTH - 1):0] RealAddress;
assign RealAddress = {2'b 0, Address[(DATA_WIDTH - 1):2]};

// Declare the ROM variable
reg [DATA_WIDTH-1:0] rom [MEMORY_DEPTH-1:0];

initial
	begin
		$readmemh("C:\\Arqui\\MIPSProjects\\MIPSProcessor_ver2\\text.dat", rom);
	end

always @ (RealAddress)
	begin
		Instruction = rom[RealAddress];
	end

endmodule
//programmemory//