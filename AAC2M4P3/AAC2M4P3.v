module FSM
#(
parameter A = 2'b00, B=2'b01, C=2'b10, D=2'b11)
(
input In1,
input RST,
input CLK,
output reg Out1
);

reg current_state,next_state;

always @(In1 or current_state)
begin
	case (current_state)
		A : if(In1==1'b1) next_state = B; else next_state = A;
		B : if(In1==1'b1) next_state = B; else next_state = C;
		C : if(In1==1'b1) next_state = A; else next_state = C;
	endcase
end
always@(posedge CLK or negedge RST)
begin
	if(!RST)
		current_state = current_state;
	else
		current_state = next_state;
end

always@(current_state)

begin:OUTPUT_LOGIC

case(current_state)

A : Out1=1'b0;

B : Out1=1'b0;

C : Out1=1'b1;

endcase
end

endmodule
