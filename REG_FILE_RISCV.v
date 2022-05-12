`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2022 05:22:06 PM
// Design Name: 
// Module Name: REG_FILE_RISCV
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


module REG_FILE_RISCV(  //NOTE: Read es asincronico, Write es sincronico con Clk
    input [31:0] A1,
    input [31:0] A2,
    input [31:0] A3,
    input [31:0] WriteData,
    input WE,
    input Clk,
    input [31:0] PC,
    output [31:0] zero,
    output [31:0] RD1,
    output [31:0] RD2
    );
    
    reg [31:0] X0 = 32'b00000000000000000000000000000000;
    reg [31:0] X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31;
    reg [31:0] pc;
    reg [31:0] readA1,readA2;
    
    initial begin
		X1 = 32'b00000000000000000000000000000000;
		X2 = 32'b00000000000000000000000000000000;
		X3 = 32'b00000000000000000000000000000000;
		X4 = 32'b00000000000000000000000000000000;
		X5 = 32'b00000000000000000000000000000000;
		X6 = 32'b00000000000000000000000000000000;
		X7 = 32'b00000000000000000000000000000000;
		X8 = 32'b00000000000000000000000000000000;
		X9 = 32'b00000000000000000000000000000000;
		X10 = 32'b00000000000000000000000000000000;
		X11 = 32'b00000000000000000000000000000000;
		X12 = 32'b00000000000000000000000000000000;
		X13 = 32'b00000000000000000000000000000000;
		X14 = 32'b00000000000000000000000000000000;
		X15 = 32'b00000000000000000000000000000000;
		X16 = 32'b00000000000000000000000000000000;
		X17 = 32'b00000000000000000000000000000000;
		X18 = 32'b00000000000000000000000000000000;
		X19 = 32'b00000000000000000000000000000000;
		X20 = 32'b00000000000000000000000000000000;
		X21 = 32'b00000000000000000000000000000000;
		X22 = 32'b00000000000000000000000000000000;
		X23 = 32'b00000000000000000000000000000000;
		X24 = 32'b00000000000000000000000000000000;
		X25 = 32'b00000000000000000000000000000000;
		X26 = 32'b00000000000000000000000000000000;
		X27 = 32'b00000000000000000000000000000000;
		X28 = 32'b00000000000000000000000000000000;
		X29 = 32'b00000000000000000000000000000000;
		X30 = 32'b00000000000000000000000000000000;
		X31 = 32'b00000000000000000000000000000000;
    end
    
    always #10 begin
        pc <= PC;
        case(A1)
			1: readA1 <= X1;
			2: readA1 <= X2;
			3: readA1 <= X3;
			4: readA1 <= X4;
			5: readA1 <= X5;
			6: readA1 <= X6;
			7: readA1 <= X7;
			8: readA1 <= X8;
			9: readA1 <= X9;
			10: readA1 <= X10;
			11: readA1 <= X11;
			12: readA1 <= X12;
			13: readA1 <= X13;
			14: readA1 <= X14;
			15: readA1 <= X15;
			16: readA1 <= X16;
			17: readA1 <= X17;
			18: readA1 <= X18;
			19: readA1 <= X19;
			20: readA1 <= X20;
			21: readA1 <= X21;
			22: readA1 <= X22;
			23: readA1 <= X23;
			24: readA1 <= X24;
			25: readA1 <= X25;
			26: readA1 <= X26;
			27: readA1 <= X27;
			28: readA1 <= X28;
			29: readA1 <= X29;
			30: readA1 <= X30;
			31: readA1 <= X31;
            default readA1 <=  X0;
        endcase
        
        case(A2)
			1: readA2 <= X1;
			2: readA2 <= X2;
			3: readA2 <= X3;
			4: readA2 <= X4;
			5: readA2 <= X5;
			6: readA2 <= X6;
			7: readA2 <= X7;
			8: readA2 <= X8;
			9: readA2 <= X9;
			10: readA2 <= X10;
			11: readA2 <= X11;
			12: readA2 <= X12;
			13: readA2 <= X13;
			14: readA2 <= X14;
			15: readA2 <= X15;
			16: readA2 <= X16;
			17: readA2 <= X17;
			18: readA2 <= X18;
			19: readA2 <= X19;
			20: readA2 <= X20;
			21: readA2 <= X21;
			22: readA2 <= X22;
			23: readA2 <= X23;
			24: readA2 <= X24;
			25: readA2 <= X25;
			26: readA2 <= X26;
			27: readA2 <= X27;
			28: readA2 <= X28;
			29: readA2 <= X29;
			30: readA2 <= X30;
			31: readA2 <= X31;
			default readA2 <=  X0;
        endcase
    end
    
    always @(posedge Clk) begin
        if(WE) begin
            case (A3) //NOTE: NO tiene manejo de excepciones: no soporta que le pidan ingresar algo a A3 = 0, por ejemplo
				1: X1<= WriteData;
				2: X2<= WriteData;
				3: X3<= WriteData;
				4: X4<= WriteData;
				5: X5<= WriteData;
				6: X6<= WriteData;
				7: X7<= WriteData;
				8: X8<= WriteData;
				9: X9<= WriteData;
				10: X10<= WriteData;
				11: X11<= WriteData;
				12: X12<= WriteData;
				13: X13<= WriteData;
				14: X14<= WriteData;
				15: X15<= WriteData;
				16: X16<= WriteData;
				17: X17<= WriteData;
				18: X18<= WriteData;
				19: X19<= WriteData;
				20: X20<= WriteData;
				21: X21<= WriteData;
				22: X22<= WriteData;
				23: X23<= WriteData;
				24: X24<= WriteData;
				25: X25<= WriteData;
				26: X26<= WriteData;
				27: X27<= WriteData;
				28: X28<= WriteData;
				29: X29<= WriteData;
				30: X30<= WriteData;
				31: X31<= WriteData;
            endcase
        end
    end
    
    assign zero = X0;
    assign RD1 = readA1;
    assign RD2 = readA2;
    
endmodule
