`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2022 12:37:19 AM
// Design Name: 
// Module Name: INSTRUCTION_MEMORY
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


module INSTRUCTION_MEMORY( //OJO POR ALGUNA RAZON no comienza a leer sino hasta el tercer ciclo de clock, TOMAR ESO EN CUENTA
    input [6:0] Adress,//Asi hay suficiente campo para guardar la ultima instruccion: la 140 (que es la #35 = , pues se aumenta en 4 cada leida)
    input clock, //tamano de palabra: 1 byte
    input Reset,
    output reg [31:0] DOut
    );
    
    reg [31:0] MemoriaInstrucciones  [0:34]; //matriz de 35 units deep, de 32 bits c/u
    //para que funcione readmemh, debe tener la misma cantidad de bits que el .txt
    
    initial begin
        $readmemh("INSTRUCTION_ROM.txt",MemoriaInstrucciones);
    end
    
    always@(posedge clock) DOut <= MemoriaInstrucciones[Adress];
    
endmodule
