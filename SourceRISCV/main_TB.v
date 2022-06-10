`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2022 03:43:43 AM
// Design Name: 
// Module Name: main_TB
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


module main_TB(
    );
    
    //inputs 
    reg clock;
    reg Reset;
    
    //outputs 
    wire [31:0] ReadData;
    wire [31:0] ALUResult;
    
    //Stimuli
    initial begin
        clock <= 0;
        Reset <= 0;
        #10 Reset <= 1;
        #10 clock <= 1;
        #10 Reset <= 0;
        #10 clock <= 0;
    end
    
    main UUT(
        .clock(clock),
        .Reset(Reset),
        .ReadData(ReadData),
        .ALUResult(ALUResult)
        );
        
    always #10 clock <= ~clock;
    
endmodule
