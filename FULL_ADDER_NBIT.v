`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2022 12:58:36 AM
// Design Name: 
// Module Name: FULL_ADDER_NBIT
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


module FULL_ADDER_NBIT #(parameter N)(
    input [N:0] sumand1,
    input [N:0] sumand2,
    output [N:0] suma
    );

assign suma = sumand1 + sumand2;

endmodule
