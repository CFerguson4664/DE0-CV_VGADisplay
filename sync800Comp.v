//Used to determine which column we are currently in
module sync800Comp(CLK,Cout);
	input CLK;
	output[9:0] Cout;
	wire[9:0] C;
	wire[9:0] jkInput;
	
	wire reset;
	
	//JK inputs for synchronous counter
	assign jkInput[0] = 1;
	assign jkInput[1] = C[0];
	assign jkInput[2] = C[1]&C[0];
	assign jkInput[3] = C[2]&C[1]&C[0];
	assign jkInput[4] = C[3]&C[2]&C[1]&C[0];
	assign jkInput[5] = C[4]&C[3]&C[2]&C[1]&C[0];
	assign jkInput[6] = C[5]&C[4]&C[3]&C[2]&C[1]&C[0];
	assign jkInput[7] = C[6]&C[5]&C[4]&C[3]&C[2]&C[1]&C[0];
	assign jkInput[8] = C[7]&C[6]&C[5]&C[4]&C[3]&C[2]&C[1]&C[0];
	assign jkInput[9] = C[8]&C[7]&C[6]&C[5]&C[4]&C[3]&C[2]&C[1]&C[0];
	
	//Reset the counter to zero
	assign reset = (C==800) ? 1'b1 : 1'b0;
	
	//Output at each of the important points in a horizontal line
	assign Cout = C;
	
	//JKFlipFlopAResetComp FF0 (J, K, CLK, Q, Reset)
	JKFlipFlopAResetComp FF0 (jkInput[0],jkInput[0],CLK,C[0],reset);
	JKFlipFlopAResetComp FF1 (jkInput[1],jkInput[1],CLK,C[1],reset);
	JKFlipFlopAResetComp FF2 (jkInput[2],jkInput[2],CLK,C[2],reset);
	JKFlipFlopAResetComp FF3 (jkInput[3],jkInput[3],CLK,C[3],reset);
	JKFlipFlopAResetComp FF4 (jkInput[4],jkInput[4],CLK,C[4],reset);
	JKFlipFlopAResetComp FF5 (jkInput[5],jkInput[5],CLK,C[5],reset);
	JKFlipFlopAResetComp FF6 (jkInput[6],jkInput[6],CLK,C[6],reset);
	JKFlipFlopAResetComp FF7 (jkInput[7],jkInput[7],CLK,C[7],reset);
	JKFlipFlopAResetComp FF8 (jkInput[8],jkInput[8],CLK,C[8],reset);
	JKFlipFlopAResetComp FF9 (jkInput[9],jkInput[9],CLK,C[9],reset);
	
	
endmodule
