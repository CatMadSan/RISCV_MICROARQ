`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2022 10:24:25 AM
// Design Name: 
// Module Name: ALU_TB
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

module ALU_TB();
//Inputs 
reg [2:0] OP;
reg [31:0] Operand1;
reg [31:0] Operand2;
reg clock;

//Outputs 
wire [31:0] Out;

//Stimuli

ALU UUT(
    .ALU(OP),
    .clock(clock),
    .Operand1(Operand1),
    .Operand2(Operand2),
    .resultado(Out)
    );

initial begin
    OP = 0;
    clock = 0;
    Operand1 = 31'b010;
    Operand2 = 31'b101;
end
always #20 clock <= ~clock;
always #150 OP <= OP + 1;

endmodule
