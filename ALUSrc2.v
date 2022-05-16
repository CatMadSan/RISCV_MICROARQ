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
    input [4:0] OP2,
    input [31:0] RS2,
    input [6:0] Imm_7, //aka imm S [31:25]
    input [4:0] Imm_5, //aka imm S [11:7]
    input signed [11:0] Imm_12, //aka imm I, note que en estos integers es que se requiere que tengan signos
    input signed [4:0] Shamt_5, //aka shamtI
    input [19:0] Imm_20 ,//aka imm U
    output [31:0] Out
    );
    
    wire [31:0] ImmI, ImmS, ShamtI,ImmU;
    reg [31:0] extendido;   ///NOTE QUE REQUIERE EXTEND SENSIBLE A SIGNOS
    reg [19:0] signoImmI;
    reg [19:0] signoshamtI;
    
    always @(Imm_12) for (i = 0; i < 20; i = i+1) signoImmI[i] <= Imm_12[0]; //como estos dos son signed, 
    always @(Shamt_5) for (i = 0; i < 20; i = i+1) signoshamtI[i] <= Shamt_5[0]; //hay que extenderlos acordemente
    
    assign ImmI = {signoImmI,Imm_12};
    assign ImmS = {20'b0,Imm_7,Imm_5};
    assign ShamtI = {signoshamtI,Shamt_5};
    assign ImmU = {Imm_20,12'b0};
    
    initial extendido = 32'b0;
    
    always #20 begin
        case(OP2_0)
            0: extendido <= RS2;//ADD (usa R2)
            1: extendido <= ImmI; //Extend ImmI
            2: extendido <= ImmS; //SW ImmS
            3: extendido <= ShamtI; //SRAI
            4: extendido <= ImmU;
            default: extendido <= RS2;
        endcase
    end
    
    assign Out = extendido;
    
endmodule
