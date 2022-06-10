`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2021 10:38:55 PM
// Design Name: 
// Module Name: DataM
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


module DataM(Address, WriteData, CLK,RST, MemWrite, ReadData);

    input [31:0] Address; // Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 

    input CLK,RST;
    input MemWrite; // Control signal for memory write //WE

    output reg[31:0] ReadData; // Contents of memory location at Address

    reg[31:0] 	Memory[0:512]; // stack pointer initialization depends on this
    integer i;
    always 	@(posedge CLK)
    begin
    if (RST==1) begin
        ReadData <= 0;
        for (i = 0; i < 512; i = i + 1) begin
            Memory[i] = i;
        end
        end
        else if (MemWrite==1) begin
            Memory[Address] <= WriteData;
        end

        else if	(MemWrite  == 0) begin
            ReadData <= Memory[Address];
        end
        else begin
        ReadData <= 32'bz;      // Cuando tanto la lectura como la escritura no son válidas, está en estado de alta impedancia. Si no se agrega esta oración, habrá problemas con el tiempo
       end
    end
endmodule 

