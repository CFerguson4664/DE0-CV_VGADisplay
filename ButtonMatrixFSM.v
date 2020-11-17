// handles the input from the button matrix
module ButtonMatrixFSM(IOIn,IOOut,H,V,Y,CLK);

	input CLK;
	input[3:0] IOIn;
	output[3:0] IOOut;
	output [1:0] H,V;
	reg [3:0] rawH,rawV;
	wire [1:0] H,V;
	reg [3:0] IOOut;
	output Y;
	reg Y;


	parameter S0 = 0;
	parameter S1 = 1;
	parameter S2 = 2;
	parameter S3 = 3;
	parameter S4 = 4;
	parameter S5 = 5;
	parameter S6 = 6;
	parameter S7 = 7;
	parameter S8 = 8;
	parameter S9 = 9;
	parameter S10 = 10;


	reg [3:0] pState, nState;

	//Shift logic
	always@(posedge CLK)
	begin
		pState = nState;
	end

	//Next state logic
	always@(*)
	begin
	case(pState)

	S0 :	begin
			nState = S1;
			IOOut = 4'b0001;
			Y = 0;
			end

	S1 :	begin
			IOOut = 4'b0001;
			nState = S2;
			if(IOIn != 0) rawH = IOIn;
			if(IOIn != 0) rawV = IOOut;
			Y = 0;
			end
			
			
	S2 :	begin
			nState = S3;
			IOOut = 4'b0010;
			Y = 0;
			end

	S3 :	begin
			nState = S4;
			IOOut = 4'b0010;
			if(IOIn != 0) rawH = IOIn;
			if(IOIn != 0) rawV = IOOut;
			Y = 0;
			end
			
			
	S4 :	begin
			nState = S5;
			IOOut = 4'b0100;
			Y = 0;
			end

	S5 :	begin
			nState = S6;
			IOOut = 4'b0100;
			if(IOIn != 0) rawH = IOIn;
			if(IOIn != 0) rawV = IOOut;
			Y = 0;
			end
			
			
	S6 :	begin
			nState = S7;
			IOOut = 4'b1000;
			Y = 0;
			end

	S7 :	begin
			nState = S8;
			IOOut = 4'b1000;
			if(IOIn != 0) rawH = IOIn;
			if(IOIn != 0) rawV = IOOut;
			Y = 0;
			end
			
			
	S8	:	begin
			IOOut = 4'b0000;
			nState = S9;
			if(rawH != 0) Y = 1;
			end

	S9	:	begin
			IOOut = 4'b0000;
			nState = S10;
			Y = 0;
			end
			
	S10:	begin
			IOOut = 4'b0000;
			nState = S0;
			rawH = 0;
			rawV = 0;
			Y = 0;
			end
			

	default : nState = S0;
	endcase


	end

	// turn the button address from one hot to binary
	PriorityEncoder4to2 e0(rawH,H);
	PriorityEncoder4to2 e1(rawV,V);

endmodule
		