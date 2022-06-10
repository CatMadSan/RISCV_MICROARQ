`timescale 1ns / 1ps

module MEMORY_TB();
//Inputs 
   reg clock;
   reg Reset;
   reg [31:0] Dir;
   reg [31:0] WriteData;
   reg MemWrite;

integer i;

//Outputs 
wire [31:0] ReadData;

DataM UUT(
    .CLK(clock),
    .RST(Reset),
    .Address(Dir),
    .WriteData(WriteData),
    .MemWrite(MemWrite),
    .ReadData(ReadData)
    );

initial begin
clock <= 0;
 forever #20 clock <= ~clock;
 end
 always@(posedge clock) begin
  for (i=0; i<10; i=i+1)begin
		Reset<=$random;
		Dir<=$random;
		WriteData<=$random;
		MemWrite<=$random;
		#20;
		end
	  $dumpfile("testmemoria.txt");
	  $dumpvars(1,Dir,ReadData); 
	  #200;
        $dumpoff;
        #200;
        $dumpon;
        #20;
        $dumpall;
        #10;
        $dumpflush;

end
endmodule
