//FSM Design
//Controls which horizontal block of pixels we are writing to
module HorizontalColorStateFSM(A,CLK,Q);
	input CLK;
	input[9:0] A;
	output [2:0] Q;

	parameter S0 = 0;
	parameter S1 = 1;
	parameter S2 = 2;
	parameter S3 = 3;
	parameter S4 = 4;
	parameter S5 = 5;
	parameter S6 = 6;
	parameter S7 = 7;


	reg [2:0] pState, nState;

	//Shift logic
	always@(posedge CLK)
	begin
		pState = nState;
	end

	//Next state logic
	always@(*)
	case(pState)
	S0 :	case(A)
				223 : nState = S1;
				default : nState = S0;
			endcase
	S1 :	case(A)
				303 : nState = S2;
				default : nState = S1;
			endcase
	S2 :	case(A)
				383 : nState = S3;
				default : nState = S2;
			endcase
	S3 : 	case(A)
				463 : nState = S4;
				default : nState = S3;
			endcase
	S4 : 	case(A)
				543 : nState = S5;
				default : nState = S4;
			endcase
	S5 : 	case(A)
				623 : nState = S6;
				default : nState = S5;
			endcase
	S6 : 	case(A)
				703 : nState = S7;
				default : nState = S6;
			endcase
	S7 : 	case(A)
				783 : nState = S0;
				default : nState = S7;
			endcase
	default : nState = S0;
	endcase

	assign Q = pState;

endmodule
		