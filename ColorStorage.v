//Handles the memory of the colors
module ColorStorage(SW,KEY,HCS,VCS,H,V,ButtonCLK,R,G,B);
	input [9:0] SW;
	input [3:0] KEY;
	input [2:0] HCS,VCS;
	input [1:0] H,V;
	input ButtonCLK;
	output [1:0]R,G,B;
	reg [1:0] R,G,B;
	wire V1;

	reg [5:0] colorData [7:0][7:0];

	// output the color at the given pixel group
	always@(*)
	begin
		R = {colorData[VCS][HCS][0],colorData[VCS][HCS][1]};
		G = {colorData[VCS][HCS][2],colorData[VCS][HCS][3]};
		B = {colorData[VCS][HCS][4],colorData[VCS][HCS][5]};
	end

	// set the color of a given pixel group
	always@(posedge ButtonCLK)
	begin
		colorData[{SW[1],V[1],V[0]}][{SW[0],H[1],H[0]}][0] = SW[7];
		colorData[{SW[1],V[1],V[0]}][{SW[0],H[1],H[0]}][1] = SW[6];
		colorData[{SW[1],V[1],V[0]}][{SW[0],H[1],H[0]}][2] = SW[5];
		colorData[{SW[1],V[1],V[0]}][{SW[0],H[1],H[0]}][3] = SW[4];
		colorData[{SW[1],V[1],V[0]}][{SW[0],H[1],H[0]}][4] = SW[3];
		colorData[{SW[1],V[1],V[0]}][{SW[0],H[1],H[0]}][5] = SW[2];
	end

endmodule
