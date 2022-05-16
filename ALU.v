`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2022 06:34:04 PM
// Design Name: 
// Module Name: ALU
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


module ALU
    #(parameter N = 3)(
    input [2:0] OP, //Entra ALUCntrl, que para fines de este proyecto, debe representar los 5 (=4'b101 > 3'b11) estados diferentes
    input signed [N:0] Operand1,//Entra ALUSrc1
    input signed [N:0] Operand2,//ALUSrc2
    input clock,
    output signed [N:0] Out//Sale ALUResult
    );
    
    reg signed [N:0] resultado;
    
    always @(posedge clock) begin
        case (OP)
            0: resultado <= Operand1 + Operand2;//el mas usado: la suma, caso 000
            1: resultado <= Operand1 >> Operand2;//Caso 001: bitwise shift right
            2: resultado <= Operand1 | Operand2;//Caso 010: bitwise or
            3: resultado <= Operand1 & Operand2;//Caso 011: bitwise and
        endcase
    end
    
    assign Out = resultado;
    
endmodule
