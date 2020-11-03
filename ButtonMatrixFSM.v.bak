module ButtonMatrixFSM(IOIn,IOOut,H,V,CLK);

input CLK;
input[3:0] IOIn;
output[3:0] IOOut;
output [1:0] H,V;




//FSM Design



input[9:0] A;
output reg[3:0] Red,Green,Blue;

parameter S0 = 0;
parameter S1 = 1;
parameter S2 = 2;
parameter S3 = 3;
parameter S4 = 4;
parameter S5 = 5;
parameter S6 = 6;
parameter S7 = 7;


reg [3:0] pState, nState;

//Shift logic
always@(posedge CLK)
begin
	pState = nState;
end

//Next state logic
always@(*)
case(pState)
S0 :	begin
		case(A)
			59 : nState = S1;
			default : nState = S0;
		endcase
		
		Red = 15;
		Green = 0;
		Blue = 0;
		end
S1 :	begin
		case(A)
			119 : nState = S2;
			default : nState = S1;
		endcase
		
		Red = 0;
		Green = 15;
		Blue = 0;
		end
S2 :	begin
		case(A)
			179 : nState = S3;
			default : nState = S2;
		endcase
		
		Red = 0;
		Green = 0;
		Blue = 15;
		end
S3 :	begin
		case(A)
			239 : nState = S4;
			default : nState = S3;
		endcase
		
		Red = 15;
		Green = 15;
		Blue = 0;
		end
S4 :	begin
		case(A)
			299 : nState = S5;
			default : nState = S4;
		endcase
		
		Red = 0;
		Green = 15;
		Blue = 15;
		end
S5 :	begin
		case(A)
			359 : nState = S6;
			default : nState = S5;
		endcase
		
		Red = 15;
		Green = 0;
		Blue = 15;
		end
S6 :	begin
		case(A)
			419 : nState = S7;
			default : nState = S6;
		endcase
		
		Red = 15;
		Green = 15;
		Blue = 15;
		end
S7 :	begin
		case(A)
			479 : nState = S0;
			default : nState = S7;
		endcase
		
		Red = 0;
		Green = 0;
		Blue = 0;
		end
default : nState = S0;
endcase

endmodule
		