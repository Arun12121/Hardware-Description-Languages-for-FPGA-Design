module FIFO8x9(

input clk, rst,

input RdPtrClr, WrPtrClr,

input RdInc, WrInc,

input [8:0] DataIn,

output [8:0] DataOut,

input rden, wren

);

//signal declarations

reg [8:0] fifo_array[7:0];

reg [7:0] wrptr, rdptr;

wire [7:0] wr_cnt, rd_cnt;

reg[8:0]mem1;
integer i;

assign DataOut = mem1;
always@(posedge clk or negedge rst)
begin
	if(rst == 1)
	begin
		wrptr <= 0;
		rdptr <= 0;
		for(i=0;i<8;i=i+1)
			fifo_array[i] <= 0;
	end
	else
		if(RdPtrClr == 1)
			rdptr <= 0;
		else if(RdInc == 1)
			rdptr <= rdptr + 1;
		if(WrPtrClr == 1)
			wrptr <= 0;
		else if(WrInc == 1)
			wrptr <= wrptr + 1;
		if(wren == 1)
			fifo_array[wrptr] <= DataIn;
		if(rden == 1)
			mem1 <= fifo_array[rdptr];
	begin
	end
end
endmodule
