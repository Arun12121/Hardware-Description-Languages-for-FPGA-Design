module LS161a(
    input [3:0] D,        // Parallel Input
    input CLK,            // Clock
    input CLR_n,          // Active Low Asynchronous Reset
    input LOAD_n,         // Enable Parallel Input
    input ENP,            // Count Enable Parallel
    input ENT,            // Count Enable Trickle
    output [3:0]Q,        // Parallel Output    
    output RCO            // Ripple Carry Output (Terminal Count)
); 
reg [3:0]Q_temp;
always@(posedge CLK or negedge CLR_n)
begin
	if(CLR_n == 1'b0)
		Q_temp <= 4'b0;
	else
	begin
		if(LOAD_n == 1'b0)
			Q_temp <= D;
		else if(ENP == 1'b1 & ENT == 1'b1)
			Q_temp<=Q_temp+1;
	end
end
assign Q = Q_temp;
assign RCO = (&Q_temp)&ENT;
endmodule


