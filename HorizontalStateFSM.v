//FSM Design

module HorizontalStateFSM(A,CLK,Y,Q);
input CLK;
input[9:0] A;
output Y;
output [1:0] Q;

parameter S0 = 0;
parameter S1 = 1;
parameter S2 = 2;
parameter S3 = 3;


reg [1:0] pState, nState;

//Shift logic
always@(posedge CLK)
begin
	pState = nState;
end

//Next state logic
always@(*)
case(pState)
S0 :	case(A)
			95 : nState = S1;
			default : nState = S0;
		endcase
S1 :	case(A)
			143 : nState = S2;
			default : nState = S1;
		endcase
S2 :	case(A)
			783 : nState = S3;
			default : nState = S2;
		endcase
S3 : 	case(A)
			799 : nState = S0;
			default : nState = S3;
		endcase
default : nState = S0;
endcase

assign Q = pState;

assign Y = (pState == S0) ? 0 : 1;

endmodule
		