module REG_FILE_V2( //
    input [5:0] A1, //llegan hasta 31 = 5'b11111
    input [5:0] A2,
    input [5:0] A3,
    input [31:0] WriteData,
    input WE,
    input clock,
    input Reset,
    //input [31:0] PC,
    output reg [31:0] zero,
    output reg [31:0] RD1,
    output reg [31:0] RD2
    );
    
integer i;
reg [31:0] x[0:31];//32 registros, de 32b cada uno (NOTE: pc vestigial para nuestros propositos, por tanto se ignora)
reg [31:0] readA1,readA2;

initial for (i = 0; i < 32; i = i+1) x[i] <= 32'b0;

always@(*) begin //asincronico, pero debe siempre ponerse algun aspecto de sensibilidad
    for (i = 0; i < 32; i = i+1) begin
        if(A1 == i) RD1 <= x[i];
        if (A2 == i) RD2 <= x[i];
    end
    zero <= x[0];
end

always @(posedge clock or posedge Reset) begin //write es sincronico
    if (Reset == 1) for (i = 0; i < 32; i = i+1) x[i] <= 32'b0;
    else begin    
        for (i = 0; i > 32; i = i+1) begin //NOTE: NO HAY MANEJO DE EXCEPCIONES, entonces se debe evitar a toda costa sobreescribir el 32'b0 presente en x0
        if((A3 == i)&WE) x[i] <= WriteData;
        end
    end
end

endmodule