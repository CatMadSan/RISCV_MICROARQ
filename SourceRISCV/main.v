`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2022 12:01:31 AM
// Design Name: 
// Module Name: main
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
module main(
    input clock,
    input Reset,
    output [31:0] ALUResult,
    output [31:0] ReadData
    );
    
    reg [6:0] PC;
    reg [2:0] state;
    
    initial begin
        PC <= 0;
        state <= 0;
    end
    
    wire [31:0] Result;
    wire [31:0] instruccion;
    wire Muxrs1;
    wire [1:0] Op1;
    wire [1:0] ALU;
    wire WriteEnable;
    wire MemWrite;
    wire [2:0] Op2;
    wire [31:0] zero;
    wire [31:0] RD1;
    wire [31:0] RD2;
    wire signed [31:0] AluSrc1;
    wire signed [31:0] AluSrc2;
    
    INSTRUCTION_MEMORY IM(
        .Adress(PC),
        .clock(clock),
        .Reset(Reset),
        .DOut(instruccion)
        );
        
    CU UC(
        .Opcode(instruccion[6:0]),
        .Funct3(instruccion[14:12]),
        .clock(clock),
        .Muxrs1(Muxrs1),
        .Op1(Op1),
        .ALU(ALU),
        .WriteEnable(WriteEnable),
        .MemWrite(MemWrite),
        .Op2(Op2)
        );
        
        REG_FILE_V2 RF(
            .A1(instruccion[19:15]),
            .A2(instruccion[24:20]),
            .A3(instruccion[11:7]),
            .WriteData(Result),
            .WE(WriteEnable),
            .clock(clock),
            .Reset(Reset),
            .zero(zero),
            .RD1(RD1),
            .RD2(RD2)
            );
            
        ALUSrc1 ALUSrc1(
            .zero(zero),
            .RS1(RD1),
            .Muxrs1(Muxrs1),
            .AluSrc1(AluSrc1)
            );
            
        ALUSrc2 ALUSrc2(
            .OP2(Op2),
            .RS2(RD2),
            .Imm_7(instruccion[31:25]),
            .Imm_5(instruccion[11:7]),
            .Imm_12(instruccion[31:20]),
            .Shamt_5(instruccion[24:20]),
            .Imm_20(instruccion[31:12]),
            .AluSrc2(AluSrc2)
            );
            
         ALU Alu(
            .ALU(ALU),
            .Operand1(AluSrc1),
            .Operand2(AluSrc2),
            .clock(clock),
            .resultado(ALUResult)
            );
            
         DataM Mem (
            .CLK(clock),
            .RST(Reset),
            .Address(ALUResult),
            .WriteData(RD2),
            .MemWrite(MemWrite),
            .ReadData(ReadData)
            );
            
         RESULT Resultado (
            .ALUResult(ALUResult),
            .ReadData(ReadData),
            .Reset(Reset),
            .OP1(Op1),
            .Result(Result)            
            );
    
    always@(posedge clock or posedge Reset) begin
        if (Reset == 1) begin
            PC <= 7'b0000000;
            state <= 3'b000;
        end
        else begin
            case(state)
                0 : state <= 1;//Fetch: da un ciclo de reloj de tiempo para extraer la instruccion
                1 : state <= 2; //Decode: da un ciclo de reloj de tiempo para que la informacion entre bien en CU y etc.   
                2 : state <= 3; //Execute: da un ciclo de reloj para que todo entre a la ALU correctmente.
                3: state <= 4; //Memory: da un ciclo de reloj para que todo llegue bien a la parte de memoria.
                4: begin //Writeback: da tiempo a que se escriba el valor correcto, de requerirlo, en el registro destino. Se actualiza PC en este estado.
                        PC <= PC + 1;
                        state <= 0;
                   end
            endcase
        end
    end
    
endmodule


