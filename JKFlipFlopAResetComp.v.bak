//Requires DFlipFlopAResetComp

module JKFlipFlopAResetComp(J,K,CLK,Q,reset);
	input J,K,CLK,reset;
	output Q;
	wire CL;
	assign CL = (~Q & J) | (Q & ~K);
	DFlipFlopAResetComp ff0 (CL,CLK,Q,reset);
endmodule
