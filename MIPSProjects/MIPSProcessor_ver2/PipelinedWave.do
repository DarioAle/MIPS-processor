onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color {Medium Blue} -itemcolor {Medium Blue} -radix hexadecimal /MIPS_Processor_TB/ALUResultOut
add wave -noupdate /MIPS_Processor_TB/clk
add wave -noupdate /MIPS_Processor_TB/reset
add wave -noupdate -divider {Instruction Fetch}
add wave -noupdate -label Address/ROM -radix hexadecimal -childformat {{{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[31]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[30]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[29]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[28]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[27]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[26]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[25]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[24]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[23]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[22]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[21]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[20]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[19]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[18]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[17]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[16]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[15]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[14]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[13]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[12]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[11]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[10]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[9]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[8]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[7]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[6]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[5]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[4]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[3]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[2]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[1]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[0]} -radix hexadecimal}} -subitemconfig {{/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[31]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[30]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[29]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[28]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[27]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[26]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[25]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[24]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[23]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[22]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[21]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[20]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[19]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[18]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[17]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[16]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[15]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[14]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[13]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[12]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[11]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[10]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[9]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[8]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[7]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[6]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[5]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[4]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[3]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[2]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[1]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROMProgramMemory/Address[0]} {-height 15 -radix hexadecimal}} /MIPS_Processor_TB/DUV/ROMProgramMemory/Address
add wave -noupdate -label Instruction/ROM -radix hexadecimal /MIPS_Processor_TB/DUV/ROMProgramMemory/Instruction
add wave -noupdate -divider {Instruction Decode}
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/Register_File/RegWrite
add wave -noupdate -radix unsigned /MIPS_Processor_TB/DUV/Register_File/in_WriteRegister_5
add wave -noupdate -radix unsigned /MIPS_Processor_TB/DUV/Register_File/in_ReadRegister1_5
add wave -noupdate -radix unsigned /MIPS_Processor_TB/DUV/Register_File/in_ReadRegister2_5
add wave -noupdate -radix decimal /MIPS_Processor_TB/DUV/Register_File/in_WriteData_32
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/o_ReadData1_32
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/o_ReadData2_32
add wave -noupdate -label {$2} -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/Register_v0/DataOutput_dw
add wave -noupdate -label {$3} -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/Register_v1/DataOutput_dw
add wave -noupdate -label {$4} -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/Register_a0/DataOutput_dw
add wave -noupdate -color Magenta -label {$a0} -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/Register_a0/DataOutput_dw
add wave -noupdate -color Magenta -label {$a1} -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/Register_a1/DataOutput_dw
add wave -noupdate -color Magenta -label {$a2} -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/Register_a2/DataOutput_dw
add wave -noupdate -color Magenta -label {$a3} -radix hexadecimal /MIPS_Processor_TB/DUV/Register_File/Register_a3/DataOutput_dw
add wave -noupdate -divider Execute
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Arithmetic_Logic_Unit/in_ALUOperation_4
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Arithmetic_Logic_Unit/in_A_32
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Arithmetic_Logic_Unit/in_B_32
add wave -noupdate -radix unsigned /MIPS_Processor_TB/DUV/Arithmetic_Logic_Unit/in_shamt_5
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/Arithmetic_Logic_Unit/o_Zero
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/Arithmetic_Logic_Unit/o_ALUResult_32
add wave -noupdate -label BranchingData0 -radix hexadecimal /MIPS_Processor_TB/DUV/PC_Plus_Branching_Offset/in_Data0
add wave -noupdate -label BranchingData1 -radix hexadecimal /MIPS_Processor_TB/DUV/PC_Plus_Branching_Offset/in_Data1
add wave -noupdate -label BranchingOut -radix hexadecimal /MIPS_Processor_TB/DUV/PC_Plus_Branching_Offset/out_Result
add wave -noupdate -divider {Memory Access}
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/RAM_External/in_WriteData_dw
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/RAM_External/in_Address_dw
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/RAM_External/in_MemWrite
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/RAM_External/in_MemRead
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/RAM_External/o_ReadData_dw
add wave -noupdate -divider {Write Back}
add wave -noupdate -radix binary /MIPS_Processor_TB/DUV/writeRegisterSource/in_Selector
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/writeRegisterSource/MUX_Data0_dw
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/writeRegisterSource/MUX_Data1_dw
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/DUV/writeRegisterSource/MUX_Output_dw
add wave -noupdate -divider {Forward Unit}
add wave -noupdate -color Yellow -radix binary /MIPS_Processor_TB/DUV/ForwardUnit/o_forward_lw
add wave -noupdate -color Yellow -radix binary /MIPS_Processor_TB/DUV/ForwardUnit/o_forwardA_2
add wave -noupdate -color Yellow -radix binary /MIPS_Processor_TB/DUV/ForwardUnit/o_forwardB_2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {194 ps} 0} {{Cursor 2} {4 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 175
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {171 ps} {209 ps}
