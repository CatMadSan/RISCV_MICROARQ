`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2022 07:52:37 PM
// Design Name: 
// Module Name: EXT_ALUSrc2
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


module EXT_ALUSrc2(
    input OP2_0,
    input [6:0] Imm_7, //aka imm S [31:25]
    input [4:0] Imm_5, //aka imm S [11:7]
    input [4:0] Shamt_5, //aka shamtI
    output [31:0] Out
    );
    
        
    wire [31:0] ImmS; 
    wire [31:0] ShamtI;
    reg [31:0] extendido;
    
    assign ImmS = {20'b0,Imm_7,Imm_5};
    assign ShamtI = {27'b0,Shamt_5};
    initial extendido = 32'b0;
    
    always #20 begin
        case(OP2_0)
            0: extendido <= ImmS; //SW
            1: extendido <= ShamtI; //SRAI
        endcase
    end
    
    assign Out = extendido;
    
endmodule
