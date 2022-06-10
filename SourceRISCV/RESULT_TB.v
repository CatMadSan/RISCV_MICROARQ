`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2022 12:01:07 PM
// Design Name: 
// Module Name: RESULT_TB
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


`timescale 1ns / 1ps

module RESULT_TB();
//Inputs 
reg [31:0] ALUResult;
reg [31:0] ReadData;
reg Reset;
reg [1:0] OP1;
integer i;

//Outputs 
wire [31:0] Result;

RESULT(
    .ALUResult(ALUResult),
    .ReadData(ReadData),
    .Reset(Reset),
    .OP1(OP1),
    .Result(Result)
    );

initial begin
 
  for (i=0; i<10; i=i+1)begin
		Reset=$random;
		ALUResult=$random;
		ReadData=$random;
		OP1=$random;
		#20;
		end
end

endmodule
