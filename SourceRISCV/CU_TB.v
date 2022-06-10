`timescale 1ns / 1ps

module CU_TB();
//Inputs 
reg [6:0] Opcode;
reg [2:0] Funct3;
reg clock;

//Outputs 
wire Muxrs1;
wire [1:0] Op1;
wire [1:0] ALU;
wire WriteEnable;
wire MemWrite;
wire [2:0] Op2;
//Stimuli

CU UUT(
    .Opcode(Opcode),
    .Funct3(Funct3),
    .clock(clock),
    .Muxrs1(Muxrs1),
    .Op1(Op1),
    .ALU(ALU),
    .WriteEnable(WriteEnable),
    .MemWrite(MemWrite),
    .Op2(Op2)
    );

initial begin
    Opcode <= 0;
    clock <= 0;
    Funct3 <=0;
    forever #10 clock <=~clock;
    end
    
always@(posedge clock) begin
    Opcode <= 7'b0110011;
    Funct3 <= 3'b000;
    #20;
    Opcode <=7'b0110111;
    Funct3 <=3'b010;
    #20;
    Opcode <=7'b0100011;
    #20;
    Opcode <=7'b0000011;
    Funct3 <=3'b010;
    #20;
    Opcode <=7'b0010011;
    Funct3 <=3'b000;
    #20;
    Funct3 <=3'b101;
    #20;
    Funct3 <=3'b110;
    #20;
    Funct3 <=3'b111;
    #20;
end


endmodule