module PriorityEncoder4to2(in,out);
	input[3:0] in;
	output[1:0] out;
	reg [1:0] out;
	
	always @ (*)
		casex(in)
			4'b1xxx: out = 2'b11;
			4'b01xx: out = 2'b10;
			4'b001x: out = 2'b01;
			4'b0001: out = 2'b00;
			default: out = 2'b00;
		endcase
endmodule
			