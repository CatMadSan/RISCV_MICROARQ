module REG_FILE_V2( //
    input [5:0] A1, //llegan hasta 31 = 5'b11111
    input [5:0] A2,
    input [5:0] A3,
    input [31:0] WriteData,
    input WE,
    input Clk,
    //input [31:0] PC,
    output [31:0] zero,
    output [31:0] RD1,
    output [31:0] RD2
    );
    
    reg [31:0] x[0:31];//32 registros, de 32b cada uno (NOTE: pc vestigial para nuestros propositos, por tanto se ignora)
reg [31:0] readA1,readA2;

initial for (i = 0; i < 32; i = i+1) x[i] <= 32'b0;

always #10 begin //asincronico, pero debe siempre ponerse algun aspecto de sensibilidad
    for (i = 0; i < 32; i = i+1) begin
        if(A1 == i) readA1 <= x[i];
        if (A2 == i) readA2 <= x[i];
    end
end

always @(posedge Clk) begin //write es sincronico
    for (i = 0; i < 32; i = i+1) begin //NOTE: NO HAY MANEJO DE EXCEPCIONES, entonces se debe evitar a toda costa sobreescribir el 32'b0 presente en x0
        if((A3 == i)&WE) x[i] <= WriteData;
    end
end

assign zero = x[0];
assign RD1 = readA1;
assign RD2 = readA2;

endmodule
