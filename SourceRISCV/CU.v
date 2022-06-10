`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2022 10:43:03 PM
// Design Name: 
// Module Name: CU
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

module CU(
    input [6:0] Opcode,
    input [2:0] Funct3,
    input clock,
    output reg Muxrs1,
    output reg [1:0] Op1,
    output reg [1:0] ALU,
    output reg WriteEnable,
    output reg MemWrite,
    output reg [2:0] Op2
    );
    
    always @(posedge clock) 
	    begin
          if (Opcode == 7'b0110011)
			begin
			if (Funct3 == 3'b0)begin
				Muxrs1<=1'b0;
				Op1<=2'b11;
				ALU<=2'b00;
				WriteEnable<=1'b1;
				MemWrite<=1'b0;
			    Op2<=3'b000;
				end
			end
          else if (Opcode == 7'b0100011)
			begin
			if (Funct3 == 3'b010)
			begin
				Muxrs1<=1'b0;
				Op1<=2'b01;
			    ALU<=2'b00;
				WriteEnable<=1'b0;
				MemWrite<=1'b1;
				Op2<=3'b010;	
				end
			end	
          else if (Opcode == 7'b0110111)
          begin
			Muxrs1<=1'b1;
			Op1<=2'b11;
		    ALU<=2'b00;
			WriteEnable<=1'b1;
			MemWrite<=1'b0;
			Op2<=3'b100;end
          else if (Opcode == 7'b0000011)
			begin
			if (Funct3 == 3'b010)begin
				Muxrs1<=1'b0;
				Op1<=2'b01;
			    ALU<=2'b00;
				WriteEnable<=1'b1;
				MemWrite<=1'b0;
				Op2<=3'b001;	
				end
			end
          else if (Opcode == 7'b0010011)
			begin
			if ( Funct3 == 3'b000) begin
				Muxrs1<=1'b0;
				Op1<=2'b11;
			    ALU<=2'b0;
				WriteEnable<=1'b1;
				MemWrite<=1'b0;
				Op2<=3'b001;		
				end
			else if (Funct3 == 3'b101)
			begin
				Muxrs1<=1'b0;
				Op1<=2'b11;
			    ALU<=2'b01;
				WriteEnable<=1'b1;
				MemWrite<=1'b0;
				Op2<=3'b011;		
				end
			else if ( Funct3 == 3'b110)
			begin
				Muxrs1<=1'b0;
				Op1<=2'b11;
			    ALU<=2'b10;
				WriteEnable<=1'b1;
				MemWrite<=1'b0;
				Op2<=3'b001;		
				end
			else if ( Funct3 == 3'b111)begin
				Muxrs1<=1'b0;
				Op1<=2'b11;
			    ALU<=2'b11;
				WriteEnable<=1'b1;
				MemWrite<=1'b0;
				Op2<=3'b001;	
				end
			end					
    	end  
endmodule
