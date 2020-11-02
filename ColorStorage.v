module ColorStorage(SW,KEY,HCS,VCS,R,G,B);
input [9:0] SW;
input [3:0] KEY;
input [2:0] HCS,VCS;
output R,G,B;
reg R,G,B;

reg [2:0] colorData [7:0][7:0];

always@(*)
begin
	R = colorData[VCS][HCS][0];
	G = colorData[VCS][HCS][1];
	B = colorData[VCS][HCS][2];
end

always@(negedge KEY[3])
begin
	colorData[{SW[5],SW[4],SW[3]}][{SW[2],SW[1],SW[0]}][0] = SW[9];
	colorData[{SW[5],SW[4],SW[3]}][{SW[2],SW[1],SW[0]}][1] = SW[8];
	colorData[{SW[5],SW[4],SW[3]}][{SW[2],SW[1],SW[0]}][2] = SW[7];
end

endmodule
