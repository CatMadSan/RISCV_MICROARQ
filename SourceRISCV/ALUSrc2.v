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


module ALUSrc2( //&&&&&&
    input [4:0] OP2,
    input [31:0] RS2,
    input [6:0] Imm_7, //aka imm S [31:25]
    input [4:0] Imm_5, //aka imm S [11:7]
    input signed [11:0] Imm_12, //aka imm I, note que en estos integers es que se requiere que tengan signos
    input signed [4:0] Shamt_5, //aka shamtI
    input [19:0] Imm_20 ,//aka imm U
    output reg signed [31:0] AluSrc2   ///NOTE QUE REQUIERE EXTEND SENSIBLE A SIGNOS
    );
    
    wire [31:0] ImmI, ImmS, ShamtI,ImmU;
    reg [19:0] signoImmI;
    reg [19:0] signoshamtI;
    integer i;
    reg signoI;
    reg signoshmtI;
    
    always @(*) begin
        signoI <= Imm_12[11];
        signoshmtI <= Shamt_5[4];
        for (i = 0; i < 20; i = i+1) signoImmI[i] <= signoI; //como estos dos son signed, 
        for (i = 0; i < 20; i = i+1) signoshamtI[i] <= signoshmtI; //hay que extenderlos acordemente
    end
    
    assign ImmI = {signoImmI,Imm_12};
    assign ImmS = {20'b0,Imm_7,Imm_5};
    assign ShamtI = {signoshamtI,Shamt_5};
    assign ImmU = {Imm_20,12'b0};
    
    initial AluSrc2 = 32'b0;
    
    always@(*) begin
        case(OP2)
            0: AluSrc2 <= RS2;//ADD (usa R2)
            1: AluSrc2 <= ImmI; //Extend ImmI
            2: AluSrc2 <= ImmS; //SW ImmS
            3: AluSrc2 <= ShamtI; //SRAI
            4: AluSrc2 <= ImmU;
            default: AluSrc2 <= RS2;
        endcase
    end
    
endmodule
