module DFlipFlopAResetComp(D,CLK,Q,reset);
input D,CLK,reset;
output Q;
reg Q;
always@(negedge CLK, posedge reset)
	begin 
		if(reset == 1) Q = 0;
		else Q = D;
	end
endmodule
