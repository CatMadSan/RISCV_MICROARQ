`timescale 1ns / 1ps

module INSTRUCTION_MEMORY_TB();
//Inputs 
reg [6:0] Adress;
reg clock;

//Outputs 
wire [31:0] DOut;

//Stimuli

INSTRUCTION_MEMORY UUT(
    .Adress(Adress),
    .clock(clock),
    .DOut(DOut)
    );

initial begin
    Adress = 0;
    clock = 0;
end

always #20 clock <= ~clock;
always #150 Adress <= Adress + 1; //POR ALGUNA RAZON dura dos ciclos de reloj en empezar a leer, entonces tomar eso en cuenta.

endmodule
