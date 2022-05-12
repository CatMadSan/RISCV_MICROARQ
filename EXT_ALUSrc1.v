`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2022 07:18:25 PM
// Design Name: 
// Module Name: EXT_ALUSrc1
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


module EXT_ALUSrc1 ( //POR AHORA VO A SEGUIR LA TABLA ESA EN EL DIAGRAMA
    input [4:0] OP2,
    input [31:0] RD2, //XQ???????????
    input [11:0] Imm_12, //aka imm I
    input [19:0] Imm_20, //aka immU
    output [31:0] Out
    );
    
    wire ImmI; 
    wire ImmU;
    reg [31:0] extendido;
    
    assign ImmI = {20'b0,Imm_12};
    assign ImmU = {12'b0,Imm_20};
    initial extendido = 32'b0;
    
    always #20 begin
        case(OP2)
            1: extendido <= ImmI;//LW 
            2: extendido <= RD2; //SW
            3: extendido <= ImmI; //SRAI
            4: extendido <= ImmU;//LUI
            default: extendido <= 32'b0;
        endcase
    end
    
    assign Out = extendido;
    
endmodule
