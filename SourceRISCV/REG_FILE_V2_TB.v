`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2022 11:31:50 AM
// Design Name: 
// Module Name: REG_FILE_V2_TB
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

module REG_FILE_V2_TB();
//Inputs 
reg [5:0] A1;
reg [5:0] A2;
reg [5:0] A3;
reg [31:0] WriteData;
reg WE;
reg Clk;
integer i;

//Outputs 
wire [31:0] zerp;
wire [31:0] RD1;
wire [31:0] RD2;

REG_FILE_V2 UUT(
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .WriteData(WriteData),
    .WE(WE),
    .clock(Clk),
    .zero(zerp),
    .RD1(RD1),
    .RD2(RD2)
    );

initial begin
    Clk <= 0;
    forever #10 Clk <= ~Clk;
end

always@(posedge Clk) begin
    for (i=0; i<10; i=i+1)begin
		A1<=$urandom;
		A2<=$urandom;
		A3<=$urandom;
		WriteData<=$random;
		WE<=$random;
		#20;
    end
end

endmodule
