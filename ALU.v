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
    input [3:0] OP, //Entra ALUCntrl, que para fines de este proyecto, debe representar los 5 (=4'b101 > 3'b11) estados diferentes
    input [N:0] Operand1,//Entra ALUSrc1
    input [N:0] Operand2,//ALUSrc2
    output [N:0] Out//Sale ALUResult
    );
    
    reg [N:0] resultado;
    
    always #20 begin
        case (OP)
            0: resultado <= Operand1 + Operand2;//el mas usado: la suma, caso 000
            1: resultado <= Operand1 >> Operand2;//Caso 001: bitwise shift right
            2: resultado <= Operand1 | Operand2;//Caso 010: bitwise or
            3: resultado <= Operand1 & Operand2;//Caso 011: bitwise and
            4: resultado <= Operand1 << Operand2; //Caso 100: bitwise shift left, el menos ussado (usado SOLO con LUI)
        endcase
    end
    
    assign Out = resultado;
    
endmodule
