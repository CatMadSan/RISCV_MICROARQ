`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2022 11:03:34 AM
// Design Name: 
// Module Name: EXT_ALUSrc2_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ALUSrc2_TB(); //&&&&&&&&&&&&&&&&&
//Inputs 
reg [4:0] OP2;
reg [31:0] RS2;
reg [6:0] Imm_7;
reg [4:0] Imm_5;
reg signed [11:0] Imm_12;
reg signed [4:0] Shamt_5;
reg [19:0] Imm20;

//Outputs 
wire [31:0] out;

ALUSrc2 UUT(
    .OP2(OP2),
    .RS2(RS2),
    .Imm_7(Imm_7),
    .Imm_5(Imm_5),
    .Imm_12(Imm_12),
    .Shamt_5(Shamt_5),
    .Imm_20(Imm20),
    .AluSrc2(out)
    );

initial begin
	OP2 <= 0;
	RS2 <= 4'b1010;
	Imm_7 <= 3'b111;
	Imm_5 <= 3'b010;
	Imm_12 <= 5'b11010;
	Shamt_5 <= 3'b101;
	Imm20 <= 8'b11100111;
end

always #150 OP2 <= OP2 + 1;

endmodule
