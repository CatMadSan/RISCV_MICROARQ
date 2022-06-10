`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2022 02:40:02 AM
// Design Name: 
// Module Name: RESULT
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


module RESULT(
    input [31:0] ALUResult,
    input [31:0] ReadData,
    input Reset,
    input [1:0] OP1,
    output reg [31:0] Result
    );
    
    always@(*) begin
        if (Reset == 1) Result <= 0;
        else begin
            case(OP1)
                1: Result <= ReadData;
                3: Result <= ALUResult;
                default: Result <= ALUResult;
            endcase
        end
    end
    
endmodule
