`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2022 01:33:05 AM
// Design Name: 
// Module Name: ALUSrc1
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


module ALUSrc1(
    input [31:0] zero,
    input [31:0] RS1,
    input Muxrs1,
    output reg [31:0] AluSrc1
    );
    
    always@(*) begin
        case(Muxrs1)
            0: AluSrc1 <= zero;
            1: AluSrc1 <= RS1;
        endcase
    end
    
endmodule
